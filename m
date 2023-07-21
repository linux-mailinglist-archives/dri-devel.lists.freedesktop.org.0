Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286F75C752
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 15:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7553010E67D;
	Fri, 21 Jul 2023 13:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FDB10E1CF;
 Fri, 21 Jul 2023 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689944802; x=1721480802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xXsuqCWdym2S0hySUxga2iBDrRJ9HwKyAO+y/eEJfMk=;
 b=Uqborjjthu1UYIvX1NnVJSJ1v5FSpDsKwuw4T7Eb4MVhM0xdt1fD/izo
 WMzDocHR74hBafcG3l+7IuDVqo1Oh6MrUGop2ZshKphaDb86ZIrd1wrfr
 dUaE99FojUOgPbW3foJTt4jR/nGA5zWdYYvp+4od+315fFwKm1+ghKQJE
 NUqyyE8mOADRf2xhMzbm8QtQd7Q7/eGEoBPRbBp6MneBdTBbz1Tu5vreG
 xYENIaCy1q5R06fbsDXD7IvaKtE+obOi4D0E0/Or7kfnhruiAA4yfyx9K
 h9dpbR77NzGXkf4crmO8Tnxa5WH/wohFSalAPPvZ3zQUIYOSPmTjDG/3f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397909397"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="397909397"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971435713"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="971435713"
Received: from sahilama-mobl1.ger.corp.intel.com (HELO [10.213.213.22])
 ([10.213.213.22])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:06:40 -0700
Message-ID: <53669e49-7d0e-b2e8-943e-f8ea35beaa6e@linux.intel.com>
Date: Fri, 21 Jul 2023 14:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20230719123730.1094726-1-tvrtko.ursulin@linux.intel.com>
 <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230720002208.GU209733@mdroper-desk1.amr.corp.intel.com>
 <51198371-0943-e4fc-41d8-4c3ac07409cf@linux.intel.com>
 <BYAPR11MB2567836F0A56371CC86111739A3FA@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB2567836F0A56371CC86111739A3FA@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2023 05:28, Yang, Fei wrote:
>>>> [snip]
>>>>>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct
>>>>>> drm_i915_gem_object *obj)
>>>>>
>>>>> The code change here looks accurate, but while we're here, I have a
>>>>> side question about this function in general...it was originally
>>>>> introduced in commit 48004881f693 ("drm/i915: Mark CPU cache as
>>>>> dirty when used for
>>>>> rendering") which states that GPU rendering ends up in the CPU cache
>>>>> (and thus needs a clflush later to make sure it lands in memory).
>>>>> That makes sense to me for LLC platforms, but is it really true for
>>>>> non-LLC snooping platforms (like MTL) as the commit states?
>>>>
>>>> For non-LLC platforms objects can be set to 1-way coherent which
>>>> means GPU rendering ending up in CPU cache as well, so for non-LLC
>>>> platform the logic here should be checking 1-way coherent flag.
>>>
>>> That's the part that I'm questioning (and not just for MTL, but for
>>> all of our other non-LLC platforms too).  Just because there's
>>> coherency doesn't mean that device writes landed in the CPU cache.
>>> Coherency is also achieved if device writes invalidate the contents of the CPU cache.
>>> I thought our non-LLC snooping platforms were coherent due to
>>> write-invalidate rather than write-update, but I can't find it
>>> specifically documented anywhere at the moment.  If write-invalidate
>>> was used, then there shouldn't be a need for a later clflush either.
>>
>> [Trying to consolidate by doing a combined reply to the discussion so far.]
>>
>> On the write-invalidate vs write-update I don't know. If you did not
>> find it in bspec then I doubt I would. I can have a browse still.
> 
> Matt was correct. Quote Ron Silvas from SW ARCH, "MTL GPU doesn't write to
> CPU cache, it simply snoop CPU cache on its way to RAM."

Does it apply to all snooping platforms?

And for the cache level/mode based condition, how about replacing it with this:

	/*
	 * Fully coherent cached access may end up with data in the CPU cache
	 * which hasn't hit memory yet.
	 */
	return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
	       i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W);

?

Although that would mean old I915_CACHE_LLC on old platforms is actually 2-way coherent.

I am struggling to find a comprehensive explanation in bspec, but for instance 605 makes it sounds like it is fully coherent. Perhaps it really is and I should fix the legacy and Gen12 table..

