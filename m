Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB4757DDF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D19310E355;
	Tue, 18 Jul 2023 13:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C27110E355;
 Tue, 18 Jul 2023 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689687591; x=1721223591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iBl7/qWoRE+NLs24Sz9Qx0Wvc3Mx5AHj2Xqwb1mwaKc=;
 b=LDMrqC/Nudqn5ZiFjBiAH4wlre3HRGeBUTSzQaX3vI8xB19kZ78gkztt
 appJ5QRL7iVUz8dZeqL0nTEwF1x6fi1s6GlAG0EaD66/4vvyJI7AilirL
 S5cUO8AN8KQjDfaawphk/SNigoniCn4DBlSwmCimYaPTvZ9n4Am5v2uZY
 X91BIu1jkpxssMknnVHKJ0gcnW1X9wSQHRlFTZeNO/yB6toZquJg+N5jr
 w4aHrEg2+Mt/hkgiqeo0vVx8GaPTDqTZi9QTX7u/v7T6zSPtUBL6KEMJ7
 eHK1Sxy0S2pSzSXb4ABZcboIbeHTzlDKlbhNZjZS8JyKIe0Frb897iIiq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345800290"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="345800290"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847706321"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="847706321"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:39:46 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Date: Tue, 18 Jul 2023 15:38:34 +0200
Message-Id: <20230718133836.574781-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230718133836.574781-1-andi.shyti@linux.intel.com>
References: <20230718133836.574781-1-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit af9e423a8aae ("drm/i915/gt: Ensure memory quiesced before
invalidation") has made sure that the memory is quiesced before
invalidating the AUX CCS table. Do it for all the other engines
and not just RCS.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 71 +++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 2 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 3275e55b18d90..2f40cd515cc78 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -225,6 +225,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 
+		/*
+		 * When required, in MTL+ platforms we need to
+		 * set the CCS_FLUSH bit in the pipe control
+		 */
+		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
+			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
+
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
 		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
@@ -309,20 +316,64 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 {
 	intel_engine_mask_t aux_inv = 0;
-	u32 cmd, *cs;
+	u32 cmd = 4;
+	u32 *cs;
 
-	cmd = 4;
-	if (mode & EMIT_INVALIDATE) {
+	if (mode & EMIT_INVALIDATE)
 		cmd += 2;
 
-		if (HAS_AUX_CCS(rq->engine->i915) &&
-		    (rq->engine->class == VIDEO_DECODE_CLASS ||
-		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq->engine->mask &
-				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
-			if (aux_inv)
-				cmd += 4;
+	if (HAS_AUX_CCS(rq->engine->i915))
+		aux_inv = rq->engine->mask &
+			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
+
+	/*
+	 * Aux invalidations on Aux CCS platforms require
+	 * memory traffic is quiesced prior.
+	 */
+	if (aux_inv) {
+		u32 bit_group_0 = 0;
+		u32 bit_group_1 = 0;
+
+		cmd += 4;
+
+		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+
+		switch (rq->engine->class) {
+		case VIDEO_DECODE_CLASS:
+			bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
+			bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
+			bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
+			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
+			bit_group_1 |= PIPE_CONTROL_CS_STALL;
+
+			/*
+			 * When required, in MTL+ platforms we need to
+			 * set the CCS_FLUSH bit in the pipe control
+			 */
+			if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
+				bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
+
+			break;
+
+		case VIDEO_ENHANCEMENT_CLASS:
+		case COMPUTE_CLASS:
+			bit_group_1 |= MI_FLUSH_DW;
+
+			break;
+
+		case COPY_ENGINE_CLASS:
+			/*
+			 * When required, in MTL+ platforms we need to
+			 * set the CCS_FLUSH bit in the pipe control
+			 */
+			if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
+				bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
+			break;
 		}
+
+		if (bit_group_1 || bit_group_0)
+			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
+						   LRC_PPHWSP_SCRATCH_ADDR);
 	}
 
 	cs = intel_ring_begin(rq, cmd);
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 5d143e2a8db03..5df7cce23197c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -299,6 +299,7 @@
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
 #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
+#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
 #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
 #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
 #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
-- 
2.40.1

