Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B956B7F2C85
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 13:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382E410E26F;
	Tue, 21 Nov 2023 12:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4724310E26E;
 Tue, 21 Nov 2023 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700568394; x=1732104394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t/2bEVeJuujRMjbp/hilDSCjmc2RJ6be3UC2T97ooT4=;
 b=hMAjHDe9PO6axT8Vu68bJQTTT8lY6+IuJXT5LX92Izo9N7YRzfk+7WTL
 Hl00W79gxSUTs8F7mzLswOKmWa6VWBoj2HsTXdkipAGzq7wIGOUQ43h8z
 FfswIsGrdHvD6xwVg4GKJl8WE2o2iZRIQ7cgSUm+HTPmppfbXOT8vJSGr
 hfzM6QOlWD66k4qMLvAlL4AqggKLTfdLMvPvh6L1S43/dZdKua2NkQ0j8
 pkSlW/K7fUOV+M6fxv3XUH+4Cnfgz9IKDrsmgEjVjtmH+RhImdot1kIeW
 zV/EifsRm8MY2nijerLOdaubmy+ojI5UxaJPbXT7bI4Y8nk/3IwZE89XL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="395751608"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="395751608"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 04:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013898917"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="1013898917"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.11.238])
 ([10.213.11.238])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 04:06:19 -0800
Message-ID: <8dd6f4da-dcc9-4ea3-8395-bf048b0dbc93@intel.com>
Date: Tue, 21 Nov 2023 13:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Fix phys_base to be
 relative not absolute
Content-Language: en-US
To: Paz Zcharya <pazz@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231105172718.18673-1-pazz@chromium.org>
 <ZVQ3d8FFqxsy0OX7@intel.com> <ZVfw3ghfBLdHB7uk@google.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZVfw3ghfBLdHB7uk@google.com>
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
Cc: Subrata Banik <subratabanik@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, matthew.auld@intel.com,
 Marcin Wojtas <mwojtas@chromium.org>, Drew Davenport <ddavenport@chromium.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.11.2023 00:01, Paz Zcharya wrote:
> On Tue, Nov 14, 2023 at 10:13:59PM -0500, Rodrigo Vivi wrote:
>> On Sun, Nov 05, 2023 at 05:27:03PM +0000, Paz Zcharya wrote:
>>> Fix the value of variable `phys_base` to be the relative offset in
>>> stolen memory, and not the absolute offset of the GSM.
>>
>> to me it looks like the other way around. phys_base is the physical
>> base address for the frame_buffer. Setting it to zero doesn't seem
>> to make that relative. And also doesn't look right.
>>
>>>
>>> Currently, the value of `phys_base` is set to "Surface Base Address,"
>>> which in the case of Meter Lake is 0xfc00_0000.
>>
>> I don't believe this is a fixed value. IIRC this comes from the register
>> set by video bios, where the idea is to reuse the fb that was used so
>> far.
>>
>> With this in mind I don't understand how that could overflow. Maybe
>> the size of the stolen is not right? maybe the size? maybe different
>> memory region?
>>
> 
> Hi Rodrigo, thanks for the great comments.
> 
> Apologies for using a wrong/confusing terminology. I think 'phys_base'
> is supposed to be the offset in the GEM BO, where base (or
> "Surface Base Address") is supposed to be the GTT offset.

Since base is taken from PLANE_SURF register it should be resolvable via 
GGTT to physical address pointing to actual framebuffer.
I couldn't find anything in the specs.
The simplest approach would be then do the same as in case of DGFX:
		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
		gen8_pte_t pte;

		gte += base / I915_GTT_PAGE_SIZE;

		pte = ioread64(gte);
		phys_base = pte & I915_GTT_PAGE_MASK;

Regards
Andrzej


> 
> Other than what I wrote before, I noticed that the function 'i915_vma_pin'
> which calls to 'i915_gem_gtt_reserve' is the one that binds the right
> address space in the GTT for that stolen region.
> 
> I see that in the function 'i915_vma_insert' (full call stack below),
> where if (flags & PIN_OFFSET_FIXED), then when calling 'i915_gem_gtt_reserve'
> we add an offset.
> 
> Specifically in MeteorLake, and specifically when using GOP driver, this
> offset is equal to 0xfc00_0000. But as you mentioned, this is not strict.
> 
> The if statement always renders true because in the function
> 'initial_plane_vma' we always set
> pinctl = PIN_GLOBAL | PIN_OFFSET_FIXED | base;
> where pinctl == flags (see file 'intel_plane_initial.c' line 145).
> 
> Call stack:
> drm_mm_reserve_node
> i915_gem_gtt_reserve
> 	i915_vma_insert
> i915_vma_pin_ww
> i915_vma_pin
> initial_plane_vma
> intel_alloc_initial_plane_obj
> intel_find_initial_plane_obj
> 
> Therefore, I believe the variable 'phys_base' in the
> function 'initial_plane_vma,' should be the the offset in the GEM BO
> and not the GTT offset, and because the base is added later on
> in the function 'i915_gem_gtt_reserve', this value should not be
> equal to base and be 0.
> 
> Hope it makes more sense.
> 
>>> This causes the
>>> function `i915_gem_object_create_region_at` to fail in line 128, when
>>> it attempts to verify that the range does not overflow:
>>>
>>> if (range_overflows(offset, size, resource_size(&mem->region)))
>>>        return ERR_PTR(-EINVAL);
>>>
>>> where:
>>>    offset = 0xfc000000
>>>    size = 0x8ca000
>>>    mem->region.end + 1 = 0x4400000
>>>    mem->region.start = 0x800000
>>>    resource_size(&mem->region) = 0x3c00000
>>>
>>> call stack:
>>>    i915_gem_object_create_region_at
>>>    initial_plane_vma
>>>    intel_alloc_initial_plane_obj
>>>    intel_find_initial_plane_obj
>>>    intel_crtc_initial_plane_config
>>>
>>> Looking at the flow coming next, we see that `phys_base` is only used
>>> once, in function `_i915_gem_object_stolen_init`, in the context of
>>> the offset *in* the stolen memory. Combining that with an
>>> examinination of the history of the file seems to indicate the
>>> current value set is invalid.
>>>
>>> call stack (functions using `phys_base`)
>>>    _i915_gem_object_stolen_init
>>>    __i915_gem_object_create_region
>>>    i915_gem_object_create_region_at
>>>    initial_plane_vma
>>>    intel_alloc_initial_plane_obj
>>>    intel_find_initial_plane_obj
>>>    intel_crtc_initial_plane_config
>>>
>>> [drm:_i915_gem_object_stolen_init] creating preallocated stolen
>>> object: stolen_offset=0x0000000000000000, size=0x00000000008ca000
>>>
>>> Signed-off-by: Paz Zcharya <pazz@chromium.org>
>>> ---
>>>
>>>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> index a55c09cbd0e4..e696cb13756a 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> @@ -90,7 +90,7 @@ initial_plane_vma(struct drm_i915_private *i915,
>>>   			"Using phys_base=%pa, based on initial plane programming\n",
>>>   			&phys_base);
>>>   	} else {
>>> -		phys_base = base;
>>> +		phys_base = 0;
>>>   		mem = i915->mm.stolen_region;
>>>   	}
>>>   
>>> -- 
>>> 2.42.0.869.gea05f2083d-goog
>>>

