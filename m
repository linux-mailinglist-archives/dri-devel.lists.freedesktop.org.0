Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14825FBAE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 15:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66F66E45E;
	Mon,  7 Sep 2020 13:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76C06E466
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 13:53:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h17so11527855otr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ycAA+DdU1xPs+4BPRjymvkLu6X0RXJu9Y30n9A+nhw=;
 b=iEuCxz9/GZ6l217tQFZNQnUWpR9k7WJUgYHDT3dvu6LGpJUTO3ZHU8XY45NhdzKDQO
 1fKDlDTQJUBRg69fGPFS9NGm88rxiua5V6kLDIHzvXJQl2XTqcbaxMJ2A3jRMSNE3KpM
 gljXkMSlOUveuv/7r6jtHMbsJfGshsRGGdmd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ycAA+DdU1xPs+4BPRjymvkLu6X0RXJu9Y30n9A+nhw=;
 b=c3KfMnuhXr8czqvDdg+iDWIOecIkt8DW8mNDhf2DUQvK1cIkmWQWLNNCd2zHu45+tb
 8Q67DY1QdpivcU1BIIPY3AQ2DiGg2x0iKHfnXXofakz+sy+/ullCS4+K/auRPik+Tw0W
 ZxXUi+8knhJsB4iB+oRgLjnhnq6/vsgAlUyBvxuoadbCdbYHN+hp2uljFGaTo/Is3gjt
 SaqzidZLlutARF9ydb2Z9XVNJaxEhDU+DBPMBk2XXACqG/SiyZa4X4D7YJJ0ga+/afD/
 vLJ15eq2OhlKUk5B3qxJ6vrHUSirPrS2C88ecxwGOPZhJMcewH1uJupfZcyhzkJzST/g
 Qqpw==
X-Gm-Message-State: AOAM530AvMWOsEosXRb6/K9rX1M7E8UCCKmQIc+rrx8JqvuKqmdp1nzX
 ctHz968EpSF3XYHXgfGuoCHwYvMwh4Qo6ax2TjCYIw==
X-Google-Smtp-Source: ABdhPJyIa5ADwu1SDw+83jpp18ZhpBHh8/4pkOiQO0+iszF4Hhvn1IVbMUtYG2efgD1SKjDwsO+pmUrMsJOpLEnsVks=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr14697170otq.188.1599486793337; 
 Mon, 07 Sep 2020 06:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200907112425.15610-1-kraxel@redhat.com>
 <20200907112425.15610-2-kraxel@redhat.com>
In-Reply-To: <20200907112425.15610-2-kraxel@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 7 Sep 2020 15:53:02 +0200
Message-ID: <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm: allow limiting the scatter list size.
To: Gerd Hoffmann <kraxel@redhat.com>
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
 <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>,
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 7, 2020 at 1:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Add drm_device argument to drm_prime_pages_to_sg(), so we can
> call dma_max_mapping_size() to figure the segment size limit
> and call into __sg_alloc_table_from_pages() with the correct
> limit.
>
> This fixes virtio-gpu with sev.  Possibly it'll fix other bugs
> too given that drm seems to totaly ignore segment size limits
> so far ...
>
> v2: place max_segment in drm driver not gem object.
> v3: move max_segment next to the other gem fields.
> v4: just use dma_max_mapping_size().
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Uh, are you sure this works in all cases for virtio? The comments I've
found suggest very much not ... Or is that all very old stuff only
that no one cares about anymore?
-Daniel

