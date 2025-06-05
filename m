Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C5ACEF69
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298B510E10B;
	Thu,  5 Jun 2025 12:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOn96dx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D1410E10B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749127494; x=1780663494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q+M8VylXR73ZdsPmocdY09rjsZYqhnQ+FJ/8HEzqdBE=;
 b=jOn96dx+fZsdNd7l0vbkfyY16pdLhbg1TpaAJ9EH6JZyMFwjurk8qei8
 5GonVbf/i1X4b/VmOjHi3CtpIgJVi22cBeNL1o70inE9RnBuxYdIfvraL
 CTfoHSA3DDtmYJdZunRwQwoz7y20q8lBe8JKa8kZnOae3gXB1mRHZMv8b
 b7LV3q3c2+rYZfBXLxVckyZ0EtVe9RLuM34oHLH2zo63DZnarvssHOUeU
 al8xYMgKTcKmkuBOS1BRj5kT+Ba/maIvlfwCgWeU1OYHM1bcX/KMqfyNO
 Lk8dXXZTjgyG2Ql64o4+yTpriTyoexdMGw1LSgi107UvvGjoFhGnMJPmq A==;
X-CSE-ConnectionGUID: MsNWCM52RzmxxOdZaERz3w==
X-CSE-MsgGUID: s77TQvUXT8GfTkcRGA20Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51315119"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51315119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:44:54 -0700
X-CSE-ConnectionGUID: 517rzKqTR6aLmC8oxYKTdg==
X-CSE-MsgGUID: lb9Q+V+6Q3qKqPfdRj7FKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145460407"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:44:52 -0700
Message-ID: <7f67562d-f795-4705-bc13-d81327d180f4@linux.intel.com>
Date: Thu, 5 Jun 2025 14:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Use dma_resv_lock() instead of a custom mutex
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250528154325.500684-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250528154325.500684-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-fixes

