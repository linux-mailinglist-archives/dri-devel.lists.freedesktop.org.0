Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2311F0E0
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 09:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079B36E23B;
	Sat, 14 Dec 2019 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06566E23B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 08:17:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 235EC803D7;
 Sat, 14 Dec 2019 09:17:32 +0100 (CET)
Date: Sat, 14 Dec 2019 09:17:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Xinpeng XPP055C272
 panels
Message-ID: <20191214081730.GC22818@ravnborg.org>
References: <20191209144208.4863-1-heiko@sntech.de>
 <20191209144208.4863-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209144208.4863-3-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=NXpJzYs8AAAA:8
 a=SCIKxuGIuBpIoaJeLnkA:9 a=CjuIK1q_8ugA:10 a=cwV61pgf2j4Cq8VD9hE_:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko.

Thanks for another nice panel driver patch.
There are some changes in drm-misc-next so the patch
applies but it no longer builds.
Please fix.

drm_panel now includes support for backlight - see other drivers.
Please look into the possibility to use the drm_panel supported
backlight for this driver.

On top of this a few comments below.

> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <linux/backlight.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <video/display_timing.h>
> +#include <video/mipi_display.h>

Please split the include files in blocks like this.

#include <linux/*>

#include <video/*>

#include <drm/*>

Keep the empty lines between the blocks.
And each block must be sorted alphabetically.


> +
> +#define DRV_NAME "panel-xinpeng-xpp055c272"
It is only used once - just spell it out where you use it.

> +
> +/* Manufacturer specific Commands send via DSI */
> +#define XPP055C272_CMD_ALL_PIXEL_OFF	0x22
> +#define XPP055C272_CMD_ALL_PIXEL_ON		0x23
> +#define XPP055C272_CMD_SETDISP		0xb2
> +#define XPP055C272_CMD_SETRGBIF		0xb3
> +#define XPP055C272_CMD_SETCYC		0xb4
> +#define XPP055C272_CMD_SETBGP		0xb5
> +#define XPP055C272_CMD_SETVCOM		0xb6
> +#define XPP055C272_CMD_SETOTP		0xb7
> +#define XPP055C272_CMD_SETPOWER_EXT		0xb8
> +#define XPP055C272_CMD_SETEXTC		0xb9
> +#define XPP055C272_CMD_SETMIPI		0xbA
> +#define XPP055C272_CMD_SETVDC		0xbc
> +#define XPP055C272_CMD_SETPCR		0xbf
> +#define XPP055C272_CMD_SETSCR		0xc0
> +#define XPP055C272_CMD_SETPOWER		0xc1
> +#define XPP055C272_CMD_SETECO		0xc6
> +#define XPP055C272_CMD_SETPANEL		0xcc
> +#define XPP055C272_CMD_SETGAMMA		0xe0
> +#define XPP055C272_CMD_SETEQ		0xe3
> +#define XPP055C272_CMD_SETGIP1		0xe9
> +#define XPP055C272_CMD_SETGIP2		0xea
> +
> +struct xpp055c272 {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct gpio_desc *reset_gpio;
> +	struct backlight_device *backlight;
> +	struct regulator *vci;
> +	struct regulator *iovcc;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct xpp055c272, panel);
> +}
> +
> +#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
This macro return an error code if a write fails.

> +
> +static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor without much
> +	 * documentation.
> +	 */
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
But all uses of the macro here ignore the error.

Consider the following solution - to keep the code simple.

#define dsi_generic_write_seq(dsi, cmd, seq...) do {                    \
		static const u8 d[] = { seq };                          \
		if (ret != 0)                                            \
			return ret;					\
		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
     } while (0)

Notice that the macro uses an alredy defined "ret" variable.
ret must be init to 0 - and must be checked after the last use of the
macro.

With the above mipi_dsi_dcs_write() is skipped if ret indicate an error.
And you can check ret after performing all the write calls.

You loose the exact point where ret failed but then the code does not
blindly continue ignoring the error.

> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
> +			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> +			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> +			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> +			      0x00, 0x00, 0x37);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
> +			      0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
> +			      0x00, 0x00);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETSCR,
> +			      0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
> +			      0x00);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEQ,
> +			      0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
> +			      0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER,
> +			      0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
> +			      0x67, 0x77, 0x33, 0x33);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
> +			      0xff, 0x01, 0xff);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
> +	msleep(20);
> +
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP1,
> +			      0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
> +			      0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
> +			      0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
> +			      0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
> +			      0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
> +			      0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
> +			      0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
> +			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP2,
> +			      0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
> +			      0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
> +			      0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
> +			      0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
> +			      0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
> +			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
> +			      0xa0, 0x00, 0x00, 0x00, 0x00);
> +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
> +			      0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
> +			      0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
> +			      0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
> +			      0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
> +			      0x11, 0x18);
> +
> +	msleep(60);
> +


> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* T9: 120ms */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret)
> +		return ret;
These two mipi calls should maybe be in xpp055c272_prepare()
In this way you keep the code symmtric.

xpp055c272_unprepare() turns off the display and enter sleep mode.
xpp055c272_prepare() does the opposite.

Bikeshedding - but I looked for the symmetric variant.

> +
> +	msleep(50);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
> +	return 0;
> +}
> +
> +static int xpp055c272_unprepare(struct drm_panel *panel)
> +{
> +	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev, "failed to set display off: %d\n",
> +			      ret);
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
> +static int xpp055c272_prepare(struct drm_panel *panel)
> +{
> +	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
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
> +	/* T6: 10us */
> +	usleep_range(10, 20);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +	/* T8: 20ms */
> +	msleep(20);
> +
> +	ret = xpp055c272_init_sequence(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
> +			      ret);
> +		goto disable_iovcc;
> +	}
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
> +static int xpp055c272_enable(struct drm_panel *panel)
> +{
> +	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
> +	int ret;
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	ret = backlight_enable(ctx->backlight);
> +	if (ret) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enable backlight %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int xpp055c272_disable(struct drm_panel *panel)
> +{
> +	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
> +
> +	if (!ctx->enabled)
> +		return 0;
> +
> +	backlight_disable(ctx->backlight);
> +
> +	ctx->enabled = false;
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode default_mode = {
> +	.hdisplay    = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end   = 720 + 40 + 10,
> +	.htotal	     = 720 + 40 + 10 + 40,
> +	.vdisplay    = 1280,
> +	.vsync_start = 1280 + 22,
> +	.vsync_end   = 1280 + 22 + 4,
> +	.vtotal	     = 1280 + 22 + 4 + 11,
> +	.vrefresh    = 60,
> +	.clock	     = 64000,
> +	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm    = 68,
> +	.height_mm   = 121,
> +};
> +
> +static int xpp055c272_get_modes(struct drm_panel *panel)
> +{
> +	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(panel->drm, &default_mode);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
> +			      default_mode.hdisplay, default_mode.vdisplay,
> +			      default_mode.vrefresh);
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	panel->connector->display_info.width_mm = mode->width_mm;
> +	panel->connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(panel->connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs xpp055c272_funcs = {
> +	.disable   = xpp055c272_disable,
> +	.unprepare = xpp055c272_unprepare,
> +	.prepare   = xpp055c272_prepare,
> +	.enable	   = xpp055c272_enable,
> +	.get_modes = xpp055c272_get_modes,
> +};
> +
> +static int xpp055c272_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct xpp055c272 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
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
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +
> +	ctx->backlight = devm_of_find_backlight(dev);
> +	if (IS_ERR(ctx->backlight))
> +		return PTR_ERR(ctx->backlight);
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
> +	drm_panel_init(&ctx->panel, &dsi->dev, &xpp055c272_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
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
> +static void xpp055c272_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct xpp055c272 *ctx = mipi_dsi_get_drvdata(dsi);
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
> +static int xpp055c272_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct xpp055c272 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	xpp055c272_shutdown(dsi);
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
> +static const struct of_device_id xpp055c272_of_match[] = {
> +	{ .compatible = "xinpeng,xpp055c272" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, xpp055c272_of_match);
> +
> +static struct mipi_dsi_driver xpp055c272_driver = {
> +	.probe	= xpp055c272_probe,
> +	.remove = xpp055c272_remove,
> +	.shutdown = xpp055c272_shutdown,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.of_match_table = xpp055c272_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(xpp055c272_driver);
> +
> +MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@theobroma-systems.com>");
> +MODULE_DESCRIPTION("DRM driver for Xinpeng xpp055c272 MIPI DSI panel");
> +MODULE_LICENSE("GPL v2");

Looks forward to see v2 of the driver.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
