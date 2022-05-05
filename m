Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8351CB65
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40310FA69;
	Thu,  5 May 2022 21:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F40F10EC7D;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786702; x=1683322702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tKwnAjAxpuWTAHFsLPFz4PTkKkD9D71uKe9J9Snh4v4=;
 b=V12izNutrKogITx7VI13xGOTnARYt4zZd4YgO1sfQn0cUVf1cqoUYXaO
 lGWLEkb/ZPKjh+ZRDHSkZuyTToOCR/SLg1zrcC3KLpH5FWTl0Gq55vZuf
 q55Bj1sxZVeDM+FLF1eqpxOgJ4d4rnQjHeB5lh2S5z1B6MrZ5WTz6Fhye
 2v5lEc3YwyJeorIn+E9E7q9po/wp0/cqP2n/Z92PXNAKFfUshFc1z4RIX
 gPbEz1AbsuSQfSbiqWVwFy7kfzqSziDiHOeS559wdEy9Vr6u4KfyGAevW
 G7BBvl7ywIKR3Rs26/Kx4oe2uyXwCo4g/s0FmY9wxrXNcsDUWNuwktjL/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248166063"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248166063"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553270"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/12] drm/i915/pvc: Remove additional 3D flags from
 PIPE_CONTROL
Date: Thu,  5 May 2022 14:38:05 -0700
Message-Id: <20220505213812.3979301-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Although we already strip 3D-specific flags from PIPE_CONTROL
instructions when submitting to a compute engine, there are some
additional flags that need to be removed when the platform as a whole
lacks a 3D pipeline.  Add those restrictions here.

Bspec: 47112
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 18 ++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 12 ++++++++++--
 drivers/gpu/drm/i915/i915_drv.h              |  2 ++
 drivers/gpu/drm/i915/i915_pci.c              |  3 ++-
 drivers/gpu/drm/i915/intel_device_info.h     |  3 ++-
 5 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 3e13960615bd..11c72792573d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -197,8 +197,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
-		if (engine->class == COMPUTE_CLASS)
-			flags &= ~PIPE_CONTROL_3D_FLAGS;
+		if (LACKS_3D_PIPELINE(engine->i915))
+			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+		else if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 		cs = intel_ring_begin(rq, 6);
 		if (IS_ERR(cs))
@@ -227,8 +229,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
-		if (engine->class == COMPUTE_CLASS)
-			flags &= ~PIPE_CONTROL_3D_FLAGS;
+		if (LACKS_3D_PIPELINE(engine->i915))
+			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+		else if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 		if (!HAS_FLAT_CCS(rq->engine->i915))
 			count = 8 + 4;
@@ -716,8 +720,10 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 		/* Wa_1409600907 */
 		flags |= PIPE_CONTROL_DEPTH_STALL;
 
-	if (rq->engine->class == COMPUTE_CLASS)
-		flags &= ~PIPE_CONTROL_3D_FLAGS;
+	if (LACKS_3D_PIPELINE(rq->engine->i915))
+		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+	else if (rq->engine->class == COMPUTE_CLASS)
+		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	cs = gen12_emit_ggtt_write_rcs(cs,
 				       rq->fence.seqno,
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 556bca3be804..900755f4b787 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -288,8 +288,8 @@
 #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
 #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
 
-/* 3D-related flags can't be set on compute engine */
-#define PIPE_CONTROL_3D_FLAGS (\
+/* 3D-related flags that can't be set on _engines_ that lack a 3D pipeline */
+#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
 		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
 		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
 		PIPE_CONTROL_TILE_CACHE_FLUSH | \
@@ -300,6 +300,14 @@
 		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
 		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
 
+/* 3D-related flags that can't be set on _platforms_ that lack a 3D pipeline */
+#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
+		PIPE_CONTROL_3D_ENGINE_FLAGS | \
+		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
+		PIPE_CONTROL_FLUSH_ENABLE | \
+		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
+		PIPE_CONTROL_DC_FLUSH_ENABLE)
+
 #define MI_MATH(x)			MI_INSTR(0x1a, (x) - 1)
 #define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
 /* Opcodes for MI_MATH_INSTR */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b389674b5210..1e153cefc92e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1403,6 +1403,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
 
+#define LACKS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->lacks_3d_pipeline)
+
 /* i915_gem.c */
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 07722cdf63ac..14e0e8225324 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1077,7 +1077,8 @@ static const struct intel_device_info ats_m_info = {
 #define XE_HPC_FEATURES \
 	XE_HP_FEATURES, \
 	.dma_mask_size = 52, \
-	.has_l3_ccs_read = 1
+	.has_l3_ccs_read = 1, \
+	.lacks_3d_pipeline = 1
 
 __maybe_unused
 static const struct intel_device_info pvc_info = {
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 09e33296157a..972084676984 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -165,7 +165,8 @@ enum intel_ppgtt_type {
 	func(has_snoop); \
 	func(has_coherent_ggtt); \
 	func(unfenced_needs_alignment); \
-	func(hws_needs_physical);
+	func(hws_needs_physical); \
+	func(lacks_3d_pipeline);
 
 #define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
 	/* Keep in alphabetical order */ \
-- 
2.35.1

