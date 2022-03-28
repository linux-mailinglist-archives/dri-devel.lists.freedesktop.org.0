Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1A4EA141
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D6610EDB2;
	Mon, 28 Mar 2022 20:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D8710EDB2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 20:17:00 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nYvnO-0003JO-Vt; Mon, 28 Mar 2022 22:16:59 +0200
Message-ID: <10295e6f58f3f2162d9dc99fe09f4791641aaa76.camel@pengutronix.de>
Subject: Re: [PATCH V3 09/12] drm/bridge: tc358767: Move bridge ops setup
 into tc_probe_edp_bridge_endpoint()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 28 Mar 2022 22:16:58 +0200
In-Reply-To: <20220224195817.68504-10-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
 <20220224195817.68504-10-marex@denx.de>
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

Am Donnerstag, dem 24.02.2022 um 20:58 +0100 schrieb Marek Vasut:
> The bridge ops are specific to the bridge configuration, move them
> into tc_probe_edp_bridge_endpoint() to permit cleaner addition of
> DSI-to-DPI mode. No functional change.
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
> V3: - No change
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index b4ae4dd5b89aa..07da6142d5cf2 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1676,6 +1676,11 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>  		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  	}
>  
> +	tc->bridge.funcs = &tc_edp_bridge_funcs;
> +	if (tc->hpd_pin >= 0)
> +		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> +	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
> +
>  	return ret;
>  }
>  
> @@ -1757,11 +1762,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	if (ret)
>  		return ret;
>  
> -	tc->bridge.funcs = &tc_edp_bridge_funcs;
> -	if (tc->hpd_pin >= 0)
> -		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> -	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);
>  


