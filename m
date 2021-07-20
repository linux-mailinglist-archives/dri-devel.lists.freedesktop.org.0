Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A52D3D0318
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307D26E5CE;
	Tue, 20 Jul 2021 20:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378D56E50C;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885376"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885376"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906087"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 28/42] drm/i915/guc: Add basic GuC multi-lrc selftest
Date: Tue, 20 Jul 2021 13:57:48 -0700
Message-Id: <20210720205802.39610-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

Add very basic (single submission) multi-lrc selftest.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   1 +
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 168 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 326cb4fc8a9d..dde6aab1db85 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4737,4 +4737,5 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_guc_flow_control.c"
+#include "selftest_guc_multi_lrc.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
new file mode 100644
index 000000000000..226e64fee919
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright �� 2019 Intel Corporation
+ */
+
+#include "selftests/igt_spinner.h"
+#include "selftests/igt_reset.h"
+#include "selftests/intel_scheduler_helpers.h"
+#include "gt/intel_engine_heartbeat.h"
+#include "gem/selftests/mock_context.h"
+
+static void logical_sort(struct intel_engine_cs **engines, int num_engines)
+{
+	struct intel_engine_cs *sorted[MAX_ENGINE_INSTANCE + 1];
+	int i, j;
+
+	for (i = 0; i < num_engines; ++i)
+		for (j = 0; j < MAX_ENGINE_INSTANCE + 1; ++j) {
+			if (engines[j]->logical_mask & BIT(i)) {
+				sorted[i] = engines[j];
+				break;
+			}
+		}
+
+	memcpy(*engines, *sorted,
+	       sizeof(struct intel_engine_cs *) * num_engines);
+}
+
+static struct intel_context *
+multi_lrc_create_parent(struct intel_gt *gt, u8 class,
+			unsigned long flags)
+{
+	struct intel_engine_cs *siblings[MAX_ENGINE_INSTANCE + 1];
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	int i = 0;
+
+	for_each_engine(engine, gt, id) {
+		if (engine->class != class)
+			continue;
+
+		siblings[i++] = engine;
+	}
+
+	if (i <= 1)
+		return ERR_PTR(0);
+
+	logical_sort(siblings, i);
+
+	return intel_engine_create_parallel(siblings, 1, i);
+}
+
+static void multi_lrc_context_put(struct intel_context *ce)
+{
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	/*
+	 * Only the parent gets the creation ref put in the uAPI, the parent
+	 * itself is responsible for creation ref put on the children.
+	 */
+	intel_context_put(ce);
+}
+
+static struct i915_request *
+multi_lrc_nop_request(struct intel_context *ce)
+{
+	struct intel_context *child;
+	struct i915_request *rq, *child_rq;
+	int i = 0;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	rq = intel_context_create_request(ce);
+	if (IS_ERR(rq))
+		return rq;
+
+	i915_request_get(rq);
+	i915_request_add(rq);
+
+	for_each_child(ce, child) {
+		child_rq = intel_context_create_request(child);
+		if (IS_ERR(child_rq))
+			goto child_error;
+
+		if (++i == ce->guc_number_children)
+			set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
+				&child_rq->fence.flags);
+		i915_request_add(child_rq);
+	}
+
+	return rq;
+
+child_error:
+	i915_request_put(rq);
+
+	return ERR_PTR(-ENOMEM);
+}
+
+static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
+{
+	struct intel_context *parent;
+	struct i915_request *rq;
+	int ret;
+
+	parent = multi_lrc_create_parent(gt, class, 0);
+	if (IS_ERR(parent)) {
+		pr_err("Failed creating contexts: %ld", PTR_ERR(parent));
+		return PTR_ERR(parent);
+	} else if (parent == NULL) {
+		pr_debug("Not enough engines in class: %d",
+			 VIDEO_DECODE_CLASS);
+		return 0;
+	}
+
+	rq = multi_lrc_nop_request(parent);
+	if (IS_ERR(rq)) {
+		ret = PTR_ERR(rq);
+		pr_err("Failed creating requests: %d", ret);
+		goto out;
+	}
+
+	ret = intel_selftest_wait_for_rq(rq);
+	if (ret)
+		pr_err("Failed waiting on request: %d", ret);
+
+	i915_request_put(rq);
+
+	if (ret >= 0) {
+		ret = intel_gt_wait_for_idle(gt, HZ * 5);
+		if (ret < 0)
+			pr_err("GT failed to idle: %d\n", ret);
+	}
+
+out:
+	multi_lrc_context_put(parent);
+	return ret;
+}
+
+static int intel_guc_multi_lrc_basic(void *arg)
+{
+	struct intel_gt *gt = arg;
+	unsigned class;
+	int ret;
+
+	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
+		ret = __intel_guc_multi_lrc_basic(gt, class);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int intel_guc_multi_lrc(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(intel_guc_multi_lrc_basic),
+	};
+	struct intel_gt *gt = &i915->gt;
+
+	if (intel_gt_is_wedged(gt))
+		return 0;
+
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		return 0;
+
+	return intel_gt_live_subtests(tests, gt);
+}
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index d9bd732b741a..2ddb72bbab69 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -48,5 +48,6 @@ selftest(execlists, intel_execlists_live_selftests)
 selftest(ring_submission, intel_ring_submission_live_selftests)
 selftest(perf, i915_perf_live_selftests)
 selftest(guc_flow_control, intel_guc_flow_control)
+selftest(guc_multi_lrc, intel_guc_multi_lrc)
 /* Here be dragons: keep last to run last! */
 selftest(late_gt_pm, intel_gt_pm_late_selftests)
-- 
2.28.0

