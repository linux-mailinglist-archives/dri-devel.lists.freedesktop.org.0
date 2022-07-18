Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D225785F9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 17:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37F218A22F;
	Mon, 18 Jul 2022 15:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11AC18A259;
 Mon, 18 Jul 2022 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658156520; x=1689692520;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dOad1nR/yXKty+tVe0LpjOM4v857tHTn09mRRzWe0Wg=;
 b=MpNpFEFC/ivn40UN1w99vEBIVPrlFBBiSLlfs2Jy67yTQSrkfgNBKHAs
 RzQVd23eFdeiA4rG6O3S8ZnmWhjHZ79oQhGMNUvBPcku0y+BfkAiFQpqT
 gDu/JOljnSrX05XWgY+1owW6JEXaSd9TacKdNSynNXeoYA2C5Nzg4dysl
 0H6kgpT+CcnP8ZeRZj79J88Fe4h2T/jPq77toFhMKttEs7FndTAlN4RKl
 iB/zEaco+JmnzXaaHCa7dSG1doX59gNLfggVHsCoGwS08nDHgy2H5GLRp
 8QsA4TF/3eLzwxS4DWaHRQY8JV0lhlXTfp0e9Z99NjoH+wua1gl7aeNk7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="286260654"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="286260654"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 08:02:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="686769046"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 08:01:57 -0700
Message-ID: <aea19e9c-0e68-a0ce-5716-8b1f023086fb@linux.intel.com>
Date: Mon, 18 Jul 2022 16:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v2 01/21] drm/i915/gt: Ignore TLB
 invalidations on idle engines
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <c014a1d743fa46a6b57f02bffb7badf438136442.1657800199.git.mchehab@kernel.org>
 <76318fe1-37dc-8a1e-317e-76333995b8ca@linux.intel.com>
 <20220718165341.30ee6e31@maurocar-mobl2>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220718165341.30ee6e31@maurocar-mobl2>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/07/2022 15:53, Mauro Carvalho Chehab wrote:
> On Mon, 18 Jul 2022 14:16:10 +0100
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> 
>> On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
>>> From: Chris Wilson <chris.p.wilson@intel.com>
>>>
>>> Check if the device is powered down prior to any engine activity,
>>> as, on such cases, all the TLBs were already invalidated, so an
>>> explicit TLB invalidation is not needed, thus reducing the
>>> performance regression impact due to it.
>>>
>>> This becomes more significant with GuC, as it can only do so when
>>> the connection to the GuC is awake.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
>>
>> Patch itself looks fine but I don't think we closed on the issue of
>> stable/fixes on this patch?
> 
> No, because TLB cache invalidation takes time and causes time outs, which
> in turn affects applications and produce Kernel warnings.
> 
> There's even open bugs due to TLB timeouts, like this one:
> 
> 	[424.370996] i915 0000:00:02.0: [drm] *ERROR* rcs0 TLB invalidation did not complete in 4ms!
> 
> See:
> 	https://gitlab.freedesktop.org/drm/intel/-/issues/6424
> 
> So, while this is a performance regression, it ends causing a
> functional regression.

This test is not even particularly stressful. Fair enough - thanks for 
the information.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Is skipping of the ggtt only bound flush the fix for this particular test?

Regards,

Tvrtko

