Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC736E7B6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86636EDBE;
	Thu, 29 Apr 2021 09:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452EB6EDC0;
 Thu, 29 Apr 2021 09:13:05 +0000 (UTC)
IronPort-SDR: i9b2sI3pzTkGOUVNGBBASnSQPsnKvFOqd6FFOXRUAOmmfY9f6of7yaFsYAARbewMCVGuoKGumT
 2GsmTyMn53Gg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011306"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011306"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:05 -0700
IronPort-SDR: BKA7WUSvQGJ53JBgwMVTk18CVYXVZwExU/vBLAqSOBD2aHk8XiBF5TsqB1E33JrTL6EtreiVyK
 1gxcjf7gFG/w==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298807"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Add a separate low-level helper for masked
 workarounds
Date: Thu, 29 Apr 2021 10:12:51 +0100
Message-Id: <20210429091254.855248-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We distinguish masked registers from other workarounds by the mask (clr)
being zero for the former.

To avoid callers of the low-level wa_add having to know that, and be
passing this zero explicitly, add a wa_masked_add low-level helper
which embeds this knowledge.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 56 +++++++++++++--------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 62cb9ee5bfc3..a7abf9ca78ec 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -162,6 +162,18 @@ static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
 	_wa_add(wal, &wa);
 }
 
+static void wa_masked_add(struct i915_wa_list *wal, i915_reg_t reg,
+			  u32 set, u32 read_mask)
+{
+	struct i915_wa wa = {
+		.reg  = reg,
+		.set  = set,
+		.read = read_mask,
+	};
+
+	_wa_add(wal, &wa);
+}
+
 static void
 wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
 {
@@ -200,20 +212,20 @@ wa_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
 static void
 wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 {
-	wa_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val);
+	wa_masked_add(wal, reg, _MASKED_BIT_ENABLE(val), val);
 }
 
 static void
 wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 {
-	wa_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val);
+	wa_masked_add(wal, reg, _MASKED_BIT_DISABLE(val), val);
 }
 
 static void
 wa_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
 		    u32 mask, u32 val)
 {
-	wa_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask);
+	wa_masked_add(wal, reg, _MASKED_FIELD(mask, val), mask);
 }
 
 static void gen6_ctx_workarounds_init(struct intel_engine_cs *engine,
@@ -836,10 +848,10 @@ hsw_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	/* L3 caching of data atomics doesn't work -- disable it. */
 	wa_write(wal, HSW_SCRATCH1, HSW_SCRATCH1_L3_DATA_ATOMICS_DISABLE);
 
-	wa_add(wal,
-	       HSW_ROW_CHICKEN3, 0,
-	       _MASKED_BIT_ENABLE(HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE),
-		0 /* XXX does this reg exist? */);
+	wa_masked_add(wal,
+		      HSW_ROW_CHICKEN3,
+		      _MASKED_BIT_ENABLE(HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE),
+		      0 /* XXX does this reg exist? */);
 
 	/* WaVSRefCountFullforceMissDisable:hsw */
 	wa_write_clr(wal, GEN7_FF_THREAD_MODE, GEN7_FF_VS_REF_CNT_FFME);
@@ -1947,10 +1959,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * disable bit, which we don't touch here, but it's good
 		 * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
 		 */
-		wa_add(wal, GEN7_GT_MODE, 0,
-		       _MASKED_FIELD(GEN6_WIZ_HASHING_MASK,
-				     GEN6_WIZ_HASHING_16x4),
-		       GEN6_WIZ_HASHING_16x4);
+		wa_masked_field_set(wal,
+				    GEN7_GT_MODE,
+				    GEN6_WIZ_HASHING_MASK,
+				    GEN6_WIZ_HASHING_16x4);
 	}
 
 	if (IS_GEN_RANGE(i915, 6, 7))
@@ -2000,10 +2012,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * disable bit, which we don't touch here, but it's good
 		 * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
 		 */
-		wa_add(wal,
-		       GEN6_GT_MODE, 0,
-		       _MASKED_FIELD(GEN6_WIZ_HASHING_MASK, GEN6_WIZ_HASHING_16x4),
-		       GEN6_WIZ_HASHING_16x4);
+		wa_masked_field_set(wal,
+				    GEN6_GT_MODE,
+				    GEN6_WIZ_HASHING_MASK,
+				    GEN6_WIZ_HASHING_16x4);
 
 		/* WaDisable_RenderCache_OperationalFlush:snb */
 		wa_masked_dis(wal, CACHE_MODE_0, RC_OP_FLUSH_ENABLE);
@@ -2021,10 +2033,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 	if (IS_GEN_RANGE(i915, 4, 6))
 		/* WaTimedSingleVertexDispatch:cl,bw,ctg,elk,ilk,snb */
-		wa_add(wal, MI_MODE,
-		       0, _MASKED_BIT_ENABLE(VS_TIMER_DISPATCH),
-		       /* XXX bit doesn't stick on Broadwater */
-		       IS_I965G(i915) ? 0 : VS_TIMER_DISPATCH);
+		wa_masked_add(wal, MI_MODE,
+			      _MASKED_BIT_ENABLE(VS_TIMER_DISPATCH),
+			      /* XXX bit doesn't stick on Broadwater */
+			      IS_I965G(i915) ? 0 : VS_TIMER_DISPATCH);
 
 	if (IS_GEN(i915, 4))
 		/*
@@ -2037,9 +2049,9 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * they are already accustomed to from before contexts were
 		 * enabled.
 		 */
-		wa_add(wal, ECOSKPD,
-		       0, _MASKED_BIT_ENABLE(ECO_CONSTANT_BUFFER_SR_DISABLE),
-		       0 /* XXX bit doesn't stick on Broadwater */);
+		wa_masked_add(wal, ECOSKPD,
+			      _MASKED_BIT_ENABLE(ECO_CONSTANT_BUFFER_SR_DISABLE),
+			      0 /* XXX bit doesn't stick on Broadwater */);
 }
 
 static void
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
