Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DADC522C07
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76E710EB41;
	Wed, 11 May 2022 06:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74D810E3F1;
 Wed, 11 May 2022 06:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652248958; x=1683784958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZbDzAT9NzcDHoTusBz5z4onfaG0k6Ko+xiM4ig8vZdY=;
 b=gI3PkgCXEaCtm0impt1ghHqCEmpq+COeACSxguk81nF6BBDl5aSwrsXC
 t05WA07bfNTGCaOToKwEl8G7ag1TAJPcAXO+czytNTl0C2QqM16e+wi6U
 5OS5AfDLwMIhCKCNoCx8BYoCM4oGJjgwTY5LL43hxh1UHVcan2ICdxZnK
 mA7RGmIK2gkoBY03qUdY52qCh4XB/lk1Bb3Mg8SV1nfr/k5slOjwVu2fy
 HjSitHQVmRJSFCjTIzfy8dQUVBZUl559hD8rXBPeDdk/e79uCvzNBQQ7U
 sMzX9SX6+SOFOU8BKy+q8deD+j67EK75mx65XTKcsEO8JKiFUP4zUNSzq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332633559"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="332633559"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520375214"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/i915/pvc: Remove additional 3D flags from
 PIPE_CONTROL
Date: Tue, 10 May 2022 23:02:26 -0700
Message-Id: <20220511060228.1179450-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511060228.1179450-1-matthew.d.roper@intel.com>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Although we already strip 3D-specific flags from PIPE_CONTROL
instructions when submitting to a compute engine, there are some
additional flags that need to be removed when the platform as a whole
lacks a 3D pipeline.  Add those restrictions here.

v2:
 - Replace LACKS_3D_PIPELINE checks with !HAS_3D_PIPELINE and add
   has_3d_pipeline to all platforms except PVC.  (Lucas)

Bspec: 47112
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 18 ++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 15 +++++++++++++--
 drivers/gpu/drm/i915/i915_drv.h              |  2 ++
 drivers/gpu/drm/i915/i915_pci.c              | 10 ++++++++++
 drivers/gpu/drm/i915/intel_device_info.h     |  1 +
 5 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index daa1a61972f4..98645797962f 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -197,8 +197,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
-		if (engine->class == COMPUTE_CLASS)
-			flags &= ~PIPE_CONTROL_3D_FLAGS;
+		if (!HAS_3D_PIPELINE(engine->i915))
+			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+		else if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 		cs = intel_ring_begin(rq, 6);
 		if (IS_ERR(cs))
@@ -227,8 +229,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
-		if (engine->class == COMPUTE_CLASS)
-			flags &= ~PIPE_CONTROL_3D_FLAGS;
+		if (!HAS_3D_PIPELINE(engine->i915))
+			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+		else if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 		if (!HAS_FLAT_CCS(rq->engine->i915))
 			count = 8 + 4;
@@ -717,8 +721,10 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 		/* Wa_1409600907 */
 		flags |= PIPE_CONTROL_DEPTH_STALL;
 
