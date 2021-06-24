Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ACB3B27B0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9781F6E9FE;
	Thu, 24 Jun 2021 06:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405FB6E9F3;
 Thu, 24 Jun 2021 06:47:29 +0000 (UTC)
IronPort-SDR: x0BtO3CFbO3lJJMmvkdih5Uki1XdXpPDiuIo8GCNjuXTlilLYeX2xzhLsMSmiHvEZdkakj4Dzk
 H/sFF8S8xAfw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="293039166"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="293039166"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: 3DV2X+Jkjqi24r9fT/hJj0yomaZDh7dr60m/T/usGrozRPnqwogdGSkAj84yeIv808dMhrq2GK
 fZAWcQB1r/Cg==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390971"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 36/47] drm/i915/guc: Handle engine reset failure notification
Date: Thu, 24 Jun 2021 00:05:05 -0700
Message-Id: <20210624070516.21893-37-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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

GuC will notify the driver, via G2H, if it fails to
reset an engine. We recover by resorting to a full GPU
reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 +++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index e94b0ef733da..99742625e6ff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -264,6 +264,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 				     const u32 *msg, u32 len);
 int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 					const u32 *msg, u32 len);
+int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+					 const u32 *msg, u32 len);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index a2020373b8e8..dd6177c8d75c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -948,6 +948,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
 		ret = intel_guc_context_reset_process_msg(guc, payload, len);
 		break;
+	case INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION:
+		ret = intel_guc_engine_failure_process_msg(guc, payload, len);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9845c5bd9832..c3223958dfe0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2227,6 +2227,49 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static struct intel_engine_cs *
+guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	u8 engine_class = guc_class_to_engine_class(guc_class);
+
+	/* Class index is checked in class converter */
+	GEM_BUG_ON(instance > MAX_ENGINE_INSTANCE);
+
+	return gt->engine_class[engine_class][instance];
+}
+
+int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+					 const u32 *msg, u32 len)
+{
+	struct intel_engine_cs *engine;
+	u8 guc_class, instance;
+	u32 reason;
+
+	if (unlikely(len != 3)) {
+		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	guc_class = msg[0];
+	instance = msg[1];
+	reason = msg[2];
+
+	engine = guc_lookup_engine(guc, guc_class, instance);
+	if (unlikely(!engine)) {
+		drm_dbg(&guc_to_gt(guc)->i915->drm,
+			"Invalid engine %d:%d", guc_class, instance);
+		return -EPROTO;
+	}
+
+	intel_gt_handle_error(guc_to_gt(guc), engine->mask,
+			      I915_ERROR_CAPTURE,
+			      "GuC failed to reset %s (reason=0x%08x)\n",
+			      engine->name, reason);
+
+	return 0;
+}
+
 void intel_guc_log_submission_info(struct intel_guc *guc,
 				   struct drm_printer *p)
 {
-- 
2.28.0

