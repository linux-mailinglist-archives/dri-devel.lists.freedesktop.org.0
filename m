Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C965BCB92
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 14:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492910E2AE;
	Mon, 19 Sep 2022 12:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B8C10E004;
 Mon, 19 Sep 2022 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589617; x=1695125617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+EWklL6lUaVP7/M7ns/7SsIHWwirjQs5rXOku712Q70=;
 b=MpzezBKdwxcvJu0bpDvcQ6ySDGrJ2MhA4CkQhcJORY0plWyjIbdhF0uq
 m75O/e6pgl+ALQlZe3kxWOZ1XsI7RL/G2j3zYo86RcQQKv4xU9VoWeOoI
 edglpAaQyFex9ZsNleGJusvm7ZFndvrs1sgmCx/eEwFiC8ZqfnSjmF5Ah
 LQZYt7VI6nXo6CReSlS60OAzfZjSXmi+bgPTV+ghkoesFV5fkyOW+Guvq
 qHALKQzIEpxXJZ8C+xi9Ip+l+DHIdTBNFL9hf6lnEITyEwpUIdPgXiu1x
 eC69s2SZ9EvkHflVAMDBEIeqjDe3AZ1OLpvaJBDu/SlRgK9RiFHl9oVN8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="298111594"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="298111594"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:13:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620835771"
Received: from jjohns2-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.205])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:13:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/mtl: Add C6 residency support for MTL SAMedia
In-Reply-To: <20220919115906.1264041-3-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220919115906.1264041-1-badal.nilawar@intel.com>
 <20220919115906.1264041-3-badal.nilawar@intel.com>
