Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7A6008A1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 10:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5910E3A6;
	Mon, 17 Oct 2022 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7C810ECE5;
 Mon, 17 Oct 2022 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665995219; x=1697531219;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WJFJ13P1GViMU1D7hkmKKoWkQtqfg7lyCYMZ84Id2UQ=;
 b=K61hsWStacI44mPr/u0rulk1orw53cRa0DhSjwC5TFL/wG7gnd7X1BOE
 IeHxVeifiIBiyyz8KwFCyJBuKdWHhSKfLuPIRtjW5AMOeFgBCF7L77FYB
 z1ZVJU8MVUCnGBmnm/gdGcyNONK+x59xDaLHoegamk5+26EoVkEeTsyuE
 wKjS3nBtyPGEsjGhmjFEiPj+UPMG2lbML8oykjVE/8wBrzc/6jz/ROuto
 1+Bqev/ONIpZ5yDGLgU+RqaD4JAWcpubDb2TKxCoD6S0lZrKJ5KKI9eoA
 tNNjUgsRvx5UhdSPASOhJyAUnfxmZ2D2kp4o+69s3vb1UmW3xJtvafJG7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="289029534"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="289029534"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 01:26:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="803265514"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="803265514"
Received: from cgarnier-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 01:26:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915/gt: Change RC6 residency functions to
 accept register ID's
In-Reply-To: <20221015032618.2458429-2-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221015032618.2458429-1-ashutosh.dixit@intel.com>
 <20221015032618.2458429-2-ashutosh.dixit@intel.com>
