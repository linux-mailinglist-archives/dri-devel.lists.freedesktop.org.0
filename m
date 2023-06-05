Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08A7231C4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 22:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74510E0A2;
	Mon,  5 Jun 2023 20:53:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748CD10E0A2;
 Mon,  5 Jun 2023 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685998416; x=1717534416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0txZXJRi8hdlBgMpISx8rBrbj4DSINsU+4qxUPxufFk=;
 b=I2M/autWvVSAc6NZvJ0SL9/y4eJzPsmUn+ZWfO/5EWk1GS98v5GoVarp
 8MKKzZj13nGDQu8X1zl7PV3slsn4/zPO/GM0tFGNjHyU7pULj7biP/VaV
 e2JvI37zIhmaBXzc/20dHogIwXEMRlx4E+1YqP1rD3uVAJ6cygl0Y3TWC
 NSgCS2Wlq3KC4I35ZtD9igeSbFCjPLXi8S+2kPBzQT6vKt/DZ4zG32lcF
 yLPLT1wZC8RafzIGFrZBuyWjHtGf85UlDU+5moCvTchaNlTOuvB1IxpYt
 M1p4pxtRhgc+gYisnpXjV241lZ2M6iPeD/56JlIcA1XNGCNKyqpIfPS7k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420024875"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="420024875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 13:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741865806"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="741865806"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 13:53:34 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Force a reset on internal GuC error
Date: Mon,  5 Jun 2023 13:54:31 -0700
Message-Id: <20230605205431.852088-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 26 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    |  9 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +-----
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2eb891b270aec..c35cf10f52b56 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -159,6 +159,13 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 	gen11_reset_guc_interrupts(guc);
 }
 
+static void guc_dead_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc = container_of(w, struct intel_guc, dead_guc_worker);
+
+	intel_gt_handle_error(guc_to_gt(guc), ALL_ENGINES, I915_ERROR_CAPTURE, "dead GuC");
+}
+
 void intel_guc_init_early(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -171,6 +178,8 @@ void intel_guc_init_early(struct intel_guc *guc)
 	intel_guc_slpc_init_early(&guc->slpc);
 	intel_guc_rc_init_early(guc);
 
+	INIT_WORK(&guc->dead_guc_worker, guc_dead_worker_func);
+
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
 	if (GRAPHICS_VER(i915) >= 11) {
@@ -585,6 +594,20 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	return ret;
 }
 
+int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action)
+{
+	if (action == INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
+		guc_err(guc, "Crash dump notification\n");
+	else if (action == INTEL_GUC_ACTION_NOTIFY_EXCEPTION)
+		guc_err(guc, "Exception notification\n");
+	else
+		guc_err(guc, "Unknown crash notification\n");
+
+	queue_work(system_unbound_wq, &guc->dead_guc_worker);
+
+	return 0;
+}
+
 int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 				       const u32 *payload, u32 len)
 {
@@ -601,6 +624,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
 		guc_err(guc, "Received early exception notification!\n");
 
+	if (msg & (INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED | INTEL_GUC_RECV_MSG_EXCEPTION))
+		queue_work(system_unbound_wq, &guc->dead_guc_worker);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 8dc291ff00935..0b54eec95fc00 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -266,6 +266,14 @@ struct intel_guc {
 		unsigned long last_stat_jiffies;
 	} timestamp;
 
+	/**
+	 * @dead_guc_worker: Asynchronous worker thread for forcing a GuC reset.
+	 * Specifically used when the G2H handler wants to issue a reset. Resets
+	 * require flushing the G2H queue. So, the G2H processing itself must not
+	 * trigger a reset directly. Instead, go via this worker.
+	 */
+	struct work_struct dead_guc_worker;
+
 #ifdef CONFIG_DRM_I915_SELFTEST
 	/**
 	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
@@ -476,6 +484,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len);
 int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 					const u32 *msg, u32 len);
+int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action);
 
 struct intel_engine_cs *
 intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index f28a3a83742dc..7b09ad6931021 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1116,12 +1116,8 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
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
2.39.1

