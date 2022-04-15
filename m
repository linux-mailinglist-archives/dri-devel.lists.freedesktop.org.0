Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670255028C5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 13:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1601810E614;
	Fri, 15 Apr 2022 11:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BC710E5B7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 11:16:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-129-nat.elisa-mobile.fi
 [85.76.5.129])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD00F482;
 Fri, 15 Apr 2022 13:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650021369;
 bh=lYU1YigGkMxJ/9XFRF57RB7SWxVPu33ldCzlt5uyQcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LkgSp5G5Y/5k3ULoo2nrv+Vwrrlf85h1qGlLuFv/N2isgYLhmEVnpGmmWVQ9aPSJp
 STv82xHvqFHMco63cfAXsJbGPVEFNNNiIv8POr9gTiRqnyOV9RD+RbnieoJbYWBkoJ
 9ukmM1E7Odti6M9gtD9nCd4y/xMiBSqKbjvvPG7s=
Date: Fri, 15 Apr 2022 14:16:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 2/7] drm: rcar-du: Add num_rpf to struct
 rcar_du_device_info
Message-ID: <YllT4BgEjpMIv/gi@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-3-biju.das.jz@bp.renesas.com>
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

On Wed, Mar 16, 2022 at 01:10:55PM +0000, Biju Das wrote:
> Number of RPF's VSP is different on R-Car and RZ/G2L
>  R-Car Gen3 -> 5 RPFs
>  R-Car Gen2 -> 4 RPFs
>  RZ/G2L -> 2 RPFs
> 
> Add num_rpf to struct rcar_du_device_info to support later
> SoC without any code changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change
> RFC->v1:
>  * Fixed the comment for num_rpf s/rpf's/RPFs/ and s/vsp/VSP/
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-12-biju.das.jz@bp.renesas.com/
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c |  6 +-----
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 957ea97541d5..1bc7325aa356 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -55,6 +55,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 4,
>  };
>  
>  static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
> @@ -77,6 +78,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
>  			.port = 1,
>  		},
>  	},
> +	.num_rpf = 4,
>  };
>  
>  static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
> @@ -104,6 +106,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
>  			.port = 2,
>  		},
>  	},
> +	.num_rpf = 4,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
> @@ -133,6 +136,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -163,6 +167,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -190,6 +195,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
>  		},
>  	},
>  	.num_lvds = 2,
> +	.num_rpf = 4,
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> @@ -220,6 +226,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -272,6 +279,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>  		},
>  	},
>  	.num_lvds = 2,
> +	.num_rpf = 4,
>  };
>  
>  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
> @@ -297,6 +305,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 4,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7792_info = {
> @@ -317,6 +326,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
>  			.port = 1,
>  		},
>  	},
> +	.num_rpf = 4,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7794_info = {
> @@ -340,6 +350,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
>  			.port = 1,
>  		},
>  	},
> +	.num_rpf = 4,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7795_info = {
> @@ -373,6 +384,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  	.dpll_mask =  BIT(2) | BIT(1),
>  };
>  
> @@ -403,6 +415,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -433,6 +446,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -459,6 +473,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  		},
>  	},
>  	.num_lvds = 1,
> +	.num_rpf = 5,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> @@ -486,6 +501,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  		},
>  	},
>  	.num_lvds = 2,
> +	.num_rpf = 5,
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> @@ -505,6 +521,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>  			.port = 1,
>  		},
>  	},
> +	.num_rpf = 5,
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 101f42df86ea..68c5de59d18d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -69,6 +69,7 @@ struct rcar_du_output_routing {
>   * @channels_mask: bit mask of available DU channels
>   * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
>   * @num_lvds: number of internal LVDS encoders
> + * @num_rpf: max number of RPFs in VSP

s/max //

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
>   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
> @@ -80,6 +81,7 @@ struct rcar_du_device_info {
>  	unsigned int channels_mask;
>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>  	unsigned int num_lvds;
> +	unsigned int num_rpf;
>  	unsigned int dpll_mask;
>  	unsigned int dsi_clk_mask;
>  	unsigned int lvds_clk_mask;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index b7fc5b069cbc..cf045a203aa5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -415,11 +415,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  	if (ret < 0)
>  		return ret;
>  
> -	 /*
> -	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
> -	  * 4 RPFs.
> -	  */
> -	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
> +	num_planes = rcdu->info->num_rpf;
>  
>  	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
>  	if (!vsp->planes)

-- 
Regards,

Laurent Pinchart
