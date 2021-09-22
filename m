Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F645414F21
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 19:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138586EC54;
	Wed, 22 Sep 2021 17:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35146EC54
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 17:30:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 808B3F1;
 Wed, 22 Sep 2021 19:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632331853;
 bh=2FNb00TpU21YxWc+F6Cr2WPYvozGyOiwqstQ7td4r68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sx0jKva1ksc4oLJa5BlJHZyhXSORVdBcUgXuyYnwz+NbFy7Omu8/YPyZDQJSLCF/0
 VVnbr58peOJkjI86T+D4t825sGXwvaKr75VTclnbyw1jKc1svT7WmYDnxAHZE4HGKA
 2TOYdY2AaApbOMP6Nj3WQtYu6JC9cJZeAKfs186I=
Date: Wed, 22 Sep 2021 20:30:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] drm: rcar-du: Fix DIDSR field name
Message-ID: <YUtoS8Pa+bAYND/b@pendragon.ideasonboard.com>
References: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
 <20210901234907.1608896-4-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901234907.1608896-4-kieran.bingham@ideasonboard.com>
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

Hi Kieran,

Thank you for the patch.

On Thu, Sep 02, 2021 at 12:49:05AM +0100, Kieran Bingham wrote:
> The DIDSR fields named LDCS were incorrectly defined as LCDS.
> Both the Gen2 and Gen3 documentation refer to the fields as the "LVDS
> Dot Clock Select".
> 
> Correct the definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2:
>  - New patch
> 
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 88a783ceb3e9..a984eef265d2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -122,10 +122,10 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  	didsr = DIDSR_CODE;
>  	for (i = 0; i < num_crtcs; ++i, ++rcrtc) {
>  		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
> -			didsr |= DIDSR_LCDS_LVDS0(i)
> +			didsr |= DIDSR_LDCS_LVDS0(i)
>  			      |  DIDSR_PDCS_CLK(i, 0);
>  		else
> -			didsr |= DIDSR_LCDS_DCLKIN(i)
> +			didsr |= DIDSR_LDCS_DCLKIN(i)
>  			      |  DIDSR_PDCS_CLK(i, 0);
>  	}
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index fb9964949368..fb7c467aa484 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -257,10 +257,10 @@
>  
>  #define DIDSR			0x20028
>  #define DIDSR_CODE		(0x7790 << 16)
> -#define DIDSR_LCDS_DCLKIN(n)	(0 << (8 + (n) * 2))
> -#define DIDSR_LCDS_LVDS0(n)	(2 << (8 + (n) * 2))
> -#define DIDSR_LCDS_LVDS1(n)	(3 << (8 + (n) * 2))
> -#define DIDSR_LCDS_MASK(n)	(3 << (8 + (n) * 2))
> +#define DIDSR_LDCS_DCLKIN(n)	(0 << (8 + (n) * 2))
> +#define DIDSR_LDCS_LVDS0(n)	(2 << (8 + (n) * 2))
> +#define DIDSR_LDCS_LVDS1(n)	(3 << (8 + (n) * 2))
> +#define DIDSR_LDCS_MASK(n)	(3 << (8 + (n) * 2))
>  #define DIDSR_PDCS_CLK(n, clk)	(clk << ((n) * 2))
>  #define DIDSR_PDCS_MASK(n)	(3 << ((n) * 2))
>  

-- 
Regards,

Laurent Pinchart
