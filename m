Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFE55A31E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB57410E4F8;
	Fri, 24 Jun 2022 20:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF7310E4F8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=/JChbeb0+ddPmmhO6bH/gW0U7jB0TFUZa9rFUexUNuw=;
 b=JKdJQEUfKp1QFV+UD99j1ydTv/QU9prvh84O/u7VG9e4EIdpKRXsMDgY0Z9bRuBasFpJB8lm5MgOm
 X7rGj9oNcJW4a0iHpf16+ttxXHXB4F/0LH59IQiZM/FyE9fTNnd6kSARLQlOEpXCeWbI8UX0km8fKK
 7a63EKWr6VdoPI5AylGX1VJh0vM5492xqLk//J/YOz86+vRyyv+LJo1y3DUnOk86EDclCErNZt6Fge
 NGmoQoBmQnAkrZtcELTFsUL5xZXGYPCmPQw7/tLzF+sf30c5EtIJhaLfLOhZx5OleIraoA3xHAJ/Tv
 D2v38pdivXNsKxnJxrYqZgZyFQ/mNCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=/JChbeb0+ddPmmhO6bH/gW0U7jB0TFUZa9rFUexUNuw=;
 b=J+aAbwG8hKeK+atJ+qj57zXphDBbLq9UWl53vXw/i9HQJ3XTpsJoi+riVNTbpEwZMhr0OHOKQydiA
 Awx56rMAQ==
X-HalOne-Cookie: 3f7c760cad120e0e31a1fa96f348245ab13e84d1
X-HalOne-ID: 411b75fe-f400-11ec-8233-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 411b75fe-f400-11ec-8233-d0431ea8bb10;
 Fri, 24 Jun 2022 20:57:27 +0000 (UTC)
Date: Fri, 24 Jun 2022 22:57:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Max Fierke <max@maxfierke.com>
Subject: Re: [PATCH 3/3] drm: panel: Add driver for ClockworkPi cwd686 panel
Message-ID: <YrYlNeYcoUDqnPEq@ravnborg.org>
References: <20220601051748.1305450-1-max@maxfierke.com>
 <20220601051748.1305450-4-max@maxfierke.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601051748.1305450-4-max@maxfierke.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Max,

On Wed, Jun 01, 2022 at 12:17:48AM -0500, Max Fierke wrote:
> The ClockworkPi DevTerm (all models) uses a 6.86" IPS display
> of unknown provenance, which uses the Chipone ICNL9707 IC driver.
> 
> The display panel I have has two model numbers: TXW686001 and WTL068601G,
> but cannot find any manufacturer associated with either, so opting for the
> ClockworkPi model number.
> 
> This driver is based on the GPL-licensed driver released by ClockworkPi,
> authored by Pinfan Zhu, with some additional cleanup, rotation support,
> and display sleep re-enabling done by me.

In general a nice driver, but there is a few comments in the following.

	Sam

> 
> Original driver here for reference: https://github.com/clockworkpi/DevTerm/blob/main/Code/patch/armbian_build_a06/patch/kernel-004-panel.patch
> Display IC datasheet provided here: https://github.com/clockworkpi/DevTerm/blob/main/Schematics/ICNL9707_Datasheet.pdf
Thanks for providing pointers!
> 
> Signed-off-by: Max Fierke <max@maxfierke.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-clockworkpi-cwd686.c  | 458 ++++++++++++++++++
>  3 files changed, 471 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4f1f004b3c54..f9cf2c8124b7 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -68,6 +68,18 @@ config DRM_PANEL_BOE_TV101WUM_NL6
>  	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
>  	  45NA WUXGA PANEL DSI Video Mode panel
>  
> +config DRM_PANEL_CLOCKWORKPI_CWD686
> +	tristate "ClockworkPi CWD686 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the ClockworkPi CWD686
> +	  ICNL9707-based panel, e.g. as used within the ClockworkPi DevTerm.
> +	  The panel has a 480x1280 resolution and uses 24 bit RGB per pixel.
> +
> +	  To compile this driver as a module, choose M here.
> +
>  config DRM_PANEL_DSI_CM
>  	tristate "Generic DSI command mode panels"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 42a7ab54234b..24584bd7d4f8 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.
>  obj-$(CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0) += panel-boe-bf060y8m-aj0.o
>  obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
> +obj-$(CONFIG_DRM_PANEL_CLOCKWORKPI_CWD686) += panel-clockworkpi-cwd686.o
>  obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
>  obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
> diff --git a/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c b/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c
> new file mode 100644
> index 000000000000..4ef24388d37c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c
> @@ -0,0 +1,458 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Clockwork Tech LLC
> + * Copyright (c) 2021-2022 Max Fierke <max@maxfierke.com>
> + *
> + * Based on Pinfan Zhu's work on panel-cwd686.c for ClockworkPi's 5.10 BSP
> + */
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <video/mipi_display.h>

