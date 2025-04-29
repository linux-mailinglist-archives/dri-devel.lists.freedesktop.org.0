Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0CAA396D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 23:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C623010E465;
	Tue, 29 Apr 2025 21:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="QAfHPnn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BAA10E457
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 21:33:36 +0000 (UTC)
Received: from [192.168.78.162] (254C2A1C.nat.pool.telekom.hu [37.76.42.28])
 by mail.mainlining.org (Postfix) with ESMTPSA id 66782BBEE7;
 Tue, 29 Apr 2025 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745962400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyQjnnKtWNV6dVo1tbtbfQFcXdhOOsl8d9bcGbYCDxQ=;
 b=QAfHPnn8sKcAJYZV1CRczCn5nprEVBq8sAaBW2swSnUP7B8UpH4BZut3b924Eg0TAv38BW
 pe3SgXb9dbxHknG7D9yOA8ixteGmrTRNPuNXb9LLq+wU6BoBNV9/YHhKwO7xUHanZnHzKT
 TIDoNsOu0Lfx9V3oVhSjbwAV9ddw3g6u0GVbQsy+7K6qgGXr+Sz+2c80De3Y3KeDuw+8bB
 8mvFwdoe+FSnVTQN87/eVlV/VrpmjxYUbl3ro1kqOgoTFmhujPpFl+wQ7Bd36aalCqKUH6
 X1xE6M+LbjAZl5O2toPseDz0lUc0rdfIeemZvHPjTgPv/sFLOPGqRCnsx7oAWA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Tue, 29 Apr 2025 23:33:15 +0200
Subject: [PATCH v2 2/2] drivers: gpu: drm: panel: Add BOE TD4320
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-lavender-panel-v2-2-fb467ff81bac@mainlining.org>
References: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
In-Reply-To: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962395; l=9691;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=miv7PWL+lAKW4KkI6YCIebW3/h4sTB2HsHXNy2iXw2M=;
 b=mrG7RAToUx+cK2iF5ZCGMasKqzb+Le3xGLc8F60W838uiQcPV3oU0vo1Aqv2ZxdsFs+A6AFUh
 3gxJ1yI02SNAFVHidCJy30YstbWxvJWlyNp4MPRwBOFbBHwtu5Hqhf1
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Add driver for BOE TD4320 DSI panel, used in Xiaomi Redmi Note 7
mobile phone.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/gpu/drm/panel/Kconfig            |   9 ++
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-boe-td4320.c | 247 +++++++++++++++++++++++++++++++
 3 files changed, 257 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7e9c60a626fbbabb954ed2a7e3d1ef5eee0679d6..639f4324db617a0a2a56debd75eeca7a50e60df6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -67,6 +67,15 @@ config DRM_PANEL_BOE_HIMAX8279D
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host and has a built-in LED backlight.
 
+config DRM_PANEL_BOE_TD4320
+	tristate "BOE TD4320 DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for BOE TD4320 1080x2340
+	  video mode panel found in Xiaomi Redmi Note 7 smartphones.
+
 config DRM_PANEL_BOE_TH101MB31UIG002_28A
 	tristate "Boe TH101MB31UIG002-28A panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 883974f0cba128e28f23e31512f8d30d59913b0e..5eec88e4ac3dea6a1cb357e27a32d2d14c64af9b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.
 obj-$(CONFIG_DRM_PANEL_AUO_A030JTN01) += panel-auo-a030jtn01.o
 obj-$(CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0) += panel-boe-bf060y8m-aj0.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
+obj-$(CONFIG_DRM_PANEL_BOE_TD4320) += panel-boe-td4320.o
 obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) += panel-boe-th101mb31ig002-28a.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) += panel-boe-tv101wum-ll2.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
