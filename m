Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D622E2BC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641E26E101;
	Sun, 26 Jul 2020 21:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6715C6E101
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:27:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0267A51D;
 Sun, 26 Jul 2020 23:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595798868;
 bh=QHmspjfJHZzQmsxT1Y1E2iOS3/LGsGxQtRgYRy1vKHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3MuBP+9MkDaFYKxr77stFZuw8Zm4WfBjRLyjlMPAQiaK1ocYPiXuY494xSQqeYLq
 scyGv1GXsjn02nX7og9/0/NtckU20WmJso3ywtSXpPspiDha1oEriG8AzRDF+zdVMi
 WzmUI9Xv0B5kgv+r97bA1jaPC6Ul72P84WSJY3p8=
Date: Mon, 27 Jul 2020 00:27:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 05/15] drm/bridge: tc358767: add detect bridge operation
Message-ID: <20200726212740.GG14755@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-6-sam@ravnborg.org>
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

On Sun, Jul 26, 2020 at 10:33:14PM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for chained operation by adding
> support for the detect operation.
> 
> v2:
>   - Do not announce detect operation if there is no hpd pin (Laurent)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index c2777b226c75..e8ba713bedac 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1369,21 +1369,13 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
>  	.get_modes = tc_connector_get_modes,
>  };
>  
> -static enum drm_connector_status tc_connector_detect(struct drm_connector *connector,
> -						     bool force)
> +static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
>  {
> -	struct tc_data *tc = connector_to_tc(connector);
> +	struct tc_data *tc = bridge_to_tc(bridge);
>  	bool conn;
>  	u32 val;
>  	int ret;
>  
> -	if (tc->hpd_pin < 0) {
> -		if (tc->panel)
> -			return connector_status_connected;
> -		else
> -			return connector_status_unknown;
> -	}
> -
>  	ret = regmap_read(tc->regmap, GPIOI, &val);
>  	if (ret)
>  		return connector_status_unknown;
> @@ -1396,6 +1388,20 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
>  		return connector_status_disconnected;
>  }
>  
> +static enum drm_connector_status
> +tc_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct tc_data *tc = connector_to_tc(connector);
> +
> +	if (tc->hpd_pin >= 0)
> +		return tc_bridge_detect(&tc->bridge);
> +	else
> +		if (tc->panel)
> +			return connector_status_connected;
> +
> +	return connector_status_unknown;

I'd write this

	if (tc->hpd_pin >= 0)
		return tc_bridge_detect(&tc->bridge);

	if (tc->panel)
		return connector_status_connected;
	else
		return connector_status_unknown;

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  static const struct drm_connector_funcs tc_connector_funcs = {
>  	.detect = tc_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> @@ -1458,6 +1464,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.disable = tc_bridge_disable,
>  	.post_disable = tc_bridge_post_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
> +	.detect = tc_bridge_detect,
>  };
>  
>  static bool tc_readable_reg(struct device *dev, unsigned int reg)
> @@ -1680,6 +1687,9 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return ret;
>  
>  	tc->bridge.funcs = &tc_bridge_funcs;
> +	if (tc->hpd_pin >= 0)
> +		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> +
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
