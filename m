Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20447E31C3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7852110E46B;
	Mon,  6 Nov 2023 23:59:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C05E10E467;
 Mon,  6 Nov 2023 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699315148; x=1730851148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKixas2mR9aepgmG63a1N+R64rh7ErCLJToCcVTHYuU=;
 b=fPCwP5iWqIdAXNhdL07kLWeJwludPmAz94icq3uKBP9WKDfe5rHo84CF
 EiQ52tD8mwWtYuT0LIVxO6i8Fi820z1EoUKCaBbl7mu0YWY65ZSeSDEgF
 Y/xg5oUKP8fjyRBLRFpZQfT0Neax5kM24/Z7ltQ0E/C+Q1qpy+SFrgKMI
 sRiKNWJUBDWKc9YlEtTVR49Udsf394G23Cn7jfoKQUdkJaMRF9WKWVuFz
 K0YMQfF7wSQnajb/7tFQ2VPjm4R2/rvGyTIRTrbOfHhor5u50cZPDoxOk
 uFVpwOO4d/PeYDBAXr5YwP4/tANRVfIV7eGM9Nj8a7yx8oxUAPTFmCmcX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="455871439"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="455871439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 15:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3789323"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 15:59:06 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Add a selftest for FAST_REQUEST errors
Date: Mon,  6 Nov 2023 15:59:28 -0800
Message-ID: <20231106235929.454983-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106235929.454983-1-John.C.Harrison@Intel.com>
References: <20231106235929.454983-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There is a mechanism for reporting errors from fire and forget H2G
messages. This is the only way to find out about almost any error in
the GuC backend submission path. So it would be useful to know that it
is working.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |   9 ++
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 122 ++++++++++++++++++++++
 3 files changed, 135 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 2b6dfe62c8f2a..e22c12ce245ad 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -297,6 +297,10 @@ struct intel_guc {
 	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
 	 */
 	int number_guc_id_stolen;
+	/**
+	 * @fast_response_selftest: Backdoor to CT handler for fast response selftest
+	 */
+	u32 fast_response_selftest;
 #endif
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 89e314b3756bb..9d958afb78b7f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1076,6 +1076,15 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		found = true;
 		break;
 	}
+
+#ifdef CONFIG_DRM_I915_SELFTEST
+	if (!found && ct_to_guc(ct)->fast_response_selftest) {
+		CT_DEBUG(ct, "Assuming unsolicited response due to FAST_REQUEST selftest\n");
+		ct_to_guc(ct)->fast_response_selftest++;
+		found = 1;
+	}
+#endif
+
 	if (!found) {
 		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
 			 len, hxg[0], fence, ct->requests.last_fence);
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index bfb72143566f6..97fbbb396336c 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -286,11 +286,133 @@ static int intel_guc_steal_guc_ids(void *arg)
 	return ret;
 }
 
+/*
+ * Send a context schedule H2G message with an invalid context id.
+ * This should generate a GUC_RESULT_INVALID_CONTEXT response.
+ */
+static int bad_h2g(struct intel_guc *guc)
+{
+	u32 action[3], len = 0;
+
+	action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
+	action[len++] = 0x12345678;
+
+	return intel_guc_send_nb(guc, action, len, 0);
+}
+
+/*
+ * Set a spinner running to make sure the system is alive and active,
+ * then send a bad but asynchronous H2G command and wait to see if an
+ * error response is returned. If no response is received or if the
+ * spinner dies then the test will fail.
+ */
+#define FAST_RESPONSE_TIMEOUT_MS	1000
+static int intel_guc_fast_request(void *arg)
+{
+	struct intel_gt *gt = arg;
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine = intel_selftest_find_any_engine(gt);
+	ktime_t before, now, delta;
+	bool spinning = false;
+	u64 delta_ms;
+	int ret = 0;
+
+	if (!engine)
+		return 0;
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		ret = PTR_ERR(ce);
+		gt_err(gt, "Failed to create spinner request: %pe\n", ce);
+		goto err_pm;
+	}
+
+	ret = igt_spinner_init(&spin, engine->gt);
+	if (ret) {
+		gt_err(gt, "Failed to create spinner: %pe\n", ERR_PTR(ret));
+		goto err_pm;
+	}
+	spinning = true;
+
+	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	intel_context_put(ce);
+	if (IS_ERR(rq)) {
+		ret = PTR_ERR(rq);
+		gt_err(gt, "Failed to create spinner request: %pe\n", rq);
+		goto err_spin;
+	}
+
+	ret = request_add_spin(rq, &spin);
+	if (ret) {
+		gt_err(gt, "Failed to add Spinner request: %pe\n", ERR_PTR(ret));
+		goto err_rq;
+	}
+
+	gt->uc.guc.fast_response_selftest = 1;
+
+	ret = bad_h2g(&gt->uc.guc);
+	if (ret) {
+		gt_err(gt, "Failed to send H2G: %pe\n", ERR_PTR(ret));
+		goto err_rq;
+	}
+
+	before = ktime_get();
+	while (gt->uc.guc.fast_response_selftest == 1) {
+		ret = i915_request_wait(rq, 0, 1);
+		if (ret != -ETIME) {
+			gt_err(gt, "Request wait failed: %pe\n", ERR_PTR(ret));
+			goto err_rq;
+		}
+		now = ktime_get();
+		delta = ktime_sub(now, before);
+		delta_ms = ktime_to_ms(delta);
+
+		if (delta_ms > FAST_RESPONSE_TIMEOUT_MS) {
+			gt_err(gt, "Timed out waiting for fast request error!\n");
+			ret = -ETIME;
+			goto err_rq;
+		}
+	}
+
+	if (gt->uc.guc.fast_response_selftest != 2) {
+		gt_err(gt, "Unexpected fast response count: %d\n",
+		       gt->uc.guc.fast_response_selftest);
+		goto err_rq;
+	}
+
+	igt_spinner_end(&spin);
+	spinning = false;
+
+	ret = intel_selftest_wait_for_rq(rq);
+	if (ret) {
+		gt_err(gt, "Request failed to complete: %pe\n", ERR_PTR(ret));
+		goto err_rq;
+	}
+
+err_rq:
+	i915_request_put(rq);
+
+err_spin:
+	if (spinning)
+		igt_spinner_end(&spin);
+	igt_spinner_fini(&spin);
+
+err_pm:
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
+	return ret;
+}
+
 int intel_guc_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(intel_guc_scrub_ctbs),
 		SUBTEST(intel_guc_steal_guc_ids),
+		SUBTEST(intel_guc_fast_request),
 	};
 	struct intel_gt *gt = to_gt(i915);
 
-- 
2.41.0

