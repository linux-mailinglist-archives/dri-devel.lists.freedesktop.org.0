Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD10387892
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF76EB4D;
	Tue, 18 May 2021 12:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C846EB4D;
 Tue, 18 May 2021 12:19:19 +0000 (UTC)
IronPort-SDR: P/6cLS2peHVEQ0V5wPeQOaWaXeRzYPayVtTY0W3ML+DwukLZ87/czxlb6ay5+qyWHAJQ0e4B5Q
 EdTKTk2TDWbw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180299376"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="180299376"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 05:19:19 -0700
IronPort-SDR: pjmLHJdUMqL4pC8ti0FgJCXQA++pUzqLq/nAL1QwGQI4ejbUyo6XaRZfuo5KkO6Ixk9O4hUwxA
 75uHS2B7SsUg==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439413261"
Received: from cbackhau-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 05:19:17 -0700
Subject: Re: [Intel-gfx] [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the
 driver some control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <29912ee5-e22d-9995-26b8-552a0e26f9a0@linux.intel.com>
Date: Tue, 18 May 2021 14:19:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 18-05-2021 om 10:26 schreef Thomas Hellström:
> We are calling the eviction_valuable driver callback at eviction time to
> determine whether we actually can evict a buffer object.
> The upcoming i915 TTM backend needs the same functionality for swapout,
> and that might actually be beneficial to other drivers as well.
>
> Add an eviction_valuable call also in the swapout path. Try to keep the
> current behaviour for all drivers by returning true if the buffer object
> is already in the TTM_PL_SYSTEM placement. We change behaviour for the
> case where a buffer object is in a TT backed placement when swapped out,
> in which case the drivers normal eviction_valuable path is run.
>
> Finally export ttm_tt_unpopulate() and don't swap out bos
> that are not populated. This allows a driver to purge a bo at
> swapout time if its content is no longer valuable rather than to
> have TTM swap the contents out.
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 +++
>  drivers/gpu/drm/ttm/ttm_bo.c            | 41 +++++++++++++++----------
>  drivers/gpu/drm/ttm/ttm_tt.c            |  4 +++
>  3 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 8c7ec09eb1a4..d5a9d7a88315 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1399,6 +1399,10 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  	struct dma_fence *f;
>  	int i;
>  
> +	/* Swapout? */
> +	if (bo->mem.mem_type == TTM_PL_SYSTEM)
> +		return true;
> +
>  	if (bo->type == ttm_bo_type_kernel &&
>  	    !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>  		return false;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 4479c55aaa1d..6a3f3112f62a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -531,6 +531,10 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  			      const struct ttm_place *place)
>  {
> +	dma_resv_assert_held(bo->base.resv);
> +	if (bo->mem.mem_type == TTM_PL_SYSTEM)
> +		return true;
> +
>  	/* Don't evict this BO if it's outside of the
>  	 * requested placement range
>  	 */
> @@ -553,7 +557,9 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   * b. Otherwise, trylock it.
>   */
>  static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> -			struct ttm_operation_ctx *ctx, bool *locked, bool *busy)
> +					   struct ttm_operation_ctx *ctx,
> +					   const struct ttm_place *place,
> +					   bool *locked, bool *busy)
>  {
>  	bool ret = false;
>  
> @@ -571,6 +577,12 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
>  			*busy = !ret;
>  	}
>  
> +	if (ret && place && !bo->bdev->funcs->eviction_valuable(bo, place)) {
> +		ret = false;
> +		if (locked)
> +			dma_resv_unlock(bo->base.resv);
> +	}

Probably meant to check and clear *locked here?

With that fixed:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

> +
>  	return ret;
>  }
>  
> @@ -625,20 +637,14 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  		list_for_each_entry(bo, &man->lru[i], lru) {
>  			bool busy;
>  
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
> -							    &busy)) {
> +			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> +							    &locked, &busy)) {
>  				if (busy && !busy_bo && ticket !=
>  				    dma_resv_locking_ctx(bo->base.resv))
>  					busy_bo = bo;
>  				continue;
>  			}
>  
> -			if (place && !bdev->funcs->eviction_valuable(bo,
> -								      place)) {
> -				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> -				continue;
> -			}
>  			if (!ttm_bo_get_unless_zero(bo)) {
>  				if (locked)
>  					dma_resv_unlock(bo->base.resv);
> @@ -1138,10 +1144,18 @@ EXPORT_SYMBOL(ttm_bo_wait);
>  int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  		   gfp_t gfp_flags)
>  {
> +	struct ttm_place place = {};
>  	bool locked;
>  	int ret;
>  
> -	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
> +	/*
> +	 * While the bo may already reside in SYSTEM placement, set
> +	 * SYSTEM as new placement to cover also the move further below.
> +	 * The driver may use the fact that we're moving from SYSTEM
> +	 * as an indication that we're about to swap out.
> +	 */
> +	place.mem_type = TTM_PL_SYSTEM;
> +	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
>  		return -EBUSY;
>  
>  	if (!ttm_bo_get_unless_zero(bo)) {
> @@ -1166,12 +1180,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  	if (bo->mem.mem_type != TTM_PL_SYSTEM) {
>  		struct ttm_operation_ctx ctx = { false, false };
>  		struct ttm_resource evict_mem;
> -		struct ttm_place place, hop;
> -
> -		memset(&place, 0, sizeof(place));
> -		memset(&hop, 0, sizeof(hop));
> -
> -		place.mem_type = TTM_PL_SYSTEM;
> +		struct ttm_place hop = {};
>  
>  		ret = ttm_resource_alloc(bo, &place, &evict_mem);
>  		if (unlikely(ret))
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 539e0232cb3b..7878ca4876c5 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -258,6 +258,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>  	struct page *to_page;
>  	int i, ret;
>  
> +	if (!ttm_tt_is_populated(ttm))
> +		return 0;
> +
>  	swap_storage = shmem_file_setup("ttm swap", size, 0);
>  	if (IS_ERR(swap_storage)) {
>  		pr_err("Failed allocating swap storage\n");
> @@ -399,6 +402,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  
>  	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>  }
> +EXPORT_SYMBOL(ttm_tt_unpopulate);
>  
>  #ifdef CONFIG_DEBUG_FS
>  


