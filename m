Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A623FC34D9A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 10:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81DB10E6E8;
	Wed,  5 Nov 2025 09:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="mDOA4htJ";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="iswx5LVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2289710E2C1;
 Wed,  5 Nov 2025 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762335055;
 bh=mMC3l65IY1VPlkhnVVmJy0g
 52k4A4ulGLV/G3NS7BWE=; b=mDOA4htJoCHw2DvDjQT+G2BaxAuHcHTNlLg6G3uNqC88lprJn5
 H3IHS9CTlJIq9tLy1TnUQfdZ/lxk6LyWVLH3dZdgDrvgYXG0Qe9MxFQsED8dK8zFt6d37rFo6Ce
 Vs1ViCI/W9uhRSD2KnyjJ2d7ajllKmkX8TfZCaACAxVyHqDPLJPgaPu3PbNRRL/1MXFjvN0cIAO
 Yuq6SkQowoC2UpRApei7McY19yuW7I0vx1lvDzpL3XFbDcRu+I5Tr2ky4ihQlg7Y8Zqesclwel7
 FLGSoC0m9GXEEzIHPT+0wK3yqgTWTcudIGuUFvuR1LWsFRdkXjvJPAAOfk3/uIhoZqA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762335055; bh=mMC3l65IY1VPlkhnVVmJy0g
 52k4A4ulGLV/G3NS7BWE=; b=iswx5LVAoYUyILx1vMO7LlbkQPgENmmIsQvKUDdV/wwvIEKtqi
 DVJJFDO0EPzyGPNjuM2VHzpB+zcLyNJuWMAg==;
Message-ID: <9742acac-9402-4351-8cff-559ba6536629@damsy.net>
Date: Wed, 5 Nov 2025 10:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/20] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-18-pierre-eric.pelloux-prayer@amd.com>
 <ca139b41-b4c3-4f0a-a2c1-8cfab6032625@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <ca139b41-b4c3-4f0a-a2c1-8cfab6032625@amd.com>
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



Le 05/11/2025 à 09:46, Christian König a écrit :
> 
> 
> On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
>> It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.
>>
>> The only caveat is that amdgpu_res_cleared() return value is only valid
>> right after allocation.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  9 +--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 86 ++++------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 -
>>   3 files changed, 18 insertions(+), 80 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 4a69324bb730..410e9b68ff81 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -723,15 +723,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>   
>>   	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>> -		struct dma_fence *fence;
>> -
>> -		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>> +		r = amdgpu_fill_buffer(NULL, bo, 0, NULL,
>> +				       NULL, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>   		if (unlikely(r))
>>   			goto fail_unreserve;
>> -
>> -		dma_resv_add_fence(bo->tbo.base.resv, fence,
>> -				   DMA_RESV_USAGE_KERNEL);
>> -		dma_fence_put(fence);
>>   	}
>>   	if (!bp->resv)
>>   		amdgpu_bo_unreserve(bo);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index d88bdb2ac083..1f553c56f31d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -2412,75 +2412,6 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
>>   	return 0;
>>   }
>>   
>> -/**
>> - * amdgpu_ttm_clear_buffer - clear memory buffers
>> - * @bo: amdgpu buffer object
>> - * @resv: reservation object
>> - * @fence: dma_fence associated with the operation
>> - *
>> - * Clear the memory buffer resource.
>> - *
>> - * Returns:
>> - * 0 for success or a negative error code on failure.
>> - */
>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> -			    struct dma_resv *resv,
>> -			    struct dma_fence **fence)
>> -{
>> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
>> -	struct amdgpu_ttm_entity *entity;
>> -	struct amdgpu_res_cursor cursor;
>> -	u64 addr;
>> -	int r = 0;
>> -
>> -	if (!adev->mman.buffer_funcs_enabled)
>> -		return -EINVAL;
>> -
>> -	if (!fence)
>> -		return -EINVAL;
>> -	entity = &adev->mman.clear_entities[0];
>> -	*fence = dma_fence_get_stub();
>> -
>> -	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>> -
>> -	mutex_lock(&entity->gart_window_lock);
>> -	while (cursor.remaining) {
>> -		struct dma_fence *next = NULL;
>> -		u64 size;
>> -
>> -		if (amdgpu_res_cleared(&cursor)) {
>> -			amdgpu_res_next(&cursor, cursor.size);
>> -			continue;
>> -		}
>> -
>> -		/* Never clear more than 256MiB at once to avoid timeouts */
>> -		size = min(cursor.size, 256ULL << 20);
>> -
>> -		r = amdgpu_ttm_map_buffer(&entity->base,
>> -					  &bo->tbo, bo->tbo.resource, &cursor,
>> -					  entity->gart_window_id1, ring, false, &size, &addr,
>> -					  NULL, NULL);
>> -		if (r)
>> -			goto err;
>> -
>> -		r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
>> -					&next, true,
>> -					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>> -		if (r)
>> -			goto err;
>> -
>> -		dma_fence_put(*fence);
>> -		*fence = next;
>> -
>> -		amdgpu_res_next(&cursor, size);
>> -	}
>> -err:
>> -	mutex_unlock(&entity->gart_window_lock);
>> -
>> -	return r;
>> -}
>> -
>>   /**
>>    * amdgpu_fill_buffer - fill a buffer with a given value
>>    * @entity: optional entity to use. If NULL, the clearing entities will be
>> @@ -2508,6 +2439,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   	struct amdgpu_res_cursor dst;
>>   	uint64_t cur_size, to;
>>   	int r, e, n_fences;
> 
>> +	/* The clear flag is only valid directly after allocation. */
>> +	bool consider_clear_flag =
>> +		src_data == 0 && k_job_id == AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER;
> 
> Absolutely clear NAK to that.

