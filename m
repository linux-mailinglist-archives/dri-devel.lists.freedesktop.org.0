Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610768CEAC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 06:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D5010E449;
	Tue,  7 Feb 2023 05:07:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB52010E2E2;
 Tue,  7 Feb 2023 05:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675746428; x=1707282428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O1gBr07DKuhzaazyb6prpoOfk5mVZL8FdW6O3iGDXFA=;
 b=FpPr2AvQpB3PdTZTB4IWFFnBcFgHuk16RxiubdnBtVlBmjRhvOWQJOK7
 xM4KQPXwQBdsBMRVs3bELXYdeTagVuSQRBCs0PakeCmSSm2vPhx5vog4h
 cEiSsdefAkPzlF6qGzGoaOCPqjNw0BATyvjdEVgctrnyYYtxeAB3UFgdS
 194CUZCjPvHE++Vclarp27jB/gTcm7ufXdFC0vzu6b0mVyimc0G83mx5b
 9e7PTUy2FSjUomJiCxJsiE6sWG4xKdYpVb/MYWEx5msHKZ5i0R8gPnbFw
 BzWAmCEqr1LgM0ZQ8BJt/OoO3yM3lMT+rhd+q+TOywEkp/B6Sasspip8x w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309049942"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="309049942"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 21:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840631506"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="840631506"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 21:07:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 4/6] drm/i915/guc: More debug print updates - GuC selftests
Date: Mon,  6 Feb 2023 21:07:15 -0800
Message-Id: <20230207050717.1833718-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
References: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Type: text/plain; charset=UTF-8
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

Update a bunch more debug prints to use the new GT based scheme.

v2: Also change prints to use %pe for error values (MichalW).
Fix a context leak on error due to a -- being too early.
Use the correct header file for the debug macros.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 42 ++++++++++---------
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 23 +++++-----
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 11 ++---
 3 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index e28518fe8b908..1fd760539f77b 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -3,6 +3,8 @@
  * Copyright �� 2021 Intel Corporation
  */
 
+#include "gt/intel_gt_print.h"
+#include "intel_guc_print.h"
 #include "selftests/igt_spinner.h"
 #include "selftests/intel_scheduler_helpers.h"
 
@@ -65,7 +67,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
+			gt_err(gt, "Failed to create context %d: %pe\n", i, ce);
 			goto err;
 		}
 
@@ -86,7 +88,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 
 		if (IS_ERR(rq)) {
 			ret = PTR_ERR(rq);
-			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
+			gt_err(gt, "Failed to create request %d: %pe\n", i, rq);
 			goto err;
 		}
 
@@ -96,7 +98,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	for (i = 0; i < 3; ++i) {
 		ret = i915_request_wait(last[i], 0, HZ);
 		if (ret < 0) {
-			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
+			gt_err(gt, "Last request failed to complete: %pe\n", ERR_PTR(ret));
 			goto err;
 		}
 		i915_request_put(last[i]);
@@ -113,7 +115,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	/* GT will not idle if G2H are lost */
 	ret = intel_gt_wait_for_idle(gt, HZ);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+		gt_err(gt, "GT failed to idle: %pe\n", ERR_PTR(ret));
 		goto err;
 	}
 
@@ -153,7 +155,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 
 	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
 	if (!ce) {
-		drm_err(&gt->i915->drm, "Context array allocation failed\n");
+		guc_err(guc, "Context array allocation failed\n");
 		return -ENOMEM;
 	}
 
@@ -166,25 +168,25 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ce[context_index] = intel_context_create(engine);
 	if (IS_ERR(ce[context_index])) {
 		ret = PTR_ERR(ce[context_index]);
+		guc_err(guc, "Failed to create context: %pe\n", ce[context_index]);
 		ce[context_index] = NULL;
-		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
 		goto err_wakeref;
 	}
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
+		guc_err(guc, "Failed to create spinner: %pe\n", ERR_PTR(ret));
 		goto err_contexts;
 	}
 	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
 					     MI_ARB_CHECK);
 	if (IS_ERR(spin_rq)) {
 		ret = PTR_ERR(spin_rq);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		guc_err(guc, "Failed to create spinner request: %pe\n", spin_rq);
 		goto err_contexts;
 	}
 	ret = request_add_spin(spin_rq, &spin);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
