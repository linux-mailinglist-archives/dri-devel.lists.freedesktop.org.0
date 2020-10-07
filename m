Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81409286F2E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F347F6EA37;
	Thu,  8 Oct 2020 07:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADAE6E118
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:19:49 +0000 (UTC)
Date: Wed, 07 Oct 2020 17:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1602091187;
 bh=lr01I54W83dQfyPAXxNgr/K8XWBKrwkLjst7BnhvlRw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=P77AwqaHfzSUfSdSPycIEWqs+dG/IhTlMsCjJTQMpsFg8wJP9H2wIQjxPG4ySI3te
 ctoDDJKzco1Sju7n++a1l6YeVilr4yXq2S/hGNa3IAHQxO/67K/VlxnGBTL1t7WeQF
 Wg84/nTVppFrWeP+V/OOADXwYJ744lRreG4OLfUw=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/5] drm/panel/oneplus6: Add panel-oneplus6
Message-ID: <20201007171807.285298-2-caleb@connolly.tech>
In-Reply-To: <20201007171807.285298-1-caleb@connolly.tech>
References: <20201007171807.285298-1-caleb@connolly.tech>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: Caleb Connolly <caleb@connolly.tech>, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds support for the display panels used in the OnePlus 6 /
T devices.

The OnePlus 6/T devices use different panels however they are
functionally identical with much of the commands being shared. The
panels don't appear to be used by any other devices some combine them as
one driver that is specific to the devices.

The panels are: samsung,sofef00
and             samsung,s6e3fc2x01

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/Kconfig          |  12 +
 drivers/gpu/drm/panel/Makefile         |   1 +
 drivers/gpu/drm/panel/panel-oneplus6.c | 418 +++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-oneplus6.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index de2f2a452be5..d72862265400 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -229,6 +229,18 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
 	  Say Y here if you want to enable support for Olimex Ltd.
 	  LCD-OLinuXino panel.
 
+config DRM_PANEL_ONEPLUS6
+	tristate "OnePlus 6/6T Samsung AMOLED DSI command mode panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y or M here if you want to enable support for the Samsung AMOLED
+	  command mode panels found in the OnePlus 6/6T smartphones.
+
+	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
+
 config DRM_PANEL_ORISETECH_OTM8009A
 	tristate "Orise Technology otm8009a 480x800 dsi 2dl panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index e45ceac6286f..017539056f53 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
+obj-$(CONFIG_DRM_PANEL_ONEPLUS6) += panel-oneplus6.o
 obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) += panel-orisetech-otm8009a.o
 obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) += panel-osd-osd101t2587-53ts.o
 obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
