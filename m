Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4621BFCD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8868B6E1AA;
	Fri, 10 Jul 2020 22:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6BD6E1AA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:30:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46F3C2C0;
 Sat, 11 Jul 2020 00:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420207;
 bh=ocmNRRlR5m3UHv8JTGdTRInVX2kef1/hKSyv7FzLZxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YUcFWqTaMvewv0UxdwRtOKYjCNvV07DXnEMyWtlduGnhbwgMLs3q+WaE9+xxJ+RVE
 KUNfScYoIIBwkKod+JGMVjXojsph4/Nh2fGXML9IvKnFE3C/nTEXr6Wvy3CznasVUD
 KicXcakilv+O62p435LlhHpd9SPy3yOI6VZD16fw=
Date: Sat, 11 Jul 2020 01:30:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 11/21] drm/bridge: parade-ps8622: add drm_panel_bridge
 support
Message-ID: <20200710223000.GO5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-12-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-12-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:07PM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for use in a chained setup by
> replacing direct use of drm_panel with drm_panel_bridge support.
> 
> Note: the bridge panel will use the connector type from the panel.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 46 ++++++++------------------
>  1 file changed, 13 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index d789ea2a7fb9..6ab6f60b9091 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -45,7 +45,7 @@ struct ps8622_bridge {
>  	struct drm_connector connector;
>  	struct i2c_client *client;
>  	struct drm_bridge bridge;
> -	struct drm_panel *panel;
> +	struct drm_bridge *panel_bridge;
>  	struct regulator *v12;
>  	struct backlight_device *bl;
>  
> @@ -365,11 +365,6 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
>  			DRM_ERROR("fails to enable ps8622->v12");
>  	}
>  
> -	if (drm_panel_prepare(ps8622->panel)) {
> -		DRM_ERROR("failed to prepare panel\n");
> -		return;
> -	}
> -
>  	gpiod_set_value(ps8622->gpio_slp, 1);
>  
>  	/*
> @@ -399,24 +394,8 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
>  	ps8622->enabled = true;
>  }
>  
> -static void ps8622_enable(struct drm_bridge *bridge)
> -{
> -	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
> -
> -	if (drm_panel_enable(ps8622->panel)) {
> -		DRM_ERROR("failed to enable panel\n");
> -		return;
> -	}
> -}
> -
>  static void ps8622_disable(struct drm_bridge *bridge)
>  {
> -	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
> -
> -	if (drm_panel_disable(ps8622->panel)) {
> -		DRM_ERROR("failed to disable panel\n");
> -		return;
> -	}
>  	msleep(PS8622_PWMO_END_T12_MS);

What's the point in just waiting in the disable path ?

>  }
>  
> @@ -436,11 +415,6 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
>  	 */
>  	gpiod_set_value(ps8622->gpio_slp, 0);
>  
> -	if (drm_panel_unprepare(ps8622->panel)) {
> -		DRM_ERROR("failed to unprepare panel\n");
> -		return;
> -	}
> -
>  	if (ps8622->v12)
>  		regulator_disable(ps8622->v12);
>  
> @@ -461,7 +435,7 @@ static int ps8622_get_modes(struct drm_connector *connector)
>  
>  	ps8622 = connector_to_ps8622(connector);
>  
> -	return drm_panel_get_modes(ps8622->panel, connector);
> +	return drm_bridge_get_modes(ps8622->panel_bridge, connector);
>  }
>  
>  static const struct drm_connector_helper_funcs ps8622_connector_helper_funcs = {
> @@ -482,6 +456,9 @@ static int ps8622_attach(struct drm_bridge *bridge,
>  	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
>  	int ret;
>  
> +	ret = drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
> +				&ps8622->bridge, flags);

Same comment as earlier in this series about double connector creation.

Don't you need to check ret here ?

> +
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		DRM_ERROR("Fix bridge driver to make connector optional!");
>  		return -EINVAL;
> @@ -505,9 +482,6 @@ static int ps8622_attach(struct drm_bridge *bridge,
>  	drm_connector_attach_encoder(&ps8622->connector,
>  							bridge->encoder);
>  
> -	if (ps8622->panel)
> -		drm_panel_attach(ps8622->panel, &ps8622->connector);
> -
>  	drm_helper_hpd_irq_event(ps8622->connector.dev);
>  
>  	return ret;
> @@ -515,7 +489,6 @@ static int ps8622_attach(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs ps8622_bridge_funcs = {
>  	.pre_enable = ps8622_pre_enable,
> -	.enable = ps8622_enable,
>  	.disable = ps8622_disable,
>  	.post_disable = ps8622_post_disable,
>  	.attach = ps8622_attach,
> @@ -533,16 +506,23 @@ static int ps8622_probe(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	struct ps8622_bridge *ps8622;
> +	struct drm_bridge *pbridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
>  	if (!ps8622)
>  		return -ENOMEM;
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ps8622->panel, NULL);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
>  	if (ret)
>  		return ret;
>  
> +	pbridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(pbridge))
> +		return PTR_ERR(pbridge);
> +
> +	ps8622->panel_bridge = pbridge;
>  	ps8622->client = client;
>  
>  	ps8622->v12 = devm_regulator_get(dev, "vdd12");

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
