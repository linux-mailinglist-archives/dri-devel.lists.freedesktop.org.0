Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B55407FC8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 21:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E74E89DD2;
	Sun, 12 Sep 2021 19:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B62C89DD2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 19:46:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2475cd5e-1402-11ec-9416-0050568cd888;
 Sun, 12 Sep 2021 19:46:37 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 63706194BEF;
 Sun, 12 Sep 2021 21:46:40 +0200 (CEST)
Date: Sun, 12 Sep 2021 21:46:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/vc4: dsi: Switch to devm_drm_of_get_bridge
Message-ID: <YT5ZJjeJ23qjelDv@ravnborg.org>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910130941.1740182-4-maxime@cerno.tech>
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

On Fri, Sep 10, 2021 at 03:09:41PM +0200, Maxime Ripard wrote:
> The new devm_drm_of_get_bridge removes most of the boilerplate we
> have to deal with. Let's switch to it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

With the includes updated:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c |  2 ++
>  drivers/gpu/drm/vc4/vc4_dsi.c | 28 ++++------------------------
>  2 files changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 16abc3a3d601..96c526f1022e 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -25,7 +25,9 @@
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/i2c.h>
I fail to see why this include is needed?

>  #include <linux/module.h>
> +#include <linux/of_graph.h>
I think this should be drm_bridge.h.
And drm_bridge.h hopefully pulls in what is needed.

>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index a185027911ce..a229da58962a 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1497,7 +1497,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm = dev_get_drvdata(master);
>  	struct vc4_dsi *dsi = dev_get_drvdata(dev);
>  	struct vc4_dsi_encoder *vc4_dsi_encoder;
> -	struct drm_panel *panel;
>  	const struct of_device_id *match;
>  	dma_cap_mask_t dma_mask;
>  	int ret;
> @@ -1609,27 +1608,9 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>  		return ret;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &dsi->bridge);
> -	if (ret) {
> -		/* If the bridge or panel pointed by dev->of_node is not
> -		 * enabled, just return 0 here so that we don't prevent the DRM
> -		 * dev from being registered. Of course that means the DSI
> -		 * encoder won't be exposed, but that's not a problem since
> -		 * nothing is connected to it.
> -		 */
> -		if (ret == -ENODEV)
> -			return 0;
> -
> -		return ret;
> -	}
> -
> -	if (panel) {
> -		dsi->bridge = devm_drm_panel_bridge_add_typed(dev, panel,
> -							      DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(dsi->bridge))
> -			return PTR_ERR(dsi->bridge);
> -	}
> +	dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	if (IS_ERR(dsi->bridge))
> +		return PTR_ERR(dsi->bridge);
>  
>  	/* The esc clock rate is supposed to always be 100Mhz. */
>  	ret = clk_set_rate(dsi->escape_clock, 100 * 1000000);
> @@ -1667,8 +1648,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>  {
>  	struct vc4_dsi *dsi = dev_get_drvdata(dev);
>  
> -	if (dsi->bridge)
> -		pm_runtime_disable(dev);
> +	pm_runtime_disable(dev);
>  
>  	/*
>  	 * Restore the bridge_chain so the bridge detach procedure can happen
> -- 
> 2.31.1
