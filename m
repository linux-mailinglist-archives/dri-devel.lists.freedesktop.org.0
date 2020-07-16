Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE595222C82
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 22:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0C66E14A;
	Thu, 16 Jul 2020 20:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64716E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 20:11:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9499620039;
 Thu, 16 Jul 2020 22:11:38 +0200 (CEST)
Date: Thu, 16 Jul 2020 22:11:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/vram-helper: Set object function iff they are
 not provided by driver
Message-ID: <20200716201137.GB2254583@ravnborg.org>
References: <20200714083238.28479-1-tzimmermann@suse.de>
 <20200714083238.28479-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714083238.28479-4-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=xqjHhYHaL07RImKNgcgA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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

On Tue, Jul 14, 2020 at 10:32:38AM +0200, Thomas Zimmermann wrote:
> Don't override the GEM object functions unconditionally. If the driver
> sets the GEM functions, VRAM helpers will now them. The idea has been
s/now/own
> taken from SHMEM helpers. If drivers need special versions of some of
> the GEM functions, they can now override them.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index af767d3da5da..7194144610cb 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -190,6 +190,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  						unsigned long pg_align)

The documentation of drm_gem_vram_create() could really use some love
here. It should document the behavior around gem_create_object(), and
the default allocation of drm_gem_vram_object with no drm_gem_object
assigned etc.

	Sam


>  {
>  	struct drm_gem_vram_object *gbo;
> +	struct drm_gem_object *gem;
>  	struct drm_vram_mm *vmm = dev->vram_mm;
>  	struct ttm_bo_device *bdev;
>  	int ret;
> @@ -199,8 +200,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  		return ERR_PTR(-EINVAL);
>  
>  	if (dev->driver->gem_create_object) {
> -		struct drm_gem_object *gem =
> -			dev->driver->gem_create_object(dev, size);
> +		gem = dev->driver->gem_create_object(dev, size);
>  		if (!gem)
>  			return ERR_PTR(-ENOMEM);
>  		gbo = drm_gem_vram_of_gem(gem);
> @@ -208,11 +208,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
>  		if (!gbo)
>  			return ERR_PTR(-ENOMEM);
> +		gem = &gbo->bo.base;
>  	}
>  
> -	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
> +	if (!gem->funcs)
> +		gem->funcs = &drm_gem_vram_object_funcs;
>  
> -	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
> +	ret = drm_gem_object_init(dev, gem, size);
>  	if (ret) {
>  		kfree(gbo);
>  		return ERR_PTR(ret);
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