-	if (rq->engine->class == COMPUTE_CLASS)
-		flags &= ~PIPE_CONTROL_3D_FLAGS;
+	if (!HAS_3D_PIPELINE(rq->engine->i915))
+		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+	else if (rq->engine->class == COMPUTE_CLASS)
+		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	cs = gen12_emit_ggtt_write_rcs(cs,
 				       rq->fence.seqno,
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 556bca3be804..964fe376c7fa 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -288,8 +288,11 @@
 #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
 #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
 
-/* 3D-related flags can't be set on compute engine */
-#define PIPE_CONTROL_3D_FLAGS (\
+/*
+ * 3D-related flags that can't be set on _engines_ that lack access to the 3D
+ * pipeline (i.e., CCS engines).
+ */
+#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
 		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
 		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
 		PIPE_CONTROL_TILE_CACHE_FLUSH | \
@@ -300,6 +303,14 @@
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
index 10f273800645..54e9c2a5493d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1405,6 +1405,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
 
+#define HAS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->has_3d_pipeline)
+
 /* i915_gem.c */
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index d8d893bafa51..de44dc04c27f 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -171,6 +171,7 @@
 	.display.overlay_needs_physical = 1, \
 	.display.has_gmch = 1, \
 	.gpu_reset_clobbers_display = true, \
+	.has_3d_pipeline = 1, \
 	.hws_needs_physical = 1, \
 	.unfenced_needs_alignment = 1, \
 	.platform_engine_mask = BIT(RCS0), \
@@ -190,6 +191,7 @@
 	.display.has_overlay = 1, \
 	.display.overlay_needs_physical = 1, \
 	.display.has_gmch = 1, \
+	.has_3d_pipeline = 1, \
 	.gpu_reset_clobbers_display = true, \
 	.hws_needs_physical = 1, \
 	.unfenced_needs_alignment = 1, \
@@ -232,6 +234,7 @@ static const struct intel_device_info i865g_info = {
 	.display.has_gmch = 1, \
 	.gpu_reset_clobbers_display = true, \
 	.platform_engine_mask = BIT(RCS0), \
+	.has_3d_pipeline = 1, \
 	.has_snoop = true, \
 	.has_coherent_ggtt = true, \
 	.dma_mask_size = 32, \
@@ -323,6 +326,7 @@ static const struct intel_device_info pnv_m_info = {
 	.display.has_gmch = 1, \
 	.gpu_reset_clobbers_display = true, \
 	.platform_engine_mask = BIT(RCS0), \
+	.has_3d_pipeline = 1, \
 	.has_snoop = true, \
 	.has_coherent_ggtt = true, \
 	.dma_mask_size = 36, \
@@ -374,6 +378,7 @@ static const struct intel_device_info gm45_info = {
 	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B), \
 	.display.has_hotplug = 1, \
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0), \
+	.has_3d_pipeline = 1, \
 	.has_snoop = true, \
 	.has_coherent_ggtt = true, \
 	.dma_mask_size = 36, \
@@ -403,6 +408,7 @@ static const struct intel_device_info ilk_m_info = {
 	.display.has_hotplug = 1, \
 	.display.fbc_mask = BIT(INTEL_FBC_A), \
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0), \
+	.has_3d_pipeline = 1, \
 	.has_coherent_ggtt = true, \
 	.has_llc = 1, \
 	.has_rc6p = 1, \
@@ -453,6 +459,7 @@ static const struct intel_device_info snb_m_gt2_info = {
 	.display.has_hotplug = 1, \
 	.display.fbc_mask = BIT(INTEL_FBC_A), \
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0), \
+	.has_3d_pipeline = 1, \
 	.has_coherent_ggtt = true, \
 	.has_llc = 1, \
 	.has_rc6p = 1, \
@@ -679,6 +686,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
 		BIT(TRANSCODER_DSI_A) | BIT(TRANSCODER_DSI_C), \
+	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
 	.display.has_fpga_dbg = 1, \
 	.display.fbc_mask = BIT(INTEL_FBC_A), \
@@ -982,6 +990,7 @@ static const struct intel_device_info adl_p_info = {
 	.graphics.rel = 50, \
 	XE_HP_PAGE_SIZES, \
 	.dma_mask_size = 46, \
+	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
 	.has_flat_ccs = 1, \
 	.has_global_mocs = 1, \
@@ -1050,6 +1059,7 @@ static const struct intel_device_info ats_m_info = {
 #define XE_HPC_FEATURES \
 	XE_HP_FEATURES, \
 	.dma_mask_size = 52, \
+	.has_3d_pipeline = 0, \
 	.has_l3_ccs_read = 1
 
 __maybe_unused
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 60fc35ae81df..415f028d8970 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -142,6 +142,7 @@ enum intel_ppgtt_type {
 	func(has_64k_pages); \
 	func(needs_compact_pt); \
 	func(gpu_reset_clobbers_display); \
+	func(has_3d_pipeline); \
 	func(has_4tile); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
-- 
2.35.1

