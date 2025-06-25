Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA97AE7E9A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE66910E6B8;
	Wed, 25 Jun 2025 10:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="XqkP/tYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFDB10E6B8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:09:17 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 3B94320F5F;
 Wed, 25 Jun 2025 12:09:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKFRYzeoblTb; Wed, 25 Jun 2025 12:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750846154; bh=+30GUXQoPfqLszQoHYLnLFwUqlXo1eSjYeu1DKHbBjY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=XqkP/tYbWxhhhY9ngZeCvZjseKZjkKHblylDTXwuVKd8dYijl1WgmCdmg1eDIOSK9
 IyAYYSdvLtTGf0EM1X0oHBKOgr9SqbvR57kment2M/yqLUIABAeGy1craNvWPp+KVH
 RqhcUAC6eFzCE5WgVnwL4ejIrJq2MXe9uicP801ur75V0/f0S/lb1uNnLPqDtf6szT
 BIFdcDxwSjXM2L7nKZt5eF85PJzsybk2u0TM/vQJNCT0Kl3e23lGzy7JrJuMj7+zIb
 smwH5wt8xPRoIIBCuTjgCYOTygj8yjzz1E6/7HQtaNQf9j9+R5lckeBKRBZUTIrR3u
 wvJqFl9l8rqww==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 25 Jun 2025 15:38:45 +0530
Subject: [PATCH v2 2/2] drm: panel: add support for Synaptics TDDI series
 DSI panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-panel-synaptics-tddi-v2-2-7a62ab1d13c7@disroot.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
In-Reply-To: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750846137; l=10867;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=+30GUXQoPfqLszQoHYLnLFwUqlXo1eSjYeu1DKHbBjY=;
 b=DbwsnNQHG9h81sp0LBCWG7MlXD+rztwkVno/s7f39gfaq6zEnDLEYCK80vZjMxb/QiUvJuB5+
 bHlo4SjpGvwDLhAju3cGnqfqgx/UvCJaRZDLrVwiGEiVGieW7PNikMf
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
 drivers/gpu/drm/panel/Kconfig                |  11 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c | 288 +++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d5aa1c95c6a45b2fea9b1d7a9e8a39fe617b860c..ad906d96ac5cbbbd6846d6c6a9043033660daf54 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1011,6 +1011,17 @@ config DRM_PANEL_SYNAPTICS_R63353
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
index 73a39bc726045f3ce52fdeef8c0ec762a4a378c7..3cde8f27e7e6c1d12b08fd2f9e6252dd121a6b38 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
+obj-$(CONFIG_DRM_PANEL_SYNAPTICS_TDDI) += panel-synaptics-tddi.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
diff --git a/drivers/gpu/drm/panel/panel-synaptics-tddi.c b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
new file mode 100644
index 0000000000000000000000000000000000000000..07a07b4fdc7347c0603bc7954871fab5cf692738
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
@@ -0,0 +1,288 @@
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
+	struct regulator_bulk_data supplies[3];
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *backlight_gpio;
+	u32 bus_flags;
+	u32 width;
+	u32 height;
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
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
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
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
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
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ctx->mode);
+	if (!mode)
+		return -ENOMEM;
+
+	mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+	drm_mode_set_name(mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags = ctx->bus_flags;
+
+	return 1;
+}
+
+static const struct backlight_ops tddi_bl_ops = {
+	.update_status = tddi_update_status,
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
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->data = of_device_get_match_data(dev);
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->supplies[0].supply = "vio";
+	ctx->supplies[1].supply = "vsn";
+	ctx->supplies[2].supply = "vsp";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx->backlight_gpio = devm_gpiod_get_optional(dev, "backlight", GPIOD_ASIS);
+	if (IS_ERR(ctx->backlight_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->backlight_gpio),
+				     "Failed to get backlight-gpios\n");
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ret = of_get_drm_panel_display_mode(dev->of_node, &ctx->mode,
+					    &ctx->bus_flags);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get panel timings\n");
+
+	ctx->backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
+							ctx, &tddi_bl_ops, NULL);
+	if (IS_ERR(ctx->backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->backlight),
+				     "Failed to register backlight device");
+
+	ctx->backlight->props.type = BACKLIGHT_PLATFORM;
+	ctx->backlight->props.brightness = 255;
+	ctx->backlight->props.max_brightness = 255;
+
+	dsi->lanes = ctx->data->lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_VIDEO_NO_HFP;
+
+	drm_panel_init(&ctx->panel, dev, &tddi_drm_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
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
2.49.0

