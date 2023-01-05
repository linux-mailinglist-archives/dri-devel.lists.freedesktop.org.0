Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299E65EC13
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17E10E718;
	Thu,  5 Jan 2023 13:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7236510E716;
 Thu,  5 Jan 2023 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672924001; x=1704460001;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7/vCMeMAQqHhg/7KR1TtwnOihdlykG4nHx71PA/NtrQ=;
 b=AQ1B+Ag0PyHBDox0OIgUae45XN8XclSJW/ZEbPwlAGV0xp+0/Dml9ldi
 TTcUUU+UkJ0W1dj8GggEXWpu9pNlq8j7ZObncMJGX0ciR7LOaug9BJQZ7
 0UjVJdIkR92Mp/joId2WIP7+Y6h5U//FHNrmKnUwG2aMKkPLO3mdnsIkh
 b6FoKf3O7x85+QMOsgOW9+cb8rJWP7CxlYfBc1DuBAJYO6ucXrM+QmNGP
 VVaNc4GMFwJCr/PsE6p/tHmzSqbxiOhXWbok02Dv6+/754ep5GAS4T71g
 08kzaQ9Z5jCNREOEXRe+Sj4gxLvvm28tSd6iK3Um7p8NwGtsFdX0zgask A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="301893748"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="301893748"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 05:06:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="984291477"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="984291477"
Received: from ciarapow-mobl1.ger.corp.intel.com (HELO [10.213.208.73])
 ([10.213.208.73])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 05:06:39 -0800
Message-ID: <defbc0fe-f588-6631-59f9-578264551378@linux.intel.com>
Date: Thu, 5 Jan 2023 13:06:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Consolidate TLB invalidation
 flow
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
 <20221219101316.168129-3-tvrtko.ursulin@linux.intel.com>
 <083b4424-d984-a2d2-1f58-035e4c1c82bd@intel.com>
 <Y7SIwogJwS2teOgy@mdroper-desk1.amr.corp.intel.com>
 <210966b7-d736-48cd-15f4-3451d96914b6@linux.intel.com>
 <Y7W6Y6S9xg37wc42@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y7W6Y6S9xg37wc42@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/01/2023 17:41, Matt Roper wrote:
