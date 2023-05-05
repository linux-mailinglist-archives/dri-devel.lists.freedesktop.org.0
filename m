Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4E6F806B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 11:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1967D10E067;
	Fri,  5 May 2023 09:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8010E067;
 Fri,  5 May 2023 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683280425; x=1714816425;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=urWVhJWkeo+iaAjwDCGJ9I6dCVDARs0Y57bKQ0RRzkM=;
 b=BeLP32gh+1JwDgHi+Q1DE1i4xx7GlpJ9qiLzlTxjisI+a9fcFNAOHIUO
 lv4gCfGdUgDC8xENAqFyUqUW88yu2Msbxs+HuHTZI8l+3GOpsrw1Bb2r7
 3HRpbPI64D0P321wc0pJXX2NtqBTjUFQVZ6pcW+pJoWYxFhhU+blzizjV
 uE4NZ6Vk/+2NT5YSZsCYpz2fN01jY46Xi1dhDxOfe/4zgdECdSdPGJ8Lu
 feNX/GKqGwADhWOs5HU78QafKKYI9nW8twNEU3va7cpZ77/ZsDI7yuiOW
 /M4uJoBdkQ2oceRINQxXc5bXaTbdKJAe+3RQlMwtJQndoq1uLdBs/uGHP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333597234"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="333597234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 02:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="762383024"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="762383024"
Received: from dcarthy-mobl.ger.corp.intel.com (HELO [10.213.226.159])
 ([10.213.226.159])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 02:53:15 -0700
Message-ID: <e288386b-557f-8951-443a-41e9727669f2@linux.intel.com>
Date: Fri, 5 May 2023 10:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v5 2/5] drm/i915: use pat_index instead of cache_level
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230503230211.2834340-1-fei.yang@intel.com>
 <20230503230211.2834340-3-fei.yang@intel.com>
 <4c464bd6-9edc-3098-5c24-6d6da2a75c39@linux.intel.com>
 <BYAPR11MB2567660DE774E0C2B400D0479A6D9@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Language: en-US
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB2567660DE774E0C2B400D0479A6D9@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/05/2023 17:06, Yang, Fei wrote:
>  > On 04/05/2023 00:02, fei.yang@intel.com wrote:
>  >> From: Fei Yang <fei.yang@intel.com>
>  >>
>  >> Currently the KMD is using enum i915_cache_level to set caching 
> policy for
>  >> buffer objects. This is flaky because the PAT index which really 
> controls
>  >> the caching behavior in PTE has far more levels than what's defined 
> in the
>  >> enum. In addition, the PAT index is platform dependent, having to 
> translate
>  >> between i915_cache_level and PAT index is not reliable, and makes 
> the code
>  >> more complicated.
>  >>
>  >>>From UMD's perspective there is also a necessity to set caching 
> policy for
>  >> performance fine tuning. It's much easier for the UMD to directly 
> use PAT
>  >> index because the behavior of each PAT index is clearly defined in 
> Bspec.
>  >> Having the abstracted i915_cache_level sitting in between would only 
> cause
>  >> more ambiguity.
>  >>
>  >> For these reasons this patch replaces i915_cache_level with PAT 
> index. Also
>  >> note, the cache_level is not completely removed yet, because the KMD 
> still
>  >> has the need of creating buffer objects with simple cache settings 
> such as
>  >> cached, uncached, or writethrough. For such simple cases, using 
> cache_level
>  >> would help simplify the code.
>  >>
>  >> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>  >> Cc: Matt Roper <matthew.d.roper@intel.com>
>  >> Signed-off-by: Fei Yang <fei.yang@intel.com>
>  >> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>  >
>  > [snip]
>  >
>  >> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c 
> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>  >> index bb6998d67133..f2334a713c4e 100644
>  >> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>  >> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>  >> @@ -56,7 +56,7 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>  >>   }
>  >
>  >^^^
>  >
>  > How come there are no changes to gen8_pte_encode?
> 
> For legacy platforms cache_level is equal to pat_index, so I was thinking
> more about reducing number of lines changed.
> 
>  >vvv
>  >
>  >>
>  >>   static u64 mtl_pte_encode(dma_addr_t addr,
>  >> -                       enum i915_cache_level level,
>  >> +                       unsigned int pat_index,
>  >>                          u32 flags)
>  >
>  > Prototype and implementation changed here for mtl_pte_encode.
>  >
>  > And we have:
>  >
>  >        if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>  >                ppgtt->vm.pte_encode = mtl_pte_encode;
>  >        else
>  >                ppgtt->vm.pte_encode = gen8_pte_encode;
>  >
>  > So should be same prototype. And:
>  >
>  >         u64 (*pte_encode)(dma_addr_t addr,
>  >-                         enum i915_cache_level level,
>  >+                         unsigned int pat_index,
>  >                           u32 flags); /* Create a valid PTE */
>  >
>  > Patch relies on the compiler considering enum equal to unsigned int?
> 
> yes, caller is passing in unsigned int and gets used as enum.
> 
>  > But the implementation of gen8_pte_encode and most ggtt counterparts is
>  > looking at the passed in pat index and thinks it is cache level.
>  >
>  > How is that supposed to work?! Or I am blind and am missing something?
> 
> For legacy platforms translation through LEGACY_CACHELEVEL would not
> change the value of cache_level. The cache_level and pat_index are basically
> the same for these platforms.

