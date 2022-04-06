Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CE4F6A5F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40DB89C21;
	Wed,  6 Apr 2022 19:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F2889C21
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:49:05 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBeJ-0004AF-P9; Wed, 06 Apr 2022 21:49:03 +0200
Message-ID: <5068b8296cf1e2e885ac411a3d1728bad12c47f6.camel@pengutronix.de>
Subject: Re: [PATCH v2 7/7] drm: mxsfb: Factor out mxsfb_update_buffer()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:49:02 +0200
In-Reply-To: <20220311170601.50995-7-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-7-marex@denx.de>
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

Am Freitag, dem 11.03.2022 um 18:06 +0100 schrieb Marek Vasut:
> Pull functionality responsible for programming framebuffer address into
> the controller into dedicated function mxsfb_update_buffer(). This is a
> clean up. No functional change.
> 
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
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 497603964add8..4baa3db1f3d10 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -58,6 +58,22 @@ static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
>  	return gem->paddr;
>  }
>  
> +static void
> +mxsfb_update_buffer(struct mxsfb_drm_private *mxsfb, struct drm_plane *plane,
> +		    bool both)
> +{
> +	dma_addr_t paddr;
> +
> +	paddr = mxsfb_get_fb_paddr(plane);
> +	if (!paddr)
> +		return;
> +
> +	if (both)
> +		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
> +
> +	writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
> +}
> +
>  /*
>   * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
>   * outputting them on the bus.
> @@ -352,7 +368,6 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	struct drm_bridge_state *bridge_state;
>  	struct drm_device *drm = mxsfb->drm;
>  	u32 bus_format = 0;
> -	dma_addr_t paddr;
>  
>  	/* If there is a bridge attached to the LCDIF, use its bus format */
>  	if (mxsfb->bridge) {
> @@ -387,11 +402,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> -	paddr = mxsfb_get_fb_paddr(crtc->primary);
> -	if (paddr) {
> -		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
> -		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
> -	}
> +	mxsfb_update_buffer(mxsfb, crtc->primary, true);
>  
>  	mxsfb_enable_controller(mxsfb);
>  
> @@ -491,11 +502,8 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
>  					      struct drm_atomic_state *state)
>  {
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
> -	dma_addr_t paddr;
>  
> -	paddr = mxsfb_get_fb_paddr(plane);
> -	if (paddr)
> -		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
> +	mxsfb_update_buffer(mxsfb, plane, false);
>  }
>  
>  static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,


