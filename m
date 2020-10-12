Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0420928BACD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 16:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CCE6E499;
	Mon, 12 Oct 2020 14:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9AD6E497
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:26:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y12so14056938wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=woUargkA/zqgmf13xxgEV/cLC04mgF0Hb+5pUiQ1Cg4=;
 b=dH0wEAOhW5veJEX2JEI/RmukCP6H/lXGR1SSjXVc8qTGVx1QyPoW1rJhdXvivIbxOg
 PKilhqALfRRO9h+uJRvZE9hiPA7QU5xP8InkeXP5vjf7sH6pumTx5YHrKHkKaC9wnQvw
 dq2a5u9PJRRMQhGUNrQr7qBtZaozS+/8ZHw6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=woUargkA/zqgmf13xxgEV/cLC04mgF0Hb+5pUiQ1Cg4=;
 b=ciwfwtvRwtfAbcT44Cc44owURFN9KKqIp6i6/s8AKq4x35WThsrDqNWswwr7dFTiWG
 JIWKjPkIOW0T41XYRDxcfdiy1n+wNjG3QfLKaVj1R6vK/1JOSpEeKoSvpb5vKT0NAa+x
 H3jGuo5yMgaBtYv1hRkIVk0DPjS9CT6eDhVhe/s3oNfmw924cm8X0GItpBk7iEgldVT3
 1kMuZ3jhBYVt3deFPXFw6vRuUoAdALjqgvlOhfMmbcnCG2vNK4buhF9D6iHB/EF3JqBp
 tZKYuAwqNrK4/byNzUNBtJYF8+QJciXqKudIoGea728LsLYyfcllLZO3V/CQayX/FXE0
 w5mQ==
X-Gm-Message-State: AOAM530TtaPM/1aM27DIQvII3mydNUWdg7GhrTiBVk40xHdVXdv5eT4f
 LAbNxbqyLoFP+u8itSa1m4eWpLw6zfgg7Sbv
X-Google-Smtp-Source: ABdhPJywQsyq30xcEzxlPj5gvdjZEwo+qB48+wQgege4eUvXFV7nw3q3NKlkL6+ySri542Ch/TgVlw==
X-Received: by 2002:adf:ba85:: with SMTP id p5mr17043794wrg.64.1602512790082; 
 Mon, 12 Oct 2020 07:26:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm22698376wml.21.2020.10.12.07.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:26:29 -0700 (PDT)
Date: Mon, 12 Oct 2020 16:26:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] drm: Ask whether drm_gem_get_pages() should clear
 the CPU cache
