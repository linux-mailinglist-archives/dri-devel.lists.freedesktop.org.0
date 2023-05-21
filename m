Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398B70B0CA
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07B110E206;
	Sun, 21 May 2023 21:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C570010E202
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:23:19 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9316D3F36C;
 Sun, 21 May 2023 23:23:17 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 21 May 2023 23:23:12 +0200
Subject: [PATCH RFC 10/10] drm/panel/sony-griffin-samsung: Add panel driver
 for Sony Xperia 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230521-drm-panels-sony-v1-10-541c341d6bee@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
In-Reply-To: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Caleb Connolly <caleb@connolly.tech>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sony Xperia 1 (codename kumano griffin) features an unnamed 4k OLED
DSI cmd mode panel produced by Samsung.  It can be driven in a
1644x3840@60 or 1096x2560@60 mode, and always has Display Stream
Compression 1.1 enabled.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-sony-griffin-samsung.c | 410 +++++++++++++++++++++
 3 files changed, 424 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8e2668153bce2..888b5152ca55e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -743,6 +743,19 @@ config DRM_PANEL_SONY_AKATSUKI_LGD
 
 	  This panel uses Display Stream Compression 1.1.
 
+config DRM_PANEL_SONY_GRIFFIN_SAMSUNG
+	tristate "Sony Xperia 1 4k OLED panel"
+	depends on GPIOLIB && OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Sony Xperia 1 4k
+	  6.5" OLED DSI cmd mode panel produced by Samsung.
+
+	  This panel uses Display Stream Compression 1.1.
+
+	  The panel features a 1644x3840@60 and 1096x2560@60 mode.
+
 config DRM_PANEL_SONY_TD4353_JDI
 	tristate "Sony TD4353 JDI panel"
 	depends on GPIOLIB && OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 52dcd82e33120..734d32987330d 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_AKATSUKI_LGD) += panel-sony-akatsuki-lgd.o
