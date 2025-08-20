Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C9AB2DF33
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAE910E75D;
	Wed, 20 Aug 2025 14:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="RBFhHt9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD03210E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:25:57 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B22EA22C2E;
 Wed, 20 Aug 2025 16:25:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkRV2ZD435HD; Wed, 20 Aug 2025 16:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1755699955; bh=niewyNFO3B7i2JcXH68hJMKd1s1pwKuphRHlg0MHxM0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=RBFhHt9LhnhIRW4Oqh0GLpC/nLPqLyNOAwxxLfsuzHgnvY6b1RMBgS03SGAP3djEJ
 y5Tii8IZdobk4qMGGfNpnJfEvkOJmnHBcvCoPMn2uSkdh7Ry7Jdlkrl0pWuBjMr9Ms
 mTkKYFNJov9Cgp1lOHdxu+aK2ZBhCkPmb7GgKzE9/xQLxrDeep2QLt1asmUAVPZZjZ
 34CHeZZsfs9Q+r9o75Wn8sAPgUoUXAxn4f5Ols/ibEGkpia0WZcw19QPZzXMrDIoMc
 IcXt28kXBWOV2JGTZMamC0eJjLFB6rlrS0AfoRJjaM1qv6Q8NwhrUZGOtywsb4cchw
 TW4Kn1f+VE53A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 20 Aug 2025 19:54:27 +0530
Subject: [PATCH v5 2/2] drm: panel: add support for Synaptics TDDI series
 DSI panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-panel-synaptics-tddi-v5-2-d4e3fd4987c6@disroot.org>
References: <20250820-panel-synaptics-tddi-v5-0-d4e3fd4987c6@disroot.org>
In-Reply-To: <20250820-panel-synaptics-tddi-v5-0-d4e3fd4987c6@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755699927; l=10512;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=niewyNFO3B7i2JcXH68hJMKd1s1pwKuphRHlg0MHxM0=;
 b=5ciuu99MyoEpQpX8ubNvqPo1G+4jA3Ey1P/MLQB6PjurIox11CQXHrWubr60wN0tU55dA6Y+U
 YnZE6Kc0TMRBoGV5uI5vK0M7Arq38F5HUaozW1v7G8JHZUTskN1ysTr
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Synaptics TDDI (Touch/Display Integration) panels utilize a single chip
for display and touch controllers. Implement a simple device driver for
such panels, along with its built-in LED backlight controller, and add
support for TD4101 and TD4300 panels in the driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/panel/Kconfig                |  11 ++
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c | 276 +++++++++++++++++++++++++++
 3 files changed, 288 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b2ec66e5d0eddae26b3368e4cb2cb..98708979ab45281628620bbe803fe8b597eb812d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1045,6 +1045,17 @@ config DRM_PANEL_SYNAPTICS_R63353
 	  Say Y if you want to enable support for panels based on the
 	  Synaptics R63353 controller.
 
