Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72411F809
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 14:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324866E044;
	Sun, 15 Dec 2019 13:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230FF6E044
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 13:46:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C0D42804D9;
 Sun, 15 Dec 2019 14:46:12 +0100 (CET)
Date: Sun, 15 Dec 2019 14:46:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v6] drm/panel: Add driver for Sony ACX424AKP panel
Message-ID: <20191215134611.GB32327@ravnborg.org>
References: <20191114131525.3988-1-linus.walleij@linaro.org>
 <20191114131525.3988-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114131525.3988-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8
 a=KKAkSRfTAAAA:8 a=QXkdiU5hrpe_b_WBnVsA:9 a=8rdMikdNFROGHx1q:21
 a=es31LUgQTZT6TaMh:21 a=CjuIK1q_8ugA:10 a=A2jcf3dkIZPIRbEE90CI:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

Thanks for another panel driver.
A mixed set of review comments in the following.

	Sam

On Thu, Nov 14, 2019 at 02:15:25PM +0100, Linus Walleij wrote:
> The Sony ACX424AKP is a command/videomode DSI panel for
> mobile devices. It is used on the ST-Ericsson HREF520
> reference design. We support video mode by default, but
> it is possible to switch the panel into command mode
> by using the bool property "dsi-command-mode".
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index f152bc4eeb53..959df5bea7d2 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -316,6 +316,13 @@ config DRM_PANEL_SITRONIX_ST7789V
>  	  Say Y here if you want to enable support for the Sitronix
>  	  ST7789V controller for 240x320 LCD panels
>  
> +config DRM_PANEL_SONY_ACX424AKP
> +	tristate "Sony ACX424AKP DSI command mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
Can we get just a little help text here?

> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * MIPI-DSI Sony ACX424AKP panel driver. This is a 480x864
> + * AMOLED panel with a command-only DSI interface.
> + *
> + * Copyright (C) Linaro Ltd. 2019
> + * Author: Linus Walleij
> + * Based on code and know-how from Marcus Lorentzon
> + * Copyright (C) ST-Ericsson SA 2010
> + */
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <video/mipi_display.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/backlight.h>

The normal pattern here is:

#include <linux/*>

#include <video/*>

#include <drm/*>

With lines sorted alphabetically within each block.
And each block separated by an empty line.


> +#define DISPLAY_SONY_ACX424AKP_ID3	0x8000
> +
> +struct acx424akp {
> +	struct device *dev;
> +	struct drm_panel panel;
As we subclass drm_panel - it is often placed first.

> +	struct backlight_device *bl;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	u8 version;
> +	bool video_mode;
> +};
> +

