Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4751DE4F
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 19:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3E810E103;
	Fri,  6 May 2022 17:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B010E021;
 Fri,  6 May 2022 17:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651857822; x=1683393822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fFcNWXXH9+dwnkMNiDXiwOsYaiBm3SdCT1ugaFxr1uQ=;
 b=W2l/2vP0VB2GAWrliaMO8HU8XdVfD6NFGqaMhNJ/EBIJtoArVkbE0Cjm
 cdgDbWRmeKY9yJODuN88arsSmAk+hdyyrllBFh3fVVApvZyYrr6oQnF5j
 5gJyta0SxOuUXCqDsenxaFdMZunbFBB54u0Cz9GTNHsNvrFcTjRvsKZAN
 BzE/PmgJs7Z+4Ty1b5GS6OlIUk1XSdXP+mbLTGVJVB1PP4tIeyWzXCPJe
 eVdyoOzWQd75v4fkQGF+e3VPjzv8D1d1p2MLh0xhxAZ1d0gzCKnvKCr1x
 6RULmR4DOFfv3mlbWHoZ7D75mamDqjS5v2x34JQFmnYP3GosRXwefI9+O A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="249059049"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="249059049"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:23:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="600651813"
Received: from bhausman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.22.165])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:23:41 -0700
Date: Fri, 6 May 2022 10:23:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 05/12] drm/i915/pvc: Remove additional 3D flags from
 PIPE_CONTROL
Message-ID: <20220506172341.66a6d6wce6wyllg2@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
 <20220505213812.3979301-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220505213812.3979301-6-matthew.d.roper@intel.com>
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

On Thu, May 05, 2022 at 02:38:05PM -0700, Matt Roper wrote:
>From: Stuart Summers <stuart.summers@intel.com>
>
>Although we already strip 3D-specific flags from PIPE_CONTROL
>instructions when submitting to a compute engine, there are some
>additional flags that need to be removed when the platform as a whole
>lacks a 3D pipeline.  Add those restrictions here.
>
>Bspec: 47112
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 18 ++++++++++++------
> drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 12 ++++++++++--
> drivers/gpu/drm/i915/i915_drv.h              |  2 ++
> drivers/gpu/drm/i915/i915_pci.c              |  3 ++-
> drivers/gpu/drm/i915/intel_device_info.h     |  3 ++-
> 5 files changed, 28 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>index 3e13960615bd..11c72792573d 100644
>--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>@@ -197,8 +197,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>
> 		flags |= PIPE_CONTROL_CS_STALL;
>
>-		if (engine->class == COMPUTE_CLASS)
>-			flags &= ~PIPE_CONTROL_3D_FLAGS;
>+		if (LACKS_3D_PIPELINE(engine->i915))
>+			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>+		else if (engine->class == COMPUTE_CLASS)
>+			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>
> 		cs = intel_ring_begin(rq, 6);
> 		if (IS_ERR(cs))
>@@ -227,8 +229,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>
> 		flags |= PIPE_CONTROL_CS_STALL;
>
>-		if (engine->class == COMPUTE_CLASS)
>-			flags &= ~PIPE_CONTROL_3D_FLAGS;
>+		if (LACKS_3D_PIPELINE(engine->i915))
>+			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>+		else if (engine->class == COMPUTE_CLASS)
>+			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>
> 		if (!HAS_FLAT_CCS(rq->engine->i915))
> 			count = 8 + 4;
>@@ -716,8 +720,10 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
> 		/* Wa_1409600907 */
> 		flags |= PIPE_CONTROL_DEPTH_STALL;
>
>-	if (rq->engine->class == COMPUTE_CLASS)
>-		flags &= ~PIPE_CONTROL_3D_FLAGS;
>+	if (LACKS_3D_PIPELINE(rq->engine->i915))
>+		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>+	else if (rq->engine->class == COMPUTE_CLASS)
>+		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>
> 	cs = gen12_emit_ggtt_write_rcs(cs,
> 				       rq->fence.seqno,
>diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>index 556bca3be804..900755f4b787 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>@@ -288,8 +288,8 @@
> #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
> #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
>
>-/* 3D-related flags can't be set on compute engine */
>-#define PIPE_CONTROL_3D_FLAGS (\
>+/* 3D-related flags that can't be set on _engines_ that lack a 3D pipeline */
>+#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
> 		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
> 		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
> 		PIPE_CONTROL_TILE_CACHE_FLUSH | \
>@@ -300,6 +300,14 @@
> 		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
> 		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
>
>+/* 3D-related flags that can't be set on _platforms_ that lack a 3D pipeline */
>+#define PIPE_CONTROL_3D_ARCH_FLAGS ( \

names and comments here I think are confusing. In the code we do:

		if (LACKS_3D_PIPELINE(engine->i915))
			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
		else if (engine->class == COMPUTE_CLASS)
			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;

coments give the _engines_ that lack a 3D pipeline doens't seem accurate
as bcs, vcs, vecs also lack a 3d pipeline. Maybe be explicit about the
flags being set on compute engine: PIPE_CONTROL_COMPUTE_ENGINE_FLAGS

And LACKS_3D_PIPELINE... may be better to invert the condition to follow
the other macros: HAS_3D_PIPELINE.

>+		PIPE_CONTROL_3D_ENGINE_FLAGS | \
>+		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
>+		PIPE_CONTROL_FLUSH_ENABLE | \
>+		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
>+		PIPE_CONTROL_DC_FLUSH_ENABLE)
>+
> #define MI_MATH(x)			MI_INSTR(0x1a, (x) - 1)
> #define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
> /* Opcodes for MI_MATH_INSTR */
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index b389674b5210..1e153cefc92e 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -1403,6 +1403,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>
> #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
>
>+#define LACKS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->lacks_3d_pipeline)
>+
> /* i915_gem.c */
> void i915_gem_init_early(struct drm_i915_private *dev_priv);
> void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
>diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>index 07722cdf63ac..14e0e8225324 100644
>--- a/drivers/gpu/drm/i915/i915_pci.c
>+++ b/drivers/gpu/drm/i915/i915_pci.c
>@@ -1077,7 +1077,8 @@ static const struct intel_device_info ats_m_info = {
> #define XE_HPC_FEATURES \
> 	XE_HP_FEATURES, \
> 	.dma_mask_size = 52, \
>-	.has_l3_ccs_read = 1
>+	.has_l3_ccs_read = 1, \
>+	.lacks_3d_pipeline = 1

isn't the absence of RCS sufficient so this could be done only in the
macro rather than adding a flag here?

Lucas De Marchi

>
> __maybe_unused
> static const struct intel_device_info pvc_info = {
>diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
>index 09e33296157a..972084676984 100644
>--- a/drivers/gpu/drm/i915/intel_device_info.h
>+++ b/drivers/gpu/drm/i915/intel_device_info.h
>@@ -165,7 +165,8 @@ enum intel_ppgtt_type {
> 	func(has_snoop); \
> 	func(has_coherent_ggtt); \
> 	func(unfenced_needs_alignment); \
>-	func(hws_needs_physical);
>+	func(hws_needs_physical); \
>+	func(lacks_3d_pipeline);
>
> #define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
> 	/* Keep in alphabetical order */ \
>-- 
>2.35.1
>
