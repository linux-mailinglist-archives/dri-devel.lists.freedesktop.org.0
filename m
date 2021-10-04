Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C64219CB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518BC6EABF;
	Mon,  4 Oct 2021 22:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842289295;
 Mon,  4 Oct 2021 22:11:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225498447"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="225498447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735539"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 22/26] drm/i915/guc: Handle errors in multi-lrc requests
Date: Mon,  4 Oct 2021 15:06:33 -0700
Message-Id: <20211004220637.14746-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

If an error occurs in the front end when multi-lrc requests are getting
generated we need to skip these in the backend but we still need to
emit the breadcrumbs seqno. An issues arises because with multi-lrc
breadcrumbs there is a handshake between the parent and children to make
forward progress. If all the requests are not present this handshake
doesn't work. To work around this, if multi-lrc request has an error we
skip the handshake but still emit the breadcrumbs seqno.

v2:
 (John Harrison)
  - Add comment explaining the skipping of the handshake logic
  - Fix typos in the commit message

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 71 ++++++++++++++++++-
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 83b0d2a114af..05e8b199e4ce 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4072,8 +4072,8 @@ static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
 }
 
 static u32 *
-emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
-						 u32 *cs)
+__emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
+						   u32 *cs)
 {
 	struct intel_context *ce = rq->context;
 	u8 i;
@@ -4101,6 +4101,46 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
 				  get_children_go_addr(ce),
 				  0);
 
+	return cs;
+}
+
+/*
+ * If this true, a submission of multi-lrc requests had an error and the
+ * requests need to be skipped. The front end (execuf IOCTL) should've called
+ * i915_request_skip which squashes the BB but we still need to emit the fini
+ * breadrcrumbs seqno write. At this point we don't know how many of the
+ * requests in the multi-lrc submission were generated so we can't do the
+ * handshake between the parent and children (e.g. if 4 requests should be
+ * generated but 2nd hit an error only 1 would be seen by the GuC backend).
+ * Simply skip the handshake, but still emit the breadcrumbd seqno, if an error
+ * has occurred on any of the requests in submission / relationship.
+ */
+static inline bool skip_handshake(struct i915_request *rq)
+{
+	return test_bit(I915_FENCE_FLAG_SKIP_PARALLEL, &rq->fence.flags);
+}
+
+static u32 *
+emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
+						 u32 *cs)
+{
+	struct intel_context *ce = rq->context;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	if (unlikely(skip_handshake(rq))) {
+		/*
+		 * NOP everything in
+		 * __emit_fini_breadcrumb_parent_no_preempt_mid_batch, the -6
+		 * comes of the length emission below.
+		 */
+		memset(cs, 0, sizeof(u32) *
+		       (ce->engine->emit_fini_breadcrumb_dw - 6));
+		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
+	} else {
+		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
+	}
+
 	/* Emit fini breadcrumb */
 	cs = gen8_emit_ggtt_write(cs,
 				  rq->fence.seqno,
@@ -4117,7 +4157,8 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
 }
 
 static u32 *
-emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
+__emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
+						  u32 *cs)
 {
 	struct intel_context *ce = rq->context;
 	struct intel_context *parent = intel_context_to_parent(ce);
@@ -4144,6 +4185,30 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs
 	*cs++ = get_children_go_addr(parent);
 	*cs++ = 0;
 
+	return cs;
+}
+
+static u32 *
+emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
+						u32 *cs)
+{
+	struct intel_context *ce = rq->context;
+
+	GEM_BUG_ON(!intel_context_is_child(ce));
+
+	if (unlikely(skip_handshake(rq))) {
+		/*
+		 * NOP everything in
+		 * __emit_fini_breadcrumb_child_no_preempt_mid_batch, the -6
+		 * comes from the length the emission below.
+		 */
+		memset(cs, 0, sizeof(u32) *
+		       (ce->engine->emit_fini_breadcrumb_dw - 6));
+		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
+	} else {
+		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
+	}
+
 	/* Emit fini breadcrumb */
 	cs = gen8_emit_ggtt_write(cs,
 				  rq->fence.seqno,
-- 
2.32.0

