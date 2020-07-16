Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54AB222C73
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 22:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870766E07F;
	Thu, 16 Jul 2020 20:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B587F6E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 20:04:32 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C447320046;
 Thu, 16 Jul 2020 22:04:29 +0200 (CEST)
Date: Thu, 16 Jul 2020 22:04:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/vram-helper: Integrate drm_gem_vram_init() into
 drm_gem_vram_create()
Message-ID: <20200716200428.GA2254583@ravnborg.org>
References: <20200714083238.28479-1-tzimmermann@suse.de>
 <20200714083238.28479-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714083238.28479-3-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=4RH16wm1A65t79bni-sA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: jiayang5@huawei.com, airlied@linux.ie, butterflyhuangxx@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, Jul 14, 2020 at 10:32:37AM +0200, Thomas Zimmermann wrote:
> The drm_gem_vram_create() function is the only caller of the internal
> helepr drm_gem_vram_init(). Streamline the code by putting all code into
helper
> the create function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 75 ++++++++++-----------------
>  1 file changed, 28 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 8dfb7458a34b..af767d3da5da 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -175,51 +175,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
>  	}
>  }
>  
> -/*
> - * Note that on error, drm_gem_vram_init will free the buffer object.
> - */
> -
> -static int drm_gem_vram_init(struct drm_device *dev,
> -			     struct drm_gem_vram_object *gbo,
> -			     size_t size, unsigned long pg_align)
> -{
> -	struct drm_vram_mm *vmm = dev->vram_mm;
> -	struct ttm_bo_device *bdev;
> -	int ret;
> -	size_t acc_size;
> -
> -	if (WARN_ONCE(!vmm, "VRAM MM not initialized")) {
> -		kfree(gbo);
> -		return -EINVAL;
> -	}
> -	bdev = &vmm->bdev;
> -
> -	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
> -
> -	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
> -	if (ret) {
> -		kfree(gbo);
> -		return ret;
> -	}
> -
> -	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
> -
> -	gbo->bo.bdev = bdev;
> -	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
> -
> -	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
> -			  &gbo->placement, pg_align, false, acc_size,
> -			  NULL, NULL, ttm_buffer_object_destroy);
> -	if (ret)
> -		/*
> -		 * A failing ttm_bo_init will call ttm_buffer_object_destroy
> -		 * to release gbo->bo.base and kfree gbo.
> -		 */
> -		return ret;
> -
> -	return 0;
> -}
> -
>  /**
>   * drm_gem_vram_create() - Creates a VRAM-backed GEM object
>   * @dev:		the DRM device
> @@ -235,7 +190,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  						unsigned long pg_align)
>  {
>  	struct drm_gem_vram_object *gbo;
> +	struct drm_vram_mm *vmm = dev->vram_mm;
> +	struct ttm_bo_device *bdev;
>  	int ret;
> +	size_t acc_size;
> +
> +	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
> +		return ERR_PTR(-EINVAL);
>  
>  	if (dev->driver->gem_create_object) {
>  		struct drm_gem_object *gem =
> @@ -249,8 +210,28 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  			return ERR_PTR(-ENOMEM);
>  	}
>  
> -	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
> -	if (ret < 0)
> +	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
> +
> +	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
> +	if (ret) {
> +		kfree(gbo);
> +		return ERR_PTR(ret);
> +	}
> +
> +	bdev = &vmm->bdev;
> +	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
> +
> +	gbo->bo.bdev = bdev;
> +	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
> +
> +	/*
> +	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
> +	 * to release gbo->bo.base and kfree gbo.
> +	 */
> +	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
> +			  &gbo->placement, pg_align, false, acc_size,
> +			  NULL, NULL, ttm_buffer_object_destroy);
> +	if (ret)
>  		return ERR_PTR(ret);
>  
>  	return gbo;
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
