Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03260137521
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 18:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE436EA71;
	Fri, 10 Jan 2020 17:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6386EA71
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 17:46:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EE7A920057;
 Fri, 10 Jan 2020 18:46:04 +0100 (CET)
Date: Fri, 10 Jan 2020 18:46:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 3/5] drm/panel: Add Feixin K101 IM2BA02 panel
Message-ID: <20200110174603.GC25099@ravnborg.org>
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110155225.1051749-4-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=bNPPjxCvKY4QfMc8yoEA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy.

On Fri, Jan 10, 2020 at 11:52:23PM +0800, Icenowy Zheng wrote:
> Feixin K101 IM2BA02 is a 800x1280 4-lane MIPI-DSI LCD panel.
> 
> Add a panel driver for it.
Thanks, driver looks really good.
Only a few comments/nits below.

	Sam
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-feixin-k101-im2ba02.c | 548 ++++++++++++++++++
>  4 files changed, 564 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> 

> new file mode 100644
> index 000000000000..45a62bdabb3f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> @@ -0,0 +1,548 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019-2020 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
Sorted and in the right order - good.

> +
> +static int k101_im2ba02_prepare(struct drm_panel *panel)
> +{
> +	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = regulator_enable(ctx->avdd);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	ret = regulator_enable(ctx->dvdd);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	ret = regulator_enable(ctx->cvdd);
> +	if (ret)
> +		return ret;

Unless the msleep() between is regulator_enable() really is needed,
this change this to use regulator_bulk_enable().

If the above is kept then please do proper error handling
where all enabled regulators are disable in case of errors.

> +
> +	msleep(30);
> +
> +	gpiod_set_value(ctx->reset, 1);
> +	msleep(50);
> +
> +	gpiod_set_value(ctx->reset, 0);
> +	msleep(50);
> +
> +	gpiod_set_value(ctx->reset, 1);
> +	msleep(200);
> +
> +	for (i = 0; i < ARRAY_SIZE(k101_im2ba02_init_cmds); i++) {
> +		const struct k101_im2ba02_init_cmd *cmd = &k101_im2ba02_init_cmds[i];
> +
> +		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data, K101_IM2BA02_INIT_CMD_LEN);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int k101_im2ba02_enable(struct drm_panel *panel)
> +{
> +	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
> +	const struct k101_im2ba02_init_cmd *cmd = &timed_cmds[1];
> +	int ret;
> +
> +	msleep(150);
> +
> +	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(50);
> +
> +	return mipi_dsi_dcs_write_buffer(ctx->dsi, cmd->data, K101_IM2BA02_INIT_CMD_LEN);
> +	if (ret < 0)
> +		return ret;
The last two lines can be deleted - they are never reached.

> +}
> +
> +static int k101_im2ba02_disable(struct drm_panel *panel)
> +{
> +	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
> +
> +	return mipi_dsi_dcs_set_display_off(ctx->dsi);
> +}
> +
> +static int k101_im2ba02_unprepare(struct drm_panel *panel)
> +{
> +	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
> +			      ret);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(panel->dev, "failed to enter sleep mode: %d\n",
> +			      ret);
> +
> +	msleep(200);
> +
> +	gpiod_set_value(ctx->reset, 0);
> +
> +	msleep(20);
> +
> +	regulator_disable(ctx->cvdd);
> +
> +	msleep(20);
> +
> +	regulator_disable(ctx->dvdd);
> +
> +	msleep(20);
> +
> +	regulator_disable(ctx->avdd);
Can we get rid of a few empty lines here?
If the 20 msecs are not really needed then use regulator_bulk_disable()


> +	return 0;
> +}
> +
> +static const struct drm_display_mode k101_im2ba02_default_mode = {
> +	.clock = 70000,
> +	.vrefresh = 60,
> +
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 20,
> +	.hsync_end = 800 + 20 + 20,
> +	.htotal = 800 + 20 + 20 + 20,
> +
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 16,
> +	.vsync_end = 1280 + 16 + 4,
> +	.vtotal = 1280 + 16 + 4 + 4,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	.width_mm	= 136,
> +	.height_mm	= 217,
> +};
> +
> +static int k101_im2ba02_get_modes(struct drm_panel *panel,
> +				  struct drm_connector *connector)
> +{
> +	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &k101_im2ba02_default_mode);
> +	if (!mode) {
> +		DRM_DEV_ERROR(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
> +			      k101_im2ba02_default_mode.hdisplay,
> +			      k101_im2ba02_default_mode.vdisplay,
> +			      k101_im2ba02_default_mode.vrefresh);
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
> +static const struct drm_panel_funcs k101_im2ba02_funcs = {
> +	.disable = k101_im2ba02_disable,
> +	.unprepare = k101_im2ba02_unprepare,
> +	.prepare = k101_im2ba02_prepare,
> +	.enable = k101_im2ba02_enable,
> +	.get_modes = k101_im2ba02_get_modes,
> +};
> +
> +static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct k101_im2ba02 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dsi = dsi;
> +
> +	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
> +	if (IS_ERR(ctx->dvdd)) {
> +		DRM_DEV_ERROR(&dsi->dev, "Couldn't get dvdd regulator\n");
> +		return PTR_ERR(ctx->dvdd);
> +	}
> +
> +	ctx->avdd = devm_regulator_get(&dsi->dev, "avdd");
> +	if (IS_ERR(ctx->avdd)) {
> +		DRM_DEV_ERROR(&dsi->dev, "Couldn't get avdd regulator\n");
> +		return PTR_ERR(ctx->avdd);
> +	}
> +
> +	ctx->cvdd = devm_regulator_get(&dsi->dev, "cvdd");
> +	if (IS_ERR(ctx->cvdd)) {
> +		DRM_DEV_ERROR(&dsi->dev, "Couldn't get cvdd regulator\n");
> +		return PTR_ERR(ctx->cvdd);
> +	}
> +
> +	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset)) {
> +		DRM_DEV_ERROR(&dsi->dev, "Couldn't get our reset GPIO\n");
> +		return PTR_ERR(ctx->reset);
> +	}
> +
> +	drm_panel_init(&ctx->panel, &dsi->dev, &k101_im2ba02_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_panel_add(&ctx->panel);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 4;
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
> +static int k101_im2ba02_dsi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct k101_im2ba02 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id k101_im2ba02_of_match[] = {
> +	{ .compatible = "feixin,k101-im2ba02", },
> +	{ }
Use { /* sentinel */ },

> +};
> +MODULE_DEVICE_TABLE(of, k101_im2ba02_of_match);
> +
> +static struct mipi_dsi_driver k101_im2ba02_driver = {
> +	.probe = k101_im2ba02_dsi_probe,
> +	.remove = k101_im2ba02_dsi_remove,
> +	.driver = {
> +		.name = "feixin-k101-im2ba02",
> +		.of_match_table = k101_im2ba02_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(k101_im2ba02_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
> +MODULE_DESCRIPTION("Feixin K101 IM2BA02 MIPI-DSI LCD panel");
> +MODULE_LICENSE("GPL");
> -- 
> 2.23.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
