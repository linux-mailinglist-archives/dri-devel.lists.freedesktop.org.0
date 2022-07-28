Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31449584331
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 17:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8857010FF0F;
	Thu, 28 Jul 2022 15:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6215010F044;
 Thu, 28 Jul 2022 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659022681; x=1690558681;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e2Fg2wgdrgtQR1FPI42cvDM2MSyGsQEEZ5q8gG6CwMg=;
 b=Z0/InApaa/HkEW1L928ZK8NW2g1+xnhnR5kwHkhA3Mh3IiSOWEbR2nOs
 AA45O3EerrXISJrSRu9tg6hK9gyl0vUKuyhVyyNevr8RpmJO6NurHjrRo
 +z+nsHzLaj8X/AeDAJKl4KobR6Cldc5Crmw9vPVllMUC8bk6sB7uW9YPg
 ZEArZIZaOMlYnLJoj3W5R8pFyPFRlsxIjrVHFUwA9LICKdFPWqLHKva0x
 6bDNSDvBmv8pRktYMQ42HfrlVUJbKeq6hWJp0nkGx/Xvpj0/tAkBdTqFJ
 2iGxDJF1F6nLqCl1J56Sp4qr+xFH+crKuvnf9Ov4UDd40To3FytG2YEpQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="275424204"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="275424204"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 08:38:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="846753316"
Received: from abernota-mobl.ger.corp.intel.com (HELO [10.213.218.28])
 ([10.213.218.28])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 08:37:58 -0700
Message-ID: <d8933a0b-8891-a075-cafe-85edfa3aab57@intel.com>
Date: Thu, 28 Jul 2022 16:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3 6/6] drm/ttm: Switch to using the new res callback
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
 <20220728143315.968590-6-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220728143315.968590-6-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 15:33, Arunpravin Paneer Selvam wrote:
> Apply new intersect and compatible callback instead
> of having a generic placement range verfications.
> 
> v2: Added a separate callback for compatiblilty
>      checks (Christian)
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

There is also some code at the bottom of i915_ttm_buddy_man_alloc() 
playing games with res->start, which I think can be safely deleted with 
this series (now that we have proper ->compatible() hook).

Also, is the plan to remove res->start completely, or does that still 
have a use?

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
>   drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
>   drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
>   3 files changed, 20 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 170935c294f5..7d25a10395c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>   static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   					    const struct ttm_place *place)
>   {
> -	unsigned long num_pages = bo->resource->num_pages;
>   	struct dma_resv_iter resv_cursor;
> -	struct amdgpu_res_cursor cursor;
>   	struct dma_fence *f;
>   
> +	if (!amdgpu_bo_is_amdgpu_bo(bo))
> +		return ttm_bo_eviction_valuable(bo, place);
> +
>   	/* Swapout? */
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			return false;
>   	}
>   
> -	switch (bo->resource->mem_type) {
> -	case AMDGPU_PL_PREEMPT:
> -		/* Preemptible BOs don't own system resources managed by the
> -		 * driver (pages, VRAM, GART space). They point to resources
> -		 * owned by someone else (e.g. pageable memory in user mode
> -		 * or a DMABuf). They are used in a preemptible context so we
> -		 * can guarantee no deadlocks and good QoS in case of MMU
> -		 * notifiers or DMABuf move notifiers from the resource owner.
> -		 */
> +	/* Preemptible BOs don't own system resources managed by the
> +	 * driver (pages, VRAM, GART space). They point to resources
> +	 * owned by someone else (e.g. pageable memory in user mode
> +	 * or a DMABuf). They are used in a preemptible context so we
> +	 * can guarantee no deadlocks and good QoS in case of MMU
> +	 * notifiers or DMABuf move notifiers from the resource owner.
> +	 */
> +	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
>   		return false;
> -	case TTM_PL_TT:
> -		if (amdgpu_bo_is_amdgpu_bo(bo) &&
> -		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
> -			return false;
> -		return true;
>   
> -	case TTM_PL_VRAM:
> -		/* Check each drm MM node individually */
> -		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
> -				 &cursor);
> -		while (cursor.remaining) {
> -			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
> -			    && !(place->lpfn &&
> -				 place->lpfn <= PFN_DOWN(cursor.start)))
> -				return true;
> -
> -			amdgpu_res_next(&cursor, cursor.size);
> -		}
> +	if (bo->resource->mem_type == TTM_PL_TT &&
> +	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
>   		return false;
>   
> -	default:
> -		break;
> -	}
> -
>   	return ttm_bo_eviction_valuable(bo, place);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c1bd006a5525..03409409e43e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place)
>   {
> +	struct ttm_resource *res = bo->resource;
> +	struct ttm_device *bdev = bo->bdev;
> +
>   	dma_resv_assert_held(bo->base.resv);
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   	/* Don't evict this BO if it's outside of the
>   	 * requested placement range
>   	 */
> -	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
> -	    (place->lpfn && place->lpfn <= bo->resource->start))
> -		return false;
> -
> -	return true;
> +	return ttm_resource_intersect(bdev, res, place, bo->base.size);
>   }
>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 84a6fe9e976e..c745faf72b1a 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -316,6 +316,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
>   {
> +	struct ttm_buffer_object *bo = res->bo;
> +	struct ttm_device *bdev = bo->bdev;
>   	unsigned i;
>   
>   	if (res->placement & TTM_PL_FLAG_TEMPORARY)
> @@ -324,8 +326,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> -		if (res->start < heap->fpfn || (heap->lpfn &&
> -		    (res->start + res->num_pages) > heap->lpfn))
> +		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>   			continue;
>   
>   		if ((res->mem_type == heap->mem_type) &&