+config DRM_PANEL_SYNAPTICS_TDDI
+	tristate "Synaptics TDDI display panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for the Synaptics TDDI display
+	  panels. There are multiple MIPI DSI panels manufactured under the TDDI
+	  namesake, with varying resolutions and data lanes. They also have a
+	  built-in LED backlight and a touch controller.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3615a761b44f9de0b4a653be157d8e0bcbc8f6b7..2535e1c9df76451d1c66d7d211ac9bfbf18dc80e 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
+obj-$(CONFIG_DRM_PANEL_SYNAPTICS_TDDI) += panel-synaptics-tddi.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
diff --git a/drivers/gpu/drm/panel/panel-synaptics-tddi.c b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
new file mode 100644
index 0000000000000000000000000000000000000000..a4b3cbdebb6ca4062c02c6e7ac184f3ec245926a
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synaptics TDDI display panel driver.
+ *
+ * Copyright (C) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct tddi_panel_data {
+	u8 lanes;
+	/* wait timings for panel enable */
+	u8 delay_ms_sleep_exit;
+	u8 delay_ms_display_on;
+	/* wait timings for panel disable */
+	u8 delay_ms_display_off;
+	u8 delay_ms_sleep_enter;
+};
+
+struct tddi_ctx {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_display_mode mode;
+	struct backlight_device *backlight;
+	const struct tddi_panel_data *data;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *backlight_gpio;
+};
+
+static const struct regulator_bulk_data tddi_supplies[] = {
+	{ .supply = "vio" },
+	{ .supply = "vsn" },
+	{ .supply = "vsp" },
+};
+
+static inline struct tddi_ctx *to_tddi_ctx(struct drm_panel *panel)
+{
+	return container_of(panel, struct tddi_ctx, panel);
+}
+
+static int tddi_update_status(struct backlight_device *backlight)
+{
+	struct tddi_ctx *ctx = bl_get_data(backlight);
+	struct mipi_dsi_multi_context dsi = { .dsi = ctx->dsi };
+	u8 brightness = backlight_get_brightness(backlight);
+
+	if (!ctx->panel.enabled)
+		return 0;
+
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi, brightness);
+
+	return dsi.accum_err;
+}
+
+static int tddi_prepare(struct drm_panel *panel)
+{
+	struct tddi_ctx *ctx = to_tddi_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+
+	gpiod_set_value_cansleep(ctx->backlight_gpio, 0);
+	usleep_range(5000, 6000);
+
+	return 0;
+}
+
+static int tddi_unprepare(struct drm_panel *panel)
+{
+	struct tddi_ctx *ctx = to_tddi_ctx(panel);
+
+	gpiod_set_value_cansleep(ctx->backlight_gpio, 1);
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+
+	regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static int tddi_enable(struct drm_panel *panel)
+{
+	struct tddi_ctx *ctx = to_tddi_ctx(panel);
+	struct mipi_dsi_multi_context dsi = { .dsi = ctx->dsi };
+	u8 brightness = ctx->backlight->props.brightness;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x0c);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi);
+	mipi_dsi_msleep(&dsi, ctx->data->delay_ms_sleep_exit);
+
+	/* sync the panel with the backlight's brightness level */
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi, brightness);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi);
+	mipi_dsi_msleep(&dsi, ctx->data->delay_ms_display_on);
+
+	return dsi.accum_err;
+};
+
+static int tddi_disable(struct drm_panel *panel)
+{
+	struct tddi_ctx *ctx = to_tddi_ctx(panel);
+	struct mipi_dsi_multi_context dsi = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi);
+	mipi_dsi_msleep(&dsi, ctx->data->delay_ms_display_off);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi);
+	mipi_dsi_msleep(&dsi, ctx->data->delay_ms_sleep_enter);
+
+	return dsi.accum_err;
+}
+
+static int tddi_get_modes(struct drm_panel *panel,
+			  struct drm_connector *connector)
+{
+	struct tddi_ctx *ctx = to_tddi_ctx(panel);
+
+	return drm_connector_helper_get_modes_fixed(connector, &ctx->mode);
+}
+
+static const struct backlight_ops tddi_bl_ops = {
+	.update_status = tddi_update_status,
+};
+
+static const struct backlight_properties tddi_bl_props = {
+	.type = BACKLIGHT_PLATFORM,
+	.brightness = 255,
+	.max_brightness = 255,
+};
+
+static const struct drm_panel_funcs tddi_drm_panel_funcs = {
+	.prepare = tddi_prepare,
+	.unprepare = tddi_unprepare,
+	.enable = tddi_enable,
+	.disable = tddi_disable,
+	.get_modes = tddi_get_modes,
+};
+
+static int tddi_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct tddi_ctx *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct tddi_ctx, panel,
+				   &tddi_drm_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->data = of_device_get_match_data(dev);
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_supplies),
+					    tddi_supplies, &ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ctx->backlight_gpio = devm_gpiod_get_optional(dev, "backlight", GPIOD_ASIS);
+	if (IS_ERR(ctx->backlight_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->backlight_gpio),
+				     "failed to get backlight-gpios\n");
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "failed to get reset-gpios\n");
+
+	ret = of_get_drm_panel_display_mode(dev->of_node, &ctx->mode, NULL);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get panel timings\n");
+
+	ctx->backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
+							ctx, &tddi_bl_ops,
+							&tddi_bl_props);
+	if (IS_ERR(ctx->backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->backlight),
+				     "failed to register backlight device");
+
+	dsi->lanes = ctx->data->lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_VIDEO_NO_HFP;
+
+	ctx->panel.prepare_prev_first = true;
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void tddi_remove(struct mipi_dsi_device *dsi)
+{
+	struct tddi_ctx *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct tddi_panel_data td4101_panel_data = {
+	.lanes = 2,
+	/* wait timings for panel enable */
+	.delay_ms_sleep_exit = 100,
+	.delay_ms_display_on = 0,
+	/* wait timings for panel disable */
+	.delay_ms_display_off = 20,
+	.delay_ms_sleep_enter = 90,
+};
+
+static const struct tddi_panel_data td4300_panel_data = {
+	.lanes = 4,
+	/* wait timings for panel enable */
+	.delay_ms_sleep_exit = 100,
+	.delay_ms_display_on = 0,
+	/* wait timings for panel disable */
+	.delay_ms_display_off = 0,
+	.delay_ms_sleep_enter = 0,
+};
+
+static const struct of_device_id tddi_of_device_id[] = {
+	{
+		.compatible = "syna,td4101-panel",
+		.data = &td4101_panel_data,
+	}, {
+		.compatible = "syna,td4300-panel",
+		.data = &td4300_panel_data,
+	}, { }
+};
+MODULE_DEVICE_TABLE(of, tddi_of_device_id);
+
+static struct mipi_dsi_driver tddi_dsi_driver = {
+	.probe = tddi_probe,
+	.remove = tddi_remove,
+	.driver = {
+		.name = "panel-synaptics-tddi",
+		.of_match_table = tddi_of_device_id,
+	},
+};
+module_mipi_dsi_driver(tddi_dsi_driver);
+
+MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
+MODULE_DESCRIPTION("Synaptics TDDI Display Panel Driver");
+MODULE_LICENSE("GPL");

-- 
2.50.0

