Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A24CE078
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 23:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FD610F041;
	Fri,  4 Mar 2022 22:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2736B10E12B;
 Fri,  4 Mar 2022 22:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646434494; x=1677970494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3D37hwQ8J+3SrY8f3m+Eyly6nBm1ux0xjT7igJ5Y4C4=;
 b=SlbxxFJy0lfQqGOyf6Q/lDuoDSsVGocI6E3lisp6WUVkt833aSQrLh4/
 KlrYK+bJV2G7+ICyPIRmcKQkiFHgJsWKgm8Cc316c2BbL83LRTeoscRgB
 DYhJAzhv014h4ntPQnR2RYYcoZruXGaM7L0RZ5dLkW+PkEtRfSSPEC/UV
 ZS0Wr4WLuzVyusKw/4yWSsKFCc6tquOdk9lyOlKdImGt9KJ2zTUW529Km
 ZOH/0GOa7qgBSfuGX7vNqiVXYeEVK8/K+wdyTb5TcUSyamtqdKq4Ej0Nx
 ml8oc1sqZrrqFFCEjptoiphaTtkk71qHL9Oo3P5lEV00PYkcu+QBFyHiH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="252908798"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="252908798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 14:54:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="509122244"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 14:54:53 -0800
Date: Fri, 4 Mar 2022 14:54:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: Add preemption changes for
 Wa_14015141709
Message-ID: <YiKYu8xJlVdOuoJ/@mdroper-desk1.amr.corp.intel.com>
References: <20220303224256.2793639-1-matthew.d.roper@intel.com>
 <87h78e3u13.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h78e3u13.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 04, 2022 at 12:13:12PM +0200, Jani Nikula wrote:
