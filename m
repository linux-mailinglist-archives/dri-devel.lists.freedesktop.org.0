Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6490B48D22C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 07:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8123E10E26A;
	Thu, 13 Jan 2022 06:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710910E26A;
 Thu, 13 Jan 2022 06:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642053897; x=1673589897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HRDZv2zkE0ifg8B4KC3f6hn6niZT5pSPDTveZdUJ4ek=;
 b=QkygsCTfSani5H8RSGPntihHwkrqlaDWpMsQ7R0pxEkdG4pM4dBY9Gml
 V0wVS5TknsK38X27eDE1WnSSf2KyYfxlZkKrVQIt3A3mLcC8n5/ChEhNw
 /UsmgIxfDByXvt/kGCbgHbJEWKvsFDWqIwendQOriedplxPGamFcLOX/+
 Yz+fJXSknxUKJ/RbowlsuLu6RpO325FnEts36BYNiBBuUf2AGtuj/759z
 WBrytyjxmyuQXnWhOS5CsoJxFO7zQLN5smAqrc/RMdqICD0B5GUGMSGxL
 z83rBnuyJcnWyM5rGChnnd+ymJiC3y6phxhx3SwF3qKaj049pF0GSjmMp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="304674962"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="304674962"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 22:04:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="691683969"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 22:04:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/guc: Ensure multi-lrc fini breadcrumb math is correct
Date: Wed, 12 Jan 2022 21:59:03 -0800
Message-Id: <20220113055903.7607-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Realized that the GuC multi-lrc fini breadcrumb emit code is very
delicate as the math this code does relies on functions it calls to emit
a certain number of DWs. Add a few GEM_BUG_ONs to assert the math is
correct.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3ae92260f8224..d562d85f96871 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4493,27 +4493,31 @@ static inline bool skip_handshake(struct i915_request *rq)
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
@@ -4523,6 +4527,12 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
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
@@ -4565,22 +4575,25 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
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
@@ -4590,10 +4603,17 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
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
 
 static struct intel_context *
 guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
-- 
2.34.1

