Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B328C6DD54
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AEF10E038;
	Wed, 19 Nov 2025 09:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="UyT4GCMi";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="UXh+Uth6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1286F10E038;
 Wed, 19 Nov 2025 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763546112;
 bh=oGHcwLOlMslChliuqHxaVqK
 bKGrqb7USj2zfYnJUKNg=; b=UyT4GCMiKN4K++U+LfnmA23g2xbPVxXLw4doOjePKCUBlyK6FT
 rx/luBeREiWs8p3qIeOfM7Zfhj9yyNHwqhnasNv/7zzQpRsB3SOTTy1ziwSwpK6dj9QvakOMqoe
 f4kVQTocvf4m/vPbn6sHxuWzWqB3/7akQtEB6DByynqDVOCUObdxH+5nT9tBcTsl8jItcOo4hU2
 yiD1OF8HKvQYufwKlLVDHnXtuS0Q9bOZauahC1V3is0Pm5V5tkAPaXWOBtlqbF+6ubX6YAPesS4
 QcYlYoHQT8VT5SzRlyeWF3EBjrQ0kGHZ+9OxOZkb2Vysu8f/+OdQfloFO6/RaSrsVHw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763546112; bh=oGHcwLOlMslChliuqHxaVqK
 bKGrqb7USj2zfYnJUKNg=; b=UXh+Uth6IjUQ7J8NnEdMuJgCFr/vf6J+IQF2FBRWpGx+kL035j
 Zd/qAdgL295984SkTGFqjuvcBNiRnXEjBmAw==;
Message-ID: <4f42b19a-5382-4da3-83e9-ac156ffebe5c@damsy.net>
Date: Wed, 19 Nov 2025 10:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] drm/amdgpu: statically assign gart windows to
 ttm entities
To: Felix Kuehling <felix.kuehling@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-7-pierre-eric.pelloux-prayer@amd.com>
 <1e503518-01ed-4562-833f-170ee2be5659@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <1e503518-01ed-4562-833f-170ee2be5659@amd.com>
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



