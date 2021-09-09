Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636A404489
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 06:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4FC6E439;
	Thu,  9 Sep 2021 04:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6E56E44B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 04:40:18 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4H4mX03rwKz4x38B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 04:40:16 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="oHS0srMr"
Date: Thu, 09 Sep 2021 04:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1631162410;
 bh=PZ6HBgkuXibr0gRzhr0DQAD1QhPhDCggyHpEpVtWVyw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=oHS0srMrivQME6VWgmFuKvFB3f5wEOzYe55+b5jwHK2thu3fEberN0KhgB+OMmUTV
 KPDSjTFurtQyM+zdyhNi4Wj32AIrRSqdAzvZ+5YPJu+QcT6bmKFPHKa2k1UNyKIAIw
 nBCBsr08Ut5qzoFlF2XFaSCm/PLnREkm+bw2GOK4=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/panel: Add driver for LG.Philips SW43101 DSI video
 mode panel
Message-ID: <20210909043904.12982-2-y.oudjana@protonmail.com>
In-Reply-To: <20210909043904.12982-1-y.oudjana@protonmail.com>
References: <20210909043904.12982-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver for the LG.Philips SW43101 FHD (1080x1920) OLED DSI video mode=
 panel.
This driver has been generated using linux-mdss-dsi-panel-driver-generator.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Changes since v1:
 - Add regulator support.
 - Add MAINTAINERS entry.

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lgphilips-sw43101.c   | 363 ++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lgphilips-sw43101.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f58dad1a1922..46431e8ad373 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5899,6 +5899,11 @@ S:=09Orphan / Obsolete
 F:=09drivers/gpu/drm/i810/
 F:=09include/uapi/drm/i810_drm.h
=20
+DRM DRIVER FOR LG.PHILIPS SW43101 PANEL
+M:=09Yassine Oudjana <y.oudjana@protonmail.com>
+S:=09Maintained
+F:=09drivers/gpu/drm/panel/panel-lgphilips-sw43101.c
+
 DRM DRIVER FOR LVDS PANELS
 M:=09Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:=09dri-devel@lists.freedesktop.org
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index beb581b96ecd..d8741c35bbfc 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -226,6 +226,16 @@ config DRM_PANEL_SAMSUNG_LD9040
 =09depends on OF && SPI
 =09select VIDEOMODE_HELPERS
=20
+config DRM_PANEL_LGPHILIPS_SW43101
+=09tristate "LG.Philips SW43101 DSI video mode panel"
+=09depends on OF
+=09depends on DRM_MIPI_DSI
+=09depends on BACKLIGHT_CLASS_DEVICE
+=09help
+=09  Say Y here if you want to enable support for the LG.Philips SW43101 F=
HD
+=09  (1080x1920) OLED DSI video mode panel found on the Xiaomi Mi Note 2.
+=09  To compile this driver as a module, choose M here.
+
 config DRM_PANEL_LG_LB035Q02
 =09tristate "LG LB035Q024573 RGB panel"
 =09depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefil=
e
index c8132050bcec..e79143ad14dd 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) +=3D panel-khadas-ts=
050.o
 obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) +=3D panel-kingdisplay-kd097d=
