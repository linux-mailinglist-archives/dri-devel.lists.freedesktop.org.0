Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE00C633E8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8556010E1BA;
	Mon, 17 Nov 2025 09:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="CR7cYvxy";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="ZkjwU13M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016DA10E1AC;
 Mon, 17 Nov 2025 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1763372494;
 bh=tZyjpRjqVL8yfwrKzqGoDcL
 IqlFDWPsEqZsZJ0ZWPH8=; b=CR7cYvxy1wE2CiVFt5zbm/EupYZ1xba7FeCqio/8W8zkVxoHGX
 FJngkQSWuDJUdgR1+em+xoxhWSER2u49kK9dlwC51uAP0IMrtZHUG0MLcdwJkT9WfeoXtOJ/GPJ
 j5/suZ0vYnwnH7j/MI/GkL+RvYCuMiLXaZM2Zv+Y9iVJyKPE8c7a9GcMIE3qdzJ+XPAApy4R43O
 t9IcvDmvyQB5rpiGIkwxAJvTf4qLvxpKeFlqCHbchG6ZoCKeNF0ZKxnTDCmdBtYR4nYjj5dKyi5
 jtz89tC855XtXlUZsHnUWyYr8hLG/iAYy0Fh7kx8yeU1VCgTs9zFIj2KcpZIc5waNYw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1763372494; bh=tZyjpRjqVL8yfwrKzqGoDcL
 IqlFDWPsEqZsZJ0ZWPH8=; b=ZkjwU13MeW6Pk4fgPiHj1ynGHJ1JaKwkVa1gUR+yvSVZw3REkc
 /VA6QIJg3Ogz5S7829ykDWDqTpkqZ6G4V0Cw==;
Message-ID: <af143686-e509-4be3-892d-c5382524f7f2@damsy.net>
Date: Mon, 17 Nov 2025 10:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/20] drm/amdgpu: pass the entity to use to ttm
 functions
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-6-pierre-eric.pelloux-prayer@amd.com>
 <6469a0ce-89d9-42ad-867b-1d8094293e44@amd.com>
 <1ef63068-1352-4e8a-abea-bfad5f7a2198@damsy.net>
Content-Language: en-US
In-Reply-To: <1ef63068-1352-4e8a-abea-bfad5f7a2198@damsy.net>
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



