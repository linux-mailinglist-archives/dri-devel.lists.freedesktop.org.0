Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7B3D3078
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 01:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBF36F5CF;
	Thu, 22 Jul 2021 23:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B499E6F5BB;
 Thu, 22 Jul 2021 23:36:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="199037591"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="199037591"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="470860959"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/33] drm/i915/selftest: Fix workarounds selftest for GuC
 submission
Date: Thu, 22 Jul 2021 16:54:20 -0700
Message-Id: <20210722235426.31831-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210722235426.31831-1-matthew.brost@intel.com>
References: <20210722235426.31831-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: "Signed-off-by: Rahul Kumar Singh" <rahul.kumar.singh@intel.com>

When GuC submission is enabled, the GuC controls engine resets. Rather
than explicitly triggering a reset, the driver must submit a hanging
context to GuC and wait for the reset to occur.

Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 132 +++++++++++++-----
 .../i915/selftests/intel_scheduler_helpers.c  |  75 ++++++++++
 .../i915/selftests/intel_scheduler_helpers.h  |  27 ++++
 4 files changed, 200 insertions(+), 35 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 10b3bb6207ba..ab7679957623 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -280,6 +280,7 @@ i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
 i915-$(CONFIG_DRM_I915_SELFTEST) += \
 	gem/selftests/i915_gem_client_blt.o \
 	gem/selftests/igt_gem_utils.o \
+	selftests/intel_scheduler_helpers.o \
 	selftests/i915_random.o \
 	selftests/i915_selftest.o \
 	selftests/igt_atomic.o \
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 7a38ce40feb2..27bde7c28888 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -12,6 +12,7 @@
 #include "selftests/igt_flush_test.h"
 #include "selftests/igt_reset.h"
 #include "selftests/igt_spinner.h"
+#include "selftests/intel_scheduler_helpers.h"
 #include "selftests/mock_drm.h"
 
 #include "gem/selftests/igt_gem_utils.h"
@@ -261,28 +262,34 @@ static int do_engine_reset(struct intel_engine_cs *engine)
 	return intel_engine_reset(engine, "live_workarounds");
 }
 
