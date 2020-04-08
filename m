Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A241A1BDB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3A06E951;
	Wed,  8 Apr 2020 06:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDB96E951
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:21:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AE781804D0;
 Wed,  8 Apr 2020 08:21:07 +0200 (CEST)
Date: Wed, 8 Apr 2020 08:21:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/2] drm/panel: add panel driver for Leadtek
 LTK050H3146W
Message-ID: <20200408062106.GB14965@ravnborg.org>
References: <20200407232351.2547750-1-heiko@sntech.de>
 <20200407232351.2547750-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407232351.2547750-2-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=NXpJzYs8AAAA:8
 a=e5mUnYsNAAAA:8 a=Gj5F7dKTla-dyyA8-UsA:9 a=rrBbZR8Jzs_j29Py:21
 a=nmf2eGfcGpYvPZEd:21 a=CjuIK1q_8ugA:10 a=cwV61pgf2j4Cq8VD9hE_:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Goodmorning Heiko.

Thanks for the v2 of this driver.

checkpatch, using --strict, complains about indent.
I have also noted some of them below.

A few comments in the following.

	Sam

On Wed, Apr 08, 2020 at 01:23:51AM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The LTK050H3146W is 5.0" 720x1280 DSI display. There are two variants
> with essentially the same name, LTK050H3146W and LTK050H3146W-A2.
> 
> They differ in their init sequence and mode details.
> 
> changes in v2:
> - add display variants
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-leadtek-ltk050h3146w.c    | 697 ++++++++++++++++++
>  3 files changed, 709 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a1723c1b5fbf..d56258b9fcaf 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -137,6 +137,17 @@ config DRM_PANEL_KINGDISPLAY_KD097D04
>  	  24 bit RGB per pixel. It provides a MIPI DSI interface to
>  	  the host and has a built-in LED backlight.
>  
> +config DRM_PANEL_LEADTEK_LTK050H3146W
> +	tristate "Leadtek LTK050H3146W panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Leadtek LTK050H3146W
> +	  TFT-LCD modules. The panel has a 720x1280 resolution and uses
> +	  24 bit RGB per pixel. It provides a MIPI DSI interface to
> +	  the host and has a built-in LED backlight.
> +
>  config DRM_PANEL_LEADTEK_LTK500HD1829
>  	tristate "Leadtek LTK500HD1829 panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 96a883cd6630..2335a1e32ae0 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>  obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
>  obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
>  obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
> +obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> new file mode 100644
> index 000000000000..43fbedf01b85
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -0,0 +1,697 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Theobroma Systems Design und Consulting GmbH
> + */
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/display_timing.h>
> +#include <video/mipi_display.h>
> +

Sorted within each block - good.

The typical pattern is:

#include <linux/*>

#include <video/*>

#include <drm/*>

Following the above pattern is not a hard rule.

