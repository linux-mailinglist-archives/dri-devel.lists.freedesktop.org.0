Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07614C990C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7448310E834;
	Tue,  1 Mar 2022 23:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D3410E7C9;
 Tue,  1 Mar 2022 23:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176588; x=1677712588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YbKx22zm13jkVO1ZNxThtOBNOFC5CyopZiKo4abnBmg=;
 b=HcaONuCmAGtxq07ArmbYq+egp5BQffe2Zdi3QGHOOYQrWNPlLLa1S6WN
 eF/1OjHovdOi1r6pf6LfTIJRXszBr3tCU6VQDb0jTb6+2XogD7RxwAHiY
 J8Vya1xF4X7/Z9BI6ngypY73aixM0jT4kx/67pGWglyyfr2AEeYzspxYy
 UDpTYRhclgTjCGBYzNMGj6bRFzofvmZCTWi6vb3FRKIUvOmxFc0KhPYeh
 ME12KIbGzjKBs3OrLDEkPHvkCqoranvvoLhkHpAiQtDWdP9lANX6DuPez
 SmmyJHcU6UhG9wYcs+vy/qPMND29a39pChNX+mhFQAPlZE+MDN2pkNA4h A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479055"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253460"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 04/13] drm/i915/xehp: compute engine pipe_control
Date: Tue,  1 Mar 2022 15:15:40 -0800
Message-Id: <20220301231549.1817978-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

CCS will reuse the RCS functions for breadcrumb and flush emission.
However, CCS pipe_control has additional programming restrictions:
 - Command Streamer Stall Enable must be always set
 - Post Sync Operations must not be set to Write PS Depth Count
 - 3D-related bits must not be set

v2:
 - Drop unwanted blank line.  (Lucas)

Bspec: 47112
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 34 ++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 15 +++++++++
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 1f8cf4f790b2..b1b9c3fd7bf9 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -201,6 +201,8 @@ static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
 
 int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
+	struct intel_engine_cs *engine = rq->engine;
+
 	if (mode & EMIT_FLUSH) {
 		u32 flags = 0;
 		u32 *cs;
@@ -219,6 +221,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
+		if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_3D_FLAGS;
+
 		cs = intel_ring_begin(rq, 6);
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
@@ -246,6 +251,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
+		if (engine->class == COMPUTE_CLASS)
+			flags &= ~PIPE_CONTROL_3D_FLAGS;
+
 		cs = intel_ring_begin(rq, 8 + 4);
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
@@ -618,19 +626,27 @@ u32 *gen12_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs)
 
 u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 {
+	struct drm_i915_private *i915 = rq->engine->i915;
+	u32 flags = (PIPE_CONTROL_CS_STALL |
+		     PIPE_CONTROL_TILE_CACHE_FLUSH |
+		     PIPE_CONTROL_FLUSH_L3 |
+		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
+		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
+		     PIPE_CONTROL_DC_FLUSH_ENABLE |
+		     PIPE_CONTROL_FLUSH_ENABLE);
+
+	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+		/* Wa_1409600907 */
+		flags |= PIPE_CONTROL_DEPTH_STALL;
+
+	if (rq->engine->class == COMPUTE_CLASS)
+		flags &= ~PIPE_CONTROL_3D_FLAGS;
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
index f8253012d166..d112ffd56418 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -228,11 +228,14 @@
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
@@ -254,6 +257,18 @@
 #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
 #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
 
+/* 3D-related flags can't be set on compute engine */
+#define PIPE_CONTROL_3D_FLAGS (\
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
2.34.1

