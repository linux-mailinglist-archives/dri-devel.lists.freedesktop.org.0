Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC942969973
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A4B10E454;
	Tue,  3 Sep 2024 09:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JDd8SnBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F79010E454
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725356790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hfPqtV/kE0emxjHSqrcPT251LjHCu9jPean4uiHZO7k=;
 b=JDd8SnBjR2d3Pd7opPE2gZI4m1+hqcbA1oIyyCEElunFRU0QIEcqClOPaeGXQU+D5gffCJ
 dUO00DAylcnno9npswSC/rz5JqVctt7qU0fN1s4o4hftLXPU78LOOeNLr6QmdUa3AX8jr1
 JKO/Pcrvm8+e1g0xqyAMaoL8exzEcJI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-ijm_fX6pPLO-eOB6gfA2Ug-1; Tue, 03 Sep 2024 05:46:28 -0400
X-MC-Unique: ijm_fX6pPLO-eOB6gfA2Ug-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-456839e663cso61474521cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 02:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725356788; x=1725961588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hfPqtV/kE0emxjHSqrcPT251LjHCu9jPean4uiHZO7k=;
 b=artfP8QB7JXAcpfl/vfBatfBNFAIxGjWCUqEbugPldF2hNTcvqjhCt8FbFHWQKRrkw
 P7vjMS4IM9bCN8mXCot0sqpBXfLrc/M/KKJAWDWPQqohtVcpKSh0FOzx6kYTI3WAq5DG
 sWJC82bZur9sMtM1g+CA6PouoIGttIo/tkjrAR8izCvJSgHgpDF/iXT5edUze9Wh15tb
 lV+SgNxSCJLHSksyqClR7WxtSGJRtiKBkF0MDEQdvYWM3nqwM7ui1qaSu8K/VAgea81e
 z6VtqZUucnOpRBpMhjfrSFBD3FJnBFjSxvEkpLl8KqkMbNF3NdVIOH+0gvOxcgs+F7bf
 XAaA==
X-Gm-Message-State: AOJu0YxYZcemlnL/jZ1j7wGbSRdbJIHqud3o9OoTeG0QAv2+/xiuBUWM
 RKivRcOd7ww5Zw30qcJ/bShQA/h1+2H+n5uwTE/WDLB/C4RChhL3rKv1lqPi2w90TNQzrW/l/xu
 ZEdxQjN4GpkR0WwZIEdUPjVYzdU4COA32c8VU2l+nvDiE2nHjEeL6WDxzhRRbqwNLFg==
X-Received: by 2002:a05:6214:5f0f:b0:6c3:6a89:37e7 with SMTP id
 6a1803df08f44-6c3c629bfa5mr26855466d6.22.1725356788144; 
 Tue, 03 Sep 2024 02:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwf4goexew3ZEXrz2VkLN/ph9GuyXW2mpOFNkkxoudCwNOm9FKDVrNrmCnDDhWa3/jitQzuw==
X-Received: by 2002:a05:6214:5f0f:b0:6c3:6a89:37e7 with SMTP id
 6a1803df08f44-6c3c629bfa5mr26855366d6.22.1725356787721; 
 Tue, 03 Sep 2024 02:46:27 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c50f78c649sm5978946d6.130.2024.09.03.02.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 02:46:27 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH] drm/sched: Fix teardown leaks with refcounting
Date: Tue,  3 Sep 2024 11:45:32 +0200
Message-ID: <20240903094531.29893-2-pstanner@redhat.com>
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

One way to solves this is to implement reference counting for struct
drm_gpu_scheduler itself. Each job added to the pending_list takes a
reference, each one removed drops a reference.

This approach would keep the scheduler running even after users have
called drm_sched_fini(), and it would ultimately stop after the last job
has been removed from pending_list.

Add reference counting to struct drm_gpu_scheduler. Move the teardown
logic to __drm_sched_fini() and have drm_sched_fini() just also drop a
reference.

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Hi all,

since the scheduler has many stake holders, I want this solution
discussed as an RFC first.

The advantage of this version would be that it does not block
drm_sched_fini(), but the price paid for that is that the scheduler
keeps running until all jobs are gone.

Cheers,
P.
---
 drivers/gpu/drm/scheduler/sched_main.c | 17 ++++++++++++++++-
 include/drm/gpu_scheduler.h            |  5 +++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..62b453c8ed76 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -99,6 +99,8 @@ int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
 module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
+static void __drm_sched_fini(struct kref *jobs_remaining);
+
 static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
@@ -540,6 +542,7 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
+	kref_get(&sched->jobs_remaining);
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
@@ -564,6 +567,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		 * is parked at which point it's safe.
 		 */
 		list_del_init(&job->list);
+		kref_put(&sched->jobs_remaining, __drm_sched_fini);
 		spin_unlock(&sched->job_list_lock);
 
 		status = job->sched->ops->timedout_job(job);
@@ -637,6 +641,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 			 */
 			spin_lock(&sched->job_list_lock);
 			list_del_init(&s_job->list);
+			kref_put(&sched->jobs_remaining, __drm_sched_fini);
 			spin_unlock(&sched->job_list_lock);
 
 			/*
@@ -1084,6 +1089,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
+		kref_put(&sched->jobs_remaining, __drm_sched_fini);
 
 		/* cancel this job's TO timer */
 		cancel_delayed_work(&sched->work_tdr);
@@ -1303,6 +1309,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
+	kref_init(&sched->jobs_remaining);
 	atomic_set(&sched->credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
@@ -1334,11 +1341,14 @@ EXPORT_SYMBOL(drm_sched_init);
  *
  * Tears down and cleans up the scheduler.
  */
-void drm_sched_fini(struct drm_gpu_scheduler *sched)
+static void __drm_sched_fini(struct kref *jobs_remaining)
 {
+	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *s_entity;
 	int i;
 
+	sched = container_of(jobs_remaining, struct drm_gpu_scheduler, jobs_remaining);
+
 	drm_sched_wqueue_stop(sched);
 
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
@@ -1368,6 +1378,11 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
 }
+
+void drm_sched_fini(struct drm_gpu_scheduler *sched)
+{
+	kref_put(&sched->jobs_remaining, __drm_sched_fini);
+}
 EXPORT_SYMBOL(drm_sched_fini);
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..b7fad8294861 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -29,6 +29,7 @@
 #include <linux/completion.h>
 #include <linux/xarray.h>
 #include <linux/workqueue.h>
+#include <linux/kref.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
@@ -495,6 +496,9 @@ struct drm_sched_backend_ops {
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @job_id_count: used to assign unique id to the each job.
+ * @jobs_remaining: submitted jobs take a refcount of the scheduler to prevent it
+ *		    from terminating before the last job has been removed from
+ *		    @pending_list.
  * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
  * @work_run_job: work which calls run_job op of each scheduler.
@@ -525,6 +529,7 @@ struct drm_gpu_scheduler {
 	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
+	struct kref			jobs_remaining;
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
 	struct work_struct		work_run_job;
-- 
2.46.0

