Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C44C351C9
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975FA10E2B7;
	Wed,  5 Nov 2025 10:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="KGxqcmcD";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="qtLmukZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B4510E196;
 Wed,  5 Nov 2025 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762338897;
 bh=bqBYiyWlxDUdnNgsJSqCOZI
 JNIvP50J9OOyodzXZMwQ=; b=KGxqcmcDC/391Gski64qeDuNQXYPK0klHiQ6IU5cijMXPgIytf
 OqEGwxDf48QDcxq0VHVhewrysaV33hQ/UYYxsENvuvVhf0XY99YCa0upcyEK8hQMHGeIHaUB/Br
 Xhx1Q7bjVHj1SpLeQhaZ0EKmXP2o/BgPRgrfFrSefUB10Mf8ZqkQCcA6jieFVB6QDcTwVPwwuJ5
 ech9aPTMzMbx8q7bMw5tl4IcnbtZovHYvy3iu90ElQhnydoYAOw+rHzLkIJjL32ROA+zD6eymGO
 BhPVV42lIm4TUGH/c6/1EZuKBgqDQ0kNxhb018+zNucHraUSg3G0U7qXm9UNcW3wq+A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762338897; bh=bqBYiyWlxDUdnNgsJSqCOZI
 JNIvP50J9OOyodzXZMwQ=; b=qtLmukZvlE5csXU0v+0rrz6psZY9zFMr/pFXe28NibTMUSMaPl
 bNMt/xHjnuzYZl1fUg49oVa9LiTlMlt0U+BA==;
Message-ID: <5bf372ea-40ef-4b07-be13-53451828d3e1@damsy.net>
Date: Wed, 5 Nov 2025 11:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/20] drm/ttm: rework pipelined eviction fence handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-3-pierre-eric.pelloux-prayer@amd.com>
 <13f0cda3-baae-42a4-a7c6-1fdd774bb5d2@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <13f0cda3-baae-42a4-a7c6-1fdd774bb5d2@amd.com>
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