> On Thu, 03 Mar 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
> > From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> >
> > Starting with DG2, preemption can no longer be controlled using userspace
> > on a per-context basis. Instead, the hardware only allows us to enable or
> > disable preemption in a global, system-wide basis. Also, we lose the
> > ability to specify the preemption granularity (such as batch-level vs
> > command-level vs object-level).
> >
> > As a result of this - for debugging purposes, this patch adds debugfs
> > interface to configure (disable/enable) preemption globally.
> >
> > Jira: VLK-27831
> 
> Please remove internal Jira references.
> 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 ++
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c |  2 +-
> >  drivers/gpu/drm/i915/i915_debugfs.c         | 50 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/i915_drv.h             |  3 ++
> >  4 files changed, 57 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 19cd34f24263..21ede1887b9f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -468,6 +468,9 @@
> >  #define VF_PREEMPTION				_MMIO(0x83a4)
> >  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
> >  
> > +#define GEN12_VFG_PREEMPTION_CHICKEN		_MMIO(0x83b4)
> > +#define   GEN12_VFG_PREEMPT_CHICKEN_DISABLE	REG_BIT(8)
> > +
> >  #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
> >  
> >  #define GEN12_SQCM				_MMIO(0x8724)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index c014b40d2e9f..18dc82f29776 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -2310,7 +2310,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> >  			     FF_DOP_CLOCK_GATE_DISABLE);
> >  	}
> >  
> > -	if (IS_GRAPHICS_VER(i915, 9, 12)) {
> > +	if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
> 
> Adding HAS_PERCTX_PREEMPT_CTRL(i915) and using it is a separate change
> from the debugfs. Please split it up.
> 
> >  		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
> >  		wa_masked_en(wal,
> >  			     GEN7_FF_SLICE_CS_CHICKEN1,
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> > index 747fe9f41e1f..40e6e17e2950 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -571,6 +571,55 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
> >  	return 0;
> >  }
> >  
> > +static void i915_global_preemption_config(struct drm_i915_private *i915,
> > +					  u32 val)
> > +{
> > +	const u32 bit = GEN12_VFG_PREEMPT_CHICKEN_DISABLE;
> 
> We rarely use const for locals, and usually only if the function is big.
> 
> I'd probably use:
> 
> 	u32 tmp = val ?
> 		_MASKED_BIT_DISABLE(GEN12_VFG_PREEMPT_CHICKEN_DISABLE) :
> 		_MASKED_BIT_ENABLE(GEN12_VFG_PREEMPT_CHICKEN_DISABLE);
> 
> To have just one intel_uncore_write().
> 
> > +
> > +	if (val)
> > +		intel_uncore_write(&i915->uncore, GEN12_VFG_PREEMPTION_CHICKEN,
> > +				   _MASKED_BIT_DISABLE(bit));
> > +	else
> > +		intel_uncore_write(&i915->uncore, GEN12_VFG_PREEMPTION_CHICKEN,
> > +				   _MASKED_BIT_ENABLE(bit));
> 
> We really shouldn't be adding new direct low-level register access in
> i915_debugfs.c.
> 
> Please define an interface for this and add the functionality to a
> suitable place, and then call the functions from here.
> 
> > +}
> > +
> > +static int i915_global_preempt_support_get(void *data, u64 *val)
> > +{
> > +	struct drm_i915_private *i915 = data;
> > +	intel_wakeref_t wakeref;
> > +	u32 curr_status = 0;
> > +
> > +	if (HAS_PERCTX_PREEMPT_CTRL(i915) || GRAPHICS_VER(i915) < 11)
> > +		return -EINVAL;
> > +
> > +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > +		curr_status = intel_uncore_read(&i915->uncore,
> > +						GEN12_VFG_PREEMPTION_CHICKEN);
> > +	*val = (curr_status & GEN12_VFG_PREEMPT_CHICKEN_DISABLE) ? 0 : 1;
> > +
> > +	return 0;
> > +}
> > +
> > +static int i915_global_preempt_support_set(void *data, u64 val)
> > +{
> > +	struct drm_i915_private *i915 = data;
> > +	intel_wakeref_t wakeref;
> > +
> > +	if (HAS_PERCTX_PREEMPT_CTRL(i915) || GRAPHICS_VER(i915) < 11)
> > +		return -EINVAL;
> > +
> > +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > +		i915_global_preemption_config(i915, val);
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SIMPLE_ATTRIBUTE(i915_global_preempt_support_fops,
> > +			i915_global_preempt_support_get,
> > +			i915_global_preempt_support_set,
> > +			"%lld\n");
> 
> DEFINE_DEBUGFS_ATTRIBUTE.

If I'm understanding the history correctly, I think
DEFINE_DEBUGFS_ATTRIBUTE is only supposed to be used if you're also
using debugfs_create_file_unsafe() for registration; if you're still
using debugfs_create_file(), then DEFINE_SIMPLE_ATTRIBUTE is preferred
to avoid the extra overhead of redundant protection.

Arguably we should shift over to debugfs_create_file_unsafe() +
DEFINE_DEBUGFS_ATTRIBUTE, but that's probably something we should do
driver-wide in a separate series since we're not doing that for any of
our debugfs today.

One other change we should make here is to move this into the GT debugfs
area, rather than having it at the i915 level.  I'll make that change in
the next version.


Matt

> 
> > +
> >  static int i915_wedged_get(void *data, u64 *val)
> >  {
> >  	struct drm_i915_private *i915 = data;
> > @@ -765,6 +814,7 @@ static const struct i915_debugfs_files {
> >  	const struct file_operations *fops;
> >  } i915_debugfs_files[] = {
> >  	{"i915_perf_noa_delay", &i915_perf_noa_delay_fops},
> > +	{"i915_global_preempt_support", &i915_global_preempt_support_fops},
> >  	{"i915_wedged", &i915_wedged_fops},
> >  	{"i915_gem_drop_caches", &i915_drop_caches_fops},
> >  #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 457bc1993d19..8c3f69c87d36 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1407,6 +1407,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> >  #define HAS_GUC_DEPRIVILEGE(dev_priv) \
> >  	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
> >  
> > +#define HAS_PERCTX_PREEMPT_CTRL(i915) \
> > +	((GRAPHICS_VER(i915) >= 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER(12, 55))
> > +
> >  static inline bool run_as_guest(void)
> >  {
> >  	return !hypervisor_is_type(X86_HYPER_NATIVE);
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