I suppose the NAK applies to the check, not the general idea of the patch?
In that case, would passing "bool consider_clear_flag" as a parameter be ok ?

Pierre-Eric

> 
> Christian.
> 
>>   
>>   	/* The fences will be either added to the resv object or the last fence
>>   	 * will be returned to the caller. In the latter case, all fill jobs will
>> @@ -2531,6 +2465,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   		while (dst.remaining) {
>>   			cur_size = min(dst.size, 256ULL << 20);
>>   
>> +			if (consider_clear_flag && amdgpu_res_cleared(&dst)) {
>> +				amdgpu_res_next(&dst, dst.size);
>> +				continue;
>> +			}
>> +
>>   			n_fences += 1;
>>   			amdgpu_res_next(&dst, cur_size);
>>   		}
>> @@ -2550,6 +2489,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>>   
>>   	while (dst.remaining) {
>> +		if (consider_clear_flag && amdgpu_res_cleared(&dst)) {
>> +			amdgpu_res_next(&dst, dst.size);
>> +			continue;
>> +		}
>> +
>>   		/* Never fill more than 256MiB at once to avoid timeouts */
>>   		cur_size = min(dst.size, 256ULL << 20);
>>   
>> @@ -2574,8 +2518,10 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   			goto error;
>>   		}
>>   
>> +
>>   		r = amdgpu_ttm_fill_mem(ring, &entity->base,
>> -					src_data, to, cur_size, resv,
>> +					src_data, to, cur_size,
>> +					resv,
>>   					&fence, true, k_job_id);
>>   		if (r) {
>>   			mutex_unlock(&entity->gart_window_lock);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index c059a3d52b57..97e73919cb0c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -182,9 +182,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>>   		       struct dma_resv *resv,
>>   		       struct dma_fence **fence,
>>   		       bool vm_needs_flush, uint32_t copy_flags);
>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> -			    struct dma_resv *resv,
>> -			    struct dma_fence **fence);
>>   int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>   		       struct amdgpu_bo *bo,
>>   		       uint32_t src_data,