Oh that is nasty little trick! And I did not spot it being described anywhere in the commit message or code comments.

So you are saying for legacy cache_level equals pat_index for what caching behaviour is concerned. Ie:

+#define LEGACY_CACHELEVEL \
+	.cachelevel_to_pat = { \
+		[I915_CACHE_NONE]   = 0, \
+		[I915_CACHE_LLC]    = 1, \
+		[I915_CACHE_L3_LLC] = 2, \
+		[I915_CACHE_WT]     = 3, \
+	}

And because:

enum i915_cache_level {
	I915_CACHE_NONE = 0,
	I915_CACHE_LLC,
	I915_CACHE_L3_LLC,
	I915_CACHE_WT,
};

This indeed ends up a 1:1 reversible mapping.

But it is hidden and fragile. What prevents someone from changing the enum i915_cache_level? There is no explicit linkage with hardware PAT values anywhere. Or at least I don't see it.

I would say all pte_encode signatures have to be changed to pat index.

Which means all pte encode implementations have to understand what pat indices mean.

Which brings us back to that idea of a 2nd table, I paraphrase:

.legacy_pat_to_cache = {
  	[0] = I915_PAT_UC,
	[1] = I915_PAT_WB,
	[2] = I915_PAT_WB | I915_PAT_LLC /* not sure on this one */
	[3] = I915_PAT_WT,
};

Pat_encode implementations then instead:

	switch (level) {
	case I915_CACHE_NONE:
		pte |= PPAT_UNCACHED;
	...

Do:

	if (i915->pat_to_cache_flags[pat_index] & I915_PAT_UC)
		pte |= PPAT_UNCACHED;
	else if
	...


But it would require i915 to be passed in which is admittedly a noisy diff. Hm.. benefit of hardware agnostic enum i915_cache_level.. Maybe convert pat_index to I915_PAT_.. flags in the callers? Like this:

gen8_ppgtt_insert_pte(...)
...
	const u32 pat_flags = i915->pat_to_cache_flags[pat_index];
	const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, pat_flags, flags);

Etc. That would be smaller churn on the pte_encode signature.

Maybe helper for i915->pat_to_cache_flags lookup so it can check the array bounds?

If this all sounds too much to you maybe we can do it as a followup.

Or perhaps it is actually pointing towards that obj->pat_index is not the most elegant choice to be used as a single point of truth.. perhaps obj->cache_flags would be better. It would be set at same entry points and it would be hw agnostic so could end up more elegant in the driver.

But then I think we need at minimum something like the below in this patch, somewhere:

/*
  * On pre-Gen12 platforms enum i915_cache_level happens to align
  * with caching modes as specified in hardware PAT indices. Our
  * implementation relies on that due tricks played (explain the
  * tricks) in the pte_encode vfuncs.
  * Ensure this trick keeps working until the driver can be fully
  * refactored to support pat indices better.
  */
BUILD_BUG_ON(I915_CACHE_NONE != 0);
... etc for all enums ...

if (gen < 12) {
	GEM_WARN_ON(i915_gem_get_pat_index(i915, I915_CACHE_NONE) != 0);
	... etc for all enums ...
}

> It is broken for gen12 here. I was asked to separate the gen12_pte_encode
> change to another patch in the series, but that breaks bisect. Should I
> squash 2/5 and 3/5?

This patch breaks gen12? Yes that should definitely be avoided.

Regards,

Tvrtko