Le 04/11/2025 à 15:12, Christian König a écrit :
> On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
>> Until now ttm stored a single pipelined eviction fence which means
>> drivers had to use a single entity for these evictions.
>>
>> To lift this requirement, this commit allows up to 8 entities to
>> be used.
>>
>> Ideally a dma_resv object would have been used as a container of
>> the eviction fences, but the locking rules makes it complex.
>> dma_resv all have the same ww_class, which means "Attempting to
>> lock more mutexes after ww_acquire_done." is an error.
>>
>> One alternative considered was to introduced a 2nd ww_class for
>> specific resv to hold a single "transient" lock (= the resv lock
>> would only be held for a short period, without taking any other
>> locks).
>>
>> The other option, is to statically reserve a fence array, and
>> extend the existing code to deal with N fences, instead of 1.
>>
>> The driver is still responsible to reserve the correct number
>> of fence slots.
>>
>> Lastly ttm_resource_manager.pipelined_eviction.n_fences is
>> initialized to 1, so the new behavior is opt-in.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  8 ++-
>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 13 +++--
>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c                  | 56 ++++++++++++-------
>>   drivers/gpu/drm/ttm/ttm_bo_util.c             | 36 ++++++++++--
>>   drivers/gpu/drm/ttm/ttm_resource.c            | 45 ++++++++++-----
>>   include/drm/ttm/ttm_resource.h                | 34 ++++++++---
>>   7 files changed, 139 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 326476089db3..c66f00434991 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -2156,7 +2156,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   {
>>   	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>>   	uint64_t size;
>> -	int r;
>> +	int r, i;
>>   
>>   	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>>   	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
>> @@ -2190,8 +2190,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   	} else {
>>   		drm_sched_entity_destroy(&adev->mman.high_pr);
>>   		drm_sched_entity_destroy(&adev->mman.low_pr);
>> -		dma_fence_put(man->move);
>> -		man->move = NULL;
>> +		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
>> +			dma_fence_put(man->pipelined_eviction.fences[i]);
>> +			man->pipelined_eviction.fences[i] = NULL;
>> +		}
>>   	}
>>   
>>   	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> index 3148f5d3dbd6..1396674e1923 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> @@ -651,7 +651,8 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>>   	int err;
>>   
>>   	man = ttm_manager_type(priv->ttm_dev, mem_type);
>> -	man->move = dma_fence_get_stub();
>> +	man->pipelined_eviction.n_fences = 1;
>> +	man->pipelined_eviction.fences[0] = dma_fence_get_stub();
>>   
>>   	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
>>   	bo->type = bo_type;
>> @@ -668,7 +669,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>>   	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>>   
>>   	ttm_bo_put(bo);
>> -	dma_fence_put(man->move);
>> +	dma_fence_put(man->pipelined_eviction.fences[0]);
>>   }
>>   
>>   static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
>> @@ -732,9 +733,10 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>>   
>>   	spin_lock_init(&fence_lock);
>>   	man = ttm_manager_type(priv->ttm_dev, fst_mem);
>> -	man->move = alloc_mock_fence(test);
>> +	man->pipelined_eviction.n_fences = 1;
>> +	man->pipelined_eviction.fences[0] = alloc_mock_fence(test);
>>   
>> -	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
>> +	task = kthread_create(threaded_fence_signal, man->pipelined_eviction.fences[0], "move-fence-signal");
>>   	if (IS_ERR(task))
>>   		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
>>   
>> @@ -742,7 +744,8 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>>   	err = ttm_bo_validate(bo, placement_val, &ctx_val);
>>   	dma_resv_unlock(bo->base.resv);
>>   
>> -	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
>> +	dma_fence_wait_timeout(man->pipelined_eviction.fences[0], false, MAX_SCHEDULE_TIMEOUT);
>> +	man->pipelined_eviction.fences[0] = NULL;
>>   
>>   	KUNIT_EXPECT_EQ(test, err, 0);
>>   	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>> index e6ea2bd01f07..6dfdf759a491 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>> @@ -207,6 +207,7 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>>   	struct ttm_resource_test_priv *priv = test->priv;
>>   	struct ttm_resource_manager *man;
>>   	size_t size = SZ_16K;
>> +	int i;
>>   
>>   	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>   	KUNIT_ASSERT_NOT_NULL(test, man);
>> @@ -216,8 +217,8 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>>   	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>>   	KUNIT_ASSERT_EQ(test, man->size, size);
>>   	KUNIT_ASSERT_EQ(test, man->usage, 0);
>> -	KUNIT_ASSERT_NULL(test, man->move);
>> -	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
>> +	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
>> +		KUNIT_ASSERT_NULL(test, man->pipelined_eviction.fences[i]);
>>   
>>   	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>   		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index f4d9e68b21e7..bc6d4a6c6d70 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -658,34 +658,48 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>>   EXPORT_SYMBOL(ttm_bo_unpin);
>>   
>>   /*
>> - * Add the last move fence to the BO as kernel dependency and reserve a new
>> - * fence slot.
>> + * Add the pipelined eviction fencesto the BO as kernel dependency and reserve new
>> + * fence slots.
>>    */
>> -static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>> -				 struct ttm_resource_manager *man,
>> -				 bool no_wait_gpu)
>> +static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
>> +						struct ttm_resource_manager *man,
>> +						bool no_wait_gpu)
>>   {
>> +	struct dma_fence *fences_to_add[TTM_FENCES_MAX_SLOT_COUNT] = {};
>>   	struct dma_fence *fence;
>> -	int ret;
>> +	bool all_signaled = true, signaled;
>> +	int i, n = 0;
>>   
>> -	spin_lock(&man->move_lock);
>> -	fence = dma_fence_get(man->move);
>> -	spin_unlock(&man->move_lock);
>> +	spin_lock(&man->pipelined_eviction.lock);
>> +	for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
>> +		fence = man->pipelined_eviction.fences[i];
> 
>> +		if (!fence)
>> +			continue;
>> +		signaled = dma_fence_is_signaled(fence);
>>   
>> -	if (!fence)
>> +		if (signaled) {
>> +			dma_fence_put(man->pipelined_eviction.fences[i]);
>> +			man->pipelined_eviction.fences[i] = NULL;
> 
> Please completely drop that, only check if the fences are signaled when the no_wait_gpu flag is set.

ok.

> 
>> +		} else {
>> +			all_signaled = false;
>> +			if (no_wait_gpu) {
>> +				spin_unlock(&man->pipelined_eviction.lock);
>> +				return -EBUSY;
>> +			}
>> +			fences_to_add[n++] = dma_fence_get(fence);
>> +		}
>> +	}
>> +	spin_unlock(&man->pipelined_eviction.lock);
>> +
>> +	if (all_signaled)
>>   		return 0;
>>   
>> -	if (no_wait_gpu) {
>> -		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
>> -		dma_fence_put(fence);
>> -		return ret;
>> +	for (i = 0; i < n; i++) {
>> +		dma_resv_add_fence(bo->base.resv, fences_to_add[i], DMA_RESV_USAGE_KERNEL);
>> +		dma_fence_put(fences_to_add[i]);
>>   	}
>>   
>> -	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>> -
>> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
>> -	dma_fence_put(fence);
>> -	return ret;
>> +	return dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
> 
> Please separate out a patch where the call to dma_resv_reserve_fences() is removed here.

Can you remind me why it's not needed?

> 
>>   }
>>   
>>   /**
>> @@ -718,7 +732,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>>   	int i, ret;
>>   
>>   	ticket = dma_resv_locking_ctx(bo->base.resv);
>> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
>> +	ret = dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>>   	if (unlikely(ret))
>>   		return ret;
>>   
>> @@ -757,7 +771,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>>   				return ret;
>>   		}
>>   
>> -		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>> +		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
>>   		if (unlikely(ret)) {
>>   			ttm_resource_free(bo, res);
>>   			if (ret == -EBUSY)
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index acbbca9d5c92..ada8af965acf 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>>   	ret = dma_resv_trylock(&fbo->base.base._resv);
>>   	WARN_ON(!ret);
>>   
>> -	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
>> +	ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_FENCES_MAX_SLOT_COUNT);
>>   	if (ret) {
>>   		dma_resv_unlock(&fbo->base.base._resv);
>>   		kfree(fbo);
>> @@ -646,6 +646,8 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>>   {
>>   	struct ttm_device *bdev = bo->bdev;
>>   	struct ttm_resource_manager *from;
>> +	struct dma_fence *tmp;
>> +	int i, free_slot = -1;
>>   
>>   	from = ttm_manager_type(bdev, bo->resource->mem_type);
>>   
>> @@ -653,13 +655,35 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>>   	 * BO doesn't have a TTM we need to bind/unbind. Just remember
>>   	 * this eviction and free up the allocation
>>   	 */
>> -	spin_lock(&from->move_lock);
>> -	if (!from->move || dma_fence_is_later(fence, from->move)) {
>> -		dma_fence_put(from->move);
>> -		from->move = dma_fence_get(fence);
>> +	spin_lock(&from->pipelined_eviction.lock);
>> +	for (i = 0; i < from->pipelined_eviction.n_fences; i++) {
>> +		tmp = from->pipelined_eviction.fences[i];
>> +		if (!tmp) {
>> +			if (free_slot < 0)
>> +				free_slot = i;
>> +			continue;
> 
> Just break here.

The logic here is to reuse context slots. Even if slot 0 is empty, I need to use 
slot 1 if slot 1's context is the same as fence->context.

This way, we're guaranteed to find a slot for all contexts used by the driver.

> 
>> +		}
>> +		if (fence->context != tmp->context)
>> +			continue;
>> +		if (dma_fence_is_later(fence, tmp)) {
>> +			dma_fence_put(tmp);
>> +			free_slot = i;
>> +			break;
>> +		}
>> +		goto unlock;
>> +	}
>> +	if (free_slot >= 0) {
> 
> Drop free_slot and check i here.
> 
>> +		from->pipelined_eviction.fences[free_slot] = dma_fence_get(fence);
>> +	} else {
>> +		WARN(1, "not enough fence slots for all fence contexts");
>> +		spin_unlock(&from->pipelined_eviction.lock);
>> +		dma_fence_wait(fence, false);
>> +		goto end;
>>   	}
>> -	spin_unlock(&from->move_lock);
>>   
>> +unlock:
>> +	spin_unlock(&from->pipelined_eviction.lock);
>> +end:
>>   	ttm_resource_free(bo, &bo->resource);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index e2c82ad07eb4..ae0d4621cc55 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -523,14 +523,19 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>   {
>>   	unsigned i;
>>   
>> -	spin_lock_init(&man->move_lock);
>>   	man->bdev = bdev;
>>   	man->size = size;
>>   	man->usage = 0;
>>   
>>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>   		INIT_LIST_HEAD(&man->lru[i]);
>> -	man->move = NULL;
>> +	spin_lock_init(&man->pipelined_eviction.lock);
>> +	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
>> +		man->pipelined_eviction.fences[i] = NULL;
>> +	/* Can be overridden by drivers that wants to use more than 1 entity
>> +	 * for moves and evictions (limited to TTM_FENCES_MAX_SLOT_COUNT).
>> +	 */
>> +	man->pipelined_eviction.n_fences = 1;
>>   }
>>   EXPORT_SYMBOL(ttm_resource_manager_init);
>>   
>> @@ -551,7 +556,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>   		.no_wait_gpu = false,
>>   	};
>>   	struct dma_fence *fence;
>> -	int ret;
>> +	int ret, i;
>>   
>>   	do {
>>   		ret = ttm_bo_evict_first(bdev, man, &ctx);
>> @@ -561,18 +566,32 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>   	if (ret && ret != -ENOENT)
>>   		return ret;
>>   
>> -	spin_lock(&man->move_lock);
>> -	fence = dma_fence_get(man->move);
>> -	spin_unlock(&man->move_lock);
>> +	ret = 0;
>>   
>> -	if (fence) {
>> -		ret = dma_fence_wait(fence, false);
>> -		dma_fence_put(fence);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	do {
>> +		fence = NULL;
>>   
>> -	return 0;
>> +		spin_lock(&man->pipelined_eviction.lock);
>> +		for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
>> +			fence = man->pipelined_eviction.fences[i];
> 
>> +			man->pipelined_eviction.fences[i] = NULL;
> 
> Drop that. We should never set man->pipelined_eviction.fences to NULL.

Why?

> 
> Potentially even initialize all move fences with a stub fence.
> 
>> +			if (fence)
>> +				break;
>> +		}
>> +		spin_unlock(&man->pipelined_eviction.lock);
>> +
>> +		if (fence) {
>> +			ret = dma_fence_wait(fence, false);
>> +			dma_fence_put(fence);
>> +
>> +			if (ret)
>> +				break;
>> +		} else {
>> +			break;
>> +		}
>> +	} while (1);
>> +
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>>   
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index f49daa504c36..898c429b37ad 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -50,6 +50,15 @@ struct io_mapping;
>>   struct sg_table;
>>   struct scatterlist;
>>   
>> +/**
>> + * define TTM_FENCES_MAX_SLOT_COUNT - How many entities can be used for evictions
>> + *
>> + * Pipelined evictions can be spread on multiple entities. This
>> + * is the max number of entities that can be used by the driver
>> + * for that purpose.
>> + */
>> +#define TTM_FENCES_MAX_SLOT_COUNT 8
> 
> Make that TTM_NUM_MOVE_FENCES.

Ok.

> 
>> +
>>   /**
>>    * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
>>    */
>> @@ -180,8 +189,10 @@ struct ttm_resource_manager_func {
>>    * @size: Size of the managed region.
>>    * @bdev: ttm device this manager belongs to
>>    * @func: structure pointer implementing the range manager. See above
>> - * @move_lock: lock for move fence
>> - * @move: The fence of the last pipelined move operation.
>> + * @pipelined_eviction.lock: lock for eviction fences
>> + * @pipelined_eviction.n_fences: The number of fences allowed in the array. If
>> + * 0, pipelined evictions aren't used.
>> + * @pipelined_eviction.fences: The fences of the last pipelined move operation.
>>    * @lru: The lru list for this memory type.
>>    *
>>    * This structure is used to identify and manage memory types for a device.
>> @@ -195,12 +206,15 @@ struct ttm_resource_manager {
>>   	struct ttm_device *bdev;
>>   	uint64_t size;
>>   	const struct ttm_resource_manager_func *func;
>> -	spinlock_t move_lock;
>>   
>> -	/*
>> -	 * Protected by @move_lock.
>> +	/* This is very similar to a dma_resv object, but locking rules make
>> +	 * it difficult to use a it in this context.
>>   	 */
>> -	struct dma_fence *move;
>> +	struct {
>> +		spinlock_t lock;
>> +		int n_fences;
>> +		struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT];
>> +	} pipelined_eviction;
> 
> Drop the separate structure, just make move an array instead.

IMO pipelined_eviction.fences and pipelined_eviction.lock is clearer when 
reading the code than moves and move_lock but if you prefer I'll switch back to 
the old names.

> 
> And also drop n_fences. Just always take a look at all fences.

OK.

Thanks,
Pierre-Eric

> 
> Regards,
> Christian.
> 
>>   
>>   	/*
>>   	 * Protected by the bdev->lru_lock.
>> @@ -421,8 +435,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
>>   static inline void
>>   ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>>   {
>> -	dma_fence_put(man->move);
>> -	man->move = NULL;
>> +	int i;
>> +
>> +	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
>> +		dma_fence_put(man->pipelined_eviction.fences[i]);
>> +		man->pipelined_eviction.fences[i] = NULL;
>> +	}
>>   }
>>   
>>   void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
