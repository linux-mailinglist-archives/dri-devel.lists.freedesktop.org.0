Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC52A288FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 12:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BCB10E1C2;
	Wed,  5 Feb 2025 11:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MR2WgcBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6077A10E1C2;
 Wed,  5 Feb 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D45MwBPPIkhSvy7G5xpED6qYbmXxarNg3NB8E7npGg0=; b=MR2WgcBdxBaIe021kie7isTlfP
 TTshKn1TtHCvOhGWc/KcfwsF046v8vj+wOblrdg3bLnxRnjtbtjsLwm6Y/iG2I2W3UgCltaX2musv
 Cno03HwC1Ic6juts/d2UJxVXreKRSXM6S7Sju2tHT+h1B3WlMEU/tC/n1f11xqa31PpiM/G7uRMh5
 3lVNPb9kQRNpT6enARSmsBYer4AXmMaidNccBNTv9tV7HswpZmelgBBPgIT26uZ6D+EGl73VAQ9k1
 4VzHxuo374CmChmKB7/eRLMdmVz4UhDxPCSgxdUFVuIfP+jD0AOoRIeJC9RiYGc2EY96DVeeh+iFv
 Xdzs8y/g==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tfdMQ-003vSo-EO; Wed, 05 Feb 2025 12:14:32 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: [RFC] drm/scheduler: Remove mention of TDR from scheduler API
Date: Wed,  5 Feb 2025 11:14:27 +0000
Message-ID: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Christian suggests scheduler should not use the term TDR because it only
can do basic timeout detection on it's own, not the full blown timeout-
detection-and-recovery (TDR) as the term is generally understood.

Attempt to rename it to a more basic drm_sched_trigger_timeout.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
---
While doing this I have however noticed the pre-existing drm_sched_fault
API sitting right below drm_sched_tdr_queue_imm() added by
3c6c7ca4508b ("drm/sched: Add a helper to queue TDR immediately").

It does not appear to be documented in the kernel doc why is the
newer API setting sched->timeout permanently to zero, or why are
both needed and what are the considerations to use one versus the
other. Perhaps Matt can clarify as the author of the newer API.
---
 drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_gpu_scheduler.h  |  4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c     |  8 +++----
 include/drm/gpu_scheduler.h            |  8 +++----
 4 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a48be16ab84f..b01792fe6141 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -433,7 +433,8 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
+				 sched->timeout);
 }
 
 static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
@@ -444,20 +445,20 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_tdr_queue_imm: - immediately start job timeout handler
+ * drm_sched_trigger_timeout: - immediately start job timeout handler
  *
  * @sched: scheduler for which the timeout handling should be started.
  *
  * Start timeout handling immediately for the named scheduler.
  */
-void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
+void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched)
 {
 	spin_lock(&sched->job_list_lock);
 	sched->timeout = 0;
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
-EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
+EXPORT_SYMBOL(drm_sched_trigger_timeout);
 
 /**
  * drm_sched_fault - immediately start timeout handler
@@ -469,7 +470,7 @@ EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
 void drm_sched_fault(struct drm_gpu_scheduler *sched)
 {
 	if (sched->timeout_wq)
-		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
+		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, 0);
 }
 EXPORT_SYMBOL(drm_sched_fault);
 
@@ -489,14 +490,15 @@ unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched)
 {
 	unsigned long sched_timeout, now = jiffies;
 
-	sched_timeout = sched->work_tdr.timer.expires;
+	sched_timeout = sched->work_timeout.timer.expires;
 
 	/*
 	 * Modify the timeout to an arbitrarily large value. This also prevents
 	 * the timeout to be restarted when new submissions arrive
 	 */
-	if (mod_delayed_work(sched->timeout_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
-			&& time_after(sched_timeout, now))
+	if (mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
+			     MAX_SCHEDULE_TIMEOUT) &&
+	    time_after(sched_timeout, now))
 		return sched_timeout - now;
 	else
 		return sched->timeout;
@@ -517,9 +519,9 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 	spin_lock(&sched->job_list_lock);
 
 	if (list_empty(&sched->pending_list))
-		cancel_delayed_work(&sched->work_tdr);
+		cancel_delayed_work(&sched->work_timeout);
 	else
-		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, remaining);
+		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, remaining);
 
 	spin_unlock(&sched->job_list_lock);
 }
@@ -541,7 +543,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	struct drm_sched_job *job;
 	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
 
-	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
+	sched = container_of(work, struct drm_gpu_scheduler, work_timeout.work);
 
 	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
@@ -659,7 +661,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 * this TDR finished and before the newly restarted jobs had a
 	 * chance to complete.
 	 */
-	cancel_delayed_work(&sched->work_tdr);
+	cancel_delayed_work(&sched->work_timeout);
 }
 EXPORT_SYMBOL(drm_sched_stop);
 
@@ -1107,7 +1109,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 		list_del_init(&job->list);
 
 		/* cancel this job's TO timer */
-		cancel_delayed_work(&sched->work_tdr);
+		cancel_delayed_work(&sched->work_timeout);
 		/* make the scheduled timestamp more accurate */
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
@@ -1325,7 +1327,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->credit_count, 0);
-	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
+	INIT_DELAYED_WORK(&sched->work_timeout, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
@@ -1395,7 +1397,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	wake_up_all(&sched->job_scheduled);
 
 	/* Confirm no work left behind accessing device structures */
-	cancel_delayed_work_sync(&sched->work_tdr);
+	cancel_delayed_work_sync(&sched->work_timeout);
 
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index c250ea773491..3fd728b1bfd6 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -44,9 +44,9 @@ static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
 	drm_sched_stop(&sched->base, NULL);
 }
 
-static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
+static inline void xe_sched_trigger_timeout(struct xe_gpu_scheduler *sched)
 {
-	drm_sched_tdr_queue_imm(&sched->base);
+	drm_sched_trigger_timeout(&sched->base);
 }
 
 static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..968709fd6db4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -778,7 +778,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
-		xe_sched_tdr_queue_imm(sched);
+		xe_sched_trigger_timeout(sched);
 		return;
 	}
 
@@ -807,7 +807,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
 	else
-		xe_sched_tdr_queue_imm(&q->guc->sched);
+		xe_sched_trigger_timeout(&q->guc->sched);
 }
 
 /**
@@ -986,7 +986,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
-		xe_sched_tdr_queue_imm(&q->guc->sched);
+		xe_sched_trigger_timeout(&q->guc->sched);
 	}
 }
 
@@ -1144,7 +1144,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
-			xe_sched_tdr_queue_imm(sched);
+			xe_sched_trigger_timeout(sched);
 			goto rearm;
 		}
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index cf88f2bd020f..666968cf505d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -494,10 +494,10 @@ struct drm_sched_backend_ops {
  *                 finished.
  * @job_id_count: used to assign unique id to the each job.
  * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
- * @timeout_wq: workqueue used to queue @work_tdr
+ * @timeout_wq: workqueue used to queue @work_timeout
  * @work_run_job: work which calls run_job op of each scheduler.
  * @work_free_job: work which calls free_job op of each scheduler.
- * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
+ * @work_timeout: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
  * @job_list_lock: lock to protect the pending_list.
@@ -527,7 +527,7 @@ struct drm_gpu_scheduler {
 	struct workqueue_struct		*timeout_wq;
 	struct work_struct		work_run_job;
 	struct work_struct		work_free_job;
-	struct delayed_work		work_tdr;
+	struct delayed_work		work_timeout;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
@@ -571,7 +571,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
-void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
+void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
-- 
2.48.0

