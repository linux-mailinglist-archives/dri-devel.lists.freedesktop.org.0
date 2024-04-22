Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C915F8AD5DB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96DA10EE07;
	Mon, 22 Apr 2024 20:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5RHuB3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEA810EB5E;
 Mon, 22 Apr 2024 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713818038; x=1745354038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rHjb9dn/8s5k2vqqkRS8COycFlT+zzP7jHa4lafViak=;
 b=Q5RHuB3R/EJriX9ivas9dklzX1d8eGr5OuagGF89XV/BaoFFYufyVpCe
 OAn7GDjljPV10/6oRBVKEm/kO5kSE05iaOpRDrAtwZkO7LZHAcy5FYj/M
 dvqZ09Gyr8PbZzFNnIWmVPXAYKA98MVPBARGks0Dr1bbYv1q2JkmB2WIl
 LAKc+sPFc+do3GhiXqG724VZtLY4fP2SzO82vJ8k7GeYpXKeZ1ExG1gGl
 httTNVF4/1HEdYpHe+tn9Ufj68Sl7X0WpxOpAihnnia/A5UhacnePJlct
 XurpHcpxmO6CKbfpa5Yio6MUoqA65olD4tfw2O2NnlnIc5X24rmMpEQoZ w==;
X-CSE-ConnectionGUID: /cKx5N20Rcq1zwAU6vgVzg==
X-CSE-MsgGUID: BpvydWxeR6ictoR4zKI3/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20781594"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="20781594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:33:58 -0700
X-CSE-ConnectionGUID: sZpNf4E4RLG2cTdDm/WErg==
X-CSE-MsgGUID: 07NcmmcIR8qk5CeCku2CCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24191719"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:33:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH v2 1/2] drm/i915: Refactor confusing __intel_gt_reset()
Date: Mon, 22 Apr 2024 22:19:50 +0200
Message-ID: <20240422201951.633-1-nirmoy.das@intel.com>
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
the name might suggest something else. So add a helper function
to remove confusions with no functional changes.

v2: Move intel_gt_reset_all_engines() next to
    intel_gt_reset_engine() to make diff simple(John)

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         | 35 +++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.h         |  3 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  2 +-
 8 files changed, 37 insertions(+), 13 deletions(-)

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
index c8e9aa41fdea..b1393863ca9b 100644
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
@@ -978,7 +978,7 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 
 	/* Even if the GPU reset fails, it should still stop the engines */
 	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
-		__intel_gt_reset(gt, ALL_ENGINES);
+		intel_gt_reset_all_engines(gt);
 
 	for_each_engine(engine, gt, id)
 		engine->submit_request = nop_submit_request;
@@ -1089,7 +1089,7 @@ static bool __intel_gt_unset_wedged(struct intel_gt *gt)
 	/* We must reset pending GPU events before restoring our submission */
 	ok = !HAS_EXECLISTS(gt->i915); /* XXX better agnosticism desired */
 	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
-		ok = __intel_gt_reset(gt, ALL_ENGINES) == 0;
+		ok = intel_gt_reset_all_engines(gt) == 0;
 	if (!ok) {
 		/*
 		 * Warn CI about the unrecoverable wedged condition.
@@ -1133,10 +1133,10 @@ static int do_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
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
@@ -1270,7 +1270,30 @@ void intel_gt_reset(struct intel_gt *gt,
 	goto finish;
 }
 
-static int intel_gt_reset_engine(struct intel_engine_cs *engine)
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
 {
 	return __intel_gt_reset(engine->gt, engine->mask);
 }
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

