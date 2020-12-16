Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0AB2DC30D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C8689354;
	Wed, 16 Dec 2020 15:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B97B89354
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:26:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a6so2734023wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=miKgNk2Q2uB4xkPGlQZwjP7wHoUDtkL1piJ2yk2SRP0=;
 b=d44147if+45pg26fpYaZBpjUvM+MPgg/L2i6mJGujrp6y+eohTpdvbsVBET6MDjXjr
 QMw1viCKzZph2Och658sPrrl0hzgEWWRNDd/sV2j4MNlH0M3tuOSFlHE7YMa15srxzpZ
 vVncI1+IcRPmE81fJgJQ56r8ng8CuwfhCXiNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=miKgNk2Q2uB4xkPGlQZwjP7wHoUDtkL1piJ2yk2SRP0=;
 b=mvh0883A3OBce1dKU/CzqCw85/paYhYbInn3kwF6+dDIi7+ALA1hkkBuYnb0eRN44b
 VpFNb/KqSbGcQZMQir+msf23bMQKdw0oIBA86rk30pfa5oUZyUfSPZNzwrgF/j4kIgVQ
 y+c/c+GASlkgJDhRVwb9c1vZiQKjHjaQeVvd9NVBRzD8iwBhD2HeuXGrxy8NePQDT1Ef
 tewkou3i8Mr9tkANClJL2w7OSPMA7K+kssfBkwI26ECtAoI/DKAhz1Abtict2vmMMelx
 veucEEd4bjkGuTF0V0zenQZpRXQRKIp7Vg72A8x2INXAyjK1EKqPfNvapl475QKsMfsq
 vjFA==
X-Gm-Message-State: AOAM53317s5XckOLgxI8Mh8H7D98Ov0MkRZ6nmUuxJ5wuoSZL8J+nBsx
 FjhRPVO6gKEI6T3N/yr00/mfkA==
X-Google-Smtp-Source: ABdhPJzpkHTFJXOqhtTK8cAnGniuXC1aYaIS1LTc0Wa44IXb9ar3hmg2QnxquUZBdqALJtgZ6dw4MQ==
X-Received: by 2002:a1c:25c2:: with SMTP id l185mr3891483wml.113.1608132392632; 
 Wed, 16 Dec 2020 07:26:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s6sm3611140wro.79.2020.12.16.07.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:26:29 -0800 (PST)
Date: Wed, 16 Dec 2020 16:26:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: move memory accounting into vmwgfx
Message-ID: <X9onJP4eeEHlH/Po@phenom.ffwll.local>
References: <20201216140427.1253-1-christian.koenig@amd.com>
 <20201216140427.1253-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216140427.1253-2-christian.koenig@amd.com>
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
Cc: airlied@linux.ie, sroland@vmware.com, dri-devel@lists.freedesktop.org,
 ray.huang@amd.com, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 03:04:27PM +0100, Christian K=F6nig wrote:
> This is just another feature which is only used by VMWGFX, so move
> it into the driver instead.
> =

> I've tried to add the accounting sysfs file to the kobject of the drm
> minor, but I'm not 100% sure if this works as expected.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

tbh, delete it all?

From looking at callers in ttm, all this does is explicitly call your own
shrinker instead of through kmalloc. If we need this (and i915 history
somewhat suggests it might be needed, but that was with the global
dev->struct_mutex lock) then we should have this in the main ttm
allocation paths. Or more properly, in the core mm paths.

But reinventing half of the shrinker infra in a subsystem, much less in a
single driver doesn't sound like a good idea.