On 5/28/2025 5:43 PM, Jacek Lawrynowicz wrote:
> This fixes a potential race conditions in:
>  - ivpu_bo_unbind_locked() where we modified the shmem->sgt without
>    holding the dma_resv_lock().
>  - ivpu_bo_print_info() where we read the shmem->pages without
>    holding the dma_resv_lock().
> 
> Using dma_resv_lock() also protects against future syncronisation
> issues that may arise when accessing drm_gem_shmem_object or
> drm_gem_object members.
> 
> Fixes: 42328003ecb6 ("accel/ivpu: Refactor BO creation functions")
> Cc: <stable@vger.kernel.org> # v6.9+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 63 +++++++++++++++++++----------------
>  drivers/accel/ivpu/ivpu_gem.h |  1 -
>  2 files changed, 34 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index c193a80241f5f..5908268ca45e9 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -33,6 +33,16 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>  		 (bool)bo->base.base.import_attach);
>  }
>  
> +static inline int ivpu_bo_lock(struct ivpu_bo *bo)
> +{
> +	return dma_resv_lock(bo->base.base.resv, NULL);
> +}
> +
> +static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
> +{
> +	dma_resv_unlock(bo->base.base.resv);
> +}
> +
>  /*
>   * ivpu_bo_pin() - pin the backing physical pages and map them to VPU.
>   *
> @@ -43,22 +53,22 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>  int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>  {
>  	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
> +	struct sg_table *sgt;
>  	int ret = 0;
>  
> -	mutex_lock(&bo->lock);
> -
>  	ivpu_dbg_bo(vdev, bo, "pin");
> -	drm_WARN_ON(&vdev->drm, !bo->ctx);
>  
> -	if (!bo->mmu_mapped) {
> -		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> +	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
> +		return ret;
> +	}
>  
> -		if (IS_ERR(sgt)) {
> -			ret = PTR_ERR(sgt);
> -			ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
> -			goto unlock;
> -		}
> +	ivpu_bo_lock(bo);
>  
> +	if (!bo->mmu_mapped) {
> +		drm_WARN_ON(&vdev->drm, !bo->ctx);
>  		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
>  					       ivpu_bo_is_snooped(bo));
>  		if (ret) {
> @@ -69,7 +79,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>  	}
>  
>  unlock:
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>  
>  	return ret;
>  }
> @@ -84,7 +94,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>  	if (!drm_dev_enter(&vdev->drm, &idx))
>  		return -ENODEV;
>  
> -	mutex_lock(&bo->lock);
> +	ivpu_bo_lock(bo);
>  
>  	ret = ivpu_mmu_context_insert_node(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
>  	if (!ret) {
> @@ -94,7 +104,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>  		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>  	}
>  
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>  
>  	drm_dev_exit(idx);
>  
> @@ -105,7 +115,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>  {
>  	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>  
> -	lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
> +	lockdep_assert(dma_resv_held(bo->base.base.resv) || !kref_read(&bo->base.base.refcount));
>  
>  	if (bo->mmu_mapped) {
>  		drm_WARN_ON(&vdev->drm, !bo->ctx);
> @@ -123,14 +133,12 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>  	if (bo->base.base.import_attach)
>  		return;
>  
> -	dma_resv_lock(bo->base.base.resv, NULL);
>  	if (bo->base.sgt) {
>  		dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
>  		sg_free_table(bo->base.sgt);
>  		kfree(bo->base.sgt);
>  		bo->base.sgt = NULL;
>  	}
> -	dma_resv_unlock(bo->base.base.resv);
>  }
>  
>  void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
> @@ -142,12 +150,12 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>  
>  	mutex_lock(&vdev->bo_list_lock);
>  	list_for_each_entry(bo, &vdev->bo_list, bo_list_node) {
> -		mutex_lock(&bo->lock);
> +		ivpu_bo_lock(bo);
>  		if (bo->ctx == ctx) {
>  			ivpu_dbg_bo(vdev, bo, "unbind");
>  			ivpu_bo_unbind_locked(bo);
>  		}
> -		mutex_unlock(&bo->lock);
> +		ivpu_bo_unlock(bo);
>  	}
>  	mutex_unlock(&vdev->bo_list_lock);
>  }
> @@ -167,7 +175,6 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
>  	bo->base.pages_mark_dirty_on_put = true; /* VPU can dirty a BO anytime */
>  
>  	INIT_LIST_HEAD(&bo->bo_list_node);
> -	mutex_init(&bo->lock);
>  
>  	return &bo->base.base;
>  }
> @@ -286,8 +293,6 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>  	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
>  	drm_WARN_ON(&vdev->drm, bo->ctx);
>  
> -	mutex_destroy(&bo->lock);
> -
>  	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
>  	drm_gem_shmem_free(&bo->base);
>  }
> @@ -370,9 +375,9 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>  		goto err_put;
>  
>  	if (flags & DRM_IVPU_BO_MAPPABLE) {
> -		dma_resv_lock(bo->base.base.resv, NULL);
> +		ivpu_bo_lock(bo);
>  		ret = drm_gem_shmem_vmap(&bo->base, &map);
> -		dma_resv_unlock(bo->base.base.resv);
> +		ivpu_bo_unlock(bo);
>  
>  		if (ret)
>  			goto err_put;
> @@ -395,9 +400,9 @@ void ivpu_bo_free(struct ivpu_bo *bo)
>  	struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->base.vaddr);
>  
>  	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
> -		dma_resv_lock(bo->base.base.resv, NULL);
> +		ivpu_bo_lock(bo);
>  		drm_gem_shmem_vunmap(&bo->base, &map);
> -		dma_resv_unlock(bo->base.base.resv);
> +		ivpu_bo_unlock(bo);
>  	}
>  
>  	drm_gem_object_put(&bo->base.base);
> @@ -416,12 +421,12 @@ int ivpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>  
>  	bo = to_ivpu_bo(obj);
>  
> -	mutex_lock(&bo->lock);
> +	ivpu_bo_lock(bo);
>  	args->flags = bo->flags;
>  	args->mmap_offset = drm_vma_node_offset_addr(&obj->vma_node);
>  	args->vpu_addr = bo->vpu_addr;
>  	args->size = obj->size;
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>  
>  	drm_gem_object_put(obj);
>  	return ret;
> @@ -458,7 +463,7 @@ int ivpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>  
>  static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>  {
> -	mutex_lock(&bo->lock);
> +	ivpu_bo_lock(bo);
>  
>  	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
>  		   bo, bo->ctx_id, bo->vpu_addr, bo->base.base.size,
> @@ -475,7 +480,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>  
>  	drm_printf(p, "\n");
>  
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>  }
>  
>  void ivpu_bo_list(struct drm_device *dev, struct drm_printer *p)
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index 0c93118c85bd3..aa8ff14f7aae1 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -17,7 +17,6 @@ struct ivpu_bo {
>  	struct list_head bo_list_node;
>  	struct drm_mm_node mm_node;
>  
> -	struct mutex lock; /* Protects: ctx, mmu_mapped, vpu_addr */
>  	u64 vpu_addr;
>  	u32 flags;
>  	u32 job_status; /* Valid only for command buffer */

