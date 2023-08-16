Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBD77D724
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 02:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3569110E2A5;
	Wed, 16 Aug 2023 00:41:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C1C10E2A5;
 Wed, 16 Aug 2023 00:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692146502; x=1723682502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bFlFwR1ttQNuOodBjxVXzZ7fewXuJYOv49xUTQLrHHE=;
 b=c2ysRLfHBgDrTnsVbBz3UYiptf0ORRjsLdMD8+tFPd4oZbSEZoxwN9x9
 GFRUIdpAaov8+COfebXIatTgYg5kWho8xftC8/Dz5SFUI3BvbJfMp6HEf
 R3K8lnxr54oqSvQ6lLvJDm5B/5aVAz9vWdd9lCGj8G4Op5If/qerqsoq3
 I6FKag+vzQKqrrdsCmbbDuGcvW80r0RV82Q60F9/2QM6US5CXc//z83Xp
 eCZ/jqixunIu9zRdnVT1mGGWn7IuzXqa66hOCrYi+9VzLtRhsxnBYCzcm
 VU/6Up0GE36N9PUK6DEtHrKXbBI+2xpq6AeLCpEbvXupay9gggNnU3Uwj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372407618"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="372407618"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 17:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683844954"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="683844954"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 17:41:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2] drm/i915/guc: Force a reset on internal GuC error
Date: Tue, 15 Aug 2023 17:39:57 -0700
Message-ID: <20230816003957.3572654-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If GuC hits an internal error (and survives long enough to report it
to the KMD), it is basically toast and will stop until a GT reset and
subsequent GuC reload is performed. Previously, the KMD just printed
an error message and then waited for the heartbeat to eventually kick
in and trigger a reset (assuming the heartbeat had not been disabled).
Instead, force the reset immediately to guarantee that it happens and
to eliminate the very long heartbeat delay. The captured error state
is also more likely to be useful if captured at the time of the error
rather than many seconds later.

Note that it is not possible to trigger a reset from with the G2H
handler itself. The reset prepare process involves flushing
outstanding G2H contents. So a deadlock could result. Instead, the G2H
handler queues a worker thread to do the reset asynchronously.

v2: Flush the worker on suspend and shutdown. Add rate limiting to
prevent spam from a totally dead system (review feedback from Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 38 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 15 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +---
 3 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 569b5fe94c416..12a817b762334 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -159,6 +159,21 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 	gen11_reset_guc_interrupts(guc);
 }
 
+static void guc_dead_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc = container_of(w, struct intel_guc, dead_guc_worker);
+	struct intel_gt *gt = guc_to_gt(guc);
+	unsigned long last = guc->last_dead_guc_jiffies;
+	unsigned long delta = jiffies_to_msecs(jiffies - last);
+
+	if (delta < 500) {
+		intel_gt_set_wedged(gt);
+	} else {
+		intel_gt_handle_error(gt, ALL_ENGINES, I915_ERROR_CAPTURE, "dead GuC");
+		guc->last_dead_guc_jiffies = jiffies;
+	}
+}
+
 void intel_guc_init_early(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -171,6 +186,8 @@ void intel_guc_init_early(struct intel_guc *guc)
 	intel_guc_slpc_init_early(&guc->slpc);
 	intel_guc_rc_init_early(guc);
 
+	INIT_WORK(&guc->dead_guc_worker, guc_dead_worker_func);
+
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
 	if (GRAPHICS_VER(i915) >= 11) {
@@ -461,6 +478,8 @@ void intel_guc_fini(struct intel_guc *guc)
 	if (!intel_uc_fw_is_loadable(&guc->fw))
 		return;
 
+	flush_work(&guc->dead_guc_worker);
+
 	if (intel_guc_slpc_is_used(guc))
 		intel_guc_slpc_fini(&guc->slpc);
 
@@ -585,6 +604,20 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	return ret;
 }
 
+int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action)
+{
+	if (action == INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
+		guc_err(guc, "Crash dump notification\n");
+	else if (action == INTEL_GUC_ACTION_NOTIFY_EXCEPTION)
+		guc_err(guc, "Exception notification\n");
+	else
+		guc_err(guc, "Unknown crash notification: 0x%04X\n", action);
+
+	queue_work(system_unbound_wq, &guc->dead_guc_worker);
+
+	return 0;
+}
+
 int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 				       const u32 *payload, u32 len)
 {
@@ -601,6 +634,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
 		guc_err(guc, "Received early exception notification!\n");
 
+	if (msg & (INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED | INTEL_GUC_RECV_MSG_EXCEPTION))
+		queue_work(system_unbound_wq, &guc->dead_guc_worker);
+
 	return 0;
 }
 
@@ -640,6 +676,8 @@ int intel_guc_suspend(struct intel_guc *guc)
 		return 0;
 
 	if (intel_guc_submission_is_used(guc)) {
+		flush_work(&guc->dead_guc_worker);
+
 		/*
 		 * This H2G MMIO command tears down the GuC in two steps. First it will
 		 * generate a G2H CTB for every active context indicating a reset. In
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 8dc291ff00935..6c392bad29c19 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -266,6 +266,20 @@ struct intel_guc {
 		unsigned long last_stat_jiffies;
 	} timestamp;
 
+	/**
+	 * @dead_guc_worker: Asynchronous worker thread for forcing a GuC reset.
+	 * Specifically used when the G2H handler wants to issue a reset. Resets
+	 * require flushing the G2H queue. So, the G2H processing itself must not
+	 * trigger a reset directly. Instead, go via this worker.
+	 */
+	struct work_struct dead_guc_worker;
+	/**
+	 * @last_dead_guc_jiffies: timestamp of previous 'dead guc' occurrance
+	 * used to prevent a fundamentally broken system from continuously
+	 * reloading the GuC.
+	 */
+	unsigned long last_dead_guc_jiffies;
+
 #ifdef CONFIG_DRM_I915_SELFTEST
 	/**
 	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
@@ -476,6 +490,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len);
 int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 					const u32 *msg, u32 len);
+int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action);
 
 struct intel_engine_cs *
 intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 97eadd08181d6..6e22af31513a5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1112,12 +1112,8 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		ret = 0;
 		break;
 	case INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
-		CT_ERROR(ct, "Received GuC crash dump notification!\n");
-		ret = 0;
-		break;
 	case INTEL_GUC_ACTION_NOTIFY_EXCEPTION:
-		CT_ERROR(ct, "Received GuC exception notification!\n");
-		ret = 0;
+		ret = intel_guc_crash_process_msg(guc, action);
 		break;
 	default:
 		ret = -EOPNOTSUPP;
-- 
2.41.0

