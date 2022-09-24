Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6E5E9046
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 00:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FACC10E0B5;
	Sat, 24 Sep 2022 22:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3DF10E0B5
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 22:14:02 +0000 (UTC)
Date: Sat, 24 Sep 2022 22:13:44 +0000
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="jSCJVSpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1664057635; x=1664316835;
 bh=H/N6v3UkB8U8yS0Di3oPrka5jGoIg9yXLsUkdbYUri4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=jSCJVSpJbxI6oqDtqGYXM/6jep2l3iZQoIuE7WUBi6C1TgQNUooJ2EIh9b7/fmh2z
 ncLrmvQzVdILtFTjK7SKtkykxZPD6PZOQiC3J/FVDYLm33+qaebnmuyvQVfwwkrV1U
 /at71R8NXV+6gipkfac3Npht9dYi5+tHp3Xt0Bqs=
To: Nia Espera <a5b6@riseup.net>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 1/2] drivers: gpu: drm: add driver for samsung s6e3fc2x01
 cmd mode panel
Message-ID: <953bbd66-955a-c059-075f-9b7165be1c66@connolly.tech>
In-Reply-To: <20220924203616.63325-2-a5b6@riseup.net>
References: <20220924203616.63325-1-a5b6@riseup.net>
 <20220924203616.63325-2-a5b6@riseup.net>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/09/2022 21:36, Nia Espera wrote:
> Adds a dedicated driver for the Samsung s6e3fc2x01 panel used in OnePlus
> 6T smartphones which was previously driven by the sofef00 panel driver
>
> Signed-off-by: Nia Espera <a5b6@riseup.net>

Hi Nia,

Thanks for sending this, I'm glad to see proper support for this panel in i=
t's
own driver rather than the somewhat hacky solution I submitted originally.

There is just one note below, but otherwise:

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   MAINTAINERS                                   |   5 +
>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 395 ++++++++++++++++++
>   4 files changed, 412 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 936490dcc97b..7e9455ac5a13 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6630,6 +6630,11 @@ S:=09Maintained
>   F:=09Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.ya=
ml
>   F:=09drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
>
> +DRM DRIVER FOR SAMSUNG S6E3FC2X01 PANELS
> +M:=09Nia Espera <a5b6@riseup.net>
> +S:=09Maintained
> +F:=09drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
> +
>   DRM DRIVER FOR SITRONIX ST7703 PANELS
>   M:=09Guido G=C3=BCnther <agx@sigxcpu.org>
>   R:=09Purism Kernel Team <kernel@puri.sm>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfi=
g
> index 9a281120363c..ee62d5d8828a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -558,6 +558,17 @@ config DRM_PANEL_SAMSUNG_SOFEF00
>
>   =09  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
>
> +config DRM_PANEL_SAMSUNG_S6E3FC2X01
> +=09tristate "Samsung s6e3fc2x01 OnePlus 6T DSI cmd mode panel"
> +=09depends on OF
> +=09depends on DRM_MIPI_DSI
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09select VIDEOMODE_HELPERS
> +=09  Say Y or M here if you want to enable support for the Samsung AMOLE=
D
> +=09  command mode panel found in the OnePlus 6T smartphone.
> +
> +=09  The panel is 2340x1080@60Hz
> +
>   config DRM_PANEL_SEIKO_43WVF1G
>   =09tristate "Seiko 43WVF1G panel"
>   =09depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index 6d493b9d64fe..b54de8812e91 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) +=3D panel-=
samsung-s6e63m0-dsi.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) +=3D panel-samsung-s=
6e88a0-ams452ef01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) +=3D panel-samsung-sofef00.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FC2X01) +=3D panel-samsung-s6e3fc2x01=
.o
>   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-seiko-43wvf1g.o
>   obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx01.=
o
>   obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) +=3D panel-sharp-ls037v7dw01.=
o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c b/drivers/g=
pu/drm/panel/panel-samsung-s6e3fc2x01.c
> new file mode 100644
> index 000000000000..719907107bf1
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2022 Nia Espera <a5b6@riseup.net>
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor devi=
ce tree:
> +//   Copyright (c) 2022, The Linux Foundation. All rights reserved.

