Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70BC5D9DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4A410EA96;
	Fri, 14 Nov 2025 14:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="EiHefzOB";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="MK+kDFRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760D910EA84;
 Fri, 14 Nov 2025 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763131013;
 bh=dD/1gMK/7HH/6GZEFg3SyAg
 UFarZcH/OgqqRc8ieD2g=; b=EiHefzOBiUQyrR/zWvJHagc4m3OyC9zVAVvSd1NhY3cJWMG51D
 l3G1uogzsdmf9Qnwf2mMTHXrVeEZVOQcJs4mN5XbeF/A2RxUZW59+5keaTtIlCwGd2xV+JUG41F
 IYTDXwfD/EKYRczUdyflC3CjeOF6H6tf8j9qze+aTka8uMZZK2wsUeLuBlzl6NCsY0Tm37EmtHZ
 nhiZaczVzvcPJCZMJ+7HmqLvTdX3Xx07ad8AGcEiJgP4LwQolXKi0uqBaL0krYoNWJiWX/WGYwe
 PF4Bs76kG4CbzQUckZmz7BbM8tOQkHFOsEQQNtBWWiRnDYul8WgCHeTtFQkB6GDmBLA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763131013; bh=dD/1gMK/7HH/6GZEFg3SyAg
 UFarZcH/OgqqRc8ieD2g=; b=MK+kDFRCoco5qMEyWluI2XUe/COnwqfzJs6UFPbzu6/pwg+AcN
 LQaR42rnAwKO9LJef+QOGgJFobvuV4D2SwAg==;
Message-ID: <bd3938b1-0eef-4fc5-9fd7-3f2518cf1cd5@damsy.net>
Date: Fri, 14 Nov 2025 15:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] drm/amdgpu: give each kernel job a unique id
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-2-pierre-eric.pelloux-prayer@amd.com>
 <e1371dbb-a33b-4246-b71d-0b56d5ad85cd@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <e1371dbb-a33b-4246-b71d-0b56d5ad85cd@amd.com>
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