Le 14/11/2025 à 15:41, Pierre-Eric Pelloux-Prayer a écrit :
> 
> 
> Le 14/11/2025 à 14:07, Christian König a écrit :
>> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>>> This way the caller can select the one it wants to use.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 75 +++++++++++--------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 ++--
>>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>>>   5 files changed, 60 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/ 
>>> amd/amdgpu/amdgpu_benchmark.c
>>> index 02c2479a8840..b59040a8771f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>>> @@ -38,7 +38,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device 
>>> *adev, unsigned size,
>>>       stime = ktime_get();
>>>       for (i = 0; i < n; i++) {
>>>           struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> -        r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
>>> +        r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
>>> +                       saddr, daddr, size, NULL, &fence,
>>>                          false, 0);
>>>           if (r)
>>>               goto exit_do_move;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/ 
>>> amd/amdgpu/amdgpu_object.c
>>> index e08f58de4b17..c06c132a753c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -1321,8 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object 
>>> *bo)
>>>       if (r)
>>>           goto out;
>>> -    r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
>>> -                   AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>>> +    r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
>>> +                   &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>>>       if (WARN_ON(r))
>>>           goto out;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/ 
>>> amdgpu/amdgpu_ttm.c
>>> index 42d448cd6a6d..c8d59ca2b3bd 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -164,6 +164,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>>>   /**
>>>    * amdgpu_ttm_map_buffer - Map memory into the GART windows
>>> + * @entity: entity to run the window setup job
>>>    * @bo: buffer object to map
>>>    * @mem: memory object to map
>>>    * @mm_cur: range to map
>>> @@ -176,7 +177,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>>>    * Setup one of the GART windows to access a specific piece of memory or 
>>> return
>>>    * the physical address for local memory.
>>>    */
>>> -static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>> +static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>>> +                 struct ttm_buffer_object *bo,
>>
>>
>> Probably better to split this patch into multiple patches.
>>
>> One which changes amdgpu_ttm_map_buffer() and then another one or two for the 
>> higher level copy_buffer and fill_buffer functions.
> 
> OK.
> 
>>
>>>                    struct ttm_resource *mem,
>>>                    struct amdgpu_res_cursor *mm_cur,
>>>                    unsigned int window, struct amdgpu_ring *ring,
>>> @@ -224,7 +226,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object 
>>> *bo,
>>>       num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>>>       num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>>> -    r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>>> +    r = amdgpu_job_alloc_with_ib(adev, entity,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        num_dw * 4 + num_bytes,
>>>                        AMDGPU_IB_POOL_DELAYED, &job,
>>> @@ -274,6 +276,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object 
>>> *bo,
>>>   /**
>>>    * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
>>>    * @adev: amdgpu device
>>> + * @entity: entity to run the jobs
>>>    * @src: buffer/address where to read from
>>>    * @dst: buffer/address where to write to
>>>    * @size: number of bytes to copy
>>> @@ -288,6 +291,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object 
>>> *bo,
>>>    */
>>>   __attribute__((nonnull))
>>>   static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>> +                      struct drm_sched_entity *entity,
>>>                         const struct amdgpu_copy_mem *src,
>>>                         const struct amdgpu_copy_mem *dst,
>>>                         uint64_t size, bool tmz,
>>> @@ -320,12 +324,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct 
>>> amdgpu_device *adev,
>>>           cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>>>           /* Map src to window 0 and dst to window 1. */
>>> -        r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
>>> +        r = amdgpu_ttm_map_buffer(entity,
>>> +                      src->bo, src->mem, &src_mm,
>>>                         0, ring, tmz, &cur_size, &from);
>>>           if (r)
>>>               goto error;
>>> -        r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
>>> +        r = amdgpu_ttm_map_buffer(entity,
>>> +                      dst->bo, dst->mem, &dst_mm,
>>>                         1, ring, tmz, &cur_size, &to);
>>>           if (r)
>>>               goto error;
>>> @@ -353,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct 
>>> amdgpu_device *adev,
>>>                                    write_compress_disable));
>>>           }
>>> -        r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
>>> +        r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
>>>                          &next, true, copy_flags);
>>>           if (r)
>>>               goto error;
>>> @@ -394,7 +400,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>       src.offset = 0;
>>>       dst.offset = 0;
>>> -    r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
>>> +    r = amdgpu_ttm_copy_mem_to_mem(adev,
>>> +                       &adev->mman.move_entity.base,
>>> +                       &src, &dst,
>>>                          new_mem->size,
>>>                          amdgpu_bo_encrypted(abo),
>>>                          bo->base.resv, &fence);
>>> @@ -406,8 +414,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>           (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>>           struct dma_fence *wipe_fence = NULL;
>>> -        r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>>> -                       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>>> +        r = amdgpu_fill_buffer(&adev->mman.move_entity,
>>> +                       abo, 0, NULL, &wipe_fence,
>>> +                       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>>>           if (r) {
>>>               goto error;
>>>           } else if (wipe_fence) {
>>> @@ -2223,16 +2232,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct 
>>> amdgpu_device *adev, bool enable)
>>>   }
>>>   static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>>> +                  struct drm_sched_entity *entity,
>>>                     unsigned int num_dw,
>>>                     struct dma_resv *resv,
>>>                     bool vm_needs_flush,
>>>                     struct amdgpu_job **job,
>>> -                  bool delayed, u64 k_job_id)
>>> +                  u64 k_job_id)
>>>   {
>>>       enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>>>       int r;
>>> -    struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
>>> -                            &adev->mman.move_entity.base;
>>>       r = amdgpu_job_alloc_with_ib(adev, entity,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        num_dw * 4, pool, job, k_job_id);
>>> @@ -2252,7 +2260,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device 
>>> *adev,
>>>                              DMA_RESV_USAGE_BOOKKEEP);
>>>   }
>>> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>> +int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>>> +               struct drm_sched_entity *entity,
>>> +               uint64_t src_offset,
>>>                  uint64_t dst_offset, uint32_t byte_count,
>>>                  struct dma_resv *resv,
>>>                  struct dma_fence **fence,
>>> @@ -2274,8 +2284,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, 
>>> uint64_t src_offset,
>>>       max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>>>       num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>>>       num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>>> -    r = amdgpu_ttm_prepare_job(adev, num_dw,
>>> -                   resv, vm_needs_flush, &job, false,
>>> +    r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
>>> +                   resv, vm_needs_flush, &job,
>>>                      AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>>>       if (r)
>>>           return r;
>>> @@ -2304,11 +2314,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, 
>>> uint64_t src_offset,
>>>       return r;
>>>   }
>>> -static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>> +static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
>>> +                   struct drm_sched_entity *entity,
>>> +                   uint32_t src_data,
>>>                      uint64_t dst_addr, uint32_t byte_count,
>>>                      struct dma_resv *resv,
>>>                      struct dma_fence **fence,
>>> -                   bool vm_needs_flush, bool delayed,
>>> +                   bool vm_needs_flush,
>>>                      u64 k_job_id)
>>>   {
>>>       struct amdgpu_device *adev = ring->adev;
>>> @@ -2321,8 +2333,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring 
>>> *ring, uint32_t src_data,
>>>       max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
>>>       num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>>>       num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>>> -    r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
>>> -                   &job, delayed, k_job_id);
>>> +    r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
>>> +                   vm_needs_flush, &job, k_job_id);
>>>       if (r)
>>>           return r;
>>> @@ -2386,13 +2398,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>           /* Never clear more than 256MiB at once to avoid timeouts */
>>>           size = min(cursor.size, 256ULL << 20);
>>> -        r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
>>> +        r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
>>> +                      &bo->tbo, bo->tbo.resource, &cursor,
>>>                         1, ring, false, &size, &addr);
>>>           if (r)
>>>               goto err;
>>> -        r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>>> -                    &next, true, true,
>>> +        r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, 
>>> addr, size, resv,
>>> +                    &next, true,
>>>                       AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>>           if (r)
>>>               goto err;
>>> @@ -2408,12 +2421,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>       return r;
>>>   }
>>> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>> -            uint32_t src_data,
>>> -            struct dma_resv *resv,
>>> -            struct dma_fence **f,
>>> -            bool delayed,
>>> -            u64 k_job_id)
>>> +int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>> +               struct amdgpu_bo *bo,
>>> +               uint32_t src_data,
>>> +               struct dma_resv *resv,
>>> +               struct dma_fence **f,
>>> +               u64 k_job_id)
>>>   {
>>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> @@ -2437,13 +2450,15 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>           /* Never fill more than 256MiB at once to avoid timeouts */
>>>           cur_size = min(dst.size, 256ULL << 20);
>>> -        r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
>>> +        r = amdgpu_ttm_map_buffer(&entity->base,
>>> +                      &bo->tbo, bo->tbo.resource, &dst,
>>>                         1, ring, false, &cur_size, &to);
>>>           if (r)
>>>               goto error;
>>> -        r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
>>> -                    &next, true, delayed, k_job_id);
>>> +        r = amdgpu_ttm_fill_mem(ring, &entity->base,
>>> +                    src_data, to, cur_size, resv,
>>> +                    &next, true, k_job_id);
>>>           if (r)
>>>               goto error;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/ 
>>> amdgpu/amdgpu_ttm.h
>>> index d2295d6c2b67..e1655f86a016 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
>>>   void amdgpu_ttm_fini(struct amdgpu_device *adev);
>>>   void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>>>                       bool enable);
>>> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>> +int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>>> +               struct drm_sched_entity *entity,
>>
>> If I'm not completely mistaken you should be able to drop the ring argument 
>> since that can be determined from the entity.
> 
> OK will do.
> 