Date: Mon, 17 Oct 2022 11:27:35 +0300
Message-ID: <87czaqsvm0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Oct 2022, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> Previously RC6 residency functions directly accepted RC6 residency register
> MMIO offsets (there are four RC6 residency registers). This worked but
> required an assumption on the residency register layout so was not future
> proof.
>
> Therefore change RC6 residency functions to accept register ID's instead of
> register MMIO offsets. The knowledge of register offsets as well as ID to
> offset mapping is now maintained solely in intel_rc6 and can be tailored
> for different platforms and different register layouts as need arises.
>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 27 +++------
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 ++--
>  drivers/gpu/drm/i915/gt/intel_rc6.c           | 56 +++++++++++--------
>  drivers/gpu/drm/i915/gt/intel_rc6.h           |  9 ++-
>  drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 10 ++++
>  drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
>  drivers/gpu/drm/i915/i915_pmu.c               |  6 +-
>  7 files changed, 69 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 40d0a3be42acf..1fb053cbf52db 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -83,19 +83,6 @@ static int fw_domains_show(struct seq_file *m, void *data)
>  }
>  DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
>  
> -static void print_rc6_res(struct seq_file *m,
> -			  const char *title,
> -			  const i915_reg_t reg)
> -{
> -	struct intel_gt *gt = m->private;
> -	intel_wakeref_t wakeref;
> -
> -	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		seq_printf(m, "%s %u (%llu us)\n", title,
> -			   intel_uncore_read(gt->uncore, reg),
> -			   intel_rc6_residency_us(&gt->rc6, reg));
> -}
> -
>  static int vlv_drpc(struct seq_file *m)
>  {
>  	struct intel_gt *gt = m->private;
> @@ -115,8 +102,8 @@ static int vlv_drpc(struct seq_file *m)
>  	seq_printf(m, "Media Power Well: %s\n",
>  		   (pw_status & VLV_GTLC_PW_MEDIA_STATUS_MASK) ? "Up" : "Down");
>  
> -	print_rc6_res(m, "Render RC6 residency since boot:", GEN6_GT_GFX_RC6);
> -	print_rc6_res(m, "Media RC6 residency since boot:", VLV_GT_MEDIA_RC6);
> +	intel_rc6_print_rc6_res(m, "Render RC6 residency since boot:", RC6_RES_REG_RC6);
> +	intel_rc6_print_rc6_res(m, "Media RC6 residency since boot:", VLV_RC6_RES_REG_MEDIA_RC6);
>  
>  	return fw_domains_show(m, NULL);
>  }
> @@ -192,11 +179,11 @@ static int gen6_drpc(struct seq_file *m)
>  	}
>  
>  	/* Not exactly sure what this is */
> -	print_rc6_res(m, "RC6 \"Locked to RPn\" residency since boot:",
> -		      GEN6_GT_GFX_RC6_LOCKED);
> -	print_rc6_res(m, "RC6 residency since boot:", GEN6_GT_GFX_RC6);
> -	print_rc6_res(m, "RC6+ residency since boot:", GEN6_GT_GFX_RC6p);
> -	print_rc6_res(m, "RC6++ residency since boot:", GEN6_GT_GFX_RC6pp);
> +	intel_rc6_print_rc6_res(m, "RC6 \"Locked to RPn\" residency since boot:",
> +				RC6_RES_REG_RC6_LOCKED);
> +	intel_rc6_print_rc6_res(m, "RC6 residency since boot:", RC6_RES_REG_RC6);
> +	intel_rc6_print_rc6_res(m, "RC6+ residency since boot:", RC6_RES_REG_RC6p);
> +	intel_rc6_print_rc6_res(m, "RC6++ residency since boot:", RC6_RES_REG_RC6pp);
>  
>  	if (GRAPHICS_VER(i915) <= 7) {
>  		seq_printf(m, "RC6   voltage: %dmV\n",
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 9041609523697..1ce5bfdc72282 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -93,13 +93,13 @@ sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
>  		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MAX)
>  
>  #ifdef CONFIG_PM
> -static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
> +static u32 get_residency(struct intel_gt *gt, const enum rc6_res_reg id)
>  {
>  	intel_wakeref_t wakeref;
>  	u64 res = 0;
>  
>  	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		res = intel_rc6_residency_us(&gt->rc6, reg);
> +		res = intel_rc6_residency_us(&gt->rc6, id);
>  
>  	return DIV_ROUND_CLOSEST_ULL(res, 1000);
>  }
> @@ -123,7 +123,7 @@ static ssize_t rc6_enable_show(struct device *dev,
>  
>  static u32 __rc6_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6);
> +	return get_residency(gt, RC6_RES_REG_RC6);
>  }
>  
>  static ssize_t rc6_residency_ms_show(struct device *dev,
> @@ -138,7 +138,7 @@ static ssize_t rc6_residency_ms_show(struct device *dev,
>  
>  static u32 __rc6p_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6p);
> +	return get_residency(gt, RC6_RES_REG_RC6p);
>  }
>  
>  static ssize_t rc6p_residency_ms_show(struct device *dev,
> @@ -153,7 +153,7 @@ static ssize_t rc6p_residency_ms_show(struct device *dev,
>  
>  static u32 __rc6pp_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6pp);
> +	return get_residency(gt, RC6_RES_REG_RC6pp);
>  }
>  
>  static ssize_t rc6pp_residency_ms_show(struct device *dev,
> @@ -168,7 +168,7 @@ static ssize_t rc6pp_residency_ms_show(struct device *dev,
>  
>  static u32 __media_rc6_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, VLV_GT_MEDIA_RC6);
> +	return get_residency(gt, VLV_RC6_RES_REG_MEDIA_RC6);
>  }
>  
>  static ssize_t media_rc6_residency_ms_show(struct device *dev,
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index f8d0523f4c18e..794f77fa10c55 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -551,6 +551,14 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>  	intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
>  }
>  
> +static void rc6_res_reg_init(struct intel_rc6 *rc6)
> +{
> +	rc6->res_reg[RC6_RES_REG_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> +	rc6->res_reg[RC6_RES_REG_RC6] = GEN6_GT_GFX_RC6;
> +	rc6->res_reg[RC6_RES_REG_RC6p] = GEN6_GT_GFX_RC6p;
> +	rc6->res_reg[RC6_RES_REG_RC6pp] = GEN6_GT_GFX_RC6pp;
> +}
> +
>  void intel_rc6_init(struct intel_rc6 *rc6)
>  {
>  	struct drm_i915_private *i915 = rc6_to_i915(rc6);
> @@ -562,6 +570,8 @@ void intel_rc6_init(struct intel_rc6 *rc6)
>  	if (!rc6_supported(rc6))
>  		return;
>  
> +	rc6_res_reg_init(rc6);
> +
>  	if (IS_CHERRYVIEW(i915))
>  		err = chv_rc6_init(rc6);
>  	else if (IS_VALLEYVIEW(i915))
> @@ -736,31 +746,19 @@ static u64 vlv_residency_raw(struct intel_uncore *uncore, const i915_reg_t reg)
>  	return lower | (u64)upper << 8;
>  }
>  
> -u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
> +u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const enum rc6_res_reg id)
>  {
>  	struct drm_i915_private *i915 = rc6_to_i915(rc6);
>  	struct intel_uncore *uncore = rc6_to_uncore(rc6);
>  	u64 time_hw, prev_hw, overflow_hw;
> +	i915_reg_t reg = rc6->res_reg[id];
>  	unsigned int fw_domains;
>  	unsigned long flags;
> -	unsigned int i;
>  	u32 mul, div;
>  
>  	if (!rc6->supported)
>  		return 0;
>  
> -	/*
> -	 * Store previous hw counter values for counter wrap-around handling.
> -	 *
> -	 * There are only four interesting registers and they live next to each
> -	 * other so we can use the relative address, compared to the smallest
> -	 * one as the index into driver storage.
> -	 */
> -	i = (i915_mmio_reg_offset(reg) -
> -	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
> -	if (drm_WARN_ON_ONCE(&i915->drm, i >= ARRAY_SIZE(rc6->cur_residency)))
> -		return 0;
> -
>  	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
>  
>  	spin_lock_irqsave(&uncore->lock, flags);
> @@ -789,11 +787,11 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  	/*
>  	 * Counter wrap handling.
>  	 *
> -	 * But relying on a sufficient frequency of queries otherwise counters
> -	 * can still wrap.
> +	 * Store previous hw counter values for counter wrap-around handling. But
> +	 * relying on a sufficient frequency of queries otherwise counters can still wrap.
>  	 */
> -	prev_hw = rc6->prev_hw_residency[i];
> -	rc6->prev_hw_residency[i] = time_hw;
> +	prev_hw = rc6->prev_hw_residency[id];
> +	rc6->prev_hw_residency[id] = time_hw;
>  
>  	/* RC6 delta from last sample. */
>  	if (time_hw >= prev_hw)
> @@ -802,8 +800,8 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  		time_hw += overflow_hw - prev_hw;
>  
>  	/* Add delta to RC6 extended raw driver copy. */
> -	time_hw += rc6->cur_residency[i];
> -	rc6->cur_residency[i] = time_hw;
> +	time_hw += rc6->cur_residency[id];
> +	rc6->cur_residency[id] = time_hw;
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw_domains);
>  	spin_unlock_irqrestore(&uncore->lock, flags);
> @@ -811,9 +809,23 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  	return mul_u64_u32_div(time_hw, mul, div);
>  }
>  
> -u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg)
> +u64 intel_rc6_residency_us(struct intel_rc6 *rc6, const enum rc6_res_reg id)
> +{
> +	return DIV_ROUND_UP_ULL(intel_rc6_residency_ns(rc6, id), 1000);
> +}
> +
> +void intel_rc6_print_rc6_res(struct seq_file *m,
> +			     const char *title,
> +			     const enum rc6_res_reg id)

