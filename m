Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1828139C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 15:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571A6E980;
	Fri,  2 Oct 2020 13:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A706E976
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 13:02:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x14so1725410wrl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZH0UeM3EQaOgODg8f5u4JykkLSw99ZDNsJ/LGTxMsA4=;
 b=WSBqSLyS29Z73Uw9yIPiz/9uRVkqEBxNG1QIwgn3TSiO6xBXzzZJJTJk50brQ+OXzd
 fSMJxFF9myx78gyhhKm1yfd4C7i1NYeRrSM/KjfbXaMMpDidKEXo7wDmgFOk4+iCYmSU
 4OgQVgIvy9pVPEW4ohUlXRKTIO1C9dyOG8rls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZH0UeM3EQaOgODg8f5u4JykkLSw99ZDNsJ/LGTxMsA4=;
 b=IgvVImgv4horsfrcagYEmBiwUTHoSMbuLTf3NpJNn8JtnIDOFkXyK1Ftn1txBL3rYV
 4RPMoUIIR93SxKqb4qVP1uR24w7F1JkdEH3axbCmMfKcxI1E1vd18ACFBYztmRL02CBc
 Y8oOfzMLrazkKsxi7mIy+/OqTv/HJbAb/0cy/X6i3GG6RFJycYBwmE0gC5o5ecj3CHzG
 XBiKZvn8NupTtlDl1qc8hTdDZ4qgSIcFreYpn5lJlMInoeOSdm8YXSOQImPmVNaWvJF6
 RklaEoR/g0JWo0GcokmOBI9JTM4j6mC6LS/8rxwJGN/jo3fkLNnBxuozYGdfRc4lPr7j
 cYSg==
X-Gm-Message-State: AOAM532Pf4g9JP1a2WbyaXhbzem+PZqtvDcat57OMp/BRR+2UDZHptXZ
 lyIzgkA/a073jxUNnzhjuca1TQ==
X-Google-Smtp-Source: ABdhPJwks2N4hhijJnxG0wAKt0M+00xtLsCvcKckl9YRlXeiIrk80ur/Elt/HK8bvnXgk8veVkRL2g==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr2811904wrn.145.1601643766914; 
 Fri, 02 Oct 2020 06:02:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v17sm1807477wrc.23.2020.10.02.06.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:02:45 -0700 (PDT)
Date: Fri, 2 Oct 2020 15:02:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/7] drm/gem: Use struct dma_buf_map in GEM vmap ops
 and convert GEM backends
Message-ID: <20201002130242.GJ438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-4-tzimmermann@suse.de>
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
Cc: luben.tuikov@amd.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, ray.huang@amd.com, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, lima@lists.freedesktop.org,
 oleksandr_andrushchenko@epam.com, krzk@kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 linux+etnaviv@armlinux.org.uk, spice-devel@lists.freedesktop.org,
 alyssa.rosenzweig@collabora.com, etnaviv@lists.freedesktop.org,
 hdegoede@redhat.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com, alexander.deucher@amd.com,
 linux-media@vger.kernel.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 05:14:33PM +0200, Thomas Zimmermann wrote:
> This patch replaces the vmap/vunmap's use of raw pointers in GEM object
> functions with instances of struct dma_buf_map. GEM backends are
> converted as well.
> 
> For most GEM backends, this simply change the returned type. GEM VRAM
> helpers are also updated to indicate whether the returned framebuffer
> address is in system or I/O memory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  4 +-
>  drivers/gpu/drm/ast/ast_cursor.c            | 29 +++----
>  drivers/gpu/drm/ast/ast_drv.h               |  7 +-
>  drivers/gpu/drm/drm_gem.c                   | 22 ++---
>  drivers/gpu/drm/drm_gem_cma_helper.c        | 14 ++--
>  drivers/gpu/drm/drm_gem_shmem_helper.c      | 48 ++++++-----
>  drivers/gpu/drm/drm_gem_vram_helper.c       | 90 +++++++++++----------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 11 ++-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c     |  6 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.h     |  4 +-
>  drivers/gpu/drm/lima/lima_gem.c             |  6 +-
>  drivers/gpu/drm/lima/lima_sched.c           | 11 ++-
>  drivers/gpu/drm/mgag200/mgag200_mode.c      | 12 +--
>  drivers/gpu/drm/nouveau/nouveau_gem.h       |  4 +-
>  drivers/gpu/drm/nouveau/nouveau_prime.c     |  9 ++-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 14 ++--
>  drivers/gpu/drm/qxl/qxl_display.c           | 13 +--
>  drivers/gpu/drm/qxl/qxl_draw.c              | 16 ++--
>  drivers/gpu/drm/qxl/qxl_drv.h               |  8 +-
>  drivers/gpu/drm/qxl/qxl_object.c            | 23 +++---
>  drivers/gpu/drm/qxl/qxl_object.h            |  2 +-
>  drivers/gpu/drm/qxl/qxl_prime.c             | 12 +--
>  drivers/gpu/drm/radeon/radeon_gem.c         |  4 +-
>  drivers/gpu/drm/radeon/radeon_prime.c       |  9 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 22 +++--
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h |  4 +-
>  drivers/gpu/drm/tiny/cirrus.c               | 10 ++-
>  drivers/gpu/drm/tiny/gm12u320.c             | 10 ++-
>  drivers/gpu/drm/udl/udl_modeset.c           |  8 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c       | 11 ++-
>  drivers/gpu/drm/vc4/vc4_bo.c                |  6 +-
>  drivers/gpu/drm/vc4/vc4_drv.h               |  2 +-
>  drivers/gpu/drm/vgem/vgem_drv.c             | 16 ++--
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     | 18 +++--
>  drivers/gpu/drm/xen/xen_drm_front_gem.h     |  6 +-
>  include/drm/drm_gem.h                       |  5 +-
>  include/drm/drm_gem_cma_helper.h            |  4 +-
>  include/drm/drm_gem_shmem_helper.h          |  4 +-
>  include/drm/drm_gem_vram_helper.h           |  4 +-
>  41 files changed, 304 insertions(+), 222 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 5b465ab774d1..de7d0cfe1b93 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -44,13 +44,14 @@
>  /**
>   * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
>   * @obj: GEM BO
> + * @map: The virtual address of the mapping.
>   *
>   * Sets up an in-kernel virtual mapping of the BO's memory.
>   *
>   * Returns:
> - * The virtual address of the mapping or an error pointer.
> + * 0 on success, or a negative errno code otherwise.
>   */
> -void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj)
> +int amdgpu_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  	int ret;
> @@ -58,19 +59,20 @@ void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj)
>  	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages,
>  			  &bo->dma_buf_vmap);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
> +	ttm_kmap_obj_to_dma_buf_map(&bo->dma_buf_vmap, map);

