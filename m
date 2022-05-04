Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A68E51A27D
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FFF10F029;
	Wed,  4 May 2022 14:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123BF10F029
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 14:45:46 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nmGG7-00055P-Fn; Wed, 04 May 2022 16:45:43 +0200
Message-ID: <74102a0235acf5d7e6ec20f09ab02e9c1d0c5b92.camel@pengutronix.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Fix DP bridge mode detection from
 DT endpoints
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 04 May 2022 16:45:41 +0200
In-Reply-To: <20220429204625.241591-1-marex@denx.de>
References: <20220429204625.241591-1-marex@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 29.04.2022 um 22:46 +0200 schrieb Marek Vasut:
> Per toshiba,tc358767.yaml DT binding document, port@2 the output (e)DP
> port is optional. In case this port is not described in DT, the bridge
> driver operates in DPI-to-DP mode. Make sure the driver treats this as
> a valid mode of operation instead of reporting invalid mode.
> 
> Fixes: 71f7d9c03118 ("drm/bridge: tc358767: Detect bridge mode from connected endpoints in DT")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 7dde71313b84..485717c8f0b4 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1964,7 +1964,9 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>  	struct of_endpoint endpoint;
>  	struct device_node *node = NULL;
>  	const u8 mode_dpi_to_edp = BIT(1) | BIT(2);
> +	const u8 mode_dpi_to_dp = BIT(1);
>  	const u8 mode_dsi_to_edp = BIT(0) | BIT(2);
> +	const u8 mode_dsi_to_dp = BIT(0);
>  	const u8 mode_dsi_to_dpi = BIT(0) | BIT(1);
>  	u8 mode = 0;
>  
> @@ -1990,11 +1992,11 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>  		mode |= BIT(endpoint.port);
>  	}
>  
> -	if (mode == mode_dpi_to_edp)
> +	if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp)
>  		return tc_probe_edp_bridge_endpoint(tc);
>  	else if (mode == mode_dsi_to_dpi)
>  		return tc_probe_dpi_bridge_endpoint(tc);
> -	else if (mode == mode_dsi_to_edp)
> +	else if (mode == mode_dsi_to_edp || mode == mode_dsi_to_dp)
>  		dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
>  	else
>  		dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);


