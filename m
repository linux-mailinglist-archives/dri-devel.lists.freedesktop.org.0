Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4514287B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 11:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005616E8C1;
	Mon, 20 Jan 2020 10:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597856E8C1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 10:51:25 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1itUeO-0000Bu-Vz; Mon, 20 Jan 2020 11:51:20 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: [PATCH] drm/scheduler: fix inconsistent locking of job_list_lock
Date: Mon, 20 Jan 2020 11:51:19 +0100
Message-Id: <20200120105119.10237-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1db8c142b6c5 (drm/scheduler: Add drm_sched_suspend/resume_timeout()) made
the job_list_lock IRQ safe in as the suspend/resume calls were expected to
be called from IRQ context. This usage never materialized in upstream.
Instead amdgpu started locking the job_list_lock in an IRQ unsafe way in
amdgpu_ib_preempt_mark_partial_job() and amdgpu_ib_preempt_job_recovery(),
which leads to potential deadlock if one would actually start to call the
drm_sched_suspend/resume_timeout functions from IRQ context.

As no current user needs the locking to be IRQ safe, the local IRQ
disable/enable is pure overhead. Fix the inconsistent locking by changing
all uses of job_list_lock to use the IRQ unsafe locking primitives.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/scheduler/sched_main.c | 38 ++++++++++----------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3c57e84222ca..d1b24444dd99 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -220,8 +220,7 @@ EXPORT_SYMBOL(drm_sched_fault);
  *
  * Suspend the delayed work timeout for the scheduler. This is done by
  * modifying the delayed work timeout to an arbitrary large value,
- * MAX_SCHEDULE_TIMEOUT in this case. Note that this function can be
- * called from an IRQ context.
+ * MAX_SCHEDULE_TIMEOUT in this case.
  *
  * Returns the timeout remaining
  *
@@ -250,43 +249,39 @@ EXPORT_SYMBOL(drm_sched_suspend_timeout);
  * @sched: scheduler instance for which to resume the timeout
  * @remaining: remaining timeout
  *
- * Resume the delayed work timeout for the scheduler. Note that
- * this function can be called from an IRQ context.
+ * Resume the delayed work timeout for the scheduler.
  */
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 		unsigned long remaining)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&sched->job_list_lock, flags);
+	spin_lock(&sched->job_list_lock);
 
 	if (list_empty(&sched->ring_mirror_list))
 		cancel_delayed_work(&sched->work_tdr);
 	else
 		mod_delayed_work(system_wq, &sched->work_tdr, remaining);
 
-	spin_unlock_irqrestore(&sched->job_list_lock, flags);
+	spin_unlock(&sched->job_list_lock);
 }
 EXPORT_SYMBOL(drm_sched_resume_timeout);
 
 static void drm_sched_job_begin(struct drm_sched_job *s_job)
 {
 	struct drm_gpu_scheduler *sched = s_job->sched;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sched->job_list_lock, flags);
+	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->node, &sched->ring_mirror_list);
 	drm_sched_start_timeout(sched);
-	spin_unlock_irqrestore(&sched->job_list_lock, flags);
+	spin_unlock(&sched->job_list_lock);
 }
 
 static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
-	unsigned long flags;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
+
 	job = list_first_entry_or_null(&sched->ring_mirror_list,
 				       struct drm_sched_job, node);
 
@@ -303,9 +298,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		}
 	}
 
-	spin_lock_irqsave(&sched->job_list_lock, flags);
+	spin_lock(&sched->job_list_lock);
 	drm_sched_start_timeout(sched);
-	spin_unlock_irqrestore(&sched->job_list_lock, flags);
+	spin_unlock(&sched->job_list_lock);
 }
 
  /**
@@ -368,7 +363,6 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
-	unsigned long flags;
 
 	kthread_park(sched->thread);
 
@@ -388,9 +382,9 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 			 * remove job from ring_mirror_list.
 			 * Locking here is for concurrent resume timeout
 			 */
-			spin_lock_irqsave(&sched->job_list_lock, flags);
+			spin_lock(&sched->job_list_lock);
 			list_del_init(&s_job->node);
-			spin_unlock_irqrestore(&sched->job_list_lock, flags);
+			spin_unlock(&sched->job_list_lock);
 
 			/*
 			 * Wait for job's HW fence callback to finish using s_job
@@ -433,7 +427,6 @@ EXPORT_SYMBOL(drm_sched_stop);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 {
 	struct drm_sched_job *s_job, *tmp;
-	unsigned long flags;
 	int r;
 
 	/*
@@ -462,9 +455,9 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 	}
 
 	if (full_recovery) {
-		spin_lock_irqsave(&sched->job_list_lock, flags);
+		spin_lock(&sched->job_list_lock);
 		drm_sched_start_timeout(sched);
-		spin_unlock_irqrestore(&sched->job_list_lock, flags);
+		spin_unlock(&sched->job_list_lock);
 	}
 
 	kthread_unpark(sched->thread);
@@ -648,7 +641,6 @@ static struct drm_sched_job *
 drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job;
-	unsigned long flags;
 
 	/*
 	 * Don't destroy jobs while the timeout worker is running  OR thread
@@ -659,7 +651,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	    __kthread_should_park(sched->thread))
 		return NULL;
 
-	spin_lock_irqsave(&sched->job_list_lock, flags);
+	spin_lock(&sched->job_list_lock);
 
 	job = list_first_entry_or_null(&sched->ring_mirror_list,
 				       struct drm_sched_job, node);
@@ -673,7 +665,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 		drm_sched_start_timeout(sched);
 	}
 
-	spin_unlock_irqrestore(&sched->job_list_lock, flags);
+	spin_unlock(&sched->job_list_lock);
 
 	return job;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
