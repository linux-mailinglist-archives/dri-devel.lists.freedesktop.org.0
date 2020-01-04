Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8601303DC
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 19:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865A589CB8;
	Sat,  4 Jan 2020 18:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8455E89CB8
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 18:25:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 006C220032;
 Sat,  4 Jan 2020 19:25:22 +0100 (CET)
Date: Sat, 4 Jan 2020 19:25:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Novatek NT35510-based panels
Message-ID: <20200104182521.GC8724@ravnborg.org>
References: <20191225115610.14518-1-linus.walleij@linaro.org>
 <20191225115610.14518-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191225115610.14518-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8 a=J2hWI5m9r4qbfL5FBt0A:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

Driver looks good.
Rahter complicated - but that what the controller/panel requires.
Lot's of good code comments - very nice.

A few comments in the following.

	Sam

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6db3889cb19..1372b4139ebd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5244,6 +5244,13 @@ F:	drivers/gpu/drm/msm/
>  F:	include/uapi/drm/msm_drm.h
>  F:	Documentation/devicetree/bindings/display/msm/
>  
> +DRM DRIVER FOR NOVATEK NT35510 PANELS
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +S:	Maintained
> +F:	drivers/gpu/drm/panel/panel-novatek-nt35510*
Unless you expect more files named panel-novatek-nt35510*  then use as
specific filename (no wildcard).

> +F:	Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
> +
>  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>  M:	Ben Skeggs <bskeggs@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 46e3c931e5d9..620a0fd1e816 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -127,6 +127,17 @@ config DRM_PANEL_NEC_NL8048HL11
>  	  panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
>  	  as a module, choose M here.
>  
> +config DRM_PANEL_NOVATEK_NT35510
> +	tristate "Novatek NT35510 RGB panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE

> +	select VIDEOMODE_HELPERS
Is this really needed? From a quick look you can drop it.

> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Novatek NT35510 display controller, such as some
> +	  Hydis panels.
> +
>  config DRM_PANEL_NOVATEK_NT39016
>  	tristate "Novatek NT39016 RGB/SPI panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> new file mode 100644
> index 000000000000..b312a8848c25
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -0,0 +1,1126 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Novatek NT35510 panel driver
> + * Copyright (C) 2019 Linus Walleij <linus.walleij@linaro.org>
> + * Based on code by Robert Teather (C) 2012 Samsung
> + *
> + * This display driver (and I refer to the physical component NT35510,
> + * not this Linux kernel software driver) can handle:
> + * 480x864, 480x854, 480x800, 480x720 and 480x640 pixel displays.
> + * It has 480x840x24bit SRAM embedded for storing a frame.
> + * When powered on the display is by default in 480x800 mode.
> + *
> + * The actual panels using this component have different names, but
> + * the code needed to set up and configure the panel will be similar,
> + * so they should all use the NT35510 driver with appropriate configuration
> + * per-panel, e.g. for physical size.
> + *
> + * This driver is for the DSI interface to panels using the NT35510.
> + *
> + * The NT35510 can also use an RGB (DPI) interface combined with an

> + * I2C or SPI interface for setting up the NT35510. If this is needed I
> + * this panel driver should be refactored to also support that use
An extra "I" sneaked in here.

> + * case.
> + */
You are using nice kernel-doc style comments.
Consider to wire this into Documentation/gpu/ somewhere.

> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/backlight.h>
> +
> +#include <video/mipi_display.h>
> +#include <video/of_videomode.h>
> +#include <video/videomode.h>
> +

Please structure includes like this:

#include <linux/*>

#include <video/*>

#include <drm/*>

#include ""

Within each block sort the include fiels alphabetically.

I think you can drop of_videomode.h and videomode.h.


> +#define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
> +#define MCS_CMD_READ_ID1	0xDA
> +#define MCS_CMD_READ_ID2	0xDB
> +#define MCS_CMD_READ_ID3	0xDC
> +#define MCS_CMD_MTP_READ_SETTING 0xF8 /* Uncertain about name */
> +#define MCS_CMD_MTP_READ_PARAM 0xFF /* Uncertain about name */

