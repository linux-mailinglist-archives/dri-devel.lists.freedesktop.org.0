Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60573D6A94
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11D73250;
	Tue, 27 Jul 2021 00:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4786C72040;
 Tue, 27 Jul 2021 00:06:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932132"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932132"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339165"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:05:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/33] drm/i915/guc: Handle context reset notification
Date: Mon, 26 Jul 2021 17:23:27 -0700
Message-Id: <20210727002348.97202-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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

GuC will issue a reset on detecting an engine hang and will notify
the driver via a G2H message. The driver will service the notification
by resetting the guilty context to a simple state or banning it
completely.

v2:
 (John Harrison)
  - Move msg[0] lookup after length check
v3:
 (John Harrison)
  - s/drm_dbg/drm_err

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 7b871f675e48..c79da154c16d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -269,6 +269,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg, u32 len);
 int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 				     const u32 *msg, u32 len);
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 8bb6b1bbcea1..231a42887675 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -984,6 +984,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 		ret = intel_guc_sched_done_process_msg(guc, payload, len);
 		break;
+	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
+		ret = intel_guc_context_reset_process_msg(guc, payload, len);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d39a312e980a..7be84b0761b5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2201,6 +2201,42 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static void guc_context_replay(struct intel_context *ce)
+{
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+
+	__guc_reset_context(ce, true);
+	tasklet_hi_schedule(&sched_engine->tasklet);
+}
+
+static void guc_handle_context_reset(struct intel_guc *guc,
+				     struct intel_context *ce)
+{
+	trace_intel_context_reset(ce);
+	guc_context_replay(ce);
+}
+
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len)
+{
+	struct intel_context *ce;
+	int desc_idx;
+
+	if (unlikely(len != 1)) {
+		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	desc_idx = msg[0];
+	ce = g2h_context_lookup(guc, desc_idx);
+	if (unlikely(!ce))
+		return -EPROTO;
+
+	guc_handle_context_reset(guc, ce);
+
+	return 0;
+}
+
 void intel_guc_submission_print_info(struct intel_guc *guc,
 				     struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 68b70626c3e2..3f43d904f043 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -920,6 +920,11 @@ DECLARE_EVENT_CLASS(intel_context,
 			      __entry->guc_sched_state_no_lock)
 );
 
+DEFINE_EVENT(intel_context, intel_context_reset,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
 DEFINE_EVENT(intel_context, intel_context_register,
 	     TP_PROTO(struct intel_context *ce),
 	     TP_ARGS(ce)
@@ -1007,6 +1012,11 @@ trace_i915_request_out(struct i915_request *rq)
 {
 }
 
+static inline void
+trace_intel_context_reset(struct intel_context *ce)
+{
+}
+
 static inline void
 trace_intel_context_register(struct intel_context *ce)
 {
-- 
2.28.0

