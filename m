Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA6A72722
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BCF10E790;
	Wed, 26 Mar 2025 23:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tlj4FsAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A5110E790;
 Wed, 26 Mar 2025 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032430; x=1774568430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wsY7/a57B+Q4orM/dKPI0qWfy0Ki0gfoCnRBLRVtxVM=;
 b=Tlj4FsAWUYP1eG5UG/3qhnzP5DbaHJN9Vf7R+25vMuCJgbDOuqy4K7iK
 0WfzwZsMsqqXfSdGY3Dqapqb7uVhklrbxNLSnmOFIAMSH8/ZH53tzH06B
 NQVKrq66OIGG2QIU9q1aArxiTY1rSwO+GFgUl4qyYtWEbtcpn4Xt+laN7
 u7H7MxMi/lB3D+r2nYGho8ei3f/10oeTbvbulhtQtsUmajh4Joy5dwsgw
 OSEmeGQFAeohgLLy3b5DDAsg2KJKdv6gFdQVn7xkbZ+9cIO1iJY6/4/ZU
 WNKBgEJ/Zzs4uhdTL62+YfB6qTW2iy4jGQM1VLbVB51rDDEg+7dtppfWW w==;
X-CSE-ConnectionGUID: JBRp/LO8QNaPMPdNG32XzQ==
X-CSE-MsgGUID: VvRiBhI7Q1Kf73zedErZBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61741389"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61741389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:30 -0700
X-CSE-ConnectionGUID: ysikK+AfR7yIts5VjGojZA==
X-CSE-MsgGUID: WrsXmiutQDWtQIG949dI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148143275"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:27 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 2/6] drm/i915/gt: Move CCS workaround to the correct section
Date: Thu, 27 Mar 2025 00:40:01 +0100
Message-ID: <20250326234005.1574688-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
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

The CCS engine workaround was previously added in a section
shared by both RCS and CCS engines.

Move it to the proper CCS-specific section so that it's applied
only once, avoiding unintended duplication caused by the first
CCS/RCS detection check.

To do this, the ccs_mode() function had to be moved earlier in
the file to avoid the need for a forward declaration.

Suggested-by: Arshad Mehmood <arshad.mehmood@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 58 +++++++++++----------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 116683ebe074..bedd88a15959 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2699,10 +2699,38 @@ xcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 				    XEHP_BLITTER_ROUND_ROBIN_MODE);
 }
 
+static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
+{
+	struct intel_gt *gt = engine->gt;
+	u32 mode;
+
+	/*
+	 * This workaround should be applied only once across all
+	 * CCS engines. Apply it to the first CCS encountered.
+	 */
+	if (!FIRST_CCS(engine))
+		return;
+
+	/*
+	 * Wa_14019159160: This workaround, along with others, leads to
+	 * significant challenges in utilizing load balancing among the
+	 * CCS slices. Consequently, an architectural decision has been
+	 * made to completely disable automatic CCS load balancing.
+	 */
+	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
+
+	/*
+	 * After having disabled automatic load balancing we need to
+	 * assign all slices to a single CCS. We will call it CCS mode 1
+	 */
+	mode = intel_gt_apply_ccs_mode(gt);
+	wa_masked_en(wal, XEHP_CCS_MODE, mode);
+}
+
 static void
 ccs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 {
-	/* boilerplate for any CCS engine workaround */
+	ccs_engine_wa_mode(engine, wal);
 }
 
 /*
@@ -2739,30 +2767,6 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
 		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
 }
 
-static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
-{
-	struct intel_gt *gt = engine->gt;
-	u32 mode;
-
-	if (!IS_DG2(gt->i915))
-		return;
-
-	/*
-	 * Wa_14019159160: This workaround, along with others, leads to
-	 * significant challenges in utilizing load balancing among the
-	 * CCS slices. Consequently, an architectural decision has been
-	 * made to completely disable automatic CCS load balancing.
-	 */
-	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
-
-	/*
-	 * After having disabled automatic load balancing we need to
-	 * assign all slices to a single CCS. We will call it CCS mode 1
-	 */
-	mode = intel_gt_apply_ccs_mode(gt);
-	wa_masked_en(wal, XEHP_CCS_MODE, mode);
-}
-
 /*
  * The workarounds in this function apply to shared registers in
  * the general render reset domain that aren't tied to a
@@ -2895,10 +2899,8 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
 	 * to a single RCS/CCS engine's workaround list since
 	 * they're reset as part of the general render domain reset.
 	 */
-	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
 		general_render_compute_wa_init(engine, wal);
-		ccs_engine_wa_mode(engine, wal);
-	}
 
 	if (engine->class == COMPUTE_CLASS)
 		ccs_engine_wa_init(engine, wal);
-- 
2.47.2

