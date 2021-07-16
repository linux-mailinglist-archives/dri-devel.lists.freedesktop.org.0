Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB43CBD4B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBBC6EA28;
	Fri, 16 Jul 2021 19:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007346E9F5;
 Fri, 16 Jul 2021 19:59:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596741"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596741"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238995"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 31/51] drm/i915/guc: Handle engine reset failure notification
Date: Fri, 16 Jul 2021 13:17:04 -0700
Message-Id: <20210716201724.54804-32-matthew.brost@intel.com>
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

GuC will notify the driver, via G2H, if it fails to
reset an engine. We recover by resorting to a full GPU
reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 +++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index f23a3a618550..7f14e1873010 100644
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
index c4f9b44b9f86..d16381784ee2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -984,6 +984,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
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
index feaf1ca61eaa..035633f567b5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2232,6 +2232,49 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
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
 void intel_guc_submission_print_info(struct intel_guc *guc,
 				     struct drm_printer *p)
 {
-- 
2.28.0

