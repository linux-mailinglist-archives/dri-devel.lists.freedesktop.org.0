Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4971F6BF644
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 00:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DADE10E439;
	Fri, 17 Mar 2023 23:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8AA10E285
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 23:24:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA5A060CA0;
 Fri, 17 Mar 2023 23:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851AAC433D2;
 Fri, 17 Mar 2023 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679095442;
 bh=l3gCJjRiiH8i75zav01jlsVXcavJWkL4a1sUaY2PyTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ch3C93OtIZhkM53WAD2mn+6i0iTaclyjwpkXOL9Hl3IIp8YtrEwCNTHcZFGQsaJLl
 lFSgxWierJ7EyYTUAkBJT+LwPKl4LiLIX4+SmT372Z6aF3hEz+jspgFg3hna1CQR8j
 4lfa+yJrdnE2U+uUx/uxdWJuwUTA04kGLiecxgZiKUJbfXqssLLv+dqPk0rVkiasF5
 Nd/I6t0SfXRBuUk7hFC1AR7rQOrkoajx+yV7e/TqyzxpC4udeXkfSpnHswxHG4O/2h
 V9SB+TMImB3XlEowIBAGTF7w1LfEl5NA+4Oo14MYipLmJZhKThWi/RWb1jmTzzFP36
 PI8wOFobnjXtg==
Received: by mercury (Postfix, from userid 1000)
 id E3D0E1062107; Sat, 18 Mar 2023 00:23:57 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv1 6/7] drm/panel: sitronix-st7789v: prepare for additional
 panels
Date: Sat, 18 Mar 2023 00:23:54 +0100
Message-Id: <20230317232355.1554980-7-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317232355.1554980-1-sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the driver for additional panels with different
initialization.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 110 +++++++++++-------
 1 file changed, 67 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 1d43b8cc1647..a62a2f5737e4 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -108,8 +108,16 @@
 			return val;		\
 	} while (0)
 
+struct st7789v;
+
+struct st7789_panel_info {
+	const struct drm_display_mode *mode;
+	int (*init_sequence)(struct st7789v *ctx);
+};
+
 struct st7789v {
 	struct drm_panel panel;
+	const struct st7789_panel_info *info;
 	struct spi_device *spi;
 	struct gpio_desc *reset;
 	struct regulator *power;
@@ -162,51 +170,13 @@ static const struct drm_display_mode default_mode = {
 	.vsync_start = 320 + 8,
 	.vsync_end = 320 + 8 + 4,
 	.vtotal = 320 + 8 + 4 + 4,
+	.width_mm = 61,
+	.height_mm = 103,
 };
 
-static int st7789v_get_modes(struct drm_panel *panel,
-			     struct drm_connector *connector)
-{
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
-	if (!mode) {
-		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
-			default_mode.hdisplay, default_mode.vdisplay,
-			drm_mode_vrefresh(&default_mode));
-		return -ENOMEM;
-	}
-
-	drm_mode_set_name(mode);
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
-
-	connector->display_info.width_mm = 61;
-	connector->display_info.height_mm = 103;
-
-	return 1;
-}
-
-static int st7789v_prepare(struct drm_panel *panel)
-{
-	struct st7789v *ctx = panel_to_st7789v(panel);
+static int init_sequence_default(struct st7789v *ctx) {
 	int ret;
 
-	ret = regulator_enable(ctx->power);
-	if (ret)
-		return ret;
-
-	gpiod_set_value(ctx->reset, 1);
-	msleep(30);
-	gpiod_set_value(ctx->reset, 0);
-	msleep(120);
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE));
-
-	/* We need to wait 120ms after a sleep out command */
-	msleep(120);
-
 	ST7789V_TEST(ret, st7789v_write_command(ctx,
 						MIPI_DCS_SET_ADDRESS_MODE));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
@@ -313,6 +283,58 @@ static int st7789v_prepare(struct drm_panel *panel)
 	return 0;
 }
 
+struct st7789_panel_info default_panel = {
+	.mode = &default_mode,
+	.init_sequence = init_sequence_default,
+};
+
+static int st7789v_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	struct st7789v *ctx = panel_to_st7789v(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, ctx->info->mode);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			ctx->info->mode->hdisplay, ctx->info->mode->vdisplay,
+			drm_mode_vrefresh(ctx->info->mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = ctx->info->mode->width_mm;
+	connector->display_info.height_mm = ctx->info->mode->height_mm;
+
+	return 1;
+}
+
+static int st7789v_prepare(struct drm_panel *panel)
+{
+	struct st7789v *ctx = panel_to_st7789v(panel);
+	int ret;
+
+	ret = regulator_enable(ctx->power);
+	if (ret)
+		return ret;
+
+	gpiod_set_value(ctx->reset, 1);
+	msleep(30);
+	gpiod_set_value(ctx->reset, 0);
+	msleep(120);
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE));
+
+	/* We need to wait 120ms after a sleep out command */
+	msleep(120);
+
+	return ctx->info->init_sequence(ctx);
+}
+
 static int st7789v_enable(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
@@ -362,6 +384,8 @@ static int st7789v_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
+	ctx->info = device_get_match_data(&spi->dev);
+
 	drm_panel_init(&ctx->panel, &spi->dev, &st7789v_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
@@ -392,13 +416,13 @@ static void st7789v_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id st7789v_spi_id[] = {
-	{ "st7789v" },
+	{ "st7789v", (unsigned long) &default_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
 
 static const struct of_device_id st7789v_of_match[] = {
-	{ .compatible = "sitronix,st7789v" },
+	{ .compatible = "sitronix,st7789v", .data = &default_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
-- 
2.39.2