> On Wed, Jan 04, 2023 at 10:08:29AM +0000, Tvrtko Ursulin wrote:
>>
>> On 03/01/2023 19:57, Matt Roper wrote:
>>> On Mon, Dec 19, 2022 at 05:10:02PM +0100, Andrzej Hajda wrote:
>>>> On 19.12.2022 11:13, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> As the logic for selecting the register and corresponsing values grew, the
>>>>
>>>> corresponding
>>>>
>>>>> code become a bit unsightly. Consolidate by storing the required values at
>>>>> engine init time in the engine itself, and by doing so minimise the amount
>>>>> of invariant platform and engine checks during each and every TLB
>>>>> invalidation.
>>>>>
>>>>> v2:
>>>>>     * Fail engine probe if TLB invlidations registers are unknown.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  93 +++++++++++++
>>>>>     drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 +++
>>>>>     drivers/gpu/drm/i915/gt/intel_gt.c           | 135 +++----------------
>>>>>     3 files changed, 128 insertions(+), 115 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> index 99c4b866addd..d47dadfc25c8 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> @@ -1143,12 +1143,105 @@ static int init_status_page(struct intel_engine_cs *engine)
>>>>>     	return ret;
>>>>>     }
>>>>> +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
>>>>> +{
>>>>> +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
>>>>> +		[RENDER_CLASS].reg		= GEN8_RTCR,
>>>>> +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
>>>>> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
>>>>> +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
>>>>> +	};
>>>>> +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
>>>>> +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
>>>>> +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
>>>>> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
>>>>> +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
>>>>> +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
>>>>> +	};
>>>>> +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
>>>>> +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
>>>>> +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
>>>>> +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
>>>>> +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
>>>>> +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
>>>>> +	};
>>>>> +	struct drm_i915_private *i915 = engine->i915;
>>>>> +	const union intel_engine_tlb_inv_reg *regs;
>>>>> +	union intel_engine_tlb_inv_reg reg;
>>>>> +	unsigned int class = engine->class;
>>>>> +	unsigned int num = 0;
>>>>> +	u32 val;
>>>>> +
>>>>> +	/*
>>>>> +	 * New platforms should not be added with catch-all-newer (>=)
>>>>> +	 * condition so that any later platform added triggers the below warning
>>>>> +	 * and in turn mandates a human cross-check of whether the invalidation
>>>>> +	 * flows have compatible semantics.
>>>>> +	 *
>>>>> +	 * For instance with the 11.00 -> 12.00 transition three out of five
>>>>> +	 * respective engine registers were moved to masked type. Then after the
>>>>> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
>>>>> +	 */
>>>>> +
>>>>> +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
>>>
>>> This is bad...it only captures XEHPSDV and breaks the handling of DG2
>>> (12.55), PVC (12.60), and MTL (12.70, 12.71, and 12.72).  You're not
>>> hitting the warning as expected since those are all now being captured
>>> by the next case of the if/else ladder.  With the way GMD_ID works, we
>>> may also get new version numbers that silently show up in hardware too
>>> at some point (e.g., 12.73, 12.74, etc.)
>>
>> Great (on multiple counts) ...
>>
>>>
>>>>> +		regs = xehp_regs;
>>>>> +		num = ARRAY_SIZE(xehp_regs);
>>>>> +	} else if (GRAPHICS_VER(i915) == 12) {
>>>
>>> You'd want to change this to
>>>
>>>           GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)
>>>
>>> to get the behavior you expected.
>>
>> Okay, that, and then to be as safe as I intended, ie. warn on every new
>> platforms so developers *must* check registers are still compatible during
>> platform enablement, we would need a full ver range check something like:
>>
>> 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
>> 	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
>> 		regs = xehp_regs;
>> 		num = ARRAY_SIZE(xehp_regs);
>> 	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)) {
>> 		regs = gen12_regs;
>> 		num = ARRAY_SIZE(gen12_regs);
>>
>> What do you think about that?
> 
> What about just keeping the code the way it is now, but adding a new
> error condition at the *top* of the ladder?
> 
>          if (GRAPHICS_VER_FULL(i915) > IP_VER(12, 72)) {
>                  /* Error, something new we haven't considered */
>          } else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>                  ...
> 
> I guess that won't catch cases where they go back and insert a new
> version or IP refresh that's older than the latest version number, but
> usually refresh platforms aren't going to be adding the kind of
> architectural changes that require a new if/else arm anyway.
> 
> Also, as Andrzej pointed out on a different reply, we classified DG1 as
> 12.10 (because of the interrupt handling changes), so I guess we'd need
> a further adjustment to the "gen12" branch to cover that one too.
> 
> Honestly, I'm not super wild about the general plan of intentionally
> breaking inheritance here; that runs counter to how we usually try to do
> things in i915.  In most places we always try to assume that future
> platforms will behave the same way as the latest one, and then we update
> those assumptions as part of the initial bringup when a future platform
> comes along that breaks them.  Most of the places where we do specific
> checks and a MISSING_CASE warning are where we have a strong reason to
> believe that each platform will always need a new implementation (e.g.,
> stuff like workaround lists).  I don't see a reason to expect major
> changes in MMIO-based invalidation for a platform n+1, n+2, etc.  The
> change that I _do_ expect to show up (even for some of these current
> platforms) is that a GuC-based TLB invalidation path will be added since
> that's mandatory for a lot of modern features, but that will be a
> parallel codepath, not part of the if/else ladder we're editing here.

The strong reason you mention is currently the lack of _any_ test 
coverage for this. In other words you'd never know a new platform does 
not work properly (imaging one more register becomes masked, like three 
have become from Gen11 to Gen12). Or if refactoring this area of the 
code broke an existing platform. And both cases lead to CVEs so IMO 
safety trumps our usual patterns.

As I said earlier, I am not going to merge anything in this area, apart 
that I want "drm/i915: Do not cover all future platforms in TLB 
invalidation" in, until test coverage materialises.

Once we have test coverage I am okay with catch all future platforms.

So regarding "drm/i915: Do not cover all future platforms in TLB 
invalidation".. minimal change is then to have it like:

   if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&) {
       GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)
	...
   } else if (GRAPHICS_VER(i915) == 12) {
	...
   ...

Is this agreeable? That covers XEHPSDV and DG2. PVC and MTL, if they are 
intended to be supported, someone (not exclusing myself here) needs to 
check bspec before extending the condition with an explicit patch.

Otherwise 77fa9efc16a9 ("drm/i915/xehp: Create separate reg definitions 
for new MCR registers") was about Xe_HP, already wrong and Andrzej fixed 
it in 4d5cf7b1680a ("drm/i915: fix TLB invalidation for Gen12.50 video 
and compute engines").

Further work can happen once test coverage appears.

Regards,

Tvrtko

>>
>> Or you are saying new GMD IDs may appear in the field without first having
>> passed the new platform enablemend process? That would be horrible so I hope
>> not.
> 
> They won't just show up in the wild, we'll know they're coming.  But
> they'll be used for stuff like how DG2-G12 showed up after we'd already
> enabled DG2-G10 and DG2-G11.  Or how we picked up a couple more ADL
> variants that our driver treats as "ADL-P," even though there are
> technically other SKU letters associated with them.  So they're things
> that we wouldn't consider to be a whole new platform, just a new
> subplatform at best.
> 
> 
> Matt
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>> +		regs = gen12_regs;
>>>>> +		num = ARRAY_SIZE(gen12_regs);
>>>>> +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
>>>>> +		regs = gen8_regs;
>>>>> +		num = ARRAY_SIZE(gen8_regs);
>>>>> +	} else if (GRAPHICS_VER(i915) < 8) {
>>>>> +		return 0;
>>>>> +	} > +
>>>>> +	if (drm_WARN_ONCE(&i915->drm, !num,
>>>>> +			  "Platform does not implement TLB invalidation!"))
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	if (drm_WARN_ON_ONCE(&i915->drm,
>>>>> +			     class >= num ||
>>>>> +			     (!regs[class].reg.reg &&
>>>>> +			      !regs[class].mcr_reg.reg)))
>>>>> +		return -ERANGE;
>>>>
>>>> I hope the propagation of -ERANGE to device probe is OK.
>>>>
>>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>> +
>>>>> +	reg = regs[class];
>>>>> +
>>>>> +	if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {
>>>>> +		reg.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
>>>>> +		val = 0;
>>>>> +	} else {
>>>>> +		val = engine->instance;
>>>>> +	}
>>>>> +
>>>>> +	val = BIT(val);
>>>>> +
>>>>> +	engine->tlb_inv.mcr = regs == xehp_regs;
>>>>> +	engine->tlb_inv.reg = reg;
>>>>> +	engine->tlb_inv.done = val;
>>>>> +
>>>>> +	if (GRAPHICS_VER(i915) >= 12 &&
>>>>> +	    (engine->class == VIDEO_DECODE_CLASS ||
>>>>> +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
>>>>> +	     engine->class == COMPUTE_CLASS))
>>>>> +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
>>>>> +	else
>>>>> +		engine->tlb_inv.request = val;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>     static int engine_setup_common(struct intel_engine_cs *engine)
>>>>>     {
>>>>>     	int err;
>>>>>     	init_llist_head(&engine->barrier_tasks);
>>>>> +	err = intel_engine_init_tlb_invalidation(engine);
>>>>> +	if (err)
>>>>> +		return err;
>>>>> +
>>>>>     	err = init_status_page(engine);
>>>>>     	if (err)
>>>>>     		return err;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>> index 4fd54fb8810f..8c661fe89314 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>> @@ -341,6 +341,19 @@ struct intel_engine_guc_stats {
>>>>>     	u64 start_gt_clk;
>>>>>     };
>>>>> +union intel_engine_tlb_inv_reg {
>>>>> +	i915_reg_t	reg;
>>>>> +	i915_mcr_reg_t	mcr_reg;
>>>>> +};
>>>>> +
>>>>> +struct intel_engine_tlb_inv
>>>>> +{
>>>>> +	bool mcr;
>>>>> +	union intel_engine_tlb_inv_reg reg;
>>>>> +	u32 request;
>>>>> +	u32 done;
>>>>> +};
>>>>> +
>>>>>     struct intel_engine_cs {
>>>>>     	struct drm_i915_private *i915;
>>>>>     	struct intel_gt *gt;
>>>>> @@ -372,6 +385,8 @@ struct intel_engine_cs {
>>>>>     	u32 context_size;
>>>>>     	u32 mmio_base;
>>>>> +	struct intel_engine_tlb_inv tlb_inv;
>>>>> +
>>>>>     	/*
>>>>>     	 * Some w/a require forcewake to be held (which prevents RC6) while
>>>>>     	 * a particular engine is active. If so, we set fw_domain to which
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>>> index 854841a731cb..9fb0ac03f51a 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>>> @@ -983,36 +983,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>>>>>     	intel_sseu_dump(&info->sseu, p);
>>>>>     }
>>>>> -struct reg_and_bit {
>>>>> -	union {
>>>>> -		i915_reg_t reg;
>>>>> -		i915_mcr_reg_t mcr_reg;
>>>>> -	};
>>>>> -	u32 bit;
>>>>> -};
>>>>> -
>>>>> -static struct reg_and_bit
>>>>> -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>>>>> -		const i915_reg_t *regs, const unsigned int num)
>>>>> -{
>>>>> -	const unsigned int class = engine->class;
>>>>> -	struct reg_and_bit rb = { };
>>>>> -
>>>>> -	if (drm_WARN_ON_ONCE(&engine->i915->drm,
>>>>> -			     class >= num || !regs[class].reg))
>>>>> -		return rb;
>>>>> -
>>>>> -	rb.reg = regs[class];
>>>>> -	if (gen8 && class == VIDEO_DECODE_CLASS)
>>>>> -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
>>>>> -	else
>>>>> -		rb.bit = engine->instance;
>>>>> -
>>>>> -	rb.bit = BIT(rb.bit);
>>>>> -
>>>>> -	return rb;
>>>>> -}
>>>>> -
>>>>>     /*
>>>>>      * HW architecture suggest typical invalidation time at 40us,
>>>>>      * with pessimistic cases up to 100us and a recommendation to
>>>>> @@ -1026,14 +996,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>>>>>      * but are now considered MCR registers.  Since they exist within a GAM range,
>>>>>      * the primary instance of the register rolls up the status from each unit.
>>>>>      */
>>>>> -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
>>>>> +static int wait_for_invalidate(struct intel_engine_cs *engine)
>>>>>     {
>>>>> -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
>>>>> -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
>>>>> +	if (engine->tlb_inv.mcr)
>>>>> +		return intel_gt_mcr_wait_for_reg(engine->gt,
>>>>> +						 engine->tlb_inv.reg.mcr_reg,
>>>>> +						 engine->tlb_inv.done,
>>>>> +						 0,
>>>>>     						 TLB_INVAL_TIMEOUT_US,
>>>>>     						 TLB_INVAL_TIMEOUT_MS);
>>>>>     	else
>>>>> -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
>>>>> +		return __intel_wait_for_register_fw(engine->gt->uncore,
>>>>> +						    engine->tlb_inv.reg.reg,
>>>>> +						    engine->tlb_inv.done,
>>>>> +						    0,
>>>>>     						    TLB_INVAL_TIMEOUT_US,
>>>>>     						    TLB_INVAL_TIMEOUT_MS,
>>>>>     						    NULL);
>>>>> @@ -1041,61 +1017,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
>>>>>     static void mmio_invalidate_full(struct intel_gt *gt)
>>>>>     {
>>>>> -	static const i915_reg_t gen8_regs[] = {
>>>>> -		[RENDER_CLASS]			= GEN8_RTCR,
>>>>> -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
>>>>> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
>>>>> -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
>>>>> -	};
>>>>> -	static const i915_reg_t gen12_regs[] = {
>>>>> -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
>>>>> -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
>>>>> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
>>>>> -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
>>>>> -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
>>>>> -	};
>>>>> -	static const i915_mcr_reg_t xehp_regs[] = {
>>>>> -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
>>>>> -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
>>>>> -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
>>>>> -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
>>>>> -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
>>>>> -	};
>>>>>     	struct drm_i915_private *i915 = gt->i915;
>>>>>     	struct intel_uncore *uncore = gt->uncore;
>>>>>     	struct intel_engine_cs *engine;
>>>>>     	intel_engine_mask_t awake, tmp;
>>>>>     	enum intel_engine_id id;
>>>>> -	const i915_reg_t *regs;
>>>>> -	unsigned int num = 0;
>>>>>     	unsigned long flags;
>>>>> -	/*
>>>>> -	 * New platforms should not be added with catch-all-newer (>=)
>>>>> -	 * condition so that any later platform added triggers the below warning
>>>>> -	 * and in turn mandates a human cross-check of whether the invalidation
>>>>> -	 * flows have compatible semantics.
>>>>> -	 *
>>>>> -	 * For instance with the 11.00 -> 12.00 transition three out of five
>>>>> -	 * respective engine registers were moved to masked type. Then after the
>>>>> -	 * 12.00 -> 12.50 transition multi cast handling is required too.
>>>>> -	 */
>>>>> -
>>>>> -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
>>>>> -		regs = NULL;
>>>>> -		num = ARRAY_SIZE(xehp_regs);
>>>>> -	} else if (GRAPHICS_VER(i915) == 12) {
>>>>> -		regs = gen12_regs;
>>>>> -		num = ARRAY_SIZE(gen12_regs);
>>>>> -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
>>>>> -		regs = gen8_regs;
>>>>> -		num = ARRAY_SIZE(gen8_regs);
>>>>> -	} else if (GRAPHICS_VER(i915) < 8) {
>>>>> -		return;
>>>>> -	}
>>>>> -
>>>>> -	if (drm_WARN_ONCE(&i915->drm, !num,
>>>>> -			  "Platform does not implement TLB invalidation!"))
>>>>> +	if (GRAPHICS_VER(i915) < 8)
>>>>>     		return;
>>>>>     	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>>>> @@ -1105,33 +1034,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>>>>     	awake = 0;
>>>>>     	for_each_engine(engine, gt, id) {
>>>>> -		struct reg_and_bit rb;
>>>>> -
>>>>>     		if (!intel_engine_pm_is_awake(engine))
>>>>>     			continue;
>>>>> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>>>>> -			u32 val = BIT(engine->instance);
>>>>> -
>>>>> -			if (engine->class == VIDEO_DECODE_CLASS ||
>>>>> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
>>>>> -			    engine->class == COMPUTE_CLASS)
>>>>> -				val = _MASKED_BIT_ENABLE(val);
>>>>> +		if (engine->tlb_inv.mcr)
>>>>>     			intel_gt_mcr_multicast_write_fw(gt,
>>>>> -							xehp_regs[engine->class],
>>>>> -							val);
>>>>> -		} else {
>>>>> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>>>>> -			if (!i915_mmio_reg_offset(rb.reg))
>>>>> -				continue;
>>>>> -
>>>>> -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
>>>>> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
>>>>> -			    engine->class == COMPUTE_CLASS))
>>>>> -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
>>>>> -
>>>>> -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
>>>>> -		}
>>>>> +							engine->tlb_inv.reg.mcr_reg,
>>>>> +							engine->tlb_inv.request);
>>>>> +		else
>>>>> +			intel_uncore_write_fw(uncore,
>>>>> +					      engine->tlb_inv.reg.reg,
>>>>> +					      engine->tlb_inv.request);
>>>>> +
>>>>>     		awake |= engine->mask;
>>>>>     	}
>>>>> @@ -1150,16 +1064,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>>>>     	intel_gt_mcr_unlock(gt, flags);
>>>>>     	for_each_engine_masked(engine, gt, awake, tmp) {
>>>>> -		struct reg_and_bit rb;
>>>>> -
>>>>> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>>>>> -			rb.mcr_reg = xehp_regs[engine->class];
>>>>> -			rb.bit = BIT(engine->instance);
>>>>> -		} else {
>>>>> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>>>>> -		}
>>>>> -
>>>>> -		if (wait_for_invalidate(gt, rb))
>>>>> +		if (wait_for_invalidate(engine))
>>>>>     			drm_err_ratelimited(&gt->i915->drm,
>>>>>     					    "%s TLB invalidation did not complete in %ums!\n",
>>>>>     					    engine->name, TLB_INVAL_TIMEOUT_MS);
>>>>
>>>
> 
