Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96FE96996F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B222410E452;
	Tue,  3 Sep 2024 09:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rblb6b2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCD10E452
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725356727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Md4YqyfH6OnnfGUBGnJGP7tmG/KDMn06qYkEJbCOX6E=;
 b=Rblb6b2UQACITocnWbbbInt6lQq5Y6ZSA9Rtd24f+gsJ5VjdDwafjeh3QhRxxdOLWyJdTF
 Zhdb7L3mOmYshVEDhQZu1KkjAJu1SS42/PGkF611vRRfpMks/USLMmD59T/6K2QP1mrCE1
 +X8p6UrPycrDcGGR5R7MQIECSzo+B4g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-rdFPQVEhMya90V42WTWfRg-1; Tue, 03 Sep 2024 05:45:26 -0400
X-MC-Unique: rdFPQVEhMya90V42WTWfRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42c7aa6c13cso24167215e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 02:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725356725; x=1725961525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Md4YqyfH6OnnfGUBGnJGP7tmG/KDMn06qYkEJbCOX6E=;
 b=TNwRHfGnXjpgtzivCV7g2UPQ2HsXQurd5cxs2M03hduaHnVouIOq6fBbym68IklbFK
 akmD/WAI+RA2RmHXCGizli908Z4b6PL8AirXFqfsKwNRpONHFWLZlp/hYHPAon0Zj8xR
 ORxKDEg9PhaW0yCvp95ElFa/ZJE06knLMf+DdpcgpFfLBUW9eA/AeMUol8+mESZWPIPE
 EsqpGSU9KOvYAZQqJ5az9IuU5UOEwXzFXN3DEyQWTccqUuNsgjVG9vbvNtvnzwprefO+
 iy55HQlQBz88pkjExJWDdTNIRoiL9ZtfsnzbdKK6pcm2dfn30x/yL3VPcLhacTa3V0Hj
 9cIw==
X-Gm-Message-State: AOJu0YxL0WEutrDO9PD+fX6dAzxMqLNeEpA2BGZvJElfo8WvNQQL+NuZ
 nVb06+7frSBD355w4qV72rKzs/qgOIk2N+6CugzEmOTpDXo6vnLmPUbUSKJwjLrG1Q1ZnCP0QzT
 O644b5qU9wrpMrqpkFNYNYLHe5Wzu5y59qHzl4XupI3D/yWAEKlwBzy9kRoVCjhcYEg==
X-Received: by 2002:a05:600c:5006:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-42bbb0a909dmr99081065e9.0.1725356725108; 
 Tue, 03 Sep 2024 02:45:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Ud6fZG99UNyJTjNPp3ey1FIBQb11K+Fj2L2yNLjsGXpWsRIKZUoGIY3LDKfc6dWLuosujg==
X-Received: by 2002:a05:600c:5006:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-42bbb0a909dmr99080645e9.0.1725356724038; 
 Tue, 03 Sep 2024 02:45:24 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c7b628dd4sm100705125e9.11.2024.09.03.02.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 02:45:23 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH] drm/sched: Fix teardown leaks with waitqueue
Date: Tue,  3 Sep 2024 11:44:47 +0200
Message-ID: <20240903094446.29797-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

The GPU scheduler currently does not ensure that its pending_list is
empty before performing various other teardown tasks in
drm_sched_fini().

If there are still jobs in the pending_list, this is problematic because
after scheduler teardown, no one will call backend_ops.free_job()
anymore. This would, consequently, result in memory leaks.

One way to solves this is to implement a waitqueue that drm_sched_fini()
blocks on until the pending_list has become empty.

Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once the
pending_list becomes empty. Wait in drm_sched_fini() for that to happen.

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Hi all,

since the scheduler has many stake holders, I want this solution
discussed as an RFC first.

This version here has IMO the advantage (and disadvantage...) that it
blocks infinitly if the driver messed up the clean up, so problems
might become more visible than the refcount solution I proposed in
parallel.

Cheers,
P.
---
 drivers/gpu/drm/scheduler/sched_main.c | 40 ++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h            |  4 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..200fa932f289 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -564,6 +564,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		 * is parked at which point it's safe.
 		 */
 		list_del_init(&job->list);
+
+		/*
+		 * Inform tasks blocking in drm_sched_fini() that it's now safe to proceed.
+		 */
+		if (list_empty(&sched->pending_list))
+			wake_up(&sched->job_list_waitque);
+
 		spin_unlock(&sched->job_list_lock);
 
 		status = job->sched->ops->timedout_job(job);
@@ -584,6 +591,15 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		drm_sched_start_timeout_unlocked(sched);
 }
 
+static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
+{
+	/*
+	 * For list_empty() to work without a lock.
+	 */
+	rmb();
+	return list_empty(&sched->pending_list);
+}
+
 /**
  * drm_sched_stop - stop the scheduler
  *
@@ -659,6 +675,12 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 		}
 	}
 
+	/*
+	 * Inform tasks blocking in drm_sched_fini() that it's now safe to proceed.
+	 */
+	if (drm_sched_no_jobs_pending(sched))
+		wake_up(&sched->job_list_waitque);
+
 	/*
 	 * Stop pending timer in flight as we rearm it in  drm_sched_start. This
 	 * avoids the pending timeout work in progress to fire right away after
@@ -1085,6 +1107,12 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
+		/*
+		 * Inform tasks blocking in drm_sched_fini() that it's now safe to proceed.
+		 */
+		if (list_empty(&sched->pending_list))
+			wake_up(&sched->job_list_waitque);
+
 		/* cancel this job's TO timer */
 		cancel_delayed_work(&sched->work_tdr);
 		/* make the scheduled timestamp more accurate */
@@ -1303,6 +1331,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
+	init_waitqueue_head(&sched->job_list_waitque);
 	atomic_set(&sched->credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
@@ -1333,12 +1362,23 @@ EXPORT_SYMBOL(drm_sched_init);
  * @sched: scheduler instance
  *
  * Tears down and cleans up the scheduler.
+ *
+ * Note that this function blocks until the fences returned by
+ * backend_ops.run_job() have been signalled.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_entity *s_entity;
 	int i;
 
+	/*
+	 * Jobs that have neither been scheduled or which have timed out are
+	 * gone by now, but jobs that have been submitted through
+	 * backend_ops.run_job() and have not yet terminated are still pending.
+	 *
+	 * Wait for the pending_list to become empty to avoid leaking those jobs.
+	 */
+	wait_event(sched->job_list_waitque, drm_sched_no_jobs_pending(sched));
 	drm_sched_wqueue_stop(sched);
 
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..bff092784405 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -29,6 +29,7 @@
 #include <linux/completion.h>
 #include <linux/xarray.h>
 #include <linux/workqueue.h>
+#include <linux/wait.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
@@ -503,6 +504,8 @@ struct drm_sched_backend_ops {
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
  * @job_list_lock: lock to protect the pending_list.
+ * @job_list_waitque: a waitqueue for drm_sched_fini() to block on until all
+ *		      pending jobs have been finished.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
@@ -532,6 +535,7 @@ struct drm_gpu_scheduler {
 	struct delayed_work		work_tdr;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
+	wait_queue_head_t		job_list_waitque;
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
-- 
2.46.0

