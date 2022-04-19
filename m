Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99095506819
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 11:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A4089664;
	Tue, 19 Apr 2022 09:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909D10E7FB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:53:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-66-170-nat.elisa-mobile.fi
 [85.76.66.170])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9310305;
 Tue, 19 Apr 2022 11:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650361997;
 bh=7VnxunzuLZRHUp1nxrXQJTtJRvr8b8nt1XRa95pFSm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=akqaKQVq5cW0ExxApAEnx83AmXS5oub4RDlWFjpyLGqlmQw2e4GuQBKMnQY5rwo8w
 xesu1RICKtvCKndA8gMXpCsovVyKEj/Yx7Yk7AmuQS4WfaBPt2YAUb8StPBYVzpv/c
 XUv3sIbMKsqBDZ6fGhQvPQ09olBaembtM9ILTQVc=
Date: Tue, 19 Apr 2022 12:53:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] drm: mxsfb: Obtain bus flags from bridge state
Message-ID: <Yl6Gg2+4KxBBTx1v@pendragon.ideasonboard.com>
References: <20220417021011.337066-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220417021011.337066-1-marex@denx.de>
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
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sun, Apr 17, 2022 at 04:10:11AM +0200, Marek Vasut wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
