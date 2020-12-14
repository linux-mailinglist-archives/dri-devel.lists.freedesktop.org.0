Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5902D9C69
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E81C6E247;
	Mon, 14 Dec 2020 16:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31E089CBE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:20:23 +0000 (UTC)
Received: from [192.168.0.217]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8BB496;
 Mon, 14 Dec 2020 17:20:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607962819;
 bh=wY7tGKVzGrbV3pqRhebwWSPFfU6znS03QIwtfJH6jng=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BapUx4XUp1lity5KGFvtIid9DCMVTt2Sg+BHiidNuJqyj72oBpMBmgxZi1FwvTY/d
 xwNU2CYkj0Ry2SiopKrmjIAWUaJfRqXkcpfza7umbXLLIsJRronTPubO5F0QLwG1r8
 qJG/CtSyBWNK/pGVKCgxmtpci6LXWUUTphoGYEA4=
Subject: Re: [PATCH 4/9] drm: rcar-du: Use DRM-managed allocation for VSP
 planes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-5-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <d1113ad9-ff19-884d-90c4-0074c983f193@ideasonboard.com>
Date: Mon, 14 Dec 2020 16:20:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204220139.15272-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 04/12/2020 22:01, Laurent Pinchart wrote:
> devm_kcalloc() is the wrong API to allocate planes, as the lifetime of
> the planes is tied to the DRM device, not the device to driver
> binding. drmm_kcalloc() isn't a good option either, as it would result
> in the planes being freed before being unregistered during the managed
> cleanup of the DRM objects. Use a plain kcalloc(), and cleanup the
> planes and free the memory in the existing rcar_du_vsp_cleanup()
> handler.

Managed memory always seems to hurt - which is a shame, because it
should be better throughout.

It's like we need a way to arbitrarily specify the lifetimes of objects
correctly against another object... without being tied to a dev ...

Anyway,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 4dcb1bfbe201..78a886651d9f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -21,6 +21,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
>  #include <linux/scatterlist.h>
> +#include <linux/slab.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/vsp1.h>
> @@ -344,6 +345,15 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>  static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
>  {
>  	struct rcar_du_vsp *vsp = res;
> +	unsigned int i;
> +
> +	for (i = 0; i < vsp->num_planes; ++i) {
> +		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
> +
> +		drm_plane_cleanup(&plane->plane);
> +	}
> +
> +	kfree(vsp->planes);
>  
>  	put_device(vsp->vsp);
>  }
> @@ -354,6 +364,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  	struct rcar_du_device *rcdu = vsp->dev;
>  	struct platform_device *pdev;
>  	unsigned int num_crtcs = hweight32(crtcs);
> +	unsigned int num_planes;
>  	unsigned int i;
>  	int ret;
>  
> @@ -376,14 +387,13 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
>  	  * 4 RPFs.
>  	  */
> -	vsp->num_planes = rcdu->info->gen >= 3 ? 5 : 4;
> +	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
>  
> -	vsp->planes = devm_kcalloc(rcdu->dev, vsp->num_planes,
> -				   sizeof(*vsp->planes), GFP_KERNEL);
> +	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
>  	if (!vsp->planes)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < vsp->num_planes; ++i) {
> +	for (i = 0; i < num_planes; ++i) {
>  		enum drm_plane_type type = i < num_crtcs
>  					 ? DRM_PLANE_TYPE_PRIMARY
>  					 : DRM_PLANE_TYPE_OVERLAY;
> @@ -409,8 +419,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		} else {
>  			drm_plane_create_alpha_property(&plane->plane);
>  			drm_plane_create_zpos_property(&plane->plane, 1, 1,
> -						       vsp->num_planes - 1);
> +						       num_planes - 1);
>  		}
> +
> +		vsp->num_planes++;>  	}
>  
>  	return 0;
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
