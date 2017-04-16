---
layout: null
source: 'http://www.evagoras.com/2011/02/10/improving-an-xml-feed-display-through-css-and-xslt/'
breadcrumb: true
---
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" {{ page.stylesheetAttributes }}>
<xsl:output method="html" encoding="utf-8" />
<xsl:template match="{{ page.rootMatcher }}">
  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html &gt;</xsl:text>
  <html>
  <head>
    <xsl:text disable-output-escaping="yes"><![CDATA[
    {% include head %}
    ]]></xsl:text>
  </head>
  <body id="top-of-page">
    <xsl:text disable-output-escaping="yes"><![CDATA[
    {% include navigation %}
    {% include masthead %}
    <div class="row t20">
        <div class="columns">
            {% include alert warning=page.disclaimer classes="text-center" %}
        </div>
    </div>
    ]]></xsl:text>
    {{ content }}
    <xsl:text disable-output-escaping="yes"><![CDATA[
    {% include footer %}
    {% include footer-scripts %}
    ]]></xsl:text>
  </body>
  </html>
</xsl:template>
<xsl:template name="slugify">
  <xsl:param name="text" select="''" />
  <xsl:variable name="dodgyChars" select="' ,.#_-!?*:;=+|&amp;/\\'" />
  <xsl:variable name="replacementChar" select="'-----------------'" />
  <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  <xsl:variable name="lowercased"><xsl:value-of select="translate( $text, $uppercase, $lowercase )" /></xsl:variable>
  <xsl:variable name="escaped"><xsl:value-of select="translate( $lowercased, $dodgyChars, $replacementChar )" /></xsl:variable>
  <xsl:value-of select="$escaped" />
</xsl:template>
</xsl:stylesheet>