AFAIU the only way to get the ring from the entity is to get it from the 
drm_gpu_scheduler pointer. This would require adding a new function:

struct drm_gpu_scheduler *
drm_sched_entity_get_scheduler(struct drm_sched_entity *entity) {
    struct drm_gpu_scheduler *sched;
    spin_lock(&entity->lock);
    if (entity->rq)
        sched = entity->rq->sched;
    spin_unlock(&entity->lock);
    return sched;
}

Alternatively, I can access the ring from the buffer_funcs_ring / 
buffer_funcs_sched stored in amdgpu_mman.

What do you think?


Thanks,
Pierre-Eric

> 
> 
>>
>> Apart from that looks rather good to me.
>>
>> Regards,
>> Christian.
>>
>>> +               uint64_t src_offset,
>>>                  uint64_t dst_offset, uint32_t byte_count,
>>>                  struct dma_resv *resv,
>>>                  struct dma_fence **fence,
>>> @@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, 
>>> uint64_t src_offset,
>>>   int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>                   struct dma_resv *resv,
>>>                   struct dma_fence **fence);
>>> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>> -            uint32_t src_data,
>>> -            struct dma_resv *resv,
>>> -            struct dma_fence **fence,
>>> -            bool delayed,
>>> -            u64 k_job_id);
>>> +int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>> +               struct amdgpu_bo *bo,
>>> +               uint32_t src_data,
>>> +               struct dma_resv *resv,
>>> +               struct dma_fence **f,
>>> +               u64 k_job_id);
>>>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>>>   void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/ 
>>> amdkfd/kfd_migrate.c
>>> index d74ff6e90590..09756132fa1b 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> @@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, 
>>> dma_addr_t *sys,
>>>               goto out_unlock;
>>>           }
>>> -        r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
>>> +        r = amdgpu_copy_buffer(ring, &entity->base,
>>> +                       gart_s, gart_d, size * PAGE_SIZE,
>>>                          NULL, &next, true, 0);
>>>           if (r) {
>>>               dev_err(adev->dev, "fail %d to copy memory\n", r);
