Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE205494266
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F96410E5CA;
	Wed, 19 Jan 2022 21:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665710E425;
 Wed, 19 Jan 2022 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642626878; x=1674162878;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eoChbUb+MK9MnSv+RJPD37hp9TDVeWrkTrngH/4rGsw=;
 b=h4GKE8tPKMoI+ILvR+3AdHMBljUX3uE3EPIfDjP23pjMemOXbBtzQ694
 p2rWrMgie+wOVrRAqcx4tIE2wThY9prCCIqU0vYUN3/S3OZOHKiV/W3xK
 jJXO+HiOVAQ8P+o3fBZYveiCIJe797x12kZBiQ+3S22E8yJvvt9yA7xK0
 uAmoGwxgMXhVkbKlVPtGDeldHxdscLVvMEQ2vJfmQ2WeZLjIh+tARLnTf
 l7MlHUb0iwbu0M717lBRmSrOz2gP3V373JVAFsehR5Cl4U3FmCb1YGpIn
 p+WVzYW4h1sIl4rH7l36fa+6e66Z39IWDLWKOhKNktj9dK8tqj2YPvBsp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331544617"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="331544617"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:12:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="693942121"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:12:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915/guc: Ensure multi-lrc fini breadcrumb math is correct
Date: Wed, 19 Jan 2022 13:06:39 -0800
Message-Id: <20220119210639.33053-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Realized that the GuC multi-lrc fini breadcrumb emit code is very
delicate as the math this code does relies on functions it calls to emit
a certain number of DWs. Add a few GEM_BUG_ONs to assert the math is
correct.

v2:
  - Rebase + resend for CI
 (Checkpatch)
  - Fix blank line warning

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 33 +++++++++++++++----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3918f1be114f..650efd3d3a48 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4429,27 +4429,31 @@ static inline bool skip_handshake(struct i915_request *rq)
 	return test_bit(I915_FENCE_FLAG_SKIP_PARALLEL, &rq->fence.flags);
 }
 
+#define NON_SKIP_LEN	6
 static u32 *
 emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
 						 u32 *cs)
 {
 	struct intel_context *ce = rq->context;
+	__maybe_unused u32 *before_fini_breadcrumb_user_interrupt_cs;
+	__maybe_unused u32 *start_fini_breadcrumb_cs = cs;
 
 	GEM_BUG_ON(!intel_context_is_parent(ce));
 
 	if (unlikely(skip_handshake(rq))) {
 		/*
 		 * NOP everything in __emit_fini_breadcrumb_parent_no_preempt_mid_batch,
-		 * the -6 comes from the length of the emits below.
+		 * the NON_SKIP_LEN comes from the length of the emits below.
 		 */
 		memset(cs, 0, sizeof(u32) *
-		       (ce->engine->emit_fini_breadcrumb_dw - 6));
-		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
+		       (ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN));
+		cs += ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN;
 	} else {
 		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
 	}
 
 	/* Emit fini breadcrumb */
+	before_fini_breadcrumb_user_interrupt_cs = cs;
 	cs = gen8_emit_ggtt_write(cs,
 				  rq->fence.seqno,
 				  i915_request_active_timeline(rq)->hwsp_offset,
@@ -4459,6 +4463,12 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
 	*cs++ = MI_USER_INTERRUPT;
 	*cs++ = MI_NOOP;
 
+	/* Ensure our math for skip + emit is correct */
+	GEM_BUG_ON(before_fini_breadcrumb_user_interrupt_cs + NON_SKIP_LEN !=
+		   cs);
+	GEM_BUG_ON(start_fini_breadcrumb_cs +
+		   ce->engine->emit_fini_breadcrumb_dw != cs);
+
 	rq->tail = intel_ring_offset(rq, cs);
 
 	return cs;
@@ -4501,22 +4511,25 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
 						u32 *cs)
 {
 	struct intel_context *ce = rq->context;
+	__maybe_unused u32 *before_fini_breadcrumb_user_interrupt_cs;
+	__maybe_unused u32 *start_fini_breadcrumb_cs = cs;
 
 	GEM_BUG_ON(!intel_context_is_child(ce));
 
 	if (unlikely(skip_handshake(rq))) {
 		/*
 		 * NOP everything in __emit_fini_breadcrumb_child_no_preempt_mid_batch,
-		 * the -6 comes from the length of the emits below.
+		 * the NON_SKIP_LEN comes from the length of the emits below.
 		 */
 		memset(cs, 0, sizeof(u32) *
-		       (ce->engine->emit_fini_breadcrumb_dw - 6));
-		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
+		       (ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN));
+		cs += ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN;
 	} else {
 		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
 	}
 
 	/* Emit fini breadcrumb */
+	before_fini_breadcrumb_user_interrupt_cs = cs;
 	cs = gen8_emit_ggtt_write(cs,
 				  rq->fence.seqno,
 				  i915_request_active_timeline(rq)->hwsp_offset,
@@ -4526,11 +4539,19 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
 	*cs++ = MI_USER_INTERRUPT;
 	*cs++ = MI_NOOP;
 
+	/* Ensure our math for skip + emit is correct */
+	GEM_BUG_ON(before_fini_breadcrumb_user_interrupt_cs + NON_SKIP_LEN !=
+		   cs);
+	GEM_BUG_ON(start_fini_breadcrumb_cs +
+		   ce->engine->emit_fini_breadcrumb_dw != cs);
+
 	rq->tail = intel_ring_offset(rq, cs);
 
 	return cs;
 }
 
+#undef NON_SKIP_LEN
+
 static struct intel_context *
 guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		   unsigned long flags)
-- 
2.34.1