+		guc_err(guc, "Failed to add Spinner request: %pe\n", ERR_PTR(ret));
 		goto err_spin_rq;
 	}
 
@@ -192,9 +194,9 @@ static int intel_guc_steal_guc_ids(void *arg)
 	while (ret != -EAGAIN) {
 		ce[++context_index] = intel_context_create(engine);
 		if (IS_ERR(ce[context_index])) {
-			ret = PTR_ERR(ce[context_index--]);
-			ce[context_index] = NULL;
-			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
+			ret = PTR_ERR(ce[context_index]);
+			guc_err(guc, "Failed to create context: %pe\n", ce[context_index]);
+			ce[context_index--] = NULL;
 			goto err_spin_rq;
 		}
 
@@ -203,8 +205,8 @@ static int intel_guc_steal_guc_ids(void *arg)
 			ret = PTR_ERR(rq);
 			rq = NULL;
 			if (ret != -EAGAIN) {
-				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
-					context_index, ret);
+				guc_err(guc, "Failed to create request %d: %pe\n",
+					context_index, ERR_PTR(ret));
 				goto err_spin_rq;
 			}
 		} else {
@@ -218,7 +220,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	igt_spinner_end(&spin);
 	ret = intel_selftest_wait_for_rq(spin_rq);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
+		guc_err(guc, "Spin request failed to complete: %pe\n", ERR_PTR(ret));
 		i915_request_put(last);
 		goto err_spin_rq;
 	}
@@ -230,7 +232,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(last, 0, HZ * 30);
 	i915_request_put(last);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
+		guc_err(guc, "Last request failed to complete: %pe\n", ERR_PTR(ret));
 		goto err_spin_rq;
 	}
 
@@ -238,7 +240,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	rq = nop_user_request(ce[context_index], NULL);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
+		guc_err(guc, "Failed to steal guc_id %d: %pe\n", context_index, rq);
 		goto err_spin_rq;
 	}
 
@@ -246,20 +248,20 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(rq, 0, HZ);
 	i915_request_put(rq);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
+		guc_err(guc, "Request with stolen guc_id failed to complete: %pe\n", ERR_PTR(ret));
 		goto err_spin_rq;
 	}
 
 	/* Wait for idle */
 	ret = intel_gt_wait_for_idle(gt, HZ * 30);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+		guc_err(guc, "GT failed to idle: %pe\n", ERR_PTR(ret));
 		goto err_spin_rq;
 	}
 
 	/* Verify a guc_id was stolen */
 	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
-		drm_err(&gt->i915->drm, "No guc_id was stolen");
+		guc_err(guc, "No guc_id was stolen");
 		ret = -EINVAL;
 	} else {
 		ret = 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
index d91b58f704039..34b5d952e2bcb 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
@@ -3,6 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include "gt/intel_gt_print.h"
 #include "selftests/igt_spinner.h"
 #include "selftests/igt_reset.h"
 #include "selftests/intel_scheduler_helpers.h"
@@ -45,7 +46,7 @@ static int intel_hang_guc(void *arg)
 
 	ctx = kernel_context(gt->i915, NULL);
 	if (IS_ERR(ctx)) {
-		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
+		gt_err(gt, "Failed get kernel context: %pe\n", ctx);
 		return PTR_ERR(ctx);
 	}
 
@@ -54,7 +55,7 @@ static int intel_hang_guc(void *arg)
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce)) {
 		ret = PTR_ERR(ce);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		gt_err(gt, "Failed to create spinner request: %pe\n", ce);
 		goto err;
 	}
 
