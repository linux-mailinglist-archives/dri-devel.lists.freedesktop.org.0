Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E8F635BF6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0510E0EF;
	Wed, 23 Nov 2022 11:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4BC10E0EF;
 Wed, 23 Nov 2022 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669203783; x=1700739783;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SXWQhPKv5BN00tar/l4Lx/M/3vyxMrI9DulPpv5lWU4=;
 b=M2Us7Jx/8oHFRAe+OvFpdA6zkoFp7JtwkDdr/GUySh5S1eOIWyq3/U3l
 Mq37H8ZLZQIzBn4U19o3MGJhbgFNMqA9nOwmdz8UZRET3UrlSSzNPL+9R
 8X4sdR/YbswYEEG5nl3kYEOnxMiI0ZdXtCrOuVTuQVnq16reF1+XeELkq
 loQ+EbY3TnoTLkP7GscjnrjMSjPOXz2TY4dsHyQ7WW7IdbyFLF8uqhau7
 NnEq8ikm4OqmtIHAuj+WpxaoomLZOS98nyOgyuz9Jw1YUiOp2iwOw/zAH
 WkjE+Go1ue0JZZIbrss3qtlV0TWo4BMIDwjyVl+8aXKjPYlJaIta7ZEIi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312747101"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="312747101"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 03:43:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730757703"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="730757703"
Received: from shanew6x-mobl.ger.corp.intel.com (HELO [10.252.16.236])
 ([10.252.16.236])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 03:43:00 -0800
Message-ID: <dc5a13ce-373c-995b-42a7-4b8f658e7990@intel.com>
Date: Wed, 23 Nov 2022 11:42:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
 <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
 <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
 <Y3O/a/sF21wC3EdE@nvishwa1-DESK> <Y3Qdd2aW4AHHDgq3@nvishwa1-DESK>
 <Y3QwtyKJKCKMBvjb@nvishwa1-DESK>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y3QwtyKJKCKMBvjb@nvishwa1-DESK>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2022 00:37, Niranjana Vishwanathapura wrote:
> On Tue, Nov 15, 2022 at 03:15:03PM -0800, Niranjana Vishwanathapura wrote:
>> On Tue, Nov 15, 2022 at 08:33:47AM -0800, Niranjana Vishwanathapura 
>> wrote:
>>> On Tue, Nov 15, 2022 at 04:20:54PM +0000, Matthew Auld wrote:
>>>> On 15/11/2022 16:15, Niranjana Vishwanathapura wrote:
>>>>> On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>>>>>> On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>>>>>> Asynchronously unbind the vma upon vm_unbind call.
>>>>>>> Fall back to synchronous unbind if backend doesn't support
>>>>>>> async unbind or if async unbind fails.
>>>>>>>
>>>>>>> No need for vm_unbind out fence support as i915 will internally
>>>>>>> handle all sequencing and user need not try to sequence any
>>>>>>> operation with the unbind completion.
>>>>>>>
>>>>>>> v2: use i915_vma_destroy_async in vm_unbind ioctl
>>>>>>>
>>>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>>>> <niranjana.vishwanathapura@intel.com>
>>>>>>
>>>>>> This only does it for non-partial vma, right? Or was that changed 
>>>>>> somewhere?
>>>>>>
>>>>>
>>>>> No, it applies to any vma (partial or non-partial).
>>>>> It was so from the beginning.
>>>>
>>>> Doesn't __i915_vma_unbind_async() return an error when mm.pages != 
>>>> vma->pages? IIRC this was discussed before. Just trying to think 
>>>> about the consequences of this change.
>>>
>>> I am not seeing any such restriction. Let me probe and check if there
>>> is any such restriction anywhere in the call chain.
>>
>> I checked and I am not seeing any restriction anywher in the call chain.
>>
> 
> Note that just like binding case, unbinding is also synchronous unless
> there is a pending activity, in which case, it will be asynchronous.

In __i915_vma_unbind_async() there is:

if (i915_vma_is_pinned(vma) ||
     &vma->obj->mm.rsgt->table != vma->resource->bi.pages)
         return ERR_PTR(-EAGAIN);

AFAICT we then also don't get any pipelined moves with such an object, 
if there is such a binding present.

