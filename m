Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4268B2DD7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 02:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB3010F1CB;
	Fri, 26 Apr 2024 00:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rk7VDV3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FE110F1CB;
 Fri, 26 Apr 2024 00:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714090065; x=1745626065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XtSlt0teFWDksW/dP9m8HCNwWZgKnucmsYyYs43Q4EM=;
 b=Rk7VDV3t0X/mhAihfhCxqOGUNxlrCEAfJ5ykyfETaTfxiLgRAb4sCheT
 PeL9Q2h8dUrlR9jErrkffSmyMsi/jEhlH61011otXLxjMxtOT+riyWecc
 E/i7gc2Gpd7weuasmbMD1yLQhVjcqCIGXcPIxw5iiiteSbIiRZndBKak5
 eqyQtrUgHmJKPNOalny0r3jvwobVp3yfOct+2DAHN6CGEbZ60If6k8Sji
 BJYGoN9kvF9Ek99mTDZ8gGUoPvrS5Ie7unYv0wPKYmhK3RZwZcKri1CqC
 TrlZjmeh2KHO7k/QeHnZwsKP7uzEgCTt73tI9fzYxAy5LYgVIt9/JsvER A==;
X-CSE-ConnectionGUID: gx6oUw1LRBK2x2LNOy3xrA==
X-CSE-MsgGUID: 7p2Qb9g1S72gdaQOothkYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9667710"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9667710"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 17:07:45 -0700
X-CSE-ConnectionGUID: L2vEjMhKRgOsP9LQnA6dhw==
X-CSE-MsgGUID: IjGUGYI0Th+akFO0osIOWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56187921"
Received: from unknown (HELO intel.com) ([10.247.119.93])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 17:07:39 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Gnattu OC <gnattuoc@me.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Automate CCS Mode setting during engine resets
Date: Fri, 26 Apr 2024 02:07:23 +0200
Message-ID: <20240426000723.229296-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

We missed setting the CCS mode during resume and engine resets.
Create a workaround to be added in the engine's workaround list.
This workaround sets the XEHP_CCS_MODE value at every reset.

The issue can be reproduced by running:

  $ clpeak --kernel-latency

Without resetting the CCS mode, we encounter a fence timeout:

  Fence expiration time out i915-0000:03:00.0:clpeak[2387]:2!

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10895
Fixes: 6db31251bb26 ("drm/i915/gt: Enable only one CCS for compute workload")
Reported-by: Gnattu OC <gnattuoc@me.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
Hi Gnattu,

thanks again for reporting this issue and for your prompt
replies on the issue. Would you give this patch a chance?

Andi

 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 6 +++---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 044219c5960a..99b71bb7da0a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -8,14 +8,14 @@
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_regs.h"
 
-void intel_gt_apply_ccs_mode(struct intel_gt *gt)
+unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
 	int cslice;
 	u32 mode = 0;
 	int first_ccs = __ffs(CCS_MASK(gt));
 
 	if (!IS_DG2(gt->i915))
-		return;
+		return 0;
 
 	/* Build the value for the fixed CCS load balancing */
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
@@ -35,5 +35,5 @@ void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 						     XEHP_CCS_MODE_CSLICE_MASK);
 	}
 
-	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
+	return mode;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 9e5549caeb26..55547f2ff426 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -8,6 +8,6 @@
 
 struct intel_gt;
 
-void intel_gt_apply_ccs_mode(struct intel_gt *gt);
+unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt);
 
 #endif /* __INTEL_GT_CCS_MODE_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 68b6aa11bcf7..58693923bf6c 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2703,6 +2703,7 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
 static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 {
 	struct intel_gt *gt = engine->gt;
+	u32 mode;
 
 	if (!IS_DG2(gt->i915))
 		return;
@@ -2719,7 +2720,8 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
 	 * After having disabled automatic load balancing we need to
 	 * assign all slices to a single CCS. We will call it CCS mode 1
 	 */
-	intel_gt_apply_ccs_mode(gt);
+	mode = intel_gt_apply_ccs_mode(gt);
+	wa_masked_en(wal, XEHP_CCS_MODE, mode);
 }
 
 /*
-- 
2.43.0

