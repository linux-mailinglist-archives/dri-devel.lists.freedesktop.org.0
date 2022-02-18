Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3124BBE7C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE210E148;
	Fri, 18 Feb 2022 17:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDD310E148
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:34:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL79Q-0002ey-2Q; Fri, 18 Feb 2022 18:34:36 +0100
Message-ID: <e35ea5ca8d0103ffb7eb7d0e92ec7508829a588a.camel@pengutronix.de>
Subject: Re: [PATCH V2 04/11] drm/bridge: tc358767: Implement atomic_check
 callback
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 18:34:34 +0100
In-Reply-To: <20220218010054.315026-5-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-5-marex@denx.de>
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
> Implement .atomic_check callback which prevents user space from setting
> unsupported mode. The tc_edp_common_atomic_check() variant is already
> prepared for DSI-to-DPI mode addition, which has different frequency
> limits.
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
>  drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 522c2c4d8514f..01d11adee6c74 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1289,6 +1289,31 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>  	return true;
>  }
>  
> +static int tc_edp_common_atomic_check(struct drm_bridge *bridge,

Drop the edp in the name here? Later in the series you call this
function from the DPI code, so this breaks the nice clean naming
separation from patch 1.

> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      const unsigned int max_khz)
> +{
> +	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> +			     &crtc_state->adjusted_mode);
> +
> +	if (crtc_state->adjusted_mode.clock > max_khz)
> +		crtc_state->adjusted_mode.clock = max_khz;

I don't think this is correct. The adjusted most is just for minor
adjustments if the bridge can not fully match the mode. If userspace
supplies a invalid high modeclock I think it would be better to fail
the atomic check -> return -EINVAL

Regards,
Lucas

> +
> +	return 0;
> +}
> +
> +static int tc_edp_atomic_check(struct drm_bridge *bridge,
> +			       struct drm_bridge_state *bridge_state,
> +			       struct drm_crtc_state *crtc_state,
> +			       struct drm_connector_state *conn_state)
> +{
> +	/* DPI->(e)DP interface clock limitation: upto 154 MHz */
> +	return tc_edp_common_atomic_check(bridge, bridge_state, crtc_state,
> +					  conn_state, 154000);
> +}
> +
>  static enum drm_mode_status
>  tc_edp_mode_valid(struct drm_bridge *bridge,
>  		  const struct drm_display_info *info,
> @@ -1463,6 +1488,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.detach = tc_edp_bridge_detach,
>  	.mode_valid = tc_edp_mode_valid,
>  	.mode_set = tc_bridge_mode_set,
> +	.atomic_check = tc_edp_atomic_check,
>  	.atomic_enable = tc_edp_bridge_atomic_enable,
>  	.atomic_disable = tc_edp_bridge_atomic_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,


