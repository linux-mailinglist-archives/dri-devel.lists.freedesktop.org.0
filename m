Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33A258968
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660E86E82A;
	Tue,  1 Sep 2020 07:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82FE6E82E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:40:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f7so352738wrw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=0dMDoLW4/V0CBT2qh5v4hL6ui4LKLRgE58vB9ic/W/M=;
 b=E5dZ6NznDCWIxvwwKA7tc1MIEb7ur7yXJKyAzLIRFQ0XwrMQSSFwSNiVkFhqz26CQL
 T3WZ3hmK4oUAUajJ3GKCXnJIEuemkYeQ/d6OJzuyMBHa36DsUR/ymwy6eCPbJSSJMOLv
 L100dPpY/BW79sCQrexf9ceA6WIxeIcEm402E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=0dMDoLW4/V0CBT2qh5v4hL6ui4LKLRgE58vB9ic/W/M=;
 b=atnEGjdUOHMoZf4BX6DI5r49E9MtzYB3mOQvHCMXn/H0D0H/UK2OmjXVoQ5AwBKSft
 ysScKFYAAkCUCZmjv9kX+Z7cl2m9MbtTG//X+EUVFmwKcgoOjeYcVGUHCFUOGqeFFxT5
 NDSHHVxhhOkaSX4DmxmZhR50t86FZfOba8Ko3Tehet45H1d2HoLLW8Zwo93zW2/B+DNW
 aotnrYAS/N9jxApvSI9wINk77IQUjEx5DZFFh3SP539kJ1gZdChR5suBNBAPk7nQIsDd
 PYoy5pC/FVmLT93BxHsbBYJQ0moeuwn1q0L52NoSr2Fd/HlO0l/Z4XV3Pp9w+hvalBmO
 8Y3A==
X-Gm-Message-State: AOAM5302zqOLtPoHJADF88+BLT5Tg/uti8g6LVH/cfH9wx/hPkhZtuY2
 JllrNCyzNXBZMaxyxM3RDUsc2w==
X-Google-Smtp-Source: ABdhPJzCV7lPfbJCoArzY1LN2/bWPamRPE0OsWfPisRFktCHPs3u7sq0+hzW7bOAp2HrZVmyNnX6ww==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr408886wrn.238.1598946046446;
 Tue, 01 Sep 2020 00:40:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h13sm737218wrx.17.2020.09.01.00.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:40:45 -0700 (PDT)
Date: Tue, 1 Sep 2020 09:40:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/2] drm: allow limiting the scatter list size.
Message-ID: <20200901074043.GT2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
References: <20200818092017.26290-1-kraxel@redhat.com>
 <20200818092017.26290-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818092017.26290-2-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 11:20:16AM +0200, Gerd Hoffmann wrote:
