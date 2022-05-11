Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D3522BE2
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 07:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285BC10F61A;
	Wed, 11 May 2022 05:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CCB10F611;
 Wed, 11 May 2022 05:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652247913; x=1683783913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HmbX54sipGJz/by5UD1ccmuV1aHxuDf5IL/0afKlc7Q=;
 b=QlCk1IU/zd/py/q7gAbvVND5LOkVqrPniggKrFeZ97S+VKs4DlasuOpe
 sWZE+qreaEt3I/2IBRZ8+e7s8l13I0R8Ds7922qAJ2t4NtDReANpm74c8
 3pFZZnwtepPbEQgimyEQ1667tx1RtIYInXrDlOChLmGSdE8f44D4PJ2kN
 OibLWMUfICfO1hM2W4P3WeiMBnuYQE9oXjfeaQJvyEwoXucCJjKR8in+/
 SLZKsWNERS4dcRh+lSaar6pYVD3I3u6ICmXVM7MhZApc+oRknxMTbdR29
 eYp0WughG3+JLpaF8L4kI5XpZEAdyqTq6hJQqmwrUSW5i6b8ErNAT6jSh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="356018508"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="356018508"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 22:45:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520368634"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 22:45:12 -0700
Date: Tue, 10 May 2022 22:45:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 05/12] drm/i915/pvc: Remove additional 3D flags from
 PIPE_CONTROL