Le 14/11/2025 à 21:24, Felix Kuehling a écrit :
> 
> On 2025-11-13 11:05, Pierre-Eric Pelloux-Prayer wrote:
>> If multiple entities share the same window we must make sure
>> that jobs using them are executed sequentially.
>>
>> This commit gives separate window id to each entity, so jobs
>> from multiple entities could execute in parallel if needed.
>> (for now they all use the first sdma engine, so it makes no
>> difference yet).
>>
>> default_entity doesn't get any windows reserved since there is
>> no use for them.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 50 ++++++++++++++----------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  9 +++--
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  8 ++--
>>   4 files changed, 46 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/ 
>> amdgpu/amdgpu_gmc.c
>> index 8e2d41c9c271..2a444d02cf4b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> @@ -686,7 +686,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, 
>> uint32_t vmid,
>>        * translation. Avoid this by doing the invalidation from the SDMA
>>        * itself at least for GART.
>>        */
>> -    mutex_lock(&adev->mman.gtt_window_lock);
>> +    mutex_lock(&adev->mman.clear_entity.gart_window_lock);
>> +    mutex_lock(&adev->mman.move_entity.gart_window_lock);
>>       r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>                        16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>> @@ -699,7 +700,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, 
>> uint32_t vmid,
>>       job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>>       amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>>       fence = amdgpu_job_submit(job);
>> -    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    mutex_unlock(&adev->mman.move_entity.gart_window_lock);
>> +    mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
>>       dma_fence_wait(fence, false);
>>       dma_fence_put(fence);
>> @@ -707,7 +709,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, 
>> uint32_t vmid,
>>       return;
>>   error_alloc:
>> -    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    mutex_unlock(&adev->mman.move_entity.gart_window_lock);
>> +    mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
>>       dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/ 
>> amdgpu/amdgpu_ttm.c
>> index c8d59ca2b3bd..7193a341689d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -291,7 +291,7 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity 
>> *entity,
>>    */
>>   __attribute__((nonnull))
>>   static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>> -                      struct drm_sched_entity *entity,
>> +                      struct amdgpu_ttm_buffer_entity *entity,
>>                         const struct amdgpu_copy_mem *src,
>>                         const struct amdgpu_copy_mem *dst,
>>                         uint64_t size, bool tmz,
>> @@ -314,7 +314,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device 
>> *adev,
>>       amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>>       amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>> -    mutex_lock(&adev->mman.gtt_window_lock);
>> +    mutex_lock(&entity->gart_window_lock);
>>       while (src_mm.remaining) {
>>           uint64_t from, to, cur_size, tiling_flags;
>>           uint32_t num_type, data_format, max_com, write_compress_disable;
>> @@ -324,15 +324,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct 
>> amdgpu_device *adev,
>>           cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>>           /* Map src to window 0 and dst to window 1. */
>> -        r = amdgpu_ttm_map_buffer(entity,
>> +        r = amdgpu_ttm_map_buffer(&entity->base,
>>                         src->bo, src->mem, &src_mm,
>> -                      0, ring, tmz, &cur_size, &from);
>> +                      entity->gart_window_id0, ring, tmz, &cur_size, &from);
>>           if (r)
>>               goto error;
>> -        r = amdgpu_ttm_map_buffer(entity,
>> +        r = amdgpu_ttm_map_buffer(&entity->base,
>>                         dst->bo, dst->mem, &dst_mm,
>> -                      1, ring, tmz, &cur_size, &to);
>> +                      entity->gart_window_id1, ring, tmz, &cur_size, &to);
>>           if (r)
>>               goto error;
>> @@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device 
>> *adev,
>>                                    write_compress_disable));
>>           }
>> -        r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
>> +        r = amdgpu_copy_buffer(ring, &entity->base, from, to, cur_size, resv,
>>                          &next, true, copy_flags);
>>           if (r)
>>               goto error;
>> @@ -371,7 +371,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device 
>> *adev,
>>           amdgpu_res_next(&dst_mm, cur_size);
>>       }
>>   error:
>> -    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    mutex_unlock(&entity->gart_window_lock);
>>       *f = fence;
>>       return r;
>>   }
>> @@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>       dst.offset = 0;
>>       r = amdgpu_ttm_copy_mem_to_mem(adev,
>> -                       &adev->mman.move_entity.base,
>> +                       &adev->mman.move_entity,
>>                          &src, &dst,
>>                          new_mem->size,
>>                          amdgpu_bo_encrypted(abo),
>> @@ -1893,8 +1893,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>>       uint64_t gtt_size;
>>       int r;
>> -    mutex_init(&adev->mman.gtt_window_lock);
>> -
>>       dma_set_max_seg_size(adev->dev, UINT_MAX);
>>       /* No others user of address space so set it to 0 */
>>       r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
>> @@ -2207,6 +2205,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct 
>> amdgpu_device *adev, bool enable)
>>               drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>>               goto error_free_entity;
>>           }
>> +
>> +        /* Statically assign GART windows to each entity. */
>> +        mutex_init(&adev->mman.default_entity.gart_window_lock);
>> +        adev->mman.move_entity.gart_window_id0 = 0;
>> +        adev->mman.move_entity.gart_window_id1 = 1;
>> +        mutex_init(&adev->mman.move_entity.gart_window_lock);
>> +        /* Clearing entity doesn't use id0 */
>> +        adev->mman.clear_entity.gart_window_id1 = 2;
>> +        mutex_init(&adev->mman.clear_entity.gart_window_lock);
>>       } else {
>>           drm_sched_entity_destroy(&adev->mman.default_entity.base);
>>           drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>> @@ -2371,6 +2378,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   {
>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +    struct amdgpu_ttm_buffer_entity *entity;
>>       struct amdgpu_res_cursor cursor;
>>       u64 addr;
>>       int r = 0;
>> @@ -2381,11 +2389,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>       if (!fence)
>>           return -EINVAL;
>> +    entity = &adev->mman.clear_entity;
>>       *fence = dma_fence_get_stub();
>>       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>> -    mutex_lock(&adev->mman.gtt_window_lock);
>> +    mutex_lock(&entity->gart_window_lock);
>>       while (cursor.remaining) {
>>           struct dma_fence *next = NULL;
>>           u64 size;
>> @@ -2398,13 +2407,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>           /* Never clear more than 256MiB at once to avoid timeouts */
>>           size = min(cursor.size, 256ULL << 20);
>> -        r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
>> +        r = amdgpu_ttm_map_buffer(&entity->base,
>>                         &bo->tbo, bo->tbo.resource, &cursor,
>> -                      1, ring, false, &size, &addr);
>> +                      entity->gart_window_id1, ring, false, &size, &addr);
>>           if (r)
>>               goto err;
>> -        r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, 
>> size, resv,
>> +        r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
>>                       &next, true,
>>                       AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>           if (r)
>> @@ -2416,12 +2425,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>           amdgpu_res_next(&cursor, size);
>>       }
>>   err:
>> -    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    mutex_unlock(&entity->gart_window_lock);
>>       return r;
>>   }
>> -int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>                  struct amdgpu_bo *bo,
>>                  uint32_t src_data,
>>                  struct dma_resv *resv,
>> @@ -2442,7 +2451,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>> -    mutex_lock(&adev->mman.gtt_window_lock);
>> +    mutex_lock(&entity->gart_window_lock);
>>       while (dst.remaining) {
>>           struct dma_fence *next;
>>           uint64_t cur_size, to;
>> @@ -2452,7 +2461,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>           r = amdgpu_ttm_map_buffer(&entity->base,
>>                         &bo->tbo, bo->tbo.resource, &dst,
>> -                      1, ring, false, &cur_size, &to);
>> +                      entity->gart_window_id1, ring, false,
>> +                      &cur_size, &to);
>>           if (r)
>>               goto error;
>> @@ -2468,7 +2478,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>           amdgpu_res_next(&dst, cur_size);
>>       }
>>   error:
>> -    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    mutex_unlock(&entity->gart_window_lock);
>>       if (f)
>>           *f = dma_fence_get(fence);
>>       dma_fence_put(fence);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/ 
>> amdgpu/amdgpu_ttm.h
>> index e1655f86a016..f4f762be9fdd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -39,7 +39,7 @@
>>   #define __AMDGPU_PL_NUM    (TTM_PL_PRIV + 6)
>>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE    512
>> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS    2
>> +#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS    3
>>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>> @@ -54,6 +54,9 @@ struct amdgpu_gtt_mgr {
>>   struct amdgpu_ttm_buffer_entity {
>>       struct drm_sched_entity base;
>> +    struct mutex        gart_window_lock;
>> +    u32            gart_window_id0;
>> +    u32            gart_window_id1;
>>   };
>>   struct amdgpu_mman {
>> @@ -69,7 +72,7 @@ struct amdgpu_mman {
>>       struct mutex                gtt_window_lock;
>> -    struct amdgpu_ttm_buffer_entity default_entity;
>> +    struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
>>       struct amdgpu_ttm_buffer_entity clear_entity;
>>       struct amdgpu_ttm_buffer_entity move_entity;
>> @@ -177,7 +180,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>>   int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>                   struct dma_resv *resv,
>>                   struct dma_fence **fence);
>> -int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>                  struct amdgpu_bo *bo,
>>                  uint32_t src_data,
>>                  struct dma_resv *resv,
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/ 
>> amdkfd/kfd_migrate.c
>> index 09756132fa1b..bc47fc362a17 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -60,7 +60,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>>       int r;
>>       /* use gart window 0 */
>> -    *gart_addr = adev->gmc.gart_start;
>> +    *gart_addr = entity->gart_window_id0;
> 
> gart_window_id0 doesn't look like an address. What's the actual MC address that 
> any copy through this window should use?

I believe the address should be:

    adev->gmc.gart_start + (u64)entity->gart_window_id0 * 
AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GPU_PAGE_SIZE

I'll update in v3.

Thanks,
Pierre-Eric


> 
> Regards,
>    Felix
> 
> 
>>       num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>>       num_bytes = npages * 8;
>> @@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>>    * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait 
>> for
>>    * the last sdma finish fence which is returned to check copy memory is done.
>>    *
>> - * Context: Process context, takes and releases gtt_window_lock
>> + * Context: Process context, takes and releases gart_window_lock
>>    *
>>    * Return:
>>    * 0 - OK, otherwise error code
>> @@ -138,7 +138,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, 
>> dma_addr_t *sys,
>>       entity = &adev->mman.move_entity;
>> -    mutex_lock(&adev->mman.gtt_window_lock);
>> +    mutex_lock(&entity->gart_window_lock);
>>       while (npages) {
>>           size = min(GTT_MAX_PAGES, npages);
>> @@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, 
>> dma_addr_t *sys,
>>       }
>>   out_unlock:
>> -    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    mutex_unlock(&entity->gart_window_lock);
>>       return r;
>>   }