I guess with the ttm_bo_vmap idea all the ttm changes here will look a bit
different.

>  
> -	return bo->dma_buf_vmap.virtual;
> +	return 0;
>  }
>  
>  /**
>   * amdgpu_gem_prime_vunmap - &dma_buf_ops.vunmap implementation
>   * @obj: GEM BO
> - * @vaddr: Virtual address (unused)
> + * @map: Virtual address (unused)
>   *
>   * Tears down the in-kernel virtual mapping of the BO's memory.
>   */
> -void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> index 2c5c84a06bb9..622642793064 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> @@ -31,8 +31,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf);
>  bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>  				      struct amdgpu_bo *bo);
> -void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj);
> -void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int amdgpu_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
>  			  struct vm_area_struct *vma);
>  
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index e0f4613918ad..459a3774e4e1 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -39,7 +39,7 @@ static void ast_cursor_fini(struct ast_private *ast)
>  
>  	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
>  		gbo = ast->cursor.gbo[i];
> -		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
> +		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
>  		drm_gem_vram_unpin(gbo);
>  		drm_gem_vram_put(gbo);
>  	}
> @@ -60,7 +60,7 @@ int ast_cursor_init(struct ast_private *ast)
>  	struct drm_device *dev = &ast->base;
>  	size_t size, i;
>  	struct drm_gem_vram_object *gbo;
> -	void __iomem *vaddr;
> +	struct dma_buf_map map;
>  	int ret;
>  
>  	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> @@ -77,16 +77,15 @@ int ast_cursor_init(struct ast_private *ast)
>  			drm_gem_vram_put(gbo);
>  			goto err_drm_gem_vram_put;
>  		}
> -		vaddr = drm_gem_vram_vmap(gbo);
> -		if (IS_ERR(vaddr)) {
> -			ret = PTR_ERR(vaddr);
> +		ret = drm_gem_vram_vmap(gbo, &map);
> +		if (ret) {
>  			drm_gem_vram_unpin(gbo);
>  			drm_gem_vram_put(gbo);
>  			goto err_drm_gem_vram_put;
>  		}
>  
>  		ast->cursor.gbo[i] = gbo;
> -		ast->cursor.vaddr[i] = vaddr;
> +		ast->cursor.map[i] = map;
>  	}
>  
>  	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
> @@ -95,7 +94,7 @@ int ast_cursor_init(struct ast_private *ast)
>  	while (i) {
>  		--i;
>  		gbo = ast->cursor.gbo[i];
> -		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
> +		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
>  		drm_gem_vram_unpin(gbo);
>  		drm_gem_vram_put(gbo);
>  	}
> @@ -170,8 +169,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  {
>  	struct drm_device *dev = &ast->base;
>  	struct drm_gem_vram_object *gbo;
> +	struct dma_buf_map map;
>  	int ret;
> -	void *src;
>  	void __iomem *dst;
>  
>  	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
> @@ -183,18 +182,16 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  	ret = drm_gem_vram_pin(gbo, 0);
>  	if (ret)
>  		return ret;
> -	src = drm_gem_vram_vmap(gbo);
> -	if (IS_ERR(src)) {
> -		ret = PTR_ERR(src);
> +	ret = drm_gem_vram_vmap(gbo, &map);
> +	if (ret)
>  		goto err_drm_gem_vram_unpin;
> -	}
>  
> -	dst = ast->cursor.vaddr[ast->cursor.next_index];
> +	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
>  
>  	/* do data transfer to cursor BO */
> -	update_cursor_image(dst, src, fb->width, fb->height);
> +	update_cursor_image(dst, map.vaddr, fb->width, fb->height);

I don't think digging around in the pointer is a good idea, imo this
should get a 

	/* TODO: Use mapping abstraction properly */

or similar. Same for all the other usage for map.vaddr added to drivers
below (the stuff in helpers that the next patches will change again I
think you can leave as-is, it'll go away).

I'm also wondering whether we should prefix all members of struct
dma_buf_map with _ to make it clear they shouldn't be touched, so
map._vaddr and map._is_iomem.

Also todo.rst entry for all these, there's a lot from looking throught
this patch.

>  
> -	drm_gem_vram_vunmap(gbo, src);
> +	drm_gem_vram_vunmap(gbo, &map);
>  	drm_gem_vram_unpin(gbo);
>  
>  	return 0;
> @@ -257,7 +254,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
>  	u8 __iomem *sig;
>  	u8 jreg;
>  
> -	dst = ast->cursor.vaddr[ast->cursor.next_index];
> +	dst = ast->cursor.map[ast->cursor.next_index].vaddr;
>  
>  	sig = dst + AST_HWC_SIZE;
>  	writel(x, sig + AST_HWC_SIGNATURE_X);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 467049ca8430..f963141dd851 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -28,10 +28,11 @@
>  #ifndef __AST_DRV_H__
>  #define __AST_DRV_H__
>  
> -#include <linux/types.h>
> -#include <linux/io.h>
> +#include <linux/dma-buf-map.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-algo-bit.h>
> +#include <linux/io.h>
> +#include <linux/types.h>
>  
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
> @@ -131,7 +132,7 @@ struct ast_private {
>  
>  	struct {
>  		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
> -		void __iomem *vaddr[AST_DEFAULT_HWC_NUM];
> +		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
>  		unsigned int next_index;
>  	} cursor;
>  
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1da67d34e55d..0c4a66dea5c2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1207,26 +1207,30 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>  
>  void *drm_gem_vmap(struct drm_gem_object *obj)
>  {
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
> -	if (obj->funcs->vmap)
> -		vaddr = obj->funcs->vmap(obj);
> -	else
> -		vaddr = ERR_PTR(-EOPNOTSUPP);
> +	if (!obj->funcs->vmap) {
> +		return ERR_PTR(-EOPNOTSUPP);
>  
> -	if (!vaddr)
> -		vaddr = ERR_PTR(-ENOMEM);
> +	ret = obj->funcs->vmap(obj, &map);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	else if (dma_buf_map_is_null(&map))
> +		return ERR_PTR(-ENOMEM);
>  
> -	return vaddr;
> +	return map.vaddr;
>  }
>  
>  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
>  {
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(vaddr);
> +
>  	if (!vaddr)
>  		return;
>  
>  	if (obj->funcs->vunmap)
> -		obj->funcs->vunmap(obj, vaddr);
> +		obj->funcs->vunmap(obj, &map);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 2165633c9b9e..e87cd36518d3 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -519,6 +519,8 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>   * drm_gem_cma_prime_vmap - map a CMA GEM object into the kernel's virtual
>   *     address space
>   * @obj: GEM object
> + * @map: Returns the kernel virtual address of the CMA GEM object's backing
> + *       store.
>   *
>   * This function maps a buffer exported via DRM PRIME into the kernel's
>   * virtual address space. Since the CMA buffers are already mapped into the
> @@ -527,13 +529,15 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>   * driver's &drm_gem_object_funcs.vmap callback.
>   *
>   * Returns:
> - * The kernel virtual address of the CMA GEM object's backing store.
> + * 0 on success, or a negative error code otherwise.
>   */
> -void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj)
> +int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
>  
> -	return cma_obj->vaddr;
> +	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
>  
> @@ -541,14 +545,14 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
>   * drm_gem_cma_prime_vunmap - unmap a CMA GEM object from the kernel's virtual
>   *     address space
>   * @obj: GEM object
> - * @vaddr: kernel virtual address where the CMA GEM object was mapped
> + * @map: Kernel virtual address where the CMA GEM object was mapped
>   *
>   * This function removes a buffer exported via DRM PRIME from the kernel's
>   * virtual address space. This is a no-op because CMA buffers cannot be
>   * unmapped from kernel space. Drivers using the CMA helpers should set this
>   * as their &drm_gem_object_funcs.vunmap callback.
>   */
> -void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	/* Nothing to do */
>  }
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index fb11df7aced5..5553f58f68f3 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -258,19 +258,25 @@ void drm_gem_shmem_unpin(struct drm_gem_object *obj)
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_unpin);
>  
> -static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
> -	struct dma_buf_map map;
>  	int ret = 0;
>  
> -	if (shmem->vmap_use_count++ > 0)
> -		return shmem->vaddr;
> +	if (shmem->vmap_use_count++ > 0) {
> +		dma_buf_map_set_vaddr(map, shmem->vaddr);
> +		return 0;
> +	}
>  
>  	if (obj->import_attach) {
> -		ret = dma_buf_vmap(obj->import_attach->dmabuf, &map);
> -		if (!ret)
> -			shmem->vaddr = map.vaddr;
> +		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> +		if (!ret) {
> +			if (WARN_ON(map->is_iomem)) {
> +				ret = -EIO;
> +				goto err_put_pages;
> +			}
> +			shmem->vaddr = map->vaddr;
> +		}
>  	} else {
>  		pgprot_t prot = PAGE_KERNEL;
>  
> @@ -284,6 +290,8 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>  				    VM_MAP, prot);
>  		if (!shmem->vaddr)
>  			ret = -ENOMEM;
> +		else
> +			dma_buf_map_set_vaddr(map, shmem->vaddr);
>  	}
>  
>  	if (ret) {
> @@ -291,7 +299,7 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>  		goto err_put_pages;
>  	}
>  
> -	return shmem->vaddr;
> +	return 0;
>  
>  err_put_pages:
>  	if (!obj->import_attach)
> @@ -299,12 +307,14 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>  err_zero_use:
>  	shmem->vmap_use_count = 0;
>  
> -	return ERR_PTR(ret);
> +	return ret;
>  }
>  
>  /*
>   * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
>   * @shmem: shmem GEM object
> + * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
> + *       store.
>   *
>   * This function makes sure that a contiguous kernel virtual address mapping
>   * exists for the buffer backing the shmem GEM object.
> @@ -318,26 +328,25 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -void *drm_gem_shmem_vmap(struct drm_gem_object *obj)
> +int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> -	void *vaddr;
>  	int ret;
>  
>  	ret = mutex_lock_interruptible(&shmem->vmap_lock);
>  	if (ret)
> -		return ERR_PTR(ret);
> -	vaddr = drm_gem_shmem_vmap_locked(shmem);
> +		return ret;
> +	ret = drm_gem_shmem_vmap_locked(shmem, map);
>  	mutex_unlock(&shmem->vmap_lock);
>  
> -	return vaddr;
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_vmap);
>  
> -static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
> +static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
> +					struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
> -	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(shmem->vaddr);
>  
>  	if (WARN_ON_ONCE(!shmem->vmap_use_count))
>  		return;
> @@ -346,7 +355,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
>  		return;
>  
>  	if (obj->import_attach)
> -		dma_buf_vunmap(obj->import_attach->dmabuf, &map);
> +		dma_buf_vunmap(obj->import_attach->dmabuf, map);
>  	else
>  		vunmap(shmem->vaddr);
>  
> @@ -357,6 +366,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
>  /*
>   * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
>   * @shmem: shmem GEM object
> + * @map: Kernel virtual address where the SHMEM GEM object was mapped
>   *
>   * This function cleans up a kernel virtual address mapping acquired by
>   * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
> @@ -366,12 +376,12 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
>   * also be called by drivers directly, in which case it will hide the
>   * differences between dma-buf imported and natively allocated objects.
>   */
> -void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>  
>  	mutex_lock(&shmem->vmap_lock);
> -	drm_gem_shmem_vunmap_locked(shmem);
> +	drm_gem_shmem_vunmap_locked(shmem, map);
>  	mutex_unlock(&shmem->vmap_lock);
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_vunmap);
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 256b346664f2..6a5b932e0d06 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  
> +#include <linux/dma-buf-map.h>
>  #include <linux/module.h>
>  
>  #include <drm/drm_debugfs.h>
> @@ -382,11 +383,11 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
>  
> -static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
> +static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> +				    struct dma_buf_map *map)
>  {
>  	int ret;
>  	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> -	bool is_iomem;
>  
>  	if (gbo->kmap_use_count > 0)
>  		goto out;
> @@ -396,17 +397,30 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
>  
>  	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
>  
>  out:
> -	if (!kmap->virtual)
> -		return NULL; /* not mapped; don't increment ref */
> +	if (!kmap->virtual) {
> +		dma_buf_map_clear(map);
> +		return 0; /* not mapped; don't increment ref */
> +	}
>  	++gbo->kmap_use_count;
> -	return ttm_kmap_obj_virtual(kmap, &is_iomem);
> +	ttm_kmap_obj_to_dma_buf_map(kmap, map);
> +	return 0;
>  }
>  
> -static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
> +static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
> +				       struct dma_buf_map *map)
>  {
> +	struct drm_device *dev = gbo->bo.base.dev;
> +	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> +	struct dma_buf_map kmap_map;
> +
> +	ttm_kmap_obj_to_dma_buf_map(kmap, &kmap_map);
> +
> +	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&kmap_map, map)))
> +		return; /* BUG: map not mapped from this BO */
> +
>  	if (WARN_ON_ONCE(!gbo->kmap_use_count))
>  		return;
>  	if (--gbo->kmap_use_count > 0)
> @@ -423,7 +437,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
>  /**
>   * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
>   *                       space
> - * @gbo:	The GEM VRAM object to map
> + * @gbo: The GEM VRAM object to map
> + * @map: Returns the kernel virtual address of the VRAM GEM object's backing
> + *       store.
>   *
>   * The vmap function pins a GEM VRAM object to its current location, either
>   * system or video memory, and maps its buffer into kernel address space.
> @@ -432,48 +448,44 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
>   * unmap and unpin the GEM VRAM object.
>   *
>   * Returns:
> - * The buffer's virtual address on success, or
> - * an ERR_PTR()-encoded error code otherwise.
> + * 0 on success, or a negative error code otherwise.
>   */
> -void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
> +int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
>  {
>  	int ret;
> -	void *base;
>  
>  	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
>  
>  	ret = drm_gem_vram_pin_locked(gbo, 0);
>  	if (ret)
>  		goto err_ttm_bo_unreserve;
> -	base = drm_gem_vram_kmap_locked(gbo);
> -	if (IS_ERR(base)) {
> -		ret = PTR_ERR(base);
> +	ret = drm_gem_vram_kmap_locked(gbo, map);
> +	if (ret)
>  		goto err_drm_gem_vram_unpin_locked;
> -	}
>  
>  	ttm_bo_unreserve(&gbo->bo);
>  
> -	return base;
> +	return 0;
>  
>  err_drm_gem_vram_unpin_locked:
>  	drm_gem_vram_unpin_locked(gbo);
>  err_ttm_bo_unreserve:
>  	ttm_bo_unreserve(&gbo->bo);
> -	return ERR_PTR(ret);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_vmap);
>  
>  /**
>   * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
> - * @gbo:	The GEM VRAM object to unmap
> - * @vaddr:	The mapping's base address as returned by drm_gem_vram_vmap()
> + * @gbo: The GEM VRAM object to unmap
> + * @map: Kernel virtual address where the VRAM GEM object was mapped
>   *
>   * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
>   * the documentation for drm_gem_vram_vmap() for more information.
>   */
> -void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr)
> +void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
>  {
>  	int ret;
>  
> @@ -481,7 +493,7 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr)
>  	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
>  		return;
>  
> -	drm_gem_vram_kunmap_locked(gbo);
> +	drm_gem_vram_kunmap_locked(gbo, map);
>  	drm_gem_vram_unpin_locked(gbo);
>  
>  	ttm_bo_unreserve(&gbo->bo);
> @@ -829,37 +841,33 @@ static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
>  }
>  
>  /**
> - * drm_gem_vram_object_vmap() - \
> -	Implements &struct drm_gem_object_funcs.vmap
> - * @gem:	The GEM object to map
> + * drm_gem_vram_object_vmap() -
> + *	Implements &struct drm_gem_object_funcs.vmap
> + * @gem: The GEM object to map
> + * @map: Returns the kernel virtual address of the VRAM GEM object's backing
> + *       store.
>   *
>   * Returns:
> - * The buffers virtual address on success, or
> - * NULL otherwise.
> + * 0 on success, or a negative error code otherwise.
>   */
> -static void *drm_gem_vram_object_vmap(struct drm_gem_object *gem)
> +static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, struct dma_buf_map *map)
>  {
>  	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
> -	void *base;
>  
> -	base = drm_gem_vram_vmap(gbo);
> -	if (IS_ERR(base))
> -		return NULL;
> -	return base;
> +	return drm_gem_vram_vmap(gbo, map);
>  }
>  
>  /**
> - * drm_gem_vram_object_vunmap() - \
> -	Implements &struct drm_gem_object_funcs.vunmap
> - * @gem:	The GEM object to unmap
> - * @vaddr:	The mapping's base address
> + * drm_gem_vram_object_vunmap() -
> + *	Implements &struct drm_gem_object_funcs.vunmap
> + * @gem: The GEM object to unmap
> + * @map: Kernel virtual address where the VRAM GEM object was mapped
>   */
> -static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem,
> -				       void *vaddr)
> +static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_buf_map *map)
>  {
>  	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
>  
> -	drm_gem_vram_vunmap(gbo, vaddr);
> +	drm_gem_vram_vunmap(gbo, map);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 914f0867ff71..3d1eb8065fce 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -51,8 +51,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
> -void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
> -void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>  			   struct vm_area_struct *vma);
>  struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 135fbff6fecf..36c03e287e29 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -22,12 +22,17 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
>  }
>  
> -void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
> +int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	return etnaviv_gem_vmap(obj);
> +	void *vaddr = etnaviv_gem_vmap(obj);
> +	if (!vaddr)
> +		return -ENOMEM;
> +	dma_buf_map_set_vaddr(map, vaddr);
> +
> +	return 0;
>  }
>  
> -void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	/* TODO msm_gem_vunmap() */
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index e7a6eb96f692..2c74e06669fa 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -471,12 +471,12 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  	return &exynos_gem->base;
>  }
>  
> -void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
> +int exynos_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	return NULL;
> +	return -ENOMEM;
>  }
>  
> -void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	/* Nothing to do */
>  }