@@ -63,13 +64,13 @@ static int intel_hang_guc(void *arg)
 	old_beat = engine->props.heartbeat_interval_ms;
 	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
+		gt_err(gt, "Failed to boost heatbeat interval: %pe\n", ERR_PTR(ret));
 		goto err;
 	}
 
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
+		gt_err(gt, "Failed to create spinner: %pe\n", ERR_PTR(ret));
 		goto err;
 	}
 
@@ -77,28 +78,28 @@ static int intel_hang_guc(void *arg)
 	intel_context_put(ce);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		gt_err(gt, "Failed to create spinner request: %pe\n", rq);
 		goto err_spin;
 	}
 
 	ret = request_add_spin(rq, &spin);
 	if (ret) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
+		gt_err(gt, "Failed to add Spinner request: %pe\n", ERR_PTR(ret));
 		goto err_spin;
 	}
 
 	ret = intel_reset_guc(gt);
 	if (ret) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "Failed to reset GuC, ret = %d\n", ret);
+		gt_err(gt, "Failed to reset GuC: %pe\n", ERR_PTR(ret));
 		goto err_spin;
 	}
 
 	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "GuC failed to reset: status = 0x%08X\n", guc_status);
+		gt_err(gt, "Failed to reset GuC: status = 0x%08X\n", guc_status);
 		ret = -EIO;
 		goto err_spin;
 	}
@@ -107,12 +108,12 @@ static int intel_hang_guc(void *arg)
 	ret = intel_selftest_wait_for_rq(rq);
 	i915_request_put(rq);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Request failed to complete: %d\n", ret);
+		gt_err(gt, "Request failed to complete: %pe\n", ERR_PTR(ret));
 		goto err_spin;
 	}
 
 	if (i915_reset_count(global) == reset_count) {
-		drm_err(&gt->i915->drm, "Failed to record a GPU reset\n");
+		gt_err(gt, "Failed to record a GPU reset\n");
 		ret = -EINVAL;
 		goto err_spin;
 	}
@@ -132,7 +133,7 @@ static int intel_hang_guc(void *arg)
 		ret = intel_selftest_wait_for_rq(rq);
 		i915_request_put(rq);
 		if (ret) {
-			drm_err(&gt->i915->drm, "No-op failed to complete: %d\n", ret);
+			gt_err(gt, "No-op failed to complete: %pe\n", ERR_PTR(ret));
 			goto err;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index d17982c36d256..a40e7c32e6137 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -3,6 +3,7 @@
  * Copyright �� 2019 Intel Corporation
  */
 
+#include "gt/intel_gt_print.h"
 #include "selftests/igt_spinner.h"
 #include "selftests/igt_reset.h"
 #include "selftests/intel_scheduler_helpers.h"
@@ -115,30 +116,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
 
 	parent = multi_lrc_create_parent(gt, class, 0);
 	if (IS_ERR(parent)) {
-		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
+		gt_err(gt, "Failed creating contexts: %pe\n", parent);
 		return PTR_ERR(parent);
 	} else if (!parent) {
-		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
+		gt_dbg(gt, "Not enough engines in class: %d\n", class);
 		return 0;
 	}
 
 	rq = multi_lrc_nop_request(parent);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
+		gt_err(gt, "Failed creating requests: %pe\n", rq);
 		goto out;
 	}
 
 	ret = intel_selftest_wait_for_rq(rq);
 	if (ret)
-		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
+		gt_err(gt, "Failed waiting on request: %pe\n", ERR_PTR(ret));
 
 	i915_request_put(rq);
 
 	if (ret >= 0) {
 		ret = intel_gt_wait_for_idle(gt, HZ * 5);
 		if (ret < 0)
-			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+			gt_err(gt, "GT failed to idle: %pe\n", ERR_PTR(ret));
 	}
 
 out:
-- 
2.39.1

