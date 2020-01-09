Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C5135B34
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 15:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571BD6E451;
	Thu,  9 Jan 2020 14:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F096E450
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 14:17:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1161E8046C;
 Thu,  9 Jan 2020 15:17:49 +0100 (CET)
Date: Thu, 9 Jan 2020 15:17:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8] drm/panel: Add driver for Sony ACX424AKP panel
Message-ID: <20200109141748.GB12940@ravnborg.org>
References: <20200109072815.334867-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109072815.334867-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8
 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=rMnqufO1cSfMOrkemJAA:9
 a=Th72qVVbizDdsAwq:21 a=tE1KJuw2QIZSe0QK:21 a=CjuIK1q_8ugA:10
 a=A2jcf3dkIZPIRbEE90CI:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
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

On Thu, Jan 09, 2020 at 08:28:15AM +0100, Linus Walleij wrote:
> The Sony ACX424AKP is a command/videomode DSI panel for
> mobile devices. It is used on the ST-Ericsson HREF520
> reference design. We support video mode by default, but
> it is possible to switch the panel into command mode
> by using the bool property "dsi-command-mode".
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to drm-misc-next.

Thanks,
	Sam


> ---
> ChangeLog v7->v8:
> - Fix some compilation problems due to the connector refactoring
>   that went in recently so all builds fine now.
> - Add a MAINTAINERS entry for the driver.
> - Convert some msleep() to usleep_range(): it's fine to sleep some
>   more so make this explicit.
> ChangeLog v6->v7:
> - Add some Kconfig help text.
> - Sort includes alphabetically.
> - Move the struct drm_panel first in the state container
>   struct since we are subclassing the panel class.
> - Put an explicit /* sentinel */ text in the NULL entry
>   for compatible.
> - Move MTP ID readout to the .prepare() callback.
> - Add a verbose comment about the MDDI setting so others
>   understand what may be going on.
> - Explain why the backlight follows the display and cannot
>   be turned on/off
> ChangeLog v5->v6:
> - Move the "set MDDI" command back to this file. It is a
>   local pecularity, we suspect there is a Novatek controller
>   inside this display.
> ChangeLog v4->v5:
> - Bindings were iterated separately so a jump in versioning.
> - Add Stephan as reviewer.
> ChangeLog v3->v4:
> - No changes just resending with the new binding updates.
> ChangeLog v2->v3:
> - No changes just resending with the new binding updates.
> ChangeLog v1->v2:
> - Fix up the ID read function to split into reading header,
>   version and ID, store the version in the struct.
> - Get rid of a surplus semicolon found by the build robot
>   while rewriting the above code.
> - Use unsigned int in probe() loop.
> - Set vrefresh to 60Hz, as good as any, the measured vrefresh
>   in continous command mode is ~117 Hz.
> - Use a different for() idiom while retrying to read ID
>   5 times.
> - Drop the sync pulse setting, we are not using this, this
>   panel uses an event.
> - Use the generic "enforce-video-mode" for video mode
>   enforcement.
> ---
>  MAINTAINERS                                  |   6 +
>  drivers/gpu/drm/panel/Kconfig                |  11 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c | 550 +++++++++++++++++++
>  4 files changed, 568 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-sony-acx424akp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4118dfe61867..3d5cbbaee117 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5368,6 +5368,12 @@ S:	Maintained
>  F:	drivers/gpu/drm/tiny/st7735r.c
>  F:	Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>  
> +DRM DRIVER FOR SONY ACX424AKP PANELS
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +S:	Maintained
> +F:	drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +
>  DRM DRIVER FOR ST-ERICSSON MCDE
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 41f796b28dd5..ae44ac2ec106 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -338,6 +338,17 @@ config DRM_PANEL_SITRONIX_ST7789V
>  	  Say Y here if you want to enable support for the Sitronix
>  	  ST7789V controller for 240x320 LCD panels
>  
> +config DRM_PANEL_SONY_ACX424AKP
> +	tristate "Sony ACX424AKP DSI command mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y here if you want to enable the Sony ACX424 display
> +	  panel. This panel supports DSI in both command and video
> +	  mode.
> +
>  config DRM_PANEL_SONY_ACX565AKM
>  	tristate "Sony ACX565AKM panel"
>  	depends on GPIOLIB && OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 4dc7acff21b9..7c4d3c581fd4 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) += panel-sharp-ls043t1le01.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> +obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> new file mode 100644
> index 000000000000..de0abf76ae6f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -0,0 +1,550 @@
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
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#define ACX424_DCS_READ_ID1		0xDA
> +#define ACX424_DCS_READ_ID2		0xDB
> +#define ACX424_DCS_READ_ID3		0xDC
> +#define ACX424_DCS_SET_MDDI		0xAE
> +
> +/*
> + * Sony seems to use vendor ID 0x81
> + */
> +#define DISPLAY_SONY_ACX424AKP_ID1	0x811b
> +#define DISPLAY_SONY_ACX424AKP_ID2	0x811a
> +/*
> + * The third ID looks like a bug, vendor IDs begin at 0x80
> + * and panel 00 ... seems like default values.
> + */
> +#define DISPLAY_SONY_ACX424AKP_ID3	0x8000
> +
> +struct acx424akp {
> +	struct drm_panel panel;
> +	struct device *dev;
> +	struct backlight_device *bl;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
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
> +
> +static int acx424akp_read_id(struct acx424akp *acx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
> +	u8 vendor, version, panel;
> +	u16 val;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_read(dsi, ACX424_DCS_READ_ID1, &vendor, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not vendor ID byte\n");
> +		return ret;
> +	}
> +	ret = mipi_dsi_dcs_read(dsi, ACX424_DCS_READ_ID2, &version, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read device version byte\n");
> +		return ret;
> +	}
> +	ret = mipi_dsi_dcs_read(dsi, ACX424_DCS_READ_ID3, &panel, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read panel ID byte\n");
> +		return ret;
> +	}
> +
> +	if (vendor == 0x00) {
> +		DRM_DEV_ERROR(acx->dev, "device vendor ID is zero\n");
> +		return -ENODEV;
> +	}
> +
> +	val = (vendor << 8) | panel;
> +	switch (val) {
> +	case DISPLAY_SONY_ACX424AKP_ID1:
> +	case DISPLAY_SONY_ACX424AKP_ID2:
> +	case DISPLAY_SONY_ACX424AKP_ID3:
> +		DRM_DEV_INFO(acx->dev,
> +			     "MTP vendor: %02x, version: %02x, panel: %02x\n",
> +			     vendor, version, panel);
> +		break;
> +	default:
> +		DRM_DEV_INFO(acx->dev,
> +			     "unknown vendor: %02x, version: %02x, panel: %02x\n",
> +			     vendor, version, panel);
> +		break;
> +	}
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
> +	usleep_range(11000, 20000);
> +
> +	return 0;
> +}
> +
> +static void acx424akp_power_off(struct acx424akp *acx)
> +{
> +	/* Assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 1);
> +	usleep_range(11000, 20000);
> +
> +	regulator_disable(acx->supply);
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
> +	ret = acx424akp_read_id(acx);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to read panel ID (%d)\n", ret);
> +		goto err_power_off;
> +	}
> +
> +	/* Enabe tearing mode: send TE (tearing effect) at VBLANK */
> +	ret = mipi_dsi_dcs_set_tear_on(dsi,
> +				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enable vblank TE (%d)\n",
> +			      ret);
> +		goto err_power_off;
> +	}
> +
> +	/*
> +	 * Set MDDI
> +	 *
> +	 * This presumably deactivates the Qualcomm MDDI interface and
> +	 * selects DSI, similar code is found in other drivers such as the
> +	 * Sharp LS043T1LE01 which makes us suspect that this panel may be
> +	 * using a Novatek NT35565 or similar display driver chip that shares
> +	 * this command. Due to the lack of documentation we cannot know for
> +	 * sure.
> +	 */
> +	ret = mipi_dsi_dcs_write(dsi, ACX424_DCS_SET_MDDI,
> +				 &mddi, sizeof(mddi));
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "failed to set MDDI (%d)\n", ret);
> +		goto err_power_off;
> +	}
> +
> +	/* Exit sleep mode */
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to exit sleep mode (%d)\n",
> +			      ret);
> +		goto err_power_off;
> +	}
> +	msleep(140);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to turn display on (%d)\n",
> +			      ret);
> +		goto err_power_off;
> +	}
> +	if (acx->video_mode) {
> +		/* In video mode turn peripheral on */
> +		ret = mipi_dsi_turn_on_peripheral(dsi);
> +		if (ret) {
> +			dev_err(acx->dev, "failed to turn on peripheral\n");
> +			goto err_power_off;
> +		}
> +	}
> +
> +	acx->bl->props.power = FB_BLANK_NORMAL;
> +
> +	return 0;
> +
> +err_power_off:
> +	acx424akp_power_off(acx);
> +	return ret;
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
> +	/*
> +	 * The backlight is on as long as the display is on
> +	 * so no use to call backlight_enable() here.
> +	 */
> +	acx->bl->props.power = FB_BLANK_UNBLANK;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_disable(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +
> +	/*
> +	 * The backlight is on as long as the display is on
> +	 * so no use to call backlight_disable() here.
> +	 */
> +	acx->bl->props.power = FB_BLANK_NORMAL;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct acx424akp *acx = panel_to_acx424akp(panel);
> +	struct drm_display_mode *mode;
> +
> +	if (acx->video_mode)
> +		mode = drm_mode_duplicate(connector->dev,
> +					  &sony_acx424akp_vid_mode);
> +	else
> +		mode = drm_mode_duplicate(connector->dev,
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
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(acx->reset_gpio)) {
> +		ret = PTR_ERR(acx->reset_gpio);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to request GPIO (%d)\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	drm_panel_init(&acx->panel, dev, &acx424akp_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
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
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&acx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
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
> +	{ /* sentinel */ }
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
> -- 
> 2.23.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
