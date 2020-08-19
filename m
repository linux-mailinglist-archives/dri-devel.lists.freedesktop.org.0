Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD024AFB1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFE46E8B5;
	Thu, 20 Aug 2020 07:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0896E213
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:22:53 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 766EFDEE69;
 Wed, 19 Aug 2020 10:21:59 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2ii0F1sPKc2J; Wed, 19 Aug 2020 10:21:57 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id E1ACCDFA72;
 Wed, 19 Aug 2020 10:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6YsvteZE-DBR; Wed, 19 Aug 2020 10:21:56 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 7ED36DFA44;
 Wed, 19 Aug 2020 10:21:56 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 2/2] drm/bridge: hx8837: add a Himax HX8837 display
 controller driver
Date: Wed, 19 Aug 2020 12:22:46 +0200
Message-Id: <20200819102246.634039-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819102246.634039-1-lkundrak@v3.sk>
References: <[PATCH v4 0/2] drm/bridge: hx8837: add a Himax HX8837 display
 controller driver> <20200819102246.634039-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Himax HX8837 is used to drive the LCD panel on OLPC platforms.

It controls the panel backlight and is able to refresh it when the LCD
controller (and the rest of the plaform) is powered off.

It also converts regular RGB color data from the LCDC so that it looks
reasonable on the OLPC LCD panel with a monochromatic layer on top of a
layer that can either reflect light (b/w sunlight readable mode) or light
pattern of red, green and blue pixels.

At this point, the driver is rather basic. The self-refresh mode is not
supported. There's no way of independently controlling the color swizzling,
antialiasing or b/w conversion, but it probably isn't too useful either.

There's another driver for the same hardware on OLPC XO-1.5 and XO-1.75
in drivers/staging/olpc_dcon. The display on that hardware doesn't utilize
DRM, so this driver doesn't replace the other one yet.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v3:
- Added this patch, in place of a driver derived from
  drivers/staging/olpc_dcon. Compared to the previous one this
  implements the bare minimum, without the fancy stuff such as
  self-refresh that need more work/thinking.

 drivers/gpu/drm/bridge/Kconfig        |  13 ++
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/himax-hx8837.c | 325 ++++++++++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/himax-hx8837.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 43271c21d3fce..df30d61c3fee1 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -48,6 +48,19 @@ config DRM_DISPLAY_CONNECTOR
 	  on ARM-based platforms. Saying Y here when this driver is not needed
 	  will not cause any issue.
 
+config DRM_HIMAX_HX8837
+        tristate "HiMax HX8837 OLPC Display Controller"
+	depends on OF
+	depends on OLPC || ARCH_MMP || COMPILE_TEST
+	select DRM_KMS_HELPER
+        select BACKLIGHT_LCD_SUPPORT
+        select BACKLIGHT_CLASS_DEVICE
+        help
+          Enable support for HiMax HX8837 Display Controller as found in the
+          OLPC XO laptops.
+
+          If your laptop doesn't have green ears, say "N"
+
 config DRM_LVDS_CODEC
 	tristate "Transparent LVDS encoders and decoders support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index d63d4b7e43473..70d97c84382d5 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
