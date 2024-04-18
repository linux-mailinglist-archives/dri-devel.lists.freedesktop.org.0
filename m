Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B78AA102
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 19:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC264113E4A;
	Thu, 18 Apr 2024 17:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIbg1GZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334EE113E49;
 Thu, 18 Apr 2024 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713461098; x=1744997098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NzulTEbpYhzMpFTXlJcvih1nCohXnoYCUt+j0mfdPsM=;
 b=dIbg1GZmmUi+VDvzeKTu+jAcwmbS5qPsHpCNFehtdlX/J/7JaxbVTMuk
 01KEQSQkEwmZwgtI/WPqSdpDWAh8zde7BLdN8MaYQSzDKrAW23Cug7BfO
 0G0It5bk/OifZKIfyf1mjGhUKai2+yGlybMqZIU6ucNRQ5LZAVI82vyPd
 B/2oRRUKgdFVxpWpf7z6a4dmTbTDM2yM93fDmhSCzyawj2TWp0w7WNFSo
 CXzKNVI0x6uFl0/KVZjsqir0lgH0yb/S041pERut+kSPPWusH7oG2fk0l
 VIt53KIc9dqL4xl5UAk7LoPNw48srCO54+jEL9xOr1YjYHccz0s2Qizkk w==;
X-CSE-ConnectionGUID: lBDWLPUwSQCvGdFvzoZ6WQ==
X-CSE-MsgGUID: Knq+D79/QKSPvBMvzvW5NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34424184"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="34424184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 10:24:57 -0700
X-CSE-ConnectionGUID: 0Ca4RiXNSV2T+TsxGQbyvA==
X-CSE-MsgGUID: DEZlZcehQX+jSMK6N/lIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27881192"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 10:24:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 1/3] drm/i915: Refactor confusing __intel_gt_reset()
Date: Thu, 18 Apr 2024 19:10:53 +0200
Message-ID: <20240418171055.31371-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

__intel_gt_reset() is really for resetting engines though
the name might suggest something else. So add two helper functions
to remove confusions with no functional changes.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         | 43 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_reset.h         |  3 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  2 +-
 8 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 8c44af1c3451..5c8e9ee3b008 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -678,7 +678,7 @@ void intel_engines_release(struct intel_gt *gt)
 	 */
 	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
 	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
-		__intel_gt_reset(gt, ALL_ENGINES);
+		intel_gt_reset_all_engines(gt);
 
 	/* Decouple the backend; but keep the layout for late GPU resets */
 	for_each_engine(engine, gt, id) {
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 355aab5b38ba..21829439e686 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2898,7 +2898,7 @@ static void enable_error_interrupt(struct intel_engine_cs *engine)
 		drm_err(&engine->i915->drm,
 			"engine '%s' resumed still in error: %08x\n",
 			engine->name, status);
-		__intel_gt_reset(engine->gt, engine->mask);
+		intel_gt_reset_engine(engine);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 580b5141ce1e..626b166e67ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -832,7 +832,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 
 	/* Scrub all HW state upon release */
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		__intel_gt_reset(gt, ALL_ENGINES);
+		intel_gt_reset_all_engines(gt);
 }
 
 void intel_gt_driver_release(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 220ac4f92edf..c08fdb65cc69 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -159,7 +159,7 @@ static bool reset_engines(struct intel_gt *gt)
 	if (INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
 		return false;
 
-	return __intel_gt_reset(gt, ALL_ENGINES) == 0;
+	return intel_gt_reset_all_engines(gt) == 0;
 }
 
 static void gt_sanitize(struct intel_gt *gt, bool force)
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index c8e9aa41fdea..b825daace58e 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -764,7 +764,7 @@ wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 			 HECI_H_GS1_ER_PREP, 0);
 }
 
-int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
+static int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 {
 	const int retries = engine_mask == ALL_ENGINES ? RESET_MAX_RETRIES : 1;
 	reset_func reset;
@@ -795,6 +795,34 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 	return ret;
 }
 