Message-ID: <20201012142627.GZ438822@phenom.ffwll.local>
References: <20201012105131.32116-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012105131.32116-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 11:51:30AM +0100, Chris Wilson wrote:
> On some processors (such as arch/x86), accessing a page via a WC PAT is
> bypassed if the page is physically tagged in the CPU cache, and the
> access is serviced by the cache instead -- which leads to incoherency
> should the physical page itself be accessed using DMA. In order to
> prevent the false cache sharing of the physical pages, we need to
> explicitly flush the cache lines of those pages.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Hm I'd leave this out for now. dma-api/cache flushing, and especially on
x86 is kinda a mess. I'd just land v1 of your patch meanwhile for vgem.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c                   | 8 ++++++--
>  drivers/gpu/drm/drm_gem_shmem_helper.c      | 8 +++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 2 +-
>  drivers/gpu/drm/gma500/gtt.c                | 2 +-
>  drivers/gpu/drm/msm/msm_gem.c               | 2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c          | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 2 +-
>  drivers/gpu/drm/tegra/gem.c                 | 2 +-
>  drivers/gpu/drm/vgem/vgem_drv.c             | 2 +-
>  drivers/gpu/drm/vkms/vkms_gem.c             | 2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     | 2 +-
>  include/drm/drm_gem.h                       | 2 +-
>  12 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1da67d34e55d..1948855d69e6 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -40,6 +40,7 @@
>  #include <linux/pagevec.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -525,6 +526,7 @@ static void drm_gem_check_release_pagevec(struct pagevec *pvec)
>   * drm_gem_get_pages - helper to allocate backing pages for a GEM object
>   * from shmem
>   * @obj: obj in question
> + * @clflush: whether to clear any CPU caches associated with the backing store
>   *
>   * This reads the page-array of the shmem-backing storage of the given gem
>   * object. An array of pages is returned. If a page is not allocated or
> @@ -546,14 +548,13 @@ static void drm_gem_check_release_pagevec(struct pagevec *pvec)
>   * drm_gem_object_init(), but not for those initialized with
>   * drm_gem_private_object_init() only.
>   */
> -struct page **drm_gem_get_pages(struct drm_gem_object *obj)
> +struct page **drm_gem_get_pages(struct drm_gem_object *obj, bool clflush)
>  {
>  	struct address_space *mapping;
>  	struct page *p, **pages;
>  	struct pagevec pvec;
>  	int i, npages;
>  
> -
>  	if (WARN_ON(!obj->filp))
>  		return ERR_PTR(-EINVAL);
>  
> @@ -589,6 +590,9 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj)
>  				(page_to_pfn(p) >= 0x00100000UL));
>  	}
>  
> +	if (clflush)
> +		drm_clflush_pages(pages, npages);
> +
>  	return pages;
>  
>  fail:
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index fb11df7aced5..78a2eb77802b 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -152,7 +152,13 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>  	if (shmem->pages_use_count++ > 0)
>  		return 0;
>  
> -	pages = drm_gem_get_pages(obj);
> +	/*
> +	 * On some processors (such as arch/x86), accessing a page via a WC PAT
> +	 * is bypassed if the page is physically tagged in the CPU cache, and
> +	 * the access is serviced by the cache instead -- which leads to
> +	 * incoherency should the physical page itself be accessed using DMA.
> +	 */
> +	pages = drm_gem_get_pages(obj, !shmem->map_cached);
>  	if (IS_ERR(pages)) {
>  		DRM_DEBUG_KMS("Failed to get pages (%ld)\n", PTR_ERR(pages));
>  		shmem->pages_use_count = 0;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 67d9a2b9ea6a..d8279ea363b3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -58,7 +58,7 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
>  static int etnaviv_gem_shmem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>  {
>  	struct drm_device *dev = etnaviv_obj->base.dev;
> -	struct page **p = drm_gem_get_pages(&etnaviv_obj->base);
> +	struct page **p = drm_gem_get_pages(&etnaviv_obj->base, false);
>  
>  	if (IS_ERR(p)) {
>  		dev_dbg(dev->dev, "could not get pages: %ld\n", PTR_ERR(p));
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index 9278bcfad1bf..ada56aec7e68 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -197,7 +197,7 @@ static int psb_gtt_attach_pages(struct gtt_range *gt)
>  
>  	WARN_ON(gt->pages);
>  
> -	pages = drm_gem_get_pages(&gt->gem);
> +	pages = drm_gem_get_pages(&gt->gem, false);
>  	if (IS_ERR(pages))
>  		return PTR_ERR(pages);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index c79828d31822..a7a67ef4e27e 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -102,7 +102,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
>  		int npages = obj->size >> PAGE_SHIFT;
>  
>  		if (use_pages(obj))
> -			p = drm_gem_get_pages(obj);
> +			p = drm_gem_get_pages(obj, false);
>  		else
>  			p = get_pages_vram(obj, npages);
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index d8e09792793a..1ff272c4be33 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -236,7 +236,7 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
>  	if (!(omap_obj->flags & OMAP_BO_MEM_SHMEM) || omap_obj->pages)
>  		return 0;
>  
> -	pages = drm_gem_get_pages(obj);
> +	pages = drm_gem_get_pages(obj, false);
>  	if (IS_ERR(pages)) {
>  		dev_err(obj->dev->dev, "could not get pages: %ld\n", PTR_ERR(pages));
>  		return PTR_ERR(pages);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 7d5ebb10323b..003b76c3e623 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -80,7 +80,7 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
>  	int ret, i;
>  	struct scatterlist *s;
>  
> -	rk_obj->pages = drm_gem_get_pages(&rk_obj->base);
> +	rk_obj->pages = drm_gem_get_pages(&rk_obj->base, false);
>  	if (IS_ERR(rk_obj->pages))
>  		return PTR_ERR(rk_obj->pages);
>  
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 26af8daa9a16..f075f005ecbb 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -289,7 +289,7 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
>  {
>  	int err;
>  
> -	bo->pages = drm_gem_get_pages(&bo->gem);
> +	bo->pages = drm_gem_get_pages(&bo->gem, false);
>  	if (IS_ERR(bo->pages))
>  		return PTR_ERR(bo->pages);
>  
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index fa54a6d1403d..f38dd590fa45 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -272,7 +272,7 @@ static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
>  	if (bo->pages_pin_count++ == 0) {
>  		struct page **pages;
>  
> -		pages = drm_gem_get_pages(&bo->base);
> +		pages = drm_gem_get_pages(&bo->base, false);
>  		if (IS_ERR(pages)) {
>  			bo->pages_pin_count--;
>  			mutex_unlock(&bo->pages_lock);
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index 19a0e260a4df..1d17b0ef56c7 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -166,7 +166,7 @@ static struct page **_get_pages(struct vkms_gem_object *vkms_obj)
>  	struct drm_gem_object *gem_obj = &vkms_obj->gem;
>  
>  	if (!vkms_obj->pages) {
> -		struct page **pages = drm_gem_get_pages(gem_obj);
> +		struct page **pages = drm_gem_get_pages(gem_obj, false);
>  
>  		if (IS_ERR(pages))
>  			return pages;
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index 4f34ef34ba60..520a15d75eb6 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -132,7 +132,7 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
>  	 * with the backend
>  	 */
>  	xen_obj->num_pages = DIV_ROUND_UP(size, PAGE_SIZE);
> -	xen_obj->pages = drm_gem_get_pages(&xen_obj->base);
> +	xen_obj->pages = drm_gem_get_pages(&xen_obj->base, false);
>  	if (IS_ERR(xen_obj->pages)) {
>  		ret = PTR_ERR(xen_obj->pages);
>  		xen_obj->pages = NULL;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index c38dd35da00b..118f13b1bb29 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -395,7 +395,7 @@ void drm_gem_free_mmap_offset(struct drm_gem_object *obj);
>  int drm_gem_create_mmap_offset(struct drm_gem_object *obj);
>  int drm_gem_create_mmap_offset_size(struct drm_gem_object *obj, size_t size);
>  
> -struct page **drm_gem_get_pages(struct drm_gem_object *obj);
> +struct page **drm_gem_get_pages(struct drm_gem_object *obj, bool clflush);
>  void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
>  		bool dirty, bool accessed);
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
