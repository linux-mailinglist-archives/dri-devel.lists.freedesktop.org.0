Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FA3C28D3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670796E910;
	Fri,  9 Jul 2021 18:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27526E910
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:01:34 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id b4dfcc8e-e0df-11eb-8d1a-0050568cd888;
 Fri, 09 Jul 2021 18:01:38 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 57B96194B04;
 Fri,  9 Jul 2021 20:01:41 +0200 (CEST)
Date: Fri, 9 Jul 2021 20:01:30 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
Message-ID: <YOiO+qmznIsvagPA@ravnborg.org>
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210707234315.242663-2-linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Thu, Jul 08, 2021 at 01:43:15AM +0200, Linus Walleij wrote:
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
> 
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
> 
> The display optionally supports internal backlight control, but can
> also use an external backlight.
> 
> This driver re-uses the DBI infrastructure to communicate with the
> display.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for being late here. Some backlight related comments in the
following. The rest looks good.

	Sam

> ---
> ChangeLog v2->v3:
> - Drop the ws2401_command() macro - we enhanced the
>   mipi_dbi_command() to print errors for everyone instead.
> - Read out MTP properly (used wrong variables)
> - Register internal backlight if and only if the panel->backlight
>   field is NULL after trying to look up external backlight.
> ChangeLog v1->v2:
> - Disable the backlight in ->unprepare() before entering sleep
>   mode.
> - If we are not using internal backlight, close the L2 access
>   after initializing.
> - Depromote some talkative dev_info()s to dev_dbg().
> - Power up and read the MTP values before we register the display.
>   This works fine and is probably how MTP is supposed to work.
> - Fix the set-up of gamma values, this was found in the GT-I8160 HD
>   kernel tree.
> - Bail out properly if drm_panel_of_backlight() returns
>   -EDEFER_PROBE.
> - Drop OF from dependencies since drm_panel_of_backlight() has
>   static inline stubs in the header file.
> - Sort MAINTAINERS properly.
> - Alphabetize includes
> - Use format specifier %#02x so we get 0x... output in debug
> - Drop unnecessary braces around if () in debug macro
> - Drop unused <of.h> include.
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-widechips-ws2401.c    | 436 ++++++++++++++++++
>  4 files changed, 453 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-widechips-ws2401.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..10bba4be1678 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5956,6 +5956,13 @@ T:	git git://people.freedesktop.org/~sroland/linux
>  F:	drivers/gpu/drm/vmwgfx/
>  F:	include/uapi/drm/vmwgfx_drm.h
>  
> +DRM DRIVER FOR WIDECHIPS WS2401 PANELS
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> +F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c
> +
>  DRM DRIVERS
>  M:	David Airlie <airlied@linux.ie>
>  M:	Daniel Vetter <daniel@ffwll.ch>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4894913936e9..319fa44c4bc9 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -552,6 +552,15 @@ config DRM_PANEL_VISIONOX_RM69299
>  	  Say Y here if you want to enable support for Visionox
>  	  RM69299  DSI Video Mode panel.
>  
> +config DRM_PANEL_WIDECHIPS_WS2401
> +	tristate "Widechips WS2401 DPI panel driver"
> +	depends on SPI && GPIOLIB
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DBI
> +	help
> +	  Say Y here if you want to enable support for the Widechips WS2401 DPI
> +	  480x800 display controller used in panels such as Samsung LMS380KF01.
Maybe add "e.g. found in the Samsung GT-I8160 (Codina) mobile phone"
As I assume this will be the most frequent user anyway.

