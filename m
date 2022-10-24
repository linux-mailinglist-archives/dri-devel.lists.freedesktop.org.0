Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F560BDF5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 00:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0B10E05E;
	Mon, 24 Oct 2022 22:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E16210E05E;
 Mon, 24 Oct 2022 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666652125; x=1698188125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1A3eKDsU3LhgqsTueV17cTFF9fwFU5tkguGLGKLnlKQ=;
 b=AdzQc4x1hBa5mCtMOcX3MkHLKLrvgLKY5xK1MjzES9SAba7soq9GqUw1
 nSEV3JPzm9LYMqzP48EPuW8GhJBD3zS2byafI3ZLlMU2e6uh1R8BcRyfp
 N4AEeh6d7QGQ4FyYGv9+P0KW2rGlg/Dbhy5MRLOoggGsY2Mor+VzEMHq3
 jUWCXv8VKWZXaqmBC6l3S65GDptpETDIgVMXZzFcniGcox7co+9ga6MNn
 kHsxWCkWXit965JjRggfUvURi6J6OMyGuNrKcJpYrz/KLI9SdjC65O4On
 O4d63+WqQpZYRM8PVDTP1+nF7UBGltMBHf2WRAbGcknViOH61wmSR8hS4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="307532215"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="307532215"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 15:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609362912"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="609362912"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 24 Oct 2022 15:55:23 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/slpc: Use platform limits for min/max frequency
Date: Mon, 24 Oct 2022 15:54:53 -0700
Message-Id: <20221024225453.4856-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC will set the min/max frequencies to theoretical max on
ATS-M. This will break kernel ABI, so limit min/max frequency
to RP0(platform max) instead.

Also modify the SLPC selftest to update the min frequency
when we have a server part so that we can iterate between
platform min and max.

v2: Check softlimits instead of platform limits (Riana)
v3: More review comments (Ashutosh)
v4: No need to use saved_min_freq and other comments (Ashutosh)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7030

Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c       | 20 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 37 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  2 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
 4 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index 4c6e9257e593..82ec95a299f6 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -239,6 +239,11 @@ static int run_test(struct intel_gt *gt, int test_type)
 	if (!intel_uc_uses_guc_slpc(&gt->uc))
 		return 0;
 
+	if (slpc->min_freq == slpc->rp0_freq) {
+		pr_err("Min/Max are fused to the same value\n");
+		return -EINVAL;
+	}
+
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
@@ -253,17 +258,14 @@ static int run_test(struct intel_gt *gt, int test_type)
 	}
 
 	/*
-	 * FIXME: With efficient frequency enabled, GuC can request
-	 * frequencies higher than the SLPC max. While this is fixed
-	 * in GuC, we level set these tests with RPn as min.
+	 * Set min frequency to RPn so that we can test the whole
+	 * range of RPn-RP0. This also turns off efficient freq
+	 * usage and makes results more predictable.
 	 */
 	err = slpc_set_min_freq(slpc, slpc->min_freq);
-	if (err)
+	if (err) {
+		pr_err("Unable to update min freq!");
 		return err;
-
-	if (slpc->min_freq == slpc->rp0_freq) {
-		pr_err("Min/Max are fused to the same value\n");
-		return -EINVAL;
 	}
 
 	intel_gt_pm_wait_for_idle(gt);
@@ -330,7 +332,7 @@ static int run_test(struct intel_gt *gt, int test_type)
 				engine->name, max_act_freq);
 
 			/* Actual frequency should rise above min */
-			if (max_act_freq <= slpc_min_freq) {
+			if (max_act_freq <= slpc->min_freq) {
 				pr_err("Actual freq did not rise above min\n");
 				pr_err("Perf Limit Reasons: 0x%x\n",
 				       intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS));
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index fdd895f73f9f..c7e568af1e9c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	slpc->max_freq_softlimit = 0;
 	slpc->min_freq_softlimit = 0;
+	slpc->min_is_rpmax = false;
 
 	slpc->boost_freq = 0;
 	atomic_set(&slpc->num_waiters, 0);
@@ -588,6 +589,39 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	int slpc_min_freq;
+	int ret;
+
+	ret = intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq);
+	if (ret) {
+		drm_err(&i915->drm,
+			"Failed to get min freq: (%d)\n",
+			ret);
+		return false;
+	}
+
+	if (slpc_min_freq == SLPC_MAX_FREQ_MHZ)
+		return true;
+	else
+		return false;
+}
+
+static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
+{
+	/* For server parts, SLPC min will be at RPMax.
+	 * Use min softlimit to clamp it to RP0 instead.
+	 */
+	if (!slpc->min_freq_softlimit &&
+	    is_slpc_min_freq_rpmax(slpc)) {
+		slpc->min_is_rpmax = true;
+		slpc->min_freq_softlimit = slpc->rp0_freq;
+		(slpc_to_gt(slpc))->defaults.min_freq = slpc->min_freq_softlimit;
+	}
+}
+
 static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
 {
 	/* Force SLPC to used platform rp0 */
@@ -647,6 +681,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	slpc_get_rp_values(slpc);
 
+	/* Handle the case where min=max=RPmax */
+	update_server_min_softlimit(slpc);
+
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 82a98f78f96c..11975a31c9d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -9,6 +9,8 @@
 #include "intel_guc_submission.h"
 #include "intel_guc_slpc_types.h"
 
+#define SLPC_MAX_FREQ_MHZ 4250
+
 struct intel_gt;
 struct drm_printer;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index 73d208123528..a6ef53b04e04 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -19,6 +19,9 @@ struct intel_guc_slpc {
 	bool supported;
 	bool selected;
 
+	/* Indicates this is a server part */
+	bool min_is_rpmax;
+
 	/* platform frequency limits */
 	u32 min_freq;
 	u32 rp0_freq;
-- 
2.35.1

