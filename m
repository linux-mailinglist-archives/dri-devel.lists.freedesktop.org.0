Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14915F7743
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 13:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CB410E02A;
	Fri,  7 Oct 2022 11:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49F610E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:15:53 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MkQj52QJFzDrwX
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1665141353; bh=f/04iUEBFYszH1XPedbKzJXjOY9G+uG+SGi8kM+0mkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fbmzbuCccnW118dWKQHaR1eECRdNwcc72xY0WNPQzKfxSir95NAcdn+6TE/Y9fwGN
 JD3TVEo6GTYdf42XzaoyD2CrGbjYkhZC3NurZ1pLD3M/XQxc8lthfnAMSqFkmFdUem
 cHNWh/O3wYgnP40S/pggBchIg2VmUxPmoKAH7Sn4=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MkQj43Hj9z9s8T;
 Fri,  7 Oct 2022 11:15:52 +0000 (UTC)
X-Riseup-User-ID: 482CA08C9E45F257B7724629438BAB091A34074F85E256D7D636CC9BB99A4997
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MkQj22cG2z5vRK;
 Fri,  7 Oct 2022 11:15:50 +0000 (UTC)
From: Nia Espera <a5b6@riseup.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drivers: gpu: drm: add driver for samsung s6e3fc2x01
 cmd mode panel
Date: Fri,  7 Oct 2022 13:14:43 +0200
Message-Id: <20221007111442.51481-2-a5b6@riseup.net>
In-Reply-To: <20221007111442.51481-1-a5b6@riseup.net>
References: <20221007111442.51481-1-a5b6@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Nia Espera <a5b6@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds a dedicated driver for the Samsung s6e3fc2x01 panel used in OnePlus
6T smartphones which was previously driven by the sofef00 panel driver

Signed-off-by: Nia Espera <a5b6@riseup.net>
Reviewed-by: Caleb Connolly <caleb@connolly.tech>
---
 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 396 ++++++++++++++++++
 4 files changed, 413 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 936490dcc97b..7e9455ac5a13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6630,6 +6630,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 
+DRM DRIVER FOR SAMSUNG S6E3FC2X01 PANELS
+M:	Nia Espera <a5b6@riseup.net>
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
+
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9a281120363c..ee62d5d8828a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -558,6 +558,17 @@ config DRM_PANEL_SAMSUNG_SOFEF00
 
 	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
 
+config DRM_PANEL_SAMSUNG_S6E3FC2X01
+	tristate "Samsung s6e3fc2x01 OnePlus 6T DSI cmd mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	  Say Y or M here if you want to enable support for the Samsung AMOLED
+	  command mode panel found in the OnePlus 6T smartphone.
+
+	  The panel is 2340x1080@60Hz
+
 config DRM_PANEL_SEIKO_43WVF1G
 	tristate "Seiko 43WVF1G panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 6d493b9d64fe..b54de8812e91 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) += panel-samsung-s6e63m0-dsi.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FC2X01) += panel-samsung-s6e3fc2x01.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
new file mode 100644
index 000000000000..54b05703ebe4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2022 Nia Espera <a5b6@riseup.net>
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/swab.h>
+#include <linux/backlight.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct samsung_s6e3fc2x01 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	const struct drm_display_mode *mode;
+	bool prepared;
+};
+
+static inline
+struct samsung_s6e3fc2x01 *to_samsung_s6e3fc2x01(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_s6e3fc2x01, panel);
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
+static void samsung_s6e3fc2x01_reset(struct samsung_s6e3fc2x01 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int samsung_s6e3fc2x01_on(struct samsung_s6e3fc2x01 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	usleep_range(10000, 11000);
+
+	dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x01);
+	dsi_dcs_write_seq(dsi, 0xcd, 0x01);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	usleep_range(15000, 16000);
+	dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xeb, 0x17, 0x41, 0x92, 0x0e, 0x10, 0x82, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x0437);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set column address: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x0923);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set page address: %d\n", ret);
+		return ret;
+	}
+
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x09);
+	dsi_dcs_write_seq(dsi, 0xe8, 0x10, 0x30);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
+	dsi_dcs_write_seq(dsi, 0xb7, 0x01);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x08);
+	dsi_dcs_write_seq(dsi, 0xb7, 0x12);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, 0xfc, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x01);
+	dsi_dcs_write_seq(dsi, 0xe3, 0x88);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
+	dsi_dcs_write_seq(dsi, 0xed, 0x67);
+	dsi_dcs_write_seq(dsi, 0xfc, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	usleep_range(1000, 2000);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb3, 0x00, 0xc1);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 11000);
+	dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
+	dsi_dcs_write_seq(dsi, 0x29);
+	dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
+
+	return 0;
+}
+
+static int samsung_s6e3fc2x01_off(struct samsung_s6e3fc2x01 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	usleep_range(10000, 11000);
+
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	usleep_range(16000, 17000);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x50);
+	dsi_dcs_write_seq(dsi, 0xb9, 0x82);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	usleep_range(16000, 17000);
+	msleep(40);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	dsi_dcs_write_seq(dsi, 0xb0, 0x05);
+	dsi_dcs_write_seq(dsi, 0xf4, 0x01);
+	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	msleep(160);
+
+	return 0;
+}
+
+static int samsung_s6e3fc2x01_prepare(struct drm_panel *panel)
+{
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
+	samsung_s6e3fc2x01_reset(ctx);
+
+	ret = samsung_s6e3fc2x01_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int samsung_s6e3fc2x01_unprepare(struct drm_panel *panel)
+{
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = samsung_s6e3fc2x01_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode samsung_s6e3fc2x01_mode = {
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
+static int samsung_s6e3fc2x01_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
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
+static const struct drm_panel_funcs samsung_s6e3fc2x01_panel_funcs = {
+	.prepare = samsung_s6e3fc2x01_prepare,
+	.unprepare = samsung_s6e3fc2x01_unprepare,
+	.get_modes = samsung_s6e3fc2x01_get_modes,
+};
+
+static int s6e3fc2x01_panel_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	int err;
+	u16 brightness;
+
+	brightness = (u16)backlight_get_brightness(bl);
+	// This panel needs the high and low bytes swapped for the brightness value
+	brightness = __swab16(brightness);
+
+	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static const struct backlight_ops s6e3fc2x01_panel_bl_ops = {
+	.update_status = s6e3fc2x01_panel_bl_update_status,
+};
+
+static struct backlight_device *
+s6e3fc2x01_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_PLATFORM,
+		.brightness = 1023,
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &s6e3fc2x01_panel_bl_ops, &props);
+}
+
+static int samsung_s6e3fc2x01_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct samsung_s6e3fc2x01 *ctx;
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
+	if (IS_ERR(ctx->supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->supply),
+				     "Failed to get vddio regulator\n");
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
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &samsung_s6e3fc2x01_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.backlight = s6e3fc2x01_create_backlight(dsi);
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
+static int samsung_s6e3fc2x01_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_s6e3fc2x01 *ctx = mipi_dsi_get_drvdata(dsi);
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
+static const struct of_device_id samsung_s6e3fc2x01_of_match[] = {
+	{
+		.compatible = "samsung,s6e3fc2x01",
+		.data = &samsung_s6e3fc2x01_mode,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_s6e3fc2x01_of_match);
+
+static struct mipi_dsi_driver samsung_s6e3fc2x01_driver = {
+	.probe = samsung_s6e3fc2x01_probe,
+	.remove = samsung_s6e3fc2x01_remove,
+	.driver = {
+		.name = "panel-samsung-s6e3fc2x01",
+		.of_match_table = samsung_s6e3fc2x01_of_match,
+	},
+};
+module_mipi_dsi_driver(samsung_s6e3fc2x01_driver);
+
+MODULE_AUTHOR("Nia Espera <a5b6@riseup.net>");
+MODULE_DESCRIPTION("DRM driver for OnePlus 6T Panel");
+MODULE_LICENSE("GPL v2");
-- 
2.38.0

