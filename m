Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C809D346E82
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 02:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB316E202;
	Wed, 24 Mar 2021 01:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5C6E202
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 01:10:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44D19580;
 Wed, 24 Mar 2021 02:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616548246;
 bh=ewIb2TwnfOIvni7PhSmVcvP0SGvIAruPHE1GjohJHjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ucdb+92sPHbOOgWq5pBMvjKh3qBFhgAoJ5YwvFRszjGP0CO9GrC2UWP8FeOcc4rnU
 z23lr31lMRMBMSWg/W9vjkWzPSyBBq8VrgLqBaMG3iuZg3objZd8cdUV6Bzwwgi9IK
 1D+ysMh+bngltLy01t8dQP895ZBzZUQ3PBStAz1o=
Date: Wed, 24 Mar 2021 03:10:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4 2/4] drm: sun4i: dsi: Add bridge support
Message-ID: <YFqRaz2ujUroiKnz@pendragon.ideasonboard.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322140152.101709-3-jagan@amarulasolutions.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Mon, Mar 22, 2021 at 07:31:50PM +0530, Jagan Teki wrote:
> Some display panels would come up with a non-DSI output which

Did you mean input instead of output ?

> can have an option to connect DSI interface by means of bridge
> converter.
> 
> This DSI to non-DSI bridge converter would require a bridge
> driver that would communicate the DSI controller for bridge
> functionalities.
> 
> So, add support for bridge functionalities in Allwinner DSI
> controller.
> 
> Cc: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note: 
> Samuel Holland, The existing kms hotplug dropped in order to 
> attach the bridge properly. 
> 
> However, I did try several ways to support hotplug with the 
> bridge but it's resulting in a deadlock where bind never attach 
> bridge until bridge pointer found and bridge pointer cannot 
> found until bind finishes. Any inputs on this would be appreciated.
> 
> Changes for v4:
> - none
> Changes for v3:
> - updated with new API's 
> 
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 34 +++++++++++++++++---------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 +-
>  2 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 2e9e7b2d4145..39321299dc27 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -773,6 +773,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	if (dsi->panel)
>  		drm_panel_prepare(dsi->panel);
>  
> +	if (dsi->panel_bridge)
> +		dsi->panel_bridge->funcs->pre_enable(dsi->panel_bridge);
> +
>  	/*
>  	 * FIXME: This should be moved after the switch to HS mode.
>  	 *
> @@ -788,6 +791,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	if (dsi->panel)
>  		drm_panel_enable(dsi->panel);
>  
> +	if (dsi->panel_bridge)
> +		dsi->panel_bridge->funcs->enable(dsi->panel_bridge);
> +
>  	sun6i_dsi_start(dsi, DSI_START_HSC);
>  
>  	udelay(1000);
> @@ -804,6 +810,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
>  	if (dsi->panel) {
>  		drm_panel_disable(dsi->panel);
>  		drm_panel_unprepare(dsi->panel);
> +	} else if (dsi->panel_bridge) {
> +		dsi->panel_bridge->funcs->disable(dsi->panel_bridge);
> +		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
>  	}

Instead of having code paths that depend on whether you have a panel or
a bridge, it would be better to wrap the panel a bridge (using
drivers/gpu/drm/bridge/panel.c). The dsi->panel_bridge pointer should be
renamed to next_bridge, and all the code (except in probe) can the use
next_bridge without caring if it's a direct connection to a panel or
another bridge.

Furthermore, the encoder should call bridge functions explicitly, this
should be handled by the DRM core.

>  
>  	phy_power_off(dsi->dphy);
> @@ -964,23 +973,17 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
>  			    struct mipi_dsi_device *device)
>  {
>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> -	struct drm_panel *panel;
>  	int ret;
>  
>  	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
> -					  &panel, NULL);
> +					  &dsi->panel, &dsi->panel_bridge);
>  	if (ret)
>  		return ret;
>  
> -	if (!dsi->drm || !dsi->drm->registered)
> -		return -EPROBE_DEFER;
> -
> -	dsi->panel = panel;
>  	dsi->device = device;
>  
> -	drm_kms_helper_hotplug_event(dsi->drm);
> -
> -	dev_info(host->dev, "Attached device %s\n", device->name);
> +	dev_info(host->dev, "Attached %s %s\n",
> +		 device->name, dsi->panel ? "panel" : "bridge");
>  
>  	return 0;
>  }
> @@ -991,9 +994,10 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
>  
>  	dsi->panel = NULL;
> +	dsi->panel_bridge = NULL;
>  	dsi->device = NULL;
>  
> -	drm_kms_helper_hotplug_event(dsi->drm);
> +	drm_of_panel_bridge_remove(dsi->dev->of_node, 0, 0);
>  
>  	return 0;
>  }
> @@ -1082,7 +1086,13 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
>  
>  	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
>  
> -	dsi->drm = drm;
> +	if (dsi->panel_bridge) {
> +		ret = drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL, 0);
> +		if (ret) {
> +			dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> +			goto err_cleanup_connector;
> +		}
> +	}
>  
>  	return 0;
>  
> @@ -1096,7 +1106,7 @@ static void sun6i_dsi_unbind(struct device *dev, struct device *master,
>  {
>  	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
>  
> -	dsi->drm = NULL;
> +	drm_encoder_cleanup(&dsi->encoder);
>  }
>  
>  static const struct component_ops sun6i_dsi_ops = {
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> index c863900ae3b4..370ecb356a63 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -29,8 +29,8 @@ struct sun6i_dsi {
>  
>  	struct device		*dev;
>  	struct mipi_dsi_device	*device;
> -	struct drm_device	*drm;
>  	struct drm_panel	*panel;
> +	struct drm_bridge	*panel_bridge;
>  };
>  
>  static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
