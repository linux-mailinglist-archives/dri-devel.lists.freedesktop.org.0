Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D70203FE91C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 08:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B30C6E44E;
	Thu,  2 Sep 2021 06:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Wed, 01 Sep 2021 18:12:36 UTC
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7499D6E249
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:12:36 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4H0Bq836yLz4x1L2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:07:32 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="UvA7hYi6"
Date: Wed, 01 Sep 2021 18:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630519646;
 bh=HBk9fXJFtDHUKwFqI798Cs0t0peM1GIbMvDx1aclnB4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UvA7hYi6TZglLGWOTH1bAXuh058Xc6FBVUemkRi2BeWfWQcra6HYMy2+usvoKrYNE
 1e/I0/jOrM7XIJbr1r1NFRzXQP2dKYDC4O8jcl0KSAQJ/d86LcyXryqSh/BuvXCIjO
 ZBW+Qx9zsXwqa8qBkq5t6DqtE990q5m+RucKJ1WY=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/panel: Add driver for LG.Philips SW43101 DSI video
 mode panel
Message-ID: <20210901180644.248177-2-y.oudjana@protonmail.com>
In-Reply-To: <20210901180644.248177-1-y.oudjana@protonmail.com>
References: <20210901180644.248177-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Thu, 02 Sep 2021 06:08:04 +0000
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
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lgphilips-sw43101.c   | 331 ++++++++++++++++++
 3 files changed, 342 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lgphilips-sw43101.c

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
index 000000000000..ca8acd7590d2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lgphilips-sw43101.c
@@ -0,0 +1,331 @@
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
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct sw43101_device {
+=09struct drm_panel panel;
+=09struct mipi_dsi_device *dsi;
+=09struct gpio_desc *reset_gpio;
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


