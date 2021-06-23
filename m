Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36483B11A4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 04:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E726E87F;
	Wed, 23 Jun 2021 02:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590E6E87F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:16:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF1C39B1;
 Wed, 23 Jun 2021 04:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624414596;
 bh=Ss37APFi5E/zsBkC1jBYgb6kPSCoHe1wPht/2aZWDYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CgOU45H8fNZdAwFw4vKR9CYETeh3YZdO4TlIq9SJ/8Nvr/cBUfDO3ATYBTsNeVdsi
 y28C+/cIiTNHcKLt1r8BlQSF5Ga9Ue8Hf1aWdf2g1XpXTNC1gDcI3lFBOg125TBM8y
 ffsteQXKJ3eMGUsN3twBr7uC+t8Wgyi+XPK3XAJg=
Date: Wed, 23 Jun 2021 05:16:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: Only initialise TVM_TVSYNC mode when
 supported
Message-ID: <YNKZaCYOUqF3qUHL@pendragon.ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
 <20210622232024.3215248-3-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622232024.3215248-3-kieran.bingham@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Wed, Jun 23, 2021 at 12:20:23AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The R-Car DU as found on the D3, E3, and V3U do not have support
> for an external synchronisation method.
> 
> In these cases, the dsysr cached register should not be initialised
> in DSYSR_TVM_TVSYNC, but instead should be left clear to configure as
> DSYSR_TVM_MASTER by default.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index ea7e39d03545..cff0d82b9491 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1243,7 +1243,10 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	rcrtc->group = rgrp;
>  	rcrtc->mmio_offset = mmio_offsets[hwindex];
>  	rcrtc->index = hwindex;
> -	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES) | DSYSR_TVM_TVSYNC;
> +	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES);

You can drop the parentheses.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_TVM_SYNC))
> +		rcrtc->dsysr |= DSYSR_TVM_TVSYNC;
>  
>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;

-- 
Regards,

Laurent Pinchart
