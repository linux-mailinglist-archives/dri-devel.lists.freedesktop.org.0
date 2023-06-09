Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C2E729D9A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B5B10E6BF;
	Fri,  9 Jun 2023 15:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCB810E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:00:04 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686322803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0Ol7r2bSGZjgU05xeiKYdfnfAnDr0eHIQSuJwPZLwg=;
 b=LN37CM19UQxIT8tPsPiMiTQEyBOyMqRAU9tI/6oDGyfmTztCyPwP0b8xsyvHZg1k/T7gXL
 8xoh6y/xmq3W+S1p7gRJg8AIRC7yKT1DyOXFLjmjL+qB4rEVWoBgSguZeO1c/yxOkG+nK4
 lBOpqiaQ3znrEm+zTYrCdHpqMeKag2X55vrCCG+TBPAjOi61249QyXGmrT1X+ManGYYaP/
 L6YJSv4AuCJWL9pKiqdHYm28aNMZesPmcKAamMYKK92eq4iaBdkoT8KesA/gcmd/BsBnbf
 aL7IVUHs/so4dvyhRCxNRrp+z7z1wnK4a94KCgRqSn8uRybzM8wcuw2BD9Wteg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E621240004;
 Fri,  9 Jun 2023 15:00:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/panel: sitronix-st7789v: Add EDT ET028013DMA panel
 support
Date: Fri,  9 Jun 2023 16:59:50 +0200
Message-Id: <20230609145951.853533-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609145951.853533-1-miquel.raynal@bootlin.com>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel from Emerging Display Technologies Corporation features an
ST7789V2 panel inside which is almost identical to what the Sitronix
panel driver supports.

In practice, the module physical size is specific, and experiments show
that the display will malfunction if any of the following situation
occurs:
* Pixel clock is above 3MHz
* Pixel clock is not inverted
I could not properly identify the reasons behind these failures, scope
captures show valid input signals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 212bccc31804..7de192a3a8aa 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -30,7 +30,8 @@
 #define ST7789V_RGBCTRL_RCM(n)			(((n) & 3) << 5)
 #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
 #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
-#define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
+#define ST7789V_RGBCTRL_PCLK_FALLING		BIT(1)
+#define ST7789V_RGBCTRL_PCLK_RISING		0
 #define ST7789V_RGBCTRL_VBP(n)			((n) & 0x7f)
 #define ST7789V_RGBCTRL_HBP(n)			((n) & 0x1f)
 
@@ -117,6 +118,7 @@ struct st7789v_panel_info {
 	u16 width_mm;
 	u16 height_mm;
 	u32 bus_format;
+	u32 bus_flags;
 };
 
 struct st7789v {
@@ -175,6 +177,18 @@ static const struct drm_display_mode default_mode = {
 	.vtotal = 320 + 8 + 4 + 4,
 };
 
+static const struct drm_display_mode slow_mode = {
+	.clock = 3000,
+	.hdisplay = 240,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
+	.vdisplay = 320,
+	.vsync_start = 320 + 8,
+	.vsync_end = 320 + 8 + 4,
+	.vtotal = 320 + 8 + 4 + 4,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -197,6 +211,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
 
 	connector->display_info.width_mm = panel_info->width_mm;
 	connector->display_info.height_mm = panel_info->height_mm;
+	connector->display_info.bus_flags = panel_info->bus_flags;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &panel_info->bus_format, 1);
 
@@ -206,8 +221,13 @@ static int st7789v_get_modes(struct drm_panel *panel,
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
+	const struct st7789v_panel_info *panel_info = ctx->panel_info;
+	u8 pck = ST7789V_RGBCTRL_PCLK_FALLING;
 	int ret;
 
+	if (panel_info->bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		pck = ST7789V_RGBCTRL_PCLK_RISING;
+
 	ret = regulator_enable(ctx->power);
 	if (ret)
 		return ret;
@@ -321,7 +341,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 					     ST7789V_RGBCTRL_RCM(2) |
 					     ST7789V_RGBCTRL_VSYNC_HIGH |
 					     ST7789V_RGBCTRL_HSYNC_HIGH |
-					     ST7789V_RGBCTRL_PCLK_HIGH));
+					     pck));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
 
@@ -422,14 +442,24 @@ static const struct st7789v_panel_info st7789v_info = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct st7789v_panel_info et028013dma_info = {
+	.display_mode = &slow_mode,
+	.width_mm = 43,
+	.height_mm = 58,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
 static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v", .data = &st7789v_info },
+	{ .compatible = "edt,et028013dma", .data = &et028013dma_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
 
 static const struct spi_device_id st7789v_ids[] = {
 	{ "st7789v", },
+	{ "et028013dma", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_ids);
-- 
2.34.1