Message-ID: <YntNZuUp8AurGjDp@mdroper-desk1.amr.corp.intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
 <20220505213812.3979301-6-matthew.d.roper@intel.com>
 <20220506172341.66a6d6wce6wyllg2@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506172341.66a6d6wce6wyllg2@ldmartin-desk2>
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
Cc: Stuart Summers <stuart.summers@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 10:23:41AM -0700, Lucas De Marchi wrote:
> On Thu, May 05, 2022 at 02:38:05PM -0700, Matt Roper wrote:
> > From: Stuart Summers <stuart.summers@intel.com>
> > 
> > Although we already strip 3D-specific flags from PIPE_CONTROL
> > instructions when submitting to a compute engine, there are some
> > additional flags that need to be removed when the platform as a whole
> > lacks a 3D pipeline.  Add those restrictions here.
> > 
> > Bspec: 47112
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 18 ++++++++++++------
> > drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 12 ++++++++++--
> > drivers/gpu/drm/i915/i915_drv.h              |  2 ++
> > drivers/gpu/drm/i915/i915_pci.c              |  3 ++-
> > drivers/gpu/drm/i915/intel_device_info.h     |  3 ++-
> > 5 files changed, 28 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index 3e13960615bd..11c72792573d 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -197,8 +197,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> > 
> > 		flags |= PIPE_CONTROL_CS_STALL;
> > 
> > -		if (engine->class == COMPUTE_CLASS)
> > -			flags &= ~PIPE_CONTROL_3D_FLAGS;
> > +		if (LACKS_3D_PIPELINE(engine->i915))
> > +			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> > +		else if (engine->class == COMPUTE_CLASS)
> > +			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> > 
> > 		cs = intel_ring_begin(rq, 6);
> > 		if (IS_ERR(cs))
> > @@ -227,8 +229,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> > 
> > 		flags |= PIPE_CONTROL_CS_STALL;
> > 
> > -		if (engine->class == COMPUTE_CLASS)
> > -			flags &= ~PIPE_CONTROL_3D_FLAGS;
> > +		if (LACKS_3D_PIPELINE(engine->i915))
> > +			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> > +		else if (engine->class == COMPUTE_CLASS)
> > +			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> > 
> > 		if (!HAS_FLAT_CCS(rq->engine->i915))
> > 			count = 8 + 4;
> > @@ -716,8 +720,10 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
> > 		/* Wa_1409600907 */
> > 		flags |= PIPE_CONTROL_DEPTH_STALL;
> > 
> > -	if (rq->engine->class == COMPUTE_CLASS)
> > -		flags &= ~PIPE_CONTROL_3D_FLAGS;
> > +	if (LACKS_3D_PIPELINE(rq->engine->i915))
> > +		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> > +	else if (rq->engine->class == COMPUTE_CLASS)
> > +		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> > 
> > 	cs = gen12_emit_ggtt_write_rcs(cs,
> > 				       rq->fence.seqno,
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > index 556bca3be804..900755f4b787 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > @@ -288,8 +288,8 @@
> > #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
> > #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
> > 
> > -/* 3D-related flags can't be set on compute engine */
> > -#define PIPE_CONTROL_3D_FLAGS (\
> > +/* 3D-related flags that can't be set on _engines_ that lack a 3D pipeline */
> > +#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
> > 		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
> > 		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
> > 		PIPE_CONTROL_TILE_CACHE_FLUSH | \
> > @@ -300,6 +300,14 @@
> > 		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
> > 		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
> > 
> > +/* 3D-related flags that can't be set on _platforms_ that lack a 3D pipeline */
> > +#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
> 
> names and comments here I think are confusing. In the code we do:
> 
> 		if (LACKS_3D_PIPELINE(engine->i915))
> 			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> 		else if (engine->class == COMPUTE_CLASS)
> 			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> 
> coments give the _engines_ that lack a 3D pipeline doens't seem accurate
> as bcs, vcs, vecs also lack a 3d pipeline. Maybe be explicit about the
> flags being set on compute engine: PIPE_CONTROL_COMPUTE_ENGINE_FLAGS

No, that's what we're trying to avoid here.  Presence/absence of the 3D
pipeline is a characteristic of the platform, not of the engine.  A CCS
engine doesn't have access to the 3D pipeline on any platform (that's
what makes it different from an RCS), but we still wind up needing to
program the PIPE_CONTROL flags for a CCS engine differently on a
platform like PVC (which doesn't have a 3D pipeline at all) vs Xe_HP SDV
(which does have a vestigial 3D pipeline, even though it isn't directly
usable).

Basically:

        RCS:
             All flags used
        CCS on Xe_HP SDV or DG2:
             Strip out flags specific to RCS engines
        CCS on PVC:
             Strip out flags that only exist on platforms with an
             architectural 3D pipeline *and* strip out flags specific to
             RCS engines

> 
> And LACKS_3D_PIPELINE... may be better to invert the condition to follow
> the other macros: HAS_3D_PIPELINE.

I think the code was written that way originally, but we flipped it
because adding the flag to every single platform from gen2 onward
obfuscated the fact that the absence of a standard hardware block was a
notable characteristic our code needs to look for, rather than the
presence of something.  The conditions in the code will always be
written in the inverted form "!HAS_3D_PIPELINE" so reversing it and
making it a positive "LACKS" seemed more natural.  But I can switch it
back and we can see how that looks.

> 
> > +		PIPE_CONTROL_3D_ENGINE_FLAGS | \
> > +		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
> > +		PIPE_CONTROL_FLUSH_ENABLE | \
> > +		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
> > +		PIPE_CONTROL_DC_FLUSH_ENABLE)
> > +
> > #define MI_MATH(x)			MI_INSTR(0x1a, (x) - 1)
> > #define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
> > /* Opcodes for MI_MATH_INSTR */
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index b389674b5210..1e153cefc92e 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1403,6 +1403,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> > 
> > #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
> > 
> > +#define LACKS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->lacks_3d_pipeline)
> > +
> > /* i915_gem.c */
> > void i915_gem_init_early(struct drm_i915_private *dev_priv);
> > void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index 07722cdf63ac..14e0e8225324 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1077,7 +1077,8 @@ static const struct intel_device_info ats_m_info = {
> > #define XE_HPC_FEATURES \
> > 	XE_HP_FEATURES, \
> > 	.dma_mask_size = 52, \
> > -	.has_l3_ccs_read = 1
> > +	.has_l3_ccs_read = 1, \
> > +	.lacks_3d_pipeline = 1
> 
> isn't the absence of RCS sufficient so this could be done only in the
> macro rather than adding a flag here?

No, absence of RCS does not imply absence of the 3D pipeline, just that
there's no engine that can use it.  Xe_HP SDV is still based on an
architecture with a 3D pipeline, even though it doesn't have an RCS
engine to access it, so its CCS engines have different PIPE_CONTROL
requirements than PVC's CCS engines.


Matt

> 
> Lucas De Marchi
> 
> > 
> > __maybe_unused
> > static const struct intel_device_info pvc_info = {
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> > index 09e33296157a..972084676984 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -165,7 +165,8 @@ enum intel_ppgtt_type {
> > 	func(has_snoop); \
> > 	func(has_coherent_ggtt); \
> > 	func(unfenced_needs_alignment); \
> > -	func(hws_needs_physical);
> > +	func(hws_needs_physical); \
> > +	func(lacks_3d_pipeline);
> > 
> > #define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
> > 	/* Keep in alphabetical order */ \
> > -- 
> > 2.35.1
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
