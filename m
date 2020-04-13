Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A721A625A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 07:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96BC6E182;
	Mon, 13 Apr 2020 05:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF426E182
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 05:33:30 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DC9F280487;
 Mon, 13 Apr 2020 07:33:26 +0200 (CEST)
Date: Mon, 13 Apr 2020 07:33:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm: bridge: simple-bridge: Delegate operations to
 next bridge
Message-ID: <20200413053325.GA6324@ravnborg.org>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409003636.11792-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409003636.11792-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8 a=vZk7UPHPJn3jWLt6Te8A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Thu, Apr 09, 2020 at 03:36:35AM +0300, Laurent Pinchart wrote:
> Instead of poking into the DT node of the next bridge for its DDC bus
> and implementing the .get_modes() and .detect() connector operations
> manually, retrieve the next bridge in the chain and delegate these
> operations to it.

I had the impression that we could have any number of bridges,
and the approach was to request some info further down in the chain for
info, without knowing if the next or the next->next was the bridge that
could provide the information.
But this seems not to be the case - here we assume ->next can get the
edid - or if not we have a fallback.

The relation that the next bridge was the one with i2c was present
before this patch - so it is not directly related to this patch but
a more general observation.

A few nits below. With these nits considered the patch is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 98 +++++++++-----------------
>  1 file changed, 33 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index a2dca7a3ef03..bac223d0430d 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -29,7 +29,7 @@ struct simple_bridge {
>  
>  	const struct simple_bridge_info *info;
>  
> -	struct i2c_adapter	*ddc;
> +	struct drm_bridge	*next_bridge;
>  	struct regulator	*vdd;
>  	struct gpio_desc	*enable;
>  };
> @@ -52,29 +52,24 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
>  	struct edid *edid;
>  	int ret;
>  
> -	if (!sbridge->ddc)
> -		goto fallback;
> -
> -	edid = drm_get_edid(connector, sbridge->ddc);
> -	if (!edid) {
> -		DRM_INFO("EDID readout failed, falling back to standard modes\n");
> -		goto fallback;
> +	edid = drm_bridge_get_edid(sbridge->next_bridge, connector);

drm_bridge_get_edid() is not documented to return NULL:
"The retrieved EDID on success, or an error pointer otherwise."
So IS_ERR() would do the trick here.

> +	if (IS_ERR_OR_NULL(edid)) {
> +		if (!edid)
> +			DRM_INFO("EDID readout failed, falling back to standard modes\n");
> +
> +		/*
> +		 * In case we cannot retrieve the EDIDs (missing or broken DDC
> +		 * bus from the next bridge), fallback on the XGA standards and
> +		 * prefer a mode pretty much anyone can handle.
> +		 */
> +		ret = drm_add_modes_noedid(connector, 1920, 1200);
> +		drm_set_preferred_mode(connector, 1024, 768);
> +		return ret;
>  	}
>  
>  	drm_connector_update_edid_property(connector, edid);
>  	ret = drm_add_edid_modes(connector, edid);
>  	kfree(edid);
> -	return ret;
> -
> -fallback:
> -	/*
> -	 * In case we cannot retrieve the EDIDs (broken or missing i2c
> -	 * bus), fallback on the XGA standards
> -	 */
> -	ret = drm_add_modes_noedid(connector, 1920, 1200);
> -
> -	/* And prefer a mode pretty much anyone can handle */
> -	drm_set_preferred_mode(connector, 1024, 768);
>  
>  	return ret;
>  }
> @@ -88,16 +83,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
>  
> -	/*
> -	 * Even if we have an I2C bus, we can't assume that the cable
> -	 * is disconnected if drm_probe_ddc fails. Some cables don't
> -	 * wire the DDC pins, or the I2C bus might not be working at
> -	 * all.
> -	 */
> -	if (sbridge->ddc && drm_probe_ddc(sbridge->ddc))
> -		return connector_status_connected;
> -
> -	return connector_status_unknown;
> +	return drm_bridge_detect(sbridge->next_bridge);
>  }
>  
>  static const struct drm_connector_funcs simple_bridge_con_funcs = {
> @@ -120,6 +106,11 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> +	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (!bridge->encoder) {
>  		DRM_ERROR("Missing encoder\n");
>  		return -ENODEV;
> @@ -130,7 +121,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
>  					  &simple_bridge_con_funcs,
>  					  sbridge->info->connector_type,
> -					  sbridge->ddc);
> +					  sbridge->next_bridge->ddc);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize connector\n");
>  		return ret;
> @@ -172,31 +163,10 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
>  	.disable	= simple_bridge_disable,
>  };
>  
> -static struct i2c_adapter *simple_bridge_retrieve_ddc(struct device *dev)
> -{
> -	struct device_node *phandle, *remote;
> -	struct i2c_adapter *ddc;
> -
> -	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
> -	if (!remote)
> -		return ERR_PTR(-EINVAL);
> -
> -	phandle = of_parse_phandle(remote, "ddc-i2c-bus", 0);
> -	of_node_put(remote);
> -	if (!phandle)
> -		return ERR_PTR(-ENODEV);
> -
> -	ddc = of_get_i2c_adapter_by_node(phandle);
> -	of_node_put(phandle);
> -	if (!ddc)
> -		return ERR_PTR(-EPROBE_DEFER);
> -
> -	return ddc;
> -}
> -
>  static int simple_bridge_probe(struct platform_device *pdev)
>  {
>  	struct simple_bridge *sbridge;
> +	struct device_node *remote;
>  
>  	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
>  	if (!sbridge)
> @@ -222,16 +192,17 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  		return PTR_ERR(sbridge->enable);
>  	}
>  
> -	sbridge->ddc = simple_bridge_retrieve_ddc(&pdev->dev);
> -	if (IS_ERR(sbridge->ddc)) {
> -		if (PTR_ERR(sbridge->ddc) == -ENODEV) {
> -			dev_dbg(&pdev->dev,
> -				"No i2c bus specified. Disabling EDID readout\n");
> -			sbridge->ddc = NULL;
> -		} else {
> -			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
> -			return PTR_ERR(sbridge->ddc);
> -		}
> +	/* Get the next bridge in the pipeline. */
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	sbridge->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
> +
> +	if (!sbridge->next_bridge) {
> +		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
The patch mixes logging style.
In some cases DRM_INFO(...), and here dev_dbg(...)


> +		return -EPROBE_DEFER;
Retreiving the next bridge may fail with a PROBE_DEFER.
So should this be doen a little earlier in the probe function, so we
fail as fast as we can?
I am not sure it has any practical impact, was just wondering.

>  	}
>  
>  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
> @@ -249,9 +220,6 @@ static int simple_bridge_remove(struct platform_device *pdev)
>  
>  	drm_bridge_remove(&sbridge->bridge);
>  
> -	if (sbridge->ddc)
> -		i2c_put_adapter(sbridge->ddc);
> -
>  	return 0;
>  }
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
