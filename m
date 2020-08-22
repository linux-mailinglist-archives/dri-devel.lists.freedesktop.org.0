Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9C24F2CA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4078A6EC6F;
	Mon, 24 Aug 2020 06:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DD36E49B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598113994; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=banVirY1lmS5XGO1f1g3WxLjONsTp5DSjsruFLJsgd4=;
 b=wdGHx2p5B873cx/Cu1+qdcrbxTlJbl1Wb4LBnR+enZR3PTyL+uTFqql0FMzXHkrSM/705z
 zCZP4UQciYpa9VNxEll2uDFxR2aYhm9SpJeyiQlfCs4sy8dDWNbyZHfJmpf+2Z/f8+LFFt
 ANF2gUB8+XfETqVpRlFDW3jVXyAi3jc=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Noralf Tronnes <noralf@tronnes.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 5/6] drm/panel: Add panel driver for NewVision NV3052C
 based LCDs
Date: Sat, 22 Aug 2020 18:32:49 +0200
Message-Id: <20200822163250.63664-6-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-1-paul@crapouillou.net>
References: <20200822163250.63664-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver supports the NewVision NV3052C based LCDs. Right now, it
only supports the LeadTek LTK035C5444T 2.4" 640x480 TFT LCD panel, which
can be found in the Anbernic RG-350M handheld console.

v2: - Remove custom backlight handling
    - Use drm_panel_{disable,unprepare} instead of
      nv3052c_{disable,unprepare}
    - Silence error when backlight probe defers
    - Remove 'dev' field in priv structure, use drm_panel->dev instead

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 510 ++++++++++++++++++
 3 files changed, 520 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8d97d07c5871..45b003752d65 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -198,6 +198,15 @@ config DRM_PANEL_NEC_NL8048HL11
 	  panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
 	  as a module, choose M here.
 
+config DRM_PANEL_NEWVISION_NV3052C
+	tristate "NewVision NV3052C DSI/SPI RGB panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the NewVision NV3052C display controller.
+
 config DRM_PANEL_NOVATEK_NT35510
 	tristate "Novatek NT35510 RGB panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 15a4e7752951..c01743cdc08b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
+obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
new file mode 100644
index 000000000000..52fd2622b8d9
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NevVision NV3052C IPS LCD panel driver
+ *
+ * Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_mipi_dbi_spi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct nv3052c_panel_info {
+	const struct drm_display_mode *display_modes;
+	unsigned int num_modes;
+	unsigned int bus_type;
+	u16 width_mm, height_mm;
+	u32 bus_format, bus_flags;
+};
+
+struct nv3052c_reg {
+	u8 cmd;
+	u8 value;
+};
+
+struct nv3052c {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *supply;
+	const struct nv3052c_panel_info *panel_info;
+
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct nv3052c_reg nv3052c_regs[] = {
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x01 },
+	{ 0xe3, 0x00 },
+	{ 0x40, 0x00 },
+	{ 0x03, 0x40 },
+	{ 0x04, 0x00 },
+	{ 0x05, 0x03 },
+	{ 0x08, 0x00 },
+	{ 0x09, 0x07 },
+	{ 0x0a, 0x01 },
+	{ 0x0b, 0x32 },
+	{ 0x0c, 0x32 },
+	{ 0x0d, 0x0b },
+	{ 0x0e, 0x00 },
+	{ 0x23, 0xa0 },
+
+	{ 0x24, 0x0c },
+	{ 0x25, 0x06 },
+	{ 0x26, 0x14 },
+	{ 0x27, 0x14 },
+
+	{ 0x38, 0xcc },
+	{ 0x39, 0xd7 },
+	{ 0x3a, 0x4a },
+
+	{ 0x28, 0x40 },
+	{ 0x29, 0x01 },
+	{ 0x2a, 0xdf },
+	{ 0x49, 0x3c },
+	{ 0x91, 0x77 },
+	{ 0x92, 0x77 },
+	{ 0xa0, 0x55 },
+	{ 0xa1, 0x50 },
+	{ 0xa4, 0x9c },
+	{ 0xa7, 0x02 },
+	{ 0xa8, 0x01 },
+	{ 0xa9, 0x01 },
+	{ 0xaa, 0xfc },
+	{ 0xab, 0x28 },
+	{ 0xac, 0x06 },
+	{ 0xad, 0x06 },
+	{ 0xae, 0x06 },
+	{ 0xaf, 0x03 },
+	{ 0xb0, 0x08 },
+	{ 0xb1, 0x26 },
+	{ 0xb2, 0x28 },
+	{ 0xb3, 0x28 },
+	{ 0xb4, 0x33 },
+	{ 0xb5, 0x08 },
+	{ 0xb6, 0x26 },
+	{ 0xb7, 0x08 },
+	{ 0xb8, 0x26 },
+	{ 0xf0, 0x00 },
+	{ 0xf6, 0xc0 },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x02 },
+	{ 0xb0, 0x0b },
+	{ 0xb1, 0x16 },
+	{ 0xb2, 0x17 },
+	{ 0xb3, 0x2c },
+	{ 0xb4, 0x32 },
+	{ 0xb5, 0x3b },
+	{ 0xb6, 0x29 },
+	{ 0xb7, 0x40 },
+	{ 0xb8, 0x0d },
+	{ 0xb9, 0x05 },
+	{ 0xba, 0x12 },
+	{ 0xbb, 0x10 },
+	{ 0xbc, 0x12 },
+	{ 0xbd, 0x15 },
+	{ 0xbe, 0x19 },
+	{ 0xbf, 0x0e },
+	{ 0xc0, 0x16 },
+	{ 0xc1, 0x0a },
+	{ 0xd0, 0x0c },
+	{ 0xd1, 0x17 },
+	{ 0xd2, 0x14 },
+	{ 0xd3, 0x2e },
+	{ 0xd4, 0x32 },
+	{ 0xd5, 0x3c },
+	{ 0xd6, 0x22 },
+	{ 0xd7, 0x3d },
+	{ 0xd8, 0x0d },
+	{ 0xd9, 0x07 },
+	{ 0xda, 0x13 },
+	{ 0xdb, 0x13 },
+	{ 0xdc, 0x11 },
+	{ 0xdd, 0x15 },
+	{ 0xde, 0x19 },
+	{ 0xdf, 0x10 },
+	{ 0xe0, 0x17 },
+	{ 0xe1, 0x0a },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x03 },
+	{ 0x00, 0x2a },
+	{ 0x01, 0x2a },
+	{ 0x02, 0x2a },
+	{ 0x03, 0x2a },
+	{ 0x04, 0x61 },
+	{ 0x05, 0x80 },
+	{ 0x06, 0xc7 },
+	{ 0x07, 0x01 },
+	{ 0x08, 0x03 },
+	{ 0x09, 0x04 },
+	{ 0x70, 0x22 },
+	{ 0x71, 0x80 },
+	{ 0x30, 0x2a },
+	{ 0x31, 0x2a },
+	{ 0x32, 0x2a },
+	{ 0x33, 0x2a },
+	{ 0x34, 0x61 },
+	{ 0x35, 0xc5 },
+	{ 0x36, 0x80 },
+	{ 0x37, 0x23 },
+	{ 0x40, 0x03 },
+	{ 0x41, 0x04 },
+	{ 0x42, 0x05 },
+	{ 0x43, 0x06 },
+	{ 0x44, 0x11 },
+	{ 0x45, 0xe8 },
+	{ 0x46, 0xe9 },
+	{ 0x47, 0x11 },
+	{ 0x48, 0xea },
+	{ 0x49, 0xeb },
+	{ 0x50, 0x07 },
+	{ 0x51, 0x08 },
+	{ 0x52, 0x09 },
+	{ 0x53, 0x0a },
+	{ 0x54, 0x11 },
+	{ 0x55, 0xec },
+	{ 0x56, 0xed },
+	{ 0x57, 0x11 },
+	{ 0x58, 0xef },
+	{ 0x59, 0xf0 },
+	{ 0xb1, 0x01 },
+	{ 0xb4, 0x15 },
+	{ 0xb5, 0x16 },
+	{ 0xb6, 0x09 },
+	{ 0xb7, 0x0f },
+	{ 0xb8, 0x0d },
+	{ 0xb9, 0x0b },
+	{ 0xba, 0x00 },
+	{ 0xc7, 0x02 },
+	{ 0xca, 0x17 },
+	{ 0xcb, 0x18 },
+	{ 0xcc, 0x0a },
+	{ 0xcd, 0x10 },
+	{ 0xce, 0x0e },
+	{ 0xcf, 0x0c },
+	{ 0xd0, 0x00 },
+	{ 0x81, 0x00 },
+	{ 0x84, 0x15 },
+	{ 0x85, 0x16 },
+	{ 0x86, 0x10 },
+	{ 0x87, 0x0a },
+	{ 0x88, 0x0c },
+	{ 0x89, 0x0e },
+	{ 0x8a, 0x02 },
+	{ 0x97, 0x00 },
+	{ 0x9a, 0x17 },
+	{ 0x9b, 0x18 },
+	{ 0x9c, 0x0f },
+	{ 0x9d, 0x09 },
+	{ 0x9e, 0x0b },
+	{ 0x9f, 0x0d },
+	{ 0xa0, 0x01 },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x02 },
+	{ 0x01, 0x01 },
+	{ 0x02, 0xda },
+	{ 0x03, 0xba },
+	{ 0x04, 0xa8 },
+	{ 0x05, 0x9a },
+	{ 0x06, 0x70 },
+	{ 0x07, 0xff },
+	{ 0x08, 0x91 },
+	{ 0x09, 0x90 },
+	{ 0x0a, 0xff },
+	{ 0x0b, 0x8f },
+	{ 0x0c, 0x60 },
+	{ 0x0d, 0x58 },
+	{ 0x0e, 0x48 },
+	{ 0x0f, 0x38 },
+	{ 0x10, 0x2b },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x00 },
+	{ 0x36, 0x0a },
+};
+
+static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
+{
+	return container_of(panel, struct nv3052c, panel);
+}
+
+static int nv3052c_prepare(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	unsigned int i;
+	int err;
+
+	err = regulator_enable(priv->supply);
+	if (err) {
+		dev_err(panel->dev, "Failed to enable power supply: %d\n", err);
+		return err;
+	}
+
+	/* Reset the chip */
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10, 1000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(5000, 20000);
+
+	for (i = 0; i < ARRAY_SIZE(nv3052c_regs); i++) {
+		err = mipi_dsi_dcs_write(priv->dsi, nv3052c_regs[i].cmd,
+					 &nv3052c_regs[i].value, 1);
+		if (err) {
+			dev_err(panel->dev, "Unable to set register: %d\n", err);
+			goto err_disable_regulator;
+		}
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(priv->dsi);
+	if (err) {
+		dev_err(panel->dev, "Unable to exit sleep mode: %d\n", err);
+		return err;
+	}
+
+	msleep(100);
+
+	return 0;
+
+err_disable_regulator:
+	regulator_disable(priv->supply);
+	return err;
+}
+
+static int nv3052c_unprepare(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	int err;
+
+	err = mipi_dsi_dcs_enter_sleep_mode(priv->dsi);
+	if (err) {
+		dev_err(panel->dev, "Unable to enter sleep mode: %d\n", err);
+		return err;
+	}
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+
+	regulator_disable(priv->supply);
+
+	return 0;
+}
+
+static int nv3052c_enable(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	int err;
+
+	err = mipi_dsi_dcs_set_display_on(priv->dsi);
+	if (err) {
+		dev_err(panel->dev, "Unable to enable display: %d\n", err);
+		return err;
+	}
+
+	if (panel->backlight) {
+		/* Wait for the picture to be ready before enabling backlight */
+		usleep_range(10000, 20000);
+	}
+
+	return 0;
+}
+
+static int nv3052c_disable(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	int err;
+
+	err = mipi_dsi_dcs_set_display_off(priv->dsi);
+	if (err) {
+		dev_err(panel->dev, "Unable to disable display: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int nv3052c_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	const struct nv3052c_panel_info *panel_info = priv->panel_info;
+	struct drm_display_mode *mode;
+	unsigned int i;
+
+	for (i = 0; i < panel_info->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel_info->display_modes[i]);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
+
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (panel_info->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = panel_info->width_mm;
+	connector->display_info.height_mm = panel_info->height_mm;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &panel_info->bus_format, 1);
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	return panel_info->num_modes;
+}
+
+static const struct drm_panel_funcs nv3052c_funcs = {
+	.prepare	= nv3052c_prepare,
+	.unprepare	= nv3052c_unprepare,
+	.enable		= nv3052c_enable,
+	.disable	= nv3052c_disable,
+	.get_modes	= nv3052c_get_modes,
+};
+
+static int nv3052c_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct nv3052c *priv;
+	int err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	priv->panel_info = of_device_get_match_data(dev);
+	if (!priv->panel_info)
+		return -EINVAL;
+
+	dsi->bus_type = priv->panel_info->bus_type;
+
+	priv->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(priv->supply)) {
+		dev_err(dev, "Failed to get power supply\n");
+		return PTR_ERR(priv->supply);
+	}
+
+	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio)) {
+		dev_err(dev, "Failed to get reset GPIO\n");
+		return PTR_ERR(priv->reset_gpio);
+	}
+
+	drm_panel_init(&priv->panel, dev, &nv3052c_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	err = drm_panel_of_backlight(&priv->panel);
+	if (err < 0) {
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Failed to attach backlight\n");
+		return err;
+	}
+
+	drm_panel_add(&priv->panel);
+
+	err = mipi_dsi_attach(dsi);
+	if (err) {
+		dev_err(dev, "Failed to attach panel\n");
+		drm_panel_remove(&priv->panel);
+		return err;
+	}
+
+	/*
+	 * We can't call mipi_dsi_maybe_register_tiny_driver(), since the
+	 * NV3052C does not support MIPI_DCS_WRITE_MEMORY_START.
+	 */
+
+	return 0;
+}
+
+static int nv3052c_remove(struct mipi_dsi_device *dsi)
+{
+	struct nv3052c *priv = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&priv->panel);
+
+	drm_panel_disable(&priv->panel);
+	drm_panel_unprepare(&priv->panel);
+
+	return 0;
+}
+
+static const struct drm_display_mode ltk035c5444t_modes[] = {
+	{ /* 60 Hz */
+		.clock = 24000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 96,
+		.hsync_end = 640 + 96 + 16,
+		.htotal = 640 + 96 + 16 + 48,
+		.vdisplay = 480,
+		.vsync_start = 480 + 5,
+		.vsync_end = 480 + 5 + 2,
+		.vtotal = 480 + 5 + 2 + 13,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	{ /* 50 Hz */
+		.clock = 18000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 39,
+		.hsync_end = 640 + 39 + 2,
+		.htotal = 640 + 39 + 2 + 39,
+		.vdisplay = 480,
+		.vsync_start = 480 + 5,
+		.vsync_end = 480 + 5 + 2,
+		.vtotal = 480 + 5 + 2 + 13,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct nv3052c_panel_info ltk035c5444t_spi_panel_info = {
+	.display_modes = ltk035c5444t_modes,
+	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
+	.bus_type = MIPI_DCS_BUS_TYPE_DBI_SPI_C1,
+	.width_mm = 77,
+	.height_mm = 64,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
+static const struct of_device_id nv3052c_of_match[] = {
+	{ .compatible = "leadtek,ltk035c5444t-spi", .data = &ltk035c5444t_spi_panel_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nv3052c_of_match);
+
+static struct mipi_dsi_driver nv3052c_driver = {
+	.driver = {
+		.name = "nv3052c",
+		.of_match_table = nv3052c_of_match,
+	},
+	.probe = nv3052c_probe,
+	.remove = nv3052c_remove,
+};
+module_mipi_dbi_spi_driver(nv3052c_driver, nv3052c_of_match);
+
+MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
