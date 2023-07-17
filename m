Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068AE7560F4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358FC10E22F;
	Mon, 17 Jul 2023 10:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253F610E22E;
 Mon, 17 Jul 2023 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689591340; x=1721127340;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xps+SIemJrg8pCSKLtnekhqP9E94qto84/VXDgnNiXA=;
 b=N/6JVK+40YuSas8tAVX7bKJWI6tYKCgWWELvLBLfqc5nCTPfsq3qjQmX
 4t0z+k16BpvKjxF0K4sg5u6Jkg/J50vOj3Za0Rk1Wb3+IJBzhc3lT/MHm
 VI4dxgvIKFgQTxEPOELI20XUiiQKOIaK7wZaotX0lafs6AyHOjAgxM7CG
 kB5RgDW9MbZrpVC5R3lk3x8/A2iU0gm6bTCUh8eBbNQbSyWYhdEldHOff
 AefO6XsmS10xVJ85gZyL0nAfChHYt5VUP7jB8DdbkGUd6sAUd4YUie6OL
 FBNZW3HbDiXPefSEgEDM0Hj/dRmLGuql7OY7Zhbt6cIn6WhoJVMcKiqeb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="429660569"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="429660569"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="723170663"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="723170663"
Received: from rgwhiteh-mobl1.ger.corp.intel.com (HELO [10.213.205.103])
 ([10.213.205.103])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:55:32 -0700
Message-ID: <b9afd2fe-426e-7d4a-2768-44c6d2507e29@linux.intel.com>
Date: Mon, 17 Jul 2023 11:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
 <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB25673D3525AF7C5A5FFB44129A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
 <999114a1-e334-5de9-065e-9a5d3801e23e@linux.intel.com>
 <20230715002023.GA138014@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230715002023.GA138014@mdroper-desk1.amr.corp.intel.com>
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
Cc: "Yang, Fei" <fei.yang@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/07/2023 01:20, Matt Roper wrote:
> On Fri, Jul 14, 2023 at 11:11:30AM +0100, Tvrtko Ursulin wrote:
>>
>> On 14/07/2023 06:43, Yang, Fei wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> According to the comment in i915_gem_object_can_bypass_llc the
>>>> purpose of the function is to return false if the platform/object
>>>> has a caching mode where GPU can bypass the LLC.
>>>>
>>>> So far the only platforms which allegedly can do this are Jasperlake
>>>> and Elkhartlake, and that via MOCS (not PAT).
>>>>
>>>> Instead of blindly assuming that objects where userspace has set the
>>>> PAT index can (bypass the LLC), question is is there a such PAT index
>>>> on a platform. Probably starting with Meteorlake since that one is the
>>>> only one where set PAT extension can be currently used. Or if there is
>>>> a MOCS entry which can achieve the same thing on Meteorlake.
>>>>
>>>> If there is such PAT, now that i915 can be made to understand them
>>>> better, we can make the check more fine grained. Or if there is a MOCS
>>>> entry then we probably should apply the blanket IS_METEORLAKE condition.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
>>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>> Cc: Fei Yang <fei.yang@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ------
>>>>    1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 33a1e97d18b3..1e34171c4162 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -229,12 +229,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>>>         if (!(obj->flags & I915_BO_ALLOC_USER))
>>>>                 return false;
>>>>
>>>> -     /*
>>>> -      * Always flush cache for UMD objects at creation time.
>>>> -      */
>>>> -     if (obj->pat_set_by_user)
>>>
>>> I'm afraid this is going to break MESA. Can we run MESA tests with this patch?
>>
>> I can't, but question is why it would break Mesa which would need a nice
>> comment here?
>>
>> For instance should the check be IS_METEORLAKE?
>>
>> Or should it be "is wb" && "not has 1-way coherent"?
>>
>> Or both?
>>
>> Or, given how Meteorlake does not have LLC, how can anything bypass it
>> there? Or is it about snooping on Meteorlake and how?
> 
> I think the "LLC" in the function name is a bit misleading since this is
> really all just about the ability to avoid coherency (which might come
> from an LLC on some platforms or from snooping on others).
> 
> The concern is that the CPU writes to the buffer and those writes sit in
> a CPU cache without making it to RAM immediately.  If the GPU then
> reads the object with any of the non-coherent PAT settings that were
> introduced in Xe_LPG, it will not snoop the CPU cache and will read old,
> stale data from RAM.
> 
> So I think we'd want a condition like ("Xe_LPG or later" && "any non
> coherent PAT").  The WB/WT/UC status of the GPU behavior shouldn't
> matter here, just the coherency setting.

Right, sounds plausible to me. So with this series the new condition in this function would look like this:

i915_gem_object_can_bypass_llc(..)
{
...
	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
	    i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH1W) != 1)
		return true;

("!= 1" in the condition meaning either it is not coherent, or i915 does not know due table being incomplete - like some PAT index on some future platform was forgotten to be defined.)

That would catch any platform with non-coherent WB, as long as the PAT-to-i915-cache-mode tables are correct. It would currently only apply to Meteorlake:

#define MTL_CACHE_MODES \
	.cache_modes = { \
		[0] = I915_CACHE(WB), \
		[1] = I915_CACHE(WT), \
		[2] = I915_CACHE(UC), \
		[3] = _I915_CACHE(WB, COH1W), \
		[4] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_COH2W)), \
	}

Or are saying it should apply to UC and WT too somehow?

I'll also try to join sub-threads to Fei's reply here too.

So in terms of the stated issue with _CPU_ access from Mesa seeing stale data (non-zeroed pages) depending on the PAT index - I don't understand that yet. That seems like a completely CPU cache problem space and I do not understand how PAT index gets into the picture.

But the proposed patch from your email Fei looks like it would be covered by the snippet I have in this reply.

Regards,

Tvrtko
