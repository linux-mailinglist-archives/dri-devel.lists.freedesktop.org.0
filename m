Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC973BE10
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245D110E021;
	Fri, 23 Jun 2023 17:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0010E021
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:50:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB6FD838;
 Fri, 23 Jun 2023 19:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687542584;
 bh=j3wTVnzjoXV2I65EnJr7FsW6GfRQuvO4SyLM1n82XPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NZQo5HltjI6J7I6rCx8gi5ze9PpE82muAFABziMPLWeGH+9GoGmD62EHIftOk5LMz
 29GNeA07ZiRC9FEeDB/4loBxV76tVOXIVWJvoJk5rtH/bXer/lGHSMe8bGOjEUZZgz
 YeAzBPvqG5yMuRu9jBi4qZBZRkSs5/PJjDGtcm9U=
Date: Fri, 23 Jun 2023 20:50:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 39/39] drm: renesas: shmobile: Add DT support
Message-ID: <20230623175019.GO2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2759075c94c011b0f15cb610f39f8fa9b3736600.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2759075c94c011b0f15cb610f39f8fa9b3736600.1687423204.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:51AM +0200, Geert Uytterhoeven wrote:
> Add DT support, by:
>   1. Creating a panel bridge from DT, and attaching it to the encoder,
>   2. Replacing the custom connector with a bridge connector,
>   3. Obtaining clock configuration based on the compatible value.
> 
> Note that for now the driver uses a fixed clock configuration selecting
> the bus clock, as the current code to select other clock inputs needs
> changes to support any other SoCs than SH7724.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> SH-Mobile AG5 (SH73A0) support is untested.
> 
> Unbind crashes when drm_encoder_cleanup() calls drm_bridge_detach(), as
> the bridge (allocated by devm_drm_panel_bridge_add()) has already been
> freed by that time.
> Should I allocate my encoder with devm_kzalloc(), instead of embedding
> it inside struct shmob_drm_device?

That shouldn't be needed, if you manage the memory for shmob_drm_device
with the DRM managed helpers.

Lifetime management of bridges is currently completely broken, there's
nothing that prevents bridges from being freed while still in use.
That's an issue in DRM, not in your driver.

> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 101 +++++++++++++++---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |   1 +
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  27 ++++-
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |   6 ++
>  4 files changed, 118 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 17456dde57637ab8..1ec87841658de4f0 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -9,12 +9,16 @@
>  
>  #include <linux/clk.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_dma_helper.h>
> @@ -23,6 +27,7 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -35,10 +40,6 @@
>  #include "shmob_drm_plane.h"
>  #include "shmob_drm_regs.h"
>  
> -/*
> - * TODO: panel support
> - */
> -
>  /* -----------------------------------------------------------------------------
>   * Clock management
>   */
> @@ -129,7 +130,6 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  		value |= LDMT1R_VPOL;
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		value |= LDMT1R_HPOL;
> -

This could be moved to one of the patches in the series that touch this
code.