> 
> The first part of this series (patches 1-7) are meant to reduce the
> risk of such timeouts by doing TLB invalidation in batch and only
> when really needed (userspace-exposed TLBs for GTs that are powered-on
> and non-edged).
> 
> As they're fixing such regressions, it makes sense c/c stable and having
> a fixes tag.
> 
>> My position here is that, if the functional issue is only with GuC
>> invalidations, then the tags shouldn't be there (and the huge CC list).
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>>> Cc: Fei Yang <fei.yang@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>> ---
>>>
>>> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
>>> See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
>>>
>>>    drivers/gpu/drm/i915/gem/i915_gem_pages.c | 10 ++++++----
>>>    drivers/gpu/drm/i915/gt/intel_gt.c        | 17 ++++++++++-------
>>>    drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  3 +++
>>>    3 files changed, 19 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>> index 97c820eee115..6835279943df 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>> @@ -6,14 +6,15 @@
>>>    
>>>    #include <drm/drm_cache.h>
>>>    
>>> +#include "gt/intel_gt.h"
>>> +#include "gt/intel_gt_pm.h"
>>> +
>>>    #include "i915_drv.h"
>>>    #include "i915_gem_object.h"
>>>    #include "i915_scatterlist.h"
>>>    #include "i915_gem_lmem.h"
>>>    #include "i915_gem_mman.h"
>>>    
>>> -#include "gt/intel_gt.h"
>>> -
>>>    void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
>>>    				 struct sg_table *pages,
>>>    				 unsigned int sg_page_sizes)
>>> @@ -217,10 +218,11 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
>>>    
>>>    	if (test_and_clear_bit(I915_BO_WAS_BOUND_BIT, &obj->flags)) {
>>>    		struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>> +		struct intel_gt *gt = to_gt(i915);
>>>    		intel_wakeref_t wakeref;
>>>    
>>> -		with_intel_runtime_pm_if_active(&i915->runtime_pm, wakeref)
>>> -			intel_gt_invalidate_tlbs(to_gt(i915));
>>> +		with_intel_gt_pm_if_awake(gt, wakeref)
>>> +			intel_gt_invalidate_tlbs(gt);
>>>    	}
>>>    
>>>    	return pages;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index 68c2b0d8f187..c4d43da84d8e 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -12,6 +12,7 @@
>>>    
>>>    #include "i915_drv.h"
>>>    #include "intel_context.h"
>>> +#include "intel_engine_pm.h"
>>>    #include "intel_engine_regs.h"
>>>    #include "intel_ggtt_gmch.h"
>>>    #include "intel_gt.h"
>>> @@ -924,6 +925,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>>>    	struct drm_i915_private *i915 = gt->i915;
>>>    	struct intel_uncore *uncore = gt->uncore;
>>>    	struct intel_engine_cs *engine;
>>> +	intel_engine_mask_t awake, tmp;
>>>    	enum intel_engine_id id;
>>>    	const i915_reg_t *regs;
>>>    	unsigned int num = 0;
>>> @@ -947,26 +949,31 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>>>    
>>>    	GEM_TRACE("\n");
>>>    
>>> -	assert_rpm_wakelock_held(&i915->runtime_pm);
>>> -
>>>    	mutex_lock(&gt->tlb_invalidate_lock);
>>>    	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>>    
>>>    	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
>>>    
>>> +	awake = 0;
>>>    	for_each_engine(engine, gt, id) {
>>>    		struct reg_and_bit rb;
>>>    
>>> +		if (!intel_engine_pm_is_awake(engine))
>>> +			continue;
>>> +
>>>    		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>>>    		if (!i915_mmio_reg_offset(rb.reg))
>>>    			continue;
>>>    
>>>    		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
>>> +		awake |= engine->mask;
>>>    	}
>>>    
>>>    	spin_unlock_irq(&uncore->lock);
>>>    
>>> -	for_each_engine(engine, gt, id) {
>>> +	for_each_engine_masked(engine, gt, awake, tmp) {
>>> +		struct reg_and_bit rb;
>>> +
>>>    		/*
>>>    		 * HW architecture suggest typical invalidation time at 40us,
>>>    		 * with pessimistic cases up to 100us and a recommendation to
>>> @@ -974,12 +981,8 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>>>    		 */
>>>    		const unsigned int timeout_us = 100;
>>>    		const unsigned int timeout_ms = 4;
>>> -		struct reg_and_bit rb;
>>>    
>>>    		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>>> -		if (!i915_mmio_reg_offset(rb.reg))
>>> -			continue;
>>> -
>>>    		if (__intel_wait_for_register_fw(uncore,
>>>    						 rb.reg, rb.bit, 0,
>>>    						 timeout_us, timeout_ms,
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> index bc898df7a48c..a334787a4939 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> @@ -55,6 +55,9 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>>>    	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>>>    	     intel_gt_pm_put(gt), tmp = 0)
>>>    
>>> +#define with_intel_gt_pm_if_awake(gt, wf) \
>>> +	for (wf = intel_gt_pm_get_if_awake(gt); wf; intel_gt_pm_put_async(gt), wf = 0)
>>> +
>>>    static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>>>    {
>>>    	return intel_wakeref_wait_for_idle(&gt->wakeref);
