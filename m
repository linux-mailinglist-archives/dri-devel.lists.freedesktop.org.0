Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214383ED81C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28589F9F;
	Mon, 16 Aug 2021 13:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAE889E3B;
 Mon, 16 Aug 2021 13:56:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279607065"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279607065"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="441091167"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 07/22] drm/i915/selftests: Add a cancel request selftest that
 triggers a reset
Date: Mon, 16 Aug 2021 06:51:24 -0700
Message-Id: <20210816135139.10060-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816135139.10060-1-matthew.brost@intel.com>
References: <20210816135139.10060-1-matthew.brost@intel.com>
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

Add a cancel request selftest that results in an engine reset to cancel
the request as it is non-preemptable. Also insert a NOP request after
the cancelled request and confirm that it completely successfully.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index d67710d10615..e2c5db77f087 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -772,6 +772,98 @@ static int __cancel_completed(struct intel_engine_cs *engine)
 	return err;
 }
 
+static int __cancel_reset(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq, *nop;
+	unsigned long preempt_timeout_ms;
+	int err = 0;
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
+	pr_debug("%s: Cancelling active request\n", engine->name);
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
@@ -804,6 +896,14 @@ static int live_cancel_request(void *arg)
 			return err;
 		if (err2)
 			return err2;
+
+		/* Expects reset so call outside of igt_live_test_* */
+		err = __cancel_reset(engine);
+		if (err)
+			return err;
+
+		if (igt_flush_test(i915))
+			return -EIO;
 	}
 
 	return 0;
-- 
2.32.0

