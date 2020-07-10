Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7721BFC0
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395EE6ED27;
	Fri, 10 Jul 2020 22:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234476ED26
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:24:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 789BA2C0;
 Sat, 11 Jul 2020 00:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594419868;
 bh=UFhX2warFhF+oiJQHClifame0MeyEsY3XpXos7Mjan8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQnUHwXf787lASoYc/yb14tT8RM7XEZpdrAQZliUrUj0PBdmfCJvlNOSfW9uAX1fY
 k7OQfLfCIHqYesqbwWWHmJ6fBX9x9DJCQJJLCEbtBJuEyCMbiqMWXSh5kyZv9Zxhid
 SqbagliI+j8qM221LRpDFG9sYFBtAJYj9all08ag=
Date: Sat, 11 Jul 2020 01:24:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 08/21] drm/bridge: tc358767: add get_edid bride
 operation
Message-ID: <20200710222421.GL5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-9-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-9-sam@ravnborg.org>
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

s/bride/bridge/ in the subject line.

On Fri, Jul 03, 2020 at 09:24:04PM +0200, Sam Ravnborg wrote:
> Prepare for chained bridge with the addition of
> get_edid support.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 85973ae728db..fb9d57967b2c 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1317,6 +1317,20 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
>  	tc->mode = *mode;
>  }
>  
> +static struct edid *tc_get_edid(struct drm_bridge *bridge,
> +				struct drm_connector *connector)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	struct edid *edid;
> +
> +	edid = drm_get_edid(connector, &tc->aux.ddc);
> +
> +	kfree(tc->edid);
> +	tc->edid = edid;

The caller (drm_bridge_connector_get_modes_edid()) calls kfree(edid), so
if you want to store it internally, you'll have to make a copy. Can you
skip internal storage altogether by freeing the memory in
tc_connector_get_modes() ?

> +
> +	return edid;
> +}
> +
>  static int tc_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct tc_data *tc = connector_to_tc(connector);
> @@ -1336,12 +1350,7 @@ static int tc_connector_get_modes(struct drm_connector *connector)
>  			return count;
>  	}
>  
> -	edid = drm_get_edid(connector, &tc->aux.ddc);
> -
> -	kfree(tc->edid);
> -	tc->edid = edid;
> -	if (!edid)
> -		return 0;
> +	edid = tc_get_edid(&tc->bridge, connector);
>  
>  	drm_connector_update_edid_property(connector, edid);
>  	count = drm_add_edid_modes(connector, edid);
> @@ -1452,6 +1461,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.disable = tc_bridge_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
>  	.detect = tc_bridge_detect,
> +	.get_edid = tc_get_edid,
>  };
>  
>  static bool tc_readable_reg(struct device *dev, unsigned int reg)
> @@ -1685,7 +1695,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return ret;
>  
>  	tc->bridge.funcs = &tc_bridge_funcs;
> -	tc->bridge.ops = DRM_BRIDGE_OP_DETECT;
> +	tc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
>  
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);
> -- 
> 2.25.1
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