Date: Mon, 19 Sep 2022 15:13:18 +0300
Message-ID: <87edw7pnoh.fsf@intel.com>
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
Cc: andi.shyti@intel.com, tvrtko.ursulin@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Sep 2022, Badal Nilawar <badal.nilawar@intel.com> wrote:
> For MTL SAMedia updated relevant functions and places in the code to get
> Media C6 residency.
>
> v2: Fixed review comments (Ashutosh)
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 60 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 10 ++++
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  9 ++-
>  drivers/gpu/drm/i915/gt/intel_rc6.c           |  5 +-
>  drivers/gpu/drm/i915/gt/selftest_rc6.c        |  9 ++-
>  drivers/gpu/drm/i915/i915_pmu.c               |  8 ++-
>  6 files changed, 97 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 68310881a793..053167b506a9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -269,6 +269,64 @@ static int ilk_drpc(struct seq_file *m)
>  	return 0;
>  }
>  
> +static int mtl_drpc(struct seq_file *m)
> +{
> +	struct intel_gt *gt = m->private;
> +	struct intel_uncore *uncore = gt->uncore;
> +	u32 gt_core_status, rcctl1, global_forcewake;
> +	u32 mtl_powergate_enable = 0, mtl_powergate_status = 0;
> +	i915_reg_t reg;
> +
> +	gt_core_status = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
> +
> +	global_forcewake = intel_uncore_read(uncore, FORCEWAKE_GT_GEN9);
> +
> +	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
> +	mtl_powergate_enable = intel_uncore_read(uncore, GEN9_PG_ENABLE);
> +	mtl_powergate_status = intel_uncore_read(uncore,
> +						 GEN9_PWRGT_DOMAIN_STATUS);
> +
> +	seq_printf(m, "RC6 Enabled: %s\n",
> +		   str_yes_no(rcctl1 & GEN6_RC_CTL_RC6_ENABLE));
> +	if (gt->type == GT_MEDIA) {
> +		seq_printf(m, "Media Well Gating Enabled: %s\n",
> +			   str_yes_no(mtl_powergate_enable & GEN9_MEDIA_PG_ENABLE));
> +	} else {
> +		seq_printf(m, "Render Well Gating Enabled: %s\n",
> +			   str_yes_no(mtl_powergate_enable & GEN9_RENDER_PG_ENABLE));
> +	}
> +
> +	seq_puts(m, "Current RC state: ");
> +
> +	switch ((gt_core_status & MTL_CC_MASK) >> MTL_CC_SHIFT) {
> +	case MTL_CC0:
> +		seq_puts(m, "on\n");
> +		break;
> +	case MTL_CC6:
> +		seq_puts(m, "RC6\n");
> +		break;
> +	default:
> +		seq_puts(m, "Unknown\n");
> +		break;
> +	}
> +
> +	if (gt->type == GT_MEDIA)
> +		seq_printf(m, "Media Power Well: %s\n",
> +			   (mtl_powergate_status &
> +			    GEN9_PWRGT_MEDIA_STATUS_MASK) ? "Up" : "Down");
> +	else
> +		seq_printf(m, "Render Power Well: %s\n",
> +			   (mtl_powergate_status &
> +			    GEN9_PWRGT_RENDER_STATUS_MASK) ? "Up" : "Down");
> +
> +	reg = (gt->type == GT_MEDIA) ? MTL_MEDIA_MC6 : GEN6_GT_GFX_RC6;
> +	print_rc6_res(m, "RC6 residency since boot:", reg);

Cc: Tvrtko, Joonas, Rodrigo

IMO the register is not a good abstraction to build interfaces on. I see
that this is not where the idea is introduced, but it'll probably get
you in trouble later on.

BR,
Jani.

> +
> +	seq_printf(m, "Global Forcewake Requests: 0x%x\n", global_forcewake);
> +
> +	return fw_domains_show(m, NULL);
> +}
> +
>  static int drpc_show(struct seq_file *m, void *unused)
>  {
>  	struct intel_gt *gt = m->private;
> @@ -279,6 +337,8 @@ static int drpc_show(struct seq_file *m, void *unused)
>  	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
>  		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  			err = vlv_drpc(m);
> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +			err = mtl_drpc(m);
>  		else if (GRAPHICS_VER(i915) >= 6)
>  			err = gen6_drpc(m);
>  		else
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 7819d32db956..8a56fd873228 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1517,6 +1517,16 @@
>   */
>  #define MTL_MIRROR_TARGET_WP1          _MMIO(0x0C60)
>  #define   MTL_CAGF_MASK                REG_GENMASK(8, 0)
> +#define   MTL_CC0                      0x0
> +#define   MTL_CC6                      0x3
> +#define   MTL_CC_SHIFT                 9
> +#define   MTL_CC_MASK                  (0xf << MTL_CC_SHIFT)
> +
> +/*
> + * MTL: This register contains the total MC6 residency time that SAMedia was
> + * since boot
> + */
> +#define MTL_MEDIA_MC6                          _MMIO(0x138048)
>  
>  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>  #define   GEN11_CSME				(31)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 54deae45d81f..7ab1d776673a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -123,7 +123,14 @@ static ssize_t rc6_enable_show(struct device *dev,
>  
>  static u32 __rc6_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6);
> +	i915_reg_t reg;
> +
> +	if (gt->type == GT_MEDIA)
> +		reg = MTL_MEDIA_MC6;
> +	else
> +		reg = GEN6_GT_GFX_RC6;
> +
> +	return get_residency(gt, reg);
>  }
>  
>  static ssize_t rc6_residency_ms_show(struct device *dev,
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index f8d0523f4c18..26f71f7f07c6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -745,6 +745,7 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  	unsigned long flags;
>  	unsigned int i;
>  	u32 mul, div;
> +	i915_reg_t base;
>  
>  	if (!rc6->supported)
>  		return 0;
> @@ -756,8 +757,10 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  	 * other so we can use the relative address, compared to the smallest
>  	 * one as the index into driver storage.
>  	 */
> +	base = (rc6_to_gt(rc6)->type == GT_MEDIA) ?
> +	       MTL_MEDIA_MC6 : GEN6_GT_GFX_RC6_LOCKED;
>  	i = (i915_mmio_reg_offset(reg) -
> -	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
> +	     i915_mmio_reg_offset(base)) / sizeof(u32);
>  	if (drm_WARN_ON_ONCE(&i915->drm, i >= ARRAY_SIZE(rc6->cur_residency)))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> index 8c70b7e12074..28c6a4b6b8d1 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> @@ -15,11 +15,18 @@
>  
>  static u64 rc6_residency(struct intel_rc6 *rc6)
>  {
> +	struct intel_gt *gt = rc6_to_gt(rc6);
> +	i915_reg_t reg;
>  	u64 result;
>  
>  	/* XXX VLV_GT_MEDIA_RC6? */
>  
> -	result = intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6);
> +	if (gt->type == GT_MEDIA)
> +		reg = MTL_MEDIA_MC6;
> +	else
> +		reg = GEN6_GT_GFX_RC6;
> +
> +	result = intel_rc6_residency_ns(rc6, reg);
>  	if (HAS_RC6p(rc6_to_i915(rc6)))
>  		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6p);
>  	if (HAS_RC6pp(rc6_to_i915(rc6)))
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 958b37123bf1..6ec139668641 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -146,9 +146,15 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
>  static u64 __get_rc6(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> +	i915_reg_t reg;
>  	u64 val;
>  
> -	val = intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6);
> +	if (gt->type == GT_MEDIA)
> +		reg = MTL_MEDIA_MC6;
> +	else
> +		reg = GEN6_GT_GFX_RC6;
> +
> +	val = intel_rc6_residency_ns(&gt->rc6, reg);
>  
>  	if (HAS_RC6p(i915))
>  		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6p);

-- 
Jani Nikula, Intel Open Source Graphics Center
