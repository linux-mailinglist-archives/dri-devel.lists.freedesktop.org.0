Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B8392C01
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43B56EE78;
	Thu, 27 May 2021 10:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA2E6EE6A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:40:11 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49DE6B2C;
 Thu, 27 May 2021 12:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1622112009;
 bh=iHLL5VJd59Tg8TpYorQpO0NHnKnXE5WGKXE1dvx9L3A=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=dWT6gF6CkIbE/b/gQ5+GjQFi5Wm3+apKMLsy5euTVQEWDa+FoudP9u2Xg9Me9AlBg
 B1TkKiZ0kYBc80oRCp7ouxf4llg1Y9Xyc9GM2TNQATZQr7P9uB8N6SiUPrMDNo8edI
 IF2LyMpiYAqiohIY9ERUt/Qj9SrpXQAVSWkNuUlU=
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210523170415.90410-1-paul@crapouillou.net>
 <20210523170415.90410-2-paul@crapouillou.net>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
Message-ID: <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
Date: Thu, 27 May 2021 13:40:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210523170415.90410-2-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net, "Yadav,
 Pratyush" <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2021 20:04, Paul Cercueil wrote:
> Having GEM buffers backed by non-coherent memory is interesting in the
> particular case where it is faster to render to a non-coherent buffer
> then sync the data cache, than to render to a write-combine buffer, and
> (by extension) much faster than using a shadow buffer. This is true for
> instance on some Ingenic SoCs, where even simple blits (e.g. memcpy)
> are about three times faster using this method.
> 
> Add a 'map_noncoherent' flag to the drm_gem_cma_object structure, which
> can be set by the drivers when they create the dumb buffer.
> 
> Since this really only applies to software rendering, disable this flag
> as soon as the CMA objects are exported via PRIME.
> 
> v3: New patch. Now uses a simple 'map_noncoherent' flag to control how
>      the objects are mapped, and use the new dma_mmap_pages function.
> 
> v4: Make sure map_noncoherent is always disabled when creating GEM
>      objects meant to be used with dma-buf.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_gem_cma_helper.c | 38 +++++++++++++++++++++-------
>   include/drm/drm_gem_cma_helper.h     |  3 +++
>   2 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 7942cf05cd93..235c7a63da2b 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -46,6 +46,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
>    * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
>    * @drm: DRM device
>    * @size: size of the object to allocate
> + * @private: true if used for internal purposes
>    *
>    * This function creates and initializes a GEM CMA object of the given size,
>    * but doesn't allocate any memory to back the object.
> @@ -55,11 +56,11 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
>    * error code on failure.
>    */
>   static struct drm_gem_cma_object *
> -__drm_gem_cma_create(struct drm_device *drm, size_t size)
> +__drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
>   {
>   	struct drm_gem_cma_object *cma_obj;
>   	struct drm_gem_object *gem_obj;
> -	int ret;
> +	int ret = 0;
>   
>   	if (drm->driver->gem_create_object)
>   		gem_obj = drm->driver->gem_create_object(drm, size);
> @@ -73,7 +74,14 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
>   
>   	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
>   
> -	ret = drm_gem_object_init(drm, gem_obj, size);
> +	if (private) {
> +		drm_gem_private_object_init(drm, gem_obj, size);
> +
> +		/* Always use writecombine for dma-buf mappings */
> +		cma_obj->map_noncoherent = false;
> +	} else {
> +		ret = drm_gem_object_init(drm, gem_obj, size);
> +	}
>   	if (ret)
>   		goto error;
>   
> @@ -111,12 +119,19 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>   
>   	size = round_up(size, PAGE_SIZE);
>   
> -	cma_obj = __drm_gem_cma_create(drm, size);
> +	cma_obj = __drm_gem_cma_create(drm, size, false);
>   	if (IS_ERR(cma_obj))
>   		return cma_obj;
>   
> -	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
> -				      GFP_KERNEL | __GFP_NOWARN);
> +	if (cma_obj->map_noncoherent) {
> +		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
> +						       &cma_obj->paddr,
> +						       DMA_TO_DEVICE,
> +						       GFP_KERNEL | __GFP_NOWARN);
> +	} else {
> +		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
> +					      GFP_KERNEL | __GFP_NOWARN);
> +	}
>   	if (!cma_obj->vaddr) {
>   		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
>   			 size);
> @@ -432,7 +447,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>   		return ERR_PTR(-EINVAL);
>   
>   	/* Create a CMA GEM buffer. */
> -	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
> +	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size, true);
>   	if (IS_ERR(cma_obj))
>   		return ERR_CAST(cma_obj);
>   
> @@ -499,8 +514,13 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>   
>   	cma_obj = to_drm_gem_cma_obj(obj);
>   
> -	ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
> -			  cma_obj->paddr, vma->vm_end - vma->vm_start);
> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> +	if (!cma_obj->map_noncoherent)
> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> +
> +	ret = dma_mmap_pages(cma_obj->base.dev->dev,
> +			     vma, vma->vm_end - vma->vm_start,
> +			     virt_to_page(cma_obj->vaddr));

This breaks mmap on TI's J7 EVM (tidss driver). All DRM apps just die 
when doing mmap. Changing these lines back to dma_mmap_wc() makes it work.

Is dma_alloc_wc() even compatible with dma_mmap_pages()?

  Tomi
