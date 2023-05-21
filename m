Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E070B0BE
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967710E1FA;
	Sun, 21 May 2023 21:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CF310E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:23:16 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6FD673F35C;
 Sun, 21 May 2023 23:23:14 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 21 May 2023 23:23:08 +0200
Subject: [PATCH RFC 06/10] drm/panel/samsung-sofef01: Add panel driver for
 Sony Xperia 5 / 10 II
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230521-drm-panels-sony-v1-6-541c341d6bee@somainline.org>
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

This SOFEF01-M Display-IC driver supports two modes with different
compatibles to differentiate between slightly different physical sizes
(panels) found on the Xperia 5 (6.1") and 10 II (6.0").

It is currently also used to hardcode significantly higher fake porches
for the Xperia 5, which are unused in transfers due to this being a
command-mode panel but do have an effect on the clock rates set by
dsi_host.c.  Without higher clock rates this panel fails to achieve
60fps and has significant tearing artifacts, while the same calculated
clock rate works perfectly fine on the Xperia 10 II.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-sofef01.c | 360 ++++++++++++++++++++++++++
 3 files changed, 373 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 18bd116e78a71..3f11e9906f2cb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -618,6 +618,18 @@ config DRM_PANEL_SAMSUNG_SOFEF00
 
 	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
 
+config DRM_PANEL_SAMSUNG_SOFEF01
+	tristate "Samsung sofef01 Sony Xperia 5 / 10 II DSI cmd mode panels"
+	depends on GPIOLIB
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y or M here if you want to enable support for the Samsung AMOLED
+	  command mode panels found in the Sony Xperia 5 / 10 II smartphones.
+
+	  This panel features a fixed mode of 1080x2520@60.
+
 config DRM_PANEL_SEIKO_43WVF1G
 	tristate "Seiko 43WVF1G panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 85133f73558f3..a4039d0fc9cfb 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) += panel-samsung-s6e63m0-dsi.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF01) += panel-samsung-sofef01.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef01.c b/drivers/gpu/drm/panel/panel-samsung-sofef01.c
