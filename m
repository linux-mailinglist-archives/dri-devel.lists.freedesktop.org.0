Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82F402D9F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E166E093;
	Tue,  7 Sep 2021 17:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8AD6E08E;
 Tue,  7 Sep 2021 17:19:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322738"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322738"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352257"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 5/8] drm/i915/xehp: compute engine pipe_control
Date: Tue,  7 Sep 2021 10:19:13 -0700
Message-Id: <20210907171916.2548047-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210907171916.2548047-1-matthew.d.roper@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

CCS re-uses the RCS functions for breadcrumb and flush emission.
However, CCS pipe_control has additional programming restrictions:

- Command Streamer Stall Enable must be always set
- Post Sync Operations must not be set to Write PS Depth Count
- 3D-related bits must not be set

Bspec: 47112
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 31 ++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 15 ++++++++++
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 461844dffd7e..bf79e5ee3e45 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -200,6 +200,8 @@ static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
 
 int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
+	struct intel_engine_cs *engine = rq->engine;
+
 	if (mode & EMIT_FLUSH) {
 		u32 flags = 0;
 		u32 *cs;
@@ -218,6 +220,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
+		if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_RENDER_ONLY_FLAGS;
+
 		cs = intel_ring_begin(rq, 6);
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
@@ -245,6 +250,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
+		if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_RENDER_ONLY_FLAGS;
+
 		cs = intel_ring_begin(rq, 8 + 4);
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
@@ -617,19 +625,24 @@ u32 *gen12_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs)
 
 u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 {
+	u32 flags = (PIPE_CONTROL_CS_STALL |
+		     PIPE_CONTROL_TILE_CACHE_FLUSH |
+		     PIPE_CONTROL_FLUSH_L3 |
+		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
+		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
+		     /* Wa_1409600907:tgl,rkl,dg1,adl-p */
+		     PIPE_CONTROL_DEPTH_STALL |
+		     PIPE_CONTROL_DC_FLUSH_ENABLE |
+		     PIPE_CONTROL_FLUSH_ENABLE);
+
+	if (rq->engine->class == COMPUTE_CLASS)
+		flags &= ~PIPE_CONTROL_RENDER_ONLY_FLAGS;
+
 	cs = gen12_emit_ggtt_write_rcs(cs,
 				       rq->fence.seqno,
 				       hwsp_offset(rq),
 				       PIPE_CONTROL0_HDC_PIPELINE_FLUSH,
-				       PIPE_CONTROL_CS_STALL |
-				       PIPE_CONTROL_TILE_CACHE_FLUSH |
-				       PIPE_CONTROL_FLUSH_L3 |
-				       PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
-				       PIPE_CONTROL_DEPTH_CACHE_FLUSH |
-				       /* Wa_1409600907:tgl */
-				       PIPE_CONTROL_DEPTH_STALL |
-				       PIPE_CONTROL_DC_FLUSH_ENABLE |
-				       PIPE_CONTROL_FLUSH_ENABLE);
+				       flags);
 
 	return gen12_emit_fini_breadcrumb_tail(rq, cs);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 1c3af0fc0456..a3c1047a2c71 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -223,11 +223,14 @@
 #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29) /* gen11+ */
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28) /* gen11+ */
 #define   PIPE_CONTROL_FLUSH_L3				(1<<27)
+#define   PIPE_CONTROL_AMFS_FLUSH			(1<<25) /* gen12+ */
 #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24) /* gen7+ */
 #define   PIPE_CONTROL_MMIO_WRITE			(1<<23)
 #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
 #define   PIPE_CONTROL_CS_STALL				(1<<20)
+#define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
 #define   PIPE_CONTROL_TLB_INVALIDATE			(1<<18)
+#define   PIPE_CONTROL_PSD_SYNC				(1<<17) /* gen11+ */
 #define   PIPE_CONTROL_MEDIA_STATE_CLEAR		(1<<16)
 #define   PIPE_CONTROL_WRITE_TIMESTAMP			(3<<14)
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
@@ -249,6 +252,18 @@
 #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
 #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
 
+/* 3D-related flags can't be set on compute engine */
+#define PIPE_CONTROL_RENDER_ONLY_FLAGS (\
+		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
+		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
+		PIPE_CONTROL_TILE_CACHE_FLUSH | \
+		PIPE_CONTROL_DEPTH_STALL | \
+		PIPE_CONTROL_STALL_AT_SCOREBOARD | \
+		PIPE_CONTROL_PSD_SYNC | \
+		PIPE_CONTROL_AMFS_FLUSH | \
+		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
+		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
+
 #define MI_MATH(x)			MI_INSTR(0x1a, (x) - 1)
 #define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
 /* Opcodes for MI_MATH_INSTR */
-- 
2.25.4

