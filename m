Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845D23394D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 21:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F314A6E2E3;
	Thu, 30 Jul 2020 19:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DF46E2E3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 19:50:33 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 982122001E;
 Thu, 30 Jul 2020 21:50:28 +0200 (CEST)
Date: Thu, 30 Jul 2020 21:50:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/6] drm/panel: Add panel driver for NewVision NV3052C
 based LCDs
Message-ID: <20200730195027.GA1498774@ravnborg.org>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727164613.19744-5-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=8nb-H-kVqRZ6DcGSkuoA:9
 a=ntjCIQRDkOCl1atW:21 a=AweX8SZEGQVig1a6:21 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 od@zcrc.me, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

While I continue to try to wrap my head around how I think we should
support DBI here are some panel specific comments.

	Sam

On Mon, Jul 27, 2020 at 06:46:11PM +0200, Paul Cercueil wrote:
> This driver supports the NewVision NV3052C based LCDs. Right now, it
> only supports the LeadTek LTK035C5444T 2.4" 640x480 TFT LCD panel, which
> can be found in the Anbernic RG-350M handheld console.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-newvision-nv3052c.c   | 523 ++++++++++++++++++
>  3 files changed, 533 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index de2f2a452be5..6a8a51a702d8 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -198,6 +198,15 @@ config DRM_PANEL_NEC_NL8048HL11
>  	  panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
>  	  as a module, choose M here.
>  
> +config DRM_PANEL_NEWVISION_NV3052C
> +	tristate "NewVision NV3052C DSI/SPI RGB panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the NewVision NV3052C display controller.
> +
>  config DRM_PANEL_NOVATEK_NT35510
>  	tristate "Novatek NT35510 RGB panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index e45ceac6286f..a0516ced87db 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
> +obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>  obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> new file mode 100644
> index 000000000000..2feabef6dc3c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -0,0 +1,523 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * NevVision NV3052C IPS LCD panel driver
> + *
> + * Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct nv3052c_panel_info {
> +	const struct drm_display_mode *display_modes;
> +	unsigned int num_modes;
> +	unsigned int bus_type;
> +	u16 width_mm, height_mm;
> +	u32 bus_format, bus_flags;
> +};
> +
> +struct nv3052c_reg {
> +	u8 cmd;
> +	u8 value;
> +};
> +
> +struct nv3052c {
> +	struct drm_panel drm_panel;
> +	struct mipi_dsi_device *dsi;
> +	struct device *dev;
> +
> +	struct regulator *supply;
> +	const struct nv3052c_panel_info *panel_info;
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	struct backlight_device *backlight;

drm_panel has backlight support.

Just calling drm_panel_of_backlight() after init should do the trick.
All other references to backlight can be dropped, including this
variable in struct nv3052c.

There is one delay loop you may need to keep.
Will comment on it below.



> +};
> +
> +static const struct nv3052c_reg nv3052c_regs[] = {
...
> +	{ 0x36, 0x0a },
> +};
> +
> +static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct nv3052c, drm_panel);
> +}
> +
> +static int nv3052c_prepare(struct drm_panel *drm_panel)
> +{
> +	struct nv3052c *priv = to_nv3052c(drm_panel);
> +	unsigned int i;
> +	int err;
> +
> +	err = regulator_enable(priv->supply);
> +	if (err) {
> +		dev_err(priv->dev, "Failed to enable power supply: %d\n", err);
> +		return err;
> +	}
> +
> +	/* Reset the chip */
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(10, 1000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(5000, 20000);
> +
> +	for (i = 0; i < ARRAY_SIZE(nv3052c_regs); i++) {
> +		err = mipi_dsi_dcs_write(priv->dsi, nv3052c_regs[i].cmd,
> +					 &nv3052c_regs[i].value, 1);
> +		if (err) {
> +			dev_err(priv->dev, "Unable to set register: %d\n", err);
> +			goto err_disable_regulator;
> +		}
> +	}
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(priv->dsi);
> +	if (err) {
> +		dev_err(priv->dev, "Unable to exit sleep mode: %d\n", err);
> +		return err;
> +	}
> +
> +	msleep(100);
> +
> +	return 0;
> +
> +err_disable_regulator:
> +	regulator_disable(priv->supply);
> +	return err;
> +}
> +
> +static int nv3052c_unprepare(struct drm_panel *drm_panel)
> +{
> +	struct nv3052c *priv = to_nv3052c(drm_panel);
> +	int err;
> +
> +	err = mipi_dsi_dcs_enter_sleep_mode(priv->dsi);
> +	if (err) {
> +		dev_err(priv->dev, "Unable to enter sleep mode: %d\n", err);
> +		return err;
> +	}
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +
> +	regulator_disable(priv->supply);
> +
> +	return 0;
> +}
> +
> +static int nv3052c_enable(struct drm_panel *drm_panel)
> +{
> +	struct nv3052c *priv = to_nv3052c(drm_panel);
> +	int err;
> +
> +	err = mipi_dsi_dcs_set_display_on(priv->dsi);
> +	if (err) {
> +		dev_err(priv->dev, "Unable to enable display: %d\n", err);
> +		return err;
> +	}
> +
> +	if (priv->backlight) {
> +		/* Wait for the picture to be ready before enabling backlight */
> +		usleep_range(10000, 20000);
This delay would likely still be relevant.
Just check priv->panel->backlight.

> +
> +		err = backlight_enable(priv->backlight);
Drop this.

> +	}
> +
> +	return err;
> +}
> +
> +static int nv3052c_disable(struct drm_panel *drm_panel)
> +{
> +	struct nv3052c *priv = to_nv3052c(drm_panel);
> +	int err;
> +
> +	backlight_disable(priv->backlight);
Drop this.

> +
> +	err = mipi_dsi_dcs_set_display_off(priv->dsi);
> +	if (err) {
> +		dev_err(priv->dev, "Unable to disable display: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nv3052c_get_modes(struct drm_panel *drm_panel,
> +			     struct drm_connector *connector)
> +{
> +	struct nv3052c *priv = to_nv3052c(drm_panel);
> +	const struct nv3052c_panel_info *panel_info = priv->panel_info;
> +	struct drm_display_mode *mode;
> +	unsigned int i;
> +
> +	for (i = 0; i < panel_info->num_modes; i++) {
> +		mode = drm_mode_duplicate(connector->dev,
> +					  &panel_info->display_modes[i]);
> +		if (!mode)
> +			return -ENOMEM;
> +
> +		drm_mode_set_name(mode);
> +
> +		mode->type = DRM_MODE_TYPE_DRIVER;
> +		if (panel_info->num_modes == 1)
> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> +
> +		drm_mode_probed_add(connector, mode);
> +	}
> +
> +	connector->display_info.bpc = 8;
> +	connector->display_info.width_mm = panel_info->width_mm;
> +	connector->display_info.height_mm = panel_info->height_mm;
> +
> +	drm_display_info_set_bus_formats(&connector->display_info,
> +					 &panel_info->bus_format, 1);
> +	connector->display_info.bus_flags = panel_info->bus_flags;
> +
> +	return panel_info->num_modes;
> +}
> +
> +static const struct drm_panel_funcs nv3052c_funcs = {
> +	.prepare	= nv3052c_prepare,
> +	.unprepare	= nv3052c_unprepare,
> +	.enable		= nv3052c_enable,
> +	.disable	= nv3052c_disable,
> +	.get_modes	= nv3052c_get_modes,
> +};
> +
> +static int nv3052c_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct nv3052c *priv;
> +	int err;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	priv->panel_info = of_device_get_match_data(dev);
> +	if (!priv->panel_info)
> +		return -EINVAL;
> +
> +	dsi->bus_type = priv->panel_info->bus_type;
> +
> +	priv->supply = devm_regulator_get(dev, "power");
> +	if (IS_ERR(priv->supply)) {
> +		dev_err(dev, "Failed to get power supply\n");
> +		return PTR_ERR(priv->supply);
> +	}
> +
> +	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio)) {
> +		dev_err(dev, "Failed to get reset GPIO\n");
> +		return PTR_ERR(priv->reset_gpio);
> +	}
> +
> +	priv->backlight = devm_of_find_backlight(dev);
> +	if (IS_ERR(priv->backlight)) {
> +		err = PTR_ERR(priv->backlight);
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get backlight handle\n");
> +		return err;
> +	}
Drop this part, use drm_panel_of_backlight() later.
See other drivers for where it is called.

> +
> +	drm_panel_init(&priv->drm_panel, dev, &nv3052c_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	err = drm_panel_add(&priv->drm_panel);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to register priv\n");
> +		return err;
> +	}
> +
> +	err = mipi_dsi_attach(dsi);
> +	if (err) {
> +		dev_err(dev, "Failed to attach panel\n");
> +		drm_panel_remove(&priv->drm_panel);
> +		return err;
> +	}
> +
> +	/*
> +	 * We can't call mipi_dsi_maybe_register_tiny_driver(), since the
> +	 * NV3052C does not support MIPI_DCS_WRITE_MEMORY_START.
> +	 */
> +
> +	return 0;
> +}
> +
> +static int nv3052c_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct nv3052c *priv = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&priv->drm_panel);
> +
> +	nv3052c_disable(&priv->drm_panel);
Call drm_panel_disable()

