Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E709399CF4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4536F42D;
	Thu,  3 Jun 2021 08:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9F46F42D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 08:45:17 +0000 (UTC)
IronPort-SDR: b1moHLmnHtYbdRCBYTQtCC2iXw0LXeP0Q87Hcz11qYERwUGZBds5rh4ww6t9EFvwCcGFWxdjNm
 LsmJbIzhmtLw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="265172024"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="265172024"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:45:13 -0700
IronPort-SDR: 2+haOxi/z11x5pcW7upU2tEXE4qMdn3DRRJvYbTVi+TnbqxWYoM1+Tcaox7GciQ8FBNCHuH86d
 09ktPSiSzivQ==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480143824"
Received: from rdavies-mobl.ger.corp.intel.com (HELO [10.252.26.83])
 ([10.252.26.83])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:45:12 -0700
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas_os@shipmail.org, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <a17599a1-97c9-0b35-82f8-b06a0526af22@intel.com>
Date: Thu, 3 Jun 2021 09:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2021 11:09, Christian König wrote:
> To improve the handling we want the establish the resource object as base
> class for the backend allocations.
> 
> v2: add missing error handling
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 54 +++++++-------
>   drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c               | 83 ++++++++--------------
>   drivers/gpu/drm/ttm/ttm_bo_util.c          | 43 ++++++-----
>   drivers/gpu/drm/ttm/ttm_resource.c         | 31 +++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>   include/drm/ttm/ttm_bo_api.h               |  1 -
>   include/drm/ttm/ttm_bo_driver.h            | 10 ++-
>   include/drm/ttm/ttm_resource.h             |  4 +-
>   11 files changed, 110 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 03c6b63d1d54..59723c3d5826 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -362,14 +362,14 @@ int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
>   	if (cpu_addr)
>   		amdgpu_bo_kunmap(*bo_ptr);
>   
> -	ttm_resource_free(&(*bo_ptr)->tbo, (*bo_ptr)->tbo.resource);
> +	ttm_resource_free(&(*bo_ptr)->tbo, &(*bo_ptr)->tbo.resource);
>   
>   	for (i = 0; i < (*bo_ptr)->placement.num_placement; ++i) {
>   		(*bo_ptr)->placements[i].fpfn = offset >> PAGE_SHIFT;
>   		(*bo_ptr)->placements[i].lpfn = (offset + size) >> PAGE_SHIFT;
>   	}
>   	r = ttm_bo_mem_space(&(*bo_ptr)->tbo, &(*bo_ptr)->placement,
> -			     (*bo_ptr)->tbo.resource, &ctx);
> +			     &(*bo_ptr)->tbo.resource, &ctx);
>   	if (r)
>   		goto error;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 663aa7d2e2ea..69db89261650 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -491,7 +491,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>   			return r;
>   
>   		amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
> -		ttm_resource_free(bo, bo->resource);
> +		ttm_resource_free(bo, &bo->resource);
>   		ttm_bo_assign_mem(bo, new_mem);
>   		goto out;
>   	}
> @@ -950,9 +950,9 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_ttm_tt *gtt = (void *)bo->ttm;
> -	struct ttm_resource tmp;
>   	struct ttm_placement placement;
>   	struct ttm_place placements;
> +	struct ttm_resource *tmp;
>   	uint64_t addr, flags;
>   	int r;
>   
> @@ -962,37 +962,37 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	addr = amdgpu_gmc_agp_addr(bo);
>   	if (addr != AMDGPU_BO_INVALID_OFFSET) {
>   		bo->resource->start = addr >> PAGE_SHIFT;
> -	} else {
> +		return 0;
> +	}
>   
> -		/* allocate GART space */
> -		placement.num_placement = 1;
> -		placement.placement = &placements;
> -		placement.num_busy_placement = 1;
> -		placement.busy_placement = &placements;
> -		placements.fpfn = 0;
> -		placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
> -		placements.mem_type = TTM_PL_TT;
> -		placements.flags = bo->resource->placement;
> -
> -		r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
> -		if (unlikely(r))
> -			return r;
> +	/* allocate GART space */
> +	placement.num_placement = 1;
> +	placement.placement = &placements;
> +	placement.num_busy_placement = 1;
> +	placement.busy_placement = &placements;
> +	placements.fpfn = 0;
> +	placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
> +	placements.mem_type = TTM_PL_TT;
> +	placements.flags = bo->resource->placement;
>   
> -		/* compute PTE flags for this buffer object */
> -		flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, &tmp);
> +	r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
> +	if (unlikely(r))
> +		return r;
>   
> -		/* Bind pages */
> -		gtt->offset = (u64)tmp.start << PAGE_SHIFT;
> -		r = amdgpu_ttm_gart_bind(adev, bo, flags);
> -		if (unlikely(r)) {
> -			ttm_resource_free(bo, &tmp);
> -			return r;
> -		}
> +	/* compute PTE flags for this buffer object */
> +	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
>   
> -		ttm_resource_free(bo, bo->resource);
> -		ttm_bo_assign_mem(bo, &tmp);
> +	/* Bind pages */
> +	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
> +	r = amdgpu_ttm_gart_bind(adev, bo, flags);
> +	if (unlikely(r)) {
> +		ttm_resource_free(bo, &tmp);
> +		return r;
>   	}
>   
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_assign_mem(bo, tmp);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index e688ca77483d..3a0d9b3bf991 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1009,7 +1009,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	if (old_reg->mem_type == TTM_PL_TT &&
>   	    new_reg->mem_type == TTM_PL_SYSTEM) {
>   		nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
> -		ttm_resource_free(bo, bo->resource);
> +		ttm_resource_free(bo, &bo->resource);
>   		ttm_bo_assign_mem(bo, new_reg);
>   		goto out;
>   	}
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 2507c1741681..cdffa9b65108 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -229,7 +229,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	if (old_mem->mem_type == TTM_PL_TT &&
>   	    new_mem->mem_type == TTM_PL_SYSTEM) {
>   		radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
> -		ttm_resource_free(bo, bo->resource);
> +		ttm_resource_free(bo, &bo->resource);
>   		ttm_bo_assign_mem(bo, new_mem);
>   		goto out;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5a7ab4b35b2d..4ed56520b81d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -223,7 +223,7 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
>   		bo->bdev->funcs->delete_mem_notify(bo);
>   
>   	ttm_bo_tt_destroy(bo);
> -	ttm_resource_free(bo, bo->resource);
> +	ttm_resource_free(bo, &bo->resource);
>   }
>   
>   static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
> @@ -489,7 +489,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   			struct ttm_operation_ctx *ctx)
>   {
>   	struct ttm_device *bdev = bo->bdev;
> -	struct ttm_resource evict_mem;
> +	struct ttm_resource *evict_mem;
>   	struct ttm_placement placement;
>   	struct ttm_place hop;
>   	int ret = 0;
> @@ -519,7 +519,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   		goto out;
>   	}
>   
> -	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx, &hop);
> +	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>   	if (unlikely(ret)) {
>   		WARN(ret == -EMULTIHOP, "Unexpected multihop in eviction - likely driver bug\n");
>   		if (ret != -ERESTARTSYS)
> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>    */
>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   				  const struct ttm_place *place,
> -				  struct ttm_resource *mem,
> +				  struct ttm_resource **mem,
>   				  struct ttm_operation_ctx *ctx)
>   {
>   	struct ttm_device *bdev = bo->bdev;
> -	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
> +	struct ttm_resource_manager *man;
>   	struct ww_acquire_ctx *ticket;
>   	int ret;
>   
> +	man = ttm_manager_type(bdev, (*mem)->mem_type);
>   	ticket = dma_resv_locking_ctx(bo->base.resv);
>   	do {
>   		ret = ttm_resource_alloc(bo, place, mem);
> @@ -749,37 +750,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   			return ret;
>   	} while (1);
>   
> -	return ttm_bo_add_move_fence(bo, man, mem, ctx->no_wait_gpu);
> -}
> -
> -/**
> - * ttm_bo_mem_placement - check if placement is compatible
> - * @bo: BO to find memory for
> - * @place: where to search
> - * @mem: the memory object to fill in
> - *
> - * Check if placement is compatible and fill in mem structure.
> - * Returns -EBUSY if placement won't work or negative error code.
> - * 0 when placement can be used.
> - */
> -static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
> -				const struct ttm_place *place,
> -				struct ttm_resource *mem)
> -{
> -	struct ttm_device *bdev = bo->bdev;
> -	struct ttm_resource_manager *man;
> -
> -	man = ttm_manager_type(bdev, place->mem_type);
> -	if (!man || !ttm_resource_manager_used(man))
> -		return -EBUSY;
> -
> -	mem->mem_type = place->mem_type;
> -	mem->placement = place->flags;
> -
> -	spin_lock(&bo->bdev->lru_lock);
> -	ttm_bo_move_to_lru_tail(bo, mem, NULL);
> -	spin_unlock(&bo->bdev->lru_lock);

Why do we drop the move_to_lru_tail here?
