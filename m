Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E172421BF9B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAEB6ED1F;
	Fri, 10 Jul 2020 22:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6636ED1F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:19:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E03F2C0;
 Sat, 11 Jul 2020 00:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594419582;
 bh=loUGNufe2CWcXY44AHy6VnFeTlIlEi0FVVHNLLwJ2gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DL8PSFb78SttHvQK3zTKxi9Y7EwBIhlgkZetJwe7+yqvsXG1naFf4fjdbdzxQX5LN
 wL7yA9tw71UM8H+h/sW947yZKhb2g9lKaGDSAxYTNs/zjfuD5rDXao5pGsfcb1TJhh
 rJi1ng1KzWXgJ3IP2+eIfbVngp3Uhv4JfxZX1caE=
Date: Sat, 11 Jul 2020 01:19:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 06/21] drm/bridge: tc358767: add drm_panel_bridge
 support
Message-ID: <20200710221935.GJ5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-7-sam@ravnborg.org>
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

On Fri, Jul 03, 2020 at 09:24:02PM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for use in a chained setup by
> replacing direct use of drm_panel with drm_panel_bridge support.
> 
> The bridge driver assume the panel is optional.
> The relevant tests are migrated over to check for the
> pnale bridge to keep the same functionality.

s/pnale/panel/

> Note: the bridge panel will use the connector type from the panel.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 57 +++++++++++++++----------------
>  1 file changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index c2777b226c75..08d483664258 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -244,8 +244,8 @@ struct tc_data {
>  	struct drm_dp_aux	aux;
>  
>  	struct drm_bridge	bridge;
> +	struct drm_bridge	*panel_bridge;
>  	struct drm_connector	connector;
> -	struct drm_panel	*panel;
>  
>  	/* link settings */
>  	struct tc_edp_link	link;
> @@ -1236,13 +1236,6 @@ static int tc_stream_disable(struct tc_data *tc)
>  	return 0;
>  }
>  
> -static void tc_bridge_pre_enable(struct drm_bridge *bridge)
> -{
> -	struct tc_data *tc = bridge_to_tc(bridge);
> -
> -	drm_panel_prepare(tc->panel);
> -}
> -
>  static void tc_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
> @@ -1266,8 +1259,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>  		tc_main_link_disable(tc);
>  		return;
>  	}
> -
> -	drm_panel_enable(tc->panel);
>  }
>  
>  static void tc_bridge_disable(struct drm_bridge *bridge)
> @@ -1275,8 +1266,6 @@ static void tc_bridge_disable(struct drm_bridge *bridge)
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	int ret;
>  
> -	drm_panel_disable(tc->panel);
> -
>  	ret = tc_stream_disable(tc);
>  	if (ret < 0)
>  		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
> @@ -1286,13 +1275,6 @@ static void tc_bridge_disable(struct drm_bridge *bridge)
>  		dev_err(tc->dev, "main link disable error: %d\n", ret);
>  }
>  
> -static void tc_bridge_post_disable(struct drm_bridge *bridge)
> -{
> -	struct tc_data *tc = bridge_to_tc(bridge);
> -
> -	drm_panel_unprepare(tc->panel);
> -}
> -
>  static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adj)
> @@ -1348,9 +1330,11 @@ static int tc_connector_get_modes(struct drm_connector *connector)
>  		return 0;
>  	}
>  
> -	count = drm_panel_get_modes(tc->panel, connector);
> -	if (count > 0)
> -		return count;
> +	if (tc->panel_bridge) {
> +		count = drm_bridge_get_modes(tc->panel_bridge, connector);
> +		if (count > 0)
> +			return count;
> +	}
>  
>  	edid = drm_get_edid(connector, &tc->aux.ddc);
>  
> @@ -1378,7 +1362,7 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
>  	int ret;
>  
>  	if (tc->hpd_pin < 0) {
> -		if (tc->panel)
> +		if (tc->panel_bridge)
>  			return connector_status_connected;
>  		else
>  			return connector_status_unknown;
> @@ -1413,6 +1397,13 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  	struct drm_device *drm = bridge->dev;
>  	int ret;
>  
> +	if (tc->panel_bridge) {
> +		ret = drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
> +					&tc->bridge, flags);
> +		if (ret < 0)
> +			return ret;
> +	}

With this both this driver and the panel bridge driver will create a
connector. The simplest way to handle that is probably to pass
flags & ~DRM_BRIDGE_ATTACH_NO_CONNECTOR to drm_bridge_attach(). It's a
bit of a hack, but should go away once all users are converted to
!DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		DRM_ERROR("Fix bridge driver to make connector optional!");
>  		return -EINVAL;
> @@ -1421,7 +1412,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  	/* Create DP/eDP connector */
>  	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
>  	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs,
> -				 tc->panel ? DRM_MODE_CONNECTOR_eDP :
> +				 tc->panel_bridge ? DRM_MODE_CONNECTOR_eDP :
>  				 DRM_MODE_CONNECTOR_DisplayPort);
>  	if (ret)
>  		return ret;
> @@ -1435,9 +1426,6 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  					       DRM_CONNECTOR_POLL_DISCONNECT;
>  	}
>  
> -	if (tc->panel)
> -		drm_panel_attach(tc->panel, &tc->connector);
> -
>  	drm_display_info_set_bus_formats(&tc->connector.display_info,
>  					 &bus_format, 1);
>  	tc->connector.display_info.bus_flags =
> @@ -1453,10 +1441,8 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.attach = tc_bridge_attach,
>  	.mode_valid = tc_mode_valid,
>  	.mode_set = tc_bridge_mode_set,
> -	.pre_enable = tc_bridge_pre_enable,
>  	.enable = tc_bridge_enable,
>  	.disable = tc_bridge_disable,
> -	.post_disable = tc_bridge_post_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
>  };
>  
> @@ -1547,6 +1533,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
>  static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
>  	struct device *dev = &client->dev;
> +	struct drm_panel *panel;
>  	struct tc_data *tc;
>  	int ret;
>  
> @@ -1557,10 +1544,20 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	tc->dev = dev;
>  
>  	/* port@2 is the output port */
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &tc->panel, NULL);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
>  	if (ret && ret != -ENODEV)
>  		return ret;
>  
> +	if (panel) {
> +		struct drm_bridge *pbridge;
> +
> +		pbridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(pbridge))
> +			return PTR_ERR(pbridge);
> +
> +		tc->panel_bridge = pbridge;
> +	}
> +
>  	/* Shut down GPIO is optional */
>  	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
>  	if (IS_ERR(tc->sd_gpio))

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
