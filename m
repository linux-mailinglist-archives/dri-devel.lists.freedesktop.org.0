Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B7C21C018
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CE36ED3A;
	Fri, 10 Jul 2020 22:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1371D6ED3A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:46:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E1182C0;
 Sat, 11 Jul 2020 00:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594421215;
 bh=VA8+q7IzhZqcuLi72nWml+6m0BsXHT1+Sf+RyonNHSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGd93Nx7xZPnT9WNqWrPk6GT958Z/snUwZZxRFaS6GACgfFUd/ZEAYJgGOiMQIFkn
 IWDcpIF5gHgCUp2aMcritoadZjv9b9K+uU5+U5voAJlD+cEBCvA/1gDVD7rWK4AJ5q
 WuBMOzutOJcEG4jxOpY40QBjYNy1OzppKS7bYlDA=
Date: Sat, 11 Jul 2020 01:46:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 21/21] drm/bridge: ti-sn65dsi86: add drm_panel_bridge
 support
Message-ID: <20200710224648.GY5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-22-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-22-sam@ravnborg.org>
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

On Fri, Jul 03, 2020 at 09:24:17PM +0200, Sam Ravnborg wrote:
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 0f75bb2d7f56..ecf0693e3018 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -144,7 +144,7 @@ struct ti_sn_bridge {
>  	struct device_node		*host_node;
>  	struct mipi_dsi_device		*dsi;
>  	struct clk			*refclk;
> -	struct drm_panel		*panel;
> +	struct drm_bridge		*panel_bridge;
>  	struct gpio_desc		*enable_gpio;
>  	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
>  	int				dp_lanes;
> @@ -263,7 +263,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
>  
> -	return drm_panel_get_modes(pdata->panel, connector);
> +	return drm_bridge_get_modes(pdata->panel_bridge, connector);
>  }
>  
>  static enum drm_mode_status
> @@ -395,9 +395,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	pdata->dsi = dsi;
>  
>  	/* attach panel to bridge */
> -	drm_panel_attach(pdata->panel, &pdata->connector);
> -
> -	return 0;
> +	return drm_bridge_attach(bridge->encoder, pdata->panel_bridge,
> +				 bridge, flags);

Same comment as earlier in this series regarding the flags.

I suppose attaching the panel bridge will be moved before creating the
connector in a future patch series ?

>  
>  err_dsi_attach:
>  	mipi_dsi_device_unregister(dsi);
> @@ -410,16 +409,12 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>  
> -	drm_panel_disable(pdata->panel);
> -
>  	/* disable video stream */
>  	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
>  	/* semi auto link training mode OFF */
>  	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
>  	/* disable DP PLL */
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
> -
> -	drm_panel_unprepare(pdata->panel);
>  }
>  
>  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> @@ -780,8 +775,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	/* enable video stream */
>  	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
>  			   VSTREAM_ENABLE);
> -
> -	drm_panel_enable(pdata->panel);
>  }
>  
>  static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> @@ -811,8 +804,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  	 */
>  	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>  			   HPD_DISABLE);
> -
> -	drm_panel_prepare(pdata->panel);
>  }
>  
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> @@ -1163,6 +1154,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
>  	struct ti_sn_bridge *pdata;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> @@ -1185,12 +1178,18 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  	pdata->dev = &client->dev;
>  
>  	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> -					  &pdata->panel, NULL);
> +					  &panel, NULL);
>  	if (ret) {
>  		DRM_ERROR("could not find any panel node\n");
>  		return ret;
>  	}
>  
> +	bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
> +
> +	pdata->panel_bridge = bridge;
> +
>  	dev_set_drvdata(&client->dev, pdata);
>  
>  	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