That means the sysfs interface goes belly up for everyone, but the real
solution for gpu memory limiting is cgroups, not something in drm hidden
away. Since you're deleting that from all other drivers I think we're
already working under the assumption that no one is using that little bit
of uapi anyway. If not, then this won't work anyway.
-Daniel

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  8 +--
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  6 +--
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |  7 +--
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |  1 -
>  drivers/gpu/drm/qxl/qxl_object.c              |  4 +-
>  drivers/gpu/drm/radeon/radeon_object.c        |  8 +--
>  drivers/gpu/drm/ttm/Makefile                  |  6 +--
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 52 ++++++-------------
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  1 -
>  drivers/gpu/drm/ttm/ttm_pool.c                | 13 +----
>  drivers/gpu/drm/vmwgfx/Makefile               |  2 +-
>  drivers/gpu/drm/{ttm =3D> vmwgfx}/ttm_memory.c  | 19 +++----
>  .../gpu/drm/vmwgfx}/ttm_memory.h              |  5 +-
>  drivers/gpu/drm/vmwgfx/ttm_object.h           |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 22 ++++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  5 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 28 +++++++++-
>  include/drm/ttm/ttm_bo_api.h                  | 13 +----
>  include/drm/ttm/ttm_bo_driver.h               |  1 -
>  include/drm/ttm/ttm_tt.h                      |  1 +
>  21 files changed, 107 insertions(+), 114 deletions(-)
>  rename drivers/gpu/drm/{ttm =3D> vmwgfx}/ttm_memory.c (97%)
>  rename {include/drm/ttm =3D> drivers/gpu/drm/vmwgfx}/ttm_memory.h (97%)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index a9647e7f98a8..5ed1c88b8748 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -118,6 +118,16 @@ void amdgpu_amdkfd_gpuvm_init_mem_limits(void)
>   */
>  #define ESTIMATE_PT_SIZE(mem_size) ((mem_size) >> 14)
>  =

