Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0950821C009
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA07D6ED36;
	Fri, 10 Jul 2020 22:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC906ED36
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:43:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D56C82C0;
 Sat, 11 Jul 2020 00:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420983;
 bh=aBXjrBfxje/m/pgqAtszRRf94d6NJn/yxbIEW4xlQJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JF6uFSea0KVvnwTzb5KkkpyyDY4P8u95ndJgQrvGliAqu+TjNN87iTXD6FdHawwdq
 p0cz+Gu0brpRQnbaHIvFr0LDay7I+dPdufgTdsl5oD/dFsuj/ve1IIRVeNN8jaYJlK
 j8k2ZGnuBWSxe/qx1cFq0KzRIcDMXQ6ZhvirYZRk=
Date: Sat, 11 Jul 2020 01:42:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 19/21] drm/bridge: nxp-ptn3460: add get_modes bridge
 operation
Message-ID: <20200710224256.GW5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-20-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-20-sam@ravnborg.org>
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

On Fri, Jul 03, 2020 at 09:24:15PM +0200, Sam Ravnborg wrote:
> Add the get_modes() bridge operation to prepare for
> use as a chained bridge.
> Add helper function that is also used by the connector.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 52 ++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index 0bd9f0e451b3..e253c185f94c 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -154,17 +154,13 @@ static void ptn3460_disable(struct drm_bridge *bridge)
>  	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
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
> @@ -172,30 +168,46 @@ static int ptn3460_get_modes(struct drm_connector *connector)
>  	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>  	if (!edid) {
>  		DRM_ERROR("Failed to allocate EDID\n");
> -		return 0;
> +		return NULL;

Don't you need to power off in the error path ?

>  	}
>  
>  	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
> -			EDID_LENGTH);
> +				 EDID_LENGTH);
>  	if (ret) {
>  		kfree(edid);
> -		goto out;
> +		return NULL;

And here too ?

>  	}
>  
> +	if (power_off)
> +		ptn3460_disable(&ptn_bridge->bridge);
> +
> +	kfree(ptn_bridge->edid);
>  	ptn_bridge->edid = (struct edid *)edid;
> -	drm_connector_update_edid_property(connector, ptn_bridge->edid);
>  
> -	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
> +	return ptn_bridge->edid;

Same comment as earlier in this series about storing the edid.

> +}
>  
> -out:
> -	if (power_off)
> -		ptn3460_disable(&ptn_bridge->bridge);
> +static int ptn3460_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct ptn3460_bridge *ptn_bridge;
> +	struct edid *edid;
> +
> +	ptn_bridge = connector_to_ptn3460(connector);

Maybe

	struct ptn3460_bridge *ptn_bridge = connector_to_ptn3460(connector);

?

> +
> +	if (ptn_bridge->edid)
> +		return drm_add_edid_modes(connector, ptn_bridge->edid);
> +
> +	edid = ptn3460_get_edid(&ptn_bridge->bridge, connector);
> +	if (!edid)
> +		return 0;
> +
> +	drm_connector_update_edid_property(connector, edid);
>  
> -	return num_modes;
> +	return drm_add_edid_modes(connector, edid);
>  }
>  
>  static const struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
> -	.get_modes = ptn3460_get_modes,
> +	.get_modes = ptn3460_connector_get_modes,
>  };
>  
>  static const struct drm_connector_funcs ptn3460_connector_funcs = {
> @@ -249,6 +261,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
>  	.pre_enable = ptn3460_pre_enable,
>  	.disable = ptn3460_disable,
>  	.attach = ptn3460_bridge_attach,
> +	.get_edid = ptn3460_get_edid,
>  };
>  
>  static int ptn3460_probe(struct i2c_client *client,
> @@ -304,6 +317,7 @@ static int ptn3460_probe(struct i2c_client *client,
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