And if the write-invalidate applies to all snooping platforms then we extend it to:

	/*
	 * Fully coherent cached access may end up with data in the CPU cache
	 * which hasn't hit memory yet.
	 *
	 * But not on snooping platforms, where it is impossible due
	 * write-invalidate.
	 */
	return !HAS_SNOOP(i915) &&
	       (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
	        i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W));

That would prevent any flushing on MTL and make you happy from that aspect.

In fact, the snooping check could be before the cache mode check.

For i915_gem_object_can_bypass_llc it would be ideal if a condition based on the absence of I915_BO_CACHE_COHERENT_FOR_WRITE would work. At least according to the kerneldoc for @cache_coherent:

	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
	 *
	 * When writing through the CPU cache, the GPU is still coherent. Note
	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.

So for objects without it set, we need to force a flush.

And make __i915_gem_object_update_coherency not set it for WB without 1-way coherency set.

According to bspec that would seem correct, because with 1-way snooping on MTL, GPU snoops the IA until first GPU access. So anything the CPU writes before the first GPU access would be coherent and so no need to flush in set pages. But if non-coherent WB is set then we need to flush.

I'll trybot it is and see what happens.

>>>>> My understanding
>>>>> was that snooping platforms just invalidated the CPU cache to
>>>>> prevent future CPU reads from seeing stale data but didn't actually
>>>>> stick any new data in there?  Am I off track or is the original
>>>>> logic of this function not quite right?
>>>>>
>>>>> Anyway, even if the logic of this function is wrong, it's a mistake
>>>>> that would only hurt performance
>>>>
>>>> Yes, this logic will introduce performance impact because it's
>>>> missing the checking for obj->pat_set_by_user. For objects with
>>>> pat_set_by_user==true, even if the object is snooping or 1-way
>>>> coherent, we don't want to enforce a clflush here since the
>>>> coherency is supposed to be handled by user space.
>>
>> What should I add you think to fix it?
> 
> I think the simplest would be
> 
>          if (obj->pat_set_by_user)
>                  return false;
> 
> because even checking for incoherent WB is unnecessary, simply no
> need for the KMD to initiate a flush if PAT is set by user.
> 
>> Add a check for non-coherent WB in gpu_write_needs_clflush as an additional condition for returning false?
>>
>> And then if Matt is correct write-invalidate is used also !HAS_LLC should just return false?
>>
>>>>> (flushing more often than we truly need to) rather than
>>>>> functionality, so not something we really need to dig into right now
>>>>> as part of this patch.
>>>>>
>>>>>>        if (IS_DGFX(i915))
>>>>>>                return false;
>>>>>>
>>>>>> -    /*
>>>>>> -     * For objects created by userspace through GEM_CREATE with pat_index
>>>>>> -     * set by set_pat extension, i915_gem_object_has_cache_level() will
>>>>>> -     * always return true, because the coherency of such object is managed
>>>>>> -     * by userspace. Othereise the call here would fall back to checking
>>>>>> -     * whether the object is un-cached or write-through.
>>>>>> -     */
>>>>>> -    return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>>>>>> -             i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>>>>>> +    return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
>>>>>> +           i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) != 1;
>>>>>>    }
>>>>
>>>> [snip]
>>>>>> @@ -640,15 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
>>>>>>        if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
>>>>>>                return false;
>>>>>>
>>>>>> -    /*
>>>>>> -     * For objects created by userspace through GEM_CREATE with pat_index
>>>>>> -     * set by set_pat extension, i915_gem_object_has_cache_level() always
>>>>>> -     * return true, otherwise the call would fall back to checking whether
>>>>>> -     * the object is un-cached.
>>>>>> -     */
>>>>>>        return (cache->has_llc ||
>>>>>>                obj->cache_dirty ||
>>>>>> -            !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
>>>>>> +            i915_gem_object_has_cache_mode(obj,
>>>>>> + I915_CACHE_MODE_UC) != 1);
>>>>>
>>>>> Platforms with relocations and platforms with user-specified PAT
>>>>> have no overlap, right?  So a -1 return should be impossible here
>>>>> and this is one case where we could just treat the return value as
>>>>> a boolean, right?
>>>>
>>
>> Hm no, or maybe. My thinking behind tri-state is to allow a safe option
>> for "don't know". In case PAT index to cache mode table is not fully
>> populated on some future platform.
> 
> That would be a problem in the cache mode table. At least max_pat_index
> should have guaranteed the PAT index is sane.

Yeah I dropped it locally already.

Regards,

Tvrtko
