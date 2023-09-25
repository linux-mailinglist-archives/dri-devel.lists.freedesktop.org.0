Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300D7AD933
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 15:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF98410E181;
	Mon, 25 Sep 2023 13:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209B710E181;
 Mon, 25 Sep 2023 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648754; x=1727184754;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3TV8k760UD1UFqxxlB7EBKun4pHo9MP+G3d7gt47Bhs=;
 b=ey6usc//5W0IhNr++l6v4ntSkGPWX4lKGFSvAhTeeaf88Gqs11nSDj7a
 o+l3gk9jzc7ZXBXocStv5VN2vWgNfb1lSky9jBNpq+VnUx+q+kL3u3eUY
 PNZLn+WW/zt7I29TyiNyrNgS4NToiwVi0mCfw9N7aPVFQyKG3HhpczxOW
 K431p1BwBTww7JX+nvOLlDJ2q/wKjvM1XcVPXCD7/kfQTGTZTyRKB58CG
 oQ0T3NIQW4FMJYVJRf2/sAIHehfdYZ5TkJChPZR+x6adkLegYkNChic+V
 40u+4UpVgGhJSfF2WM1bTJQRHDMzTU3rn5BU20FHT2a8QPjj/DOUCxVH5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371570247"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="371570247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="813967587"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="813967587"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.39.241])
 ([10.252.39.241])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:32:31 -0700
Message-ID: <035f91ae-1ab1-2cde-d652-23d0c0ea2795@linux.intel.com>
Date: Mon, 25 Sep 2023 15:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt
 aware
To: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230922123541.23822-1-nirmoy.das@intel.com>
 <7d041873-82f0-77f4-f8f6-5aa5799d41b7@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <7d041873-82f0-77f4-f8f6-5aa5799d41b7@intel.com>
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/25/2023 3:23 PM, Andrzej Hajda wrote:
> On 22.09.2023 14:35, Nirmoy Das wrote:
>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> Where applicable, use for_each_gt instead of to_gt in the
>> i915_gem_shrinker functions to make them apply to more than just the
>> primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
>> requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
>> VMAs from all GTs.
>>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 44 ++++++++++++--------
>>   1 file changed, 26 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> index 214763942aa2..3ef1fd32f80a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/vmalloc.h>
>>     #include "gt/intel_gt_requests.h"
>> +#include "gt/intel_gt.h"
>>     #include "i915_trace.h"
>>   @@ -119,7 +120,8 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>>       intel_wakeref_t wakeref = 0;
>>       unsigned long count = 0;
>>       unsigned long scanned = 0;
>> -    int err = 0;
>> +    int err = 0, i = 0;
>> +    struct intel_gt *gt;
>>         /* CHV + VTD workaround use stop_machine(); need to trylock 
>> vm->mutex */
>>       bool trylock_vm = !ww && intel_vm_no_concurrent_access_wa(i915);
>> @@ -147,9 +149,11 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>>        * what we can do is give them a kick so that we do not keep idle
>>        * contexts around longer than is necessary.
>>        */
>> -    if (shrink & I915_SHRINK_ACTIVE)
>> -        /* Retire requests to unpin all idle contexts */
>> -        intel_gt_retire_requests(to_gt(i915));
>> +    if (shrink & I915_SHRINK_ACTIVE) {
>> +        for_each_gt(gt, i915, i)
>> +            /* Retire requests to unpin all idle contexts */
>> +            intel_gt_retire_requests(to_gt(i915));
>
>
> to_gt(...) -> gt ?


Wow, a huge miss. Thanks will resend!

>
>
>> +    }
>>         /*
>>        * As we may completely rewrite the (un)bound list whilst 
>> unbinding
>> @@ -389,6 +393,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, 
>> unsigned long event, void *ptr
>>       struct i915_vma *vma, *next;
>>       unsigned long freed_pages = 0;
>>       intel_wakeref_t wakeref;
>> +    struct intel_gt *gt;
>> +    int i;
>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>>           freed_pages += i915_gem_shrink(NULL, i915, -1UL, NULL,
>> @@ -397,24 +403,26 @@ i915_gem_shrinker_vmap(struct notifier_block 
>> *nb, unsigned long event, void *ptr
>>                              I915_SHRINK_VMAPS);
>>         /* We also want to clear any cached iomaps as they wrap vmap */
>> -    mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
>> -    list_for_each_entry_safe(vma, next,
>> -                 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
>> -        unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
>> -        struct drm_i915_gem_object *obj = vma->obj;
>> -
>> -        if (!vma->iomap || i915_vma_is_active(vma))
>> -            continue;
>> +    for_each_gt(gt, i915, i) {
>> +        mutex_lock(&gt->ggtt->vm.mutex);
>> +        list_for_each_entry_safe(vma, next,
>> +                     &gt->ggtt->vm.bound_list, vm_link) {
>> +            unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
>> +            struct drm_i915_gem_object *obj = vma->obj;
>> +
>> +            if (!vma->iomap || i915_vma_is_active(vma))
>> +                continue;
>>   -        if (!i915_gem_object_trylock(obj, NULL))
>> -            continue;
>> +            if (!i915_gem_object_trylock(obj, NULL))
>> +                continue;
>>   -        if (__i915_vma_unbind(vma) == 0)
>> -            freed_pages += count;
>> +            if (__i915_vma_unbind(vma) == 0)
>> +                freed_pages += count;
>>   -        i915_gem_object_unlock(obj);
>> +            i915_gem_object_unlock(obj);
>> +        }
>> +        mutex_unlock(&gt->ggtt->vm.mutex);
>>       }
>> -    mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
>
>
> This seems correct.
>
> With 1st stanza fixed:
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks,

Nirmoy

>
> Regards
> Andrzej
>
>
>>         *(unsigned long *)ptr += freed_pages;
>>       return NOTIFY_DONE;
>