> +struct ltk050h3146w_cmd {
> +	char cmd;
> +	char data;
> +};
> +
> +struct ltk050h3146w;
> +struct ltk050h3146w_desc {
> +	const struct drm_display_mode *mode;
> +	int (*init)(struct ltk050h3146w *ctx);
> +};
> +
> +struct ltk050h3146w {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator *vci;
> +	struct regulator *iovcc;
> +	const struct ltk050h3146w_desc *panel_desc;
> +	bool prepared;
> +};
> +
> +static const struct ltk050h3146w_cmd page1_cmds[] = {
> +	{ 0x22, 0x0A }, /* BGR SS GS */
> +	{ 0x31, 0x00 }, /* column inversion */
> +	{ 0x53, 0xA2 }, /* VCOM1 */
> +	{ 0x55, 0xA2 }, /* VCOM2 */
> +	{ 0x50, 0x81 }, /* VREG1OUT=5V */
> +	{ 0x51, 0x85 }, /* VREG2OUT=-5V */
> +	{ 0x62, 0x0D }, /* EQT Time setting */
> +/*
> + * For whatever reason the vendor init selected page 1 here _again_
> + * Is this supposed to be page 2?
> + */

...

> +static inline
> +struct ltk050h3146w *panel_to_ltk050h3146w(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ltk050h3146w, panel);
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
> +static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor without much
> +	 * documentation.
> +	 */
> +	dsi_dcs_write_seq(dsi, 0xdf, 0x93, 0x65, 0xf8);
> +	dsi_dcs_write_seq(dsi, 0xb0, 0x01, 0x03, 0x02, 0x00, 0x64, 0x06,
> +			      0x01);
Fix indent. 0x01 must be alinged right after the opening '('
Same comments goes for many other cases below.

> +	dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0xb5);
> +	dsi_dcs_write_seq(dsi, 0xb3, 0x00, 0xb5);
> +	dsi_dcs_write_seq(dsi, 0xb7, 0x00, 0xbf, 0x00, 0x00, 0xbf, 0x00);
> +
> +	dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xc4, 0x23, 0x07);
> +	dsi_dcs_write_seq(dsi, 0xbb, 0x02, 0x01, 0x24, 0x00, 0x28, 0x0f,
> +			      0x28, 0x04, 0xcc, 0xcc, 0xcc);
> +	dsi_dcs_write_seq(dsi, 0xbc, 0x0f, 0x04);
> +	dsi_dcs_write_seq(dsi, 0xbe, 0x1e, 0xf2);
> +	dsi_dcs_write_seq(dsi, 0xc0, 0x26, 0x03);
> +	dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x12);
> +	dsi_dcs_write_seq(dsi, 0xc3, 0x04, 0x02, 0x02, 0x76, 0x01, 0x80,
> +			      0x80);
> +	dsi_dcs_write_seq(dsi, 0xc4, 0x24, 0x80, 0xb4, 0x81, 0x12, 0x0f,
> +			      0x16, 0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xc8, 0x7f, 0x72, 0x67, 0x5d, 0x5d, 0x50,
> +			      0x56, 0x41, 0x59, 0x57, 0x55, 0x70, 0x5b, 0x5f,
> +			      0x4f, 0x47, 0x38, 0x23, 0x08, 0x7f, 0x72, 0x67,
> +			      0x5d, 0x5d, 0x50, 0x56, 0x41, 0x59, 0x57, 0x55,
> +			      0x70, 0x5b, 0x5f, 0x4f, 0x47, 0x38, 0x23, 0x08);
> +	dsi_dcs_write_seq(dsi, 0xd0, 0x1e, 0x1f, 0x57, 0x58, 0x48, 0x4a,
> +			      0x44, 0x46, 0x40, 0x1f, 0x42, 0x1f, 0x1f, 0x1f,
> +			      0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	dsi_dcs_write_seq(dsi, 0xd1, 0x1e, 0x1f, 0x57, 0x58, 0x49, 0x4b,
> +			      0x45, 0x47, 0x41, 0x1f, 0x43, 0x1f, 0x1f, 0x1f,
> +			      0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	dsi_dcs_write_seq(dsi, 0xd2, 0x1f, 0x1e, 0x17, 0x18, 0x07, 0x05,
> +			      0x0b, 0x09, 0x03, 0x1f, 0x01, 0x1f, 0x1f, 0x1f,
> +			      0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	dsi_dcs_write_seq(dsi, 0xd3, 0x1f, 0x1e, 0x17, 0x18, 0x06, 0x04,
> +			      0x0a, 0x08, 0x02, 0x1f, 0x00, 0x1f, 0x1f, 0x1f,
> +			      0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	dsi_dcs_write_seq(dsi, 0xd4, 0x00, 0x00, 0x00, 0x0c, 0x06, 0x20,
> +			      0x01, 0x02, 0x00, 0x60, 0x15, 0xb0, 0x30, 0x03,
> +			      0x04, 0x00, 0x60, 0x72, 0x0a, 0x00, 0x60, 0x08);
> +	dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x06, 0x06, 0x00, 0x30, 0x00,
> +			      0x00, 0x00, 0x00, 0x00, 0xbc, 0x50, 0x00, 0x05,
> +			      0x21, 0x00, 0x60);
> +	dsi_dcs_write_seq(dsi, 0xdd, 0x2c, 0xa3, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xde, 0x02);
> +	dsi_dcs_write_seq(dsi, 0xb2, 0x32, 0x1c);
> +	dsi_dcs_write_seq(dsi, 0xb7, 0x3b, 0x70, 0x00, 0x04);
> +	dsi_dcs_write_seq(dsi, 0xc1, 0x11);
> +	dsi_dcs_write_seq(dsi, 0xbb, 0x21, 0x22, 0x23, 0x24, 0x36, 0x37);
> +	dsi_dcs_write_seq(dsi, 0xc2, 0x20, 0x38, 0x1e, 0x84);
> +	dsi_dcs_write_seq(dsi, 0xde, 0x00);
> +
> +	ret = mipi_dsi_dcs_set_tear_on(dsi, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to set tear on: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	msleep(60);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
Looks like a debug artifact that can be dropped in the upstream driver.

> +	return 0;
> +}
> +
> +static const struct drm_display_mode ltk050h3146w_mode = {
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 42,
> +	.hsync_end	= 720 + 42 + 8,
> +	.htotal		= 720 + 42 + 8 + 42,
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 12,
> +	.vsync_end	= 1280 + 12 + 4,
> +	.vtotal		= 1280 + 12 + 4 + 18,
> +	.vrefresh	= 60,
vrefresh is soon gone. Drop it here.

> +	.clock		= 64018,
> +	.width_mm	= 62,
> +	.height_mm	= 110,
> +};
> +
> +static const struct ltk050h3146w_desc ltk050h3146w_data = {
> +	.mode = &ltk050h3146w_mode,
> +	.init = ltk050h3146w_init_sequence,
> +};
> +
> +static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	u8 d[3] = { 0x98, 0x81, page };
> +
> +	return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
> +}
> +
> +static int ltk050h3146w_a2_write_page(struct ltk050h3146w *ctx, int page,
> +				   const struct ltk050h3146w_cmd *cmds, int num)
Fix indent.

> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int i, ret;
> +
> +	ret = ltk050h3146w_a2_select_page(ctx, page);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to select page %d: %d\n",
> +			      page, ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num; i++) {
> +		ret = mipi_dsi_generic_write(dsi, &cmds[i],
> +					     sizeof(struct ltk050h3146w_cmd));
> +		if (ret < 0) {
> +			DRM_DEV_ERROR(ctx->dev,
> +				      "failed to write page %d init cmds: %d\n",
> +				       page, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ltk050h3146w_a2_init_sequence(struct ltk050h3146w *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor without much
> +	 * documentation.
> +	 */
> +	ret = ltk050h3146w_a2_write_page(ctx, 3, page3_cmds,
> +					      ARRAY_SIZE(page3_cmds));
Fix indent.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ltk050h3146w_a2_write_page(ctx, 4, page4_cmds,
> +					      ARRAY_SIZE(page4_cmds));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ltk050h3146w_a2_write_page(ctx, 1, page1_cmds,
> +					      ARRAY_SIZE(page1_cmds));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ltk050h3146w_a2_select_page(ctx, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to select page 0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* vendor code called this without param, where there should be one */
> +	ret = mipi_dsi_dcs_set_tear_on(dsi, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to set tear on: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	msleep(60);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
Debug artifact?

> +	return 0;
> +}
> +
> +static const struct drm_display_mode ltk050h3146w_a2_mode = {
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 42,
> +	.hsync_end	= 720 + 42 + 10,
> +	.htotal		= 720 + 42 + 10 + 60,
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 18,
> +	.vsync_end	= 1280 + 18 + 4,
> +	.vtotal		= 1280 + 18 + 4 + 12,
> +	.vrefresh	= 60,
> +	.clock		= 65595,
> +	.width_mm	= 62,
> +	.height_mm	= 110,
> +};
> +
> +static const struct ltk050h3146w_desc ltk050h3146w_a2_data = {
> +	.mode = &ltk050h3146w_a2_mode,
> +	.init = ltk050h3146w_a2_init_sequence,
> +};
> +
> +static int ltk050h3146w_unprepare(struct drm_panel *panel)
> +{
> +	struct ltk050h3146w *ctx = panel_to_ltk050h3146w(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to set display off: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "failed to enter sleep mode: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	regulator_disable(ctx->iovcc);
> +	regulator_disable(ctx->vci);
> +
> +	ctx->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int ltk050h3146w_prepare(struct drm_panel *panel)
> +{
> +	struct ltk050h3146w *ctx = panel_to_ltk050h3146w(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
> +	ret = regulator_enable(ctx->vci);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enable vci supply: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regulator_enable(ctx->iovcc);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enable iovcc supply: %d\n", ret);
> +		goto disable_vci;
> +	}
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(20);
> +
> +//	ret = ltk050h3146w_a2_init_sequence(ctx);
Please fix - this looks like something replaced by the following line.

> +	ret = ctx->panel_desc->init(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
> +			      ret);
> +		goto disable_iovcc;
> +	}
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> +		goto disable_iovcc;
> +	}
> +
> +	/* T9: 120ms */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to set display on: %d\n", ret);
> +		goto disable_iovcc;
> +	}
> +
> +	msleep(50);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +
> +disable_iovcc:
> +	regulator_disable(ctx->iovcc);
> +disable_vci:
> +	regulator_disable(ctx->vci);
> +	return ret;
> +}
> +
> +static int ltk050h3146w_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
> +{
> +	struct ltk050h3146w *ctx = panel_to_ltk050h3146w(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->panel_desc->mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs ltk050h3146w_funcs = {
> +	.unprepare	= ltk050h3146w_unprepare,
> +	.prepare	= ltk050h3146w_prepare,
> +	.get_modes	= ltk050h3146w_get_modes,
> +};
> +
> +static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct ltk050h3146w *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->panel_desc = of_device_get_match_data(dev);
> +	if (!ctx->panel_desc)
> +		return -EINVAL;
> +
> +	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	ctx->vci = devm_regulator_get(dev, "vci");
> +	if (IS_ERR(ctx->vci)) {
> +		ret = PTR_ERR(ctx->vci);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request vci regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	ctx->iovcc = devm_regulator_get(dev, "iovcc");
> +	if (IS_ERR(ctx->iovcc)) {
> +		ret = PTR_ERR(ctx->iovcc);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request iovcc regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->dev = dev;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +
> +	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
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
> +		DRM_DEV_ERROR(dev, "mipi_dsi_attach failed: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ltk050h3146w_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct ltk050h3146w *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = drm_panel_unprepare(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to unprepare panel: %d\n",
> +			      ret);
> +
> +	ret = drm_panel_disable(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to disable panel: %d\n",
> +			      ret);
> +}
> +
> +static int ltk050h3146w_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ltk050h3146w *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ltk050h3146w_shutdown(dsi);
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to detach from DSI host: %d\n",
> +			      ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltk050h3146w_of_match[] = {
> +	{
> +		.compatible = "leadtek,ltk050h3146w",
> +		.data = &ltk050h3146w_data,
> +	},
> +	{
> +		.compatible = "leadtek,ltk050h3146w-a2",
> +		.data = &ltk050h3146w_a2_data,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ltk050h3146w_of_match);
> +
> +static struct mipi_dsi_driver ltk050h3146w_driver = {
> +	.driver = {
> +		.name = "panel-leadtek-ltk050h3146w",
> +		.of_match_table = ltk050h3146w_of_match,
> +	},
> +	.probe	= ltk050h3146w_probe,
> +	.remove = ltk050h3146w_remove,
> +	.shutdown = ltk050h3146w_shutdown,
> +};
> +module_mipi_dsi_driver(ltk050h3146w_driver);
> +
> +MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@theobroma-systems.com>");
> +MODULE_DESCRIPTION("DRM driver for Leadtek LTK050H3146W MIPI DSI panel");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
