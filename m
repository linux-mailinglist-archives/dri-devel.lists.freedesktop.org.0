Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E875B0D2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 16:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5332610E105;
	Thu, 20 Jul 2023 14:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D058B10E105;
 Thu, 20 Jul 2023 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689862079; x=1721398079;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fkOrIGasCIEV+d70lGpWcyzMjM8Fkq3TVcQW+FGqEn8=;
 b=b8br2NljgB52NH1Tt6TH/7nTHB/aGbL2wpXjaflmqh9kCgTQqeOzoWYq
 Bitw5a4U2TZRK6VItZg/LgS8B/g+ReKfce9GJsMWbapnzdwcxuws7qOql
 aeAONVjaPc/ngxeerhc11oD4Z3MVlyBso5Jt1/WOrUDMSoAVeKVnh782b
 kXor9ftLp+FoLwfWS7afN+SmiWaeWt+6Hzw+XEQksfnGAi8uTVdF9XqQu
 Sn1FSTQEKLYDVBiXmX+DUjtrk7wbf0POR3zoNOgnaoZ1rgQl1C1ZyS3q3
 lwpi++m3hqmYuN/B/pvmnhrTEpEVQHuKQdPGxvW/gblbbX4GauUN2zcUr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369408045"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="369408045"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 06:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848450205"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="848450205"
Received: from ctuohy-mobl1.ger.corp.intel.com (HELO [10.213.193.21])
 ([10.213.193.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 06:39:04 -0700
Message-ID: <51198371-0943-e4fc-41d8-4c3ac07409cf@linux.intel.com>
Date: Thu, 20 Jul 2023 14:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, "Yang, Fei" <fei.yang@intel.com>
References: <20230719123730.1094726-1-tvrtko.ursulin@linux.intel.com>
 <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230720002208.GU209733@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230720002208.GU209733@mdroper-desk1.amr.corp.intel.com>
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


On 20/07/2023 01:22, Matt Roper wrote:
> On Wed, Jul 19, 2023 at 05:07:15PM -0700, Yang, Fei wrote:
>> [snip]
>>>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>>>
>>> The code change here looks accurate, but while we're here, I have a side
>>> question about this function in general...it was originally introduced
>>> in commit 48004881f693 ("drm/i915: Mark CPU cache as dirty when used for
>>> rendering") which states that GPU rendering ends up in the CPU cache
>>> (and thus needs a clflush later to make sure it lands in memory).  That
>>> makes sense to me for LLC platforms, but is it really true for non-LLC
>>> snooping platforms (like MTL) as the commit states?
>>
>> For non-LLC platforms objects can be set to 1-way coherent which means
>> GPU rendering ending up in CPU cache as well, so for non-LLC platform
>> the logic here should be checking 1-way coherent flag.
> 
> That's the part that I'm questioning (and not just for MTL, but for all
> of our other non-LLC platforms too).  Just because there's coherency
> doesn't mean that device writes landed in the CPU cache.  Coherency is
> also achieved if device writes invalidate the contents of the CPU cache.
> I thought our non-LLC snooping platforms were coherent due to
> write-invalidate rather than write-update, but I can't find it
> specifically documented anywhere at the moment.  If write-invalidate was
> used, then there shouldn't be a need for a later clflush either.

[Trying to consolidate by doing a combined reply to the discussion so far.]

On the write-invalidate vs write-update I don't know. If you did not 
find it in bspec then I doubt I would. I can have a browse still.

>>> My understanding
>>> was that snooping platforms just invalidated the CPU cache to prevent
>>> future CPU reads from seeing stale data but didn't actually stick any
>>> new data in there?  Am I off track or is the original logic of this
>>> function not quite right?
>>>
>>> Anyway, even if the logic of this function is wrong, it's a mistake that
>>> would only hurt performance
>>
>> Yes, this logic will introduce performance impact because it's missing the
>> checking for obj->pat_set_by_user. For objects with pat_set_by_user==true,
>> even if the object is snooping or 1-way coherent, we don't want to enforce
>> a clflush here since the coherency is supposed to be handled by user space.

What should I add you think to fix it?

Add a check for non-coherent WB in gpu_write_needs_clflush as an 
additional condition for returning false?

And then if Matt is correct write-invalidate is used also !HAS_LLC 
should just return false?

>>> (flushing more often than we truly need to)
>>> rather than functionality, so not something we really need to dig into
>>> right now as part of this patch.
>>>
>>>>       if (IS_DGFX(i915))
>>>>               return false;
>>>>
>>>> -    /*
>>>> -     * For objects created by userspace through GEM_CREATE with pat_index
>>>> -     * set by set_pat extension, i915_gem_object_has_cache_level() will
>>>> -     * always return true, because the coherency of such object is managed
>>>> -     * by userspace. Othereise the call here would fall back to checking
>>>> -     * whether the object is un-cached or write-through.
>>>> -     */
>>>> -    return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>>>> -             i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>>>> +    return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
>>>> +           i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) != 1;
>>>>   }
>>
>> [snip]
>>>> @@ -640,15 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
>>>>       if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
>>>>               return false;
>>>>
>>>> -    /*
>>>> -     * For objects created by userspace through GEM_CREATE with pat_index
>>>> -     * set by set_pat extension, i915_gem_object_has_cache_level() always
>>>> -     * return true, otherwise the call would fall back to checking whether
>>>> -     * the object is un-cached.
>>>> -     */
>>>>       return (cache->has_llc ||
>>>>               obj->cache_dirty ||
>>>> -            !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
>>>> +            i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1);
>>>
>>> Platforms with relocations and platforms with user-specified PAT have no
>>> overlap, right?  So a -1 return should be impossible here and this is
>>> one case where we could just treat the return value as a boolean, right?
>>

Hm no, or maybe. My thinking behind tri-state is to allow a safe option 
for "don't know". In case PAT index to cache mode table is not fully 
populated on some future platform.

>> My understanding is that the condition here means to say that, if GPU
>> access is uncached, don't use CPU reloc because the CPU cache might
>> contain stale data. This condition is sufficient for snooping platforms.
>> But from MTL onward, the condition show be whether the GPU access is
>> coherent with CPU. So, we should be checking 1-way coherent flag instead
>> of UC mode, because even if the GPU access is WB, it's still non-coherent,
>> thus CPU cache could be out-dated.

Honestly the matrix of caching decision/logic is huge.. Could we re-use 
one of the "coherent for read/write" here? From which point of view are 
those flags looking, and from which point of view do we need it to be?

You are saying question is whether GPU reads are coherent with CPU 
writes, will the GPU see CPU writes?

Why would the condition then be "not UC"? Hm maybe because it is slow so 
we want to avoid it?

What would it mean for Meteorlake? 1-way coherent WB, which way is one 
way? :)