> +static size_t amdgpu_amdkfd_acc_size(uint64_t size)
> +{
> +	size >>=3D PAGE_SHIFT;
> +	size *=3D sizeof(dma_addr_t) + sizeof(void *);
> +
> +	return __roundup_pow_of_two(sizeof(struct amdgpu_bo)) +
> +		__rountup_pow_of_two(sizeof(struct ttm_tt)) +
> +		PAGE_ALIGN(size);
> +}
> +
>  static int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
>  		uint64_t size, u32 domain, bool sg)
>  {
> @@ -126,8 +136,7 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amd=
gpu_device *adev,
>  	size_t acc_size, system_mem_needed, ttm_mem_needed, vram_needed;
>  	int ret =3D 0;
>  =

> -	acc_size =3D ttm_bo_dma_acc_size(&adev->mman.bdev, size,
> -				       sizeof(struct amdgpu_bo));
> +	acc_size =3D amdgpu_amdkfd_acc_size(size);
>  =

>  	vram_needed =3D 0;
>  	if (domain =3D=3D AMDGPU_GEM_DOMAIN_GTT) {
> @@ -174,8 +183,7 @@ static void unreserve_mem_limit(struct amdgpu_device =
*adev,
>  {
>  	size_t acc_size;
>  =

> -	acc_size =3D ttm_bo_dma_acc_size(&adev->mman.bdev, size,
> -				       sizeof(struct amdgpu_bo));
> +	acc_size =3D amdgpu_amdkfd_acc_size(size);
>  =

>  	spin_lock(&kfd_mem_limit.mem_limit_lock);
>  	if (domain =3D=3D AMDGPU_GEM_DOMAIN_GTT) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 6cc9919b12cc..599c9a132eb6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -523,7 +523,6 @@ static int amdgpu_bo_do_create(struct amdgpu_device *=
adev,
>  	};
>  	struct amdgpu_bo *bo;
>  	unsigned long page_align, size =3D bp->size;
> -	size_t acc_size;
>  	int r;
>  =

>  	/* Note that GDS/GWS/OA allocates 1 page per byte/resource. */
> @@ -546,9 +545,6 @@ static int amdgpu_bo_do_create(struct amdgpu_device *=
adev,
>  =

>  	*bo_ptr =3D NULL;
>  =

> -	acc_size =3D ttm_bo_dma_acc_size(&adev->mman.bdev, size,
> -				       sizeof(struct amdgpu_bo));
> -
>  	bo =3D kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
>  	if (bo =3D=3D NULL)
>  		return -ENOMEM;
> @@ -577,8 +573,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device *=
adev,
>  		bo->tbo.priority =3D 1;
>  =

>  	r =3D ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, size, bp->type,
> -				 &bo->placement, page_align, &ctx, acc_size,
> -				 NULL, bp->resv, &amdgpu_bo_destroy);
> +				 &bo->placement, page_align, &ctx,  NULL,
> +				 bp->resv, &amdgpu_bo_destroy);
>  	if (unlikely(r !=3D 0))
>  		return r;
>  =

> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index 02ca22e90290..5cf7797048e1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -189,7 +189,6 @@ struct drm_gem_vram_object *drm_gem_vram_create(struc=
t drm_device *dev,
>  	struct drm_vram_mm *vmm =3D dev->vram_mm;
>  	struct ttm_bo_device *bdev;
>  	int ret;
> -	size_t acc_size;
>  =

>  	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
>  		return ERR_PTR(-EINVAL);
> @@ -216,7 +215,6 @@ struct drm_gem_vram_object *drm_gem_vram_create(struc=
t drm_device *dev,
>  	}
>  =

>  	bdev =3D &vmm->bdev;
> -	acc_size =3D ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
>  =

>  	gbo->bo.bdev =3D bdev;
>  	drm_gem_vram_placement(gbo, DRM_GEM_VRAM_PL_FLAG_SYSTEM);
> @@ -226,8 +224,8 @@ struct drm_gem_vram_object *drm_gem_vram_create(struc=
t drm_device *dev,
>  	 * to release gbo->bo.base and kfree gbo.
>  	 */
>  	ret =3D ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
> -			  &gbo->placement, pg_align, false, acc_size,
> -			  NULL, NULL, ttm_buffer_object_destroy);
> +			  &gbo->placement, pg_align, false, NULL, NULL,
> +			  ttm_buffer_object_destroy);
>  	if (ret)
>  		return ERR_PTR(ret);
>  =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 02d86f8311a9..64cb1ed0f6ea 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -300,18 +300,15 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, =
int align, u32 domain,
>  		struct sg_table *sg, struct dma_resv *robj)
>  {
>  	int type =3D sg ? ttm_bo_type_sg : ttm_bo_type_device;
> -	size_t acc_size;
>  	int ret;
>  =

> -	acc_size =3D ttm_bo_dma_acc_size(nvbo->bo.bdev, size, sizeof(*nvbo));
> -
>  	nvbo->bo.mem.num_pages =3D size >> PAGE_SHIFT;
>  	nouveau_bo_placement_set(nvbo, domain, 0);
>  	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
>  =

>  	ret =3D ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
> -			  &nvbo->placement, align >> PAGE_SHIFT, false,
> -			  acc_size, sg, robj, nouveau_bo_del_ttm);
> +			  &nvbo->placement, align >> PAGE_SHIFT, false, sg,
> +			  robj, nouveau_bo_del_ttm);
>  	if (ret) {
>  		/* ttm will call nouveau_bo_del_ttm if it fails.. */
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index c802d3d1ba39..700fa0979d14 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -54,7 +54,6 @@
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> -#include <drm/ttm/ttm_memory.h>
>  =

>  #include <drm/drm_audio_component.h>
>  =

> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_o=
bject.c
> index ceebc5881f68..705b51535492 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -138,8 +138,8 @@ int qxl_bo_create(struct qxl_device *qdev,
>  	qxl_ttm_placement_from_domain(bo, domain);
>  =

>  	r =3D ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
> -				 &bo->placement, 0, &ctx, size,
> -				 NULL, NULL, &qxl_ttm_bo_destroy);
> +				 &bo->placement, 0, &ctx, NULL, NULL,
> +				 &qxl_ttm_bo_destroy);
>  	if (unlikely(r !=3D 0)) {
>  		if (r !=3D -ERESTARTSYS)
>  			dev_err(qdev->ddev.dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/rad=
eon/radeon_object.c
> index 9b81786782de..5cd44f2a77cd 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -159,7 +159,6 @@ int radeon_bo_create(struct radeon_device *rdev,
>  	struct radeon_bo *bo;
>  	enum ttm_bo_type type;
>  	unsigned long page_align =3D roundup(byte_align, PAGE_SIZE) >> PAGE_SHI=
FT;
> -	size_t acc_size;
>  	int r;
>  =

>  	size =3D ALIGN(size, PAGE_SIZE);
> @@ -173,9 +172,6 @@ int radeon_bo_create(struct radeon_device *rdev,
>  	}
>  	*bo_ptr =3D NULL;
>  =

> -	acc_size =3D ttm_bo_dma_acc_size(&rdev->mman.bdev, size,
> -				       sizeof(struct radeon_bo));
> -
>  	bo =3D kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
>  	if (bo =3D=3D NULL)
>  		return -ENOMEM;
> @@ -230,8 +226,8 @@ int radeon_bo_create(struct radeon_device *rdev,
>  	/* Kernel allocation are uninterruptible */
>  	down_read(&rdev->pm.mclk_lock);
>  	r =3D ttm_bo_init(&rdev->mman.bdev, &bo->tbo, size, type,
> -			&bo->placement, page_align, !kernel, acc_size,
> -			sg, resv, &radeon_ttm_bo_destroy);
> +			&bo->placement, page_align, !kernel, sg, resv,
> +			&radeon_ttm_bo_destroy);
>  	up_read(&rdev->pm.mclk_lock);
>  	if (unlikely(r !=3D 0)) {
>  		return r;
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index b6f5f87b270f..7e8dc85caac3 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -2,10 +2,8 @@
>  #
>  # Makefile for the drm device driver.  This driver provides support for =
the
>  =

> -ttm-y :=3D ttm_memory.o ttm_tt.o ttm_bo.o \
> -	ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
> -	ttm_execbuf_util.o ttm_range_manager.o \
> -	ttm_resource.o ttm_pool.o
> +ttm-y :=3D ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
> +	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o
>  ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
>  =

>  obj-$(CONFIG_DRM_TTM) +=3D ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f1f3fd085465..cbb4d67c9288 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -474,7 +474,6 @@ static void ttm_bo_release(struct kref *kref)
>  	struct ttm_buffer_object *bo =3D
>  	    container_of(kref, struct ttm_buffer_object, kref);
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	size_t acc_size =3D bo->acc_size;
>  	int ret;
>  =

>  	if (!bo->deleted) {
> @@ -534,7 +533,6 @@ static void ttm_bo_release(struct kref *kref)
>  	if (!ttm_bo_uses_embedded_gem_object(bo))
>  		dma_resv_fini(&bo->base._resv);
>  	bo->destroy(bo);
> -	ttm_mem_global_free(&ttm_mem_glob, acc_size);
>  }
>  =

>  void ttm_bo_put(struct ttm_buffer_object *bo)
> @@ -1095,25 +1093,13 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bd=
ev,
>  			 struct ttm_placement *placement,
>  			 uint32_t page_alignment,
>  			 struct ttm_operation_ctx *ctx,
> -			 size_t acc_size,
>  			 struct sg_table *sg,
>  			 struct dma_resv *resv,
>  			 void (*destroy) (struct ttm_buffer_object *))
>  {
> -	struct ttm_mem_global *mem_glob =3D &ttm_mem_glob;
>  	bool locked;
>  	int ret =3D 0;
>  =

> -	ret =3D ttm_mem_global_alloc(mem_glob, acc_size, ctx);
> -	if (ret) {
> -		pr_err("Out of kernel memory\n");
> -		if (destroy)
> -			(*destroy)(bo);
> -		else
> -			kfree(bo);
> -		return -ENOMEM;
> -	}
> -
>  	bo->destroy =3D destroy ? destroy : ttm_bo_default_destroy;
>  =

>  	kref_init(&bo->kref);
> @@ -1130,7 +1116,6 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  	bo->mem.bus.addr =3D NULL;
>  	bo->moving =3D NULL;
>  	bo->mem.placement =3D 0;
> -	bo->acc_size =3D acc_size;
>  	bo->pin_count =3D 0;
>  	bo->sg =3D sg;
>  	if (resv) {
> @@ -1191,7 +1176,6 @@ int ttm_bo_init(struct ttm_bo_device *bdev,
>  		struct ttm_placement *placement,
>  		uint32_t page_alignment,
>  		bool interruptible,
> -		size_t acc_size,
>  		struct sg_table *sg,
>  		struct dma_resv *resv,
>  		void (*destroy) (struct ttm_buffer_object *))
> @@ -1200,8 +1184,7 @@ int ttm_bo_init(struct ttm_bo_device *bdev,
>  	int ret;
>  =

>  	ret =3D ttm_bo_init_reserved(bdev, bo, size, type, placement,
> -				   page_alignment, &ctx, acc_size,
> -				   sg, resv, destroy);
> +				   page_alignment, &ctx, sg, resv, destroy);
>  	if (ret)
>  		return ret;
>  =

> @@ -1212,20 +1195,6 @@ int ttm_bo_init(struct ttm_bo_device *bdev,
>  }
>  EXPORT_SYMBOL(ttm_bo_init);
>  =

> -size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
> -			   unsigned long bo_size,
> -			   unsigned struct_size)
> -{
> -	unsigned npages =3D (PAGE_ALIGN(bo_size)) >> PAGE_SHIFT;
> -	size_t size =3D 0;
> -
> -	size +=3D ttm_round_pot(struct_size);
> -	size +=3D ttm_round_pot(npages * (2*sizeof(void *) + sizeof(dma_addr_t)=
));
> -	size +=3D ttm_round_pot(sizeof(struct ttm_tt));
> -	return size;
> -}
> -EXPORT_SYMBOL(ttm_bo_dma_acc_size);
> -
>  static void ttm_bo_global_kobj_release(struct kobject *kobj)
>  {
>  	struct ttm_bo_global *glob =3D
> @@ -1242,9 +1211,11 @@ static void ttm_bo_global_release(void)
>  	if (--ttm_bo_glob_use_count > 0)
>  		goto out;
>  =

> +	ttm_tt_mgr_fini();
> +	ttm_pool_mgr_fini();
> +
>  	kobject_del(&glob->kobj);
>  	kobject_put(&glob->kobj);
> -	ttm_mem_global_release(&ttm_mem_glob);
>  	memset(glob, 0, sizeof(*glob));
>  out:
>  	mutex_unlock(&ttm_global_mutex);
> @@ -1253,6 +1224,8 @@ static void ttm_bo_global_release(void)
>  static int ttm_bo_global_init(void)
>  {
>  	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> +	uint64_t num_pages;
> +	struct sysinfo si;
>  	int ret =3D 0;
>  	unsigned i;
>  =

> @@ -1260,9 +1233,16 @@ static int ttm_bo_global_init(void)
>  	if (++ttm_bo_glob_use_count > 1)
>  		goto out;
>  =

> -	ret =3D ttm_mem_global_init(&ttm_mem_glob);
> -	if (ret)
> -		goto out;
> +	si_meminfo(&si);
> +
> +	/* Limit the number of pages in the pool to about 50% of the total
> +	 * system memory.
> +	 */
> +	num_pages =3D (u64)si.totalram * si.mem_unit;
> +	num_pages =3D (num_pages * 50 / 100) >> PAGE_SHIFT;
> +
> +	ttm_pool_mgr_init(num_pages);
> +	ttm_tt_mgr_init();
>  =

>  	spin_lock_init(&glob->lru_lock);
>  	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 398d5013fc39..03e9f6f6a611 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -309,7 +309,6 @@ static int ttm_buffer_object_transfer(struct ttm_buff=
er_object *bo,
>  =

>  	kref_init(&fbo->base.kref);
>  	fbo->base.destroy =3D &ttm_transfered_destroy;
> -	fbo->base.acc_size =3D 0;
>  	fbo->base.pin_count =3D 0;
>  	if (bo->type !=3D ttm_bo_type_sg)
>  		fbo->base.base.resv =3D &fbo->base.base._resv;
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 5455b2044759..24ae7c23cfd0 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -416,16 +416,10 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct tt=
m_tt *tt,
>  			caching =3D pages + (1 << order);
>  		}
>  =

> -		r =3D ttm_mem_global_alloc_page(&ttm_mem_glob, p,
> -					      (1 << order) * PAGE_SIZE,
> -					      ctx);
> -		if (r)
> -			goto error_free_page;
> -
>  		if (dma_addr) {
>  			r =3D ttm_pool_map(pool, order, p, &dma_addr);
>  			if (r)
> -				goto error_global_free;
> +				goto error_free_page;
>  		}
>  =

>  		num_pages -=3D 1 << order;
> @@ -439,9 +433,6 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_=
tt *tt,
>  =

>  	return 0;
>  =

> -error_global_free:
> -	ttm_mem_global_free_page(&ttm_mem_glob, p, (1 << order) * PAGE_SIZE);
> -
>  error_free_page:
>  	ttm_pool_free_page(pool, tt->caching, order, p);
>  =

> @@ -476,8 +467,6 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_=
tt *tt)
>  =

>  		order =3D ttm_pool_page_order(pool, p);
>  		num_pages =3D 1ULL << order;
> -		ttm_mem_global_free_page(&ttm_mem_glob, p,
> -					 num_pages * PAGE_SIZE);
>  		if (tt->dma_address)
>  			ttm_pool_unmap(pool, tt->dma_address[i], num_pages);
>  =

> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Mak=
efile
> index 31f85f09f1fc..86af5d7b0242 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -9,7 +9,7 @@ vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o =
vmwgfx_drv.o \
>  	    vmwgfx_cotable.o vmwgfx_so.o vmwgfx_binding.o vmwgfx_msg.o \
>  	    vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
>  	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
> -	    ttm_object.o ttm_lock.o
> +	    ttm_object.o ttm_lock.o ttm_memory.o
>  =

>  vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) +=3D vmwgfx_thp.o
>  obj-$(CONFIG_DRM_VMWGFX) :=3D vmwgfx.o
> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/vmwgfx/tt=
m_memory.c
> similarity index 97%
> rename from drivers/gpu/drm/ttm/ttm_memory.c
> rename to drivers/gpu/drm/vmwgfx/ttm_memory.c
> index 3d2479d0ce2c..bfec1e845345 100644
> --- a/drivers/gpu/drm/ttm/ttm_memory.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_memory.c
> @@ -28,7 +28,6 @@
>  =

>  #define pr_fmt(fmt) "[TTM] " fmt
>  =

> -#include <drm/ttm/ttm_memory.h>
>  #include <linux/spinlock.h>
>  #include <linux/sched.h>
>  #include <linux/wait.h>
> @@ -36,10 +35,11 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/swap.h>
> -#include <drm/ttm/ttm_pool.h>
> -#include <drm/ttm/ttm_tt.h>
>  =

> -#include "ttm_module.h"
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "ttm_memory.h"
>  =

>  #define TTM_MEMORY_ALLOC_RETRIES 4
>  =

> @@ -414,7 +414,7 @@ static int ttm_mem_init_dma32_zone(struct ttm_mem_glo=
bal *glob,
>  }
>  #endif
>  =

> -int ttm_mem_global_init(struct ttm_mem_global *glob)
> +int ttm_mem_global_init(struct ttm_mem_global *glob, struct drm_device *=
dev)
>  {
>  	struct sysinfo si;
>  	int ret;
> @@ -425,7 +425,8 @@ int ttm_mem_global_init(struct ttm_mem_global *glob)
>  	glob->swap_queue =3D create_singlethread_workqueue("ttm_swap");
>  	INIT_WORK(&glob->work, ttm_shrink_work);
>  	ret =3D kobject_init_and_add(
> -		&glob->kobj, &ttm_mem_glob_kobj_type, ttm_get_kobj(), "memory_accounti=
ng");
> +		&glob->kobj, &ttm_mem_glob_kobj_type, &dev->primary->kdev->kobj,
> +		"memory_accounting");
>  	if (unlikely(ret !=3D 0)) {
>  		kobject_put(&glob->kobj);
>  		return ret;
> @@ -453,8 +454,6 @@ int ttm_mem_global_init(struct ttm_mem_global *glob)
>  		pr_info("Zone %7s: Available graphics memory: %llu KiB\n",
>  			zone->name, (unsigned long long)zone->max_mem >> 10);
>  	}
> -	ttm_pool_mgr_init(glob->zone_kernel->max_mem/(2*PAGE_SIZE));
> -	ttm_tt_mgr_init();
>  	return 0;
>  out_no_zone:
>  	ttm_mem_global_release(glob);
> @@ -466,10 +465,6 @@ void ttm_mem_global_release(struct ttm_mem_global *g=
lob)
>  	struct ttm_mem_zone *zone;
>  	unsigned int i;
>  =

> -	/* let the page allocator first stop the shrink work. */
> -	ttm_pool_mgr_fini();
> -	ttm_tt_mgr_fini();
> -
>  	flush_workqueue(glob->swap_queue);
>  	destroy_workqueue(glob->swap_queue);
>  	glob->swap_queue =3D NULL;
> diff --git a/include/drm/ttm/ttm_memory.h b/drivers/gpu/drm/vmwgfx/ttm_me=
mory.h
> similarity index 97%
> rename from include/drm/ttm/ttm_memory.h
> rename to drivers/gpu/drm/vmwgfx/ttm_memory.h
> index c1f167881e33..850ee6c867da 100644
> --- a/include/drm/ttm/ttm_memory.h
> +++ b/drivers/gpu/drm/vmwgfx/ttm_memory.h
> @@ -35,7 +35,8 @@
>  #include <linux/errno.h>
>  #include <linux/kobject.h>
>  #include <linux/mm.h>
> -#include "ttm_bo_api.h"
> +
> +#include <drm/ttm/ttm_bo_api.h>
>  =

>  /**
>   * struct ttm_mem_global - Global memory accounting structure.
> @@ -79,7 +80,7 @@ extern struct ttm_mem_global {
>  #endif
>  } ttm_mem_glob;
>  =

> -int ttm_mem_global_init(struct ttm_mem_global *glob);
> +int ttm_mem_global_init(struct ttm_mem_global *glob, struct drm_device *=
dev);
>  void ttm_mem_global_release(struct ttm_mem_global *glob);
>  int ttm_mem_global_alloc(struct ttm_mem_global *glob, uint64_t memory,
>  			 struct ttm_operation_ctx *ctx);
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx=
/ttm_object.h
> index ede26df87c93..49b064f0cb19 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_object.h
> +++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
> @@ -43,7 +43,8 @@
>  #include <linux/rcupdate.h>
>  =

>  #include <drm/drm_hashtab.h>
> -#include <drm/ttm/ttm_memory.h>
> +
> +#include "ttm_memory.h"
>  =

>  /**
>   * enum ttm_ref_type
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 63dbc44eebe0..f7abe2992178 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -508,11 +508,16 @@ int vmw_bo_create_kernel(struct vmw_private *dev_pr=
iv, unsigned long size,
>  	acc_size =3D ttm_round_pot(sizeof(*bo));
>  	acc_size +=3D ttm_round_pot(npages * sizeof(void *));
>  	acc_size +=3D ttm_round_pot(sizeof(struct ttm_tt));
> +
> +	ret =3D ttm_mem_global_alloc(&ttm_mem_glob, acc_size, &ctx);
> +	if (unlikely(ret))
> +		goto error_free;
> +
>  	ret =3D ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
>  				   ttm_bo_type_device, placement, 0,
> -				   &ctx, acc_size, NULL, NULL, NULL);
> +				   &ctx, NULL, NULL, NULL);
>  	if (unlikely(ret))
> -		goto error_free;
> +		goto error_account;
>  =

>  	ttm_bo_pin(bo);
>  	ttm_bo_unreserve(bo);
> @@ -520,6 +525,9 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv=
, unsigned long size,
>  =

>  	return 0;
>  =

> +error_account:
> +	ttm_mem_global_free(&ttm_mem_glob, acc_size);
> +
>  error_free:
>  	kfree(bo);
>  	return ret;
> @@ -559,11 +567,17 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>  	vmw_bo->base.priority =3D 3;
>  	vmw_bo->res_tree =3D RB_ROOT;
>  =

> +	ret =3D ttm_mem_global_alloc(&ttm_mem_glob, acc_size, &ctx);
> +	if (unlikely(ret))
> +		return ret;
> +
>  	ret =3D ttm_bo_init_reserved(bdev, &vmw_bo->base, size,
>  				   ttm_bo_type_device, placement,
> -				   0, &ctx, acc_size, NULL, NULL, bo_free);
> -	if (unlikely(ret))
> +				   0, &ctx, NULL, NULL, bo_free);
> +	if (unlikely(ret)) {
> +		ttm_mem_global_free(&ttm_mem_glob, acc_size);
>  		return ret;
> +	}
>  =

>  	if (pin)
>  		ttm_bo_pin(&vmw_bo->base);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index e141fa9f616d..ca66eaa2e376 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1272,6 +1272,7 @@ static void vmw_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev =3D pci_get_drvdata(pdev);
>  =

> +	ttm_mem_global_release(&ttm_mem_glob);
>  	drm_dev_unregister(dev);
>  	vmw_driver_unload(dev);
>  	drm_dev_put(dev);
> @@ -1519,6 +1520,10 @@ static int vmw_probe(struct pci_dev *pdev, const s=
truct pci_device_id *ent)
>  		goto err_pci_disable_device;
>  	}
>  =

> +	ret =3D ttm_mem_global_init(&ttm_mem_glob, dev);
> +	if (ret)
> +		return ret;
> +
>  	dev->pdev =3D pdev;
>  	pci_set_drvdata(pdev, dev);
>  =

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index 1c75f73538c0..efb567da749d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -575,11 +575,31 @@ static void vmw_ttm_destroy(struct ttm_bo_device *b=
dev, struct ttm_tt *ttm)
>  static int vmw_ttm_populate(struct ttm_bo_device *bdev,
>  			    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>  {
> +	unsigned int i;
> +	int ret;
> +
>  	/* TODO: maybe completely drop this ? */
>  	if (ttm_tt_is_populated(ttm))
>  		return 0;
>  =

> -	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +	ret =3D ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < ttm->num_pages; ++i) {
> +		ret =3D ttm_mem_global_alloc_page(&ttm_mem_glob, ttm->pages[i],
> +						PAGE_SIZE, ctx);
> +		if (ret)
> +			goto error;
> +	}
> +	return 0;
> +
> +error:
> +	while (i--)
> +		ttm_mem_global_free_page(&ttm_mem_glob, ttm->pages[i],
> +					 PAGE_SIZE);
> +	ttm_pool_free(&bdev->pool, ttm);
> +	return ret;
>  }
>  =

>  static void vmw_ttm_unpopulate(struct ttm_bo_device *bdev,
> @@ -587,6 +607,7 @@ static void vmw_ttm_unpopulate(struct ttm_bo_device *=
bdev,
>  {
>  	struct vmw_ttm_tt *vmw_tt =3D container_of(ttm, struct vmw_ttm_tt,
>  						 dma_ttm);
> +	unsigned int i;
>  =

>  	if (vmw_tt->mob) {
>  		vmw_mob_destroy(vmw_tt->mob);
> @@ -594,6 +615,11 @@ static void vmw_ttm_unpopulate(struct ttm_bo_device =
*bdev,
>  	}
>  =

>  	vmw_ttm_unmap_dma(vmw_tt);
> +
> +	for (i =3D 0; i < ttm->num_pages; ++i)
> +		ttm_mem_global_free_page(&ttm_mem_glob, ttm->pages[i],
> +					 PAGE_SIZE);
> +
>  	ttm_pool_free(&bdev->pool, ttm);
>  }
>  =

> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 7c7539d76e1d..30254d869db6 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -88,7 +88,6 @@ struct ttm_tt;
>   * @type: The bo type.
>   * @destroy: Destruction function. If NULL, kfree is used.
>   * @num_pages: Actual number of pages.
> - * @acc_size: Accounted size for this object.
>   * @kref: Reference count of this buffer object. When this refcount reac=
hes
>   * zero, the object is destroyed or put on the delayed delete list.
>   * @mem: structure describing current placement.
> @@ -125,7 +124,6 @@ struct ttm_buffer_object {
>  	struct ttm_bo_device *bdev;
>  	enum ttm_bo_type type;
>  	void (*destroy) (struct ttm_buffer_object *);
> -	size_t acc_size;
>  =

>  	/**
>  	* Members not needing protection.
> @@ -357,10 +355,6 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_d=
evice *bdev, int resched);
>  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  			      const struct ttm_place *place);
>  =

> -size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
> -			   unsigned long bo_size,
> -			   unsigned struct_size);
> -
>  /**
>   * ttm_bo_init_reserved
>   *
> @@ -371,7 +365,6 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
>   * @flags: Initial placement flags.
>   * @page_alignment: Data alignment in pages.
>   * @ctx: TTM operation context for memory allocation.
> - * @acc_size: Accounted size for this object.
>   * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
>   * @destroy: Destroy function. Use NULL for kfree().
>   *
> @@ -402,8 +395,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  			 struct ttm_placement *placement,
>  			 uint32_t page_alignment,
>  			 struct ttm_operation_ctx *ctx,
> -			 size_t acc_size, struct sg_table *sg,
> -			 struct dma_resv *resv,
> +			 struct sg_table *sg, struct dma_resv *resv,
>  			 void (*destroy) (struct ttm_buffer_object *));
>  =

>  /**
> @@ -421,7 +413,6 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>   * holds a pointer to a persistent shmem object. Typically, this would
>   * point to the shmem object backing a GEM object if TTM is used to back=
 a
>   * GEM user interface.
> - * @acc_size: Accounted size for this object.
>   * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
>   * @destroy: Destroy function. Use NULL for kfree().
>   *
> @@ -446,7 +437,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  int ttm_bo_init(struct ttm_bo_device *bdev, struct ttm_buffer_object *bo,
>  		size_t size, enum ttm_bo_type type,
>  		struct ttm_placement *placement,
> -		uint32_t page_alignment, bool interrubtible, size_t acc_size,
> +		uint32_t page_alignment, bool interrubtible,
>  		struct sg_table *sg, struct dma_resv *resv,
>  		void (*destroy) (struct ttm_buffer_object *));
>  =

> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 423348414c59..547857697776 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -38,7 +38,6 @@
>  #include <linux/dma-resv.h>
>  =

>  #include "ttm_bo_api.h"
> -#include "ttm_memory.h"
>  #include "ttm_placement.h"
>  #include "ttm_tt.h"
>  #include "ttm_pool.h"
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 4bc3a08644fc..499338680660 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -30,6 +30,7 @@
>  #include <linux/types.h>
>  #include <drm/ttm/ttm_caching.h>
>  =

> +struct ttm_bo_device;
>  struct ttm_tt;
>  struct ttm_resource;
>  struct ttm_buffer_object;
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
