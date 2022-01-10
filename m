Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F00489B69
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 15:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177A113016;
	Mon, 10 Jan 2022 14:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE2A113016;
 Mon, 10 Jan 2022 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641825519; x=1673361519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MtNzz+5rxyQC5oWxcoT7Z5kAhxqd88KZuYQg8jZPW70=;
 b=U5Ptgjq/hNlw7M41QdoBKxOkKmbGQ3edpxPy6ZY50ryz4PMu7tGrJe8q
 eNTVypKNz2q5S9S6UZj+V+2V/EsjAvOoLG1O0boF/MWLZYNclKs3+aXus
 Xjc6rRucz+v4Oxmqy3QtdVWdnnmkCHGBwWPtwEg8j5ebuSDcpdilOZQTU
 ur9iCQ4naW8o/nXqnikOTUrVwL9cJNfe/pmjwszTXzvaVmz2PmqZ6fFqk
 MnPNvRCqjYUzrPLE7hAyZjUMDMmFSPZLN9KCk6cnprdt5mk8CQ26KBpoW
 72brD6chC2SalBoUrnsFJ+R1aQfMXourfhLV7gWTXTnMfKFvs9lRCsKk3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="329580360"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="329580360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 06:38:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="472086588"
Received: from ptquigle-mobl1.ger.corp.intel.com (HELO [10.213.218.74])
 ([10.213.218.74])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 06:38:37 -0800
Message-ID: <73ee7839-ab74-977d-580f-a601378986e4@intel.com>
Date: Mon, 10 Jan 2022 14:38:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 5/6] drm/i915: Asynchronous migration selftest
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220107142343.56811-1-thomas.hellstrom@linux.intel.com>
 <20220107142343.56811-6-thomas.hellstrom@linux.intel.com>
 <3585abc4-f624-6046-1a49-d13d182ff04d@intel.com>
 <41339631-aad2-6e63-fccb-aa6f058d6045@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <41339631-aad2-6e63-fccb-aa6f058d6045@linux.intel.com>
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