Might want to just start out with a patch to delete these. We don't keep
dummy functions around generally.

> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index 74e926abeff0..ecfd048fd91d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -107,8 +107,8 @@ struct drm_gem_object *
>  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  				     struct dma_buf_attachment *attach,
>  				     struct sg_table *sgt);
> -void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj);
> -void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int exynos_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>  			      struct vm_area_struct *vma);
>  
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 11223fe348df..832e5280a6ed 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -182,14 +182,14 @@ static int lima_gem_pin(struct drm_gem_object *obj)
>  	return drm_gem_shmem_pin(obj);
>  }
>  
> -static void *lima_gem_vmap(struct drm_gem_object *obj)
> +static int lima_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct lima_bo *bo = to_lima_bo(obj);
>  
>  	if (bo->heap_size)
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
> -	return drm_gem_shmem_vmap(obj);
> +	return drm_gem_shmem_vmap(obj, map);
>  }
>  
>  static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index dc6df9e9a40d..a070a85f8f36 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
>  
> +#include <linux/dma-buf-map.h>
>  #include <linux/kthread.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> @@ -303,6 +304,8 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
>  	struct lima_dump_chunk_buffer *buffer_chunk;
>  	u32 size, task_size, mem_size;
>  	int i;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	mutex_lock(&dev->error_task_list_lock);
>  
> @@ -388,15 +391,15 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
>  		} else {
>  			buffer_chunk->size = lima_bo_size(bo);
>  
> -			data = drm_gem_shmem_vmap(&bo->base.base);
> -			if (IS_ERR_OR_NULL(data)) {
> +			ret = drm_gem_shmem_vmap(&bo->base.base, &map);
> +			if (ret) {
>  				kvfree(et);
>  				goto out;
>  			}
>  
> -			memcpy(buffer_chunk + 1, data, buffer_chunk->size);
> +			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
>  
> -			drm_gem_shmem_vunmap(&bo->base.base, data);
> +			drm_gem_shmem_vunmap(&bo->base.base, &map);
>  		}
>  
>  		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 38672f9e5c4f..ae4c8cb33fae 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/delay.h>
> +#include <linux/dma-buf-map.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_state_helper.h>
> @@ -1556,15 +1557,16 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
>  		      struct drm_rect *clip)
>  {
>  	struct drm_device *dev = &mdev->base;
> -	void *vmap;
> +	struct dma_buf_map map;
> +	int ret;
>  
> -	vmap = drm_gem_shmem_vmap(fb->obj[0]);
> -	if (drm_WARN_ON(dev, !vmap))
> +	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	if (drm_WARN_ON(dev, ret))
>  		return; /* BUG: SHMEM BO should always be vmapped */
>  
> -	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> +	drm_fb_memcpy_dstclip(mdev->vram, map.vaddr, fb, clip);
>  
> -	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> +	drm_gem_shmem_vunmap(fb->obj[0], &map);
>  
>  	/* Always scanout image at VRAM offset 0 */
>  	mgag200_set_startadd(mdev, (u32)0);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
> index b35c180322e2..e780b6b1763d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
> @@ -37,7 +37,7 @@ extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
>  extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
>  extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
>  	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
> -extern void *nouveau_gem_prime_vmap(struct drm_gem_object *);
> -extern void nouveau_gem_prime_vunmap(struct drm_gem_object *, void *);
> +extern int nouveau_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +extern void nouveau_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index a8264aebf3d4..75e973a5675a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -35,7 +35,7 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages, npages);
>  }
>  
> -void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
> +int nouveau_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>  	int ret;
> @@ -43,12 +43,13 @@ void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
>  	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.num_pages,
>  			  &nvbo->dma_buf_vmap);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
> +	ttm_kmap_obj_to_dma_buf_map(&nvbo->dma_buf_vmap, map);
>  
> -	return nvbo->dma_buf_vmap.virtual;
> +	return 0;
>  }
>  
> -void nouveau_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void nouveau_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index fdbc8d949135..5ab03d605f57 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -5,6 +5,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/panfrost_drm.h>
>  #include <linux/completion.h>
> +#include <linux/dma-buf-map.h>
>  #include <linux/iopoll.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> @@ -72,6 +73,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  {
>  	struct panfrost_file_priv *user = file_priv->driver_priv;
>  	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
> +	struct dma_buf_map map;
>  	struct drm_gem_shmem_object *bo;
>  	u32 cfg, as;
>  	int ret;
> @@ -103,11 +105,10 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  		goto err_close_bo;
>  	}
>  
> -	perfcnt->buf = drm_gem_shmem_vmap(&bo->base);
> -	if (IS_ERR(perfcnt->buf)) {
> -		ret = PTR_ERR(perfcnt->buf);
> +	ret = drm_gem_shmem_vmap(&bo->base, &map);
> +	if (ret)
>  		goto err_put_mapping;
> -	}
> +	perfcnt->buf = map.vaddr;
>  
>  	/*
>  	 * Invalidate the cache and clear the counters to start from a fresh
> @@ -163,7 +164,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  	return 0;
>  
>  err_vunmap:
> -	drm_gem_shmem_vunmap(&bo->base, perfcnt->buf);
> +	drm_gem_shmem_vunmap(&bo->base, &map);
>  err_put_mapping:
>  	panfrost_gem_mapping_put(perfcnt->mapping);
>  err_close_bo:
> @@ -180,6 +181,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
>  {
>  	struct panfrost_file_priv *user = file_priv->driver_priv;
>  	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(perfcnt->buf);
>  
>  	if (user != perfcnt->user)
>  		return -EINVAL;
> @@ -192,7 +194,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
>  		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
>  
>  	perfcnt->user = NULL;
> -	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, perfcnt->buf);
> +	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, &map);
>  	perfcnt->buf = NULL;
>  	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
>  	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 6063f3a15329..ed0d22fa0161 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -25,6 +25,7 @@
>  
>  #include <linux/crc32.h>
>  #include <linux/delay.h>
> +#include <linux/dma-buf-map.h>
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_atomic.h>
> @@ -581,7 +582,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
>  	struct drm_gem_object *obj;
>  	struct qxl_bo *cursor_bo = NULL, *user_bo = NULL, *old_cursor_bo = NULL;
>  	int ret;
> -	void *user_ptr;
> +	struct dma_buf_map user_map;
> +	struct dma_buf_map cursor_map;
>  	int size = 64*64*4;
>  
>  	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
> @@ -595,7 +597,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
>  		user_bo = gem_to_qxl_bo(obj);
>  
>  		/* pinning is done in the prepare/cleanup framevbuffer */
> -		ret = qxl_bo_kmap(user_bo, &user_ptr);
> +		ret = qxl_bo_kmap(user_bo, &user_map);
>  		if (ret)
>  			goto out_free_release;
>  
> @@ -613,7 +615,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
>  		if (ret)
>  			goto out_unpin;
>  
> -		ret = qxl_bo_kmap(cursor_bo, (void **)&cursor);
> +		ret = qxl_bo_kmap(cursor_bo, &cursor_map);
>  		if (ret)
>  			goto out_backoff;
>  
> @@ -627,7 +629,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
>  		cursor->chunk.next_chunk = 0;
>  		cursor->chunk.prev_chunk = 0;
>  		cursor->chunk.data_size = size;
> -		memcpy(cursor->chunk.data, user_ptr, size);
> +		memcpy(cursor->chunk.data, user_map.vaddr, size);
>  		qxl_bo_kunmap(cursor_bo);
>  		qxl_bo_kunmap(user_bo);
>  
> @@ -1138,6 +1140,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
>  {
>  	int ret;
>  	struct drm_gem_object *gobj;
> +	struct dma_buf_map map;
>  	int monitors_config_size = sizeof(struct qxl_monitors_config) +
>  		qxl_num_crtc * sizeof(struct qxl_head);
>  
> @@ -1154,7 +1157,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
>  	if (ret)
>  		return ret;
>  
> -	qxl_bo_kmap(qdev->monitors_config_bo, NULL);
> +	qxl_bo_kmap(qdev->monitors_config_bo, &map);
>  
>  	qdev->monitors_config = qdev->monitors_config_bo->kptr;
>  	qdev->ram_header->monitors_config =
> diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
> index 3599db096973..1bf4f465ecf4 100644
> --- a/drivers/gpu/drm/qxl/qxl_draw.c
> +++ b/drivers/gpu/drm/qxl/qxl_draw.c
> @@ -20,6 +20,8 @@
>   * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/dma-buf-map.h>
> +
>  #include <drm/drm_fourcc.h>
>  
>  #include "qxl_drv.h"
> @@ -42,13 +44,15 @@ static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
>  					      unsigned int num_clips,
>  					      struct qxl_bo *clips_bo)
>  {
> +	struct dma_buf_map map;
>  	struct qxl_clip_rects *dev_clips;
>  	int ret;
>  
> -	ret = qxl_bo_kmap(clips_bo, (void **)&dev_clips);
> -	if (ret) {
> +	ret = qxl_bo_kmap(clips_bo, &map);
> +	if (ret)
>  		return NULL;
> -	}
> +
> +	dev_clips = map.vaddr;
>  	dev_clips->num_rects = num_clips;
>  	dev_clips->chunk.next_chunk = 0;
>  	dev_clips->chunk.prev_chunk = 0;
> @@ -142,7 +146,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>  	int stride = fb->pitches[0];
>  	/* depth is not actually interesting, we don't mask with it */
>  	int depth = fb->format->cpp[0] * 8;
> -	uint8_t *surface_base;
> +	struct dma_buf_map surface_map;
>  	struct qxl_release *release;
>  	struct qxl_bo *clips_bo;
>  	struct qxl_drm_image *dimage;
> @@ -197,11 +201,11 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>  	if (ret)
>  		goto out_release_backoff;
>  
> -	ret = qxl_bo_kmap(bo, (void **)&surface_base);
> +	ret = qxl_bo_kmap(bo, &surface_map);
>  	if (ret)
>  		goto out_release_backoff;
>  
> -	ret = qxl_image_init(qdev, release, dimage, surface_base,
> +	ret = qxl_image_init(qdev, release, dimage, surface_map.vaddr,
>  			     left - dumb_shadow_offset,
>  			     top, width, height, depth, stride);
>  	qxl_bo_kunmap(bo);
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> index 3602e8b34189..a9e9da4f4605 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -50,6 +50,8 @@
>  
>  #include "qxl_dev.h"
>  
> +struct dma_buf_map;
> +
>  #define DRIVER_AUTHOR		"Dave Airlie"
>  
>  #define DRIVER_NAME		"qxl"
> @@ -335,7 +337,6 @@ int qxl_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv);
>  void qxl_gem_object_close(struct drm_gem_object *obj,
>  			  struct drm_file *file_priv);
>  void qxl_bo_force_delete(struct qxl_device *qdev);
> -int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
>  
>  /* qxl_dumb.c */
>  int qxl_mode_dumb_create(struct drm_file *file_priv,
> @@ -445,8 +446,9 @@ struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  struct drm_gem_object *qxl_gem_prime_import_sg_table(
>  	struct drm_device *dev, struct dma_buf_attachment *attach,
>  	struct sg_table *sgt);
> -void *qxl_gem_prime_vmap(struct drm_gem_object *obj);
> -void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
> +			  struct dma_buf_map *map);
>  int qxl_gem_prime_mmap(struct drm_gem_object *obj,
>  				struct vm_area_struct *vma);
>  
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index d3635e3e3267..2d8ae3b10b1c 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -23,10 +23,12 @@
>   *          Alon Levy
>   */
>  
> +#include <linux/dma-buf-map.h>
> +#include <linux/io-mapping.h>
> +
>  #include "qxl_drv.h"
>  #include "qxl_object.h"
>  
> -#include <linux/io-mapping.h>
>  static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
>  {
>  	struct qxl_bo *bo;
> @@ -150,24 +152,22 @@ int qxl_bo_create(struct qxl_device *qdev,
>  	return 0;
>  }
>  
> -int qxl_bo_kmap(struct qxl_bo *bo, void **ptr)
> +int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map)
>  {
> -	bool is_iomem;
>  	int r;
>  
>  	if (bo->kptr) {
> -		if (ptr)
> -			*ptr = bo->kptr;
>  		bo->map_count++;
> -		return 0;
> +		goto out;
>  	}
>  	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
>  	if (r)
>  		return r;
> -	bo->kptr = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
> -	if (ptr)
> -		*ptr = bo->kptr;
>  	bo->map_count = 1;
> +	bo->kptr = bo->kmap.virtual;
> +
> +out:
> +	ttm_kmap_obj_to_dma_buf_map(&bo->kmap, map);
>  	return 0;
>  }
>  
> @@ -178,6 +178,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
>  	void *rptr;
>  	int ret;
>  	struct io_mapping *map;
> +	struct dma_buf_map bo_map;
>  
>  	if (bo->tbo.mem.mem_type == TTM_PL_VRAM)
>  		map = qdev->vram_mapping;
> @@ -194,11 +195,11 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,

Uh, this fallback is wild. Not exactly sure this is a good idea or
anything, but also it's here already :-)

>  		return rptr;
>  	}
>  
> -	ret = qxl_bo_kmap(bo, &rptr);
> +	ret = qxl_bo_kmap(bo, &bo_map);
>  	if (ret)
>  		return NULL;
>  
> -	rptr += page_offset * PAGE_SIZE;
> +	rptr = bo_map.vaddr + page_offset * PAGE_SIZE;
>  	return rptr;
>  }
>  
> diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
> index 09a5c818324d..ebf24c9d2bf2 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.h
> +++ b/drivers/gpu/drm/qxl/qxl_object.h
> @@ -63,7 +63,7 @@ extern int qxl_bo_create(struct qxl_device *qdev,
>  			 bool kernel, bool pinned, u32 domain,
>  			 struct qxl_surface *surf,
>  			 struct qxl_bo **bo_ptr);
> -extern int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
> +extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
>  extern void qxl_bo_kunmap(struct qxl_bo *bo);
>  void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
>  void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
> index 7d3816fca5a8..4aa949799446 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -54,20 +54,20 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
>  	return ERR_PTR(-ENOSYS);
>  }
>  
> -void *qxl_gem_prime_vmap(struct drm_gem_object *obj)
> +int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct qxl_bo *bo = gem_to_qxl_bo(obj);
> -	void *ptr;
>  	int ret;
>  
> -	ret = qxl_bo_kmap(bo, &ptr);
> +	ret = qxl_bo_kmap(bo, map);
>  	if (ret < 0)
> -		return ERR_PTR(ret);
> +		return ret;
>  
> -	return ptr;
> +	return 0;
>  }
>  
> -void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
> +			  struct dma_buf_map *map)
>  {
>  	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 0ccd7213e41f..ac51517bdfcd 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -40,8 +40,8 @@ struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
>  struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  int radeon_gem_prime_pin(struct drm_gem_object *obj);
>  void radeon_gem_prime_unpin(struct drm_gem_object *obj);
> -void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
> -void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int radeon_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void radeon_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  static const struct drm_gem_object_funcs radeon_gem_object_funcs;
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index b9de0e51c0be..a1a358de5448 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -39,7 +39,7 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages, npages);
>  }
>  
> -void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
> +int radeon_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct radeon_bo *bo = gem_to_radeon_bo(obj);
>  	int ret;
> @@ -47,12 +47,13 @@ void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
>  	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages,
>  			  &bo->dma_buf_vmap);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
> +	ttm_kmap_obj_to_dma_buf_map(&bo->dma_buf_vmap, map);
>  
> -	return bo->dma_buf_vmap.virtual;
> +	return 0;
>  }
>  
> -void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void radeon_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct radeon_bo *bo = gem_to_radeon_bo(obj);
>  
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 7d5ebb10323b..7971f57436dd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -532,26 +532,32 @@ rockchip_gem_prime_import_sg_table(struct drm_device *drm,
>  	return ERR_PTR(ret);
>  }
>  
> -void *rockchip_gem_prime_vmap(struct drm_gem_object *obj)
> +int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
>  
> -	if (rk_obj->pages)
> -		return vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
> -			    pgprot_writecombine(PAGE_KERNEL));
> +	if (rk_obj->pages) {
> +		void *vaddr = vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
> +				  pgprot_writecombine(PAGE_KERNEL));
> +		if (!vaddr)
> +			return -ENOMEM;
> +		dma_buf_map_set_vaddr(map, vaddr);
> +		return 0;
> +	}
>  
>  	if (rk_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> -		return NULL;
> +		return -ENOMEM;
> +	dma_buf_map_set_vaddr(map, rk_obj->kvaddr);
>  
> -	return rk_obj->kvaddr;
> +	return 0;
>  }
>  
> -void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
>  
>  	if (rk_obj->pages) {
> -		vunmap(vaddr);
> +		vunmap(map->vaddr);
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> index 7ffc541bea07..5a70a56cd406 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> @@ -31,8 +31,8 @@ struct drm_gem_object *
>  rockchip_gem_prime_import_sg_table(struct drm_device *dev,
>  				   struct dma_buf_attachment *attach,
>  				   struct sg_table *sg);
> -void *rockchip_gem_prime_vmap(struct drm_gem_object *obj);
> -void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  /* drm driver mmap file operations */
>  int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 744a8e337e41..6dc013f4b236 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -17,6 +17,7 @@
>   */
>  
>  #include <linux/console.h>
> +#include <linux/dma-buf-map.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  
> @@ -314,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  			       struct drm_rect *rect)
>  {
>  	struct cirrus_device *cirrus = to_cirrus(fb->dev);
> +	struct dma_buf_map map;
>  	void *vmap;
>  	int idx, ret;
>  
> @@ -321,10 +323,10 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	if (!drm_dev_enter(&cirrus->dev, &idx))
>  		goto out;
>  
> -	ret = -ENOMEM;
> -	vmap = drm_gem_shmem_vmap(fb->obj[0]);
> -	if (!vmap)
> +	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	if (ret)
>  		goto out_dev_exit;
> +	vmap = map.vaddr;
>  
>  	if (cirrus->cpp == fb->format->cpp[0])
>  		drm_fb_memcpy_dstclip(cirrus->vram,
> @@ -343,7 +345,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	else
>  		WARN_ON_ONCE("cpp mismatch");
>  
> -	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> +	drm_gem_shmem_vunmap(fb->obj[0], &map);
>  	ret = 0;
>  
>  out_dev_exit:
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index cc397671f689..5865027a1667 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -248,6 +248,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  {
>  	int block, dst_offset, len, remain, ret, x1, x2, y1, y2;
>  	struct drm_framebuffer *fb;
> +	struct dma_buf_map map;
>  	void *vaddr;
>  	u8 *src;
>  
> @@ -262,11 +263,12 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  	y1 = gm12u320->fb_update.rect.y1;
>  	y2 = gm12u320->fb_update.rect.y2;
>  
> -	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
> -	if (IS_ERR(vaddr)) {
> -		GM12U320_ERR("failed to vmap fb: %ld\n", PTR_ERR(vaddr));
> +	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	if (ret) {
> +		GM12U320_ERR("failed to vmap fb: %d\n", ret);
>  		goto put_fb;
>  	}
> +	vaddr = map.vaddr;
>  
>  	if (fb->obj[0]->import_attach) {
>  		ret = dma_buf_begin_cpu_access(
> @@ -318,7 +320,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
>  	}
>  vunmap:
> -	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
> +	drm_gem_shmem_vunmap(fb->obj[0], &map);
>  put_fb:
>  	drm_framebuffer_put(fb);
>  	gm12u320->fb_update.fb = NULL;
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index fef43f4e3bac..9c8ace1aa647 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -276,6 +276,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
>  	struct urb *urb;
>  	struct drm_rect clip;
>  	int log_bpp;
> +	struct dma_buf_map map;
>  	void *vaddr;
>  
>  	ret = udl_log_cpp(fb->format->cpp[0]);
> @@ -296,11 +297,12 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
>  			return ret;
>  	}
>  
> -	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
> -	if (IS_ERR(vaddr)) {
> +	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	if (ret) {
>  		DRM_ERROR("failed to vmap fb\n");
>  		goto out_dma_buf_end_cpu_access;
>  	}
> +	vaddr = map.vaddr;
>  
>  	urb = udl_get_urb(dev);
>  	if (!urb)
> @@ -333,7 +335,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
>  	ret = 0;
>  
>  out_drm_gem_shmem_vunmap:
> -	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
> +	drm_gem_shmem_vunmap(fb->obj[0], &map);
>  out_dma_buf_end_cpu_access:
>  	if (import_attach) {
>  		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 4fcc0a542b8a..6040b9ec747f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -9,6 +9,8 @@
>   *          Michael Thayer <michael.thayer@oracle.com,
>   *          Hans de Goede <hdegoede@redhat.com>
>   */
> +
> +#include <linux/dma-buf-map.h>
>  #include <linux/export.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -384,6 +386,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  	u32 height = plane->state->crtc_h;
>  	size_t data_size, mask_size;
>  	u32 flags;
> +	struct dma_buf_map map;
> +	int ret;
>  	u8 *src;
>  
>  	/*
> @@ -397,8 +401,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  
>  	vbox_crtc->cursor_enabled = true;
>  
> -	src = drm_gem_vram_vmap(gbo);
> -	if (IS_ERR(src)) {
> +	ret = drm_gem_vram_vmap(gbo, &map);
> +	if (ret) {
>  		/*
>  		 * BUG: we should have pinned the BO in prepare_fb().
>  		 */
> @@ -406,6 +410,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  		DRM_WARN("Could not map cursor bo, skipping update\n");
>  		return;
>  	}

I don't think digging around in the pointer is a good idea, imo this
should get a 

	/* FIXME: Use mapping abstraction properly */

or similar.

> +	src = map.vaddr;
>  
>  	/*
>  	 * The mask must be calculated based on the alpha
> @@ -416,7 +421,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  	data_size = width * height * 4 + mask_size;
>  
>  	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> -	drm_gem_vram_vunmap(gbo, src);
> +	drm_gem_vram_vunmap(gbo, &map);
>  
>  	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>  		VBOX_MOUSE_POINTER_ALPHA;
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index f432278173cd..250266fb437e 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -786,16 +786,16 @@ int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  	return drm_gem_cma_prime_mmap(obj, vma);
>  }
>  
> -void *vc4_prime_vmap(struct drm_gem_object *obj)
> +int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct vc4_bo *bo = to_vc4_bo(obj);
>  
>  	if (bo->validated_shader) {
>  		DRM_DEBUG("mmaping of shader BOs not allowed.\n");
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	}
>  
> -	return drm_gem_cma_prime_vmap(obj);
> +	return drm_gem_cma_prime_vmap(obj, map);
>  }
>  
>  struct drm_gem_object *
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index a22478a35199..6af453c84777 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -804,7 +804,7 @@ int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
>  						 struct dma_buf_attachment *attach,
>  						 struct sg_table *sgt);
> -void *vc4_prime_vmap(struct drm_gem_object *obj);
> +int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  int vc4_bo_cache_init(struct drm_device *dev);
>  void vc4_bo_cache_destroy(struct drm_device *dev);
>  int vc4_bo_inc_usecnt(struct vc4_bo *bo);
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index fa54a6d1403d..b2aa26e1e4a2 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -361,24 +361,30 @@ static struct drm_gem_object *vgem_prime_import_sg_table(struct drm_device *dev,
>  	return &obj->base;
>  }
>  
> -static void *vgem_prime_vmap(struct drm_gem_object *obj)
> +static int vgem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>  	long n_pages = obj->size >> PAGE_SHIFT;
>  	struct page **pages;
> +	void *vaddr;
>  
>  	pages = vgem_pin_pages(bo);
>  	if (IS_ERR(pages))
> -		return NULL;
> +		return PTR_ERR(pages);
> +
> +	vaddr = vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
> +	if (!vaddr)
> +		return -ENOMEM;
> +	dma_buf_map_set_vaddr(map, vaddr);
>  
> -	return vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
> +	return 0;
>  }
>  
> -static void vgem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
>  	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>  
> -	vunmap(vaddr);
> +	vunmap(map->vaddr);
>  	vgem_unpin_pages(bo);
>  }
>  
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index 4f34ef34ba60..74db5a840bed 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -290,22 +290,28 @@ int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return gem_mmap_obj(xen_obj, vma);
>  }
>  
> -void *xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj)
> +int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, struct dma_buf_map *map)
>  {
>  	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
> +	void *vaddr;
>  
>  	if (!xen_obj->pages)
> -		return NULL;
> +		return -ENOMEM;
>  
>  	/* Please see comment in gem_mmap_obj on mapping and attributes. */
> -	return vmap(xen_obj->pages, xen_obj->num_pages,
> -		    VM_MAP, PAGE_KERNEL);
> +	vaddr = vmap(xen_obj->pages, xen_obj->num_pages,
> +		     VM_MAP, PAGE_KERNEL);
> +	if (!vaddr)
> +		return -ENOMEM;
> +	dma_buf_map_set_vaddr(map, vaddr);
> +
> +	return 0;
>  }
>  
>  void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
> -				    void *vaddr)
> +				    struct dma_buf_map *map)
>  {
> -	vunmap(vaddr);
> +	vunmap(map->vaddr);
>  }
>  
>  int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h b/drivers/gpu/drm/xen/xen_drm_front_gem.h
> index a39675fa31b2..a4e67d0a149c 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
> @@ -12,6 +12,7 @@
>  #define __XEN_DRM_FRONT_GEM_H
>  
>  struct dma_buf_attachment;
> +struct dma_buf_map;
>  struct drm_device;
>  struct drm_gem_object;
>  struct file;
> @@ -34,10 +35,11 @@ void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj);
>  
>  int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  
> -void *xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj);
> +int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
> +				 struct dma_buf_map *map);
>  
>  void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
> -				    void *vaddr);
> +				    struct dma_buf_map *map);
>  
>  int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
>  				 struct vm_area_struct *vma);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index c38dd35da00b..5e6daa1c982f 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -39,6 +39,7 @@
>  
>  #include <drm/drm_vma_manager.h>
>  
> +struct dma_buf_map;
>  struct drm_gem_object;
>  
>  /**
> @@ -138,7 +139,7 @@ struct drm_gem_object_funcs {
>  	 *
>  	 * This callback is optional.
>  	 */
> -	void *(*vmap)(struct drm_gem_object *obj);
> +	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  	/**
>  	 * @vunmap:
> @@ -148,7 +149,7 @@ struct drm_gem_object_funcs {
>  	 *
>  	 * This callback is optional.
>  	 */
> -	void (*vunmap)(struct drm_gem_object *obj, void *vaddr);
> +	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  	/**
>  	 * @mmap:
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index 2bfa2502607a..34a7f72879c5 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -103,8 +103,8 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>  				  struct sg_table *sgt);
>  int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>  			   struct vm_area_struct *vma);
> -void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
> -void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  struct drm_gem_object *
>  drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 5381f0c8cf6f..3449a0353fe0 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -113,8 +113,8 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
>  int drm_gem_shmem_pin(struct drm_gem_object *obj);
>  void drm_gem_shmem_unpin(struct drm_gem_object *obj);
> -void *drm_gem_shmem_vmap(struct drm_gem_object *obj);
> -void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
>  
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 128f88174d32..0c43b8f17ee9 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -97,8 +97,8 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>  int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
> -void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
> -void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
> +int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
> +void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  
>  int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  				  struct drm_device *dev,
> -- 
> 2.28.0

Bit a big patch, I can't think of a way to split it up either.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
