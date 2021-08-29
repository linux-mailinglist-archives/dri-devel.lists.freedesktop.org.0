Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A10B3FAB8C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 15:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929F389BC0;
	Sun, 29 Aug 2021 13:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1192389BC0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 13:00:48 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 1aa0d094-08c9-11ec-aa7e-0050568cd888;
 Sun, 29 Aug 2021 13:00:36 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 68EEC194B74;
 Sun, 29 Aug 2021 15:00:56 +0200 (CEST)
Date: Sun, 29 Aug 2021 15:00:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 list@opendingux.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add driver for the AUO A030JTN01 TFT LCD
Message-ID: <YSuE/CSxGtzdcYkU@ravnborg.org>
References: <20210828112640.7248-1-paul@crapouillou.net>
 <20210828112640.7248-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828112640.7248-2-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul & Christophe,

On Sat, Aug 28, 2021 at 12:26:40PM +0100, Paul Cercueil wrote:
> From: Christophe Branchereau <cbranchereau@gmail.com>
> 
> Add driver for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD with non-square pixels and a delta-RGB 8-bit interface.

I had expected a:
Co-developed-by: Christophe Branchereau <cbranchereau@gmail.com>
?

> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The driver is prepared for more panels with the nice panel_info
structure. If you really consider this can be used for additional panels
maybe the driver should have a more generic name?

I like how a regmap is used for the spi stuff!

A few nits below.

	Sam

> ---

> diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> new file mode 100644
> index 000000000000..804567a59d19
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AU Optronics A030JTN01.0 TFT LCD panel driver
> + *
> + * Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
> + * Copyright (C) 2020, Christophe Branchereau <cbranchereau@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct a030jtn01_info {
> +	const struct drm_display_mode *display_modes;
> +	unsigned int num_modes;
> +	u16 width_mm, height_mm;
drm_display_mode already have width_mm, and height_mm.
I think it would be better to utilize those.

But I also see why not as the same physical panel can have different
modes - shrug.

> +	u32 bus_format, bus_flags;
> +};
> +
> +struct a030jtn01 {
> +	struct drm_panel panel;
> +	struct spi_device *spi;
> +	struct regmap *map;
> +
> +	const struct a030jtn01_info *panel_info;
> +
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline struct a030jtn01 *to_a030jtn01(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct a030jtn01, panel);
> +}
> +
> +static int a030jtn01_prepare(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +	struct device *dev = &priv->spi->dev;
> +	int err;
> +
> +	err = regulator_enable(priv->supply);
> +	if (err) {
> +		dev_err(dev, "Failed to enable power supply: %d\n", err);
> +		return err;
> +	}
> +
> +	usleep_range(1000, 8000);
> +
> +	/* Reset the chip */
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(100, 8000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(2000, 8000);
> +
> +	/*
> +	 * No idea why two writes are needed. If this write is commented,
> +	 * the colors are wrong. Doesn't seem to be timing-related, since
> +	 * a msleep(200) doesn't fix it.
> +	 */
> +	regmap_write(priv->map, 0x06, 0x00);
If there is any chance to get the register names, then that would hep
rather than the hardcoded numbers here.
Same goes in other places.

> +
> +	/* Use (24 + 6) == 0x1e as the vertical back porch */
> +	err = regmap_write(priv->map, 0x06, 0x1e);
> +	if (err)
> +		goto err_disable_regulator;
> +
> +	/* Use (42 + 30) * 3 == 0xd8 as the horizontal back porch */
> +	err = regmap_write(priv->map, 0x07, 0xd8);
> +	if (err)
> +		goto err_disable_regulator;
> +
> +	regmap_write(priv->map, 0x05, 0x74);
> +
> +	return 0;
> +
> +err_disable_regulator:
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	regulator_disable(priv->supply);
> +	return err;
> +}
> +
> +static int a030jtn01_unprepare(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	regulator_disable(priv->supply);
> +
> +	return 0;
> +}
> +
> +static int a030jtn01_enable(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +	int ret;
> +
> +	ret = regmap_write(priv->map, 0x05, 0x75);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for the picture to be stable */
> +	if (panel->backlight)
> +		msleep(100);
> +
> +	return 0;
> +}
> +
> +static int a030jtn01_disable(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +
> +	return regmap_write(priv->map, 0x05, 0x74);
> +}
> +
> +static int a030jtn01_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +	const struct a030jtn01_info *panel_info = priv->panel_info;
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
> +static const struct drm_panel_funcs a030jtn01_funcs = {
> +	.prepare	= a030jtn01_prepare,
> +	.unprepare	= a030jtn01_unprepare,
> +	.enable		= a030jtn01_enable,
> +	.disable	= a030jtn01_disable,
> +	.get_modes	= a030jtn01_get_modes,
> +};
> +
> +static bool a030jtn01_has_reg(struct device *dev, unsigned int reg)
> +{
> +	static const u32 a030jtn01_regs_mask = 0x001823f1fb;
> +
> +	return a030jtn01_regs_mask & BIT(reg);
> +};
> +
> +static const struct regmap_config a030jtn01_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.read_flag_mask = 0x40,
> +	.max_register = 0x1c,
> +	.readable_reg = a030jtn01_has_reg,
> +	.writeable_reg = a030jtn01_has_reg,
> +};
> +
> +static int a030jtn01_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct a030jtn01 *priv;
> +	int err;
> +
> +	spi->mode |= SPI_MODE_3 | SPI_3WIRE;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->spi = spi;
> +	spi_set_drvdata(spi, priv);
> +
> +	priv->map = devm_regmap_init_spi(spi, &a030jtn01_regmap_config);
> +	if (IS_ERR(priv->map)) {
> +		dev_err(dev, "Unable to init regmap\n");
> +		return PTR_ERR(priv->map);
> +	}
> +
> +	priv->panel_info = of_device_get_match_data(dev);
> +	if (!priv->panel_info)
> +		return -EINVAL;
I would put right after devm_kzalloc() and if it fails write soemthing
to the log - as it really is not supposed to happen.
Probe should not be called unless we know the compatible and have
panel_info for it.

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
> +	drm_panel_init(&priv->panel, dev, &a030jtn01_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	err = drm_panel_of_backlight(&priv->panel);
> +	if (err)
> +		return err;
> +
> +	drm_panel_add(&priv->panel);
> +
> +	return 0;
> +}
> +
> +static int a030jtn01_remove(struct spi_device *spi)
> +{
> +	struct a030jtn01 *priv = spi_get_drvdata(spi);
> +
> +	drm_panel_remove(&priv->panel);
> +	drm_panel_disable(&priv->panel);
> +	drm_panel_unprepare(&priv->panel);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode a030jtn01_modes[] = {
> +	{ /* 60 Hz */
> +		.clock = 14400,
> +		.hdisplay = 320,
> +		.hsync_start = 320 + 8,
> +		.hsync_end = 320 + 8 + 42,
> +		.htotal = 320 + 8 + 42 + 30,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 90,
> +		.vsync_end = 480 + 90 + 24,
> +		.vtotal = 480 + 90 + 24 + 6,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +	{ /* 50 Hz */
> +		.clock = 12000,
> +		.hdisplay = 320,
> +		.hsync_start = 320 + 8,
> +		.hsync_end = 320 + 8 + 42,
> +		.htotal = 320 + 8 + 42 + 30,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 90,
> +		.vsync_end = 480 + 90 + 24,
> +		.vtotal = 480 + 90 + 24 + 6,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +};
> +
> +static const struct a030jtn01_info a030jtn01_info = {
> +	.display_modes = a030jtn01_modes,
> +	.num_modes = ARRAY_SIZE(a030jtn01_modes),
> +	.width_mm = 70,
> +	.height_mm = 51,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_3X8_DELTA,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +};
> +
> +static const struct of_device_id a030jtn01_of_match[] = {
> +	{ .compatible = "auo,a030jtn01", .data = &a030jtn01_info },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, a030jtn01_of_match);
> +
> +static struct spi_driver a030jtn01_driver = {
> +	.driver = {
> +		.name = "auo-a030jtn01",
> +		.of_match_table = a030jtn01_of_match,
> +	},
> +	.probe = a030jtn01_probe,
> +	.remove = a030jtn01_remove,
> +};
> +module_spi_driver(a030jtn01_driver);
> +
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.0
