*** Settings ***
Documentation     This test assumes that the infra and debug stack is running.Since this is a SIDT template we believe the debug setup ist part of the provided value hence testing the debug frontend is part of the job
Library           SeleniumLibrary

*** Variables ***
${SERVICE_NAME1}    development-overview
${SERVICE_PORT1}    3000

*** Test Cases ***
Test Debug Setup Index
    [Documentation]    testing develop index page
    [Tags]    debug    non-critical
    Open Browser    http://${SERVICE_NAME1}:${SERVICE_PORT1}    Chrome
    Wait Until Page Contains    Dev Swagger UI
    Wait Until Page Contains    Ufp Swagger Proxy
    Wait Until Page Contains    Wiremock Petstore
    Wait Until Page Contains    Swagger Petstore
    Wait Until Page Contains    Test Report
    Capture Page Screenshot    ScreenshotDebugEntryPoint.png
    Close Browser
