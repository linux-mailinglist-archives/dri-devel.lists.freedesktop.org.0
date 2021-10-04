Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04E4206D8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 09:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562CF6E183;
	Mon,  4 Oct 2021 07:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D176E183
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 07:54:48 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mXInv-0000zi-8m; Mon, 04 Oct 2021 09:54:31 +0200
Message-ID: <ce3a401d316b15ee97d23b2a9a99f4be2a6d0b34.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/5] drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ondrej Jirman <megous@megous.com>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Mon, 04 Oct 2021 09:54:25 +0200
In-Reply-To: <07ab741922fb158d2ff53cdf26c9c55528d051ce.1633332399.git.agx@sigxcpu.org>
References: <cover.1633332399.git.agx@sigxcpu.org>
 <07ab741922fb158d2ff53cdf26c9c55528d051ce.1633332399.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 04.10.2021 um 09:27 +0200 schrieb Guido Günther:
> Components further up in the chain might ask us for supported formats.
> 
> Without this MEDIA_BUS_FMT_FIXED is assumed which then breaks display
> output with mxsfb since it can't determine a proper bus format.
> 
> We handle the bus formats that correspond to the DSI formats the bridge
> can potentially output (see chapter 13.6 of the i.MX 8MQ reference
> manual) - which matches what xsfb can input.
> 
> Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index a251cc1f088f..27c80d36846b 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -1234,6 +1234,40 @@ static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
>  	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
>  }
>  
> +static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						 struct drm_bridge_state *bridge_state,
> +						 struct drm_crtc_state *crtc_state,
> +						 struct drm_connector_state *conn_state,
> +						 u32 output_fmt,
> +						 unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts, input_fmt;
> +
> +	*num_input_fmts = 0;
> +
> +	switch (output_fmt) {
> +	/* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmt = output_fmt;
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
> +	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +	input_fmts[0] = input_fmt;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +
>  static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
>  	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> @@ -1241,6 +1275,7 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
>  	.atomic_check		= nwl_dsi_bridge_atomic_check,
>  	.atomic_enable		= nwl_dsi_bridge_atomic_enable,
>  	.atomic_disable		= nwl_dsi_bridge_atomic_disable,
> +	.atomic_get_input_bus_fmts = nwl_bridge_atomic_get_input_bus_fmts,
>  	.mode_set		= nwl_dsi_bridge_mode_set,
>  	.mode_valid		= nwl_dsi_bridge_mode_valid,
>  	.attach			= nwl_dsi_bridge_attach,


