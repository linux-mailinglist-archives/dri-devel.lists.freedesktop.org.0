Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3BE3CBD50
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907576EA26;
	Fri, 16 Jul 2021 19:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7AA6E9DE;
 Fri, 16 Jul 2021 19:59:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596724"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238926"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/51] drm/i915/guc: Add several request trace points
Date: Fri, 16 Jul 2021 13:16:50 -0700
Message-Id: <20210716201724.54804-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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

Add trace points for request dependencies and GuC submit. Extended
existing request trace points to include submit fence value,, guc_id,
and ring tail value.

v2: Fix white space alignment in i915_request_add trace point

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 ++
 drivers/gpu/drm/i915/i915_request.c           |  3 ++
 drivers/gpu/drm/i915/i915_trace.h             | 43 +++++++++++++++++--
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a2af7e17dcc2..480fb2184ecf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -417,6 +417,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 			guc->stalled_request = last;
 			return false;
 		}
+		trace_i915_request_guc_submit(last);
 	}
 
 	guc->stalled_request = NULL;
@@ -637,6 +638,8 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
 	ret = guc_add_request(guc, rq);
 	if (ret == -EBUSY)
 		guc->stalled_request = rq;
+	else
+		trace_i915_request_guc_submit(rq);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 2b2b63cba06c..01aa3d1ee2b1 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1319,6 +1319,9 @@ __i915_request_await_execution(struct i915_request *to,
 			return err;
 	}
 
+	trace_i915_request_dep_to(to);
+	trace_i915_request_dep_from(from);
+
 	/* Couple the dependency tree for PI on this exposed to->fence */
 	if (to->engine->sched_engine->schedule) {
 		err = i915_sched_node_add_dependency(&to->sched,
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 6778ad2a14a4..ea41d069bf7d 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -794,30 +794,50 @@ DECLARE_EVENT_CLASS(i915_request,
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
+DEFINE_EVENT(i915_request, i915_request_dep_to,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
+DEFINE_EVENT(i915_request, i915_request_dep_from,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
+DEFINE_EVENT(i915_request, i915_request_guc_submit,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
 DEFINE_EVENT(i915_request, i915_request_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
@@ -887,6 +907,21 @@ TRACE_EVENT(i915_request_out,
 
 #else
 #if !defined(TRACE_HEADER_MULTI_READ)
+static inline void
+trace_i915_request_dep_to(struct i915_request *rq)
+{
+}
+
+static inline void
+trace_i915_request_dep_from(struct i915_request *rq)
+{
+}
+
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

