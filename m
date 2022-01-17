Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3821491236
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 00:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD3811249D;
	Mon, 17 Jan 2022 23:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74D11249C;
 Mon, 17 Jan 2022 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642461159; x=1673997159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dlE7j3EUbOf+qh8mJwYhVthA+wm/MBdKq3Zoy19+U5E=;
 b=XMreCzMPXhMSMDXikrDo6IXNojAhMB34aQS/77GtvDcyD/SuNqiVQfNc
 HXLs3yUPV8C3wFKSMzdsK8JVqI37uEvfGJ0vQkyVmY6M6kFgIHV5mcNY+
 j/F+VQr1gq8EMejgoix+CtVXh2CzQV/0o/vkSHHanVUgBv6waNtRYRz3U
 fLxH5S8Sb4AupRuV8AkI4OwQxRgDgQqSga54Ib4S6xgvis4wRAkUF17Zp
 oUafv29lAixLucU5JhA7btk+LhqjLFc6yk5h428Oy26PB8Xj2qTI4ALEK
 Jf42rPnxN1NA568Ge1M1cCkY7vK/4vXqngDg766sh1PuYq+pJSYiOAjXp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244900309"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="244900309"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 15:12:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="531505413"
Received: from nkohl-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.41.90])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 15:12:34 -0800
Date: Tue, 18 Jan 2022 01:12:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/2] drm/i915: Prepare for multiple GTs
Message-ID: <YeX33lpVBOzOERFK@intel.intel>
References: <20220117193255.236599-1-andi.shyti@linux.intel.com>
 <20220117193255.236599-2-andi.shyti@linux.intel.com>
 <700309d2-7982-a7f4-f5f9-c1d51eafc927@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700309d2-7982-a7f4-f5f9-c1d51eafc927@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

> please find few late nits below

thanks for the comments!

> > On a multi-tile platform, each tile has its own registers + GGTT
> > space, and BAR 0 is extended to cover all of them.
> > 
> > Up to four gts are supported in i915->gt[], with slot zero
> 
> s/gts/GTs (to match as below)

OK!

> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index 622cdfed8a8b..17927da9e23e 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -27,7 +27,8 @@
> >  #include "shmem_utils.h"
> >  #include "pxp/intel_pxp.h"
> >  
> > -void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> > +static void
> > +__intel_gt_init_early(struct intel_gt *gt)
> 
> no need to split line

yeah... this was a change I was always very tempted to do but
decided to leave it as it is because the patch is not mine. Will
do!

> >  {
> >  	spin_lock_init(&gt->irq_lock);
> >  
> > @@ -47,19 +48,27 @@ void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> >  	intel_rps_init_early(&gt->rps);
> >  }
> >  
> > +/* Preliminary initialization of Tile 0 */
> 
> maybe:
> 
> void intel_gts_init_early(struct drm_i915_private *i915)

We had a discussion about the use of 'gts' vs 'gt' and all the
previous refactoring patches[*] where coming because the use of
'gts' brings confusion: what does gts mean? GTS or GTs? So that
we decided to just use gt in its singular form and if needed,
perhaps, use 'multi_gt' for plural.

The function below is indeed used only during probe so that we
can remove the first parameter and have it as you suggest.


[*] /i915->gt/i915->gt0/ and /i915->gts[]/i915->gt[]/