Le 14/11/2025 à 13:26, Christian König a écrit :
> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>> Userspace jobs have drm_file.client_id as a unique identifier
>> as job's owners. For kernel jobs, we can allocate arbitrary
>> values - the risk of overlap with userspace ids is small (given
>> that it's a u64 value).
>> In the unlikely case the overlap happens, it'll only impact
>> trace events.
>>
>> Since this ID is traced in the gpu_scheduler trace events, this
>> allows to determine the source of each job sent to the hardware.
>>
>> To make grepping easier, the IDs are defined as they will appear
>> in the trace output.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> 
> You should probably start pushing this patch to amd-staging-drm-next even when not the full patch set is reviewed.
> 
> We need to get this partially merged through drm-misc-next because of the TTM dependencies anyway.

I've mentionned in the cover letter that this patch was already merged through 
drm-misc. I'm including it in the series to avoid conflicts.

Pierre-Eric

> 
> Regards,
> Christian
> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
>>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
>>   19 files changed, 84 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> index 3d24f9cd750a..29c927f4d6df 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -1549,7 +1549,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
>>   	owner = (void *)(unsigned long)atomic_inc_return(&counter);
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
>> -				     64, 0, &job);
>> +				     64, 0, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
>>   	if (r)
>>   		goto err;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> index 97b562a79ea8..9dcf51991b5b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> @@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>> -				     &job);
>> +				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>>   	if (r)
>>   		goto error_alloc;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 55c7e104d5ca..3457bd649623 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -234,11 +234,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>   			     struct drm_sched_entity *entity, void *owner,
>>   			     size_t size, enum amdgpu_ib_pool_type pool_type,
>> -			     struct amdgpu_job **job)
>> +			     struct amdgpu_job **job, u64 k_job_id)
>>   {
>>   	int r;
>>   
>> -	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
>> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
>> +			     k_job_id);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> index d25f1fcf0242..7abf069d17d4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> @@ -44,6 +44,22 @@
>>   struct amdgpu_fence;
>>   enum amdgpu_ib_pool_type;
>>   
>> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
>> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
>> +
>>   struct amdgpu_job {
>>   	struct drm_sched_job    base;
>>   	struct amdgpu_vm	*vm;
>> @@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>   			     struct drm_sched_entity *entity, void *owner,
>>   			     size_t size, enum amdgpu_ib_pool_type pool_type,
>> -			     struct amdgpu_job **job);
>> +			     struct amdgpu_job **job,
>> +			     u64 k_job_id);
>>   void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>>   			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>>   void amdgpu_job_free_resources(struct amdgpu_job *job);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> index 91678621f1ff..63ee6ba6a931 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> @@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>>   	int i, r;
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>> -				     AMDGPU_IB_POOL_DIRECT, &job);
>> +				     AMDGPU_IB_POOL_DIRECT, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index fe486988a738..e08f58de4b17 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -1321,7 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>   	if (r)
>>   		goto out;
>>   
>> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
>> +	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
>> +			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>>   	if (WARN_ON(r))
>>   		goto out;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index e226c3aff7d7..326476089db3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -227,7 +227,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>   	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4 + num_bytes,
>> -				     AMDGPU_IB_POOL_DELAYED, &job);
>> +				     AMDGPU_IB_POOL_DELAYED, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
>>   	if (r)
>>   		return r;
>>   
>> @@ -406,7 +407,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>   		struct dma_fence *wipe_fence = NULL;
>>   
>>   		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>> -				       false);
>> +				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>>   		if (r) {
>>   			goto error;
>>   		} else if (wipe_fence) {
>> @@ -1488,7 +1489,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>   	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
>> -				     &job);
>> +				     &job,
>> +				     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
>>   	if (r)
>>   		goto out;
>>   
>> @@ -2212,7 +2214,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>>   				  struct dma_resv *resv,
>>   				  bool vm_needs_flush,
>>   				  struct amdgpu_job **job,
>> -				  bool delayed)
>> +				  bool delayed, u64 k_job_id)
>>   {
>>   	enum amdgpu_ib_pool_type pool = direct_submit ?
>>   		AMDGPU_IB_POOL_DIRECT :
>> @@ -2222,7 +2224,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>>   						    &adev->mman.high_pr;
>>   	r = amdgpu_job_alloc_with_ib(adev, entity,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>> -				     num_dw * 4, pool, job);
>> +				     num_dw * 4, pool, job, k_job_id);
>>   	if (r)
>>   		return r;
>>   
>> @@ -2262,7 +2264,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>   	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>>   	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>>   	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
>> -				   resv, vm_needs_flush, &job, false);
>> +				   resv, vm_needs_flush, &job, false,
>> +				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>>   	if (r)
>>   		return r;
>>   
>> @@ -2297,7 +2300,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>   			       uint64_t dst_addr, uint32_t byte_count,
>>   			       struct dma_resv *resv,
>>   			       struct dma_fence **fence,
>> -			       bool vm_needs_flush, bool delayed)
>> +			       bool vm_needs_flush, bool delayed,
>> +			       u64 k_job_id)
>>   {
>>   	struct amdgpu_device *adev = ring->adev;
>>   	unsigned int num_loops, num_dw;
>> @@ -2310,7 +2314,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>   	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>>   	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>>   	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
>> -				   &job, delayed);
>> +				   &job, delayed, k_job_id);
>>   	if (r)
>>   		return r;
>>   
>> @@ -2380,7 +2384,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   			goto err;
>>   
>>   		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>> -					&next, true, true);
>> +					&next, true, true,
>> +					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>   		if (r)
>>   			goto err;
>>   
>> @@ -2399,7 +2404,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>   			uint32_t src_data,
>>   			struct dma_resv *resv,
>>   			struct dma_fence **f,
>> -			bool delayed)
>> +			bool delayed,
>> +			u64 k_job_id)
>>   {
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> @@ -2429,7 +2435,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>   			goto error;
>>   
>>   		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
>> -					&next, true, delayed);
>> +					&next, true, delayed, k_job_id);
>>   		if (r)
>>   			goto error;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 054d48823d5f..577ee04ce0bf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>   			uint32_t src_data,
>>   			struct dma_resv *resv,
>>   			struct dma_fence **fence,
>> -			bool delayed);
>> +			bool delayed,
>> +			u64 k_job_id);
>>   
>>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>>   void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> index 74758b5ffc6c..5c38f0d30c87 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> @@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     64, direct ? AMDGPU_IB_POOL_DIRECT :
>> -				     AMDGPU_IB_POOL_DELAYED, &job);
>> +				     AMDGPU_IB_POOL_DELAYED, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> index b9060bcd4806..ce318f5de047 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> @@ -449,7 +449,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>> -				     &job);
>> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> @@ -540,7 +540,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     ib_size_dw * 4,
>>   				     direct ? AMDGPU_IB_POOL_DIRECT :
>> -				     AMDGPU_IB_POOL_DELAYED, &job);
>> +				     AMDGPU_IB_POOL_DELAYED, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> index 5ae7cc0d5f57..5e0786ea911b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> @@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>   				     64, AMDGPU_IB_POOL_DIRECT,
>> -				     &job);
>> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		goto err;
>>   
>> @@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>> -				     &job);
>> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		goto err;
>>   
>> @@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>> -				     &job);
>> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> @@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>> -				     &job);
>> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index db66b4232de0..2f8e83f840a8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -983,7 +983,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>>   	params.vm = vm;
>>   	params.immediate = immediate;
>>   
>> -	r = vm->update_funcs->prepare(&params, NULL);
>> +	r = vm->update_funcs->prepare(&params, NULL,
>> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
>>   	if (r)
>>   		goto error;
>>   
>> @@ -1152,7 +1153,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   		dma_fence_put(tmp);
>>   	}
>>   
>> -	r = vm->update_funcs->prepare(&params, sync);
>> +	r = vm->update_funcs->prepare(&params, sync,
>> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
>>   	if (r)
>>   		goto error_free;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index 77207f4e448e..cf0ec94e8a07 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -308,7 +308,7 @@ struct amdgpu_vm_update_params {
>>   struct amdgpu_vm_update_funcs {
>>   	int (*map_table)(struct amdgpu_bo_vm *bo);
>>   	int (*prepare)(struct amdgpu_vm_update_params *p,
>> -		       struct amdgpu_sync *sync);
>> +		       struct amdgpu_sync *sync, u64 k_job_id);
>>   	int (*update)(struct amdgpu_vm_update_params *p,
>>   		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
>>   		      unsigned count, uint32_t incr, uint64_t flags);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>> index 0c1ef5850a5e..22e2e5b47341 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>> @@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
>>    *
>>    * @p: see amdgpu_vm_update_params definition
>>    * @sync: sync obj with fences to wait on
>> + * @k_job_id: the id for tracing/debug purposes
>>    *
>>    * Returns:
>>    * Negativ errno, 0 for success.
>>    */
>>   static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
>> -				 struct amdgpu_sync *sync)
>> +				 struct amdgpu_sync *sync,
>> +				 u64 k_job_id)
>>   {
>>   	if (!sync)
>>   		return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>> index 30022123b0bf..f794fb1cc06e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>> @@ -26,6 +26,7 @@
>>   #include "amdgpu.h"
>>   #include "amdgpu_trace.h"
>>   #include "amdgpu_vm.h"
>> +#include "amdgpu_job.h"
>>   
>>   /*
>>    * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
>> @@ -395,7 +396,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   	params.vm = vm;
>>   	params.immediate = immediate;
>>   
>> -	r = vm->update_funcs->prepare(&params, NULL);
>> +	r = vm->update_funcs->prepare(&params, NULL,
>> +				      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
>>   	if (r)
>>   		goto exit;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>> index 46d9fb433ab2..36805dcfa159 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>> @@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>>   
>>   /* Allocate a new job for @count PTE updates */
>>   static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>> -				    unsigned int count)
>> +				    unsigned int count, u64 k_job_id)
>>   {
>>   	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>>   		: AMDGPU_IB_POOL_DELAYED;
>> @@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>>   	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
>>   
>>   	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
>> -				     ndw * 4, pool, &p->job);
>> +				     ndw * 4, pool, &p->job, k_job_id);
>>   	if (r)
>>   		return r;
>>   
>> @@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>>    *
>>    * @p: see amdgpu_vm_update_params definition
>>    * @sync: amdgpu_sync object with fences to wait for
>> + * @k_job_id: identifier of the job, for tracing purpose
>>    *
>>    * Returns:
>>    * Negativ errno, 0 for success.
>>    */
>>   static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>> -				  struct amdgpu_sync *sync)
>> +				  struct amdgpu_sync *sync, u64 k_job_id)
>>   {
>>   	int r;
>>   
>> -	r = amdgpu_vm_sdma_alloc_job(p, 0);
>> +	r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
>>   	if (r)
>>   		return r;
>>   
>> @@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>>   			if (r)
>>   				return r;
>>   
>> -			r = amdgpu_vm_sdma_alloc_job(p, count);
>> +			r = amdgpu_vm_sdma_alloc_job(p, count,
>> +						     AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
>>   			if (r)
>>   				return r;
>>   		}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> index 1c07b701d0e4..ceb94bbb03a4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> @@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>>   	int i, r;
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>> -				     AMDGPU_IB_POOL_DIRECT, &job);
>> +				     AMDGPU_IB_POOL_DIRECT, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> @@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>>   	int i, r;
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>> -				     AMDGPU_IB_POOL_DIRECT, &job);
>> +				     AMDGPU_IB_POOL_DIRECT, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>> index 9d237b5937fb..1f8866f3f63c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>> @@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
>>   	int i, r;
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>> -				     AMDGPU_IB_POOL_DIRECT, &job);
>> +				     AMDGPU_IB_POOL_DIRECT, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> @@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
>>   	int i, r;
>>   
>>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>> -				     AMDGPU_IB_POOL_DIRECT, &job);
>> +				     AMDGPU_IB_POOL_DIRECT, &job,
>> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 3653c563ee9a..46c84fc60af1 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4 + num_bytes,
>>   				     AMDGPU_IB_POOL_DELAYED,
>> -				     &job);
>> +				     &job,
>> +				     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
>>   	if (r)
>>   		return r;
>>   