The typical order of include files are:

#include <linux/..>
- empty line
#include <video/...>
- empty line
#include <drm/...>

Please adjust accordingly.


> +
> +struct cwd686 {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct regulator *supply;
supply is not used in the following.

> +	struct gpio_desc *enable_gpio;
enable_gpio is not used in the following.

> +	struct gpio_desc *reset_gpio;
> +	struct backlight_device *backlight;
Please consider to use panel->backlight.
This will also give you backlight_enable() and backlight_disable() calls
for free.
If you for some reason cannot use this, then usign your own backlight
pointer is correct.

> +	enum drm_panel_orientation orientation;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static const struct drm_display_mode default_mode = {
> +	.clock = 54465,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 150,
> +	.hsync_end = 480 + 150 + 24,
> +	.htotal = 480 + 150 + 24 + 40,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 12,
> +	.vsync_end = 1280 + 12 + 6,
> +	.vtotal = 1280 + 12 + 6 + 10,
> +};
> +
> +static inline struct cwd686 *panel_to_cwd686(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct cwd686, panel);
> +}
> +
> +#define ICNL9707_DCS(seq...)                              \
> +({                                                              \
> +	static const u8 d[] = { seq };                          \
> +	mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	 \
> +})
Use mipi_dsi_dcs_write_seq() so you get error checking, and then you can
drop this macro.

