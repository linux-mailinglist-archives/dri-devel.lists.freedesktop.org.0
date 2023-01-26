Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D457067C20F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 01:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9510E8D9;
	Thu, 26 Jan 2023 00:54:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8E510E8D2;
 Thu, 26 Jan 2023 00:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674694473; x=1706230473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zTd7lf6ad9RbSljaLkuZ/But6bcl+1S+wpat7nkSU1I=;
 b=K6wvk6pEgOdKqD2nTEcoX28jRWIfy0Sno5kfSgtLZwt+R0SPxi++Ys49
 s6/jnB+GTVel2KnDBq3Sj9l+1vsBJsmdY6zVcPHxv5G27RuGrDSxoBe2W
 NaTCSRRdxV3HlmKTV2ZIYRAl6TkBodGh8mqOfq4xxFJrgjOhQNvhwhihI
 XIpqEOGztp/EXCbxEOzuKtCNMQcAXDRRy89N999jt47FZ3XHET8PPmDDk
 B7Thy8FThZzhKiEYLZs9tPEMJ9DqCBxkqcImc0OPN8MLPo3HqgaGdxOWt
 rzvTZYCC5KczUwGTEq3aspqP+lXvAyhNTVCAEvvUfC8GkqOb/H53R8wYJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="389064428"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="389064428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 16:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="751404289"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="751404289"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 16:54:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 4/8] drm/i915: Allow error capture without a request
Date: Wed, 25 Jan 2023 16:54:16 -0800
Message-Id: <20230126005420.160070-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126005420.160070-1-John.C.Harrison@Intel.com>
References: <20230126005420.160070-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
if a context is given. Which means updating record_context() to take a
context instead of a request (which it only ever used to find the
context anyway). And split the request agnostic parts of
intel_engine_coredump_add_request() out into a seaprate function.

v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
pointer.
v3: Tidy up request locking code flow (Tvrtko)
v4: Pull in improved info message from next patch and fix up potential
leak of GuC register state (Daniele)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> (v2)
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 74 ++++++++++++++++++---------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index b20bd6365615b..225f1b11a6b93 100644
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
@@ -1604,25 +1624,31 @@ capture_engine(struct intel_engine_cs *engine,
 		return NULL;
 
 	intel_engine_get_hung_entity(engine, &ce, &rq);
-	if (!rq || !i915_request_started(rq))
-		goto no_request_capture;
+	if (rq && !i915_request_started(rq)) {
+		drm_info(&engine->gt->i915->drm, "Got hung context on %s with active request %lld:%lld [0x%04X] not yet started\n",
+			 engine->name, rq->fence.context, rq->fence.seqno, ce->guc_id.id);
+		i915_request_put(rq);
+		rq = NULL;
+	}
 
-	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
-	if (!capture)
-		goto no_request_capture;
-	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
-		intel_guc_capture_get_matching_node(engine->gt, ee, ce);
+	if (rq) {
+		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
+		i915_request_put(rq);
+	} else if (ce) {
+		capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
+	}
 
-	intel_engine_coredump_add_vma(ee, capture, compress);
-	i915_request_put(rq);
+	if (capture) {
+		intel_engine_coredump_add_vma(ee, capture, compress);
 
-	return ee;
+		if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
+			intel_guc_capture_get_matching_node(engine->gt, ee, ce);
+	} else {
+		kfree(ee);
+		ee = NULL;
+	}
 
-no_request_capture:
-	if (rq)
-		i915_request_put(rq);
-	kfree(ee);
-	return NULL;
+	return ee;
 }
 
 static void
-- 
2.39.1

