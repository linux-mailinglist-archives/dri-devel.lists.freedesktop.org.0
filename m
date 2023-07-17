Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC486756A9B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C35A10E297;
	Mon, 17 Jul 2023 17:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD7810E291;
 Mon, 17 Jul 2023 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689615101; x=1721151101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qAWW7j1OgrjTJTJNRLOSpVTPxJGfFE1/Aa99WtV5SfY=;
 b=cyzNsthaPCMUkr9x0iGhcj5+xwQzUgEpqsz9SfKOSdh2ZedKaU1Tts1b
 UGJIioaSxu+KnY0EH+lqTe/PNzhnX8RHdXKA9K+SAOkA01OqTxb6FqwsS
 Wm6wOHyX+t7CxL9IAFP8f+v5ntVve6LJuTgqnw4fuL8bZhrmWTO1hCKcI
 HRCuK1UL5DqSRwPsNeDMBtL8Dc5XrOfA/7BS6YXMLj5sG5kzeyJ+0Inpo
 fuMAOGkuCBcXKFU4c7c4lWqQYELBbz5nuxoQzIVSakpLO9ZA/D71thl0t
 T0m//yuYztRl8uD1mGtkixMZsVjyuoE4VPaOjseqfrfGsK4FMtM+rolGw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350855578"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="350855578"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813427659"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="813427659"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:31:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 5/6] drm/i915/gt: Poll aux invalidation register bit on
 invalidation
Date: Mon, 17 Jul 2023 19:30:58 +0200
Message-Id: <20230717173059.422892-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717173059.422892-1-andi.shyti@linux.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

For platforms that use Aux CCS, wait for aux invalidation to
complete by checking the aux invalidation register bit is
cleared.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 17 +++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index aa2fb9d72745a..fbc70f3b7f2fd 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -174,6 +174,16 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
 	*cs++ = AUX_INV;
 	*cs++ = MI_NOOP;
 
+	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
+		MI_SEMAPHORE_REGISTER_POLL |
+		MI_SEMAPHORE_POLL |
+		MI_SEMAPHORE_SAD_EQ_SDD;
+	*cs++ = 0;
+	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
+	*cs++ = 0;
+	*cs++ = 0;
+	*cs++ = MI_NOOP;
+
 	return cs;
 }
 
@@ -284,10 +294,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine->class == COMPUTE_CLASS)
 			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
+		count = 8;
 		if (!HAS_FLAT_CCS(rq->engine->i915))
-			count = 8 + 4;
-		else
-			count = 8;
+			count += 10;
 
 		cs = intel_ring_begin(rq, count);
 		if (IS_ERR(cs))
@@ -330,7 +339,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 			aux_inv = rq->engine->mask &
 				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
 			if (aux_inv)
-				cmd += 4;
+				cmd += 10;
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 5df7cce23197c..2bd8d98d21102 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -121,6 +121,7 @@
 #define   MI_SEMAPHORE_TARGET(engine)	((engine)<<15)
 #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
 #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
+#define   MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
 #define   MI_SEMAPHORE_POLL		(1 << 15)
 #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
 #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
-- 
2.40.1

