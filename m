Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E56E6BEF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6110E845;
	Tue, 18 Apr 2023 18:17:58 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BDF10E834;
 Tue, 18 Apr 2023 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681841873; x=1713377873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLc5CsEvH3T3K97fiqQpODOpqodThzXzYxpRJEYUBrI=;
 b=SQJ6NC3I23NJV82Crlk6wlfliqCAuYcP2sSYjbLlx06IBVBxyJ+Jj9uM
 rbWDM9qTFPrjWkalXapPdMCpiGlQGDO5lHfpYskf22HqUwkxp54NPYTZt
 hghDXPCeyuQEmrgkA9jKD7P3isyVkETU1Sc0u68ugUS5pURDvpzBDCCBH
 hz7sQsYeoo1oeooVCbnjuP6f0LhQ5oF5SyuiAihJs2ou21mB4Zu/xsqgV
 Gz17bmYsHFHAhNVYnkBkSyLFMeONDvJzPOUIHKaJaQtcAUBJrIVzZ+1jd
 JeITP8sfNcIgmjacITVs9gA7/aNr7xAQIuJ7hQm/S4/NdhrBFdq6ItKpE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348008878"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="348008878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 11:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815307855"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="815307855"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 11:17:52 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/2] drm/i915/guc: Dump error capture to dmesg on CTB error
Date: Tue, 18 Apr 2023 11:17:44 -0700
Message-Id: <20230418181744.3251240-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
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

In the past, There have been sporadic CTB failures which proved hard
to reproduce manually. The most effective solution was to dump the GuC
log at the point of failure and let the CI system do the repro. It is
preferable not to dump the GuC log via dmesg for all issues as it is
not always necessary and is not helpful for end users. But rather than
trying to re-invent the code to do this each time it is wanted, commit
the code but for DEBUG_GUC builds only.

v2: Use IS_ENABLED for testing config options.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 53 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 +++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 1803a633ed648..dc5cd712f1ff5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -13,6 +13,30 @@
 #include "intel_guc_ct.h"
 #include "intel_guc_print.h"
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+enum {
+	CT_DEAD_ALIVE = 0,
+	CT_DEAD_SETUP,
+	CT_DEAD_WRITE,
+	CT_DEAD_DEADLOCK,
+	CT_DEAD_H2G_HAS_ROOM,
+	CT_DEAD_READ,
+	CT_DEAD_PROCESS_FAILED,
+};
+
+static void ct_dead_ct_worker_func(struct work_struct *w);
+
+#define CT_DEAD(ct, reason)	\
+	do { \
+		if (!(ct)->dead_ct_reported) { \
+			(ct)->dead_ct_reason |= 1 << CT_DEAD_##reason; \
+			queue_work(system_unbound_wq, &(ct)->dead_ct_worker); \
+		} \
+	} while (0)
+#else
+#define CT_DEAD(ct, reason)	do { } while (0)
+#endif
+
 static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
 {
 	return container_of(ct, struct intel_guc, ct);
@@ -93,6 +117,9 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 	spin_lock_init(&ct->requests.lock);
 	INIT_LIST_HEAD(&ct->requests.pending);
 	INIT_LIST_HEAD(&ct->requests.incoming);
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+	INIT_WORK(&ct->dead_ct_worker, ct_dead_ct_worker_func);
+#endif
 	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
 	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
 	init_waitqueue_head(&ct->wq);
@@ -319,11 +346,16 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 
 	ct->enabled = true;
 	ct->stall_time = KTIME_MAX;
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+	ct->dead_ct_reported = false;
+	ct->dead_ct_reason = CT_DEAD_ALIVE;
+#endif
 
 	return 0;
 
 err_out:
 	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
+	CT_DEAD(ct, SETUP);
 	return err;
 }
 
@@ -434,6 +466,7 @@ static int ct_write(struct intel_guc_ct *ct,
 corrupted:
 	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
 		 desc->head, desc->tail, desc->status);
+	CT_DEAD(ct, WRITE);
 	ctb->broken = true;
 	return -EPIPE;
 }
@@ -504,6 +537,7 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 		CT_ERROR(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
 		CT_ERROR(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
 
+		CT_DEAD(ct, DEADLOCK);
 		ct->ctbs.send.broken = true;
 	}
 
@@ -552,6 +586,7 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
 			 head, ctb->size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		ctb->broken = true;
+		CT_DEAD(ct, H2G_HAS_ROOM);
 		return false;
 	}
 
@@ -908,6 +943,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
 		 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
+	CT_DEAD(ct, READ);
 	return -EPIPE;
 }
 
@@ -1057,6 +1093,7 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
 	if (unlikely(err)) {
 		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
 			 ERR_PTR(err), 4 * request->size, request->msg);
+		CT_DEAD(ct, PROCESS_FAILED);
 		ct_free_msg(request);
 	}
 
@@ -1233,3 +1270,19 @@ void intel_guc_ct_print_info(struct intel_guc_ct *ct,
 	drm_printf(p, "Tail: %u\n",
 		   ct->ctbs.recv.desc->tail);
 }
+
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+static void ct_dead_ct_worker_func(struct work_struct *w)
+{
+	struct intel_guc_ct *ct = container_of(w, struct intel_guc_ct, dead_ct_worker);
+	struct intel_guc *guc = ct_to_guc(ct);
+
+	if (ct->dead_ct_reported)
+		return;
+
+	ct->dead_ct_reported = true;
+
+	guc_info(guc, "CTB is dead - reason=0x%X\n", ct->dead_ct_reason);
+	intel_klog_error_capture(guc_to_gt(guc), (intel_engine_mask_t)~0U);
+}
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index f709a19c7e214..818415b64f4d1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -85,6 +85,12 @@ struct intel_guc_ct {
 
 	/** @stall_time: time of first time a CTB submission is stalled */
 	ktime_t stall_time;
+
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+	int dead_ct_reason;
+	bool dead_ct_reported;
+	struct work_struct dead_ct_worker;
+#endif
 };
 
 void intel_guc_ct_init_early(struct intel_guc_ct *ct);
-- 
2.39.1

