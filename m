Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B67185519
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 09:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13226E105;
	Sat, 14 Mar 2020 08:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2066EC8C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 08:00:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 56B208040D;
 Sat, 14 Mar 2020 09:00:02 +0100 (CET)
Date: Sat, 14 Mar 2020 09:00:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 3/5] drm: panel: add Xingbangda XBD599 panel
Message-ID: <20200314080000.GE5783@ravnborg.org>
References: <20200311163329.221840-1-icenowy@aosc.io>
 <20200311163329.221840-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311163329.221840-4-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Ndn_4ZrgrvPCaig-JTAA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy

A few details in the following.

	Sam

On Thu, Mar 12, 2020 at 12:33:27AM +0800, Icenowy Zheng wrote:
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI IPS LCD panel made by
> Xingbangda, which is used on PinePhone final assembled phones.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-xingbangda-xbd599.c   | 367 ++++++++++++++++++
>  3 files changed, 377 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-xingbangda-xbd599.c
> 
> +++ b/drivers/gpu/drm/panel/panel-xingbangda-xbd599.c
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xingbangda XBD599 MIPI-DSI panel driver
> + *
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
2020?

> + *
> + * Based on panel-rocktech-jh057n00900.c, which is:
> + *   Copyright (C) Purism SPC 2019
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
Sort alphabetically.

> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#define DRV_NAME "panel-xingbangda-xbd599"
No reason for this indirection, it is only used once