04.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) +=3D panel-leadtek-ltk050h314=
6w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) +=3D panel-leadtek-ltk500hd18=
29.o
+obj-$(CONFIG_DRM_PANEL_LGPHILIPS_SW43101) +=3D panel-lgphilips-sw43101.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) +=3D panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) +=3D panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) +=3D panel-nec-nl8048hl11.o
diff --git a/drivers/gpu/drm/panel/panel-lgphilips-sw43101.c b/drivers/gpu/=
drm/panel/panel-lgphilips-sw43101.c
new file mode 100644
index 000000000000..b7adf1d4a8ab
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lgphilips-sw43101.c
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LG.Philips SW43101 OLED Panel driver
+ * Generated with linux-mdss-dsi-panel-driver-generator
+ *
+ * Copyright (c) 2020 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
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
+
+static const char * const regulator_names[] =3D {
+=09"vdd",
+=09"avdd",
+=09"elvdd",
+=09"elvss",
+};
+
+struct sw43101_device {
+=09struct drm_panel panel;
+=09struct mipi_dsi_device *dsi;
+=09struct gpio_desc *reset_gpio;
+=09struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
+=09bool prepared;
+};
+
+static inline
+struct sw43101_device *to_sw43101_device(struct drm_panel *panel)
+{
+=09return container_of(panel, struct sw43101_device, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, seq...) do {=09=09=09=09\
+=09=09static const u8 d[] =3D { seq };=09=09=09=09\
+=09=09int ret;=09=09=09=09=09=09\
+=09=09ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));=09\
+=09=09if (ret < 0)=09=09=09=09=09=09\
+=09=09=09return ret;=09=09=09=09=09\
+=09} while (0)
+
+static void sw43101_reset(struct sw43101_device *ctx)
+{
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09usleep_range(10000, 11000);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09usleep_range(1000, 2000);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09msleep(20);
+}
+
+static int sw43101_on(struct sw43101_device *ctx)
+{
+=09struct mipi_dsi_device *dsi =3D ctx->dsi;
+=09struct device *dev =3D &dsi->dev;
+=09int ret;
+
+=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+=09dsi_dcs_write_seq(dsi, 0xb0, 0x5a);
+=09usleep_range(1000, 2000);
+=09dsi_dcs_write_seq(dsi, 0xb2, 0x13, 0x12, 0x40, 0xd0, 0xff, 0xff, 0x15);
+=09dsi_dcs_write_seq(dsi, 0xe3, 0x01);
+=09usleep_range(1000, 2000);
+=09dsi_dcs_write_seq(dsi, 0xf3, 0x03, 0x00, 0x00);
+
+=09ret =3D mipi_dsi_dcs_set_display_brightness(dsi, 0x0020);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to set display brightness: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+=09dsi_dcs_write_seq(dsi, 0xb0, 0x00);
+=09usleep_range(1000, 2000);
+
+=09ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+=09=09return ret;
+=09}
+=09msleep(120);
+
+=09ret =3D mipi_dsi_dcs_set_display_on(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to set display on: %d\n", ret);
+=09=09return ret;
+=09}
+=09msleep(20);
+
+=09return 0;
+}
+
+static int sw43101_off(struct sw43101_device *ctx)
+{
+=09struct mipi_dsi_device *dsi =3D ctx->dsi;
+=09struct device *dev =3D &dsi->dev;
+=09int ret;
+
+=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+=09ret =3D mipi_dsi_dcs_set_display_off(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to set display off: %d\n", ret);
+=09=09return ret;
+=09}
+=09usleep_range(2000, 3000);
+
+=09ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+=09=09return ret;
+=09}
+=09msleep(128);
+
+=09return 0;
+}
+
+static int sw43101_prepare(struct drm_panel *panel)
+{
+=09struct sw43101_device *ctx =3D to_sw43101_device(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09if (ctx->prepared)
+=09=09return 0;
+
+=09ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies)=
;
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to enable regulators: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09sw43101_reset(ctx);
+
+=09ret =3D sw43101_on(ctx);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
+=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09=09return ret;
+=09}
+
+=09ctx->prepared =3D true;
+=09return 0;
+}
+
+static int sw43101_unprepare(struct drm_panel *panel)
+{
+=09struct sw43101_device *ctx =3D to_sw43101_device(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09if (!ctx->prepared)
+=09=09return 0;
+
+=09ret =3D sw43101_off(ctx);
+=09if (ret < 0)
+=09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+=09ret =3D regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies=
);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to disable regulators: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ctx->prepared =3D false;
+=09return 0;
+}
+
+static const struct drm_display_mode sw43101_mode =3D {
+=09.clock =3D (1080 + 56 + 8 + 60) * (1920 + 40 + 8 + 48) * 58 / 1000,
+=09.hdisplay =3D 1080,
+=09.hsync_start =3D 1080 + 56,
+=09.hsync_end =3D 1080 + 56 + 8,
+=09.htotal =3D 1080 + 56 + 8 + 60,
+=09.vdisplay =3D 1920,
+=09.vsync_start =3D 1920 + 40,
+=09.vsync_end =3D 1920 + 40 + 8,
+=09.vtotal =3D 1920 + 40 + 8 + 48,
+=09.width_mm =3D 71,
+=09.height_mm =3D 126,
+};
+
+static int sw43101_get_modes(struct drm_panel *panel,
+=09=09=09=09     struct drm_connector *connector)
+{
+=09struct drm_display_mode *mode;
+
+=09mode =3D drm_mode_duplicate(connector->dev, &sw43101_mode);
+=09if (!mode)
+=09=09return -ENOMEM;
+
+=09drm_mode_set_name(mode);
+
+=09mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+=09connector->display_info.width_mm =3D mode->width_mm;
+=09connector->display_info.height_mm =3D mode->height_mm;
+=09drm_mode_probed_add(connector, mode);
+
+=09return 1;
+}
+
+static const struct drm_panel_funcs sw43101_panel_funcs =3D {
+=09.prepare =3D sw43101_prepare,
+=09.unprepare =3D sw43101_unprepare,
+=09.get_modes =3D sw43101_get_modes,
+};
+
+static int sw43101_bl_update_status(struct backlight_device *bl)
+{
+=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
+=09u16 brightness =3D bl->props.brightness;
+=09int ret;
+
+=09if (bl->props.power !=3D FB_BLANK_UNBLANK ||
+=09    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
+=09    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+=09=09brightness =3D 0;
+
+=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+=09ret =3D mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+=09if (ret < 0)
+=09=09return ret;
+
+=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+=09return 0;
+}
+
+static int sw43101_bl_get_brightness(struct backlight_device *bl)
+{
+=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
+=09u16 brightness =3D bl->props.brightness;
+=09int ret;
+
+=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+=09ret =3D mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+=09if (ret < 0)
+=09=09return ret;
+
+=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+=09return brightness & 0xff;
+}
+
+static const struct backlight_ops sw43101_bl_ops =3D {
+=09.update_status =3D sw43101_bl_update_status,
+=09.get_brightness =3D sw43101_bl_get_brightness,
+};
+
+static struct backlight_device *
+sw43101_create_backlight(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09struct backlight_properties props =3D {
+=09=09.type =3D BACKLIGHT_RAW,
+=09=09.brightness =3D 255,
+=09=09.max_brightness =3D 255,
+=09};
+
+=09return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+=09=09=09=09=09      &sw43101_bl_ops, &props);
+}
+
+static int sw43101_probe(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09struct sw43101_device *ctx;
+=09size_t i;
+=09int ret;
+
+=09ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+=09if (!ctx)
+=09=09return -ENOMEM;
+
+=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+=09if (IS_ERR(ctx->reset_gpio))
+=09=09return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+=09=09=09=09     "Failed to get reset-gpios\n");
+
+=09for (i =3D 0; i < ARRAY_SIZE(ctx->supplies); ++i)
+=09=09ctx->supplies[i].supply =3D regulator_names[i];
+
+=09ret =3D devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
+=09=09=09=09      ctx->supplies);
+=09if (ret < 0) {
+=09=09dev_err(&dsi->dev, "Failed to get regulators\n");
+=09=09return ret;
+=09}
+
+=09ctx->dsi =3D dsi;
+=09mipi_dsi_set_drvdata(dsi, ctx);
+
+=09dsi->lanes =3D 4;
+=09dsi->format =3D MIPI_DSI_FMT_RGB888;
+=09dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS=
;
+
+=09drm_panel_init(&ctx->panel, dev, &sw43101_panel_funcs,
+=09=09       DRM_MODE_CONNECTOR_DSI);
+
+=09ctx->panel.backlight =3D sw43101_create_backlight(dsi);
+=09if (IS_ERR(ctx->panel.backlight))
+=09=09return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+=09=09=09=09     "Failed to create backlight\n");
+
+=09drm_panel_add(&ctx->panel);
+
+=09ret =3D mipi_dsi_attach(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09return 0;
+}
+
+static int sw43101_remove(struct mipi_dsi_device *dsi)
+{
+=09struct sw43101_device *ctx =3D mipi_dsi_get_drvdata(dsi);
+=09int ret;
+
+=09ret =3D mipi_dsi_detach(dsi);
+=09if (ret < 0)
+=09=09dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+=09drm_panel_remove(&ctx->panel);
+
+=09return 0;
+}
+
+static const struct of_device_id sw43101_of_match[] =3D {
+=09{ .compatible =3D "lgphilips,sw43101" },
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sw43101_of_match);
+
+static struct mipi_dsi_driver sw43101_driver =3D {
+=09.probe =3D sw43101_probe,
+=09.remove =3D sw43101_remove,
+=09.driver =3D {
+=09=09.name =3D "panel-lgphilips-sw43101",
+=09=09.of_match_table =3D sw43101_of_match,
+=09},
+};
+module_mipi_dsi_driver(sw43101_driver);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("LG.Philips SW43101 DSI video mode panel driver");
+MODULE_LICENSE("GPL v2");
--=20
2.33.0


