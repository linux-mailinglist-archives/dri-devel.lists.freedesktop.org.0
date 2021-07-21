Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CB03D1938
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 23:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D0F6EA25;
	Wed, 21 Jul 2021 21:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EB86E897;
 Wed, 21 Jul 2021 21:33:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="209620428"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="209620428"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:33:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="470296697"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:33:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/18] drm/i915/guc: Add trace point for GuC submit
Date: Wed, 21 Jul 2021 14:51:00 -0700
Message-Id: <20210721215101.139794-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210721215101.139794-1-matthew.brost@intel.com>
References: <20210721215101.139794-1-matthew.brost@intel.com>
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

Add trace point for GuC submit. Extended existing request trace points
to include submit fence value,, guc_id, and ring tail value.

v2: Fix white space alignment in i915_request_add trace point
v3: Delete dep_from , dep_to (Tvrtko)

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 +++
 drivers/gpu/drm/i915/i915_trace.h             | 23 +++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e6e5364beb1c..d47a8358c831 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -418,6 +418,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 			guc->stalled_request = last;
 			return false;
 		}
+		trace_i915_request_guc_submit(last);
 	}
 
 	guc->stalled_request = NULL;
@@ -638,6 +639,8 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
 	ret = guc_add_request(guc, rq);
 	if (ret == -EBUSY)
 		guc->stalled_request = rq;
+	else
+		trace_i915_request_guc_submit(rq);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 6778ad2a14a4..478f5427531d 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -794,30 +794,40 @@ DECLARE_EVENT_CLASS(i915_request,
 	    TP_STRUCT__entry(
 			     __field(u32, dev)
 			     __field(u64, ctx)
+			     __field(u32, guc_id)
 			     __field(u16, class)
 			     __field(u16, instance)
 			     __field(u32, seqno)
+			     __field(u32, tail)
 			     ),
 
 	    TP_fast_assign(
 			   __entry->dev = rq->engine->i915->drm.primary->index;
 			   __entry->class = rq->engine->uabi_class;
 			   __entry->instance = rq->engine->uabi_instance;
+			   __entry->guc_id = rq->context->guc_id;
 			   __entry->ctx = rq->fence.context;
 			   __entry->seqno = rq->fence.seqno;
+			   __entry->tail = rq->tail;
 			   ),
 
-	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
+	    TP_printk("dev=%u, engine=%u:%u, guc_id=%u, ctx=%llu, seqno=%u, tail=%u",
 		      __entry->dev, __entry->class, __entry->instance,
-		      __entry->ctx, __entry->seqno)
+		      __entry->guc_id, __entry->ctx, __entry->seqno,
+		      __entry->tail)
 );
 
 DEFINE_EVENT(i915_request, i915_request_add,
-	    TP_PROTO(struct i915_request *rq),
-	    TP_ARGS(rq)
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
 );
 
 #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
+DEFINE_EVENT(i915_request, i915_request_guc_submit,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
 DEFINE_EVENT(i915_request, i915_request_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
@@ -887,6 +897,11 @@ TRACE_EVENT(i915_request_out,
 
 #else
 #if !defined(TRACE_HEADER_MULTI_READ)
+static inline void
+trace_i915_request_guc_submit(struct i915_request *rq)
+{
+}
+
 static inline void
 trace_i915_request_submit(struct i915_request *rq)
 {
-- 
2.28.0