On 10/01/2022 14:36, Thomas Hellström wrote:
> 
> On 1/10/22 14:59, Matthew Auld wrote:
>> On 07/01/2022 14:23, Thomas Hellström wrote:
>>> Add a selftest to exercise asynchronous migration and -unbining.
>>> Extend the gem_migrate selftest to perform the migrations while
>>> depending on a spinner and a bound vma set up on the migrated
>>> buffer object.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  12 ++
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   3 +
>>>   .../drm/i915/gem/selftests/i915_gem_migrate.c | 192 ++++++++++++++++--
>>>   3 files changed, 192 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> index d87b508b59b1..1a9e1f940a7d 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -756,6 +756,18 @@ i915_gem_object_get_moving_fence(struct 
>>> drm_i915_gem_object *obj)
>>>       return dma_fence_get(i915_gem_to_ttm(obj)->moving);
>>>   }
>>>   +void i915_gem_object_set_moving_fence(struct drm_i915_gem_object 
>>> *obj,
>>> +                      struct dma_fence *fence)
>>> +{
>>> +    struct dma_fence **moving = &i915_gem_to_ttm(obj)->moving;
>>> +
>>> +    if (*moving == fence)
>>> +        return;
>>> +
>>> +    dma_fence_put(*moving);
>>> +    *moving = dma_fence_get(fence);
>>> +}
>>> +
>>>   /**
>>>    * i915_gem_object_wait_moving_fence - Wait for the object's moving 
>>> fence if any
>>>    * @obj: The object whose moving fence to wait for.
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> index f66d46882ea7..1d17ffff8236 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -524,6 +524,9 @@ i915_gem_object_finish_access(struct 
>>> drm_i915_gem_object *obj)
>>>   struct dma_fence *
>>>   i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
>>>   +void i915_gem_object_set_moving_fence(struct drm_i915_gem_object 
>>> *obj,
>>> +                      struct dma_fence *fence);
>>> +
>>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>                         bool intr);
>>>   diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> index ecb691c81d1e..d534141b2cf7 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> @@ -4,8 +4,13 @@
>>>    */
>>>     #include "gt/intel_migrate.h"
>>> +#include "gt/intel_gpu_commands.h"
>>>   #include "gem/i915_gem_ttm_move.h"
>>>   +#include "i915_deps.h"
>>> +
>>> +#include "selftests/igt_spinner.h"
>>> +
>>>   static int igt_fill_check_buffer(struct drm_i915_gem_object *obj,
>>>                    bool fill)
>>>   {
>>> @@ -101,7 +106,8 @@ static int igt_same_create_migrate(void *arg)
>>>   }
>>>     static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
>>> -                  struct drm_i915_gem_object *obj)
>>> +                  struct drm_i915_gem_object *obj,
>>> +                  struct i915_vma *vma)
>>>   {
>>>       int err;
>>>   @@ -109,6 +115,24 @@ static int lmem_pages_migrate_one(struct 
>>> i915_gem_ww_ctx *ww,
>>>       if (err)
>>>           return err;
>>>   +    if (vma) {
>>> +        err = i915_vma_pin_ww(vma, ww, obj->base.size, 0,
>>> +                      0UL | PIN_OFFSET_FIXED |
>>> +                      PIN_USER);
>>> +        if (err) {
>>> +            if (err != -EINTR && err != ERESTARTSYS &&
>>> +                err != -EDEADLK)
>>> +                pr_err("Failed to pin vma.\n");
>>> +            return err;
>>> +        }
>>> +
>>> +        i915_vma_unpin(vma);
>>> +    }
>>> +
>>> +    /*
>>> +     * Migration will implicitly unbind (asynchronously) any bound
>>> +     * vmas.
>>> +     */
>>>       if (i915_gem_object_is_lmem(obj)) {
>>>           err = i915_gem_object_migrate(obj, ww, INTEL_REGION_SMEM);
>>>           if (err) {
>>> @@ -149,11 +173,15 @@ static int lmem_pages_migrate_one(struct 
>>> i915_gem_ww_ctx *ww,
>>>       return err;
>>>   }
>>>   -static int igt_lmem_pages_migrate(void *arg)
>>> +static int __igt_lmem_pages_migrate(struct intel_gt *gt,
>>> +                    struct i915_address_space *vm,
>>> +                    struct i915_deps *deps,
>>> +                    struct igt_spinner *spin,
>>> +                    struct dma_fence *spin_fence)
>>>   {
>>> -    struct intel_gt *gt = arg;
>>>       struct drm_i915_private *i915 = gt->i915;
>>>       struct drm_i915_gem_object *obj;
>>> +    struct i915_vma *vma = NULL;
>>>       struct i915_gem_ww_ctx ww;
>>>       struct i915_request *rq;
>>>       int err;
>>> @@ -165,6 +193,14 @@ static int igt_lmem_pages_migrate(void *arg)
>>>       if (IS_ERR(obj))
>>>           return PTR_ERR(obj);
>>>   +    if (vm) {
>>> +        vma = i915_vma_instance(obj, vm, NULL);
>>> +        if (IS_ERR(vma)) {
>>> +            err = PTR_ERR(vma);
>>> +            goto out_put;
>>> +        }
>>> +    }
>>> +
>>>       /* Initial GPU fill, sync, CPU initialization. */
>>>       for_i915_gem_ww(&ww, err, true) {
>>>           err = i915_gem_object_lock(obj, &ww);
>>> @@ -175,25 +211,23 @@ static int igt_lmem_pages_migrate(void *arg)
>>>           if (err)
>>>               continue;
>>>   -        err = intel_migrate_clear(&gt->migrate, &ww, NULL,
>>> +        err = intel_migrate_clear(&gt->migrate, &ww, deps,
>>>                         obj->mm.pages->sgl, obj->cache_level,
>>>                         i915_gem_object_is_lmem(obj),
>>>                         0xdeadbeaf, &rq);
>>>           if (rq) {
>>>               dma_resv_add_excl_fence(obj->base.resv, &rq->fence);
>>> +            i915_gem_object_set_moving_fence(obj, &rq->fence);
>>>               i915_request_put(rq);
>>>           }
>>>           if (err)
>>>               continue;
>>>   -        err = i915_gem_object_wait(obj, I915_WAIT_INTERRUPTIBLE,
>>> -                       5 * HZ);
>>> -        if (err)
>>> -            continue;
>>> -
>>> -        err = igt_fill_check_buffer(obj, true);
>>> -        if (err)
>>> -            continue;
>>> +        if (!vma) {
>>> +            err = igt_fill_check_buffer(obj, true);
>>> +            if (err)
>>> +                continue;
>>
>> Don't we need some kind of sync in here?
> 
> Thanks for reviewing!
> 
> That sync is taken care of by the moving fence which is waited for when 
> we first map the buffer.

Oh, indeed.

> 
>>
>> Otherwise,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
> /Thomas
> 
> 
