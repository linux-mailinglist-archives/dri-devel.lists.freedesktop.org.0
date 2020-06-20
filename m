Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED342026CF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 23:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1A6E364;
	Sat, 20 Jun 2020 21:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9D26E364
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 21:25:35 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EEEDC20021;
 Sat, 20 Jun 2020 23:25:30 +0200 (CEST)
Date: Sat, 20 Jun 2020 23:25:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v4 3/5] drm: panel: Add Xingbangda XBD599 panel (ST7703
 controller)
Message-ID: <20200620212529.GB74146@ravnborg.org>
References: <20200617003209.670819-1-megous@megous.com>
 <20200617003209.670819-4-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617003209.670819-4-megous@megous.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=J_fg_7IlAAAA:8 a=e5mUnYsNAAAA:8
 a=CZxaQBYs-XTCjF4xyQEA:9 a=Ct-urWRizc0aH__f:21 a=vPcSdY6hgRCUou92:21
 a=CjuIK1q_8ugA:10 a=zGOw-GkVl6h1W4ZARoUA:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej et al.

On Wed, Jun 17, 2020 at 02:32:07AM +0200, Ondrej Jirman wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI IPS LCD panel made by
> Xingbangda, which is used on PinePhone final assembled phones.
> 
> It is based on Sitronix ST7703 LCD controller.

I am a little late to the game here - so sorry if this has been
discussed before.
We already have panel-rocktech-jh057n00900.c which is a panle driver
based on st7703.
Why is it we need a new driver?
Would it not be better to have one st7703 driver that suipports both
panels?

The driver would need dedicated init functions depending on the panel.
But a lot could also be shared.

	Sam

> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 535 ++++++++++++++++++
>  3 files changed, 546 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7703.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 39055c1f0e2f..b7bc157b0612 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -395,6 +395,16 @@ config DRM_PANEL_SITRONIX_ST7701
>  	  ST7701 controller for 480X864 LCD panels with MIPI/RGB/SPI
>  	  system interfaces.
>  
> +config DRM_PANEL_SITRONIX_ST7703
> +	tristate "Sitronix ST7703 panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Sitronix
> +	  ST7703 controller for 720X1440 LCD panels with MIPI/RGB/SPI
> +	  system interfaces.
> +
>  config DRM_PANEL_SITRONIX_ST7789V
>  	tristate "Sitronix ST7789V panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index de74f282c433..47f4789a8685 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) += panel-sharp-ls043t1le01.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
> +obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> new file mode 100644
> index 000000000000..dbd46b6c0b46
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -0,0 +1,535 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DRM driver for Sitronix ST7703 MIPI DSI panel
> + *
> + * Copyright (C) 2020 Ondrej Jirman <megous@megous.com>
> + * Copyright (C) 2019-2020 Icenowy Zheng <icenowy@aosc.io>
> + *
> + * Based on panel-rocktech-jh057n00900.c, which is:
> + *   Copyright (C) Purism SPC 2019
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +/* Manufacturer specific DCS commands */
> +#define ST7703_CMD_SETDISP	0xB2
> +#define ST7703_CMD_SETRGBIF	0xB3
> +#define ST7703_CMD_SETCYC	0xB4
> +#define ST7703_CMD_SETBGP	0xB5
> +#define ST7703_CMD_SETVCOM	0xB6
> +#define ST7703_CMD_SETOTP	0xB7
> +#define ST7703_CMD_SETPOWER_EXT	0xB8
> +#define ST7703_CMD_SETEXTC	0xB9
> +#define ST7703_CMD_SETMIPI	0xBA
> +#define ST7703_CMD_SETVDC	0xBC
> +#define ST7703_CMD_UNK_BF	0xBF
> +#define ST7703_CMD_SETSCR	0xC0
> +#define ST7703_CMD_SETPOWER	0xC1
> +#define ST7703_CMD_UNK_C6	0xC6
> +#define ST7703_CMD_SETPANEL	0xCC
> +#define ST7703_CMD_RDID1	0xDA
> +#define ST7703_CMD_RDID2	0xDB
> +#define ST7703_CMD_RDID3	0xDC
> +#define ST7703_CMD_SETGAMMA	0xE0
> +#define ST7703_CMD_SETEQ	0xE3
> +#define ST7703_CMD_SETGIP1	0xE9
> +#define ST7703_CMD_SETGIP2	0xEA
> +
> +struct st7703_panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	unsigned long flags;
> +	enum mipi_dsi_pixel_format format;
> +	const char *const *supply_names;
> +	unsigned int num_supplies;
> +};
> +
> +struct st7703 {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +	const struct st7703_panel_desc *desc;
> +	bool prepared;
> +};
> +
> +static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct st7703, panel);
> +}
> +
> +#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +
> +static int st7703_init_sequence(struct st7703 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct device *dev = ctx->dev;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor.
> +	 */
> +
> +	/* Magic sequence to unlock user commands below. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xF1, 0x12, 0x83);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI,
> +			  0x33, /* VC_main = 0, Lane_Number = 3 (4 lanes) */
> +			  0x81, /* DSI_LDO_SEL = 1.7V, RTERM = 90 Ohm */
> +			  0x05, /* IHSRX = x6 (Low High Speed driving ability) */
> +			  0xF9, /* TX_CLK_SEL = fDSICLK/16 */
> +			  0x0E, /* HFP_OSC (min. HFP number in DSI mode) */
> +			  0x0E, /* HBP_OSC (min. HBP number in DSI mode) */
> +			  /* The rest is undocumented in ST7703 datasheet */
> +			  0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x44, 0x25, 0x00, 0x91, 0x0a, 0x00, 0x00, 0x02,
> +			  0x4F, 0x11, 0x00, 0x00, 0x37);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT,
> +			  0x25, /* PCCS = 2, ECP_DC_DIV = 1/4 HSYNC */
> +			  0x22, /* DT = 15ms XDK_ECP = x2 */
> +			  0x20, /* PFM_DC_DIV = /1 */
> +			  0x03  /* ECP_SYNC_EN = 1, VGX_SYNC_EN = 1 */);
> +
> +	/* RGB I/F porch timing */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF,
> +			  0x10, /* VBP_RGB_GEN */
> +			  0x10, /* VFP_RGB_GEN */
> +			  0x05, /* DE_BP_RGB_GEN */
> +			  0x05, /* DE_FP_RGB_GEN */
> +			  /* The rest is undocumented in ST7703 datasheet */
> +			  0x03, 0xFF,
> +			  0x00, 0x00,
> +			  0x00, 0x00);
> +
> +	/* Source driving settings. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR,
> +			  0x73, /* N_POPON */
> +			  0x73, /* N_NOPON */
> +			  0x50, /* I_POPON */
> +			  0x50, /* I_NOPON */
> +			  0x00, /* SCR[31,24] */
> +			  0xC0, /* SCR[23,16] */
> +			  0x08, /* SCR[15,8] */
> +			  0x70, /* SCR[7,0] */
> +			  0x00  /* Undocumented */);
> +
> +	/* NVDDD_SEL = -1.8V, VDDD_SEL = out of range (possibly 1.9V?) */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
> +
> +	/*
> +	 * SS_PANEL = 1 (reverse scan), GS_PANEL = 0 (normal scan)
> +	 * REV_PANEL = 1 (normally black panel), BGR_PANEL = 1 (BGR)
> +	 */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
> +
> +	/* Zig-Zag Type C column inversion. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> +
> +	/* Set display resolution. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP,
> +			  0xF0, /* NL = 240 */
> +			  0x12, /* RES_V_LSB = 0, BLK_CON = VSSD,
> +				 * RESO_SEL = 720RGB
> +				 */
> +			  0xF0  /* WHITE_GND_EN = 1 (GND),
> +				 * WHITE_FRAME_SEL = 7 frames,
> +				 * ISC = 0 frames
> +				 */);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ,
> +			  0x00, /* PNOEQ */
> +			  0x00, /* NNOEQ */
> +			  0x0B, /* PEQGND */
> +			  0x0B, /* NEQGND */
> +			  0x10, /* PEQVCI */
> +			  0x10, /* NEQVCI */
> +			  0x00, /* PEQVCI1 */
> +			  0x00, /* NEQVCI1 */
> +			  0x00, /* reserved */
> +			  0x00, /* reserved */
> +			  0xFF, /* reserved */
> +			  0x00, /* reserved */
> +			  0xC0, /* ESD_DET_DATA_WHITE = 1, ESD_WHITE_EN = 1 */
> +			  0x10  /* SLPIN_OPTION = 1 (no need vsync after sleep-in)
> +				 * VEDIO_NO_CHECK_EN = 0
> +				 * ESD_WHITE_GND_EN = 0
> +				 * ESD_DET_TIME_SEL = 0 frames
> +				 */);
> +
> +	/* Undocumented command. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_UNK_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
> +			  0x74, /* VBTHS, VBTLS: VGH = 17V, VBL = -11V */
> +			  0x00, /* FBOFF_VGH = 0, FBOFF_VGL = 0 */
> +			  0x32, /* VRP  */
> +			  0x32, /* VRN */
> +			  0x77, /* reserved */
> +			  0xF1, /* APS = 1 (small),
> +				 * VGL_DET_EN = 1, VGH_DET_EN = 1,
> +				 * VGL_TURBO = 1, VGH_TURBO = 1
> +				 */
> +			  0xFF, /* VGH1_L_DIV, VGL1_L_DIV (1.5MHz) */
> +			  0xFF, /* VGH1_R_DIV, VGL1_R_DIV (1.5MHz) */
> +			  0xCC, /* VGH2_L_DIV, VGL2_L_DIV (2.6MHz) */
> +			  0xCC, /* VGH2_R_DIV, VGL2_R_DIV (2.6MHz) */
> +			  0x77, /* VGH3_L_DIV, VGL3_L_DIV (4.5MHz) */
> +			  0x77  /* VGH3_R_DIV, VGL3_R_DIV (4.5MHz) */);
> +
> +	/* Reference voltage. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
> +			  0x07, /* VREF_SEL = 4.2V */
> +			  0x07  /* NVREF_SEL = 4.2V */);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
> +			  0x2C, /* VCOMDC_F = -0.67V */
> +			  0x2C  /* VCOMDC_B = -0.67V */);
> +
> +	/* Undocumented command. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_UNK_BF, 0x02, 0x11, 0x00);
> +
> +	/* This command is to set forward GIP timing. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
> +			  0x82, 0x10, 0x06, 0x05, 0xA2, 0x0A, 0xA5, 0x12,
> +			  0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> +			  0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
> +			  0x03, 0x00, 0x00, 0x00, 0x75, 0x75, 0x31, 0x88,
> +			  0x88, 0x88, 0x88, 0x88, 0x88, 0x13, 0x88, 0x64,
> +			  0x64, 0x20, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +			  0x02, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +
> +	/* This command is to set backward GIP timing. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
> +			  0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
> +			  0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
> +			  0x57, 0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +			  0x75, 0x88, 0x23, 0x14, 0x00, 0x00, 0x02, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0A,
> +			  0xA5, 0x00, 0x00, 0x00, 0x00);
> +
> +	/* Adjust the gamma characteristics of the panel. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
> +			  0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41, 0x35,
> +			  0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12, 0x12,
> +			  0x18, 0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41,
> +			  0x35, 0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12,
> +			  0x12, 0x18);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
> +	return 0;
> +}
> +
> +static int st7703_read_id(struct st7703 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	u8 id1, id2, id3;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_read(dsi, ST7703_CMD_RDID1, &id1, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "could not read ID1\n");
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_read(dsi, ST7703_CMD_RDID2, &id2, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "could not read ID2\n");
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_read(dsi, ST7703_CMD_RDID3, &id3, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "could not read ID3\n");
> +		return ret;
> +	}
> +
> +	DRM_DEV_INFO(ctx->dev,
> +		     "manufacturer: %02x version: %02x driver: %02x\n",
> +		     id1, id2, id3);
> +
> +	return 0;
> +}
> +
> +static int st7703_prepare(struct drm_panel *panel)
> +{
> +	struct st7703 *ctx = panel_to_st7703(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	ret = regulator_bulk_enable(ctx->desc->num_supplies, ctx->supplies);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for regulators to stabilize. */
> +	usleep_range(10000, 20000);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +	/* There needs to be at least 15ms post-reset delay. */
> +	usleep_range(15000, 20000);
> +
> +	ret = st7703_read_id(ctx);
> +	if (ret < 0)
> +		goto err_poweroff;
> +
> +	ret = st7703_init_sequence(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Panel init sequence failed (%d)\n", ret);
> +		goto err_poweroff;
> +	}
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to exit sleep mode (%d)\n", ret);
> +		goto err_poweroff;
> +	}
> +
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to turn on the display (%d)\n", ret);
> +		goto err_poweroff;
> +	}
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +
> +err_poweroff:
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ctx->desc->num_supplies, ctx->supplies);
> +	return ret;
> +}
> +
> +static int st7703_enable(struct drm_panel *panel)
> +{
> +	/*
> +	 * Avoid flicker by waiting for slightly more than 1
> +	 * frame's interval.
> +	 */
> +	msleep(50);
> +
> +	return 0;
> +}
> +
> +static int st7703_unprepare(struct drm_panel *panel)
> +{
> +	struct st7703 *ctx = panel_to_st7703(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to turn off the display (%d)\n", ret);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enter sleep mode (%d)\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ctx->desc->num_supplies, ctx->supplies);
> +	ctx->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int st7703_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct st7703 *ctx = panel_to_st7703(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to add mode\n");
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs st7703_drm_funcs = {
> +	.prepare   = st7703_prepare,
> +	.enable    = st7703_enable,
> +	.unprepare = st7703_unprepare,
> +	.get_modes = st7703_get_modes,
> +};
> +
> +static const struct drm_display_mode xbd599_mode = {
> +	.hdisplay    = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end   = 720 + 40 + 40,
> +	.htotal	     = 720 + 40 + 40 + 40,
> +	.vdisplay    = 1440,
> +	.vsync_start = 1440 + 18,
> +	.vsync_end   = 1440 + 18 + 10,
> +	.vtotal	     = 1440 + 18 + 10 + 17,
> +	.vrefresh    = 60,
> +	.clock	     = 69000,
> +	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +
> +	.width_mm    = 68,
> +	.height_mm   = 136,
> +	.type        = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const char * const xbd599_supply_names[] = {
> +	"iovcc",
> +	"vcc",
> +};
> +
> +static const struct st7703_panel_desc xbd599_desc = {
> +	.mode = &xbd599_mode,
> +	.lanes = 4,
> +	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.supply_names = xbd599_supply_names,
> +	.num_supplies = ARRAY_SIZE(xbd599_supply_names),
> +};
> +
> +static int st7703_probe(struct mipi_dsi_device *dsi)
> +{
> +	const struct st7703_panel_desc *desc;
> +	struct device *dev = &dsi->dev;
> +	struct st7703 *ctx;
> +	int i, ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev = dev;
> +	ctx->desc = desc = of_device_get_match_data(dev);
> +
> +	dsi->mode_flags = desc->flags;
> +	dsi->format = desc->format;
> +	dsi->lanes = desc->lanes;
> +
> +	ctx->supplies = devm_kcalloc(&dsi->dev, desc->num_supplies,
> +					sizeof(*ctx->supplies),
> +					GFP_KERNEL);
> +	if (!ctx->supplies)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < desc->num_supplies; i++)
> +		ctx->supplies[i].supply = desc->supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(&dsi->dev, desc->num_supplies,
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "Can't get reset gpio\n");
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	drm_panel_init(&ctx->panel, &dsi->dev, &st7703_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void st7703_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct st7703 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = drm_panel_unprepare(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev,
> +			      "Failed to unprepare panel (%d)\n", ret);
> +}
> +
> +static int st7703_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct st7703 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	st7703_shutdown(dsi);
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev,
> +			      "Failed to detach from DSI host (%d)\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id st7703_of_match[] = {
> +	{ .compatible = "xingbangda,xbd599", .data = &xbd599_desc },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, st7703_of_match);
> +
> +static struct mipi_dsi_driver st7703_driver = {
> +	.probe	= st7703_probe,
> +	.remove = st7703_remove,
> +	.shutdown = st7703_shutdown,
> +	.driver = {
> +		.name = "st7703",
> +		.of_match_table = st7703_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(st7703_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
> +MODULE_DESCRIPTION("DRM driver for Sitronix ST7703 MIPI DSI panel");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
