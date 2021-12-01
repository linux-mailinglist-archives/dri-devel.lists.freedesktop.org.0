Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667D746513F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289F26EC75;
	Wed,  1 Dec 2021 15:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABFCA6EC6F;
 Wed,  1 Dec 2021 15:16:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46CD4143B;
 Wed,  1 Dec 2021 07:16:20 -0800 (PST)
Received: from [10.57.0.188] (unknown [10.57.0.188])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 172D93F766;
 Wed,  1 Dec 2021 07:16:17 -0800 (PST)
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 emma@anholt.net, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, dan.carpenter@oracle.com
References: <20211130095255.26710-1-tzimmermann@suse.de>
From: Steven Price <steven.price@arm.com>
Message-ID: <8b48b8a4-8f33-c209-9edf-32f929c211e4@arm.com>
Date: Wed, 1 Dec 2021 15:16:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130095255.26710-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2021 09:52, Thomas Zimmermann wrote:
> GEM helper libraries use struct drm_driver.gem_create_object to let
> drivers override GEM object allocation. On failure, the call returns
> NULL.
> 
> Change the semantics to make the calls return a pointer-encoded error.
> This aligns the callback with its callers. Fixes the ingenic driver,
> which already returns an error pointer.
> 
> Also update the callers to handle the involved types more strictly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> There is an alternative patch at [1] that updates the value returned
> by ingenics' gem_create_object to NULL. Fixing the interface to return
> an errno code is more consistent with the rest of the GEM functions.
> 
> [1] https://lore.kernel.org/dri-devel/20211118111522.GD1147@kili/
> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c    | 17 ++++++++++-------
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 17 ++++++++++-------
>  drivers/gpu/drm/drm_gem_vram_helper.c   |  4 ++--
>  drivers/gpu/drm/lima/lima_gem.c         |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
>  drivers/gpu/drm/v3d/v3d_bo.c            |  4 ++--
>  drivers/gpu/drm/vc4/vc4_bo.c            |  2 +-
>  drivers/gpu/drm/vgem/vgem_drv.c         |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
>  include/drm/drm_drv.h                   |  5 +++--
>  10 files changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 7d4895de9e0d..cefd0cbf9deb 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -67,18 +67,21 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
>  	struct drm_gem_object *gem_obj;
>  	int ret = 0;
> 
> -	if (drm->driver->gem_create_object)
> +	if (drm->driver->gem_create_object) {
>  		gem_obj = drm->driver->gem_create_object(drm, size);
> -	else
> -		gem_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> -	if (!gem_obj)
> -		return ERR_PTR(-ENOMEM);
> +		if (IS_ERR(gem_obj))
> +			return ERR_CAST(gem_obj);
> +		cma_obj = to_drm_gem_cma_obj(gem_obj);
> +	} else {
> +		cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> +		if (!cma_obj)
> +			return ERR_PTR(-ENOMEM);
> +		gem_obj = &cma_obj->base;
> +	}
> 
>  	if (!gem_obj->funcs)
>  		gem_obj->funcs = &drm_gem_cma_default_funcs;
> 
> -	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
> -
>  	if (private) {
>  		drm_gem_private_object_init(drm, gem_obj, size);
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 0eeda1012364..7915047cb041 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -56,14 +56,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
> 
>  	size = PAGE_ALIGN(size);
> 
> -	if (dev->driver->gem_create_object)
> +	if (dev->driver->gem_create_object) {
>  		obj = dev->driver->gem_create_object(dev, size);
> -	else
> -		obj = kzalloc(sizeof(*shmem), GFP_KERNEL);
> -	if (!obj)
> -		return ERR_PTR(-ENOMEM);
> -
> -	shmem = to_drm_gem_shmem_obj(obj);
> +		if (IS_ERR(obj))
> +			return ERR_CAST(obj);
> +		shmem = to_drm_gem_shmem_obj(obj);
> +	} else {
> +		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
> +		if (!shmem)
> +			return ERR_PTR(-ENOMEM);
> +		obj = &shmem->base;
> +	}
> 
>  	if (!obj->funcs)
>  		obj->funcs = &drm_gem_shmem_funcs;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index bfa386b98134..3f00192215d1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -197,8 +197,8 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
> 
>  	if (dev->driver->gem_create_object) {
>  		gem = dev->driver->gem_create_object(dev, size);
> -		if (!gem)
> -			return ERR_PTR(-ENOMEM);
> +		if (IS_ERR(gem))
> +			return ERR_CAST(gem);
>  		gbo = drm_gem_vram_of_gem(gem);
>  	} else {
>  		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 2723d333c608..f9a9198ef198 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -221,7 +221,7 @@ struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t siz
> 
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>  	if (!bo)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> 
>  	mutex_init(&bo->lock);
>  	INIT_LIST_HEAD(&bo->va);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 6d9bdb9180cb..ead65f5fa2bc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -223,7 +223,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
> 
>  	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>  	if (!obj)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> 
>  	INIT_LIST_HEAD(&obj->mappings.list);
>  	mutex_init(&obj->mappings.lock);
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 0d9af62f69ad..6e3113f419f4 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -70,11 +70,11 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size)
>  	struct drm_gem_object *obj;
> 
>  	if (size == 0)
> -		return NULL;
> +		return ERR_PTR(-EINVAL);
> 
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>  	if (!bo)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	obj = &bo->base.base;
> 
>  	obj->funcs = &v3d_gem_funcs;
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 8520e440dbd1..6d1281a343e9 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -391,7 +391,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
> 
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>  	if (!bo)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> 
>  	bo->madv = VC4_MADV_WILLNEED;
>  	refcount_set(&bo->usecnt, 0);
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index a87eafa89e9f..c5e3e5457737 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -97,7 +97,7 @@ static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, siz
> 
>  	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>  	if (!obj)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> 
>  	/*
>  	 * vgem doesn't have any begin/end cpu access ioctls, therefore must use
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 187e10da2f17..baef2c5f2aaf 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -139,7 +139,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
> 
>  	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
>  	if (!shmem)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> 
>  	dshmem = &shmem->base.base;
>  	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index da0c836fe8e1..f6159acb8856 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -291,8 +291,9 @@ struct drm_driver {
>  	/**
>  	 * @gem_create_object: constructor for gem objects
>  	 *
> -	 * Hook for allocating the GEM object struct, for use by the CMA and
> -	 * SHMEM GEM helpers.
> +	 * Hook for allocating the GEM object struct, for use by the CMA
> +	 * and SHMEM GEM helpers. Returns a GEM object on success, or an
> +	 * ERR_PTR()-encoded error code otherwise.
>  	 */
>  	struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
>  						    size_t size);
> --
> 2.34.0
> 

