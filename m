Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C233157E105
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 13:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D6C1125C9;
	Fri, 22 Jul 2022 11:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789FE10F5CC;
 Fri, 22 Jul 2022 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658491004; x=1690027004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Kv5BEba5hRIEbJS+rpK1CAlYNF5ZT/R/8mgeWusmfpc=;
 b=YyKwrNmDFa/kJUYRDq6qaI/clRh4ohqX5FLpfQRQaD6pMMak5jD6JtC3
 Xsm99S6UdPrMhoM8mBPZ3nnxheWqnt6oG0e6n7S11p6XxsHhjPMvKHqmB
 WI2rqO8BN2r+/pFr9CRgoe0BXWUhio2nv1y97XB7Ue2TEZk0cxwz5zKTt
 YC0HVDjqm4zKMKjPI0Vh/03viZvjebkqGsPgcam9dtz6P4UDjaC/XCtsa
 LdugUVsHzH6LSbtUKuYFtICABcnq0OnOgkH162Z1i9yEZS2LbepThdfZL
 AbFnvpLA+dCrNJwjZ6ekA0FqTf1feFwYJI7g2IKKkUXSVmpZxrF8m69ju Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288469966"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="288469966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:56:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="657188274"
Received: from dstoll-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.44.132])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:56:37 -0700
Date: Fri, 22 Jul 2022 13:56:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/21] drm/i915/gt: Ignore TLB invalidations on idle
 engines
Message-ID: <YtqQdKpA5OhokqqQ@alfio.lan>
References: <cover.1657800199.git.mchehab@kernel.org>
 <c014a1d743fa46a6b57f02bffb7badf438136442.1657800199.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c014a1d743fa46a6b57f02bffb7badf438136442.1657800199.git.mchehab@kernel.org>
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
Cc: Fei Yang <fei.yang@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Brost <matthew.brost@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Thu, Jul 14, 2022 at 01:06:06PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Check if the device is powered down prior to any engine activity,
> as, on such cases, all the TLBs were already invalidated, so an
> explicit TLB invalidation is not needed, thus reducing the
> performance regression impact due to it.
> 
> This becomes more significant with GuC, as it can only do so when
> the connection to the GuC is awake.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

For me it's good, but please, sort out with Tvrtko about his
doubts:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 10 ++++++----
>  drivers/gpu/drm/i915/gt/intel_gt.c        | 17 ++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  3 +++
>  3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 97c820eee115..6835279943df 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -6,14 +6,15 @@
>  
>  #include <drm/drm_cache.h>
>  
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_pm.h"
> +
>  #include "i915_drv.h"
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
>  #include "i915_gem_lmem.h"
>  #include "i915_gem_mman.h"
>  
> -#include "gt/intel_gt.h"
> -
>  void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
>  				 struct sg_table *pages,
>  				 unsigned int sg_page_sizes)
> @@ -217,10 +218,11 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
>  
>  	if (test_and_clear_bit(I915_BO_WAS_BOUND_BIT, &obj->flags)) {
>  		struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +		struct intel_gt *gt = to_gt(i915);
>  		intel_wakeref_t wakeref;
>  
> -		with_intel_runtime_pm_if_active(&i915->runtime_pm, wakeref)
> -			intel_gt_invalidate_tlbs(to_gt(i915));
> +		with_intel_gt_pm_if_awake(gt, wakeref)
> +			intel_gt_invalidate_tlbs(gt);
>  	}
>  
>  	return pages;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 68c2b0d8f187..c4d43da84d8e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -12,6 +12,7 @@
>  
>  #include "i915_drv.h"
>  #include "intel_context.h"
> +#include "intel_engine_pm.h"
>  #include "intel_engine_regs.h"
>  #include "intel_ggtt_gmch.h"
>  #include "intel_gt.h"
> @@ -924,6 +925,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_uncore *uncore = gt->uncore;
>  	struct intel_engine_cs *engine;
> +	intel_engine_mask_t awake, tmp;
>  	enum intel_engine_id id;
>  	const i915_reg_t *regs;
>  	unsigned int num = 0;
> @@ -947,26 +949,31 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  
>  	GEM_TRACE("\n");
>  
> -	assert_rpm_wakelock_held(&i915->runtime_pm);
> -
>  	mutex_lock(&gt->tlb_invalidate_lock);
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>  
>  	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
>  
> +	awake = 0;
>  	for_each_engine(engine, gt, id) {
>  		struct reg_and_bit rb;
>  
> +		if (!intel_engine_pm_is_awake(engine))
> +			continue;
> +
>  		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>  		if (!i915_mmio_reg_offset(rb.reg))
>  			continue;
>  
>  		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> +		awake |= engine->mask;
>  	}
>  
>  	spin_unlock_irq(&uncore->lock);
>  
> -	for_each_engine(engine, gt, id) {
> +	for_each_engine_masked(engine, gt, awake, tmp) {
> +		struct reg_and_bit rb;
> +
>  		/*
>  		 * HW architecture suggest typical invalidation time at 40us,
>  		 * with pessimistic cases up to 100us and a recommendation to
> @@ -974,12 +981,8 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  		 */
>  		const unsigned int timeout_us = 100;
>  		const unsigned int timeout_ms = 4;
> -		struct reg_and_bit rb;
>  
>  		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -		if (!i915_mmio_reg_offset(rb.reg))
> -			continue;
> -
>  		if (__intel_wait_for_register_fw(uncore,
>  						 rb.reg, rb.bit, 0,
>  						 timeout_us, timeout_ms,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index bc898df7a48c..a334787a4939 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -55,6 +55,9 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>  	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>  	     intel_gt_pm_put(gt), tmp = 0)
>  
> +#define with_intel_gt_pm_if_awake(gt, wf) \
> +	for (wf = intel_gt_pm_get_if_awake(gt); wf; intel_gt_pm_put_async(gt), wf = 0)
> +
>  static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>  {
>  	return intel_wakeref_wait_for_idle(&gt->wakeref);
> -- 
> 2.36.1
