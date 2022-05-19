Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE652CD7D
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9939E11AF29;
	Thu, 19 May 2022 07:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E966511AF29
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:50:07 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nrav8-0000y2-7f; Thu, 19 May 2022 09:50:06 +0200
Message-ID: <cdaf30cf5090dedd2cf5a4145fa2137e1c7df859.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/bridge: tc358767: Handle dsi_lanes == 0 as invalid
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 19 May 2022 09:50:04 +0200
In-Reply-To: <20220518233602.248185-1-marex@denx.de>
References: <20220518233602.248185-1-marex@denx.de>
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

Am Donnerstag, dem 19.05.2022 um 01:36 +0200 schrieb Marek Vasut:
> Handle empty data-lanes = < >; property, which translates to
> dsi_lanes = 0 as invalid.
> 
I'm having a hard time imagining a situation where on would add a empty
data-lanes property to the DT. But then 0 DSI lanes is clearly a broken
configuration, so:

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> Fixes: bbfd3190b6562 ("drm/bridge: tc358767: Add DSI-to-DPI mode support")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 7366968dd7b21..84e6b5aa8dd1f 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1902,7 +1902,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
>  	of_node_put(host_node);
>  	of_node_put(endpoint);
>  
> -	if (dsi_lanes < 0 || dsi_lanes > 4)
> +	if (dsi_lanes <= 0 || dsi_lanes > 4)
>  		return -EINVAL;
>  
>  	if (!host)