> ---
>  include/drm/drm_prime.h                     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  3 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c      |  2 +-
>  drivers/gpu/drm/drm_prime.c                 | 13 ++++++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  3 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c               |  2 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c         |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_prime.c     |  2 +-
>  drivers/gpu/drm/radeon/radeon_prime.c       |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  5 +++--
>  drivers/gpu/drm/tegra/gem.c                 |  2 +-
>  drivers/gpu/drm/vgem/vgem_drv.c             |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     |  3 ++-
>  14 files changed, 29 insertions(+), 17 deletions(-)
>
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 9af7422b44cf..bf141e74a1c2 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -88,7 +88,8 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
>
> -struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages);
> +struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
> +                                      struct page **pages, unsigned int nr_pages);
>  struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>                                      int flags);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 519ce4427fce..d7050ab95946 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -302,7 +302,8 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
>
>         switch (bo->tbo.mem.mem_type) {
>         case TTM_PL_TT:
> -               sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages,
> +               sgt = drm_prime_pages_to_sg(obj->dev,
> +                                           bo->tbo.ttm->pages,
>                                             bo->tbo.num_pages);
>                 if (IS_ERR(sgt))
>                         return sgt;
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 4b7cfbac4daa..0a952f27c184 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -656,7 +656,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj)
>
>         WARN_ON(shmem->base.import_attach);
>
> -       return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT);
> +       return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1693aa7c14b5..8a6a3c99b7d8 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -802,9 +802,11 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>   *
>   * This is useful for implementing &drm_gem_object_funcs.get_sg_table.
>   */
> -struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages)
> +struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
> +                                      struct page **pages, unsigned int nr_pages)
>  {
>         struct sg_table *sg = NULL;
> +       size_t max_segment = 0;
>         int ret;
>
>         sg = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
> @@ -813,8 +815,13 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
>                 goto out;
>         }
>
> -       ret = sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> -                               nr_pages << PAGE_SHIFT, GFP_KERNEL);
> +       if (dev)
> +               max_segment = dma_max_mapping_size(dev->dev);
> +       if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
> +               max_segment = SCATTERLIST_MAX_SEGMENT;
> +       ret = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> +                                         nr_pages << PAGE_SHIFT,
> +                                         max_segment, GFP_KERNEL);
>         if (ret)
>                 goto out;
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index f06e19e7be04..ea19f1d27275 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -103,7 +103,8 @@ struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>                 int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
>                 struct sg_table *sgt;
>
> -               sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
> +               sgt = drm_prime_pages_to_sg(etnaviv_obj->base.dev,
> +                                           etnaviv_obj->pages, npages);
>                 if (IS_ERR(sgt)) {
>                         dev_err(dev->dev, "failed to allocate sgt: %ld\n",
>                                 PTR_ERR(sgt));
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 6d9e5c3c4dd5..4aa3426a9ba4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -19,7 +19,7 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>         if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
>                 return ERR_PTR(-EINVAL);
>
> -       return drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
> +       return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
>  }
>
>  void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b2f49152b4d4..b4553caaa196 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -126,7 +126,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
>
>                 msm_obj->pages = p;
>
> -               msm_obj->sgt = drm_prime_pages_to_sg(p, npages);
> +               msm_obj->sgt = drm_prime_pages_to_sg(obj->dev, p, npages);
>                 if (IS_ERR(msm_obj->sgt)) {
>                         void *ptr = ERR_CAST(msm_obj->sgt);
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index d7c8948427fe..515ef80816a0 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -19,7 +19,7 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>         if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
>                 return NULL;
>
> -       return drm_prime_pages_to_sg(msm_obj->pages, npages);
> +       return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
>  }
>
>  void *msm_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index bae6a3eccee0..7766b810653f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -32,7 +32,7 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
>         struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>         int npages = nvbo->bo.num_pages;
>
> -       return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages);
> +       return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages, npages);
>  }
>
>  void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index b906e8fbd5f3..ea4c900e7c41 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -36,7 +36,7 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
>         struct radeon_bo *bo = gem_to_radeon_bo(obj);
>         int npages = bo->tbo.num_pages;
>
> -       return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages);
> +       return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages, npages);
>  }
>
>  void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index b9275ba7c5a5..77eeaf3439f6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -85,7 +85,8 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
>
>         rk_obj->num_pages = rk_obj->base.size >> PAGE_SHIFT;
>
> -       rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
> +       rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->base.dev,
> +                                           rk_obj->pages, rk_obj->num_pages);
>         if (IS_ERR(rk_obj->sgt)) {
>                 ret = PTR_ERR(rk_obj->sgt);
>                 goto err_put_pages;
> @@ -442,7 +443,7 @@ struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
>         int ret;
>
>         if (rk_obj->pages)
> -               return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
> +               return drm_prime_pages_to_sg(obj->dev,rk_obj->pages, rk_obj->num_pages);
>
>         sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>         if (!sgt)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 723df142a981..47e2935b8c68 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -284,7 +284,7 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
>
>         bo->num_pages = bo->gem.size >> PAGE_SHIFT;
>
> -       bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages);
> +       bo->sgt = drm_prime_pages_to_sg(bo->gem.dev, bo->pages, bo->num_pages);
>         if (IS_ERR(bo->sgt)) {
>                 err = PTR_ERR(bo->sgt);
>                 goto put_pages;
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 313339bbff90..15dd41e67de3 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -321,7 +321,7 @@ static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>         struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>
> -       return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT);
> +       return drm_prime_pages_to_sg(obj->dev, bo->pages, bo->base.size >> PAGE_SHIFT);
>  }
>
>  static struct drm_gem_object* vgem_prime_import(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index 39ff95b75357..aed7510e2710 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -179,7 +179,8 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
>         if (!xen_obj->pages)
>                 return ERR_PTR(-ENOMEM);
>
> -       return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages);
> +       return drm_prime_pages_to_sg(gem_obj->dev,
> +                                    xen_obj->pages, xen_obj->num_pages);
>  }
>
>  struct drm_gem_object *
> --
> 2.27.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
