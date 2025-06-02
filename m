Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A1ACAE5F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 14:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A261010E1FE;
	Mon,  2 Jun 2025 12:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvOQYdfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA1A10E1FE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748869095; x=1780405095;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oilxkc6DzN2cbvWSWKB25ul1D8zwWWt/1iUwtIntcJ0=;
 b=HvOQYdfz0JD4TvsgSFXL65AIj7Z1h2u+iUomhforR03Y+2VIuY9sztJS
 wjws1LREwJQ4mkr7PU1rs0OahISId+biwt7CL0kA9dGaEZmT8E9a0fxDU
 I6ShupwwnaqEeJ+1lD9e83cKUOzz7aHSE96pd8L6mfcUwy8uPE/byobq7
 pWB4vtvgVNgm7iI5SpVR8nINqGaekgC5RUcv9AxLp3/tmX0FDyysVUpkG
 5ThyTn7y0mt8D9P7YFhGnWc6iGsQp33CLOn4OMcbi6jDEM+WDBo26JEsv
 WEWu2R+1wY4VMekHGONKubc1hXlNygVLue3rk8BJAfxDgEw7D/FqIxN1H w==;
X-CSE-ConnectionGUID: sZPHtXl8R5WW2yCObg/3yA==
X-CSE-MsgGUID: df5JtRogS+qfs5oSGRrJtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61925825"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61925825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 05:58:11 -0700
X-CSE-ConnectionGUID: GqIhOtykTW6ytS3iJyaKlA==
X-CSE-MsgGUID: /PHzulLTT2q+HKeMQ1gj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144413332"
Received: from vmusin-mobl1.ger.corp.intel.com (HELO [10.245.112.120])
 ([10.245.112.120])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 05:58:10 -0700
Message-ID: <a52588be-b487-433a-a74f-eaa1d7a88654@linux.intel.com>
Date: Mon, 2 Jun 2025 14:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Use dma_resv_lock() instead of a custom mutex
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, stable@vger.kernel.org
References: <20250528154325.500684-1-jacek.lawrynowicz@linux.intel.com>
 <26b8a17e-500d-d89d-de9f-c17108a6831d@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <26b8a17e-500d-d89d-de9f-c17108a6831d@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 5/28/2025 7:50 PM, Lizhi Hou wrote:
> 
> On 5/28/25 08:43, Jacek Lawrynowicz wrote:
>> This fixes a potential race conditions in:
>>   - ivpu_bo_unbind_locked() where we modified the shmem->sgt without
>>     holding the dma_resv_lock().
>>   - ivpu_bo_print_info() where we read the shmem->pages without
>>     holding the dma_resv_lock().
>>
>> Using dma_resv_lock() also protects against future syncronisation
>> issues that may arise when accessing drm_gem_shmem_object or
>> drm_gem_object members.
>>
>> Fixes: 42328003ecb6 ("accel/ivpu: Refactor BO creation functions")
>> Cc: <stable@vger.kernel.org> # v6.9+
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_gem.c | 63 +++++++++++++++++++----------------
>>   drivers/accel/ivpu/ivpu_gem.h |  1 -
>>   2 files changed, 34 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index c193a80241f5f..5908268ca45e9 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -33,6 +33,16 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>>            (bool)bo->base.base.import_attach);
>>   }
>>   +static inline int ivpu_bo_lock(struct ivpu_bo *bo)
>> +{
>> +    return dma_resv_lock(bo->base.base.resv, NULL);
>> +}
>> +
>> +static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
>> +{
>> +    dma_resv_unlock(bo->base.base.resv);
>> +}
>> +
>>   /*
>>    * ivpu_bo_pin() - pin the backing physical pages and map them to VPU.
>>    *
>> @@ -43,22 +53,22 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>>   int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>>   {
>>       struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>> +    struct sg_table *sgt;
>>       int ret = 0;
>>   -    mutex_lock(&bo->lock);
>> -
>>       ivpu_dbg_bo(vdev, bo, "pin");
>> -    drm_WARN_ON(&vdev->drm, !bo->ctx);
>>   -    if (!bo->mmu_mapped) {
>> -        struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>> +    sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>> +    if (IS_ERR(sgt)) {
>> +        ret = PTR_ERR(sgt);
>> +        ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
>> +        return ret;
>> +    }
>>   -        if (IS_ERR(sgt)) {
>> -            ret = PTR_ERR(sgt);
>> -            ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
>> -            goto unlock;
>> -        }
>> +    ivpu_bo_lock(bo);
>>   +    if (!bo->mmu_mapped) {
>> +        drm_WARN_ON(&vdev->drm, !bo->ctx);
>>           ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
>>                              ivpu_bo_is_snooped(bo));
>>           if (ret) {
>> @@ -69,7 +79,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>>       }
>>     unlock:
>> -    mutex_unlock(&bo->lock);
>> +    ivpu_bo_unlock(bo);
>>         return ret;
>>   }
>> @@ -84,7 +94,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>>       if (!drm_dev_enter(&vdev->drm, &idx))
>>           return -ENODEV;
>>   -    mutex_lock(&bo->lock);
>> +    ivpu_bo_lock(bo);
>>         ret = ivpu_mmu_context_insert_node(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
>>       if (!ret) {
>> @@ -94,7 +104,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>>           ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>>       }
>>   -    mutex_unlock(&bo->lock);
>> +    ivpu_bo_unlock(bo);
>>         drm_dev_exit(idx);
>>   @@ -105,7 +115,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>   {
>>       struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>>   -    lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
>> +    lockdep_assert(dma_resv_held(bo->base.base.resv) || !kref_read(&bo->base.base.refcount));
>>         if (bo->mmu_mapped) {
>>           drm_WARN_ON(&vdev->drm, !bo->ctx);
>> @@ -123,14 +133,12 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>       if (bo->base.base.import_attach)
>>           return;
>>   -    dma_resv_lock(bo->base.base.resv, NULL);
>>       if (bo->base.sgt) {
>>           dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
>>           sg_free_table(bo->base.sgt);
>>           kfree(bo->base.sgt);
>>           bo->base.sgt = NULL;
> 
> Maybe not directly modify sgt but use drm_gem_shmem_purge()?

drm_gem_shmem_purge() also removes user mapping and backing pages.
In ivpu_bo_unbind_locked() we only want to unmap the buffer from the device as it being turned off.
We don't want to crash user process in this case and this will probably be the result of drm_gem_shmem_purge() na mmpapped buffer.

> Will it potentially memleak without calling drm_gem_shmem_put_pages()? (if the bo is mmap, vmap etc)

There is no memory leak. We are calling drm_gem_shmem_get_pages_sgt() only once per object and drm_gem_shmem_free() frees all backing memory.

Regards,
Jacek
