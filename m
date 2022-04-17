Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58665049AE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 00:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AE310E04E;
	Sun, 17 Apr 2022 22:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EFD10E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 22:15:47 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ngDBJ-00081L-7S; Mon, 18 Apr 2022 00:15:45 +0200
Message-ID: <9d99d4110949e43ce01f14271936546d95246264.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm: mxsfb: Obtain bus flags from bridge state
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 18 Apr 2022 00:15:40 +0200
In-Reply-To: <20220417021011.337066-1-marex@denx.de>
References: <20220417021011.337066-1-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, dem 17.04.2022 um 04:10 +0200 schrieb Marek Vasut:
> In case the MXSFB is connected to a bridge, attempt to obtain bus flags
> from that bridge state too. The bus flags may specify e.g. the DE signal
> polarity.
> 
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: Add AB from Alexander
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index b7c70d269d2cb..cd2a59e110c3a 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -275,6 +275,7 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
>  }
>  
>  static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
> +				     struct drm_bridge_state *bridge_state,
>  				     const u32 bus_format)
>  {
>  	struct drm_device *drm = mxsfb->crtc.dev;
> @@ -284,6 +285,8 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
>  		bus_flags = mxsfb->bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
>  
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
>  			     m->crtc_clock,
> @@ -345,7 +348,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
>  	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
>  									    crtc->primary);
> -	struct drm_bridge_state *bridge_state;
> +	struct drm_bridge_state *bridge_state = NULL;
>  	struct drm_device *drm = mxsfb->drm;
>  	u32 bus_format = 0;
>  	dma_addr_t paddr;
> @@ -381,7 +384,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (!bus_format)
>  		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  
> -	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
> +	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
>  	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);


