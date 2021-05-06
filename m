Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54127375ADD
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25846ED07;
	Thu,  6 May 2021 18:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ACE6ED65;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: 1xWv6ZULHGqeSSig408NRd6EBkSdW0L8gNGnGFrTkuflV1d4E2luqu3ogKMnwbwEUtxmwiyfGj
 Tlf83zp0RXlA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195458"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195458"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: ENkPGOu5YVT8ucse92tKYePSuQFTSku0c65JpL0kNi7f81ZVlrhR2SP2pM2kh/B60sT3yU3kjn
 +aDke3DbA4DA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583578"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 68/97] drm/i915/guc: Handle context reset notification
Date: Thu,  6 May 2021 12:14:22 -0700
Message-Id: <20210506191451.77768-69-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC will issue a reset on detecting an engine hang and will notify
the driver via a G2H message. The driver will service the notification
by resetting the guilty context to a simple state or banning it
completely.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  6 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 277b4496a20e..a2abe1c422e3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -263,6 +263,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg, u32 len);
 int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 				     const u32 *msg, u32 len);
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index b3194d753b13..9c84b2ba63a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -941,6 +941,12 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 			CT_ERROR(ct, "schedule context failed %x %*ph\n",
 				  action, 4 * len, payload);
 		break;
+	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
+		ret = intel_guc_context_reset_process_msg(guc, payload, len);
+		if (unlikely(ret))
+			CT_ERROR(ct, "context reset notification failed %x %*ph\n",
+				  action, 4 * len, payload);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2c3791fc24b7..940017495731 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2192,6 +2192,41 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static void guc_context_replay(struct intel_context *ce)
+{
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+
+	__guc_reset_context(ce, true);
+	i915_sched_engine_hi_kick(sched_engine);
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
+	int desc_idx = msg[0];
+
+	if (unlikely(len != 1)) {
+		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	ce = g2h_context_lookup(guc, desc_idx);
+	if (unlikely(!ce))
+		return -EPROTO;
+
+	guc_handle_context_reset(guc, ce);
+
+	return 0;
+}
+
 void intel_guc_log_submission_info(struct intel_guc *guc,
 				   struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 97c2e83984ed..c095c4d39456 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -929,6 +929,11 @@ DECLARE_EVENT_CLASS(intel_context,
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
@@ -1026,6 +1031,11 @@ trace_i915_request_out(struct i915_request *rq)
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