+/**
+ * intel_gt_reset_all_engines() - Reset all engines in the given gt.
+ * @gt: the GT to reset all engines for.
+ *
+ * This function resets all engines within the given gt.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int intel_gt_reset_all_engines(struct intel_gt *gt)
+{
+	return __intel_gt_reset(gt, ALL_ENGINES);
+}
+
+/**
+ * intel_gt_reset_engine() - Reset a specific engine within a gt.
+ * @engine: engine to be reset.
+ *
+ * This function resets the specified engine within a gt.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int intel_gt_reset_engine(struct intel_engine_cs *engine)
+{
+	return __intel_gt_reset(engine->gt, engine->mask);
+}
+
 bool intel_has_gpu_reset(const struct intel_gt *gt)
 {
 	if (!gt->i915->params.reset)
@@ -978,7 +1006,7 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 
 	/* Even if the GPU reset fails, it should still stop the engines */
 	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
-		__intel_gt_reset(gt, ALL_ENGINES);
+		intel_gt_reset_all_engines(gt);
 
 	for_each_engine(engine, gt, id)
 		engine->submit_request = nop_submit_request;
@@ -1089,7 +1117,7 @@ static bool __intel_gt_unset_wedged(struct intel_gt *gt)
 	/* We must reset pending GPU events before restoring our submission */
 	ok = !HAS_EXECLISTS(gt->i915); /* XXX better agnosticism desired */
 	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
-		ok = __intel_gt_reset(gt, ALL_ENGINES) == 0;
+		ok = intel_gt_reset_all_engines(gt) == 0;
 	if (!ok) {
 		/*
 		 * Warn CI about the unrecoverable wedged condition.
@@ -1133,10 +1161,10 @@ static int do_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
 {
 	int err, i;
 
-	err = __intel_gt_reset(gt, ALL_ENGINES);
+	err = intel_gt_reset_all_engines(gt);
 	for (i = 0; err && i < RESET_MAX_RETRIES; i++) {
 		msleep(10 * (i + 1));
-		err = __intel_gt_reset(gt, ALL_ENGINES);
+		err = intel_gt_reset_all_engines(gt);
 	}
 	if (err)
 		return err;
@@ -1270,11 +1298,6 @@ void intel_gt_reset(struct intel_gt *gt,
 	goto finish;
 }
 
-static int intel_gt_reset_engine(struct intel_engine_cs *engine)
-{
-	return __intel_gt_reset(engine->gt, engine->mask);
-}
-
 int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
 {
 	struct intel_gt *gt = engine->gt;
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index f615b30b81c5..c00de353075c 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -54,7 +54,8 @@ int intel_gt_terminally_wedged(struct intel_gt *gt);
 void intel_gt_set_wedged_on_init(struct intel_gt *gt);
 void intel_gt_set_wedged_on_fini(struct intel_gt *gt);
 
-int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask);
+int intel_gt_reset_engine(struct intel_engine_cs *engine);
+int intel_gt_reset_all_engines(struct intel_gt *gt);
 
 int intel_reset_guc(struct intel_gt *gt);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index f40de408cd3a..2cfc23c58e90 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -281,7 +281,7 @@ static int igt_atomic_reset(void *arg)
 		awake = reset_prepare(gt);
 		p->critical_section_begin();
 
-		err = __intel_gt_reset(gt, ALL_ENGINES);
+		err = intel_gt_reset_all_engines(gt);
 
 		p->critical_section_end();
 		reset_finish(gt, awake);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 4b9233c07a22..622a24305bc2 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -202,7 +202,7 @@ static void sanitize_gpu(struct drm_i915_private *i915)
 		unsigned int i;
 
 		for_each_gt(gt, i915, i)
-			__intel_gt_reset(gt, ALL_ENGINES);
+			intel_gt_reset_all_engines(gt);
 	}
 }
 
-- 
2.42.0