> {
> 	struct intel_gt *gt = &i915->gt0;
> 	...
> 
> >  void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> >  {
> >  	gt->i915 = i915;
> >  	gt->uncore = &i915->uncore;
> > +
> > +	__intel_gt_init_early(gt);
> >  }

[...]

> > -void intel_gt_driver_late_release(struct intel_gt *gt)
> > +void intel_gt_driver_late_release(struct drm_i915_private *i915)
> 
> as breaks naming style maybe there should be different helper like:
> 
> void intel_gts_driver_late_release(struct drm_i915_private *i915)
> {
> 	struct intel_gt *gt;
> 	unsigned int id;
> 
> 	for_each_gt(gt, i915, id)
> 		intel_gt_driver_late_release(gt);
> }
> 
> then we can use "intel_gts" prefix to indicate that we want to operate
> on all GTs, not just single "intel_gt"

As I explained earlier, the 'gts' name brings confusion. Perhaps
we can call it something like
'intel_gt_all_driver_late_release()', but it looks a bit forced.

Open for suggestions.

> >  {
> > +	struct intel_gt *gt;
> > +	unsigned int id;
> > +
> >  	/* We need to wait for inflight RCU frees to release their grip */
> >  	rcu_barrier();
> >  
> > -	intel_uc_driver_late_release(&gt->uc);
> > -	intel_gt_fini_requests(gt);
> > -	intel_gt_fini_reset(gt);
> > -	intel_gt_fini_timelines(gt);
> > -	intel_engines_free(gt);
> > +	for_each_gt(gt, i915, id) {
> > +		intel_uc_driver_late_release(&gt->uc);
> > +		intel_gt_fini_requests(gt);
> > +		intel_gt_fini_reset(gt);
> > +		intel_gt_fini_timelines(gt);
> > +		intel_engines_free(gt);
> > +	}
> >  }
> >  
> >  /**
> > @@ -909,6 +922,112 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
> >  	return intel_uncore_read_fw(gt->uncore, reg);
> >  }
> >  
> > +static int
> > +intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
> 
> no need to split lines

Yep!

> > +{
> > +	struct drm_i915_private *i915 = gt->i915;
> 
> can be moved to "if" below

OK

> > +	unsigned int id = gt->info.id;
> > +	int ret;
> > +
> > +	if (id) {
> > +		struct intel_uncore_mmio_debug *mmio_debug;
> > +		struct intel_uncore *uncore;
> > +
> > +		/* For multi-tile platforms BAR0 must have at least 16MB per tile */
> > +		if (GEM_WARN_ON(pci_resource_len(to_pci_dev(i915->drm.dev), 0) <
> > +				(id + 1) * SZ_16M))
> > +			return -EINVAL;
> 
> we don't use here BAR0 so maybe we can move this check to
> intel_gt_probe_all() where we look for BAR phys_addr ?

OK, then I will remove it from this patch and I will add it in
the next series where we add the first multitile machine support.

In intel_gt_probe_all(), right now, I don't know yet whether the
platform is single tile or multitile and consequently check BAR0
or not.

> > +	/*
> > +	 * i915->gt[0] == &i915->gt0
> > +	 */
> > +#define I915_MAX_GT 4
> > +	struct intel_gt *gt[I915_MAX_GT];
> > +
> >  	struct {
> >  		struct i915_gem_contexts {
> >  			spinlock_t lock; /* locks list */
> > diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> > index 5625c9c38993..6a6324a08e72 100644
> > --- a/drivers/gpu/drm/i915/intel_memory_region.h
> > +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> > @@ -30,6 +30,9 @@ enum intel_memory_type {
> >  enum intel_region_id {
> >  	INTEL_REGION_SMEM = 0,
> >  	INTEL_REGION_LMEM,
> 
> for completeness we should have:
> 
>   	INTEL_REGION_LMEM_0 = INTEL_REGION_LMEM,

Makes sense, fortunately this is used only 15 times, won't be
as painful as it was for /i915->gt/i915->gt0/.

> > +	INTEL_REGION_LMEM1,
> > +	INTEL_REGION_LMEM2,
> > +	INTEL_REGION_LMEM3,
> 
> but likely not needed any of them since all we need is:
> 
>   	INTEL_REGION_LMEM_n = INTEL_REGION_LMEM + I915_MAX_GT - 1,
> 
> but I'm not sure that I915_MAX_GT is available here, maybe it should
> defined in separate header not in i915_drv.h or we should have

I915_MAX_GT is available here, but to do something like you say
we need to shift all the id's:

   enum intel_region_id {
   	INTEL_REGION_SMEM = 0,
   	INTEL_REGION_LMEM,
   	INTEL_REGION_STOLEN_SMEM = INTEL_REGION_LMEM + I915_MAX_GT,
   	...
   }
   
   #define INTEL_REGION_LMEM(n)	(INTEL_REGION_LMEM + I915_MAX_GT - n + 1)

Otherwise we would have some inconsistent ID.

But it doesn't look very pretty to me, though.

> #define I915_MAX_LMEM 4
> 
> and then somewhere
> 	
> 	BUILD_BUG_ON(I915_MAX_LMEM != I915_MAX_GT);

To be honest I'm not a big fan of I915_MAX_GT and when I will
find some time I will try to get rid of it, as I think that the
maximum number of gt's should be calculated during probe and
stored somewhere in i915->max_gt, but this is a different story.

> ~Michal

Thanks a lot for your review!

Andi