> Add max_segment argument to drm_prime_pages_to_sg().  When set pass it
> through to the __sg_alloc_table_from_pages() call, otherwise use
> SCATTERLIST_MAX_SEGMENT.
> 
> Also add max_segment field to drm driver and pass it to
> drm_prime_pages_to_sg() calls in drivers and helpers.
> 
> v2: place max_segment in drm driver not gem object.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_device.h                    |  8 ++++++++
>  include/drm/drm_prime.h                     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  3 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c      |  3 ++-
>  drivers/gpu/drm/drm_prime.c                 | 10 +++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  3 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 ++-
>  drivers/gpu/drm/msm/msm_gem.c               |  3 ++-
>  drivers/gpu/drm/msm/msm_gem_prime.c         |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_prime.c     |  3 ++-
>  drivers/gpu/drm/radeon/radeon_prime.c       |  3 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  6 ++++--
>  drivers/gpu/drm/tegra/gem.c                 |  3 ++-
>  drivers/gpu/drm/vgem/vgem_drv.c             |  3 ++-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     |  3 ++-
>  15 files changed, 43 insertions(+), 17 deletions(-)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 0988351d743c..47cb547a8115 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -329,6 +329,14 @@ struct drm_device {
>  	 */
>  	struct drm_fb_helper *fb_helper;
>  
> +	/**
> +	 * @max_segment:
> +	 *
> +	 * Max size for scatter list segments.  When unset the default
> +	 * (SCATTERLIST_MAX_SEGMENT) is used.
> +	 */
> +	size_t max_segment;

Is there no better place for this then "at the bottom"? drm_device is a
huge structure, piling stuff up randomly doesn't make it better :-)

I think ideally we'd have a gem substruct like we have on the modeset side
at least.
-Daniel

> +
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 9af7422b44cf..2c3689435cb4 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -88,7 +88,8 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
>  
> -struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages);
> +struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages,
> +				       size_t max_segment);
>  struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  				     int flags);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 519ce4427fce..8f6a647757e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -303,7 +303,8 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
>  	switch (bo->tbo.mem.mem_type) {
>  	case TTM_PL_TT:
>  		sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages,
> -					    bo->tbo.num_pages);
> +					    bo->tbo.num_pages,
> +					    obj->dev->max_segment);
>  		if (IS_ERR(sgt))
>  			return sgt;
>  
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 4b7cfbac4daa..8f47b41b0b2f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -656,7 +656,8 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj)
>  
>  	WARN_ON(shmem->base.import_attach);
>  
> -	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT);
> +	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT,
> +				     obj->dev->max_segment);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1693aa7c14b5..27c783fd6633 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -802,7 +802,8 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>   *
>   * This is useful for implementing &drm_gem_object_funcs.get_sg_table.
>   */
> -struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages)
> +struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages,
> +				       size_t max_segment)
>  {
>  	struct sg_table *sg = NULL;
>  	int ret;
> @@ -813,8 +814,11 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
>  		goto out;
>  	}
>  
> -	ret = sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> -				nr_pages << PAGE_SHIFT, GFP_KERNEL);
> +	if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
> +		max_segment = SCATTERLIST_MAX_SEGMENT;
> +	ret = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> +					  nr_pages << PAGE_SHIFT,
> +					  max_segment, GFP_KERNEL);
>  	if (ret)
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index f06e19e7be04..90654246b335 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -103,7 +103,8 @@ struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>  		int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
>  		struct sg_table *sgt;
>  
> -		sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
> +		sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages,
> +					    etnaviv_obj->base.dev->max_segment);
>  		if (IS_ERR(sgt)) {
>  			dev_err(dev->dev, "failed to allocate sgt: %ld\n",
>  				PTR_ERR(sgt));
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 6d9e5c3c4dd5..f65be0fffb3d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -19,7 +19,8 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
>  		return ERR_PTR(-EINVAL);
>  
> -	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
> +	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages,
> +				     obj->dev->max_segment);
>  }
>  
>  void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b2f49152b4d4..dbf1437c3dac 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -126,7 +126,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
>  
>  		msm_obj->pages = p;
>  
> -		msm_obj->sgt = drm_prime_pages_to_sg(p, npages);
> +		msm_obj->sgt = drm_prime_pages_to_sg(p, npages,
> +						     obj->dev->max_segment);
>  		if (IS_ERR(msm_obj->sgt)) {
>  			void *ptr = ERR_CAST(msm_obj->sgt);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index d7c8948427fe..6337cd1f9428 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -19,7 +19,8 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
>  		return NULL;
>  
> -	return drm_prime_pages_to_sg(msm_obj->pages, npages);
> +	return drm_prime_pages_to_sg(msm_obj->pages, npages,
> +				     obj->dev->max_segment);
>  }
>  
>  void *msm_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index bae6a3eccee0..dd0ff032ae16 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -32,7 +32,8 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>  	int npages = nvbo->bo.num_pages;
>  
> -	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages);
> +	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages,
> +				     obj->dev->max_segment);
>  }
>  
>  void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index b906e8fbd5f3..61a3fe147489 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -36,7 +36,8 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	struct radeon_bo *bo = gem_to_radeon_bo(obj);
>  	int npages = bo->tbo.num_pages;
>  
> -	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages);
> +	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages,
> +				     obj->dev->max_segment);
>  }
>  
>  void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index b9275ba7c5a5..5ddb2d31a607 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -85,7 +85,8 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
>  
>  	rk_obj->num_pages = rk_obj->base.size >> PAGE_SHIFT;
>  
> -	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
> +	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages,
> +					    rk_obj->base.dev->max_segment);
>  	if (IS_ERR(rk_obj->sgt)) {
>  		ret = PTR_ERR(rk_obj->sgt);
>  		goto err_put_pages;
> @@ -442,7 +443,8 @@ struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	int ret;
>  
>  	if (rk_obj->pages)
> -		return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
> +		return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages,
> +					     obj->dev->max_segment);
>  
>  	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>  	if (!sgt)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 723df142a981..a0abde747e95 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -284,7 +284,8 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
>  
>  	bo->num_pages = bo->gem.size >> PAGE_SHIFT;
>  
> -	bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages);
> +	bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages,
> +					bo->gem.dev->max_segment);
>  	if (IS_ERR(bo->sgt)) {
>  		err = PTR_ERR(bo->sgt);
>  		goto put_pages;
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 313339bbff90..045461dc6319 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -321,7 +321,8 @@ static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>  	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>  
> -	return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT);
> +	return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT,
> +				     obj->dev->max_segment);
>  }
>  
>  static struct drm_gem_object* vgem_prime_import(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index f0b85e094111..61a8c1a9fb04 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -179,7 +179,8 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
>  	if (!xen_obj->pages)
>  		return ERR_PTR(-ENOMEM);
>  
> -	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages);
> +	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages,
> +				     gem_obj->dev->max_segment);
>  }
>  
>  struct drm_gem_object *
> -- 
> 2.18.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