> +static const struct drm_display_mode sony_acx424akp_vid_mode = {
> +	.clock = 330000,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 15,
> +	.hsync_end = 480 + 15 + 0,
> +	.htotal = 480 + 15 + 0 + 15,
> +	.vdisplay = 864,
> +	.vsync_start = 864 + 14,
> +	.vsync_end = 864 + 14 + 1,
> +	.vtotal = 864 + 14 + 1 + 11,
> +	.vrefresh = 60,
> +	.width_mm = 48,
> +	.height_mm = 84,
> +	.flags = DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +/*
> + * The timings are not very helpful as the display is used in
> + * command mode using the maximum HS frequency.
> + */
> +static const struct drm_display_mode sony_acx424akp_cmd_mode = {
> +	.clock = 420160,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 154,
> +	.hsync_end = 480 + 154 + 16,
> +	.htotal = 480 + 154 + 16 + 32,
> +	.vdisplay = 864,
> +	.vsync_start = 864 + 1,
> +	.vsync_end = 864 + 1 + 1,
> +	.vtotal = 864 + 1 + 1 + 1,
> +	/*
> +	 * Some desired refresh rate, experiments at the maximum "pixel"
> +	 * clock speed (HS clock 420 MHz) yields around 117Hz.
> +	 */
> +	.vrefresh = 60,
> +	.width_mm = 48,
> +	.height_mm = 84,
> +};
> +
> +static inline struct acx424akp *panel_to_acx424akp(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct acx424akp, panel);
> +}
> +
> +#define FOSC			20 /* 20Mhz */
> +#define SCALE_FACTOR_NS_DIV_MHZ	1000
> +
> +static int acx424akp_set_brightness(struct backlight_device *bl)
> +{
> +	struct acx424akp *acx = bl_get_data(bl);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
> +	int period_ns = 1023;
> +	int duty_ns = bl->props.brightness;
> +	u8 pwm_ratio;
> +	u8 pwm_div;
> +	u8 par;
> +	int ret;
> +
> +	/* Calculate the PWM duty cycle in n/256's */
> +	pwm_ratio = max(((duty_ns * 256) / period_ns) - 1, 1);
> +	pwm_div = max(1,
> +		      ((FOSC * period_ns) / 256) /
> +		      SCALE_FACTOR_NS_DIV_MHZ);
> +
> +	/* Set up PWM dutycycle ONE byte (differs from the standard) */
> +	DRM_DEV_DEBUG(acx->dev, "calculated duty cycle %02x\n", pwm_ratio);
> +	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				 &pwm_ratio, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to set display PWM ratio (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Sequence to write PWMDIV:
> +	 *	address		data
> +	 *	0xF3		0xAA   CMD2 Unlock
> +	 *	0x00		0x01   Enter CMD2 page 0
> +	 *	0X7D		0x01   No reload MTP of CMD2 P1
> +	 *	0x22		PWMDIV
> +	 *	0x7F		0xAA   CMD2 page 1 lock
> +	 */
> +	par = 0xaa;
> +	ret = mipi_dsi_dcs_write(dsi, 0xf3, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to unlock CMD 2 (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	par = 0x01;
> +	ret = mipi_dsi_dcs_write(dsi, 0x00, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to enter page 1 (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	par = 0x01;
> +	ret = mipi_dsi_dcs_write(dsi, 0x7d, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to disable MTP reload (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	ret = mipi_dsi_dcs_write(dsi, 0x22, &pwm_div, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to set PWM divisor (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	par = 0xaa;
> +	ret = mipi_dsi_dcs_write(dsi, 0x7f, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to lock CMD 2 (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/* Enable backlight */
> +	par = 0x24;
> +	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				 &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to enable display backlight (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops acx424akp_bl_ops = {
> +	.update_status = acx424akp_set_brightness,
> +};
The backlight handling uses some part of the backlight infrasteructure
but not everything.
I would expect that backlight was configured by a node in DT.
And we used the backlight infrastructure as much as possible.
So in the end you would rely on the newly added backlight support
in drm_panel to turn on and off the backlight.


> +
> +static int acx424akp_read_id(struct acx424akp *acx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
> +	u8 header, version, id;
> +	u16 val;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_read(dsi, ACX424_DCS_READ_ID1, &header, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read ID header byte\n");
> +		return ret;
> +	}
> +	ret = mipi_dsi_dcs_read(dsi, ACX424_DCS_READ_ID2, &id, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read device ID byte\n");
> +		return ret;
> +	}
> +	ret = mipi_dsi_dcs_read(dsi, ACX424_DCS_READ_ID3, &version, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read version byte\n");
> +		return ret;
> +	}
> +
> +	if (header == 0x00) {
> +		DRM_DEV_ERROR(acx->dev, "device ID header is zero\n");
> +		return -ENODEV;
> +	}
> +
> +	val = (id << 8) | version;
> +	switch (val) {
> +	case DISPLAY_SONY_ACX424AKP_ID1:
> +	case DISPLAY_SONY_ACX424AKP_ID2:
> +	case DISPLAY_SONY_ACX424AKP_ID3:
> +		DRM_DEV_INFO(acx->dev, "panel ID %02x, version: %02x\n",
> +			     id, version);
> +		break;
> +	default:
> +		DRM_DEV_INFO(acx->dev, "unknown panel ID %02x, version: %02x\n",
> +			     id, version);
> +		break;
> +	}
> +	acx->version = version;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_power_on(struct acx424akp *acx)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(acx->supply);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enable supply (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 1);
> +	udelay(20);
> +	/* De-assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 0);
> +	msleep(11);
> +
> +	return 0;
> +}
> +
> +static int acx424akp_prepare(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
> +	const u8 mddi = 3;
> +	int ret;
> +
> +	ret = acx424akp_power_on(acx);
> +	if (ret)
> +		return ret;
> +
> +	/* Enabe tearing mode: send TE (tearing effect) at VBLANK */
> +	ret = mipi_dsi_dcs_set_tear_on(dsi,
> +				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enable vblank TE (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/* Set MDDI */
> +	ret = mipi_dsi_dcs_write(dsi, MIPI_DSI_DCS_SET_MDDI,
> +				 &mddi, sizeof(mddi));
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "failed to set MDDI (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Exit sleep mode */
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to exit sleep mode (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	msleep(140);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to turn display on (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	if (acx->video_mode) {
> +		/* In video mode turn peripheral on */
> +		ret = mipi_dsi_turn_on_peripheral(dsi);
> +		if (ret) {
> +			dev_err(acx->dev, "failed to turn on peripheral\n");
> +			return ret;
> +		}
> +	}
> +
> +	acx->bl->props.power = FB_BLANK_NORMAL;
> +
> +	return 0;
> +}
> +
> +static void acx424akp_power_off(struct acx424akp *acx)
> +{
> +	/* Assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 1);
> +	msleep(11);
> +
> +	regulator_disable(acx->supply);
> +}
> +
> +static int acx424akp_unprepare(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
> +	u8 par;
> +	int ret;
> +
> +	/* Disable backlight */
> +	par = 0x00;
> +	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				 &par, 1);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to disable display backlight (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to turn display off (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/* Enter sleep mode */
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enter sleep mode (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	msleep(85);
> +
> +	acx424akp_power_off(acx);
> +	acx->bl->props.power = FB_BLANK_POWERDOWN;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_enable(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +
> +	acx->bl->props.power = FB_BLANK_UNBLANK;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_disable(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +
> +	acx->bl->props.power = FB_BLANK_NORMAL;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_get_modes(struct drm_panel *panel)
This needs a connector argument to build on top of drm-misc-next.

> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +	struct drm_connector *connector = panel->connector;
And this will be gone as drm_panel no logner has a connector.

> +	struct drm_display_mode *mode;
> +
> +	if (acx->video_mode)
> +		mode = drm_mode_duplicate(panel->drm,
> +					  &sony_acx424akp_vid_mode);
> +	else
> +		mode = drm_mode_duplicate(panel->drm,
> +					  &sony_acx424akp_cmd_mode);
> +	if (!mode) {
> +		DRM_ERROR("bad mode or failed to add mode\n");
> +		return -EINVAL;
> +	}
> +	drm_mode_set_name(mode);
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1; /* Number of modes */
> +}
> +
> +static const struct drm_panel_funcs acx424akp_drm_funcs = {
> +	.disable = acx424akp_disable,
> +	.unprepare = acx424akp_unprepare,
> +	.prepare = acx424akp_prepare,
> +	.enable = acx424akp_enable,
> +	.get_modes = acx424akp_get_modes,
> +};
> +
> +static int acx424akp_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct acx424akp *acx;
> +	int ret;
> +	unsigned int i;
> +
> +	acx = devm_kzalloc(dev, sizeof(struct acx424akp), GFP_KERNEL);
> +	if (!acx)
> +		return -ENOMEM;
> +	acx->video_mode = of_property_read_bool(dev->of_node,
> +						"enforce-video-mode");
> +
> +	mipi_dsi_set_drvdata(dsi, acx);
> +	acx->dev = dev;
> +
> +	dsi->lanes = 2;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	/*
> +	 * FIXME: these come from the ST-Ericsson vendor driver for the
> +	 * HREF520 and seems to reflect limitations in the PLLs on that
> +	 * platform, if you have the datasheet, please cross-check the
> +	 * actual max rates.
> +	 */
> +	dsi->lp_rate = 19200000;
> +	dsi->hs_rate = 420160000;
> +
> +	if (acx->video_mode)
> +		/* Burst mode using event for sync */
> +		dsi->mode_flags =
> +			MIPI_DSI_MODE_VIDEO |
> +			MIPI_DSI_MODE_VIDEO_BURST;
> +	else
> +		dsi->mode_flags =
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			MIPI_DSI_MODE_EOT_PACKET;
> +
> +	acx->supply = devm_regulator_get(dev, "vddi");
> +	if (IS_ERR(acx->supply))
> +		return PTR_ERR(acx->supply);
> +
> +	/* This asserts RESET by default */
> +	acx->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						 GPIOD_OUT_HIGH);
> +	if (IS_ERR(acx->reset_gpio)) {
> +		ret = PTR_ERR(acx->reset_gpio);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to request GPIO (%d)\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	drm_panel_init(&acx->panel);
> +	acx->panel.dev = dev;
> +	acx->panel.funcs = &acx424akp_drm_funcs;
> +
> +	acx->bl = devm_backlight_device_register(dev, "acx424akp", dev, acx,
> +						 &acx424akp_bl_ops, NULL);
> +	if (IS_ERR(acx->bl)) {
> +		DRM_DEV_ERROR(dev, "failed to register backlight device\n");
> +		return PTR_ERR(acx->bl);
> +	}
> +	acx->bl->props.max_brightness = 1023;
> +	acx->bl->props.brightness = 512;
> +	acx->bl->props.power = FB_BLANK_POWERDOWN;
> +
> +	ret = drm_panel_add(&acx->panel);
> +	if (ret < 0)
> +		return ret;

From here....
> +
> +	ret = acx424akp_power_on(acx);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to power up display\n");
> +		goto out_remove;
> +	}
> +
> +	/* Try 5 times to read the device ID */
> +	for (i = 0; i < 5; i++) {
> +		ret = acx424akp_read_id(acx);
> +		if (!ret)
> +			break;
> +	}
> +
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to read panel ID (%d)\n", ret);
> +		goto out_poweroff;
> +	}
> +	acx424akp_power_off(acx);
The purpose of this code snippet is only to print the panel ID in the
logs - as I see it.
Could this be moved to the prepare function where we anyway power up the
panel?
This would simplify the probe code patch and we only have one place
where the panel is powered up.

And the version field in struct acx424akp may also be dropped.
It is assigned but not used.

> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0)
> +		goto out_poweroff;
> +
> +	return 0;
> +
> +out_poweroff:
> +	acx424akp_power_off(acx);
> +out_remove:
> +	drm_panel_remove(&acx->panel);
> +	return ret;
> +}
> +
> +static int acx424akp_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct acx424akp *acx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&acx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id acx424akp_of_match[] = {
> +	{ .compatible = "sony,acx424akp" },
> +	{ }
We often use
	{ /* sentinel */ },

as the lasty entry.


> +};
> +MODULE_DEVICE_TABLE(of, acx424akp_of_match);
> +
> +static struct mipi_dsi_driver acx424akp_driver = {
> +	.probe = acx424akp_probe,
> +	.remove = acx424akp_remove,
> +	.driver = {
> +		.name = "panel-sony-acx424akp",
> +		.of_match_table = acx424akp_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(acx424akp_driver);
> +
> +MODULE_AUTHOR("Linus Wallei <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("MIPI-DSI Sony acx424akp Panel Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/video/mipi_display.h b/include/video/mipi_display.h
> index cba57a678daf..cf99c6a519d5 100644
> --- a/include/video/mipi_display.h
> +++ b/include/video/mipi_display.h
> @@ -125,6 +125,7 @@ enum {
>  	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS = 0x5F,	/* MIPI DCS 1.3 */
>  	MIPI_DCS_READ_DDB_START		= 0xA1,
>  	MIPI_DCS_READ_DDB_CONTINUE	= 0xA8,
> +	MIPI_DSI_DCS_SET_MDDI		= 0xAE,
>  };
>  
>  /* MIPI DCS pixel formats */
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
