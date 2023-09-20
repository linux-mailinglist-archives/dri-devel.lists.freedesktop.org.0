Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C07A8E08
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 22:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AF510E55B;
	Wed, 20 Sep 2023 20:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383C310E55A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 20:57:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C9698C1;
 Wed, 20 Sep 2023 22:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695243347;
 bh=z6N9CvJjIZruwOxk9WxBuXmd5Sfk5damI8NfgyS8fHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cihD9CRmaW9EH7FvEQx0/c7qAsUP6CyEWCJLUknDaZUJNRkcOqCh1pd1Y4b818ly8
 PCFrClpWOverjbRIQdjsAqMuoVnyly1DzgAPVNhGDksJ7Fi9cQOtXKpS1u7pQiHTDC
 KNKk5B1ib6jS3I0wVEVMCUUaf+Evpm7RPGx2yd50=
Date: Wed, 20 Sep 2023 23:57:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Message-ID: <20230920205736.GB7723@pendragon.ideasonboard.com>
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230920171009.3193296-2-l.stach@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sandor Yu <sandor.yu@nxp.com>,
 Adam Ford <aford173@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch.

On Wed, Sep 20, 2023 at 07:10:09PM +0200, Lucas Stach wrote:
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Marek Vasut <marex@denx.de> (v1)
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 206 +++++++++++++++++++
>  3 files changed, 214 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9fae28db6aa7..3a4e663d922a 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -3,6 +3,13 @@ if ARCH_MXC || COMPILE_TEST
>  config DRM_IMX_LDB_HELPER
>  	tristate
>  
> +config DRM_IMX8MP_HDMI_PVI
> +	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> +	depends on OF
> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Video Interface found on the Freescale i.MX8MP SoC.
> +
>  config DRM_IMX8QM_LDB
>  	tristate "Freescale i.MX8QM LVDS display bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 8e2ebf3399a1..be9b4f9adb50 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> new file mode 100644
> index 000000000000..5ccd70c98187
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
> +
> +#define HTX_PVI_CTRL			0x0
> +#define  PVI_CTRL_OP_VSYNC_POL		BIT(18)
> +#define  PVI_CTRL_OP_HSYNC_POL		BIT(17)
> +#define  PVI_CTRL_OP_DE_POL		BIT(16)
> +#define  PVI_CTRL_INP_VSYNC_POL		BIT(14)
> +#define  PVI_CTRL_INP_HSYNC_POL		BIT(13)
> +#define  PVI_CTRL_INP_DE_POL		BIT(12)
> +#define  PVI_CTRL_MODE_MASK		GENMASK(2, 1)
> +#define  PVI_CTRL_MODE_LCDIF		2
> +#define  PVI_CTRL_EN			BIT(0)
> +
> +struct imx8mp_hdmi_pvi {
> +	struct drm_bridge	bridge;
> +	struct device		*dev;
> +	struct drm_bridge	*next_bridge;
> +	void __iomem		*regs;
> +};
> +
> +static inline struct imx8mp_hdmi_pvi *
> +to_imx8mp_hdmi_pvi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct imx8mp_hdmi_pvi, bridge);
> +}
> +
> +static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
> +					 enum drm_bridge_attach_flags flags)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, pvi->next_bridge,
> +				 bridge, flags);
> +}
> +
> +static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state)
> +{
> +	struct drm_atomic_state *state = bridge_state->base.state;
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +	struct drm_connector_state *conn_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	u32 bus_flags, val;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +
> +	if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	val = FIELD_PREP(PVI_CTRL_MODE_MASK, PVI_CTRL_MODE_LCDIF) | PVI_CTRL_EN;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		val |= PVI_CTRL_OP_VSYNC_POL | PVI_CTRL_INP_VSYNC_POL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
> +
> +	if (pvi->next_bridge->timings)
> +		bus_flags = pvi->next_bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> +		val |= PVI_CTRL_OP_DE_POL | PVI_CTRL_INP_DE_POL;
> +
> +	writel(val, pvi->regs + HTX_PVI_CTRL);
> +}
> +
> +static void imx8mp_hdmi_pvi_bridge_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +
> +	writel(0x0, pvi->regs + HTX_PVI_CTRL);
> +
> +	pm_runtime_put(pvi->dev);
> +}
> +
> +static u32 *
> +imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state,
> +					  u32 output_fmt,
> +					  unsigned int *num_input_fmts)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +	struct drm_bridge *next_bridge = pvi->next_bridge;
> +	struct drm_bridge_state *next_state;
> +
> +	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
> +		return 0;
> +
> +	next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +						     next_bridge);
> +
> +	return next_bridge->funcs->atomic_get_input_bus_fmts(next_bridge,
> +							     next_state,
> +							     crtc_state,
> +							     conn_state,
> +							     output_fmt,
> +							     num_input_fmts);
> +}
> +
> +static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
> +	.attach		= imx8mp_hdmi_pvi_bridge_attach,
> +	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
> +	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
> +	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
> +{
> +	struct device_node *remote;
> +	struct imx8mp_hdmi_pvi *pvi;
> +
> +	pvi = devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
> +	if (!pvi)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pvi);
> +	pvi->dev = &pdev->dev;
> +
> +	pvi->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pvi->regs))
> +		return PTR_ERR(pvi->regs);
> +
> +	/* Get the next bridge in the pipeline. */
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	pvi->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
> +
> +	if (!pvi->next_bridge)
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +				     "could not find next bridge\n");
> +
> +	/* Register the bridge. */
> +	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
> +	pvi->bridge.of_node = pdev->dev.of_node;
> +	pvi->bridge.timings = pvi->next_bridge->timings;
> +
> +	drm_bridge_add(&pvi->bridge);
> +
> +	pm_runtime_enable(&pdev->dev);

I would move this just before drm_bridge_add(). In theory, as soon as
the bridge is added, it could get used, so it's a good practice to
initialize everything before adding it.

> +
> +	return 0;
> +}
> +
> +static int imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	drm_bridge_remove(&pvi->bridge);

And here you could flip the two as well for consistency.

With these minor changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pvi_match[] = {
> +	{
> +		.compatible = "fsl,imx8mp-hdmi-pvi",
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pvi_match);
> +
> +static struct platform_driver imx8mp_hdmi_pvi_driver = {
> +	.probe	= imx8mp_hdmi_pvi_probe,
> +	.remove	= imx8mp_hdmi_pvi_remove,
> +	.driver		= {
> +		.name = "imx-hdmi-pvi",
> +		.of_match_table	= imx8mp_hdmi_pvi_match,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pvi_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI TX Parallel Video Interface bridge driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart
