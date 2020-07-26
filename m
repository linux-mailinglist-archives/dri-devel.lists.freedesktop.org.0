Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2022E2DC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 00:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5596E122;
	Sun, 26 Jul 2020 22:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A876E122
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 22:00:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C08751D;
 Mon, 27 Jul 2020 00:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595800848;
 bh=eZowv3TJ330ppPO3g1gH0A8JuJJ4vwIcurl+LlnNVz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=icPvJF6/V1RNhNSiMQi+jckOJjHJQF+qhm5uGWTfhLjP7FgIk5xzsDkTnfTNDdDcH
 ra3kzCbYiUIdfd8dYDGDEk/4lIhDoWHQMqfPjMZOXut6vP8E8zYQ9BgXIGY+TYPPd1
 6zfy9DaKKXh9164ra3hMzlr2PO7iOmTk+1PPMx20=
Date: Mon, 27 Jul 2020 01:00:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 14/15] drm/bridge: nxp-ptn3460: add get_edid bridge
 operation
Message-ID: <20200726220040.GG28704@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-15-sam@ravnborg.org>
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

On Sun, Jul 26, 2020 at 10:33:23PM +0200, Sam Ravnborg wrote:
> Add the get_edid() bridge operation to prepare for
> use as a chained bridge.
> Add helper function that is also used by the connector.
> 
> v2:
>   - Fix memory leak (Laurent)
>   - Do not save a copy of edid, read it when needed
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 43 ++++++++++++++++------------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index 438e566ce0a4..2805c8938f98 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -29,7 +29,6 @@ struct ptn3460_bridge {
>  	struct drm_connector connector;
>  	struct i2c_client *client;
>  	struct drm_bridge bridge;
> -	struct edid *edid;
>  	struct drm_panel *panel;
>  	struct gpio_desc *gpio_pd_n;
>  	struct gpio_desc *gpio_rst_n;
> @@ -184,17 +183,13 @@ static void ptn3460_post_disable(struct drm_bridge *bridge)
>  	}
>  }
>  
> -static int ptn3460_get_modes(struct drm_connector *connector)
> +static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
> +				     struct drm_connector *connector)
>  {
> -	struct ptn3460_bridge *ptn_bridge;
> -	u8 *edid;
> -	int ret, num_modes = 0;
> +	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
>  	bool power_off;
> -
> -	ptn_bridge = connector_to_ptn3460(connector);
> -
> -	if (ptn_bridge->edid)
> -		return drm_add_edid_modes(connector, ptn_bridge->edid);
> +	u8 *edid;
> +	int ret;
>  
>  	power_off = !ptn_bridge->enabled;
>  	ptn3460_pre_enable(&ptn_bridge->bridge);
> @@ -202,30 +197,40 @@ static int ptn3460_get_modes(struct drm_connector *connector)
>  	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>  	if (!edid) {
>  		DRM_ERROR("Failed to allocate EDID\n");
> -		return 0;
> +		goto out;
>  	}
>  
>  	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
> -			EDID_LENGTH);
> +				 EDID_LENGTH);
>  	if (ret) {
>  		kfree(edid);
> +		edid = NULL;
>  		goto out;
>  	}
>  
> -	ptn_bridge->edid = (struct edid *)edid;
> -	drm_connector_update_edid_property(connector, ptn_bridge->edid);
> -
> -	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
> -
>  out:
>  	if (power_off)
>  		ptn3460_disable(&ptn_bridge->bridge);
>  
> +	return (struct edid *)edid;
> +}
> +
> +static int ptn3460_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct ptn3460_bridge *ptn_bridge = connector_to_ptn3460(connector);
> +	struct edid *edid;
> +	int num_modes;
> +
> +	edid = ptn3460_get_edid(&ptn_bridge->bridge, connector);
> +	drm_connector_update_edid_property(connector, edid);
> +	num_modes = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
>  	return num_modes;
>  }
>  
>  static const struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
> -	.get_modes = ptn3460_get_modes,
> +	.get_modes = ptn3460_connector_get_modes,
>  };
>  
>  static const struct drm_connector_funcs ptn3460_connector_funcs = {
> @@ -279,6 +284,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
>  	.disable = ptn3460_disable,
>  	.post_disable = ptn3460_post_disable,
>  	.attach = ptn3460_bridge_attach,
> +	.get_edid = ptn3460_get_edid,
>  };
>  
>  static int ptn3460_probe(struct i2c_client *client,
> @@ -327,6 +333,7 @@ static int ptn3460_probe(struct i2c_client *client,
>  	}
>  
>  	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
> +	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
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
