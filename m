Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF722E2FB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 00:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50C89F1B;
	Sun, 26 Jul 2020 22:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096C89F1B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 22:05:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95A9551D;
 Mon, 27 Jul 2020 00:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595801123;
 bh=1YC20jvzut5ifKJQL9K2UFsmjI3wwjEmn+v8y9RY6cY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AnIT65/7vPqT+OEbn7hDqB1+DFGYaJUQOkJrd9k7SnNR88P8758s1bmehHdmVSVzb
 SnT5T9bA79sQbh3vGHcCmrFT9Hu0kuj3lGcBbcGAIBi1WF+DlG1iJ2aEAg8cu9q+n0
 yrh/uLDpUGrimPwv3N3nFgvIOjG2UQAHeC2xx9oQ=
Date: Mon, 27 Jul 2020 01:05:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 15/15] drm/bridge: nxp-ptn3460: add drm_panel_bridge
 support
Message-ID: <20200726220515.GH28704@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-16-sam@ravnborg.org>
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
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 26, 2020 at 10:33:24PM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for use in a chained setup.
> 
> - Replacing direct use of drm_panel with drm_panel_bridge support.
> - Make the connector creation optional
> 
> Note: the bridge panel will use the connector type from the panel.
> 
> v2:
>   - Use panel_bridge for local variable name to align with other drivers
>   - Fix that connector was created twice (Laurent)
>   - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 60 ++++++++++------------------
>  1 file changed, 20 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index 2805c8938f98..a49616855dd3 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -29,7 +29,7 @@ struct ptn3460_bridge {
>  	struct drm_connector connector;
>  	struct i2c_client *client;
>  	struct drm_bridge bridge;
> -	struct drm_panel *panel;
> +	struct drm_bridge *panel_bridge;
>  	struct gpio_desc *gpio_pd_n;
>  	struct gpio_desc *gpio_rst_n;
>  	u32 edid_emulation;
> @@ -126,11 +126,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>  	usleep_range(10, 20);
>  	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
>  
> -	if (drm_panel_prepare(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to prepare panel\n");
> -		return;
> -	}
> -
>  	/*
>  	 * There's a bug in the PTN chip where it falsely asserts hotplug before
>  	 * it is fully functional. We're forced to wait for the maximum start up
> @@ -145,16 +140,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>  	ptn_bridge->enabled = true;
>  }
>  
> -static void ptn3460_enable(struct drm_bridge *bridge)
> -{
> -	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> -
> -	if (drm_panel_enable(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to enable panel\n");
> -		return;
> -	}
> -}
> -
>  static void ptn3460_disable(struct drm_bridge *bridge)
>  {
>  	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> @@ -164,24 +149,10 @@ static void ptn3460_disable(struct drm_bridge *bridge)
>  
>  	ptn_bridge->enabled = false;
>  
> -	if (drm_panel_disable(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to disable panel\n");
> -		return;
> -	}
> -
>  	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
>  	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
>  }
>  
> -static void ptn3460_post_disable(struct drm_bridge *bridge)
> -{
> -	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> -
> -	if (drm_panel_unprepare(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to unprepare panel\n");
> -		return;
> -	}
> -}
>  

Extra blank line.

>  static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
>  				     struct drm_connector *connector)
> @@ -245,12 +216,18 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
>  	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> +	enum drm_bridge_attach_flags panel_flags;
>  	int ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> +	/* Let this driver create connector if requested */
> +	panel_flags = flags & ~DRM_BRIDGE_ATTACH_NO_CONNECTOR;

Same as in a previous patch, should this be

	panel_flags = flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR;

?

> +	ret = drm_bridge_attach(bridge->encoder, ptn_bridge->panel_bridge,
> +				bridge, panel_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
>  
>  	if (!bridge->encoder) {
>  		DRM_ERROR("Parent encoder object not found");
> @@ -270,9 +247,6 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  	drm_connector_attach_encoder(&ptn_bridge->connector,
>  							bridge->encoder);
>  
> -	if (ptn_bridge->panel)
> -		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
> -
>  	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
>  
>  	return ret;
> @@ -280,9 +254,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
>  	.pre_enable = ptn3460_pre_enable,
> -	.enable = ptn3460_enable,
>  	.disable = ptn3460_disable,
> -	.post_disable = ptn3460_post_disable,
>  	.attach = ptn3460_bridge_attach,
>  	.get_edid = ptn3460_get_edid,
>  };
> @@ -292,6 +264,8 @@ static int ptn3460_probe(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	struct ptn3460_bridge *ptn_bridge;
> +	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
> @@ -299,10 +273,15 @@ static int ptn3460_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ptn_bridge->panel, NULL);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
>  	if (ret)
>  		return ret;
>  
> +	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(panel_bridge))
> +		return PTR_ERR(panel_bridge);
> +
> +	ptn_bridge->panel_bridge = panel_bridge;
>  	ptn_bridge->client = client;
>  
>  	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown",
> @@ -334,6 +313,7 @@ static int ptn3460_probe(struct i2c_client *client,
>  
>  	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
>  	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
> +	ptn_bridge->bridge.type = DRM_MODE_CONNECTOR_LVDS;
>  	ptn_bridge->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&ptn_bridge->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
