Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D64206E7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 09:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BC889C56;
	Mon,  4 Oct 2021 07:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8102089C56
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 07:59:03 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mXIrv-0001ht-O5; Mon, 04 Oct 2021 09:58:39 +0200
Message-ID: <3b557e62ad8f313d8fdfb352730cb9a0c5c2eb57.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/5] drm: mxsfb: Set proper default bus format when
 using a bridge
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
Date: Mon, 04 Oct 2021 09:58:37 +0200
In-Reply-To: <15afbcb04dea432867bb9f8b0e47205decd4bd6e.1633332399.git.agx@sigxcpu.org>
References: <cover.1633332399.git.agx@sigxcpu.org>
 <15afbcb04dea432867bb9f8b0e47205decd4bd6e.1633332399.git.agx@sigxcpu.org>
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
> If a bridge doesn't do any bus format handling MEDIA_BUS_FMT_FIXED is
> returned. Fallback to a reasonable default (MEDIA_BUS_FMT_RGB888_1X24) in
> that case.
> 
> This unbreaks e.g. using mxsfb with the nwl bridge and mipi panels.
> 
> Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
> 
I don't think this qualifies for stable, so I would drop this tag, as
the stable maintainers are quite trigger happy to pull in patches with
a fixes tag. Also the subject isn't quite correct, this isn't setting a
"proper" bus format, but rather adds a fallback. Other than that:

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Regards,
Lucas

> Reported-by: Martin Kepplinger <martink@posteo.de>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index d6abd2077114..e3fbb8b58d5d 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -369,6 +369,12 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  			drm_atomic_get_new_bridge_state(state,
>  							mxsfb->bridge);
>  		bus_format = bridge_state->input_bus_cfg.format;
> +		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> +			dev_warn_once(drm->dev,
> +				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
> +				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
> +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		}
>  	}
>  
>  	/* If there is no bridge, use bus format from connector */


