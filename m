Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06E5028D3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 13:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E9C10E3EC;
	Fri, 15 Apr 2022 11:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFD710E3EC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 11:22:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-129-nat.elisa-mobile.fi
 [85.76.5.129])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68178482;
 Fri, 15 Apr 2022 13:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650021742;
 bh=Uw/I9NYsIHkJe6uU5cma0+hCru7dJSvzEM/mupnu7G8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FnINJodcP1zqa3/BH1t2nlCmibGdhDhg5rcpc7nRkbeccAoa5dn4mEv/21iEiV3/Y
 Srg98RYF8TZguDq+Bu8j3RSbdMTmw6i0IvIIGKlL4SLG+J/HlLwcf3liFDSnVXnvZb
 Y2fM8Tir6efVj+LwQDrYNy8Nc/zNPcINIpAfd3bI=
Date: Fri, 15 Apr 2022 14:22:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 4/7] drm: rcar-du: Move rcar_du_output_name() to
 rcar_du_common.c
Message-ID: <YllVa2xL9s3c5xWt@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-5-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Wed, Mar 16, 2022 at 01:10:57PM +0000, Biju Das wrote:
> RZ/G2L SoC's does not have group/plane registers compared to RCar, hence it
> needs a different CRTC implementation.
> 
> Move rcar_du_output_name() to a new common file rcar_du_common.c, So that
> the same function can be reused by RZ/G2L SoC later.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change
> RFC->v1:
>  New patch
> ---
>  drivers/gpu/drm/rcar-du/Makefile         |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_common.c | 30 ++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 20 ----------------
>  3 files changed, 31 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c
> 
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index e7275b5e7ec8..331e12d65a6b 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  rcar-du-drm-y := rcar_du_crtc.o \
> +		 rcar_du_common.o \
>  		 rcar_du_drv.o \
>  		 rcar_du_encoder.o \
>  		 rcar_du_group.o \
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_common.c b/drivers/gpu/drm/rcar-du/rcar_du_common.c
> new file mode 100644
> index 000000000000..f9f9908cda6d
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_common.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * rcar_du_common.c  --  R-Car Display Unit Common
> + *
> + * Copyright (C) 2013-2022 Renesas Electronics Corporation
> + *
> + * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> + */
> +
> +#include "rcar_du_drv.h"
> +
> +const char *rcar_du_output_name(enum rcar_du_output output)
> +{
> +	static const char * const names[] = {
> +		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
> +		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
> +		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
> +		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
> +		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
> +		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
> +		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> +		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
> +		[RCAR_DU_OUTPUT_TCON] = "TCON",
> +	};
> +
> +	if (output >= ARRAY_SIZE(names) || !names[output])
> +		return "UNKNOWN";
> +
> +	return names[output];
> +}

As we have nothing else than this function in this file, how about
moving it to rcar_du_drv.c instead, to avoid adding a new file ?

You also need to add a declaration for rcar_du_output_name() in the
appropriate header.

> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 4640c356a532..f6e234dafb72 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -591,26 +591,6 @@ static const struct of_device_id rcar_du_of_table[] = {
>  
>  MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>  
> -const char *rcar_du_output_name(enum rcar_du_output output)
> -{
> -	static const char * const names[] = {
> -		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
> -		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
> -		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
> -		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
> -		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
> -		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
> -		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> -		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
> -		[RCAR_DU_OUTPUT_TCON] = "TCON",
> -	};
> -
> -	if (output >= ARRAY_SIZE(names) || !names[output])
> -		return "UNKNOWN";
> -
> -	return names[output];
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * DRM operations
>   */

-- 
Regards,

Laurent Pinchart
