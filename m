Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87E4BBEAD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D09910E3A1;
	Fri, 18 Feb 2022 17:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBBC10E3A1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:51:14 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL7PV-0004iL-6P; Fri, 18 Feb 2022 18:51:13 +0100
Message-ID: <b977afb661a8ed99ca05bdbed8262f76adc5983f.camel@pengutronix.de>
Subject: Re: [PATCH V2 06/11] drm/bridge: tc358767: Move (e)DP bridge
 endpoint parsing into dedicated function
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 18:51:12 +0100
In-Reply-To: <20220218010054.315026-7-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-7-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Only the first mode is
> currently supported. In order to support the rest of the modes without
> making the tc_probe() overly long, split the bridge endpoint parsing
> into dedicated function, where the necessary logic to detect the bridge
> mode based on which endpoints are connected, can be implemented.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: - Rename tc_probe_bridge_mode() to tc_probe_edp_bridge_endpoint()
>       to better reflect that it parses the (e)DP output endpoint
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 134c4d8621236..450a472888ba9 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1646,19 +1646,12 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>  {
> -	struct device *dev = &client->dev;
> +	struct device *dev = tc->dev;
>  	struct drm_panel *panel;
> -	struct tc_data *tc;
>  	int ret;
>  
> -	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> -	if (!tc)
> -		return -ENOMEM;
> -
> -	tc->dev = dev;
> -
>  	/* port@2 is the output port */
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
>  	if (ret && ret != -ENODEV)
> @@ -1677,6 +1670,25 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  	}
>  
> +	return ret;
> +}
> +
> +static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct tc_data *tc;
> +	int ret;
> +
> +	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> +	if (!tc)
> +		return -ENOMEM;
> +
> +	tc->dev = dev;
> +
> +	ret = tc_probe_edp_bridge_endpoint(tc);
> +	if (ret)
> +		return ret;
> +
>  	/* Shut down GPIO is optional */
>  	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
>  	if (IS_ERR(tc->sd_gpio))


