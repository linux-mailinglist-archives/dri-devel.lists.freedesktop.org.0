Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508CE439BBC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 18:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9336E174;
	Mon, 25 Oct 2021 16:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BD06E174;
 Mon, 25 Oct 2021 16:38:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="210479314"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="210479314"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 09:38:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="571695932"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 09:38:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <joonas.lahtinen@linux.intel.com>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>
Subject: [PATCH] drm/i915/trace: Hide backend specific fields behind Kconfig
Date: Mon, 25 Oct 2021 09:34:04 -0700
Message-Id: <20211025163404.2774-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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

Hide the guc_id and tail fields, for request trace points, behind
CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS Kconfig option. Trace points
are ABI (maybe?) so don't change them without kernel developers Kconfig
options.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_trace.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 9795f456cccf..4f5238d02b51 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -787,6 +787,7 @@ TRACE_EVENT(i915_request_queue,
 		      __entry->ctx, __entry->seqno, __entry->flags)
 );
 
+#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
 DECLARE_EVENT_CLASS(i915_request,
 	    TP_PROTO(struct i915_request *rq),
 	    TP_ARGS(rq),
@@ -816,6 +817,32 @@ DECLARE_EVENT_CLASS(i915_request,
 		      __entry->guc_id, __entry->ctx, __entry->seqno,
 		      __entry->tail)
 );
+#else
+DECLARE_EVENT_CLASS(i915_request,
+	    TP_PROTO(struct i915_request *rq),
+	    TP_ARGS(rq),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(u64, ctx)
+			     __field(u16, class)
+			     __field(u16, instance)
+			     __field(u32, seqno)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev = rq->engine->i915->drm.primary->index;
+			   __entry->class = rq->engine->uabi_class;
+			   __entry->instance = rq->engine->uabi_instance;
+			   __entry->ctx = rq->fence.context;
+			   __entry->seqno = rq->fence.seqno;
+			   ),
+
+	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
+		      __entry->dev, __entry->class, __entry->instance,
+		      __entry->ctx, __entry->seqno)
+);
+#endif
 
 DEFINE_EVENT(i915_request, i915_request_add,
 	     TP_PROTO(struct i915_request *rq),
-- 
2.32.0