Please use C-style comments for this block (/* ... */), ignoring the SPDX i=
dentifier.
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/swab.h>
> +#include <linux/backlight.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct samsung_s6e3fc2x01 {
> +=09struct drm_panel panel;
> +=09struct mipi_dsi_device *dsi;
> +=09struct regulator *supply;
> +=09struct gpio_desc *reset_gpio;
> +=09const struct drm_display_mode *mode;
> +=09bool prepared;
> +};
> +
> +static inline
> +struct samsung_s6e3fc2x01 *to_samsung_s6e3fc2x01(struct drm_panel *panel=
)
> +{
> +=09return container_of(panel, struct samsung_s6e3fc2x01, panel);
> +}
> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {=09=09=09=09\
> +=09=09static const u8 d[] =3D { seq };=09=09=09=09\
> +=09=09int ret;=09=09=09=09=09=09\
> +=09=09ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));=09\
> +=09=09if (ret < 0)=09=09=09=09=09=09\
> +=09=09=09return ret;=09=09=09=09=09\
> +=09} while (0)
> +
> +static void samsung_s6e3fc2x01_reset(struct samsung_s6e3fc2x01 *ctx)
> +{
> +=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +=09usleep_range(5000, 6000);
> +=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +=09usleep_range(2000, 3000);
> +=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +=09usleep_range(10000, 11000);
> +}
> +
> +static int samsung_s6e3fc2x01_on(struct samsung_s6e3fc2x01 *ctx)
> +{
> +=09struct mipi_dsi_device *dsi =3D ctx->dsi;
> +=09struct device *dev =3D &dsi->dev;
> +=09int ret;
> +
> +=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
> +
> +=09ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +=09=09return ret;
> +=09}
> +=09usleep_range(10000, 11000);
> +
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x01);
> +=09dsi_dcs_write_seq(dsi, 0xcd, 0x01);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +=09usleep_range(15000, 16000);
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
> +
> +=09ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to set tear on: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xeb, 0x17, 0x41, 0x92, 0x0e, 0x10, 0x82, 0x5a=
);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +
> +=09ret =3D mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x0437);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to set column address: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x0923);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to set page address: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x09);
> +=09dsi_dcs_write_seq(dsi, 0xe8, 0x10, 0x30);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x07);
> +=09dsi_dcs_write_seq(dsi, 0xb7, 0x01);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x08);
> +=09dsi_dcs_write_seq(dsi, 0xb7, 0x12);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +=09dsi_dcs_write_seq(dsi, 0xfc, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x01);
> +=09dsi_dcs_write_seq(dsi, 0xe3, 0x88);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x07);
> +=09dsi_dcs_write_seq(dsi, 0xed, 0x67);
> +=09dsi_dcs_write_seq(dsi, 0xfc, 0xa5, 0xa5);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +=09usleep_range(1000, 2000);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xb3, 0x00, 0xc1);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +
> +=09ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to set display on: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09usleep_range(10000, 11000);
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
> +=09dsi_dcs_write_seq(dsi, 0x29);
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
> +
> +=09return 0;
> +}
> +
> +static int samsung_s6e3fc2x01_off(struct samsung_s6e3fc2x01 *ctx)
> +{
> +=09struct mipi_dsi_device *dsi =3D ctx->dsi;
> +=09struct device *dev =3D &dsi->dev;
> +=09int ret;
> +
> +=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0xa5, 0xa5);
> +
> +=09ret =3D mipi_dsi_dcs_set_display_off(dsi);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to set display off: %d\n", ret);
> +=09=09return ret;
> +=09}
> +=09usleep_range(10000, 11000);
> +
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09usleep_range(16000, 17000);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x50);
> +=09dsi_dcs_write_seq(dsi, 0xb9, 0x82);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +=09usleep_range(16000, 17000);
> +=09msleep(40);
> +
> +=09ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09dsi_dcs_write_seq(dsi, 0x9f, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x05);
> +=09dsi_dcs_write_seq(dsi, 0xf4, 0x01);
> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +=09msleep(160);
> +
> +=09return 0;
> +}
> +
> +static int samsung_s6e3fc2x01_prepare(struct drm_panel *panel)
> +{
> +=09struct samsung_s6e3fc2x01 *ctx =3D to_samsung_s6e3fc2x01(panel);
> +=09struct device *dev =3D &ctx->dsi->dev;
> +=09int ret;
> +
> +=09if (ctx->prepared)
> +=09=09return 0;
> +
> +=09ret =3D regulator_enable(ctx->supply);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to enable regulator: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09samsung_s6e3fc2x01_reset(ctx);
> +
> +=09ret =3D samsung_s6e3fc2x01_on(ctx);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +=09=09return ret;
> +=09}
> +
> +=09ctx->prepared =3D true;
> +=09return 0;
> +}
> +
> +static int samsung_s6e3fc2x01_unprepare(struct drm_panel *panel)
> +{
> +=09struct samsung_s6e3fc2x01 *ctx =3D to_samsung_s6e3fc2x01(panel);
> +=09struct device *dev =3D &ctx->dsi->dev;
> +=09int ret;
> +
> +=09if (!ctx->prepared)
> +=09=09return 0;
> +
> +=09ret =3D samsung_s6e3fc2x01_off(ctx);
> +=09if (ret < 0)
> +=09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +=09ctx->prepared =3D false;
> +=09return 0;
> +}
> +
> +static const struct drm_display_mode samsung_s6e3fc2x01_mode =3D {
> +=09.clock =3D (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> +=09.hdisplay =3D 1080,
> +=09.hsync_start =3D 1080 + 72,
> +=09.hsync_end =3D 1080 + 72 + 16,
> +=09.htotal =3D 1080 + 72 + 16 + 36,
> +=09.vdisplay =3D 2340,
> +=09.vsync_start =3D 2340 + 32,
> +=09.vsync_end =3D 2340 + 32 + 4,
> +=09.vtotal =3D 2340 + 32 + 4 + 18,
> +=09.width_mm =3D 68,
> +=09.height_mm =3D 145,
> +};
> +
> +static int samsung_s6e3fc2x01_get_modes(struct drm_panel *panel,
> +=09=09=09=09=09struct drm_connector *connector)
> +{
> +=09struct drm_display_mode *mode;
> +=09struct samsung_s6e3fc2x01 *ctx =3D to_samsung_s6e3fc2x01(panel);
> +
> +=09mode =3D drm_mode_duplicate(connector->dev, ctx->mode);
> +=09if (!mode)
> +=09=09return -ENOMEM;
> +
> +=09drm_mode_set_name(mode);
> +
> +=09mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +=09connector->display_info.width_mm =3D mode->width_mm;
> +=09connector->display_info.height_mm =3D mode->height_mm;
> +=09drm_mode_probed_add(connector, mode);
> +
> +=09return 1;
> +}
> +
> +static const struct drm_panel_funcs samsung_s6e3fc2x01_panel_funcs =3D {
> +=09.prepare =3D samsung_s6e3fc2x01_prepare,
> +=09.unprepare =3D samsung_s6e3fc2x01_unprepare,
> +=09.get_modes =3D samsung_s6e3fc2x01_get_modes,
> +};
> +
> +static int s6e3fc2x01_panel_bl_update_status(struct backlight_device *bl=
)
> +{
> +=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +=09int err;
> +=09u16 brightness;
> +
> +=09brightness =3D (u16)backlight_get_brightness(bl);
> +=09// This panel needs the high and low bytes swapped for the brightness=
 value
> +=09brightness =3D __swab16(brightness);
> +
> +=09err =3D mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +=09if (err < 0)
> +=09=09return err;
> +
> +=09return 0;
> +}
> +
> +static const struct backlight_ops s6e3fc2x01_panel_bl_ops =3D {
> +=09.update_status =3D s6e3fc2x01_panel_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +s6e3fc2x01_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +=09struct device *dev =3D &dsi->dev;
> +=09const struct backlight_properties props =3D {
> +=09=09.type =3D BACKLIGHT_PLATFORM,
> +=09=09.brightness =3D 1023,
> +=09=09.max_brightness =3D 1023,
> +=09};
> +
> +=09return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +=09=09=09=09=09      &s6e3fc2x01_panel_bl_ops, &props);
> +}
> +
> +static int samsung_s6e3fc2x01_probe(struct mipi_dsi_device *dsi)
> +{
> +=09struct device *dev =3D &dsi->dev;
> +=09struct samsung_s6e3fc2x01 *ctx;
> +=09int ret;
> +
> +=09ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +=09if (!ctx)
> +=09=09return -ENOMEM;
> +
> +=09ctx->mode =3D of_device_get_match_data(dev);
> +
> +=09if (!ctx->mode) {
> +=09=09dev_err(dev, "Missing device mode\n");
> +=09=09return -ENODEV;
> +=09}
> +
> +=09ctx->supply =3D devm_regulator_get(dev, "vddio");
> +=09if (IS_ERR(ctx->supply))
> +=09=09return dev_err_probe(dev, PTR_ERR(ctx->supply),
> +=09=09=09=09     "Failed to get vddio regulator\n");
> +
> +=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +=09if (IS_ERR(ctx->reset_gpio))
> +=09=09return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +=09=09=09=09     "Failed to get reset-gpios\n");
> +
> +=09ctx->dsi =3D dsi;
> +=09mipi_dsi_set_drvdata(dsi, ctx);
> +
> +=09dsi->lanes =3D 4;
> +=09dsi->format =3D MIPI_DSI_FMT_RGB888;
> +=09dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO_BURST |
> +=09=09=09  MIPI_DSI_MODE_NO_EOT_PACKET |
> +=09=09=09  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +=09drm_panel_init(&ctx->panel, dev, &samsung_s6e3fc2x01_panel_funcs,
> +=09=09       DRM_MODE_CONNECTOR_DSI);
> +
> +=09ctx->panel.backlight =3D s6e3fc2x01_create_backlight(dsi);
> +=09if (IS_ERR(ctx->panel.backlight))
> +=09=09return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +=09=09=09=09     "Failed to create backlight\n");
> +
> +=09drm_panel_add(&ctx->panel);
> +
> +=09ret =3D mipi_dsi_attach(dsi);
> +=09if (ret < 0) {
> +=09=09dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +=09=09drm_panel_remove(&ctx->panel);
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int samsung_s6e3fc2x01_remove(struct mipi_dsi_device *dsi)
> +{
> +=09struct samsung_s6e3fc2x01 *ctx =3D mipi_dsi_get_drvdata(dsi);
> +=09int ret;
> +
> +=09ret =3D mipi_dsi_detach(dsi);
> +=09if (ret < 0)
> +=09=09dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +=09drm_panel_remove(&ctx->panel);
> +
> +=09return 0;
> +}
> +
> +static const struct of_device_id samsung_s6e3fc2x01_of_match[] =3D {
> +=09{
> +=09=09.compatible =3D "samsung,s6e3fc2x01",
> +=09=09.data =3D &samsung_s6e3fc2x01_mode,
> +=09},
> +=09{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, samsung_s6e3fc2x01_of_match);
> +
> +static struct mipi_dsi_driver samsung_s6e3fc2x01_driver =3D {
> +=09.probe =3D samsung_s6e3fc2x01_probe,
> +=09.remove =3D samsung_s6e3fc2x01_remove,
> +=09.driver =3D {
> +=09=09.name =3D "panel-samsung-s6e3fc2x01",
> +=09=09.of_match_table =3D samsung_s6e3fc2x01_of_match,
> +=09},
> +};
> +module_mipi_dsi_driver(samsung_s6e3fc2x01_driver);
> +
> +MODULE_AUTHOR("Nia Espera <a5b6@riseup.net>");
> +MODULE_DESCRIPTION("DRM driver for OnePlus 6T Panel");
> +MODULE_LICENSE("GPL v2");
> --
> 2.37.3
>

--
Kind Regards,
Caleb

