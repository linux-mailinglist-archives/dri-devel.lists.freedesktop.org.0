Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A1855D52
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAC510E440;
	Thu, 15 Feb 2024 09:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5B010E43D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:05:23 +0000 (UTC)
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1raXgD-0002M4-K8; Thu, 15 Feb 2024 10:05:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quentin.schulz@theobroma-systems.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/3] drm/panel: ltk500hd1829: make room for more similar panels
Date: Thu, 15 Feb 2024 10:05:13 +0100
Message-Id: <20240215090515.3513817-2-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215090515.3513817-1-heiko@sntech.de>
References: <20240215090515.3513817-1-heiko@sntech.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

There exist more dsi-panels from Leadtek sharing supplies and timings
with only the panel-mode and init commands differing.

So make room in the driver to also keep variants here instead of
requiring additional drivers per panel.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 73 ++++++++++++-------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index 39e408c9f762f..42f4e2584af18 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
@@ -21,25 +22,32 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+struct ltk500hd1829_cmd {
+	char cmd;
+	char data;
+};
+
+struct ltk500hd1829_desc {
+	const struct drm_display_mode *mode;
+	const struct ltk500hd1829_cmd *init;
+	unsigned int num_init;
+};
+
 struct ltk500hd1829 {
 	struct device *dev;
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
+	const struct ltk500hd1829_desc *panel_desc;
 	bool prepared;
 };
 
-struct ltk500hd1829_cmd {
-	char cmd;
-	char data;
-};
-
 /*
  * There is no description in the Reference Manual about these commands.
  * We received them from the vendor, so just use them as is.
  */
-static const struct ltk500hd1829_cmd init_code[] = {
+static const struct ltk500hd1829_cmd ltk500hd1829_init[] = {
 	{ 0xE0, 0x00 },
 	{ 0xE1, 0x93 },
 	{ 0xE2, 0x65 },
@@ -260,6 +268,26 @@ static const struct ltk500hd1829_cmd init_code[] = {
 	{ 0x35, 0x00 },
 };
 
+static const struct drm_display_mode ltk500hd1829_mode = {
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 50,
+	.hsync_end	= 720 + 50 + 50,
+	.htotal		= 720 + 50 + 50 + 50,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 30,
+	.vsync_end	= 1280 + 30 + 4,
+	.vtotal		= 1280 + 30 + 4 + 12,
+	.clock		= 69217,
+	.width_mm	= 62,
+	.height_mm	= 110,
+};
+
+static const struct ltk500hd1829_desc ltk500hd1829_data = {
+	.mode = &ltk500hd1829_mode,
+	.init = ltk500hd1829_init,
+	.num_init = ARRAY_SIZE(ltk500hd1829_init),
+};
+
 static inline
 struct ltk500hd1829 *panel_to_ltk500hd1829(struct drm_panel *panel)
 {
@@ -324,8 +352,8 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	/* tRT: >= 5ms */
 	usleep_range(5000, 6000);
 
-	for (i = 0; i < ARRAY_SIZE(init_code); i++) {
-		ret = mipi_dsi_generic_write(dsi, &init_code[i],
+	for (i = 0; i < ctx->panel_desc->num_init; i++) {
+		ret = mipi_dsi_generic_write(dsi, &ctx->panel_desc->init[i],
 					     sizeof(struct ltk500hd1829_cmd));
 		if (ret < 0) {
 			dev_err(panel->dev, "failed to write init cmds: %d\n", ret);
@@ -359,31 +387,17 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode default_mode = {
-	.hdisplay	= 720,
-	.hsync_start	= 720 + 50,
-	.hsync_end	= 720 + 50 + 50,
-	.htotal		= 720 + 50 + 50 + 50,
-	.vdisplay	= 1280,
-	.vsync_start	= 1280 + 30,
-	.vsync_end	= 1280 + 30 + 4,
-	.vtotal		= 1280 + 30 + 4 + 12,
-	.clock		= 69217,
-	.width_mm	= 62,
-	.height_mm	= 110,
-};
-
 static int ltk500hd1829_get_modes(struct drm_panel *panel,
 				  struct drm_connector *connector)
 {
 	struct ltk500hd1829 *ctx = panel_to_ltk500hd1829(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, ctx->panel_desc->mode);
 	if (!mode) {
 		dev_err(ctx->dev, "failed to add mode %ux%u@%u\n",
-			default_mode.hdisplay, default_mode.vdisplay,
-			drm_mode_vrefresh(&default_mode));
+			ctx->panel_desc->mode->hdisplay, ctx->panel_desc->mode->vdisplay,
+			drm_mode_vrefresh(ctx->panel_desc->mode));
 		return -ENOMEM;
 	}
 
@@ -413,6 +427,10 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->panel_desc = of_device_get_match_data(dev);
+	if (!ctx->panel_desc)
+		return -EINVAL;
+
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
 		dev_err(dev, "cannot get reset gpio\n");
@@ -492,7 +510,10 @@ static void ltk500hd1829_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id ltk500hd1829_of_match[] = {
-	{ .compatible = "leadtek,ltk500hd1829", },
+	{
+		.compatible = "leadtek,ltk500hd1829",
+		.data = &ltk500hd1829_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ltk500hd1829_of_match);
-- 
2.39.2

