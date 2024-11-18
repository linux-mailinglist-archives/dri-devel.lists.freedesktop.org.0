Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0B9D1BEE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434D10E58D;
	Mon, 18 Nov 2024 23:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGolGYUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCE610E584;
 Mon, 18 Nov 2024 23:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973049; x=1763509049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KSwdYjxf8PXwMIB2tQPack53L/KWH/z20YDuNNF5+gY=;
 b=YGolGYUIA0KlS1sjyiNw4bk27Lce/hdcZPxUxmrg/jgUu9AiZhRrX4LT
 mApyUh7GwjR0A0eZNXlzvTrHsC8G+aEeXgAL9FNHH7K2Tafyv3fic/U8N
 qGfTGaLJjYMyZqsgawRzPOeNxKpGle9rw8MqotvVsXYPFaLn83Hr6Lhoh
 iKW17tGb6M/X3Vdtj4F7T3w4NRP0nuQkwgIf5sNPRX4Zp8uGZ7SEKzVHd
 G9imvqA6F7VvZ+PsOpijYeFOEBin6vVqEGNVSX8nagGay3NqT0bAcz50d
 yYUMU6+yEOX4PDZ2x4oOuEwLJ+1wJCR/QhSNV6V/ELy8lkKFreVLUddPD Q==;
X-CSE-ConnectionGUID: +h39/CaTTp2PmkAAaz5WwA==
X-CSE-MsgGUID: k7PXYSGCSDWfTNFf7DS+aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878979"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878979"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
X-CSE-ConnectionGUID: qagDw0mgSiu0LYh/NOLwtw==
X-CSE-MsgGUID: F9p/60siQsOdSKfi1Wqo9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521747"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 20/29] drm/xe: Teach GuC backend to kill usermap queues
Date: Mon, 18 Nov 2024 15:37:48 -0800
Message-Id: <20241118233757.2374041-21-matthew.brost@intel.com>
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

Usermap exec queue's teardown (kill) differs from other exec queues as
no job is available, a doorbell is mapped, and the kill should be
immediate.

A follow up could unify LR queue cleanup with usermap but keeping this
a seperate flow for now.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 56 +++++++++++++++++++-
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 2d53af75ed75..c6c58e414b19 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -29,7 +29,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	3
+#define MAX_STATIC_MSG_TYPE	4
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @lr_tdr: long running TDR worker */
 	struct work_struct lr_tdr;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 59d2e08797f5..82071a0ec91e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -230,6 +230,11 @@ static void set_exec_queue_doorbell_registered(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_DB_REGISTERED, &q->guc->state);
 }
 
+static void clear_exec_queue_doorbell_registered(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_DB_REGISTERED, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -798,6 +803,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
+static void guc_exec_queue_kill_user(struct xe_exec_queue *q);
+
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -806,7 +813,9 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
 	wake_up_all(&xe->ufence_wq);
 
-	if (xe_exec_queue_is_lr(q))
+	if (xe_exec_queue_is_usermap(q))
+		guc_exec_queue_kill_user(q);
+	else if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
 	else
 		xe_sched_tdr_queue_imm(&q->guc->sched);
@@ -1294,8 +1303,10 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
-	if (exec_queue_doorbell_registered(q))
+	if (exec_queue_doorbell_registered(q)) {
+		clear_exec_queue_doorbell_registered(q);
 		deallocate_doorbell(guc, q->guc->id);
+	}
 
 	if (exec_queue_registered(q))
 		disable_scheduling_deregister(guc, q);
@@ -1382,10 +1393,29 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 	}
 }
 
+static void __guc_exec_queue_process_msg_kill_user(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	if (!xe_lrc_ring_is_idle(q->lrc[0]))
+		xe_gt_dbg(q->gt, "Killing non-idle usermap queue: guc_id=%d",
+			  q->guc->id);
+
+	if (exec_queue_doorbell_registered(q)) {
+		clear_exec_queue_doorbell_registered(q);
+		deallocate_doorbell(guc, q->guc->id);
+	}
+
+	if (exec_queue_registered(q))
+		disable_scheduling_deregister(guc, q);
+}
+
 #define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS	2
 #define SUSPEND		3
 #define RESUME		4
+#define KILL_USER	5
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 
@@ -1408,6 +1438,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case RESUME:
 		__guc_exec_queue_process_msg_resume(msg);
 		break;
+	case KILL_USER:
+		__guc_exec_queue_process_msg_kill_user(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -1600,6 +1633,7 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 #define STATIC_MSG_CLEANUP	0
 #define STATIC_MSG_SUSPEND	1
 #define STATIC_MSG_RESUME	2
+#define STATIC_MSG_KILL_USER	3
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
@@ -1725,6 +1759,24 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	xe_sched_msg_unlock(sched);
 }
 
+static void guc_exec_queue_kill_user(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL_USER;
+
+	if (exec_queue_extra_ref(q))
+		return;
+
+	set_exec_queue_banned(q);
+
+	xe_sched_msg_lock(sched);
+	if (guc_exec_queue_try_add_msg(q, msg, KILL_USER)) {
+		set_exec_queue_extra_ref(q);
+		xe_exec_queue_get(q);
+	}
+	xe_sched_msg_unlock(sched);
+}
+
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
-- 
2.34.1

