Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB3A48BB58
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 00:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68C710E66B;
	Tue, 11 Jan 2022 23:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F5810E5FB;
 Tue, 11 Jan 2022 23:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641943023; x=1673479023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1dDPvrZ6UE/Z4bGG55p7FvZibVuQbOM5PYaM1afWfvA=;
 b=j2kYryUX97qoiNCNdoBSsDHYxbpZprEoogEEhoZlfWchU3DwchQ4AdOM
 xEfxVYMLeVgwdEKGT/Dn4zE7VV+YszxdAXgC3eczwKJiD3fGBbVKeWBVk
 14lf+LEetpP+i0Y9ni3YugV3rBm5cXycTPqZ+bmx3cq6UIFdSSFo6RSCP
 rsux+2es2Q9g+n3UZCmyqSdZjudyau75yKsUYWaj2yWDPbYz9GGMhlNjt
 Dru1bhFxgiAb1iwD8rJQTNpK4OwmF75hC5yj+hx74r6LgLRN3cCWgCjaM
 5Gk9yW+2QMqUmv6segai5spCMq02FrZ52RURAEYyJpPO6rdc6sTcJIuHL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="230950978"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="230950978"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 15:17:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="613375821"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 15:17:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915/selftests: Add a cancel request selftest that
 triggers a reset
Date: Tue, 11 Jan 2022 15:11:08 -0800
Message-Id: <20220111231109.23244-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111231109.23244-1-matthew.brost@intel.com>
References: <20220111231109.23244-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a cancel request selftest that results in an engine reset to cancel
the request as it is non-preemptable. Also insert a NOP request after
the cancelled request and confirm that it completes successfully.

v2:
 (Tvrtko)
  - Skip test if preemption timeout compiled out
  - Skip test if engine reset isn't supported
  - Update debug prints to be more descriptive
v3:
  - Add comment explaining test

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 7f66f6d299b26..f78de99d5ae1e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -782,6 +782,115 @@ static int __cancel_completed(struct intel_engine_cs *engine)
 	return err;
 }
 
+/*
+ * Test to prove a non-preemptable request can be cancelled and a subsequent
+ * request on the same context can successfully complete after cancallation.
+ *
+ * Testing methodology is to create non-preemptable request and submit it,
+ * wait for spinner to start, create a NOP request and submit it, cancel the
+ * spinner, wait for spinner to complete and verify it failed with an error,
+ * finally wait for NOP request to complete verify it succeeded without an
+ * error. Preemption timeout also reduced / restored so test runs in a timely
+ * maner.
+ */
+static int __cancel_reset(struct drm_i915_private *i915,
+			  struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq, *nop;
+	unsigned long preempt_timeout_ms;
+	int err = 0;
+
+	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT ||
+	    !intel_has_reset_engine(engine->gt))
+		return 0;
+
+	preempt_timeout_ms = engine->props.preempt_timeout_ms;
+	engine->props.preempt_timeout_ms = 100;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		goto out_restore;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_ce;
+	}
+
+	pr_debug("%s: Cancelling active non-preemptable request\n",
+		 engine->name);
+	i915_request_get(rq);
+	i915_request_add(rq);
+	if (!igt_wait_for_spinner(&spin, rq)) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("Failed to start spinner on %s\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_rq;
+	}
+
+	nop = intel_context_create_request(ce);
+	if (IS_ERR(nop))
+		goto out_nop;
+	i915_request_get(nop);
+	i915_request_add(nop);
+
+	i915_request_cancel(rq, -EINTR);
+
+	if (i915_request_wait(rq, 0, HZ) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to cancel hung request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_nop;
+	}
+
+	if (rq->fence.error != -EINTR) {
+		pr_err("%s: fence not cancelled (%u)\n",
+		       engine->name, rq->fence.error);
+		err = -EINVAL;
+		goto out_nop;
+	}
+
+	if (i915_request_wait(nop, 0, HZ) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to complete nop request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_nop;
+	}
+
+	if (nop->fence.error != 0) {
+		pr_err("%s: Nop request errored (%u)\n",
+		       engine->name, nop->fence.error);
+		err = -EINVAL;
+	}
+
+out_nop:
+	i915_request_put(nop);
+out_rq:
+	i915_request_put(rq);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+out_restore:
+	engine->props.preempt_timeout_ms = preempt_timeout_ms;
+	if (err)
+		pr_err("%s: %s error %d\n", __func__, engine->name, err);
+	return err;
+}
+
 static int live_cancel_request(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -814,6 +923,14 @@ static int live_cancel_request(void *arg)
 			return err;
 		if (err2)
 			return err2;
+
+		/* Expects reset so call outside of igt_live_test_* */
+		err = __cancel_reset(i915, engine);
+		if (err)
+			return err;
+
+		if (igt_flush_test(i915))
+			return -EIO;
 	}
 
 	return 0;
-- 
2.34.1

