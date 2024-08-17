Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77559559B4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454FB10E0F4;
	Sat, 17 Aug 2024 21:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWpxTU9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CCC10E0F0;
 Sat, 17 Aug 2024 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928457; x=1755464457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s9cPQTojqszj+XOenc3Whuv3c+51r8FcL6ydwiO+u0k=;
 b=VWpxTU9AC+CXWVu3aGBTF3xmIRL5slFMQqsyftfB4R8rvtD/BrUXtlwJ
 8TkNPfyGD1PaCv/gYvqN9vVbxqsKs2mJxbAwigbWjUTy1YzgqKOkqvqoC
 FS6owfzJrs9KGKBvkvOuzKsJLvDfSTI7BYIy+UOYy8jVeN+CDb0dzHFrg
 rXqhwlL5ASJ9trXeXFP99osNa7Y46wbbQKrjb4Aa7kVSPb0/xCJBT/mva
 C9/r2mo9ARCRb5Hij7kAseZ7XZ0mfHFv3a2zsX+Fe5naTigbG2ULtXnOn
 y4I/MPAoKhudEY6etkE/mPGnP48UU9zQUxrsSCHQd1/wEztqjyGSLfL5Q Q==;
X-CSE-ConnectionGUID: maAlE068Q6WXkEj4U8qMVQ==
X-CSE-MsgGUID: D3Q0zLrbR3SOEjwV0MNEww==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44725424"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="44725424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:00:57 -0700
X-CSE-ConnectionGUID: jCNR9VbpQfKDSuxD8Hg0Zw==
X-CSE-MsgGUID: P9UQnbDOQLqD29z+O2wPTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="59635929"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:00:54 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 02/11] drm/i915/gt: Allow the creation of multi-mode
 CCS masks
Date: Sat, 17 Aug 2024 23:00:17 +0200
Message-ID: <20240817210026.310645-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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

Until now, we have only set CCS mode balancing to 1, which means
that only one compute engine is exposed to the user. The stream
of compute commands submitted to that engine is then shared among
all the dedicated execution units.

This is done by calling the 'intel_gt_apply_ccs_mode(); function.

With this change, the aforementioned function takes an additional
parameter called 'mode' that specifies the desired mode to be set
for the CCS engines balancing. The mode parameter can have the
following values:

 - mode = 0: CCS load balancing mode 1 (1 CCS engine exposed)
 - mode = 1: CCS load balancing mode 2 (2 CCS engines exposed)
 - mode = 3: CCS load balancing mode 4 (4 CCS engines exposed)

This allows us to generate the appropriate register value to be
written to CCS_MODE, configuring how the exposed engine streams
will be submitted to the execution units.

No functional changes are intended yet, as no mode higher than
'0' is currently being set.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 78 ++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  2 +-
 3 files changed, 65 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 19e0bc359861..6afd44ffc358 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -4,37 +4,83 @@
  */
 
 #include "i915_drv.h"
-#include "intel_gt.h"
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_regs.h"
 
-void intel_gt_apply_ccs_mode(struct intel_gt *gt)
+void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
 {
+	unsigned long cslices_mask = gt->ccs.cslices;
+	u32 mode_val = 0;
+	u32 m = mode;
+	int ccs_id;
 	int cslice;
-	u32 mode = 0;
-	int first_ccs = __ffs(CCS_MASK(gt));
 
 	lockdep_assert_held(&gt->ccs.mutex);
 
 	if (!IS_DG2(gt->i915))
 		return;
 
-	/* Build the value for the fixed CCS load balancing */
-	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
-		if (gt->ccs.cslices & BIT(cslice))
-			/*
-			 * If available, assign the cslice
-			 * to the first available engine...
-			 */
-			mode |= XEHP_CCS_MODE_CSLICE(cslice, first_ccs);
+	/*
+	 * The mode has two bit dedicated for each engine
+	 * that will be used for the CCS balancing algorithm:
+	 *
+	 *    BIT | CCS slice
+	 *   ------------------
+	 *     0  | CCS slice
+	 *     1  |     0
+	 *   ------------------
+	 *     2  | CCS slice
+	 *     3  |     1
+	 *   ------------------
+	 *     4  | CCS slice
+	 *     5  |     2
+	 *   ------------------
+	 *     6  | CCS slice
+	 *     7  |     3
+	 *   ------------------
+	 *
+	 * When a CCS slice is not available, then we will write 0x7,
+	 * oterwise we will write the user engine id which load will
+	 * be forwarded to that slice.
+	 *
+	 * The possible configurations are:
+	 *
+	 * 1 engine (ccs0):
+	 *   slice 0, 1, 2, 3: ccs0
+	 *
+	 * 2 engines (ccs0, ccs1):
+	 *   slice 0, 2: ccs0
+	 *   slice 1, 3: ccs1
+	 *
+	 * 4 engines (ccs0, ccs1, ccs2, ccs3):
+	 *   slice 0: ccs0
+	 *   slice 1: ccs1
+	 *   slice 2: ccs2
+	 *   slice 3: ccs3
+	 */
+	ccs_id = __ffs(cslices_mask);
 
-		else
+	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
+		if (!(cslices_mask & BIT(cslice))) {
 			/*
-			 * ... otherwise, mark the cslice as
-			 * unavailable if no CCS dispatches here
+			 * If not available, mark the slice as unavailable
+			 * and no task will be dispatched here.
 			 */
-			mode |= XEHP_CCS_MODE_CSLICE(cslice,
+			mode_val |= XEHP_CCS_MODE_CSLICE(cslice,
 						     XEHP_CCS_MODE_CSLICE_MASK);
+			continue;
+		}
+
+		mode_val |= XEHP_CCS_MODE_CSLICE(cslice, ccs_id);
+
+		if (!m) {
+			m = mode;
+			ccs_id = __ffs(cslices_mask);
+			continue;
+		}
+
+		m--;
+		ccs_id = find_next_bit(&cslices_mask, I915_MAX_CCS, ccs_id + 1);
 	}
 
 	gt->ccs.mode_reg_val = mode;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index e646ab595ded..0e1c43ea1d54 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -6,9 +6,9 @@
 #ifndef __INTEL_GT_CCS_MODE_H__
 #define __INTEL_GT_CCS_MODE_H__
 
-struct intel_gt;
+#include "intel_gt.h"
 
-void intel_gt_apply_ccs_mode(struct intel_gt *gt);
+void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode);
 void intel_gt_ccs_mode_init(struct intel_gt *gt);
 
 #endif /* __INTEL_GT_CCS_MODE_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index daa11e11d68f..203f2bb00e30 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2744,7 +2744,7 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
 	 * assign all slices to a single CCS. We will call it CCS mode 1
 	 */
 	mutex_lock(&gt->ccs.mutex);
-	intel_gt_apply_ccs_mode(gt);
+	intel_gt_apply_ccs_mode(gt, 0);
 	wa_masked_en(wal, XEHP_CCS_MODE, gt->ccs.mode_reg_val);
 	mutex_unlock(&gt->ccs.mutex);
 }
-- 
2.45.2

