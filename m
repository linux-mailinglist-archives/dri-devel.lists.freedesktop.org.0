Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476822E2C9
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4CB6E037;
	Sun, 26 Jul 2020 21:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06566E037
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:40:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E99A351D;
 Sun, 26 Jul 2020 23:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595799630;
 bh=XDmgg/JIMXuPokalSkHKCfYYsp0KZkUB2Fdxal91cPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=haw6/1odVhnpeJgwaOiXoQ3M3OTYm8nKJa2yMXQ5YsLHMDQR4UsvuPzvh8uVaV+eZ
 5+g/0x2IsebzJm/v3Lq2PMwD7fODJotGYa8ZRWVcNFBxGqaejLwvuq9+uP0gvikMho
 ja5a3cRg2rRTMYKGuVOEQZqctndCfeX70wAfqtqY=
Date: Mon, 27 Jul 2020 00:40:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 06/15] drm/bridge: tc358767: add get_edid bridge
 operation
Message-ID: <20200726214022.GB28704@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-7-sam@ravnborg.org>
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

On Sun, Jul 26, 2020 at 10:33:15PM +0200, Sam Ravnborg wrote:
> Prepare for chained bridge with the addition of
> get_edid support.
> 
> v2:
>   - Fixed handling of edid storage (Laurent)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358767.c | 34 ++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index e8ba713bedac..d86d7f06bebb 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -250,8 +250,6 @@ struct tc_data {
>  	/* link settings */
>  	struct tc_edp_link	link;
>  
> -	/* display edid */
> -	struct edid		*edid;
>  	/* current mode */
>  	struct drm_display_mode	mode;
>  
> @@ -1335,11 +1333,19 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
>  	tc->mode = *mode;
>  }
>  
> +static struct edid *tc_get_edid(struct drm_bridge *bridge,
> +				struct drm_connector *connector)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +
> +	return drm_get_edid(connector, &tc->aux.ddc);
> +}
> +
>  static int tc_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct tc_data *tc = connector_to_tc(connector);
> +	int num_modes;
>  	struct edid *edid;
> -	int count;
>  	int ret;
>  
>  	ret = tc_get_display_props(tc);
> @@ -1348,21 +1354,15 @@ static int tc_connector_get_modes(struct drm_connector *connector)
>  		return 0;
>  	}
>  
> -	count = drm_panel_get_modes(tc->panel, connector);
> -	if (count > 0)
> -		return count;
> -
> -	edid = drm_get_edid(connector, &tc->aux.ddc);
> -
> -	kfree(tc->edid);
> -	tc->edid = edid;
> -	if (!edid)
> -		return 0;
> +	num_modes = drm_panel_get_modes(tc->panel, connector);
> +	if (num_modes > 0)
> +		return num_modes;
>  
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> +	edid = tc_get_edid(&tc->bridge, connector);
> +	num_modes = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
>  
> -	return count;
> +	return num_modes;
>  }
>  
>  static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
> @@ -1465,6 +1465,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.post_disable = tc_bridge_post_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
>  	.detect = tc_bridge_detect,
> +	.get_edid = tc_get_edid,
>  };
>  
>  static bool tc_readable_reg(struct device *dev, unsigned int reg)
> @@ -1689,6 +1690,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	tc->bridge.funcs = &tc_bridge_funcs;
>  	if (tc->hpd_pin >= 0)
>  		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> +	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
>  
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
