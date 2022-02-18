Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819C4BBEE5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7E10E67A;
	Fri, 18 Feb 2022 18:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B1210E67A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 18:01:38 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL7ZY-0005fq-Jj; Fri, 18 Feb 2022 19:01:36 +0100
Message-ID: <e51c2b8d5057c3d19a78fc9e61a175f604ff2fe4.camel@pengutronix.de>
Subject: Re: [PATCH V2 08/11] drm/bridge: tc358767: Move bridge ops setup
 into tc_probe_edp_bridge_endpoint()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 19:01:35 +0100
In-Reply-To: <20220218010054.315026-9-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-9-marex@denx.de>
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
> ---
> V2: - New patch
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 55b7f3fb9eec9..7dae18de76c97 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1676,6 +1676,11 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>  		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  	}
>  
> +	tc->bridge.funcs = &tc_bridge_funcs;

Could you please also rename those to tc_edp_bridge_funcs? Otherwise I
agree with this patch.

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
> -	tc->bridge.funcs = &tc_bridge_funcs;
> -	if (tc->hpd_pin >= 0)
> -		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> -	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);
>  