intel_rc6_print_rc5_res is unnecessary duplication.

intel_rc6_print_residency() maybe?

>  {
> -	return DIV_ROUND_UP_ULL(intel_rc6_residency_ns(rc6, reg), 1000);
> +	struct intel_gt *gt = m->private;
> +	i915_reg_t reg = gt->rc6.res_reg[id];
> +	intel_wakeref_t wakeref;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		seq_printf(m, "%s %u (%llu us)\n", title,
> +			   intel_uncore_read(gt->uncore, reg),
> +			   intel_rc6_residency_us(&gt->rc6, id));
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.h b/drivers/gpu/drm/i915/gt/intel_rc6.h
> index b6fea71afc223..584d2d3b2ec3f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.h
> @@ -6,7 +6,7 @@
>  #ifndef INTEL_RC6_H
>  #define INTEL_RC6_H
>  
> -#include "i915_reg_defs.h"
> +#include "intel_rc6_types.h"

You can forward declare enums as a gcc extension.

enum rc6_res_reg;

>  
>  struct intel_engine_cs;
>  struct intel_rc6;
> @@ -21,7 +21,10 @@ void intel_rc6_sanitize(struct intel_rc6 *rc6);
>  void intel_rc6_enable(struct intel_rc6 *rc6);
>  void intel_rc6_disable(struct intel_rc6 *rc6);
>  
> -u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, i915_reg_t reg);
> -u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg);
> +u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const enum rc6_res_reg id);
> +u64 intel_rc6_residency_us(struct intel_rc6 *rc6, const enum rc6_res_reg id);
> +void intel_rc6_print_rc6_res(struct seq_file *m,
> +			     const char *title,
> +			     const enum rc6_res_reg id);

