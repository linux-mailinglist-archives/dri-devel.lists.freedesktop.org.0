Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866ABC6DBEC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D578810E5CB;
	Wed, 19 Nov 2025 09:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="eMJK6+dd";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="OX+OdpQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80D10E5C4;
 Wed, 19 Nov 2025 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763544845;
 bh=kgk72TgzVpjOvTf3LGAZbz0
 QiYjdVWzvMJ6O5X3ziBU=; b=eMJK6+ddHToUDKLqEKh7wh4Na+33+7BezijgPm0aSw3TXs2R2n
 DNLC69VwTTS/+/0Jwpp51+rJdqXzPrtGTAe9I4OQ6lpimetffEXJ7Ba3tjE+atXtV1OEr9pGxku
 PpgJcNKNzWRVhqHwUR0xt+8DZy/v0AcL5Z79Qai/Drs6XoagiCDaEoMMauiy+kKaMGWX3MW3wes
 6KuY+E+tvZ0/8mhfO9USbfgfeAEiigBGrvfrNqZoJ+X97Ogd/ISwtdccj/gtFvG0A/K06yInSZo
 8ADvuGgeJntIRTumk1m4o4TVV+DxLpjgy1VOI9eJ8IgkP8JqQFDUr5XluLBTleuDqvg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763544845; bh=kgk72TgzVpjOvTf3LGAZbz0
 QiYjdVWzvMJ6O5X3ziBU=; b=OX+OdpQxLCdXOvi6wQE/FMWNBo8uVh+wXDrp/lkIjHxB2IGuED
 Z96/5XPsf+4Oh0+T3PtHP5mZMFVNn5lyMuAA==;
Message-ID: <5dbbce76-b8c6-4654-8098-fce1ee7b7b47@damsy.net>
Date: Wed, 19 Nov 2025 10:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] drm/amdgpu: pass all the sdma scheds to
 amdgpu_mman
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
 <2920edba-469e-424a-87da-475821bd5c2e@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <2920edba-469e-424a-87da-475821bd5c2e@amd.com>
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



Le 17/11/2025 à 10:46, Christian König a écrit :
> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>> This will allow the use of all of them for clear/fill buffer
>> operations.
>> Since drm_sched_entity_init requires a scheduler array, we
>> store schedulers rather than rings. For the few places that need
>> access to a ring, we can get it from the sched using container_of.
>>
>> Since the code is the same for all sdma versions, add a new
>> helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
>> based on the number of sdma instances.
>>
>> Note: the new sched array is identical to the amdgpu_vm_manager one.
>> These 2 could be merged.
> 
> I realized a bit after we discussed it that this isn't true.
> 
> We need the two arrays separated for a Navi 1x workaround to work correctly.

Why 2 arrays? AFAICT the only needed thing is for amdgpu_ttm to be aware that it 
should only use a single sched in this situation.

