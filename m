Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF381A91BCD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F1B10E1DB;
	Thu, 17 Apr 2025 12:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67B4E10E1DB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:21:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 774571515
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 05:21:26 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B242A3F694
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 05:21:28 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:21:17 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/4] drm/panthor: Introduce BO labeling
Message-ID: <aADyPXxNOHHoE-9U@e110455-lin.cambridge.arm.com>
References: <20250415191539.55258-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415191539.55258-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 15, 2025 at 08:15:30PM +0100, Adrián Larumbe wrote:
> Add a new character string Panthor BO field, and a function that allows
> setting it from within the driver.
> 
> Driver takes care of freeing the string when it's replaced or no longer
> needed at object destruction time, but allocating it is the responsibility
> of callers.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 46 +++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 8244a4e6c2a2..8dd7fa63f1ff 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
>  
> +#include <linux/cleanup.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
>  
> +	/*
> +	 * Label might have been allocated with kstrdup_const(),
> +	 * we need to take that into account when freeing the memory
> +	 */
> +	kfree_const(bo->label.str);
> +
> +	mutex_destroy(&bo->label.lock);
> +
>  	drm_gem_free_mmap_offset(&bo->base.base);
>  	mutex_destroy(&bo->gpuva_list_lock);
>  	drm_gem_shmem_free(&bo->base);
> @@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>  	obj->base.map_wc = !ptdev->coherent;
>  	mutex_init(&obj->gpuva_list_lock);
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> +	mutex_init(&obj->label.lock);
>  
>  	return &obj->base.base;
>  }
> @@ -247,3 +257,39 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  
>  	return ret;
>  }
> +
> +void
> +panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +	const char *old_label;
> +
> +	scoped_guard(mutex, &bo->label.lock) {
> +		old_label = bo->label.str;
> +		bo->label.str = label;
> +	}
> +
> +	kfree_const(old_label);
> +}
> +
> +void
> +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
> +{
> +	const char *str;
> +
> +	/* We should never attempt labelling a UM-exposed GEM object */
> +	if (drm_WARN_ON(bo->obj->dev, bo->obj->handle_count > 0))
> +		return;
> +
> +	if (!label)
> +		return;
> +
> +	str = kstrdup_const(label, GFP_KERNEL);
> +	if (!str) {
> +		/* Failing to allocate memory for a label isn't a fatal condition */
> +		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
> +		return;
> +	}
> +
> +	panthor_gem_bo_set_label(bo->obj, str);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 1a363bb814f4..af0d77338860 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -46,6 +46,20 @@ struct panthor_gem_object {
>  
>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>  	u32 flags;
> +
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.
> +	 */
> +	struct {
> +		/**
> +		 * @label.str: Pointer to NULL-terminated string,
> +		 */
> +		const char *str;
> +
> +		/** @lock.str: Protects access to the @label.str field. */
> +		struct mutex lock;
> +	} label;
>  };
>  
>  /**
> @@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  			       struct panthor_vm *exclusive_vm,
>  			       u64 *size, u32 flags, uint32_t *handle);
>  
> +void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
> +void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> +
>  static inline u64
>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>  {
> -- 
> 2.48.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
