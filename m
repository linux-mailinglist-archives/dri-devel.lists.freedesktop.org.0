Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D194BBEED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3A910E247;
	Fri, 18 Feb 2022 18:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5949B10E6AB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 18:04:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL7cP-0005u2-RS; Fri, 18 Feb 2022 19:04:33 +0100
Message-ID: <b4f0209d3a6eeb03e158b0a8e432b714c291bf76.camel@pengutronix.de>
Subject: Re: [PATCH V2 09/11] drm/bridge: tc358767: Detect bridge mode from
 connected endpoints in DT
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 19:04:32 +0100
In-Reply-To: <20220218010054.315026-10-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-10-marex@denx.de>
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
> currently supported. It is possible to find out the mode in which the
> bridge should be operated by testing connected endpoints in DT.
> 
> Port allocation:
> port@0 - DSI input
> port@1 - DPI input/output
> port@2 - eDP output
> 
> Possible connections:
> DPI -> port@1 -> port@2 -> eDP :: [port@0 is not connected]
> DSI -> port@0 -> port@2 -> eDP :: [port@1 is not connected]
> DSI -> port@0 -> port@1 -> DPI :: [port@2 is not connected]
> 
> Add function to determine the bridge mode based on connected endpoints.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: - New patch
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 46 ++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 7dae18de76c97..4af0ad5db2148 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1684,6 +1684,50 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>  	return ret;
>  }
>  
> +static int tc_probe_bridge_endpoint(struct tc_data *tc)
> +{
> +	struct device *dev = tc->dev;
> +	struct of_endpoint endpoint;
> +	struct device_node *node = NULL;
> +	const u8 mode_dpi_to_edp = BIT(1) | BIT(2);
> +	const u8 mode_dsi_to_edp = BIT(0) | BIT(2);
> +	const u8 mode_dsi_to_dpi = BIT(0) | BIT(1);
> +	u8 mode = 0;
> +
> +	/*
> +	 * Determine bridge configuration.
> +	 *
> +	 * Port allocation:
> +	 * port@0 - DSI input
> +	 * port@1 - DPI input/output
> +	 * port@2 - eDP output
> +	 *
> +	 * Possible connections:
> +	 * DPI -> port@1 -> port@2 -> eDP :: [port@0 is not connected]
> +	 * DSI -> port@0 -> port@2 -> eDP :: [port@1 is not connected]
> +	 * DSI -> port@0 -> port@1 -> DPI :: [port@2 is not connected]
> +	 */
> +
> +	for_each_endpoint_of_node(dev->of_node, node) {
> +		of_graph_parse_endpoint(node, &endpoint);
> +		if (endpoint.port > 2)
> +			return -EINVAL;
> +
> +		mode |= BIT(endpoint.port);
> +	}
> +
> +	if (mode == mode_dpi_to_edp)
> +		return tc_probe_edp_bridge_endpoint(tc);
> +	else if (mode == mode_dsi_to_dpi)
> +		dev_warn(dev, "The mode DSI-to-DPI is not supported!\n");
> +	else if (mode == mode_dsi_to_edp)
> +		dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
> +	else
> +		dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
> +
> +	return -EINVAL;
> +}
> +
>  static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
>  	struct device *dev = &client->dev;
> @@ -1696,7 +1740,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  
>  	tc->dev = dev;
>  
> -	ret = tc_probe_edp_bridge_endpoint(tc);
> +	ret = tc_probe_bridge_endpoint(tc);
>  	if (ret)
>  		return ret;
>  