diff --git a/drivers/gpu/drm/panel/panel-oneplus6.c b/drivers/gpu/drm/panel/panel-oneplus6.c
new file mode 100644
index 000000000000..5e212774b1e0
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-oneplus6.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech>
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ *
+ * Caleb Connolly <caleb@connolly.tech>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <linux/backlight.h>
+
+struct oneplus6_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct backlight_device *backlight;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *enable_gpio;
+	const struct drm_display_mode *mode;
+	bool prepared;
+	bool enabled;
+};
+
+static inline
+struct oneplus6_panel *to_oneplus6_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct oneplus6_panel, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static void oneplus6_panel_reset(struct oneplus6_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+}
+
+static int oneplus6_panel_on(struct oneplus6_panel *ctx)
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
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
+	dsi_dcs_write_seq(dsi, 0xb6, 0x12);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int oneplus6_panel_off(struct oneplus6_panel *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	msleep(40);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(160);
+
+	return 0;
+}
+
+static int oneplus6_panel_prepare(struct drm_panel *panel)
+{
+	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	oneplus6_panel_reset(ctx);
+
+	ret = oneplus6_panel_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int oneplus6_panel_unprepare(struct drm_panel *panel)
+{
+	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = oneplus6_panel_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	regulator_disable(ctx->supply);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+
+static int oneplus6_panel_enable(struct drm_panel *panel)
+{
+	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
+	int ret;
+
+	if (ctx->enabled)
+		return 0;
+
+	ret = backlight_enable(ctx->backlight);
+	if (ret < 0) {
+		dev_err(&ctx->dsi->dev, "Failed to enable backlight: %d\n", ret);
+		return ret;
+	}
+
+	ctx->enabled = true;
+	return 0;
+}
+
+static int oneplus6_panel_disable(struct drm_panel *panel)
+{
+	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
+	int ret;
+
+	if (!ctx->enabled)
+		return 0;
+
+	ret = backlight_disable(ctx->backlight);
+	if (ret < 0) {
+		dev_err(&ctx->dsi->dev, "Failed to disable backlight: %d\n", ret);
+		return ret;
+	}
+
+	ctx->enabled = false;
+	return 0;
+}
+
+
+static const struct drm_display_mode enchilada_panel_mode = {
+	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 112,
+	.hsync_end = 1080 + 112 + 16,
+	.htotal = 1080 + 112 + 16 + 36,
+	.vdisplay = 2280,
+	.vsync_start = 2280 + 36,
+	.vsync_end = 2280 + 36 + 8,
+	.vtotal = 2280 + 36 + 8 + 12,
+	.width_mm = 68,
+	.height_mm = 145,
+};
+
+static const struct drm_display_mode fajita_panel_mode = {
+	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 72,
+	.hsync_end = 1080 + 72 + 16,
+	.htotal = 1080 + 72 + 16 + 36,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 32,
+	.vsync_end = 2340 + 32 + 4,
+	.vtotal = 2340 + 32 + 4 + 18,
+	.width_mm = 68,
+	.height_mm = 145,
+};
+
+static int oneplus6_panel_get_modes(struct drm_panel *panel,
+						struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
+
+	mode = drm_mode_duplicate(connector->dev, ctx->mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs oneplus6_panel_panel_funcs = {
+	.disable = oneplus6_panel_disable,
+	.enable = oneplus6_panel_enable,
+	.prepare = oneplus6_panel_prepare,
+	.unprepare = oneplus6_panel_unprepare,
+	.get_modes = oneplus6_panel_get_modes,
+};
+
+static int oneplus6_panel_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	int err;
+	u16 brightness = bl->props.brightness;
+
+	err = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	if (err < 0) {
+		return err;
+	}
+
+	return brightness & 0xff;
+}
+
+static int oneplus6_panel_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	int err;
+	unsigned short brightness;
+
+	// This panel needs the high and low bytes swapped for the brightness value
+	brightness = ((bl->props.brightness<<8)&0xff00)|((bl->props.brightness>>8)&0x00ff);
+
+	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	if (err < 0) {
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct backlight_ops oneplus6_panel_bl_ops = {
+	.update_status = oneplus6_panel_bl_update_status,
+	.get_brightness = oneplus6_panel_bl_get_brightness,
+};
+
+static struct backlight_device *
+oneplus6_panel_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct backlight_properties props = {
+		.type = BACKLIGHT_PLATFORM,
+		.scale = BACKLIGHT_SCALE_LINEAR,
+		.brightness = 255,
+		.max_brightness = 512,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+						  &oneplus6_panel_bl_ops, &props);
+}
+
+
+static int oneplus6_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct oneplus6_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->mode = of_device_get_match_data(dev);
+
+	if (!ctx->mode) {
+		dev_err(dev, "Missing device mode\n");
+		return -ENODEV;
+	}
+
+	ctx->supply = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(ctx->supply)) {
+		ret = PTR_ERR(ctx->supply);
+		dev_err(dev, "Failed to get vddio regulator: %d\n", ret);
+		return ret;
+	}
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio)) {
+		ret = PTR_ERR(ctx->reset_gpio);
+		dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
+		return ret;
+	}
+
+	ctx->backlight = oneplus6_panel_create_backlight(dsi);
+	if (IS_ERR(ctx->backlight)) {
+		ret = PTR_ERR(ctx->backlight);
+		dev_err(dev, "Failed to create backlight: %d\n", ret);
+		return ret;
+	}
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+
+	drm_panel_init(&ctx->panel, dev, &oneplus6_panel_panel_funcs,
+			   DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_add(&ctx->panel);
+	if (ret < 0) {
+		dev_err(dev, "Failed to add panel: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(dev, "Successfully added oneplus6 panel");
+
+	return 0;
+}
+
+static int oneplus6_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct oneplus6_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id oneplus6_panel_of_match[] = {
+	{
+		.compatible = "samsung,sofef00",
+		.data = &enchilada_panel_mode,
+	},
+	{
+		.compatible = "samsung,s6e3fc2x01",
+		.data = &fajita_panel_mode,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, oneplus6_panel_of_match);
+
+static struct mipi_dsi_driver oneplus6_panel_driver = {
+	.probe = oneplus6_panel_probe,
+	.remove = oneplus6_panel_remove,
+	.driver = {
+		.name = "panel-oneplus6",
+		.of_match_table = oneplus6_panel_of_match,
+	},
+};
+
+module_mipi_dsi_driver(oneplus6_panel_driver);
+
+MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
+MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OnePlus 6/6T phones");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
