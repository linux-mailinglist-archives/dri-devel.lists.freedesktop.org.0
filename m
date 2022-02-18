Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A94BBED5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8176610E1D1;
	Fri, 18 Feb 2022 17:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C910E64E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:57:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL7Vg-0005CP-4s; Fri, 18 Feb 2022 18:57:36 +0100
Message-ID: <eb453cc82d83628f71563fa4fd972111e4005852.camel@pengutronix.de>
Subject: Re: [PATCH V2 07/11] drm/bridge: tc358767: Wrap (e)DP aux I2C
 registration into tc_aux_link_setup()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 18:57:34 +0100
In-Reply-To: <20220218010054.315026-8-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-8-marex@denx.de>
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
> This bit of code is (e)DP and aux I2C link specific, move it into
> tc_aux_link_setup() to permit cleaner addition of DSI-to-DPI mode.
> No functional change.
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
>  drivers/gpu/drm/bridge/tc358767.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 450a472888ba9..55b7f3fb9eec9 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -656,6 +656,12 @@ static int tc_aux_link_setup(struct tc_data *tc)
>  	if (ret)
>  		goto err;
>  
> +	/* Register DP AUX channel */
> +	tc->aux.name = "TC358767 AUX i2c adapter";
> +	tc->aux.dev = tc->dev;
> +	tc->aux.transfer = tc_aux_transfer;
> +	drm_dp_aux_init(&tc->aux);
> +
>  	return 0;
>  err:
>  	dev_err(tc->dev, "tc_aux_link_setup failed: %d\n", ret);
> @@ -1751,12 +1757,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	if (ret)
>  		return ret;
>  
> -	/* Register DP AUX channel */
> -	tc->aux.name = "TC358767 AUX i2c adapter";
> -	tc->aux.dev = tc->dev;
> -	tc->aux.transfer = tc_aux_transfer;
> -	drm_dp_aux_init(&tc->aux);
> -
>  	tc->bridge.funcs = &tc_bridge_funcs;
>  	if (tc->hpd_pin >= 0)
>  		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;