+obj-$(CONFIG_DRM_HIMAX_HX8837) += himax-hx8837.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
diff --git a/drivers/gpu/drm/bridge/himax-hx8837.c b/drivers/gpu/drm/bridge/himax-hx8837.c
new file mode 100644
index 0000000000000..1e97fcb8ce505
--- /dev/null
+++ b/drivers/gpu/drm/bridge/himax-hx8837.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * HiMax HX8837 Display Controller Driver
+ *
+ * Datasheet: http://wiki.laptop.org/images/0/09/DCON_datasheet_HX8837-A.pdf
+ *
+ * Copyright (C) 2020 Lubomir Rintel
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#define bridge_to_hx8837_priv(x) \
+	container_of(x, struct hx8837_priv, bridge)
+
+/* DCON registers */
+enum {
+	DCON_REG_ID		= 0x00,
+	DCON_REG_MODE		= 0x01,
+	DCON_REG_HRES		= 0x02,
+	DCON_REG_HTOTAL		= 0x03,
+	DCON_REG_HSYNC_WIDTH	= 0x04,
+	DCON_REG_VRES		= 0x05,
+	DCON_REG_VTOTAL		= 0x06,
+	DCON_REG_VSYNC_WIDTH	= 0x07,
+	DCON_REG_TIMEOUT	= 0x08,
+	DCON_REG_SCAN_INT	= 0x09,
+	DCON_REG_BRIGHT		= 0x0a,
+	DCON_REG_MEM_OPT_A	= 0x41,
+	DCON_REG_MEM_OPT_B	= 0x42,
+};
+
+/* DCON_REG_MODE */
+enum {
+	MODE_PASSTHRU		= BIT(0),
+	MODE_SLEEP		= BIT(1),
+	MODE_SLEEP_AUTO		= BIT(2),
+	MODE_BL_ENABLE		= BIT(3),
+	MODE_BLANK		= BIT(4),
+	MODE_CSWIZZLE		= BIT(5),
+	MODE_COL_AA		= BIT(6),
+	MODE_MONO_LUMA		= BIT(7),
+	MODE_SCAN_INT		= BIT(8),
+	MODE_CLOCKDIV		= BIT(9),
+	MODE_DEBUG		= BIT(14),
+	MODE_SELFTEST		= BIT(15),
+};
+
+struct hx8837_priv {
+	struct regmap *regmap;
+	struct gpio_desc *load_gpio;
+
+	struct drm_bridge *panel_bridge;
+	struct drm_panel *panel;
+	struct drm_bridge bridge;
+};
+
+static int hx8837_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct hx8837_priv *priv = bridge_to_hx8837_priv(bridge);
+
+	return drm_bridge_attach(bridge->encoder, priv->panel_bridge,
+				 bridge, flags);
+}
+
+static enum drm_mode_status hx8837_bridge_mode_valid(
+				struct drm_bridge *bridge,
+				const struct drm_display_info *info,
+				const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay > 0xffff)
+		return MODE_BAD_HVALUE;
+	if (mode->htotal > 0xffff)
+		return MODE_BAD_HVALUE;
+	if (mode->hsync_start - mode->hdisplay > 0xff)
+		return MODE_HBLANK_WIDE;
+	if (mode->hsync_end - mode->hsync_start > 0xff)
+		return MODE_HSYNC_WIDE;
+	if (mode->vdisplay > 0xffff)
+		return MODE_BAD_VVALUE;
+	if (mode->vtotal > 0xffff)
+		return MODE_BAD_VVALUE;
+	if (mode->vsync_start - mode->vdisplay > 0xff)
+		return MODE_VBLANK_WIDE;
+	if (mode->vsync_end - mode->vsync_start > 0xff)
+		return MODE_VSYNC_WIDE;
+
+	return MODE_OK;
+}
+
+static void hx8837_bridge_disable(struct drm_bridge *bridge)
+{
+	struct hx8837_priv *priv = bridge_to_hx8837_priv(bridge);
+	int ret;
+
+	ret = gpiod_direction_output(priv->load_gpio, 0);
+	if (ret)
+		DRM_ERROR("error enabling the dcon load: %d\n", ret);
+
+	ret = regmap_update_bits(priv->regmap, DCON_REG_MODE,
+					       MODE_PASSTHRU |
+					       MODE_SLEEP,
+					       MODE_PASSTHRU |
+					       MODE_SLEEP);
+	if (ret)
+		DRM_ERROR("error disabling the dcon: %d\n", ret);
+}
+
+static void hx8837_bridge_enable(struct drm_bridge *bridge)
+{
+	struct hx8837_priv *priv = bridge_to_hx8837_priv(bridge);
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, DCON_REG_MODE,
+					       MODE_PASSTHRU |
+					       MODE_SLEEP |
+					       MODE_SLEEP_AUTO |
+					       MODE_BLANK |
+					       MODE_SCAN_INT |
+					       MODE_CLOCKDIV |
+					       MODE_DEBUG |
+					       MODE_SELFTEST,
+					       MODE_PASSTHRU);
+	if (ret)
+		DRM_ERROR("error enabling the dcon: %d\n", ret);
+
+	ret = gpiod_direction_output(priv->load_gpio, 1);
+	if (ret)
+		DRM_ERROR("error enabling the dcon load: %d\n", ret);
+}
+
+static void hx8837_bridge_mode_set(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   const struct drm_display_mode *adjusted_mode)
+{
+	struct hx8837_priv *priv = bridge_to_hx8837_priv(bridge);
+
+	regmap_write(priv->regmap, DCON_REG_HRES, mode->hdisplay);
+	regmap_write(priv->regmap, DCON_REG_HTOTAL, mode->htotal);
+	regmap_write(priv->regmap, DCON_REG_HSYNC_WIDTH,
+			(mode->hsync_start - mode->hdisplay) << 8 |
+			(mode->hsync_end - mode->hsync_start));
+	regmap_write(priv->regmap, DCON_REG_VRES, mode->vdisplay);
+	regmap_write(priv->regmap, DCON_REG_VTOTAL, mode->vtotal);
+	regmap_write(priv->regmap, DCON_REG_VSYNC_WIDTH,
+			(mode->vsync_start - mode->vdisplay) << 8 |
+			(mode->vsync_end - mode->vsync_start));
+}
+
+static const struct drm_bridge_funcs hx8837_bridge_funcs = {
+	.attach = hx8837_bridge_attach,
+	.mode_valid = hx8837_bridge_mode_valid,
+	.disable = hx8837_bridge_disable,
+	.enable = hx8837_bridge_enable,
+	.mode_set = hx8837_bridge_mode_set,
+};
+
+static int hx8837_bl_update_status(struct backlight_device *bl)
+{
+	struct hx8837_priv *priv = bl_get_data(bl);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, DCON_REG_BRIGHT,
+					       0x000f,
+					       bl->props.brightness);
+	if (ret) {
+		dev_err(&bl->dev, "error setting the backlight: %d\n", ret);
+		return ret;
+	}
+
+	if (bl->props.brightness)
+		val = MODE_CSWIZZLE | MODE_COL_AA;
+	else
+		val = MODE_MONO_LUMA;
+
+	ret = regmap_update_bits(priv->regmap, DCON_REG_MODE,
+					       MODE_CSWIZZLE |
+					       MODE_COL_AA |
+					       MODE_MONO_LUMA,
+					       val);
+	if (ret) {
+		dev_err(&bl->dev, "error setting color mode: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct backlight_ops hx8837_bl_ops = {
+	.update_status = hx8837_bl_update_status,
+};
+
+static const struct regmap_config hx8837_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = 0x4c,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+};
+
+static int hx8837_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct backlight_properties bl_props = {
+		.type = BACKLIGHT_RAW,
+		.max_brightness = 0xf,
+	};
+	struct device *dev = &client->dev;
+	struct backlight_device *bl;
+	struct hx8837_priv *priv;
+	unsigned int val;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+
+	priv->load_gpio = devm_gpiod_get(dev, "load", GPIOD_ASIS);
+	if (IS_ERR(priv->load_gpio))
+		return PTR_ERR(priv->load_gpio);
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1,
+					  &priv->panel, NULL);
+	if (ret)
+		return ret;
+
+	if (priv->panel->backlight) {
+		dev_err(dev, "the panel already has a backlight controller\n");
+		return -ENODEV;
+	}
+
+	priv->panel_bridge = devm_drm_panel_bridge_add(dev, priv->panel);
+	if (IS_ERR(priv->panel_bridge))
+		return PTR_ERR(priv->panel_bridge);
+
+	priv->regmap = devm_regmap_init_i2c(client, &hx8837_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(priv->regmap);
+	}
+
+	ret = regmap_read(priv->regmap, DCON_REG_ID, &val);
+	if (ret < 0) {
+		dev_err(dev, "error reading the model id: %d\n", ret);
+		return ret;
+	}
+	if ((val & 0xff00) != 0xdc00) {
+		dev_err(dev, "the device is not a hx8837\n");
+		return -ENODEV;
+	}
+
+	ret = regmap_read(priv->regmap, DCON_REG_BRIGHT, &val);
+	if (ret < 0) {
+		dev_err(&bl->dev, "error getting the backlight: %d\n", ret);
+		return ret;
+	}
+	bl_props.brightness = val & 0xf;
+
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, priv,
+					    &hx8837_bl_ops, &bl_props);
+	if (IS_ERR(bl)) {
+		dev_err(dev, "failed to register backlight\n");
+		return PTR_ERR(bl);
+	}
+
+	priv->panel->backlight = bl;
+
+	INIT_LIST_HEAD(&priv->bridge.list);
+	priv->bridge.funcs = &hx8837_bridge_funcs;
+	priv->bridge.of_node = dev->of_node;
+	drm_bridge_add(&priv->bridge);
+
+	dev_info(dev, "HiMax HX8837 Display Controller Driver\n");
+	return 0;
+}
+
+static int hx8837_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct hx8837_priv *priv = dev_get_drvdata(dev);
+
+	drm_bridge_remove(&priv->bridge);
+	priv->panel->backlight = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id hx8837_dt_ids[] = {
+	{ .compatible = "himax,hx8837", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hx8837_dt_ids);
+
+static const struct i2c_device_id hx8837_ids[] = {
+	{ "hx8837", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, hx8837_ids);
+
+static struct i2c_driver hx8837_driver = {
+	.probe = hx8837_probe,
+	.remove = hx8837_remove,
+	.driver = {
+		.name = "hx8837",
+		.of_match_table = of_match_ptr(hx8837_dt_ids),
+	},
+	.id_table = hx8837_ids,
+};
+
+module_i2c_driver(hx8837_driver);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("HiMax HX8837 Display Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
