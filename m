Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7B9D1BFB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B955C10E59D;
	Mon, 18 Nov 2024 23:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJZ2BAEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F9F10E589;
 Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973050; x=1763509050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vE/DWvj18UUkeQDzMSwfAfb5jQfsXWBL099DaFUoIv0=;
 b=gJZ2BAEjj+djXgJ5rpMcZ2uTsKqM/IhhoTYWfRJctl7jxafsqrGDFx52
 90+4ef2ayKXxwlWfcY3G1Z1tEgojoKFyZWbAytiDshxkHr2c0m0D5//n6
 qYN+qXEr97nsI2dX2m/w30V5BKhOKyT8DVcS9LptBDtF2XId6dPzA1itc
 KLO2kzf8wXqKClMgyU5sTmfcLKc3VeVi/B64iTVBQchcZC4kLb6U8WhMI
 rBxFAAyHDHEkKQeSedOCxmaXHBwYWz6euJkzpTLw7G/577D3Vd8PN7WWt
 wQp+z6YybatHZi5cOSe1CpKObjekHBN14SDtqj5ESARnFsDsYTUsim1n2 A==;
X-CSE-ConnectionGUID: 4Dh34+zySlq5UYX7MUtgfA==
X-CSE-MsgGUID: ZCXsLvouRsSeQSxkggLF4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31879013"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31879013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:30 -0800
X-CSE-ConnectionGUID: jRODvD4ESWWes/WGO2Ozug==
X-CSE-MsgGUID: e03epWlYQrq/muXEinFyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521766"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 25/29] drm/xe: Add a message lock to the Xe GPU scheduler
Date: Mon, 18 Nov 2024 15:37:53 -0800
Message-Id: <20241118233757.2374041-26-matthew.brost@intel.com>
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

Stop abusing job list lock for message, use a dedicated lock. This lock
will soon be able to be taken in IRQ contexts, using irqsave for
simplicity. Can to tweaked in a follow up as needed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 12 ++++--------
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 15 +++++++++------
 4 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 50361b4638f9..55ccfb587523 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -14,25 +14,27 @@ static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
 static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
 {
 	struct xe_sched_msg *msg;
+	unsigned long flags;
 
-	xe_sched_msg_lock(sched);
+	xe_sched_msg_lock(sched, flags);
 	msg = list_first_entry_or_null(&sched->msgs, struct xe_sched_msg, link);
 	if (msg)
 		xe_sched_process_msg_queue(sched);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_unlock(sched, flags);
 }
 
 static struct xe_sched_msg *
 xe_sched_get_msg(struct xe_gpu_scheduler *sched)
 {
 	struct xe_sched_msg *msg;
+	unsigned long flags;
 
-	xe_sched_msg_lock(sched);
+	xe_sched_msg_lock(sched, flags);
 	msg = list_first_entry_or_null(&sched->msgs,
 				       struct xe_sched_msg, link);
 	if (msg)
 		list_del_init(&msg->link);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_unlock(sched, flags);
 
 	return msg;
 }
@@ -64,6 +66,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  struct device *dev)
 {
 	sched->ops = xe_ops;
+	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
 
@@ -98,15 +101,17 @@ void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg)
 {
-	xe_sched_msg_lock(sched);
+	unsigned long flags;
+
+	xe_sched_msg_lock(sched, flags);
 	xe_sched_add_msg_locked(sched, msg);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_unlock(sched, flags);
 }
 
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index c250ea773491..3238de26dcfe 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -29,15 +29,11 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg);
 
-static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
-{
-	spin_lock(&sched->base.job_list_lock);
-}
+#define xe_sched_msg_lock(sched, flags) \
+	spin_lock_irqsave(&sched->msg_lock, flags)
 
-static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
-{
-	spin_unlock(&sched->base.job_list_lock);
-}
+#define xe_sched_msg_unlock(sched, flags) \
+	spin_unlock_irqrestore(&sched->msg_lock, flags)
 
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
 {
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 6731b13da8bb..c8e0352ef941 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
 	struct list_head			msgs;
+	/** @msg_lock: Lock for messages */
+	spinlock_t msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 82071a0ec91e..3efd2000c0a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1704,14 +1704,15 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
+	unsigned long flags;
 
 	if (exec_queue_killed_or_banned_or_wedged(q))
 		return -EINVAL;
 
-	xe_sched_msg_lock(sched);
+	xe_sched_msg_lock(sched, flags);
 	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
 		q->guc->suspend_pending = true;
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_unlock(sched, flags);
 
 	return 0;
 }
@@ -1751,30 +1752,32 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	unsigned long flags;
 
 	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
 
-	xe_sched_msg_lock(sched);
+	xe_sched_msg_lock(sched, flags);
 	guc_exec_queue_try_add_msg(q, msg, RESUME);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_unlock(sched, flags);
 }
 
 static void guc_exec_queue_kill_user(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL_USER;
+	unsigned long flags;
 
 	if (exec_queue_extra_ref(q))
 		return;
 
 	set_exec_queue_banned(q);
 
-	xe_sched_msg_lock(sched);
+	xe_sched_msg_lock(sched, flags);
 	if (guc_exec_queue_try_add_msg(q, msg, KILL_USER)) {
 		set_exec_queue_extra_ref(q);
 		xe_exec_queue_get(q);
 	}
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_unlock(sched, flags);
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
-- 
2.34.1