diff --git a/drivers/gpu/drm/panel/panel-boe-td4320.c b/drivers/gpu/drm/panel/panel-boe-td4320.c
new file mode 100644
index 0000000000000000000000000000000000000000..b21a83f520d39491ccfeb0e6c49ee5a0d64523a3
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-boe-td4320.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Barnabas Czeman <barnabas.czeman@mainlining.org>
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct boe_td4320 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data boe_td4320_supplies[] = {
+	{ .supply = "iovcc" },
+	{ .supply = "vsn" },
+	{ .supply = "vsp" },
+};
+
+static inline struct boe_td4320 *to_boe_td4320(struct drm_panel *panel)
+{
+	return container_of(panel, struct boe_td4320, panel);
+}
+
+static void boe_td4320_reset(struct boe_td4320 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(30);
+}
+
+static int boe_td4320_on(struct boe_td4320 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb8,
+					 0x19, 0x55, 0x00, 0xbe, 0x00, 0x00,
+					 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9,
+					 0x4d, 0x55, 0x05, 0xe6, 0x00, 0x02,
+					 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba,
+					 0x9b, 0x5b, 0x07, 0xe6, 0x00, 0x13,
+					 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf9,
+					 0x44, 0x3f, 0x00, 0x8d, 0xbf);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xce,
+					 0x5d, 0x00, 0x0f, 0x1f, 0x2f, 0x3f,
+					 0x4f, 0x5f, 0x6f, 0x7f, 0x8f, 0x9f,
+					 0xaf, 0xbf, 0xcf, 0xdf, 0xef, 0xff,
+					 0x04, 0x00, 0x02, 0x02, 0x42, 0x01,
+					 0x69, 0x5a, 0x40, 0x40, 0x00, 0x00,
+					 0x04, 0xfa, 0x00);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00b8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int boe_td4320_off(struct boe_td4320 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int boe_td4320_prepare(struct drm_panel *panel)
+{
+	struct boe_td4320 *ctx = to_boe_td4320(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(boe_td4320_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	boe_td4320_reset(ctx);
+
+	ret = boe_td4320_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(boe_td4320_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int boe_td4320_unprepare(struct drm_panel *panel)
+{
+	struct boe_td4320 *ctx = to_boe_td4320(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = boe_td4320_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(boe_td4320_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode boe_td4320_mode = {
+	.clock = (1080 + 86 + 2 + 100) * (2340 + 4 + 4 + 60) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 86,
+	.hsync_end = 1080 + 86 + 2,
+	.htotal = 1080 + 86 + 2 + 100,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 4,
+	.vsync_end = 2340 + 4 + 4,
+	.vtotal = 2340 + 4 + 4 + 60,
+	.width_mm = 67,
+	.height_mm = 145,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int boe_td4320_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &boe_td4320_mode);
+}
+
+static const struct drm_panel_funcs boe_td4320_panel_funcs = {
+	.prepare = boe_td4320_prepare,
+	.unprepare = boe_td4320_unprepare,
+	.get_modes = boe_td4320_get_modes,
+};
+
+static int boe_td4320_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct boe_td4320 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(boe_td4320_supplies),
+					    boe_td4320_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &boe_td4320_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void boe_td4320_remove(struct mipi_dsi_device *dsi)
+{
+	struct boe_td4320 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id boe_td4320_of_match[] = {
+	{ .compatible = "boe,td4320" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, boe_td4320_of_match);
+
+static struct mipi_dsi_driver boe_td4320_driver = {
+	.probe = boe_td4320_probe,
+	.remove = boe_td4320_remove,
+	.driver = {
+		.name = "panel-boe-td4320",
+		.of_match_table = boe_td4320_of_match,
+	},
+};
+module_mipi_dsi_driver(boe_td4320_driver);
+
+MODULE_AUTHOR("Barnabas Czeman <barnabas.czeman@mainlining.org>");
+MODULE_DESCRIPTION("DRM driver for boe td4320 fhdplus video mode dsi panel");
+MODULE_LICENSE("GPL");

-- 
2.49.0

