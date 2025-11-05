Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33663C35211
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEDC10E70A;
	Wed,  5 Nov 2025 10:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="hp8agkev";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="h4lfObt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4EE10E6F7;
 Wed,  5 Nov 2025 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762339165;
 bh=HynmbuF0tAM8tAN2lSgPkC7
 JF426wpJcLDfO5uTi/hw=; b=hp8agkevPjedr1AzyG9EXs7Pj4KLzVByaNj3R3PtuEItpEKsCD
 1lUxDH1tWGRSNN1dRBkubGhuvktSa7YcSS0lqgq9SfcjSr93KBXdgXkugXiUSE4f9I7URLEKjou
 Rvf810BMrjKZpA0A3IXzmuTwGkTTbeHHz03OdUaU2TfvkPLVix9EaEESb6z57zoSwxBUoiUjo+j
 np+OsypheZS1C14Bx7DPyx0ERm8XTjhqcWy0+1o+GcAv6KcDE26oQjI4oNDoWqFlXE0bOBo+DOz
 OrXWvYB7ySf3hDduNc4Beef/+eeeHHZjVaby+8XvHgc/Pmgf/6Ky2A07rxU2r6APm5Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762339165; bh=HynmbuF0tAM8tAN2lSgPkC7
 JF426wpJcLDfO5uTi/hw=; b=h4lfObt87YD+sXiVRU4gpbddW33IRV3aJ5rc5zxRTD2bGFF1dU
 qlI2txGneITbjhiq4+1tBFIRmL+IciImWpAA==;
Message-ID: <7395bf47-68fd-4af6-8720-e51dc75253bc@damsy.net>
Date: Wed, 5 Nov 2025 11:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/20] drm/amdgpu: use multiple entities in
 amdgpu_fill_buffer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-12-pierre-eric.pelloux-prayer@amd.com>
 <0f9aa878-46c4-48d6-9ad5-774a0927b291@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <0f9aa878-46c4-48d6-9ad5-774a0927b291@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 04/11/2025 à 17:40, Christian König a écrit :
> On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
>> The benefits of using multiple entities is that multiple fill jobs
>> can run in parallel. Otherwise, even if the entity has access
>> to multiple engines, a burst of N independent jobs will all
>> run on the same engine because an entity guarantees the ordering
>> of execution matches the ordering of the submission.
>>
>> Callers can opt-out of this behavior by passing the entity they
>> want to use (see amdgpu_move_blit).
> 
> That still sounds like a really bad idea to me.
> 
> First of all we can't reserve so many fence slots in the release handler, previously we basically just relied on the fact that the BO will most likely be mostly idle.
> 
> I think we should just use a single SDMA engine for each clear and distribute clearing different BOs over multiple engines.

So N clear entities, each one having access to a single engine. And all jobs to 
clear a single BO go to the same entity?

Is that what you mean?

Pierre-Eric

> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 84 ++++++++++++++++++-------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>>   2 files changed, 64 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index c357a6d9763a..839ea8c7f6be 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -2224,6 +2224,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   		adev->mman.clear_entities = kcalloc(num_clear_entities,
>>   						    sizeof(struct amdgpu_ttm_entity),
>>   						    GFP_KERNEL);
>> +		atomic_set(&adev->mman.next_clear_entity, 0);
>>   		if (!adev->mman.clear_entities)
>>   			goto error_free_entity;
>>   
>> @@ -2498,10 +2499,12 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   {
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +	struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT] = {};
>>   	struct dma_fence *fence = NULL;
>>   	struct dma_resv *resv = NULL;
>>   	struct amdgpu_res_cursor dst;
>> -	int r;
>> +	uint64_t cur_size, to;
>> +	int r, e, n_fences;
>>   
>>   	/* The fences will be either added to the resv object or the last fence
>>   	 * will be returned to the caller. In the latter case, all fill jobs will
>> @@ -2515,53 +2518,92 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   	}
>>   
>>   	if (!entity) {
>> -		entity = &adev->mman.clear_entities[0];
>>   		resv = &bo->tbo.base._resv;
>> -		r = dma_resv_reserve_fences(resv, 1);
>> +
>> +		/* Determine how much fences we're going to add to the
>> +		 * resv object.
>> +		 */
>> +		n_fences = 0;
>> +		amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>> +		while (dst.remaining) {
>> +			cur_size = min(dst.size, 256ULL << 20);
>> +
>> +			n_fences += 1;
>> +			amdgpu_res_next(&dst, cur_size);
>> +		}
>> +		if (n_fences == 0)
>> +			return 0;
>> +
>> +		/* One slot per entity at most. */
>> +		n_fences = MIN(n_fences, adev->mman.num_clear_entities);
>> +
>> +		r = dma_resv_reserve_fences(resv, n_fences);
>>   		if (r)
>>   			return r;
>> +	} else {
>> +		mutex_lock(&entity->gart_window_lock);
>>   	}
>>   
>>   	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>>   
>> -	mutex_lock(&entity->gart_window_lock);
>>   	while (dst.remaining) {
>> -		struct dma_fence *next;
>> -		uint64_t cur_size, to;
>> -
>>   		/* Never fill more than 256MiB at once to avoid timeouts */
>>   		cur_size = min(dst.size, 256ULL << 20);
>>   
>> +		if (resv) {
>> +			/* Pick a new entity for each partial clear so they can
>> +			 * execute in parallel.
>> +			 */
>> +			e = atomic_inc_return(&adev->mman.next_clear_entity) %
>> +				adev->mman.num_clear_entities;
>> +			entity = &adev->mman.clear_entities[e];
>> +			mutex_lock(&entity->gart_window_lock);
>> +		}
>> +
>>   		r = amdgpu_ttm_map_buffer(&entity->base,
>>   					  &bo->tbo, bo->tbo.resource, &dst,
>>   					  entity->gart_window_id1, ring, false,
>>   					  &cur_size, &to,
>>   					  dependency,
>>   					  resv);
>> -		if (r)
>> +		if (r) {
>> +			mutex_unlock(&entity->gart_window_lock);
>>   			goto error;
>> +		}
>>   
>>   		r = amdgpu_ttm_fill_mem(ring, &entity->base,
>>   					src_data, to, cur_size, resv,
>> -					&next, true, k_job_id);
>> -		if (r)
>> +					&fence, true, k_job_id);
>> +		if (r) {
>> +			mutex_unlock(&entity->gart_window_lock);
>>   			goto error;
>> -
>> -		if (resv) {
>> -			dma_resv_add_fence(resv, next, DMA_RESV_USAGE_KERNEL);
>> -			dma_fence_put(next);
>> -		} else {
>> -			dma_fence_put(fence);
>> -			fence = next;
>>   		}
>>   
>>   		amdgpu_res_next(&dst, cur_size);
>> +
>> +		if (resv) {
>> +			/* Delay the addition of the fences to resv, otherwise the next partial
>> +			 * clears will depend on this one.
>> +			 */
>> +			fences[e] = fence;
>> +			mutex_unlock(&entity->gart_window_lock);
>> +		} else {
>> +			dma_fence_put(*f);
>> +			*f = fence;
>> +		}
>>   	}
>>   error:
>> -	mutex_unlock(&entity->gart_window_lock);
>> -	if (f)
>> -		*f = dma_fence_get(fence);
>> -	dma_fence_put(fence);
>> +	if (resv) {
>> +		for (e = 0; e < adev->mman.num_clear_entities; e++) {
>> +			if (fences[e]) {
>> +				dma_resv_add_fence(resv, fences[e], DMA_RESV_USAGE_KERNEL);
>> +				dma_fence_put(fences[e]);
>> +			}
>> +		}
>> +	} else {
>> +		mutex_unlock(&entity->gart_window_lock);
>> +	}
>> +
>>   	return r;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 38df2b5b4bc7..3fc31c7c6bfe 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -73,6 +73,7 @@ struct amdgpu_mman {
>>   
>>   	struct amdgpu_ttm_entity default_entity; /* has no gart windows */
>>   	struct amdgpu_ttm_entity *clear_entities;
>> +	atomic_t next_clear_entity;
>>   	u32 num_clear_entities;
>>   	struct amdgpu_ttm_entity move_entities[TTM_FENCES_MAX_SLOT_COUNT];
>>   	u32 num_move_entities;