new file mode 100644
index 0000000000000..18dc67a301a7b
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef01.c
@@ -0,0 +1,360 @@
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
+
+struct samsung_sofef01_m {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *vddio, *vci;
+	struct gpio_desc *reset_gpio;
+	const struct drm_display_mode *mode;
+	bool prepared;
+};
+
+static inline struct samsung_sofef01_m *to_samsung_sofef01_m(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_sofef01_m, panel);
+}
+
+static void samsung_sofef01_m_reset(struct samsung_sofef01_m *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int samsung_sofef01_m_on(struct samsung_sofef01_m *ctx)
+{
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
+	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x03);
+	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2520 - 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set page address: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xbe, 0x92, 0x29);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x06);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x90);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	msleep(110);
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
+static int samsung_sofef01_m_off(struct samsung_sofef01_m *ctx)
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
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	return 0;
+}
+
+static int samsung_sofef01_m_prepare(struct drm_panel *panel)
+{
+	struct samsung_sofef01_m *ctx = to_samsung_sofef01_m(panel);
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
+	samsung_sofef01_m_reset(ctx);
+
+	ret = samsung_sofef01_m_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_disable(ctx->vci);
+		regulator_disable(ctx->vddio);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int samsung_sofef01_m_unprepare(struct drm_panel *panel)
+{
+	struct samsung_sofef01_m *ctx = to_samsung_sofef01_m(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = samsung_sofef01_m_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->vci);
+	regulator_disable(ctx->vddio);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static int samsung_sofef01_m_get_modes(struct drm_panel *panel,
+				       struct drm_connector *connector)
+{
+	struct samsung_sofef01_m *ctx = to_samsung_sofef01_m(panel);
+
+	return drm_connector_helper_get_modes_fixed(connector, ctx->mode);
+}
+
+static const struct drm_panel_funcs samsung_sofef01_m_panel_funcs = {
+	.prepare = samsung_sofef01_m_prepare,
+	.unprepare = samsung_sofef01_m_unprepare,
+	.get_modes = samsung_sofef01_m_get_modes,
+};
+
+static int samsung_sofef01_m_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int samsung_sofef01_m_bl_get_brightness(struct backlight_device *bl)
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
+static const struct backlight_ops samsung_sofef01_m_bl_ops = {
+	.update_status = samsung_sofef01_m_bl_update_status,
+	.get_brightness = samsung_sofef01_m_bl_get_brightness,
+};
+
+static struct backlight_device *
+samsung_sofef01_m_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 100,
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &samsung_sofef01_m_bl_ops, &props);
+}
+
+static int samsung_sofef01_m_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct samsung_sofef01_m *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(ctx->vddio))
+		return dev_err_probe(dev, PTR_ERR(ctx->vddio),
+				     "Failed to get vddio regulator\n");
+
+	ctx->vci = devm_regulator_get(dev, "vci");
+	if (IS_ERR(ctx->vci))
+		return dev_err_probe(dev, PTR_ERR(ctx->vci),
+				     "Failed to get vci regulator\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	ctx->mode = of_device_get_match_data(dev);
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &samsung_sofef01_m_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.backlight = samsung_sofef01_m_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
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
+static void samsung_sofef01_m_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_sofef01_m *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+/* Sony Xperia 5 (kumano bahamut) */
+static const struct drm_display_mode samsung_sofef01_m_bahamut_mode = {
+	/*
+	 * WARNING: These massive porches are wrong/useless for CMDmode
+	 * (and not defined in downstream DTS) but necessary to bump dsi
+	 * clocks higher, so that we can achieve proper 60fps without tearing.
+	 */
+	.clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 156,
+	.hsync_end = 1080 + 156 + 8,
+	.htotal = 1080 + 156 + 8 + 8,
+	.vdisplay = 2520,
+	.vsync_start = 2520 + 2393,
+	.vsync_end = 2520 + 2393 + 8,
+	.vtotal = 2520 + 2393 + 8 + 8,
+	.width_mm = 61,
+	.height_mm = 142,
+};
+
+/* Sony Xperia 10 II (seine pdx201) */
+static const struct drm_display_mode samsung_sofef01_m_pdx201_mode = {
+	.clock = (1080 + 8 + 8 + 8) * (2520 + 8 + 8 + 8) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 8,
+	.hsync_end = 1080 + 8 + 8,
+	.htotal = 1080 + 8 + 8 + 8,
+	.vdisplay = 2520,
+	.vsync_start = 2520 + 8,
+	.vsync_end = 2520 + 8 + 8,
+	.vtotal = 2520 + 8 + 8 + 8,
+	.width_mm = 60,
+	.height_mm = 139,
+};
+
+static const struct of_device_id samsung_sofef01_m_of_match[] = {
+	{ .compatible = "samsung,sofef01-m-bahamut", .data = &samsung_sofef01_m_bahamut_mode },
+	{ .compatible = "samsung,sofef01-m-pdx201", .data = &samsung_sofef01_m_pdx201_mode },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_sofef01_m_of_match);
+
+static struct mipi_dsi_driver samsung_sofef01_m_driver = {
+	.probe = samsung_sofef01_m_probe,
+	.remove = samsung_sofef01_m_remove,
+	.driver = {
+		.name = "panel-samsung-sofef01-m",
+		.of_match_table = samsung_sofef01_m_of_match,
+	},
+};
+module_mipi_dsi_driver(samsung_sofef01_m_driver);
+
+MODULE_AUTHOR("Marijn Suijten <marijn.suijten@somainline.org>");
+MODULE_DESCRIPTION("DRM panel driver for Samsung SOFEF01-M Display-IC panels");
+MODULE_LICENSE("GPL");

-- 
2.40.1