> +	nv3052c_unprepare(&priv->drm_panel);
Call drm_panel_unprepare()

With the above two we keep maintaining the backlight properly.

> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode ltk035c5444t_modes[] = {
> +	{ /* 60 Hz */
> +		.clock = 24000,
> +		.hdisplay = 640,
> +		.hsync_start = 640 + 96,
> +		.hsync_end = 640 + 96 + 16,
> +		.htotal = 640 + 96 + 16 + 48,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 5,
> +		.vsync_end = 480 + 5 + 2,
> +		.vtotal = 480 + 5 + 2 + 13,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +	{ /* 50 Hz */
> +		.clock = 18000,
> +		.hdisplay = 640,
> +		.hsync_start = 640 + 39,
> +		.hsync_end = 640 + 39 + 2,
> +		.htotal = 640 + 39 + 2 + 39,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 5,
> +		.vsync_end = 480 + 5 + 2,
> +		.vtotal = 480 + 5 + 2 + 13,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +};
> +
> +static const struct nv3052c_panel_info ltk035c5444t_spi_panel_info = {
> +	.display_modes = ltk035c5444t_modes,
> +	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
> +	.bus_type = MIPI_DEVICE_TYPE_DBI_SPI_MODE1,
> +	.width_mm = 77,
> +	.height_mm = 64,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +};
> +
> +static const struct of_device_id nv3052c_of_match[] = {
> +	{ .compatible = "leadtek,ltk035c5444t-spi", .data = &ltk035c5444t_spi_panel_info },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, nv3052c_of_match);
> +
> +static struct mipi_dsi_driver nv3052c_driver = {
> +	.driver = {
> +		.name = "nv3052c",
> +		.of_match_table = nv3052c_of_match,
> +	},
> +	.probe = nv3052c_probe,
> +	.remove = nv3052c_remove,
> +};
> +module_mipi_dsi_driver(nv3052c_driver);
> +
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
