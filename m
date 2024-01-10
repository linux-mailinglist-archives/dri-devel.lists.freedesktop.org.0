Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9396829857
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BCC10E5B2;
	Wed, 10 Jan 2024 11:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331B110E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704884897; x=1736420897;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3pknrXl8bAJRDrbnnXs7x818/D72jYS5EG5vbn2MtY0=;
 b=IDKqzRW786dMpCf29BnyMOyJ/tDAiL0+cEQonFT+1XNh6p3ey7D7EPWw
 QI0SUephyxHjglfq5NMsndOl0nez03GO7k0VISZXuybvB5uQ1eh8yZI1x
 oyaRg9URJm6huK8fSFsp8ZrHavDvzVX9wQHdFiZ+7ibfZWycRUIeBH5za
 DqFdzGXdRBKKLGusSMSutGx299j0+BcmzxqedUENv/YtHG4OhQ5RvrZLa
 wJ8ve3LvV52oOHTbL5vd/RUUbx3l+FOy5tor17e1fHHxzKfDy6cJFXDy/
 OuwVInS3ihkh11e8u+wGWvGVb9xjEVNVxtIJWyrlbJj/G3EztsrXLuGmW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="402263017"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="402263017"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 03:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775188871"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775188871"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 03:08:15 -0800
Message-ID: <c3b0a181-ef57-407f-af9f-60ead481dd8e@linux.intel.com>
Date: Wed, 10 Jan 2024 12:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] accel/ivpu: Improve buffer object debug logs
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-10-jacek.lawrynowicz@linux.intel.com>
 <4814bd7d-fc5f-1252-ffd8-b60197b4d3b6@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4814bd7d-fc5f-1252-ffd8-b60197b4d3b6@quicinc.com>
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


On 05.01.2024 18:03, Jeffrey Hugo wrote:
> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>> Make debug logs more readable and consistent:
>>    - don't print handle as it is not always available for all buffers
>>    - use hashed ivpu_bo ptr as main buffer identifier
>>    - remove unused fields from ivpu_bo_print_info()
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_gem.c | 72 +++++++++++------------------------
>>   drivers/accel/ivpu/ivpu_gem.h |  1 -
>>   2 files changed, 23 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 8cb4d337552e..dd327d7eda0d 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -24,14 +24,11 @@ static const struct drm_gem_object_funcs ivpu_gem_funcs;
>>     static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, const char *action)
>>   {
>> -    if (bo->ctx)
>> -        ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u ctx %d vpu_addr 0x%llx mmu_mapped %d\n",
>> -             action, ivpu_bo_size(bo), (bool)bo->base.pages, (bool)bo->base.sgt,
>> -             bo->handle, bo->ctx->id, bo->vpu_addr, bo->mmu_mapped);
>> -    else
>> -        ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u (not added to context)\n",
>> -             action, ivpu_bo_size(bo), (bool)bo->base.pages, (bool)bo->base.sgt,
>> -             bo->handle);
>> +    ivpu_dbg(vdev, BO,
>> +         "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
>> +         action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
>> +         (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
>> +         (bool)bo->base.base.import_attach);
>>   }
>>     /*
>> @@ -49,12 +46,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>>       mutex_lock(&bo->lock);
>>         ivpu_dbg_bo(vdev, bo, "pin");
>> -
>> -    if (!bo->ctx) {
>> -        ivpu_err(vdev, "vpu_addr not allocated for BO %d\n", bo->handle);
>> -        ret = -EINVAL;
>> -        goto unlock;
>> -    }
>> +    drm_WARN_ON(&vdev->drm, !bo->ctx);
>>         if (!bo->mmu_mapped) {
>>           struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>> @@ -108,9 +100,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>   {
>>       struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>>   -    lockdep_assert_held(&bo->lock);
>> -
>> -    ivpu_dbg_bo(vdev, bo, "unbind");
>> +    lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
>>         if (bo->mmu_mapped) {
>>           drm_WARN_ON(&vdev->drm, !bo->ctx);
>> @@ -122,7 +112,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>         if (bo->ctx) {
>>           ivpu_mmu_context_remove_node(bo->ctx, &bo->mm_node);
>> -        bo->vpu_addr = 0;
>>           bo->ctx = NULL;
>>       }
>>   @@ -139,13 +128,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>       dma_resv_unlock(bo->base.base.resv);
>>   }
>>   -static void ivpu_bo_unbind(struct ivpu_bo *bo)
>> -{
>> -    mutex_lock(&bo->lock);
>> -    ivpu_bo_unbind_locked(bo);
>> -    mutex_unlock(&bo->lock);
>> -}
> 
> This does not seem to be related to $SUBJECT

OK, I'll drop this.

>> -
>>   void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
>>   {
>>       struct ivpu_bo *bo;
>> @@ -156,8 +138,10 @@ void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>>       mutex_lock(&vdev->bo_list_lock);
>>       list_for_each_entry(bo, &vdev->bo_list, bo_list_node) {
>>           mutex_lock(&bo->lock);
>> -        if (bo->ctx == ctx)
>> +        if (bo->ctx == ctx) {
>> +            ivpu_dbg_bo(vdev, bo, "unbind");
>>               ivpu_bo_unbind_locked(bo);
>> +        }
>>           mutex_unlock(&bo->lock);
>>       }
>>       mutex_unlock(&vdev->bo_list_lock);
>> @@ -209,9 +193,6 @@ ivpu_bo_create(struct ivpu_device *vdev, u64 size, u32 flags)
>>       list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>>       mutex_unlock(&vdev->bo_list_lock);
>>   -    ivpu_dbg(vdev, BO, "create: vpu_addr 0x%llx size %zu flags 0x%x\n",
>> -         bo->vpu_addr, bo->base.base.size, flags);
>> -
>>       return bo;
>>   }
>>   @@ -243,15 +224,15 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
>>       struct ivpu_device *vdev = to_ivpu_device(obj->dev);
>>       struct ivpu_bo *bo = to_ivpu_bo(obj);
>>   +    ivpu_dbg_bo(vdev, bo, "free");
>> +
>>       mutex_lock(&vdev->bo_list_lock);
>>       list_del(&bo->bo_list_node);
>>       mutex_unlock(&vdev->bo_list_lock);
>>         drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
>>   -    ivpu_dbg_bo(vdev, bo, "free");
>> -
>> -    ivpu_bo_unbind(bo);
>> +    ivpu_bo_unbind_locked(bo);
> 
> This does not seem to be related to $SUBJECT

OK, I'll drop this.