> +
> +/* Manufacturer specific Commands send via DSI */
> +#define ST7703_CMD_ALL_PIXEL_OFF 0x22
> +#define ST7703_CMD_ALL_PIXEL_ON	 0x23
> +#define ST7703_CMD_SETDISP	 0xB2
> +#define ST7703_CMD_SETRGBIF	 0xB3
> +#define ST7703_CMD_SETCYC	 0xB4
> +#define ST7703_CMD_SETBGP	 0xB5
> +#define ST7703_CMD_SETVCOM	 0xB6
> +#define ST7703_CMD_SETOTP	 0xB7
> +#define ST7703_CMD_SETPOWER_EXT	 0xB8
> +#define ST7703_CMD_SETEXTC	 0xB9
> +#define ST7703_CMD_SETMIPI	 0xBA
> +#define ST7703_CMD_SETVDC	 0xBC
> +#define ST7703_CMD_SETSCR	 0xC0
> +#define ST7703_CMD_SETPOWER	 0xC1
> +#define ST7703_CMD_UNK_C6	 0xC6
> +#define ST7703_CMD_SETPANEL	 0xCC
> +#define ST7703_CMD_SETGAMMA	 0xE0
> +#define ST7703_CMD_SETEQ	 0xE3
> +#define ST7703_CMD_SETGIP1	 0xE9
> +#define ST7703_CMD_SETGIP2	 0xEA
> +
> +static const char * const regulator_names[] = {
> +	"iovcc",
> +	"vcc",
> +};
> +
> +struct xbd599 {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> +	bool prepared;
> +};
> +
> +static inline struct xbd599 *panel_to_xbd599(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct xbd599, panel);
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
> +static int xbd599_init_sequence(struct xbd599 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor.
> +	 */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC,
> +			  0xF1, 0x12, 0x83);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI,
> +			  0x33, 0x81, 0x05, 0xF9, 0x0E, 0x0E, 0x20, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> +			  0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4F, 0x11,
> +			  0x00, 0x00, 0x37);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT,
> +			  0x25, 0x22, 0x20, 0x03);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF,
> +			  0x10, 0x10, 0x05, 0x05, 0x03, 0xFF, 0x00, 0x00,
> +			  0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR,
> +			  0x73, 0x73, 0x50, 0x50, 0x00, 0xC0, 0x08, 0x70,
> +			  0x00);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0xF0, 0x12, 0xF0);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ,
> +			  0x00, 0x00, 0x0B, 0x0B, 0x10, 0x10, 0x00, 0x00,
> +			  0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
> +	dsi_dcs_write_seq(dsi, 0xC6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
> +			  0x74, 0x00, 0x32, 0x32, 0x77, 0xF1, 0xFF, 0xFF,
> +			  0xCC, 0xCC, 0x77, 0x77);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x07, 0x07);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x2C, 0x2C);
> +	dsi_dcs_write_seq(dsi, 0xBF, 0x02, 0x11, 0x00);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
> +			  0x82, 0x10, 0x06, 0x05, 0xA2, 0x0A, 0xA5, 0x12,
> +			  0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> +			  0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
> +			  0x03, 0x00, 0x00, 0x00, 0x75, 0x75, 0x31, 0x88,
> +			  0x88, 0x88, 0x88, 0x88, 0x88, 0x13, 0x88, 0x64,
> +			  0x64, 0x20, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +			  0x02, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
> +			  0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
> +			  0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
> +			  0x57, 0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +			  0x75, 0x88, 0x23, 0x14, 0x00, 0x00, 0x02, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00 ,0x00, 0x00, 0x00, 0x03, 0x0A,
> +			  0xA5, 0x00, 0x00, 0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
> +			  0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41, 0x35,
> +			  0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12, 0x12,
> +			  0x18, 0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41,
> +			  0x35, 0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12,
> +			  0x12, 0x18);
> +	msleep(20);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "Failed to exit sleep mode\n");
> +		return ret;
> +	}
> +	msleep(250);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret)
> +		return ret;
> +	msleep(50);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
> +	return 0;
> +}
> +
> +static int xbd599_disable(struct drm_panel *panel)
> +{
> +	struct xbd599 *ctx = panel_to_xbd599(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	return mipi_dsi_dcs_set_display_off(dsi);
> +}
The following is the same for many panels but anyway.

The init order for a display is

    prepare
    enable

    # Display is now fully operational

    disable
    unprepare

    # display is now off and turned off (no power)

So when reading panel drivers my personal preference is to read the
functions in that order - this makes it easier to follow the sequence.

Thats just my personal opinion - so feel free to ignore.

> +
> +static int xbd599_unprepare(struct drm_panel *panel)
> +{
> +	struct xbd599 *ctx = panel_to_xbd599(panel);
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	ctx->prepared = false;
> +
> +	return 0;
> +}
Maybe activate reset before power is turned off.
So when power is turned on again later the panel is kept in reset.

This would also make this a closer mirror of what is done in prepare()

> +
> +static int xbd599_enable(struct drm_panel *panel)
> +{
> +	struct xbd599 *ctx = panel_to_xbd599(panel);
> +	int ret;
> +
> +	ret = xbd599_init_sequence(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xbd599_prepare(struct drm_panel *panel)
> +{
> +	struct xbd599 *ctx = panel_to_xbd599(panel);
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret)
> +		return ret;
> +
> +	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(20, 40);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(20);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode xbd599_default_mode = {
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
> +static int xbd599_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct xbd599 *ctx = panel_to_xbd599(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &xbd599_default_mode);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to add mode\n");
> +		return -ENOMEM;
> +	}
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
> +static const struct drm_panel_funcs xbd599_drm_funcs = {
> +	.disable   = xbd599_disable,
> +	.unprepare = xbd599_unprepare,
> +	.enable    = xbd599_enable,
> +	.prepare   = xbd599_prepare,
> +	.get_modes = xbd599_get_modes,
> +};
> +
> +static int xbd599_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct xbd599 *ctx;
> +	int i, ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
> +		ctx->supplies[i].supply = regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(&dsi->dev, "cannot get regulators\n");
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->dev = dev;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	drm_panel_init(&ctx->panel, &dsi->dev, &xbd599_drm_funcs,
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
> +		DRM_DEV_ERROR(dev, "mipi_dsi_attach failed. Is host ready?\n");
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> +		     xbd599_default_mode.hdisplay,
> +		     xbd599_default_mode.vdisplay,
> +		     xbd599_default_mode.vrefresh,
> +		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
> +
> +	return 0;
> +}
> +
> +static void xbd599_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct xbd599 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = xbd599_unprepare(&ctx->panel);

Use drm_panel_unprepare().
There may be, or may come functionality in drm_panel that is required.

> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to unprepare panel: %d\n",
> +			      ret);
> +}
> +
> +static int xbd599_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct xbd599 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	xbd599_shutdown(dsi);
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
> +static const struct of_device_id xbd599_of_match[] = {
> +	{ .compatible = "xingbangda,xbd599", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, xbd599_of_match);
> +
> +static struct mipi_dsi_driver xbd599_driver = {
> +	.probe	= xbd599_probe,
> +	.remove = xbd599_remove,
> +	.shutdown = xbd599_shutdown,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.of_match_table = xbd599_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(xbd599_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
> +MODULE_DESCRIPTION("DRM driver for Xingbangda XBD599 MIPI DSI panel");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