In his reply elsewhere Matt seems to be suggesting WB and WB-1-way are 
coherent in this aspect, and that actually WT and UC are not, I'll quote:

"""
Does the has_wb_mode here matter?  I think MTL's WT (PAT 1) and UC (PAT
2) are also problematic because the GPU still won't snoop the CPU caches
and can potentially read whatever data was in the buffer before a CPU
memory clearing operation, right?  Basically anything besides PAT3 and
PAT4 on MTL can miss updates that are still sitting in the CPU cache.
"""

Also, how does this relate to i915_gem_object_can_bypass_llc. Should we 
use similar logic at both places - "can GPU not see some CPU update". 
Just that the MOCS angle and I915_BO_ALLOC_USER alloc user do not apply 
in use_cpu_reloc.

> My point is that this is relocation code --- it should be impossible to
> get here on MTL and beyond, right?  So user-provided PAT isn't a
> consideration.

Ah no, it isn't, but.. one of the most important points why I wanted to 
clean this up is to make it generic. Like if we enable set_pat extension 
on any platform it just works as long as the pat-to-cache table is 
correctly defined.

So I wouldn't dismiss that goal and if in the process we achieve some 
good comments and clarifications in the code base that would be a great 
result I think.

Regards,

Tvrtko

>>
>> [snip]
>>>> @@ -208,12 +230,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>>>       if (!(obj->flags & I915_BO_ALLOC_USER))
>>>>               return false;
>>>>
>>>> -    /*
>>>> -     * Always flush cache for UMD objects at creation time.
>>>> -     */
>>>> -    if (obj->pat_set_by_user)
>>>> -            return true;
>>>> -
>>
>> I'm still worried that the removal of these lines would cause the
>> MESA failure seen before. I know you are checking pat index below, but
>> that is only about GPU access. It doesn't tell you how CPU is going to
>> access the memory. If user space is setting an uncached PAT, then use
>> copy engine to zero out the memory, but on the CPU side the mapping is
>> cacheable, you could still seeing garbage data.
>>
>> I agree the lines don't belong here because it doesn't have anything
>> to do with LLC, but they need to be moved to the right location instead
>> of being removed.
> 
> These lines got replaced with a check for the specific PAT indices that
> are problematic rather than just assuming any user-provided PAT might
> cause problems.  But I had some concerns about the specific logic there
> in my review as well.
> 
> 
> Matt
> 
>>
>>>>       /*
>>>>        * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
>>>>        * possible for userspace to bypass the GTT caching bits set by the
>>>> @@ -226,7 +242,21 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>>>        * it, but since i915 takes the stance of always zeroing memory before
>>>>        * handing it to userspace, we need to prevent this.
>>>>        */
>>>> -    return IS_JSL_EHL(i915);
>>>> +    if (IS_JSL_EHL(i915))
>>>> +            return true;
>>>> +
> 