> +
> +#define ICNL9707_CMD_CGOUTL 0xB3
> +#define ICNL9707_CMD_CGOUTR 0xB4
> +#define ICNL9707_P_CGOUT_VGL 0x00
> +#define ICNL9707_P_CGOUT_VGH 0x01
> +#define ICNL9707_P_CGOUT_HZ 0x02
> +#define ICNL9707_P_CGOUT_GND 0x03
> +#define ICNL9707_P_CGOUT_GSP1 0x04
> +#define ICNL9707_P_CGOUT_GSP2 0x05
> +#define ICNL9707_P_CGOUT_GSP3 0x06
> +#define ICNL9707_P_CGOUT_GSP4 0x07
> +#define ICNL9707_P_CGOUT_GSP5 0x08
> +#define ICNL9707_P_CGOUT_GSP6 0x09
> +#define ICNL9707_P_CGOUT_GSP7 0x0A
> +#define ICNL9707_P_CGOUT_GSP8 0x0B
> +#define ICNL9707_P_CGOUT_GCK1 0x0C
> +#define ICNL9707_P_CGOUT_GCK2 0x0D
> +#define ICNL9707_P_CGOUT_GCK3 0x0E
> +#define ICNL9707_P_CGOUT_GCK4 0x0F
> +#define ICNL9707_P_CGOUT_GCK5 0x10
> +#define ICNL9707_P_CGOUT_GCK6 0x11
> +#define ICNL9707_P_CGOUT_GCK7 0x12
> +#define ICNL9707_P_CGOUT_GCK8 0x13
> +#define ICNL9707_P_CGOUT_GCK9 0x14
> +#define ICNL9707_P_CGOUT_GCK10 0x15
> +#define ICNL9707_P_CGOUT_GCK11 0x16
> +#define ICNL9707_P_CGOUT_GCK12 0x17
> +#define ICNL9707_P_CGOUT_GCK13 0x18
> +#define ICNL9707_P_CGOUT_GCK14 0x19
> +#define ICNL9707_P_CGOUT_GCK15 0x1A
> +#define ICNL9707_P_CGOUT_GCK16 0x1B
> +#define ICNL9707_P_CGOUT_DIR 0x1C
> +#define ICNL9707_P_CGOUT_DIRB 0x1D
> +#define ICNL9707_P_CGOUT_ECLK_AC 0x1E
> +#define ICNL9707_P_CGOUT_ECLK_ACB 0x1F
> +#define ICNL9707_P_CGOUT_ECLK_AC2 0x20
> +#define ICNL9707_P_CGOUT_ECLK_AC2B 0x21
> +#define ICNL9707_P_CGOUT_GCH 0x22
> +#define ICNL9707_P_CGOUT_GCL 0x23
> +#define ICNL9707_P_CGOUT_XDON 0x24
> +#define ICNL9707_P_CGOUT_XDONB 0x25
> +
> +#define ICNL9707_MADCTL_ML  0x10
> +#define ICNL9707_MADCTL_RGB 0x00
> +#define ICNL9707_MADCTL_BGR 0x08
> +#define ICNL9707_MADCTL_MH  0x04
> +
> +#define ICNL9707_CMD_PWRCON_VCOM 0xB6
> +#define ICNL9707_P_PWRCON_VCOM_0495V 0x0D
> +
> +#define ICNL9707_CMD_PWRCON_SEQ 0xB7
> +#define ICNL9707_CMD_PWRCON_CLK 0xB8
> +#define ICNL9707_CMD_PWRCON_BTA 0xB9
> +#define ICNL9707_CMD_PWRCON_MODE 0xBA
> +#define ICNL9707_CMD_PWRCON_REG 0xBD
> +
> +#define ICNL9707_CMD_TCON 0xC1
> +#define ICNL9707_CMD_TCON2 0xC2
> +#define ICNL9707_CMD_TCON3 0xC3
> +#define ICNL9707_CMD_SRC_TIM 0xC6
> +#define ICNL9707_CMD_SRCCON 0xC7
> +#define ICNL9707_CMD_SET_GAMMA 0xC8
> +
> +#define ICNL9707_CMD_ETC 0xD0
> +
> +#define ICNL9707_CMD_PASSWORD1 0xF0
> +#define ICNL9707_P_PASSWORD1_DEFAULT 0xA5
> +#define ICNL9707_P_PASSWORD1_ENABLE_LVL2 0x5A
> +
> +#define ICNL9707_CMD_PASSWORD2 0xF1
> +#define ICNL9707_P_PASSWORD2_DEFAULT 0x5A
> +#define ICNL9707_P_PASSWORD2_ENABLE_LVL2 0xA5
> +
> +static int cwd686_init_sequence(struct cwd686 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int err;
> +
> +	/* Enable access to Level 2 registers */
> +	ICNL9707_DCS(ICNL9707_CMD_PASSWORD1,
> +		     ICNL9707_P_PASSWORD1_ENABLE_LVL2,
> +		     ICNL9707_P_PASSWORD1_ENABLE_LVL2);
> +	ICNL9707_DCS(ICNL9707_CMD_PASSWORD2,
> +		     ICNL9707_P_PASSWORD2_ENABLE_LVL2,
> +		     ICNL9707_P_PASSWORD2_ENABLE_LVL2);
> +
> +	/* Set PWRCON_VCOM (-0.495V, -0.495V) */
> +	ICNL9707_DCS(ICNL9707_CMD_PWRCON_VCOM,
> +		     ICNL9707_P_PWRCON_VCOM_0495V,
> +		     ICNL9707_P_PWRCON_VCOM_0495V);
> +
> +	/* Map ASG output signals */
> +	ICNL9707_DCS(ICNL9707_CMD_CGOUTR,
> +		     ICNL9707_P_CGOUT_GSP7, ICNL9707_P_CGOUT_GSP5,
> +		     ICNL9707_P_CGOUT_GCK7, ICNL9707_P_CGOUT_GCK5,
> +		     ICNL9707_P_CGOUT_GCK3, ICNL9707_P_CGOUT_GCK1,
> +		     ICNL9707_P_CGOUT_VGL, ICNL9707_P_CGOUT_VGL,
> +		     ICNL9707_P_CGOUT_VGL, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_VGL, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GND, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GND, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GND, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GSP1, ICNL9707_P_CGOUT_GSP3);
> +	ICNL9707_DCS(ICNL9707_CMD_CGOUTL,
> +		     ICNL9707_P_CGOUT_GSP8, ICNL9707_P_CGOUT_GSP6,
> +		     ICNL9707_P_CGOUT_GCK8, ICNL9707_P_CGOUT_GCK6,
> +		     ICNL9707_P_CGOUT_GCK4, ICNL9707_P_CGOUT_GCK2,
> +		     ICNL9707_P_CGOUT_VGL, ICNL9707_P_CGOUT_VGL,
> +		     ICNL9707_P_CGOUT_VGL, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_VGL, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GND, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GND, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GND, ICNL9707_P_CGOUT_GND,
> +		     ICNL9707_P_CGOUT_GSP2, ICNL9707_P_CGOUT_GSP4);
> +
> +	/* Undocumented commands provided by the vendor */
> +	ICNL9707_DCS(0xB0, 0x54, 0x32, 0x23, 0x45, 0x44, 0x44, 0x44, 0x44, 0x90, 0x01, 0x90, 0x01);
> +	ICNL9707_DCS(0xB1, 0x32, 0x84, 0x02, 0x83, 0x30, 0x01, 0x6B, 0x01);
> +	ICNL9707_DCS(0xB2, 0x73);
> +
> +	ICNL9707_DCS(ICNL9707_CMD_PWRCON_REG,
> +		     0x4E, 0x0E, 0x50, 0x50, 0x26,
> +		     0x1D, 0x00, 0x14, 0x42, 0x03);
> +	ICNL9707_DCS(ICNL9707_CMD_PWRCON_SEQ,
> +		     0x01, 0x01, 0x09, 0x11, 0x0D, 0x55,
> +		     0x19, 0x19, 0x21, 0x1D, 0x00, 0x00,
> +		     0x00, 0x00, 0x02, 0xFF, 0x3C);
> +	ICNL9707_DCS(ICNL9707_CMD_PWRCON_CLK, 0x23, 0x01, 0x30, 0x34, 0x63);
> +
> +	/* Disable abnormal power-off flag */
> +	ICNL9707_DCS(ICNL9707_CMD_PWRCON_BTA, 0xA0, 0x22, 0x00, 0x44);
> +
> +	ICNL9707_DCS(ICNL9707_CMD_PWRCON_MODE, 0x12, 0x63);
> +
> +	/* Set VBP, VFP, VSW, HBP, HFP, HSW */
> +	ICNL9707_DCS(ICNL9707_CMD_TCON, 0x0C, 0x16, 0x04, 0x0C, 0x10, 0x04);
> +
> +	/* Set resolution */
> +	ICNL9707_DCS(ICNL9707_CMD_TCON2, 0x11, 0x41);
> +
> +	/* Set frame blanking */
> +	ICNL9707_DCS(ICNL9707_CMD_TCON3, 0x22, 0x31, 0x04);
> +
> +	ICNL9707_DCS(ICNL9707_CMD_SRCCON, 0x05, 0x23, 0x6B, 0x49, 0x00);
> +
> +	/* Another undocumented command */
> +	ICNL9707_DCS(0xC5, 0x00);
> +
> +	ICNL9707_DCS(ICNL9707_CMD_ETC, 0x37, 0xFF, 0xFF);
> +
> +	/* Another set of undocumented commands */
> +	ICNL9707_DCS(0xD2, 0x63, 0x0B, 0x08, 0x88);
> +	ICNL9707_DCS(0xD3, 0x01, 0x00, 0x00, 0x01, 0x01, 0x37, 0x25, 0x38, 0x31, 0x06, 0x07);
> +
> +	/* Set Gamma to 2.2 */
> +	ICNL9707_DCS(ICNL9707_CMD_SET_GAMMA,
> +		     0x7C, 0x6A, 0x5D, 0x53, 0x53, 0x45, 0x4B,
> +		     0x35, 0x4D, 0x4A, 0x49, 0x66, 0x53, 0x57,
> +		     0x4A, 0x48, 0x3B, 0x2A, 0x06, 0x7C, 0x6A,
> +		     0x5D, 0x53, 0x53, 0x45, 0x4B, 0x35, 0x4D,
> +		     0x4A, 0x49, 0x66, 0x53, 0x57, 0x4A, 0x48,
> +		     0x3B, 0x2A, 0x06);
> +
> +	ICNL9707_DCS(ICNL9707_CMD_SRC_TIM, 0x00, 0x00, 0xFF, 0x00, 0x00, 0xFF, 0x00, 0x00);
> +
> +	/* Another undocumented command */
> +	ICNL9707_DCS(0xF4, 0x08, 0x77);
> +
> +	ICNL9707_DCS(MIPI_DCS_SET_ADDRESS_MODE,
> +		     ICNL9707_MADCTL_RGB | ICNL9707_MADCTL_ML | ICNL9707_MADCTL_MH);
> +
> +	/* Enable tearing mode at VBLANK */
> +	err = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (err) {
> +		dev_err(ctx->dev, "failed to enable vblank TE (%d)\n", err);
> +		return err;
> +	}
> +
> +	/* Disable access to Level 2 registers */
> +	ICNL9707_DCS(ICNL9707_CMD_PASSWORD2,
> +		     ICNL9707_P_PASSWORD2_DEFAULT,
> +		     ICNL9707_P_PASSWORD2_DEFAULT);
> +	ICNL9707_DCS(ICNL9707_CMD_PASSWORD1,
> +		     ICNL9707_P_PASSWORD1_DEFAULT,
> +		     ICNL9707_P_PASSWORD1_DEFAULT);
> +
> +	return 0;
> +}
> +
> +static int cwd686_disable(struct drm_panel *panel)
> +{
> +	struct cwd686 *ctx = panel_to_cwd686(panel);
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
If panel->backlight is used then both the enable and disable functions
can be dropped. And then the enable flags can be dropped too.


> +
> +static int cwd686_unprepare(struct drm_panel *panel)
> +{
> +	struct cwd686 *ctx = panel_to_cwd686(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int err;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	err = mipi_dsi_dcs_set_display_off(dsi);
> +	if (err) {
> +		dev_err(ctx->dev, "failed to turn display off (%d)\n", err);
> +		return err;
> +	}
> +
> +	err = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (err) {
> +		dev_err(ctx->dev, "failed to enter sleep mode (%d)\n", err);
> +		return err;
> +	}
> +
> +	msleep(120);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +	ctx->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int cwd686_prepare(struct drm_panel *panel)
> +{
> +	struct cwd686 *ctx = panel_to_cwd686(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	int err;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	/* T2 */
> +	msleep(10);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	/* T3 */
> +	msleep(20);
> +
> +	/* Exit sleep mode and power on */
> +
> +	err = cwd686_init_sequence(ctx);
> +	if (err) {
> +		dev_err(ctx->dev, "failed to initialize display (%d)\n", err);
> +		return err;
> +	}
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (err) {
> +		dev_err(ctx->dev, "failed to exit sleep mode (%d)\n", err);
> +		return err;
> +	}
> +	/* T6 */
> +	msleep(120);
> +
> +	err = mipi_dsi_dcs_set_display_on(dsi);
> +	if (err) {
> +		dev_err(ctx->dev, "failed to turn display on (%d)\n", err);
> +		return err;
> +	}
> +	msleep(20);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +}
> +
> +static int cwd686_enable(struct drm_panel *panel)
> +{
> +	struct cwd686 *ctx = panel_to_cwd686(panel);
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	backlight_enable(ctx->backlight);
> +
> +	ctx->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int cwd686_get_modes(struct drm_panel *panel, struct drm_connector *connector)
> +{
> +	struct cwd686 *ctx = panel_to_cwd686(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &default_mode);
> +	if (!mode) {
> +		dev_err(panel->dev, "bad mode or failed to add mode\n");
> +		return -EINVAL;
> +	}
> +	drm_mode_set_name(mode);
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
height and width are not set in default_mode - so I think they are
always 0.

> +
> +	/* set up connector's "panel orientation" property */
Start sentence with uppercase letter.

> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1; /* Number of modes */
> +}
> +
> +static const struct drm_panel_funcs cwd686_drm_funcs = {
> +	.disable = cwd686_disable,
> +	.unprepare = cwd686_unprepare,
> +	.prepare = cwd686_prepare,
> +	.enable = cwd686_enable,
> +	.get_modes = cwd686_get_modes,
> +};
> +
> +static int cwd686_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct cwd686 *ctx;
> +	int err;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dev = dev;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +			  MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		err = PTR_ERR(ctx->reset_gpio);
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "failed to request GPIO (%d)\n", err);
Use dev_Err_probe() here.

> +		return err;
> +	}
> +
> +	ctx->backlight = devm_of_find_backlight(dev);
> +	if (IS_ERR(ctx->backlight))
> +		return PTR_ERR(ctx->backlight);
Here you can use drm_panel_of_backlight() that makes this simpler.

> +
> +	err = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (err) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
> +		return err;
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &cwd686_drm_funcs, DRM_MODE_CONNECTOR_DSI);
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	err = mipi_dsi_attach(dsi);
> +	if (err < 0) {
> +		dev_err(dev, "mipi_dsi_attach() failed: %d\n", err);
> +		drm_panel_remove(&ctx->panel);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cwd686_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct cwd686 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cwd686_of_match[] = {
> +	{ .compatible = "clockworkpi,cwd686" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cwd686_of_match);
> +
> +static struct mipi_dsi_driver cwd686_driver = {
> +	.probe = cwd686_probe,
> +	.remove = cwd686_remove,
> +	.driver = {
> +		.name = "panel-clockworkpi-cwd686",
> +		.of_match_table = cwd686_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(cwd686_driver);
> +
> +MODULE_AUTHOR("Pinfan Zhu <zhu@clockworkpi.com>");
> +MODULE_AUTHOR("Max Fierke <max@maxfierke.com>");
> +MODULE_DESCRIPTION("ClockworkPi CWD686 panel driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.36.1
