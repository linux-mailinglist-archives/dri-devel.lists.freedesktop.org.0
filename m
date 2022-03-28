Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D544EA12A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363ED10ED7B;
	Mon, 28 Mar 2022 20:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891310ED7B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 20:12:16 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nYvio-0002og-VU; Mon, 28 Mar 2022 22:12:15 +0200
Message-ID: <bf7cc56c79a507679682532666d3a477dc86df63.camel@pengutronix.de>
Subject: Re: [PATCH V3 05/12] drm/bridge: tc358767: Implement atomic_check
 callback
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 28 Mar 2022 22:12:12 +0200
In-Reply-To: <20220224195817.68504-6-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
 <20220224195817.68504-6-marex@denx.de>
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

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: - New patch
> V3: - Drop edp from tc_edp_common_atomic_check,
>       s@\<tc_edp_common_atomic_check\>@tc_common_atomic_check@g
>     - Return -EINVAL in case clock frequency is too high
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index f88d8e616f7f8..e95153d9c1499 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1289,6 +1289,31 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>  	return true;
>  }
>  
> +static int tc_common_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state,
> +				  const unsigned int max_khz)
> +{
> +	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> +			     &crtc_state->adjusted_mode);
> +
> +	if (crtc_state->adjusted_mode.clock > max_khz)
> +		return -EINVAL;
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
> +	return tc_common_atomic_check(bridge, bridge_state, crtc_state,
> +				      conn_state, 154000);
> +}
> +
>  static enum drm_mode_status
>  tc_edp_mode_valid(struct drm_bridge *bridge,
>  		  const struct drm_display_info *info,
> @@ -1463,6 +1488,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>  	.detach = tc_edp_bridge_detach,
>  	.mode_valid = tc_edp_mode_valid,
>  	.mode_set = tc_bridge_mode_set,
> +	.atomic_check = tc_edp_atomic_check,
>  	.atomic_enable = tc_edp_bridge_atomic_enable,
>  	.atomic_disable = tc_edp_bridge_atomic_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,