>  	lcdc_write(sdev, LDMT1R, value);
>  
>  	value = ((mode->hdisplay / 8) << 16)			/* HDCN */
> @@ -191,7 +191,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->base;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
> -	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
> +	unsigned int clk_div = sdev->config.clk_div;
>  	struct device *dev = sdev->dev;
>  	u32 value;
>  	int ret;
> @@ -220,17 +220,17 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  	lcdc_write(sdev, LDPMR, 0);
>  
>  	value = sdev->lddckr;
> -	if (idata->clk_div) {
> +	if (clk_div) {
>  		/* FIXME: sh7724 can only use 42, 48, 54 and 60 for the divider
>  		 * denominator.
>  		 */
>  		lcdc_write(sdev, LDDCKPAT1R, 0);
> -		lcdc_write(sdev, LDDCKPAT2R, (1 << (idata->clk_div / 2)) - 1);
> +		lcdc_write(sdev, LDDCKPAT2R, (1 << (clk_div / 2)) - 1);
>  
> -		if (idata->clk_div == 1)
> +		if (clk_div == 1)
>  			value |= LDDCKR_MOSEL;
>  		else
> -			value |= idata->clk_div;
> +			value |= clk_div;
>  	}
>  
>  	lcdc_write(sdev, LDDCKR, value);
> @@ -479,7 +479,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  }
>  
>  /* -----------------------------------------------------------------------------
> - * Encoder
> + * Legacy Encoder
>   */
>  
>  static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
> @@ -508,9 +508,43 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>  	.mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * Encoder
> + */
> +
> +static int shmob_drm_encoder_init(struct shmob_drm_device *sdev,
> +				  struct device_node *enc_node)
> +{
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	/* Create a panel bridge */
> +	panel = of_drm_find_panel(enc_node);

Using drm_of_find_panel_or_bridge() would allow supporting platforms
that connect a non-panel device to the SoC, in additional to the already
supported panels.

> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
> +
> +	bridge = devm_drm_panel_bridge_add(sdev->dev, panel);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
> +
> +	/* Attach the bridge to the encoder */
> +	ret = drm_bridge_attach(&sdev->encoder, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(sdev->dev, "failed to attach bridge %pOF: %pe\n",
> +			bridge->of_node, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>  {
>  	struct drm_encoder *encoder = &sdev->encoder;
> +	struct device_node *np = sdev->dev->of_node;
> +	struct device_node *ep_node, *entity;
>  	int ret;
>  
>  	encoder->possible_crtcs = 1;
> @@ -520,13 +554,45 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
> +	if (sdev->pdata) {
> +		drm_encoder_helper_add(encoder, &encoder_helper_funcs);
> +		return 0;
> +	}
> +
> +	for_each_endpoint_of_node(np, ep_node) {
> +		struct of_endpoint ep;
> +
> +		ret = of_graph_parse_endpoint(ep_node, &ep);
> +		if (ret < 0) {
> +			of_node_put(ep_node);
> +			return ret;
> +		}
> +		/* Ignore all but the LCD port */
> +		if (ep.port || ep.id)
> +			continue;
> +
> +		entity = of_graph_get_remote_port_parent(ep.local_node);
> +		if (!entity)
> +			continue;
> +
> +		if (!of_device_is_available(entity)) {
> +			of_node_put(entity);
> +			continue;
> +		}
> +
> +		ret = shmob_drm_encoder_init(sdev, entity);
> +		if (ret < 0) {
> +			of_node_put(entity);
> +			of_node_put(ep_node);
> +			return ret;
> +		}
> +	}
>  
>  	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------------
> - * Connector
> + * Legacy Connector
>   */
>  
>  static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
> @@ -626,13 +692,20 @@ shmob_drm_connector_init(struct shmob_drm_device *sdev,
>  	return connector;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Connector
> + */
> +
>  int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  			       struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector;
>  	int ret;
>  
> -	connector = shmob_drm_connector_init(sdev, encoder);
> +	if (sdev->pdata)
> +		connector = shmob_drm_connector_init(sdev, encoder);
> +	else
> +		connector = drm_bridge_connector_init(&sdev->ddev, encoder);
>  	if (IS_ERR(connector)) {
>  		dev_err(sdev->dev, "failed to created connector: %pe\n",
>  			connector);
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index 89a0746f9a35807d..16e1712dd04e0f2b 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -29,6 +29,7 @@ struct shmob_drm_crtc {
>  	wait_queue_head_t flip_wait;
>  };
>  
> +/* Legacy connector */
>  struct shmob_drm_connector {
>  	struct drm_connector base;
>  	struct drm_encoder *encoder;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 576869164479ec6b..db72ca1c8b2f44c9 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> @@ -147,11 +148,13 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  static int shmob_drm_probe(struct platform_device *pdev)
>  {
>  	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;

How about dropping non-DT support ? That would simplify the driver.

> +	const struct shmob_drm_config *config;
>  	struct shmob_drm_device *sdev;
>  	struct drm_device *ddev;
>  	int ret;
>  
> -	if (pdata == NULL) {
> +	config = of_device_get_match_data(&pdev->dev);
> +	if (!config && !pdata) {
>  		dev_err(&pdev->dev, "no platform data\n");
>  		return -EINVAL;
>  	}
> @@ -167,7 +170,13 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  	ddev = &sdev->ddev;
>  	sdev->dev = &pdev->dev;
> -	sdev->pdata = pdata;
> +	if (config) {
> +		sdev->config = *config;
> +	} else {
> +		sdev->pdata = pdata;
> +		sdev->config.clk_source = pdata->clk_source;
> +		sdev->config.clk_div = pdata->iface.clk_div;
> +	}
>  	spin_lock_init(&sdev->irq_lock);
>  
>  	platform_set_drvdata(pdev, sdev);
> @@ -180,7 +189,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
> +	ret = shmob_drm_setup_clocks(sdev, sdev->config.clk_source);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -224,11 +233,23 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static const struct shmob_drm_config shmob_arm_config = {
> +	.clk_source = SHMOB_DRM_CLK_BUS,
> +	.clk_div = 5,
> +};
> +
> +static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
> +	{ .compatible = "renesas,r8a7740-lcdc",	.data = &shmob_arm_config, },
> +	{ .compatible = "renesas,sh73a0-lcdc",	.data = &shmob_arm_config, },
> +	{ /* sentinel */ }
> +};
> +
>  static struct platform_driver shmob_drm_platform_driver = {
>  	.probe		= shmob_drm_probe,
>  	.remove		= shmob_drm_remove,
>  	.driver		= {
>  		.name	= "shmob-drm",
> +		.of_match_table = of_match_ptr(shmob_drm_of_table),
>  		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
>  	},
>  };
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> index 18907e5ace51c681..088ac5381e91e61a 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> @@ -20,9 +20,15 @@ struct clk;
>  struct device;
>  struct drm_device;
>  
> +struct shmob_drm_config {
> +	enum shmob_drm_clk_source clk_source;
> +	unsigned int clk_div;
> +};
> +
>  struct shmob_drm_device {
>  	struct device *dev;
>  	const struct shmob_drm_platform_data *pdata;
> +	struct shmob_drm_config config;
>  
>  	void __iomem *mmio;
>  	struct clk *clock;

-- 
Regards,

Laurent Pinchart