+obj-$(CONFIG_DRM_PANEL_SONY_GRIFFIN_SAMSUNG) += panel-sony-griffin-samsung.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
diff --git a/drivers/gpu/drm/panel/panel-sony-griffin-samsung.c b/drivers/gpu/drm/panel/panel-sony-griffin-samsung.c
new file mode 100644
index 0000000000000..755cec7f9119b
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-sony-griffin-samsung.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+
+static const bool enable_4k = true;
+
+struct sony_griffin_samsung {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator *vddio, *vci;
+	bool prepared;
+};
+
+static inline
+struct sony_griffin_samsung *to_sony_griffin_samsung(struct drm_panel *panel)
+{
+	return container_of(panel, struct sony_griffin_samsung, panel);
+}
+
+static void sony_griffin_samsung_reset(struct sony_griffin_samsung *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int sony_griffin_samsung_on(struct sony_griffin_samsung *ctx)
+{
+	const u16 hdisplay = enable_4k ? 1644 : 1096;
+	const u16 vdisplay = enable_4k ? 3840 : 2560;
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	usleep_range(10000, 11000);
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	/* Enable backlight control */
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
+	msleep(110);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xe2, enable_4k ? 0 : 1);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_column_address(dsi, 0, hdisplay - 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set column address: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0, vdisplay - 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set page address: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xc5, 0x2e, 0x21);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to turn display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sony_griffin_samsung_off(struct sony_griffin_samsung *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to turn display off: %d\n", ret);
+		return ret;
+	}
+	msleep(20);
+
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
+	usleep_range(17000, 18000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(100);
+
+	return 0;
+}
+
+static int sony_griffin_samsung_prepare(struct drm_panel *panel)
+{
+	struct sony_griffin_samsung *ctx = to_sony_griffin_samsung(panel);
+	struct drm_dsc_picture_parameter_set pps;
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_enable(ctx->vddio);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable vddio regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(ctx->vci);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable vci regulator: %d\n", ret);
+		regulator_disable(ctx->vddio);
+		return ret;
+	}
+
+	sony_griffin_samsung_reset(ctx);
+
+	ret = sony_griffin_samsung_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		goto fail;
+	}
+
+	if (ctx->dsi->dsc) {
+		drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
+
+		ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
+		if (ret < 0) {
+			dev_err(dev, "failed to transmit PPS: %d\n", ret);
+			goto fail;
+		}
+
+		ret = mipi_dsi_compression_mode(ctx->dsi, true);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable compression mode: %d\n", ret);
+			goto fail;
+		}
+
+		msleep(28);
+	}
+
+	ctx->prepared = true;
+	return 0;
+
+fail:
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->vci);
+	regulator_disable(ctx->vddio);
+	return ret;
+}
+
+static int sony_griffin_samsung_unprepare(struct drm_panel *panel)
+{
+	struct sony_griffin_samsung *ctx = to_sony_griffin_samsung(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = sony_griffin_samsung_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->vddio);
+	regulator_disable(ctx->vci);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode sony_griffin_samsung_2_5k_mode = {
+	.clock = (1096 + 56 + 8 + 8) * (2560 + 8 + 8 + 8) * 60 / 1000,
+	.hdisplay = 1096,
+	.hsync_start = 1096 + 56,
+	.hsync_end = 1096 + 56 + 8,
+	.htotal = 1096 + 56 + 8 + 8,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 8,
+	.vsync_end = 2560 + 8 + 8,
+	.vtotal = 2560 + 8 + 8 + 8,
+	.width_mm = 65,
+	.height_mm = 152,
+};
+
+static const struct drm_display_mode sony_griffin_samsung_4k_mode = {
+	.clock = (1644 + 60 + 8 + 8) * (3840 + 8 + 8 + 8) * 60 / 1000,
+	.hdisplay = 1644,
+	.hsync_start = 1644 + 60,
+	.hsync_end = 1644 + 60 + 8,
+	.htotal = 1644 + 60 + 8 + 8,
+	.vdisplay = 3840,
+	.vsync_start = 3840 + 8,
+	.vsync_end = 3840 + 8 + 8,
+	.vtotal = 3840 + 8 + 8 + 8,
+	.width_mm = 65,
+	.height_mm = 152,
+};
+
+static int sony_griffin_samsung_get_modes(struct drm_panel *panel,
+						  struct drm_connector *connector)
+{
+	if (enable_4k)
+		return drm_connector_helper_get_modes_fixed(connector,
+							    &sony_griffin_samsung_4k_mode);
+	else
+		return drm_connector_helper_get_modes_fixed(connector,
+							    &sony_griffin_samsung_2_5k_mode);
+}
+
+static const struct drm_panel_funcs sony_griffin_samsung_panel_funcs = {
+	.prepare = sony_griffin_samsung_prepare,
+	.unprepare = sony_griffin_samsung_unprepare,
+	.get_modes = sony_griffin_samsung_get_modes,
+};
+
+static int sony_griffin_samsung_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return ret;
+}
+
+static int sony_griffin_samsung_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	if (ret < 0)
+		return ret;
+
+	return brightness;
+}
+
+static const struct backlight_ops sony_griffin_samsung_bl_ops = {
+	.update_status = sony_griffin_samsung_bl_update_status,
+	.get_brightness = sony_griffin_samsung_bl_get_brightness,
+};
+
+static struct backlight_device *
+sony_griffin_samsung_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 400,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &sony_griffin_samsung_bl_ops, &props);
+}
+
+static int sony_griffin_samsung_probe(struct mipi_dsi_device *dsi)
+{
+	const u16 hdisplay = enable_4k ? 1644 : 1096;
+	struct device *dev = &dsi->dev;
+	struct sony_griffin_samsung *ctx;
+	struct drm_dsc_config *dsc;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(ctx->vddio))
+		return dev_err_probe(dev, PTR_ERR(ctx->vddio),
+					"Failed to get vddio regulator\n");
+
+	ctx->vci = devm_regulator_get(dev, "vci");
+	if (IS_ERR(ctx->vci))
+		return dev_err_probe(dev, PTR_ERR(ctx->vci),
+					"Failed to get vci regulator\n");
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
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &sony_griffin_samsung_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.backlight = sony_griffin_samsung_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
+	if (!dsc)
+		return -ENOMEM;
+
+	dsc->dsc_version_major = 1;
+	dsc->dsc_version_minor = 1;
+
+	dsc->slice_height = 32;
+	dsc->slice_count = 2;
+	WARN_ON(hdisplay % dsc->slice_count);
+	dsc->slice_width = hdisplay / dsc->slice_count;
+	dsc->bits_per_component = 8;
+	dsc->bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	dsc->block_pred_enable = true;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void sony_griffin_samsung_remove(struct mipi_dsi_device *dsi)
+{
+	struct sony_griffin_samsung *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id sony_griffin_samsung_of_match[] = {
+	{ .compatible = "sony,griffin-samsung-4k-oled" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sony_griffin_samsung_of_match);
+
+static struct mipi_dsi_driver sony_griffin_samsung_driver = {
+	.probe = sony_griffin_samsung_probe,
+	.remove = sony_griffin_samsung_remove,
+	.driver = {
+		.name = "panel-sony-griffin-samsung-4k-oled",
+		.of_match_table = sony_griffin_samsung_of_match,
+	},
+};
+module_mipi_dsi_driver(sony_griffin_samsung_driver);
+
+MODULE_AUTHOR("Marijn Suijten <marijn.suijten@somainline.org>");
+MODULE_DESCRIPTION("DRM panel driver for an unnamed Samsung 4k OLED panel found in the Sony Xperia 1");
+MODULE_LICENSE("GPL");

-- 
2.40.1

