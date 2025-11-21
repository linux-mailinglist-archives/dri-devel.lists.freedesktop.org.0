Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91E4C7AB97
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89B010E8DE;
	Fri, 21 Nov 2025 16:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="USRTqQQg";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="kfPxFMQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B5710E8DD;
 Fri, 21 Nov 2025 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763741362;
 bh=FRWvVzSKJMuGfDpQNoOIoOI
 jcneqvZgZqTFYJp4llyw=; b=USRTqQQgB2bDrPkfrhCTf98ItEdmdzcOsiBirmxG9rWFvlos9r
 x/aip1ntlS7fYdmwHiduXsKmC9EdtUIW5fuOf8x1NWzWuYpb2XoPus6pAL1rv3XBPxy9kj1m4Hb
 r0RXufGSyXxyANvWbSJC9baKFbRMHnVkUrWgRpQ/VXXYj2yTB9jXydcE7wbx8jhlL5Vqyb5np/x
 nUuDk1SPJTmvhnM86lmCf8xo8Cf1NKK8Y+V/hjaRYra1x/hgVHli7umG9jYuR3/TodmlW2nJGZZ
 dI5N4QTTiP5GoJgO3sTRMfM/6/z1haIbIR5n+UIV4vwW3Co08f2D5q/HmpsAPQZYvLw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763741362; bh=FRWvVzSKJMuGfDpQNoOIoOI
 jcneqvZgZqTFYJp4llyw=; b=kfPxFMQFF3aOek76vGtBq/MP80LRBQxNzRc5UKbBG6PNVT9XoN
 REGFzHScGXCBOWImiRf4F9P/f+8ijxBIA6Dg==;
Message-ID: <cb1c8db1-22f9-4722-ba53-a53c3893df80@damsy.net>
Date: Fri, 21 Nov 2025 17:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/28] drm/amdgpu: add amdgpu_device argument to ttm
 functions that need it
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-11-pierre-eric.pelloux-prayer@amd.com>
 <3708bb5d-6b3f-4817-a25a-5a7b90918d0c@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <3708bb5d-6b3f-4817-a25a-5a7b90918d0c@amd.com>
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



Le 21/11/2025 à 14:24, Christian König a écrit :
> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>> Instead of getting it through amdgpu_ttm_adev(bo->tbo.bdev).
> 
> Why should that be a good idea?

IMO explicit parameters are clearer than implicit ones so if these functions 
depends on adev, they might as well get it as an argument instead of fishing it 
from one of their other arguments.

But if you prefer to keep the existing code I can drop this patch.

Pierre-Eric


> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  5 +++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 11 ++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 ++++--
>>   3 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 858eb9fa061b..2ee48f76483d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -725,7 +725,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>   		struct dma_fence *fence;
>>   
>> -		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>> +		r = amdgpu_ttm_clear_buffer(adev, bo, bo->tbo.base.resv, &fence);
>>   		if (unlikely(r))
>>   			goto fail_unreserve;
>>   
>> @@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>   	if (r)
>>   		goto out;
>>   
>> -	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
>> +	r = amdgpu_fill_buffer(adev,
>> +			       &adev->mman.clear_entity, abo, 0, &bo->base._resv,
>>   			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>>   	if (WARN_ON(r))
>>   		goto out;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 1d3afad885da..57dff2df433b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -414,7 +414,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>   	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>   		struct dma_fence *wipe_fence = NULL;
>>   
>> -		r = amdgpu_fill_buffer(&adev->mman.move_entity,
>> +		r = amdgpu_fill_buffer(adev, &adev->mman.move_entity,
>>   				       abo, 0, NULL, &wipe_fence,
>>   				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>>   		if (r) {
>> @@ -2350,6 +2350,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>>   
>>   /**
>>    * amdgpu_ttm_clear_buffer - clear memory buffers
>> + * @adev: amdgpu device object
>>    * @bo: amdgpu buffer object
>>    * @resv: reservation object
>>    * @fence: dma_fence associated with the operation
>> @@ -2359,11 +2360,11 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>>    * Returns:
>>    * 0 for success or a negative error code on failure.
>>    */
>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> +int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>> +			    struct amdgpu_bo *bo,
>>   			    struct dma_resv *resv,
>>   			    struct dma_fence **fence)
>>   {
>> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   	struct amdgpu_res_cursor cursor;
>>   	u64 addr;
>>   	int r = 0;
>> @@ -2414,14 +2415,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   	return r;
>>   }
>>   
>> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>> +int amdgpu_fill_buffer(struct amdgpu_device *adev,
>> +		       struct amdgpu_ttm_buffer_entity *entity,
>>   		       struct amdgpu_bo *bo,
>>   		       uint32_t src_data,
>>   		       struct dma_resv *resv,
>>   		       struct dma_fence **f,
>>   		       u64 k_job_id)
>>   {
>> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   	struct dma_fence *fence = NULL;
>>   	struct amdgpu_res_cursor dst;
>>   	int r;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 9288599c9c46..d0f55a7edd30 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -174,10 +174,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>>   		       struct dma_resv *resv,
>>   		       struct dma_fence **fence,
>>   		       bool vm_needs_flush, uint32_t copy_flags);
>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> +int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>> +			    struct amdgpu_bo *bo,
>>   			    struct dma_resv *resv,
>>   			    struct dma_fence **fence);
>> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>> +int amdgpu_fill_buffer(struct amdgpu_device *adev,
>> +		       struct amdgpu_ttm_buffer_entity *entity,
>>   		       struct amdgpu_bo *bo,
>>   		       uint32_t src_data,
>>   		       struct dma_resv *resv,