> 
> Anyway, that doesn't affect reviewing this patch here.
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  8 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 41 +++++++++++++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  6 +--
>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  6 +--
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  6 +--
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  6 +--
>>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/si_dma.c           |  3 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>>   17 files changed, 62 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 3fab3dc9f3e4..05c13fb0e6bf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1615,6 +1615,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>>   ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
>>   void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
>>   				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
>> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
>> +					 const struct amdgpu_buffer_funcs *buffer_funcs);
>>   
>>   /* atpx handler */
>>   #if defined(CONFIG_VGA_SWITCHEROO)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>> index b59040a8771f..9ea927e07a77 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>> @@ -32,12 +32,14 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>>   				    uint64_t saddr, uint64_t daddr, int n, s64 *time_ms)
>>   {
>>   	ktime_t stime, etime;
>> +	struct amdgpu_ring *ring;
>>   	struct dma_fence *fence;
>>   	int i, r;
>>   
>> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> 
> We have the to_amdgpu_ring() macro for that.

I'll update the patch, thx.

> 
>> +
>>   	stime = ktime_get();
>>   	for (i = 0; i < n; i++) {
>> -		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>   		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
>>   				       saddr, daddr, size, NULL, &fence,
>>   				       false, 0);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index b92234d63562..1927d940fbca 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3303,7 +3303,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>   	if (r)
>>   		goto init_failed;
>>   
>> -	if (adev->mman.buffer_funcs_ring->sched.ready)
>> +	if (adev->mman.buffer_funcs_scheds[0]->ready)
>>   		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>   
>>   	/* Don't init kfd if whole hive need to be reset during init */
>> @@ -4143,7 +4143,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>>   
>>   	r = amdgpu_device_ip_resume_phase2(adev);
>>   
>> -	if (adev->mman.buffer_funcs_ring->sched.ready)
>> +	if (adev->mman.buffer_funcs_scheds[0]->ready)
> 
> We should probably drop that check here and move this into amdgpu_ttm_set_buffer_funcs_status().

What should amdgpu_ttm_set_buffer_funcs_status() do if ready is false but enable 
is true? Exit early?

> 
>>   		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>   
>>   	if (r)
>> @@ -4493,7 +4493,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>   	adev->num_rings = 0;
>>   	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
>>   	adev->mman.buffer_funcs = NULL;
>> -	adev->mman.buffer_funcs_ring = NULL;
>> +	adev->mman.num_buffer_funcs_scheds = 0;
>>   	adev->vm_manager.vm_pte_funcs = NULL;
>>   	adev->vm_manager.vm_pte_num_scheds = 0;
>>   	adev->gmc.gmc_funcs = NULL;
>> @@ -5965,7 +5965,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>>   				if (r)
>>   					goto out;
>>   
>> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
>> +				if (tmp_adev->mman.buffer_funcs_scheds[0]->ready)
>>   					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>>   
>>   				r = amdgpu_device_ip_resume_phase3(tmp_adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> index 2713dd51ab9a..4433d8620129 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> @@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
>>   void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>>   			      uint32_t vmhub, uint32_t flush_type)
>>   {
>> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +	struct amdgpu_ring *ring;
>>   	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>>   	struct dma_fence *fence;
>>   	struct amdgpu_job *job;
>>   	int r, i;
>>   
>> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>> +
>>   	if (!hub->sdma_invalidation_workaround || vmid ||
>>   	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
>>   	    !ring->sched.ready) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 6c333dba7a35..11fec0fa4c11 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -308,7 +308,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>   				      struct dma_resv *resv,
>>   				      struct dma_fence **f)
>>   {
>> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +	struct amdgpu_ring *ring;
>>   	struct amdgpu_res_cursor src_mm, dst_mm;
>>   	struct dma_fence *fence = NULL;
>>   	int r = 0;
>> @@ -321,6 +321,8 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>   		return -EINVAL;
>>   	}
>>   
>> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>> +
>>   	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>>   	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>>   
>> @@ -1493,6 +1495,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>   	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
>>   	struct amdgpu_res_cursor src_mm;
>> +	struct amdgpu_ring *ring;
>>   	struct amdgpu_job *job;
>>   	struct dma_fence *fence;
>>   	uint64_t src_addr, dst_addr;
>> @@ -1530,7 +1533,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>   	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
>>   				PAGE_SIZE, 0);
>>   
>> -	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
>> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>> +	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>>   	WARN_ON(job->ibs[0].length_dw > num_dw);
>>   
>>   	fence = amdgpu_job_submit(job);
>> @@ -2196,11 +2200,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   		return windows;
>>   
>>   	if (enable) {
>> -		struct amdgpu_ring *ring;
>>   		struct drm_gpu_scheduler *sched;
>>   
>> -		ring = adev->mman.buffer_funcs_ring;
>> -		sched = &ring->sched;
>> +		sched = adev->mman.buffer_funcs_scheds[0];
>>   		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>>   					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>>   					  1, NULL);
>> @@ -2432,7 +2434,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   			    struct dma_fence **fence)
>>   {
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +	struct amdgpu_ring *ring;
>>   	struct amdgpu_ttm_buffer_entity *entity;
>>   	struct amdgpu_res_cursor cursor;
>>   	u64 addr;
>> @@ -2443,6 +2445,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   
>>   	if (!fence)
>>   		return -EINVAL;
>> +
>> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>   	entity = &adev->mman.clear_entities[0];
>>   	*fence = dma_fence_get_stub();
>>   
>> @@ -2494,9 +2498,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>   		       u64 k_job_id)
>>   {
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>   	struct dma_fence *fence = NULL;
>>   	struct amdgpu_res_cursor dst;
>> +	struct amdgpu_ring *ring;
>>   	int r, e;
>>   
>>   	if (!adev->mman.buffer_funcs_enabled) {
>> @@ -2505,6 +2509,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>   		return -EINVAL;
>>   	}
>>   
>> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>> +
>>   	if (entity == NULL) {
>>   		e = atomic_inc_return(&adev->mman.next_clear_entity) %
>>   				      adev->mman.num_clear_entities;
>> @@ -2579,6 +2585,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>   	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>>   }
>>   
>> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
>> +					 const struct amdgpu_buffer_funcs *buffer_funcs)
>> +{
>> +	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
>> +	struct drm_gpu_scheduler *sched;
>> +	int i;
>> +
>> +	adev->mman.buffer_funcs = buffer_funcs;
>> +
>> +	for (i = 0; i < adev->sdma.num_instances; i++) {
>> +		if (adev->sdma.has_page_queue)
>> +			sched = &adev->sdma.instance[i].page.sched;
>> +		else
>> +			sched = &adev->sdma.instance[i].ring.sched;
>> +		adev->mman.buffer_funcs_scheds[i] = sched;
>> +	}
>> +
>> +	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
>> +		1 : adev->sdma.num_instances;
>> +}
>> +
> 
> Probably better to make all SDMA version switch to use amdgpu_sdma_set_buffer_funcs_scheds() one patch and then changing amdgpu_sdma_set_buffer_funcs_scheds() to use more than one DMA engine a second patch.

I'm not sure it's useful: this patch simply creates an array of scheduler, but 
every user of this array only use the first sched.
Enabling multiple schedulers usage is done in the "drm/amdgpu: give ttm entities 
access to all the sdma scheds" patch.

Pierre-Eric
