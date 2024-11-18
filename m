Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5539D1BE3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8315E10E569;
	Mon, 18 Nov 2024 23:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6pVmwhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6112110E040;
 Mon, 18 Nov 2024 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973044; x=1763509044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ay6A70QWOSeOFEkh6hckt8gFzr/HHR3I+sf1nUFsfbY=;
 b=e6pVmwhNbHrFBJjfIduxAd2WEalKGwH2lny3kIkxw04NEbRnuZ5c/q0Q
 EQhqkCJ57cuspYeO4n8t/PHv/3RtS0nUa3/EdYvUYSjmcloKx1VBti+br
 cVpvQmGHCruJIIgkzUo1BYmjyBweczfT48lgpRI43BKErSDiFGi1a7608
 QpwG7OqSuHKezqJIUCmQgV3YeKQkQnAvgRPMMC8R0JHTf0XvSnORIHzJ1
 S5ACqTQLFI/SwAXZkZ8tHJyJYPEn7NfijvHJNFHRI7mGiRAZ8MRV6ZpYI
 fKj6yJ14IwfS+XImz+vaeIR1DzP7ShLEa6jBLhdh7m/aMSMtKxEwW87b3 Q==;
X-CSE-ConnectionGUID: ZdNPvipyTF2kk7zxFctR0g==
X-CSE-MsgGUID: PSFOmK1nRp6dSfQrWRd23A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878869"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
X-CSE-ConnectionGUID: z2lLjAT2SfqNVCTX/tSUvA==
X-CSE-MsgGUID: /Oa5n3TJSAyJsyprwKuZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521683"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 04/29] drm/xe: Allocate doorbells for UMD exec queues
Date: Mon, 18 Nov 2024 15:37:32 -0800
Message-Id: <20241118233757.2374041-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

These will be mapped to user space for UMD submission. Add
infrastructure to GuC submission backend to manage these.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   7 ++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 107 +++++++++++++++++--
 3 files changed, 106 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6c..7f68587d4021 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -83,6 +83,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+/* queue used for UMD submission */
+#define EXEC_QUEUE_FLAG_UMD_SUBMISSION		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 4c39f01e4f52..2d53af75ed75 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -47,6 +47,13 @@ struct xe_guc_exec_queue {
 	u16 id;
 	/** @suspend_wait: wait queue used to wait on pending suspends */
 	wait_queue_head_t suspend_wait;
+	/** @db: doorbell state */
+	struct {
+		/** @db.id: doorbell ID */
+		int id;
+		/** @db.dpa: doorbell device physical address */
+		u64 dpa;
+	} db;
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 58a3f4bb3887..cc7a98c1343e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -29,6 +29,7 @@
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_db_mgr.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_id_mgr.h"
 #include "xe_guc_submit_types.h"
@@ -67,6 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
 #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
+#define EXEC_QUEUE_STATE_DB_REGISTERED		(1 << 12)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -218,6 +220,16 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
 }
 
+static bool exec_queue_doorbell_registered(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_DB_REGISTERED;
+}
+
+static void set_exec_queue_doorbell_registered(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_DB_REGISTERED, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -354,13 +366,6 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	return ret;
 }
 
-static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	mutex_lock(&guc->submission_state.lock);
-	__release_guc_id(guc, q, q->width);
-	mutex_unlock(&guc->submission_state.lock);
-}
-
 struct exec_queue_policy {
 	u32 count;
 	struct guc_update_exec_queue_policy h2g;
@@ -1238,7 +1243,13 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
-	release_guc_id(guc, q);
+
+	mutex_lock(&guc->submission_state.lock);
+	if (q->guc->db.id >= 0)
+		xe_guc_db_mgr_release_id_locked(&guc->dbm, q->guc->db.id);
+	__release_guc_id(guc, q, q->width);
+	mutex_unlock(&guc->submission_state.lock);
+
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
 
@@ -1273,6 +1284,8 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	guc_exec_queue_fini_async(q);
 }
 
+static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id);
+
 static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
@@ -1281,6 +1294,9 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
+	if (exec_queue_doorbell_registered(q))
+		deallocate_doorbell(guc, q->guc->id);
+
 	if (exec_queue_registered(q))
 		disable_scheduling_deregister(guc, q);
 	else
@@ -1399,6 +1415,53 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	xe_pm_runtime_put(xe);
 }
 
+static int allocate_doorbell(struct xe_guc *guc, u16 guc_id, int doorbell_id,
+			     u64 gpa)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_ALLOCATE_DOORBELL,
+		guc_id,
+		doorbell_id,
+		lower_32_bits(gpa),
+		upper_32_bits(gpa),
+		0,
+	};
+
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_DEALLOCATE_DOORBELL,
+		guc_id
+	};
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+#define GUC_MMIO_DB_BAR_OFFSET SZ_4M
+
+static int create_doorbell(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	int ret;
+
+	set_exec_queue_doorbell_registered(q);
+	xe_guc_submit_reset_wait(guc);
+
+	q->guc->db.dpa = GUC_MMIO_DB_BAR_OFFSET + PAGE_SIZE * q->guc->db.id;
+	register_exec_queue(q);
+	enable_scheduling(q);
+
+	ret = allocate_doorbell(guc, q->guc->id, q->guc->db.id, q->guc->db.dpa);
+	if (ret) {
+		disable_scheduling_deregister(guc, q);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_sched_backend_ops drm_sched_ops = {
 	.run_job = guc_exec_queue_run_job,
 	.free_job = guc_exec_queue_free_job,
@@ -1415,7 +1478,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_guc_exec_queue *ge;
 	long timeout;
-	int err, i;
+	int err, i, db_id = 0;
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -1458,14 +1521,35 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (xe_guc_read_stopped(guc))
 		xe_sched_stop(sched);
 
+	q->guc->db.id = -1;
+	if (q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION) {
+		db_id = xe_guc_db_mgr_reserve_id_locked(&guc->dbm);
+		if (db_id < 0) {
+			err = db_id;
+			goto err_id;
+		}
+	}
+
 	mutex_unlock(&guc->submission_state.lock);
 
+	if (q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION) {
+		q->guc->db.id = db_id;
+		err = create_doorbell(guc, q);
+		if (err)
+			goto err_db;
+	}
+
 	xe_exec_queue_assign_name(q, q->guc->id);
 
 	trace_xe_exec_queue_create(q);
 
 	return 0;
 
+err_db:
+	mutex_lock(&guc->submission_state.lock);
+	xe_guc_db_mgr_release_id_locked(&guc->dbm, q->guc->db.id);
+err_id:
+	__release_guc_id(guc, q, q->width);
 err_entity:
 	mutex_unlock(&guc->submission_state.lock);
 	xe_sched_entity_fini(&ge->entity);
@@ -1699,7 +1783,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		bool ban = false;
 
-		if (job) {
+		if (exec_queue_doorbell_registered(q)) {
+			/* TODO: Ban via UMD shim too */
+			ban = true;
+		} else if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
-- 
2.34.1

