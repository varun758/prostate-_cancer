#Libraries:
library(shiny)
library(shinydashboard)
library(dplyr)
library(shinycssloaders)
library(shinythemes)
library(readr)

library(readr)
pcancer <- read_csv("pcancer.csv")


str(pcancer)
attach(pcancer)
# Checked missing data points

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      helpText(),
      selectInput('x', 'Building a regression model of Prostate cancer prediction.',choices = names(pcancer)[-1])
    ),
    mainPanel(plotOutput('regplot'))
  )
)



server <- function(input,output){
  regformula <- reactive({as.formula(paste('psa ~',input$x))
  })
  
  output$regplot <- renderPlot({par(mar=c(4,4,.1,.1))
    
    plot(regformula(),data = pcancer,pch=19)
  })
}

shinyApp(ui=ui,server=server)
