+static int do_guc_reset(struct intel_engine_cs *engine)
+{
+	/* Currently a no-op as the reset is handled by GuC */
+	return 0;
+}
+
 static int
 switch_to_scratch_context(struct intel_engine_cs *engine,
-			  struct igt_spinner *spin)
+			  struct igt_spinner *spin,
+			  struct i915_request **rq)
 {
 	struct intel_context *ce;
-	struct i915_request *rq;
 	int err = 0;
 
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
 
-	rq = igt_spinner_create_request(spin, ce, MI_NOOP);
+	*rq = igt_spinner_create_request(spin, ce, MI_NOOP);
 	intel_context_put(ce);
 
-	if (IS_ERR(rq)) {
+	if (IS_ERR(*rq)) {
 		spin = NULL;
-		err = PTR_ERR(rq);
+		err = PTR_ERR(*rq);
 		goto err;
 	}
 
-	err = request_add_spin(rq, spin);
+	err = request_add_spin(*rq, spin);
 err:
 	if (err && spin)
 		igt_spinner_end(spin);
@@ -296,6 +303,7 @@ static int check_whitelist_across_reset(struct intel_engine_cs *engine,
 {
 	struct intel_context *ce, *tmp;
 	struct igt_spinner spin;
+	struct i915_request *rq;
 	intel_wakeref_t wakeref;
 	int err;
 
@@ -316,13 +324,24 @@ static int check_whitelist_across_reset(struct intel_engine_cs *engine,
 		goto out_spin;
 	}
 
-	err = switch_to_scratch_context(engine, &spin);
+	err = switch_to_scratch_context(engine, &spin, &rq);
 	if (err)
 		goto out_spin;
 
+	/* Ensure the spinner hasn't aborted */
+	if (i915_request_completed(rq)) {
+		pr_err("%s spinner failed to start\n", name);
+		err = -ETIMEDOUT;
+		goto out_spin;
+	}
+
 	with_intel_runtime_pm(engine->uncore->rpm, wakeref)
 		err = reset(engine);
 
+	/* Ensure the reset happens and kills the engine */
+	if (err == 0)
+		err = intel_selftest_wait_for_rq(rq);
+
 	igt_spinner_end(&spin);
 
 	if (err) {
@@ -787,9 +806,26 @@ static int live_reset_whitelist(void *arg)
 			continue;
 
 		if (intel_has_reset_engine(gt)) {
-			err = check_whitelist_across_reset(engine,
-							   do_engine_reset,
-							   "engine");
+			if (intel_engine_uses_guc(engine)) {
+				struct intel_selftest_saved_policy saved;
+				int err2;
+
+				err = intel_selftest_modify_policy(engine, &saved);
+				if (err)
+					goto out;
+
+				err = check_whitelist_across_reset(engine,
+								   do_guc_reset,
+								   "guc");
+
+				err2 = intel_selftest_restore_policy(engine, &saved);
+				if (err == 0)
+					err = err2;
+			} else
+				err = check_whitelist_across_reset(engine,
+								   do_engine_reset,
+								   "engine");
+
 			if (err)
 				goto out;
 		}
@@ -1235,31 +1271,40 @@ live_engine_reset_workarounds(void *arg)
 	reference_lists_init(gt, lists);
 
 	for_each_engine(engine, gt, id) {
+		struct intel_selftest_saved_policy saved;
+		bool using_guc = intel_engine_uses_guc(engine);
 		bool ok;
+		int ret2;
 
 		pr_info("Verifying after %s reset...\n", engine->name);
+		ret = intel_selftest_modify_policy(engine, &saved);
+		if (ret)
+			break;
+
+
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			break;
-		}
-
-		ok = verify_wa_lists(gt, lists, "before reset");
-		if (!ok) {
-			ret = -ESRCH;
-			goto err;
+			goto restore;
 		}
 
-		ret = intel_engine_reset(engine, "live_workarounds:idle");
-		if (ret) {
-			pr_err("%s: Reset failed while idle\n", engine->name);
-			goto err;
-		}
+		if (!using_guc) {
+			ok = verify_wa_lists(gt, lists, "before reset");
+			if (!ok) {
+				ret = -ESRCH;
+				goto err;
+			}
 
-		ok = verify_wa_lists(gt, lists, "after idle reset");
-		if (!ok) {
-			ret = -ESRCH;
-			goto err;
+			ret = intel_engine_reset(engine, "live_workarounds:idle");
+			if (ret) {
+				pr_err("%s: Reset failed while idle\n", engine->name);
+				goto err;
+			}
+			ok = verify_wa_lists(gt, lists, "after idle reset");
+			if (!ok) {
+				ret = -ESRCH;
+				goto err;
+			}
 		}
 
 		ret = igt_spinner_init(&spin, engine->gt);
@@ -1280,25 +1325,42 @@ live_engine_reset_workarounds(void *arg)
 			goto err;
 		}
 
-		ret = intel_engine_reset(engine, "live_workarounds:active");
-		if (ret) {
-			pr_err("%s: Reset failed on an active spinner\n",
-			       engine->name);
-			igt_spinner_fini(&spin);
-			goto err;
+		/* Ensure the spinner hasn't aborted */
+		if (i915_request_completed(rq)) {
+			ret = -ETIMEDOUT;
+			goto skip;
+		}
+
+		if (!using_guc) {
+			ret = intel_engine_reset(engine, "live_workarounds:active");
+			if (ret) {
+				pr_err("%s: Reset failed on an active spinner\n",
+				       engine->name);
+				igt_spinner_fini(&spin);
+				goto err;
+			}
 		}
 
+		/* Ensure the reset happens and kills the engine */
+		if (ret == 0)
+			ret = intel_selftest_wait_for_rq(rq);
+
+skip:
 		igt_spinner_end(&spin);
 		igt_spinner_fini(&spin);
 
 		ok = verify_wa_lists(gt, lists, "after busy reset");
-		if (!ok) {
+		if (!ok)
 			ret = -ESRCH;
-			goto err;
-		}
 
 err:
 		intel_context_put(ce);
+
+restore:
+		ret2 = intel_selftest_restore_policy(engine, &saved);
+		if (ret == 0)
+			ret = ret2;
+
 		if (ret)
 			break;
 	}
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
new file mode 100644
index 000000000000..5cdee1378e98
--- /dev/null
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+//#include "gt/intel_engine_user.h"
+#include "gt/intel_gt.h"
+#include "i915_drv.h"
+#include "i915_selftest.h"
+
+#include "selftests/intel_scheduler_helpers.h"
+
+#define REDUCED_TIMESLICE	5
+#define REDUCED_PREEMPT		10
+#define WAIT_FOR_RESET_TIME	1000
+
+int intel_selftest_modify_policy(struct intel_engine_cs *engine,
+				 struct intel_selftest_saved_policy *saved)
+
+{
+	int err;
+
+	saved->reset = engine->i915->params.reset;
+	saved->flags = engine->flags;
+	saved->timeslice = engine->props.timeslice_duration_ms;
+	saved->preempt_timeout = engine->props.preempt_timeout_ms;
+
+	/*
+	 * Enable force pre-emption on time slice expiration
+	 * together with engine reset on pre-emption timeout.
+	 * This is required to make the GuC notice and reset
+	 * the single hanging context.
+	 * Also, reduce the preemption timeout to something
+	 * small to speed the test up.
+	 */
+	engine->i915->params.reset = 2;
+	engine->flags |= I915_ENGINE_WANT_FORCED_PREEMPTION;
+	engine->props.timeslice_duration_ms = REDUCED_TIMESLICE;
+	engine->props.preempt_timeout_ms = REDUCED_PREEMPT;
+
+	if (!intel_engine_uses_guc(engine))
+		return 0;
+
+	err = intel_guc_global_policies_update(&engine->gt->uc.guc);
+	if (err)
+		intel_selftest_restore_policy(engine, saved);
+
+	return err;
+}
+
+int intel_selftest_restore_policy(struct intel_engine_cs *engine,
+				  struct intel_selftest_saved_policy *saved)
+{
+	/* Restore the original policies */
+	engine->i915->params.reset = saved->reset;
+	engine->flags = saved->flags;
+	engine->props.timeslice_duration_ms = saved->timeslice;
+	engine->props.preempt_timeout_ms = saved->preempt_timeout;
+
+	if (!intel_engine_uses_guc(engine))
+		return 0;
+
+	return intel_guc_global_policies_update(&engine->gt->uc.guc);
+}
+
+int intel_selftest_wait_for_rq(struct i915_request *rq)
+{
+	long ret;
+
+	ret = i915_request_wait(rq, 0, WAIT_FOR_RESET_TIME);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
new file mode 100644
index 000000000000..79605b14bc33
--- /dev/null
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _INTEL_SELFTEST_SCHEDULER_HELPERS_H_
+#define _INTEL_SELFTEST_SCHEDULER_HELPERS_H_
+
+#include <linux/types.h>
+
+struct i915_request;
+struct intel_engine_cs;
+
+struct intel_selftest_saved_policy {
+	u32 flags;
+	u32 reset;
+	u64 timeslice;
+	u64 preempt_timeout;
+};
+
+int intel_selftest_modify_policy(struct intel_engine_cs *engine,
+				 struct intel_selftest_saved_policy *saved);
+int intel_selftest_restore_policy(struct intel_engine_cs *engine,
+				  struct intel_selftest_saved_policy *saved);
+int intel_selftest_wait_for_rq(struct i915_request *rq);
+
+#endif
-- 
2.28.0

