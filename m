Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A76759CC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0410E37D;
	Fri, 20 Jan 2023 16:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5D510EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 16:21:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 626BB514;
 Fri, 20 Jan 2023 17:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674231706;
 bh=xKWPodl+Ohq0AxEy4gqgZMc5HYw+lTMwhnZaDbLjJg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGmilthg5bnOoOxDd2cpWO9UeB7Y8ma9Tr+PD5w9aGEksQ8Xi5e8JopMI/NyLN8c3
 F9xgRfZ63ELV0S72ODzgYxjLYIsDiOaVOUa07SppMxLO/mDyI+kXHfIJ4xnpqRe0WD
 edb+Xz6t4fWPL8y86OymX9StbOcqREi12GzzsFws=
Date: Fri, 20 Jan 2023 18:21:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Stop accessing non-existant
 registers on gen4
Message-ID: <Y8q/mNA4gZ/n0tlR@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-8-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120085009.604797-8-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 10:50:09AM +0200, Tomi Valkeinen wrote:
> The following registers do not exist on gen4, so we should not write
> them: DEF6Rm, DEF7Rm, DEF8Rm, ESCRn, OTARn.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  8 +++++---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 11 ++++++++---
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index b7dd59fe119e..008e172ed43b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -298,10 +298,12 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		escr = params.escr;
>  	}
>  
> -	dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
> +	if (rcdu->info->gen < 4) {
> +		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
>  
> -	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
> -	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
> +		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
> +		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
> +	}
>  
>  	/* Signal polarities */
>  	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 6da01760ede5..c2209d427bb7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -148,7 +148,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  	}
>  	rcar_du_group_write(rgrp, DEFR5, DEFR5_CODE | DEFR5_DEFE5);
>  
> -	rcar_du_group_setup_pins(rgrp);
> +	if (rcdu->info->gen < 4)
> +		rcar_du_group_setup_pins(rgrp);
>  
>  	/*
>  	 * TODO: Handle routing of the DU output to CMM dynamically, as we
> @@ -160,7 +161,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  	rcar_du_group_write(rgrp, DEFR7, defr7);
>  
>  	if (rcdu->info->gen >= 2) {
> -		rcar_du_group_setup_defr8(rgrp);
> +		if (rcdu->info->gen < 4)
> +			rcar_du_group_setup_defr8(rgrp);
>  		rcar_du_group_setup_didsr(rgrp);
>  	}
>  
> @@ -192,10 +194,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>   */
>  int rcar_du_group_get(struct rcar_du_group *rgrp)
>  {
> +	struct rcar_du_device *rcdu = rgrp->dev;
> +
>  	if (rgrp->use_count)
>  		goto done;
>  
> -	rcar_du_group_setup(rgrp);
> +	if (rcdu->info->gen < 4)
> +		rcar_du_group_setup(rgrp);

This doesn't look right, you're disabling way more than necessary.

>  
>  done:
>  	rgrp->use_count++;

-- 
Regards,

Laurent Pinchart
