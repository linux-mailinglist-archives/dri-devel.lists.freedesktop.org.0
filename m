Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976E4BBE5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701C810EE5D;
	Fri, 18 Feb 2022 17:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C310EE4F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:27:17 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL72J-000215-MD; Fri, 18 Feb 2022 18:27:15 +0100
Message-ID: <3f7265f3d99c9933906095c407b3bcbb8d8748d1.camel@pengutronix.de>
Subject: Re: [PATCH V2 03/11] drm/bridge: tc358767: Convert to atomic ops
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 18:27:14 +0100
In-Reply-To: <20220218010054.315026-4-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-4-marex@denx.de>
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
> Use the atomic version of the enable/disable operations to continue the
> transition to the atomic API. This will be needed to access the mode
> from the atomic state.
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
>  drivers/gpu/drm/bridge/tc358767.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 4b8ea0db2a5e8..522c2c4d8514f 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1234,7 +1234,9 @@ static int tc_edp_stream_disable(struct tc_data *tc)
>  	return 0;
>  }
>  
> -static void tc_edp_bridge_enable(struct drm_bridge *bridge)
> +static void
> +tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
> +			    struct drm_bridge_state *old_bridge_state)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	int ret;
> @@ -1259,7 +1261,9 @@ static void tc_edp_bridge_enable(struct drm_bridge *bridge)
>  	}
>  }
>  
> -static void tc_edp_bridge_disable(struct drm_bridge *bridge)
> +static void
> +tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
> +			     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	int ret;
> @@ -1459,11 +1463,14 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.detach = tc_edp_bridge_detach,
>  	.mode_valid = tc_edp_mode_valid,
>  	.mode_set = tc_bridge_mode_set,
> -	.enable = tc_edp_bridge_enable,
> -	.disable = tc_edp_bridge_disable,
> +	.atomic_enable = tc_edp_bridge_atomic_enable,
> +	.atomic_disable = tc_edp_bridge_atomic_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
>  	.detect = tc_bridge_detect,
>  	.get_edid = tc_get_edid,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static bool tc_readable_reg(struct device *dev, unsigned int reg)


