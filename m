Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B363784B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DE10E6F0;
	Thu, 24 Nov 2022 12:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC17D10E6EB;
 Thu, 24 Nov 2022 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669291275; x=1700827275;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kTr6HYcTwWUQvPtmQnpS+jHvO7CnzNkycnjetlUV/U0=;
 b=CJqwecre4l4VGO+prGRx2q/yU9NPqmb2PiuXAWLq8X7WB6qTAuxcUTEc
 siVc/NgTRRg03tRvJCCkBZVVvwTLF4jws+kvm+W/H3s+k2jqUrqRdjvJx
 HVYL9odfqTmqCU4n9wIMM3Y3dWgBo6CQPnWbnZ3VRBoyD57x7PpLrVTBi
 WIVDdTBWMor7VZsuZdwjvZt4pDjZNIXTB3OtRjZZ0qQhtqJ8QP2V4pvsx
 33az8wDgJ84IPZyX3uVm4+RR4vpmawc6gk1LdA9Q5LfrPgJA+kTpGBINH
 QzrtG89uWXtaaSdxMJaceSXHiPSDurdtIdwgyXKvrrhwlckGgbC4kbVTl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="294672199"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="294672199"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 04:01:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642325590"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="642325590"
Received: from smurr10x-mobl1.amr.corp.intel.com (HELO [10.213.209.98])
 ([10.213.209.98])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 04:01:12 -0800
Message-ID: <d009a434-d348-32c5-07eb-128d1d9fc36b@linux.intel.com>
Date: Thu, 24 Nov 2022 12:01:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915: Introduce guard pages to
 i915_vma
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20221122185737.96459-1-andi.shyti@linux.intel.com>
 <20221122185737.96459-3-andi.shyti@linux.intel.com>
 <a579e9a5-0bd4-d439-3193-64dc52e05997@linux.intel.com>
 <Y35sXXLiAmwulDRU@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y35sXXLiAmwulDRU@ashyti-mobl2.lan>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/11/2022 18:54, Andi Shyti wrote:
> Hi Tvrtko,
> 
> [...]
> 
>>> @@ -768,6 +768,9 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>    	GEM_BUG_ON(!IS_ALIGNED(alignment, I915_GTT_MIN_ALIGNMENT));
>>>    	GEM_BUG_ON(!is_power_of_2(alignment));
>>> +	guard = vma->guard; /* retain guard across rebinds */
>>> +	guard = ALIGN(guard, alignment);
>>
>> Why does guard area needs the same alignment as the requested mapping? What about the fact on 32-bit builds guard is 32-bit and alignment u64?
> 
> I guess this just to round up/down guard to something, not
> necessarily to that alignment.
> 
> Shall I remove it?

Don't know, initially I thought it maybe needs a comment on what's it 
doing and why. If it is about aligning to "something" then should it be 
I915_GTT_MIN_ALIGNMENT?

>>> @@ -777,6 +780,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>    	if (flags & PIN_ZONE_4G)
>>>    		end = min_t(u64, end, (1ULL << 32) - I915_GTT_PAGE_SIZE);
>>>    	GEM_BUG_ON(!IS_ALIGNED(end, I915_GTT_PAGE_SIZE));
>>> +	GEM_BUG_ON(2 * guard > end);
>>
>> End is the size of relevant VA area at this point so what and why is this checking?
> 
> I think because we want to make sure the padding is at least not
> bigger that the size. What is actually wrong with this.

Same as above - if there is subtle special meaning please add a comment. 
Otherwise, for the whole object and not just the guards, it is covered by:

+	if (size > end - 2 * guard) {

I don't follow what is the point on only checking the guards.

> 
> [...]
> 
>>> @@ -855,6 +869,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>    	GEM_BUG_ON(!i915_gem_valid_gtt_space(vma, color));
>>>    	list_move_tail(&vma->vm_link, &vma->vm->bound_list);
>>> +	vma->guard = guard;
>>
>> unsigned long into u32 - what guarantees no truncation?
> 
> we are missing here this part above:
> 
> 	guard = vma->guard; /* retain guard across rebinds */
> 	if (flags & PIN_OFFSET_GUARD) {
> 		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));
> 		guard = max_t(u32, guard, flags & PIN_OFFSET_MASK);
> 	}
> 
> that should make sure that we fit into 32 bits.

Hm okay. I guess the u64 alignment and that "guard = ALIGN(guard, 
alignment);" is what is bothering me to begin with. In other words with 
that there is a chance to overflow vma->guard with a small guard and 
large alignment.

> 
> [...]
> 
>>> @@ -197,14 +197,15 @@ struct i915_vma {
>>>    	struct i915_fence_reg *fence;
>>>    	u64 size;
>>> -	u64 display_alignment;
>>>    	struct i915_page_sizes page_sizes;
>>>    	/* mmap-offset associated with fencing for this vma */
>>>    	struct i915_mmap_offset	*mmo;
>>> +	u32 guard; /* padding allocated around vma->pages within the node */
>>>    	u32 fence_size;
>>>    	u32 fence_alignment;
>>> +	u32 display_alignment;
>>
>> u64 -> u32 for display_alignment looks unrelated change.
>>
>> ./display/intel_fb_pin.c:       vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
>> ./gem/i915_gem_domain.c:        vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
>>
>> These two sites need to be changed not to use u64.
>>
>> Do this part in a separate patch?
> 
> Right! will remove it.

Okay, to be clear, refactoring of vma->display_alignemnt to be u32 as a 
separate patch in the series. Thanks!

Regards,

Tvrtko

> 
>>>    	/**
>>>    	 * Count of the number of times this vma has been opened by different
>>
>> Regards,
> 
> Thanks,
> Andi
> 
>> Tvrtko
