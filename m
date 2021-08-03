Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C53DF799
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978106E94E;
	Tue,  3 Aug 2021 22:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625136E90D;
 Tue,  3 Aug 2021 22:11:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393490"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393490"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512748"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 43/46] drm/i915/guc: Handle errors in multi-lrc requests
Date: Tue,  3 Aug 2021 15:29:40 -0700
Message-Id: <20210803222943.27686-44-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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
emit the breadcrumbs seqno. An issues arrises because with multi-lrc
breadcrumbs there is a handshake between the parent and children to make
forwad progress. If all the requests are not present this handshake
doesn't work. To work around this, if multi-lrc request has an error we
skip the handshake but still emit the breadcrumbs seqno.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d61c45d1ac2c..cd1893edf43a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4394,8 +4394,8 @@ static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
 }
 
 static u32 *
-emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
-						 u32 *cs)
+__emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
+						   u32 *cs)
 {
 	struct intel_context *ce = rq->context;
 	u8 i;
@@ -4423,6 +4423,41 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
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
@@ -4439,7 +4474,8 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
 }
 
 static u32 *
-emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
+__emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
+						  u32 *cs)
 {
 	struct intel_context *ce = rq->context;
 
@@ -4465,6 +4501,25 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs
 	*cs++ = get_children_go_addr(ce->parent);
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
2.28.0

