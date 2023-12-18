Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B94817A70
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA4010E3E3;
	Mon, 18 Dec 2023 18:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B76610E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:54:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BB491583;
 Mon, 18 Dec 2023 11:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1702895887;
 bh=NK82jHPRPfVYGy/vPkJOfacdFlxuccF09ZQE3BF+LRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r3TeZa9YSBy4Z4Aq3fksHKD2/+bfY7e+odJ5HXMjCY+b2WVrgaLWR4kOY5mpNDJkZ
 W22wHsqNrmAYWGCY3H2zmtDdPrQaia8taxV5jOlSducdwYWYr+i+EFDrTmTPm5CRLO
 hZSZqKB3OQpJRrWv0BIj9FVNv1vzzwGvpPbiwmTo=
Date: Mon, 18 Dec 2023 12:39:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Message-ID: <20231218103903.GP5290@pendragon.ideasonboard.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Thu, Nov 16, 2023 at 12:24:24PM +0000, Biju Das wrote:
> The rcar_du_vsps_init() doesn't free the np allocated by
> of_parse_phandle_with_fixed_args() for the non-error case.
> 
> Fix memory leak for the non-error case.
> 
> While at it, replace the label 'error'->'done' as it applies to non-error
> case as well and update the error check condition for rcar_du_vsp_init()
> to avoid breakage in future, if it returns positive value.
> 
> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Replaced the label 'error'->'done' as it applies to non-error case as
>    well.
>  * Update the error check condition for rcar_du_vsp_init() to avoid
>    breakage in future, if it returns positive value.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 70d8ad065bfa..4c8fe83dd610 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
>  						       cells, i, &args);
>  		if (ret < 0)
> -			goto error;
> +			goto done;
>  
>  		/*
>  		 * Add the VSP to the list or update the corresponding existing
> @@ -743,13 +743,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  		vsp->dev = rcdu;
>  
>  		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
> -		if (ret < 0)
> -			goto error;
> +		if (ret)
> +			goto done;
>  	}
>  
> -	return 0;
> -
> -error:
> +done:
>  	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
>  		of_node_put(vsps[i].np);
>  

-- 
Regards,

Laurent Pinchart