> +
>  config DRM_PANEL_XINPENG_XPP055C272
>  	tristate "Xinpeng XPP055C272 panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index cae4d976c069..d94c27df17aa 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -58,4 +58,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>  obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
> +obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
> new file mode 100644
> index 000000000000..95825063f812
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panel driver for the WideChips WS2401 480x800 DPI RGB panel, used in
> + * the Samsung Mobile Display (SMD) LMS380KF01.
> + * Found in the Samsung Galaxy Ace 2 GT-I8160 mobile phone.
> + * Linus Walleij <linus.walleij@linaro.org>
> + * Inspired by code and know-how in the vendor driver by Gareth Phillips.
> + */
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +
> +#define WS2401_RESCTL			0xb8 /* Resolution select control */
> +#define WS2401_PSMPS			0xbd /* SMPS positive control */
> +#define WS2401_NSMPS			0xbe /* SMPS negative control */
> +#define WS2401_SMPS			0xbf
> +#define WS2401_BCMODE			0xc1 /* Backlight control mode */
> +#define WS2401_WRBLCTL			0xc3 /* Backlight control */
> +#define WS2401_WRDISBV			0xc4 /* Write manual brightness */
> +#define WS2401_WRCTRLD			0xc6 /* Write BL control */
> +#define WS2401_WRMIE			0xc7 /* Write MIE mode */
> +#define WS2401_READ_ID1			0xda /* Read panel ID 1 */
> +#define WS2401_READ_ID2			0xdb /* Read panel ID 2 */
> +#define WS2401_READ_ID3			0xdc /* Read panel ID 3 */
> +#define WS2401_GAMMA_R1			0xe7 /* Gamma red 1 */
> +#define WS2401_GAMMA_G1			0xe8 /* Gamma green 1 */
> +#define WS2401_GAMMA_B1			0xe9 /* Gamma blue 1 */
> +#define WS2401_GAMMA_R2			0xea /* Gamma red 2 */
> +#define WS2401_GAMMA_G2			0xeb /* Gamma green 2 */
> +#define WS2401_GAMMA_B2			0xec /* Gamma blue 2 */
> +#define WS2401_PASSWD1			0xf0 /* Password command for level 2 */
> +#define WS2401_DISCTL			0xf2 /* Display control */
> +#define WS2401_PWRCTL			0xf3 /* Power control */
> +#define WS2401_VCOMCTL			0xf4 /* VCOM control */
> +#define WS2401_SRCCTL			0xf5 /* Source control */
> +#define WS2401_PANELCTL			0xf6 /* Panel control */
> +
> +static const u8 ws2401_dbi_read_commands[] = {
> +	WS2401_READ_ID1,
> +	WS2401_READ_ID2,
> +	WS2401_READ_ID3,
> +	0, /* sentinel */
> +};
> +
> +/**
> + * struct ws2401 - state container for a panel controlled by the WS2401
> + * controller
> + */
> +struct ws2401 {
> +	/** @dev: the container device */
> +	struct device *dev;
> +	/** @dbi: the DBI bus abstraction handle */
> +	struct mipi_dbi dbi;
> +	/** @panel: the DRM panel instance for this device */
> +	struct drm_panel panel;
> +	/** @width: the width of this panel in mm */
> +	u32 width;
> +	/** @height: the height of this panel in mm */
> +	u32 height;
> +	/** @reset: reset GPIO line */
> +	struct gpio_desc *reset;
> +	/** @regulators: VCCIO and VIO supply regulators */
> +	struct regulator_bulk_data regulators[2];
> +	/** @bl: Backlight, if using internal backlight */
> +	struct backlight_device *bl;
> +};
> +
> +static const struct drm_display_mode lms380kf01_480_800_mode = {
> +	/*
> +	 * The vendor driver states that the "SMD panel" has a clock
> +	 * frequency of 49920000 Hz / 2 = 24960000 Hz.
> +	 */
> +	.clock = 24960,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 8,
> +	.hsync_end = 480 + 8 + 10,
> +	.htotal = 480 + 8 + 10 + 8,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 8,
> +	.vsync_end = 800 + 8 + 2,
> +	.vtotal = 800 + 8 + 2 + 18,
> +	.width_mm = 50,
> +	.height_mm = 84,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static inline struct ws2401 *to_ws2401(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ws2401, panel);
> +}
> +
> +static void ws2401_read_mtp_id(struct ws2401 *ws)
> +{
> +	struct mipi_dbi *dbi = &ws->dbi;
> +	u8 id1, id2, id3;
> +	int ret;
> +
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 1\n");
> +		return;
> +	}
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id2);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 2\n");
> +		return;
> +	}
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id3);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 3\n");
> +		return;
> +	}
> +	dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
> +}
> +
> +static int ws2401_power_on(struct ws2401 *ws)
> +{
> +	struct mipi_dbi *dbi = &ws->dbi;
> +	int ret;
> +
> +	/* Power up */
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ws->regulators),
> +				    ws->regulators);
> +	if (ret) {
> +		dev_err(ws->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(10);
> +
> +	/* Assert reset >=1 ms */
> +	gpiod_set_value_cansleep(ws->reset, 1);
> +	usleep_range(1000, 5000);
> +	/* De-assert reset */
> +	gpiod_set_value_cansleep(ws->reset, 0);
> +	/* Wait >= 10 ms */
> +	msleep(10);
> +	dev_dbg(ws->dev, "de-asserted RESET\n");
> +
> +	/*
> +	 * Exit sleep mode and initialize display - some hammering is
> +	 * necessary.
> +	 */
> +	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(50);
> +
> +	/* Magic to unlock level 2 control of the display */
> +	mipi_dbi_command(dbi, WS2401_PASSWD1, 0x5a, 0x5a);
> +	/* Configure resolution to 480RGBx800 */
> +	mipi_dbi_command(dbi, WS2401_RESCTL, 0x12);
> +	/* Set addressing mode Flip V(d0), Flip H(d1) RGB/BGR(d3) */
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x01);
> +	/* Set pixel format: 24 bpp */
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, 0x70);
> +	mipi_dbi_command(dbi, WS2401_SMPS, 0x00, 0x0f);
> +	mipi_dbi_command(dbi, WS2401_PSMPS, 0x06, 0x03, /* DDVDH: 4.6v */
> +			 0x7e, 0x03, 0x12, 0x37);
> +	mipi_dbi_command(dbi, WS2401_NSMPS, 0x06, 0x03, /* DDVDH: -4.6v */
> +			 0x7e, 0x02, 0x15, 0x37);
> +	mipi_dbi_command(dbi, WS2401_SMPS, 0x02, 0x0f);
> +	mipi_dbi_command(dbi, WS2401_PWRCTL, 0x10, 0xA9, 0x00, 0x01, 0x44,
> +			 0xb4,	/* VGH:16.1v, VGL:-13.8v */
> +			 0x50,	/* GREFP:4.2v (default) */
> +			 0x50,	/* GREFN:-4.2v (default) */
> +			 0x00,
> +			 0x44);	/* VOUTL:-10v (default) */
> +	mipi_dbi_command(dbi, WS2401_DISCTL, 0x01, 0x00, 0x00, 0x00, 0x14,
> +			 0x16);
> +	mipi_dbi_command(dbi, WS2401_VCOMCTL, 0x30, 0x53, 0x53);
> +	mipi_dbi_command(dbi, WS2401_SRCCTL, 0x03, 0x0C, 0x00, 0x00, 0x00,
> +			 0x01,	/* 2 dot inversion */
> +			 0x01, 0x06, 0x03);
> +	mipi_dbi_command(dbi, WS2401_PANELCTL, 0x14, 0x00, 0x80, 0x00);
> +	mipi_dbi_command(dbi, WS2401_WRMIE, 0x01);
> +
> +	/* Set up gamma, probably these are P-gamma and N-gamma for each color */
> +	mipi_dbi_command(dbi, WS2401_GAMMA_R1, 0x00,
> +			 0x5b, 0x42, 0x41, 0x3f, 0x42, 0x3d, 0x38, 0x2e,
> +			 0x2b, 0x2a, 0x27, 0x22, 0x27, 0x0f, 0x00, 0x00);
> +	mipi_dbi_command(dbi, WS2401_GAMMA_R2, 0x00,
> +			 0x5b, 0x42, 0x41, 0x3f, 0x42, 0x3d, 0x38, 0x2e,
> +			 0x2b, 0x2a, 0x27, 0x22, 0x27, 0x0f, 0x00, 0x00);
> +	mipi_dbi_command(dbi, WS2401_GAMMA_G1, 0x00,
> +			 0x59, 0x40, 0x3f, 0x3e, 0x41, 0x3d, 0x39, 0x2f,
> +			 0x2c, 0x2b, 0x29, 0x25, 0x29, 0x19, 0x08, 0x00);
> +	mipi_dbi_command(dbi, WS2401_GAMMA_G2, 0x00,
> +			 0x59, 0x40, 0x3f, 0x3e, 0x41, 0x3d, 0x39, 0x2f,
> +			 0x2c, 0x2b, 0x29, 0x25, 0x29, 0x19, 0x08, 0x00);
> +	mipi_dbi_command(dbi, WS2401_GAMMA_B1, 0x00,
> +			 0x57, 0x3b, 0x3a, 0x3b, 0x3f, 0x3b, 0x38, 0x27,
> +			 0x38, 0x2a, 0x26, 0x22, 0x34, 0x0c, 0x09, 0x00);
> +	mipi_dbi_command(dbi, WS2401_GAMMA_B2, 0x00,
> +			 0x57, 0x3b, 0x3a, 0x3b, 0x3f, 0x3b, 0x38, 0x27,
> +			 0x38, 0x2a, 0x26, 0x22, 0x34, 0x0c, 0x09, 0x00);
> +
> +	if (ws->bl) {
> +		mipi_dbi_command(dbi, WS2401_WRCTRLD, 0x2c);
> +	} else {
> +		mipi_dbi_command(dbi, WS2401_WRCTRLD, 0x00);
> +		/*
> +		 * When not using internal backlight we do not need any further
> +		 * L2 accesses to the panel so we close the door on our way out.
> +		 * Otherwise we need to leave the L2 door open.
> +		 */
> +		mipi_dbi_command(dbi, WS2401_PASSWD1, 0xa5, 0xa5);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ws2401_power_off(struct ws2401 *ws)
> +{
> +	/* Go into RESET and disable regulators */
> +	gpiod_set_value_cansleep(ws->reset, 1);
> +	return regulator_bulk_disable(ARRAY_SIZE(ws->regulators),
> +				      ws->regulators);
> +}
> +
> +static int ws2401_unprepare(struct drm_panel *panel)
> +{
> +	struct ws2401 *ws = to_ws2401(panel);
> +	struct mipi_dbi *dbi = &ws->dbi;
> +
> +	/* Make sure we disable backlight, if any */
> +	if (ws->bl)
> +		mipi_dbi_command(dbi, WS2401_WRCTRLD, 0x00);
> +	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
> +	msleep(120);
> +	return ws2401_power_off(to_ws2401(panel));
> +}
> +
> +static int ws2401_disable(struct drm_panel *panel)
> +{
> +	struct ws2401 *ws = to_ws2401(panel);
> +	struct mipi_dbi *dbi = &ws->dbi;
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
> +	msleep(25);
> +
> +	return 0;
> +}
> +
> +static int ws2401_prepare(struct drm_panel *panel)
> +{
> +	return ws2401_power_on(to_ws2401(panel));
> +}
> +
> +static int ws2401_enable(struct drm_panel *panel)
> +{
> +	struct ws2401 *ws = to_ws2401(panel);
> +	struct mipi_dbi *dbi = &ws->dbi;
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> +
> +	return 0;
> +}
> +
> +/**
> + * ws2401_get_modes() - return the mode
> + * @panel: the panel to get the mode for
> + * @connector: reference to the central DRM connector control structure
> + */
> +static int ws2401_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct ws2401 *ws = to_ws2401(panel);
> +	struct drm_display_mode *mode;
> +	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	/*
> +	 * We just support the LMS380KF01 so far, if we implement more panels
> +	 * this mode, the following connector display_info settings and
> +	 * probably the custom DCS sequences needs to selected based on what
> +	 * the target panel needs.
> +	 */
> +	mode = drm_mode_duplicate(connector->dev, &lms380kf01_480_800_mode);
> +	if (!mode) {
> +		dev_err(ws->dev, "failed to add mode\n");
> +		return -ENOMEM;
> +	}
> +
> +	connector->display_info.bpc = 8;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	connector->display_info.bus_flags =
> +		DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> +	drm_display_info_set_bus_formats(&connector->display_info,
> +					 &bus_format, 1);
> +
> +	drm_mode_set_name(mode);
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs ws2401_drm_funcs = {
> +	.disable = ws2401_disable,
> +	.unprepare = ws2401_unprepare,
> +	.prepare = ws2401_prepare,
> +	.enable = ws2401_enable,
> +	.get_modes = ws2401_get_modes,
> +};
> +
> +static int ws2401_set_brightness(struct backlight_device *bl)
> +{
> +	struct ws2401 *ws = bl_get_data(bl);
> +	struct mipi_dbi *dbi = &ws->dbi;
> +	u8 brightness = bl->props.brightness;
Use
	u8 brightness = backlight_get_brightness(bl);


backlight_get_brightness() retunrs an int, but you need an u8 for
mipi_dbi_command().


> +
> +	mipi_dbi_command(dbi, WS2401_WRDISBV, brightness);
> +
> +	return 0;
> +}
The idea is that all backlight handling is done in the update_status
function so enable and disable logic should also be here.
Like this:

	if (backlight_is_blank(bl))
		mipi_dbi_command(dbi, WS2401_WRCTRLD, 0x00);
	else
		mipi_dbi_command(dbi, WS2401_WRDISBV, brightness);


> +
> +static const struct backlight_ops ws2401_bl_ops = {
> +	.update_status = ws2401_set_brightness,
> +};
> +
> +static const struct backlight_properties ws2401_bl_props = {
> +	.type = BACKLIGHT_PLATFORM,
> +	.brightness = 120,
> +	.max_brightness = U8_MAX,
> +};
> +
> +static int ws2401_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct ws2401 *ws;
> +	int ret;
> +
> +	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
> +	if (!ws)
> +		return -ENOMEM;
> +	ws->dev = dev;
> +
> +	/*
> +	 * VCI   is the analog voltage supply
> +	 * VCCIO is the digital I/O voltage supply
> +	 */
> +	ws->regulators[0].supply = "vci";
> +	ws->regulators[1].supply = "vccio";
> +	ret = devm_regulator_bulk_get(dev,
> +				      ARRAY_SIZE(ws->regulators),
> +				      ws->regulators);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ws->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ws->reset)) {
> +		ret = PTR_ERR(ws->reset);
> +		return dev_err_probe(dev, ret, "no RESET GPIO\n");
> +	}
> +
> +	ret = mipi_dbi_spi_init(spi, &ws->dbi, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> +	ws->dbi.read_commands = ws2401_dbi_read_commands;
> +
> +	ws2401_power_on(ws);
> +	ws2401_read_mtp_id(ws);
> +	ws2401_power_off(ws);
> +
> +	drm_panel_init(&ws->panel, dev, &ws2401_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	ret = drm_panel_of_backlight(&ws->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get external backlight device\n");
> +
> +	if (!ws->panel.backlight) {
> +		dev_dbg(dev, "no external backlight, using internal backlight\n");
> +		ws->bl = devm_backlight_device_register(dev, "ws2401", dev, ws,
> +				&ws2401_bl_ops, &ws2401_bl_props);
Use ws->panel.backlight here, so you automagically have the calls to
enable and disable backlight.
And then use a simple bool flag to use in ws2401_power_on();


> +		if (IS_ERR(ws->bl))
> +			return dev_err_probe(dev, PTR_ERR(ws->bl),
> +				"failed to register backlight device\n");
> +		ws->panel.backlight = ws->bl;
> +	} else {
> +		dev_dbg(dev, "using external backlight\n");
> +	}
> +
> +	spi_set_drvdata(spi, ws);
> +
> +	drm_panel_add(&ws->panel);
> +	dev_dbg(dev, "added panel\n");
> +
> +	return 0;
> +}
> +
> +static int ws2401_remove(struct spi_device *spi)
> +{
> +	struct ws2401 *ws = spi_get_drvdata(spi);
> +
> +	drm_panel_remove(&ws->panel);
> +	return 0;
> +}
> +
> +/*
> + * Samsung LMS380KF01 is the one instance of this display controller that we
> + * know about, but if more are found, the controller can be parameterized
> + * here and used for other configurations.
> + */
> +static const struct of_device_id ws2401_match[] = {
> +	{ .compatible = "samsung,lms380kf01", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ws2401_match);
> +
> +static struct spi_driver ws2401_driver = {
> +	.probe		= ws2401_probe,
> +	.remove		= ws2401_remove,
> +	.driver		= {
> +		.name	= "ws2401-panel",
> +		.of_match_table = ws2401_match,
> +	},
> +};
> +module_spi_driver(ws2401_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("Samsung WS2401 panel driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.31.1
