Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2064C99AF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC67A10E8EF;
	Wed,  2 Mar 2022 00:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B484110E8EE;
 Wed,  2 Mar 2022 00:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646179487; x=1677715487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lf6zN+j3e42NTfIzKpjzYekA/CgHU/ZOxRY7ldgDoCw=;
 b=jGinAMEZjLgnBAHZHNNQmvQAwqdhErbVROgq/j+tg4kpHW+4vh1YKr1B
 OcEa25wlEz9mPkJ2sxgPXxErCaei274KpnUE6fu27P6mxD85NZdx4QbMR
 OLhjk4vuFsq0QElkvuK/wIHfGi0Om0OMsegtf6Sr2GctNs/AWLAFtYLM6
 tmehOFim5KdpTCRSbaQpgptQ3yT0Pr80gC2OVPL6SuRP8CjAuYYTBCalG
 w4+vRuc0AQzAb0ATln3DoPa58luk4TFx7rm1voVGU0GsWda8jqB8X8vrS
 cqVjdFtEf2BZWnXsb0DwiO2P4h+Sx3kbPvn9JG/SJBQE1H5CStv+bTVh+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253195698"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="253195698"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:04:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="778649493"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:04:34 -0800
Date: Tue, 1 Mar 2022 16:04:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 08/13] drm/i915/xehp: Enable ccs/dual-ctx
 in RCU_MODE
Message-ID: <Yh60kaZWGQn9Mf+A@mdroper-desk1.amr.corp.intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
 <20220301231549.1817978-9-matthew.d.roper@intel.com>
 <20220301235121.GB25848@unerlige-ril-10.165.21.154>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301235121.GB25848@unerlige-ril-10.165.21.154>
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

On Tue, Mar 01, 2022 at 03:51:21PM -0800, Umesh Nerlige Ramappa wrote:
> On Tue, Mar 01, 2022 at 03:15:44PM -0800, Matt Roper wrote:
> > We have to specify in the Render Control Unit Mode register
> > when CCS is enabled.
> > 
> > v2:
> > - Move RCU_MODE programming to a helper function.  (Tvrtko)
> > - Clean up and clarify comments.  (Tvrtko)
> > - Add RCU_MODE to the GuC save/restore list.  (Daniele)
> > v3:
> > - Move this patch before the GuC ADS update to enable compute engines;
> >   the definition of RCU_MODE and its insertion into the save/restore
> >   list moves to this patch.  (Daniele)
> > 
> > Bspec: 46034
> > Original-author: Michel Thierry
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/i915/gt/intel_engine.h          |  2 ++
> > drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 17 +++++++++++++++++
> > .../drm/i915/gt/intel_execlists_submission.c    | 16 ++++++++++++++++
> > drivers/gpu/drm/i915/gt/intel_gt_regs.h         |  3 +++
> > drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c      |  4 ++++
> > .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 16 ++++++++++++++++
> > 6 files changed, 58 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> > index be4b1e65442f..1c0ab05c3c40 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> > @@ -265,6 +265,8 @@ intel_engine_create_pinned_context(struct intel_engine_cs *engine,
> > 
> > void intel_engine_destroy_pinned_context(struct intel_context *ce);
> > 
> > +void xehp_enable_ccs_engines(struct intel_engine_cs *engine);
> > +
> > #define ENGINE_PHYSICAL	0
> > #define ENGINE_MOCK	1
> > #define ENGINE_VIRTUAL	2
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > index 2136c56d3abc..92f4cf9833ee 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > @@ -2070,6 +2070,23 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
> > 	return active;
> > }
> > 
> > +void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
> > +{
> > +	/*
> > +	 * If there are any non-fused-off CCS engines, we need to enable CCS
> > +	 * support in the RCU_MODE register.  This only needs to be done once,
> > +	 * so for simplicity we'll take care of this in the RCS engine's
> > +	 * resume handler; since the RCS and all CCS engines belong to the
> > +	 * same reset domain and are reset together, this will also take care
> > +	 * of re-applying the setting after i915-triggered resets.
> > +	 */
> > +	if (!CCS_MASK(engine->gt))
> > +		return;
> > +
> > +	intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
> > +			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
> > +}
> > +
> > #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > #include "mock_engine.c"
> > #include "selftest_engine.c"
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index c8407cc96c42..574c0542c92f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -2914,6 +2914,19 @@ static int execlists_resume(struct intel_engine_cs *engine)
> > 	return 0;
> > }
> > 
> > +static int gen12_rcs_resume(struct intel_engine_cs *engine)
> > +{
> > +	int ret;
> > +
> > +	ret = execlists_resume(engine);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xehp_enable_ccs_engines(engine);
> > +
> > +	return 0;
> > +}
> > +
> > static void execlists_reset_prepare(struct intel_engine_cs *engine)
> > {
> > 	ENGINE_TRACE(engine, "depth<-%d\n",
> > @@ -3468,6 +3481,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
> > 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
> > 		break;
> > 	}
> > +
> > +	if (engine->class == RENDER_CLASS)
> > +		engine->resume = gen12_rcs_resume;
> > }
> > 
> > int intel_execlists_submission_setup(struct intel_engine_cs *engine)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 84f189738a68..e629443e07ae 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1327,6 +1327,9 @@
> > #define   ECOBITS_PPGTT_CACHE64B		(3 << 8)
> > #define   ECOBITS_PPGTT_CACHE4B			(0 << 8)
> > 
> > +#define GEN12_RCU_MODE				_MMIO(0x14800)
> > +#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> > +
> > #define CHV_FUSE_GT				_MMIO(VLV_DISPLAY_BASE + 0x2168)
> > #define   CHV_FGT_DISABLE_SS0			(1 << 10)
> > #define   CHV_FGT_DISABLE_SS1			(1 << 11)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > index 847e00390b00..29fbe4681ca7 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > @@ -335,6 +335,10 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
> > 	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
> > 	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
> > 
> > +	if (engine->class == RENDER_CLASS &&
> > +	    CCS_MASK(engine->gt))
> > +		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
> > +
> > 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
> > 		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 891b98236155..7e248e2001de 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -3603,6 +3603,19 @@ static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
> > 	return !sched_engine->tasklet.callback;
> > }
> > 
> > +static int gen12_rcs_resume(struct intel_engine_cs *engine)
> > +{
> > +	int ret;
> > +
> > +	ret = guc_resume(engine);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xehp_enable_ccs_engines(engine);
> > +
> > +	return 0;
> > +}
> > +
> > static void guc_set_default_submission(struct intel_engine_cs *engine)
> > {
> > 	engine->submit_request = guc_submit_request;
> > @@ -3723,6 +3736,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
> > 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
> > 		break;
> > 	}
> > +
> > +	if (engine->class == RENDER_CLASS)
> > +		engine->resume = gen12_rcs_resume;
> 
> Why not just have guc_resume and execlist_resume call
> xehp_enable_ccs_engines(engine) for render case?

That does seem like it would be simpler; I'll make that change and
resend.

> 
> Also what happens if render itself is not present/fused-off (if there is
> such a thing)?

There are still some patches that haven't been sent yet that switch some
of the various conditions to apply to an engine with
'I915_ENGINE_FIRST_RENDER_COMPUTE' rather than always to the RCS0
engine.  That will cover platforms where there is no render engine in
the design, as well as platforms where the render engine is part of the
architecture, but is fused off on some boards.


Matt

> 
> Just those questions, overall the patch looks fine as is:
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Umesh
> 
> 
> > }
> > 
> > static inline void guc_default_irqs(struct intel_engine_cs *engine)
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