> 
> Niranjana
> 
>> Niranjana
>>
>>>
>>> Niranjana
>>>
>>>>
>>>>>
>>>>> Niranjana
>>>>>
>>>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>
>>>>>>> ---
>>>>>>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>>>>>  drivers/gpu/drm/i915/i915_vma.c               | 51 
>>>>>>> +++++++++++++++++--
>>>>>>>  drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>>>>>>  include/uapi/drm/i915_drm.h                   |  3 +-
>>>>>>>  4 files changed, 51 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>> index d87d1210365b..36651b447966 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>> @@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct 
>>>>>>> i915_address_space *vm,
>>>>>>>       */
>>>>>>>      obj = vma->obj;
>>>>>>>      i915_gem_object_lock(obj, NULL);
>>>>>>> -    i915_vma_destroy(vma);
>>>>>>> +    i915_vma_destroy_async(vma);
>>>>>>>      i915_gem_object_unlock(obj);
>>>>>>>      i915_gem_object_put(obj);
>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>>>> b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>> index 7cf77c67d755..483d25f2425c 100644
>>>>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>> @@ -42,6 +42,8 @@
>>>>>>>  #include "i915_vma.h"
>>>>>>>  #include "i915_vma_resource.h"
>>>>>>> +static struct dma_fence *__i915_vma_unbind_async(struct i915_vma 
>>>>>>> *vma);
>>>>>>> +
>>>>>>>  static inline void assert_vma_held_evict(const struct i915_vma 
>>>>>>> *vma)
>>>>>>>  {
>>>>>>>      /*
>>>>>>> @@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>>>>>>      spin_unlock_irq(&gt->closed_lock);
>>>>>>>  }
>>>>>>> -static void force_unbind(struct i915_vma *vma)
>>>>>>> +static void force_unbind(struct i915_vma *vma, bool async)
>>>>>>>  {
>>>>>>>      if (!drm_mm_node_allocated(&vma->node))
>>>>>>>          return;
>>>>>>> @@ -1727,7 +1729,21 @@ static void force_unbind(struct i915_vma 
>>>>>>> *vma)
>>>>>>>          i915_vma_set_purged(vma);
>>>>>>>      atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>>>>>> -    WARN_ON(__i915_vma_unbind(vma));
>>>>>>> +    if (async) {
>>>>>>> +        struct dma_fence *fence;
>>>>>>> +
>>>>>>> +        fence = __i915_vma_unbind_async(vma);
>>>>>>> +        if (IS_ERR_OR_NULL(fence)) {
>>>>>>> +            async = false;
>>>>>>> +        } else {
>>>>>>> +            dma_resv_add_fence(vma->obj->base.resv, fence,
>>>>>>> +                       DMA_RESV_USAGE_READ);
>>>>>>> +            dma_fence_put(fence);
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (!async)
>>>>>>> +        WARN_ON(__i915_vma_unbind(vma));
>>>>>>>      GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>>>>>>  }
>>>>>>> @@ -1787,7 +1803,7 @@ void i915_vma_destroy_locked(struct 
>>>>>>> i915_vma *vma)
>>>>>>>  {
>>>>>>>      lockdep_assert_held(&vma->vm->mutex);
>>>>>>> -    force_unbind(vma);
>>>>>>> +    force_unbind(vma, false);
>>>>>>>      list_del_init(&vma->vm_link);
>>>>>>>      release_references(vma, vma->vm->gt, false);
>>>>>>>  }
>>>>>>> @@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>>>>>>      bool vm_ddestroy;
>>>>>>>      mutex_lock(&vma->vm->mutex);
>>>>>>> -    force_unbind(vma);
>>>>>>> +    force_unbind(vma, false);
>>>>>>> +    list_del_init(&vma->vm_link);
>>>>>>> +    vm_ddestroy = vma->vm_ddestroy;
>>>>>>> +    vma->vm_ddestroy = false;
>>>>>>> +
>>>>>>> +    /* vma->vm may be freed when releasing vma->vm->mutex. */
>>>>>>> +    gt = vma->vm->gt;
>>>>>>> +    mutex_unlock(&vma->vm->mutex);
>>>>>>> +    release_references(vma, gt, vm_ddestroy);
>>>>>>> +}
>>>>>>> +
>>>>>>> +void i915_vma_destroy_async(struct i915_vma *vma)
>>>>>>> +{
>>>>>>> +    bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>>>>>> +    struct intel_gt *gt;
>>>>>>> +
>>>>>>> +    if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>>>>>> +        async = false;
>>>>>>> +
>>>>>>> +    mutex_lock(&vma->vm->mutex);
>>>>>>> +    /*
>>>>>>> +     * Ensure any asynchronous binding is complete while using
>>>>>>> +     * async unbind as we will be releasing the vma here.
>>>>>>> +     */
>>>>>>> +    if (async && i915_active_wait(&vma->active))
>>>>>>> +        async = false;
>>>>>>> +
>>>>>>> +    force_unbind(vma, async);
>>>>>>>      list_del_init(&vma->vm_link);
>>>>>>>      vm_ddestroy = vma->vm_ddestroy;
>>>>>>>      vma->vm_ddestroy = false;
>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>>>> b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>> index 737ef310d046..25f15965dab8 100644
>>>>>>> --- a/drivers/gpu/drm/i915/i915_vma.h
>>>>>>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>> @@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>>>>>>  void i915_vma_destroy_locked(struct i915_vma *vma);
>>>>>>>  void i915_vma_destroy(struct i915_vma *vma);
>>>>>>> +void i915_vma_destroy_async(struct i915_vma *vma);
>>>>>>>  #define assert_vma_held(vma) 
>>>>>>> dma_resv_assert_held((vma)->obj->base.resv)
>>>>>>> diff --git a/include/uapi/drm/i915_drm.h 
>>>>>>> b/include/uapi/drm/i915_drm.h
>>>>>>> index e5600f358a15..431d40bb1dee 100644
>>>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>>>> @@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>>>>>>   * any error.
>>>>>>>   *
>>>>>>>   * VM_BIND/UNBIND ioctl calls executed on different CPU threads 
>>>>>>> concurrently
>>>>>>> - * are not ordered.
>>>>>>> + * are not ordered. Furthermore, parts of the VM_UNBIND 
>>>>>>> operation can be done
>>>>>>> + * asynchronously.
>>>>>>>   */
>>>>>>>  struct drm_i915_gem_vm_unbind {
>>>>>>>      /** @vm_id: VM (address space) id to bind */