"const enum" makes no sense.

>  
>  #endif /* INTEL_RC6_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6_types.h b/drivers/gpu/drm/i915/gt/intel_rc6_types.h
> index e747492b2f46e..0386a3f6e4dc6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6_types.h
> @@ -13,7 +13,17 @@
>  
>  struct drm_i915_gem_object;
>  
> +enum rc6_res_reg {
> +	RC6_RES_REG_RC6_LOCKED,
> +	RC6_RES_REG_RC6,
> +	RC6_RES_REG_RC6p,
> +	RC6_RES_REG_RC6pp
> +};

Naming: intel_rc6_* for all.

I think you need to take the abstraction further away from
registers. You don't need the *register* part here for anything. Stop
thinking in terms of registers in the interface.

The callers care about things like "RC6+ residency since boot", and the
callers don't care about where or how this information originates
from. They just want the info, and the register is an implementation
detail hidden behind the interface.

I.e. use the enum to identify the data you want, not which register it
comes from.

> +
> +#define VLV_RC6_RES_REG_MEDIA_RC6 RC6_RES_REG_RC6p

Please handle this in the enum.

> +
>  struct intel_rc6 {
> +	i915_reg_t res_reg[4];

Maybe the id enum should have _MAX as last value, used for size here.

>  	u64 prev_hw_residency[4];
>  	u64 cur_residency[4];
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> index 8c70b7e120749..a236e3f8f3183 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> @@ -19,11 +19,11 @@ static u64 rc6_residency(struct intel_rc6 *rc6)
>  
>  	/* XXX VLV_GT_MEDIA_RC6? */
>  
> -	result = intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6);
> +	result = intel_rc6_residency_ns(rc6, RC6_RES_REG_RC6);
>  	if (HAS_RC6p(rc6_to_i915(rc6)))
> -		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6p);
> +		result += intel_rc6_residency_ns(rc6, RC6_RES_REG_RC6p);
>  	if (HAS_RC6pp(rc6_to_i915(rc6)))
> -		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6pp);
> +		result += intel_rc6_residency_ns(rc6, RC6_RES_REG_RC6pp);
>  
>  	return result;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 958b37123bf12..15d0f88136394 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -148,13 +148,13 @@ static u64 __get_rc6(struct intel_gt *gt)
>  	struct drm_i915_private *i915 = gt->i915;
>  	u64 val;
>  
> -	val = intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6);
> +	val = intel_rc6_residency_ns(&gt->rc6, RC6_RES_REG_RC6);
>  
>  	if (HAS_RC6p(i915))
> -		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6p);
> +		val += intel_rc6_residency_ns(&gt->rc6, RC6_RES_REG_RC6p);
>  
>  	if (HAS_RC6pp(i915))
> -		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6pp);
> +		val += intel_rc6_residency_ns(&gt->rc6, RC6_RES_REG_RC6pp);
>  
>  	return val;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
