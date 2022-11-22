Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212DC634A45
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 23:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B8C10E0CB;
	Tue, 22 Nov 2022 22:51:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418E210E0CB;
 Tue, 22 Nov 2022 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669157513; x=1700693513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dnitbkunTRwLIv8g6KAwkssL9GkuWWIOMRkTP59cywI=;
 b=KK59Cv+yDMD1gbp5ck08zORv7gS/Y2pnDftqwUI0yJR8ZejFAted5lip
 jie1Opsm85MB1Iyosf8IAVY5nMp9HF+mV5mXhuqltLI+SzTuBrxLJR5MD
 F71ypzuXAqPFGhRbHos0bzhOZ65glgD1a3RzZzJnEN1y8AmFz38GXxyaf
 8nw6NB9MF9Z00Yoi5s2wO/xGn6eDomdSdPVypzz+He3WoPo/8I60C28yd
 CcSK8vYr4Y11IGr9YmYlKBHNKBFkuV7nYKqfIZMLwak5c7rv0Xuf1u2oF
 1wSEoGHV0GtmiOcnRksduWtlQM2Mv5a7WzhrVtMzcBRpV4mbafPF178Re Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315084078"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="315084078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 14:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705136138"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="705136138"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2022 14:51:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915: Allow error capture without a request
Date: Tue, 22 Nov 2022 14:51:45 -0800
Message-Id: <20221122225145.727556-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

There was a report of error captures occurring without any hung
context being indicated despite the capture being initiated by a 'hung
context notification' from GuC. The problem was not reproducible.
However, it is possible to happen if the context in question has no
active requests. For example, if the hang was in the context switch
itself then the breadcrumb write would have occurred and the KMD would
see an idle context.

In the interests of attempting to provide as much information as
possible about a hang, it seems wise to include the engine info
regardless of whether a request was found or not. As opposed to just
prentending there was no hang at all.

So update the error capture code to always record engine information
if an engine is given. Which means updating record_context() to take a
context instead of a request (which it only ever used to find the
context anyway). And split the request agnostic parts of
intel_engine_coredump_add_request() out into a seaprate function.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 55 +++++++++++++++++++--------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 9d5d5a397b64e..2ed1c84c9fab4 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct intel_engine_coredump *ee)
 }
 
 static bool record_context(struct i915_gem_context_coredump *e,
-			   const struct i915_request *rq)
+			   struct intel_context *ce)
 {
 	struct i915_gem_context *ctx;
 	struct task_struct *task;
 	bool simulated;
 
 	rcu_read_lock();
-	ctx = rcu_dereference(rq->context->gem_context);
+	ctx = rcu_dereference(ce->gem_context);
 	if (ctx && !kref_get_unless_zero(&ctx->ref))
 		ctx = NULL;
 	rcu_read_unlock();
@@ -1396,8 +1396,8 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	e->guilty = atomic_read(&ctx->guilty_count);
 	e->active = atomic_read(&ctx->active_count);
 
-	e->total_runtime = intel_context_get_total_runtime_ns(rq->context);
-	e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
+	e->total_runtime = intel_context_get_total_runtime_ns(ce);
+	e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
 
 	simulated = i915_gem_context_no_error_capture(ctx);
 
@@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_
 	return ee;
 }
 
+static struct intel_engine_capture_vma *
+engine_coredump_add_context(struct intel_engine_coredump *ee,
+			    struct intel_context *ce,
+			    gfp_t gfp)
+{
+	struct intel_engine_capture_vma *vma = NULL;
+
+	ee->simulated |= record_context(&ee->context, ce);
+	if (ee->simulated)
+		return NULL;
+
+	/*
+	 * We need to copy these to an anonymous buffer
+	 * as the simplest method to avoid being overwritten
+	 * by userspace.
+	 */
+	vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
+	vma = capture_vma(vma, ce->state, "HW context", gfp);
+
+	return vma;
+}
+
 struct intel_engine_capture_vma *
 intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
 				  struct i915_request *rq,
 				  gfp_t gfp)
 {
-	struct intel_engine_capture_vma *vma = NULL;
+	struct intel_engine_capture_vma *vma;
 
-	ee->simulated |= record_context(&ee->context, rq);
-	if (ee->simulated)
+	vma = engine_coredump_add_context(ee, rq->context, gfp);
+	if (!vma)
 		return NULL;
 
 	/*
@@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
 	 */
 	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
 	vma = capture_user(vma, rq, gfp);
-	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
-	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
 
 	ee->rq_head = rq->head;
 	ee->rq_post = rq->postfix;
@@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs *engine,
 	if (ce) {
 		intel_engine_clear_hung_context(engine);
 		rq = intel_context_find_active_request(ce);
-		if (!rq || !i915_request_started(rq))
-			goto no_request_capture;
+		if (rq && !i915_request_started(rq)) {
+			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
+				 engine->name);
+			rq = NULL;
+		}
 	} else {
 		/*
 		 * Getting here with GuC enabled means it is a forced error capture
@@ -1625,12 +1648,14 @@ capture_engine(struct intel_engine_cs *engine,
 	if (rq)
 		rq = i915_request_get_rcu(rq);
 
-	if (!rq)
-		goto no_request_capture;
+	if (rq)
+		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
+	else if (ce)
+		capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
 
-	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
 	if (!capture) {
-		i915_request_put(rq);
+		if (rq)
+			i915_request_put(rq);
 		goto no_request_capture;
 	}
 	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
-- 
2.37.3

