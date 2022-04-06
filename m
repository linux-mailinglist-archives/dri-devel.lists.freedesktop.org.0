Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96A4F6A42
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1864D10E054;
	Wed,  6 Apr 2022 19:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11210E054
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:46:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBbM-0003kI-DT; Wed, 06 Apr 2022 21:46:00 +0200
Message-ID: <5f7eb7a214ec0f219c4c9ce87e6c8c87bc7f0aeb.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/7] drm: mxsfb: Move mxsfb_get_fb_paddr() away from
 register IO functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:45:59 +0200
In-Reply-To: <20220311170601.50995-4-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-4-marex@denx.de>
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

Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> Move mxsfb_get_fb_paddr() out of the way, away from register IO functions.
> This is a clean up. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

Hm, I don't see any real benefit, but I also fail to see why it
shouldn't be done so:
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 015b289d93a3c..7b0abd0472aae 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -43,6 +43,21 @@ static u32 set_hsync_pulse_width(struct mxsfb_drm_private *mxsfb, u32 val)
>  		mxsfb->devdata->hs_wdth_shift;
>  }
>  
> +static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
> +{
> +	struct drm_framebuffer *fb = plane->state->fb;
> +	struct drm_gem_cma_object *gem;
> +
> +	if (!fb)
> +		return 0;
> +
> +	gem = drm_fb_cma_get_gem_obj(fb, 0);
> +	if (!gem)
> +		return 0;
> +
> +	return gem->paddr;
> +}
> +
>  /*
>   * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
>   * outputting them on the bus.
> @@ -215,21 +230,6 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
>  	return 0;
>  }
>  
> -static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
> -{
> -	struct drm_framebuffer *fb = plane->state->fb;
> -	struct drm_gem_cma_object *gem;
> -
> -	if (!fb)
> -		return 0;
> -
> -	gem = drm_fb_cma_get_gem_obj(fb, 0);
> -	if (!gem)
> -		return 0;
> -
> -	return gem->paddr;
> -}
> -
>  static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  				     const u32 bus_format)
>  {