> + *
> + * Gamma correction arrays are 10bit numbers, two consecutive bytes
> + * makes out one point on the gamma correction curve. The points are
> + * not linearly placed along the X axis, we get points 0, 1, 3, 5
> + * 7, 11, 15, 23, 31, 47, 63, 95, 127, 128, 160, 192, 208, 224, 232,
> + * 240, 244, 248, 250, 252, 254, 255. The voltages tuples form
> + * V0, V1, V3 ... V255, with 0x0000 being the lowest voltage and
> + * 0x03FF being the highest voltage.
> + *
> + * Each value must be strictly lower than the next value forming a
                                  ^ higher?
> + * rising curve like this:
> + *
> + * ^
> + * |                                        V255
> + * |                                 V254
> + * |                         ....
> + * |                    V5
> + * |           V3
> + * |     V1
> + * | V0
> + * +------------------------------------------->
> + *
> + * The details about all settings can be found in the NT35510 Application
> + * Note.
> + */
> +struct nt35510_config {
> +	/**
> +	 * @width_mm: physical panel width [mm]
> +	 */
> +	u32 width_mm;
> +	/**
> +	 * @height_mm: physical panel height [mm]
> +	 */
> +	u32 height_mm;
> +	/**
> +	 * @mode: the display mode. This is only relevant outside the panel
> +	 * in video mode: in command mode this is configuring the internal
> +	 * timing in the display controller.
> +	 */
> +	const struct drm_display_mode mode;
> +	/**
> +	 * @avdd: setting for AVDD ranging from 0x00 = 6.5V to 0x14 = 4.5V
> +	 * in 0.1V steps the default is 0x05 which means 6.0V
> +	 */
> +	u8 avdd[NT35510_P1_AVDD_LEN];
> +	/**
> +	 * @bt1ctr: setting for boost power control for the AVDD step-up
> +	 * circuit (1)
> +	 * bits 0..2 in the lower nybble controls PCK, the booster clock
s/nybble/nibble/ ?
Both spellings works so this is bike-shedding.

> +	 * frequency for the step-up circuit:
> +	 * 0 = Hsync/32
> +	 * 1 = Hsync/16
> +	 * 2 = Hsync/8
> +	 * 3 = Hsync/4
> +	 * 4 = Hsync/2
> +	 * 5 = Hsync
> +	 * 6 = Hsync x 2
> +	 * 7 = Hsync x 4
> +	 * bits 4..6 in the upper nybble controls BTP, the boosting
> +	 * amplification for the the step-up circuit:
> +	 * 0 = Disable
> +	 * 1 = 1.5 x VDDB
> +	 * 2 = 1.66 x VDDB
> +	 * 3 = 2 x VDDB
> +	 * 4 = 2.5 x VDDB
> +	 * 5 = 3 x VDDB
> +	 * The defaults are 4 and 4 yielding 0x44
> +	 */

> +
> +/**
> + * struct nt35510 - state container for the NT35510 panel
> + */
> +struct nt35510 {
> +	/**
> +	 * @dev: the container device
> +	 */
> +	struct device *dev;
> +	/**
> +	 * @conf: the specific panel configuration, as the NT35510
> +	 * can be combined with many physical panels, they can have
> +	 * different physical dimensions and gamma correction etc,
> +	 * so this is stored in the config.
> +	 */
> +	const struct nt35510_config *conf;
> +	/**
> +	 * @panel: the DRM panel object for the instance
> +	 */
> +	struct drm_panel panel;
> +	/**
> +	 * @bl: backlight device
> +	 */
> +	struct backlight_device *bl;
We have a backlight device as part of drm_panel now.
It is documented that drivers should not assign it.

We should consider to allow this - then this driver could
just assign it and then the enable() and disable() functions
would not be required.


> +	/**
> +	 * @supplies: regulators supplying the panel
> +	 */
> +	struct regulator_bulk_data supplies[2];
> +	/**
> +	 * @reset_gpio: the reset line
> +	 */
> +	struct gpio_desc *reset_gpio;
> +};
> +

> +
> +	/* Toggle RESET in accordance with datasheet page 370 */
> +	if (nt->reset_gpio) {
> +		gpiod_set_value(nt->reset_gpio, 1);
> +		/* Active min 10 us according to datasheet, let's say 20 */
> +		usleep_range(20, 1000);
> +		gpiod_set_value(nt->reset_gpio, 0);
> +		/*
> +		 * 5 ms during sleep mode, 120 ms during sleep out mode
> +		 * according to datasheet, let's use 120-140 ms.
> +		 */
> +		usleep_range(120000, 140000);
> +	}
Add an URL to the data sheet maybe?


> +
> +	ret = nt35510_read_id(nt);
> +	if (ret)
> +		return ret;
> +
> +	/* Set up stuff in  manufacturer control, page 1 */
> +	ret = nt35510_send_long(nt, dsi, MCS_CMD_MAUCCTR,
> +				ARRAY_SIZE(nt35510_mauc_select_page_1),
> +				nt35510_mauc_select_page_1);
> +	if (ret)
> +		return ret;
> +
> +	ret = nt35510_setup_power(nt);
> +	if (ret)
> +		return ret;
> +
> +	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_POS,
> +				NT35510_P1_GAMMA_LEN,
> +				nt->conf->gamma_corr_pos_r);
> +	if (ret)
> +		return ret;
> +	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_POS,
> +				NT35510_P1_GAMMA_LEN,
> +				nt->conf->gamma_corr_pos_g);
> +	if (ret)
> +		return ret;
> +	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_POS,
> +				NT35510_P1_GAMMA_LEN,
> +				nt->conf->gamma_corr_pos_b);
> +	if (ret)
> +		return ret;
> +	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_NEG,
> +				NT35510_P1_GAMMA_LEN,
> +				nt->conf->gamma_corr_neg_r);
> +	if (ret)
> +		return ret;
> +	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_NEG,
> +				NT35510_P1_GAMMA_LEN,
> +				nt->conf->gamma_corr_neg_g);
> +	if (ret)
> +		return ret;
> +	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_NEG,
> +				NT35510_P1_GAMMA_LEN,
> +				nt->conf->gamma_corr_neg_b);
> +	if (ret)
> +		return ret;
> +
> +	/* Set up stuff in  manufacturer control, page 0 */
> +	ret = nt35510_send_long(nt, dsi, MCS_CMD_MAUCCTR,
> +				ARRAY_SIZE(nt35510_mauc_select_page_0),
> +				nt35510_mauc_select_page_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = nt35510_setup_display(nt);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}


> +
> +static int nt35510_get_modes(struct drm_panel *panel)
Add connector as argument to match drm-misc-next.

> +{
> +	struct drm_connector *connector = panel->connector;
> +	struct nt35510 *nt = panel_to_nt35510(panel);
> +	struct drm_display_mode *mode;
> +	struct drm_display_info *info;
> +
> +	info = &connector->display_info;
> +	info->width_mm = nt->conf->width_mm;
> +	info->height_mm = nt->conf->height_mm;
> +	mode = drm_mode_duplicate(panel->drm, &nt->conf->mode);
Use connector->dev - as panel no logner has a drm_device pointer.

> +	if (!mode) {
> +		DRM_ERROR("bad mode or failed to add mode\n");
> +		return -EINVAL;
> +	}
> +	drm_mode_set_name(mode);
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	mode->width_mm = nt->conf->width_mm;
> +	mode->height_mm = nt->conf->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1; /* Number of modes */
> +}

> +
> +static const struct of_device_id nt35510_of_match[] = {
> +	{
> +		.compatible = "hydis,hva40wv1",
> +		.data = &nt35510_hydis_hva40wv1,
> +	},
> +	{ }
Use { /* sentinel */ },

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
