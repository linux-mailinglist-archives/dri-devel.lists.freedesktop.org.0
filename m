Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902067D868D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 18:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9F310E834;
	Thu, 26 Oct 2023 16:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BED10E834
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698336881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TG3Ocel/nLF32W+VjpcmAxIbCBAfoHpLGJozin+LaD8=;
 b=FVbRWF0M0pC7gZooIMT9Naa06uJb1+vPdczsFXYrz8QQ39OC1pzSFJo5MU8r+ZrUUZZiTg
 jfOdewsBid3GOIyTgRJ/hOeQqgNrtzK6wxJFJqhx5e7XcQ6vGNUV/pLeHd9dB2dGiM4C0R
 GpfSTY35eu/ItVR1G38c1LWJMG4tEwI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-_nKYRIR4N_SaMu-N_LmMLA-1; Thu, 26 Oct 2023 12:14:37 -0400
X-MC-Unique: _nKYRIR4N_SaMu-N_LmMLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32da87eac93so482321f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698336876; x=1698941676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TG3Ocel/nLF32W+VjpcmAxIbCBAfoHpLGJozin+LaD8=;
 b=Tud0mnZSMKDoJgtWQaMaJMbyNsUGz96mjC4LOcv5AzF24b3gHXRZZCtP0csA75WXAj
 dgrn+BS5Kn5p4t4FEm9qaADO/lgd13XwMbCJJ9ojZ1T1UUulhnCVCD1IGtNjcyPmXzbl
 VWtvV89HDagKM5/bBQbomSTgsKJDBlhnmd9Ocnx88StZDvo01UT3CoGAAC9hdDcUYjLT
 qrWgWtUaZMwCd9vg3dWs53PemjQ+zoXem6xQZ4mc8pvTNj45HdGq3RtGTu4LVMFjJt39
 ebvVQy0V1mAbCmi+zqSZyZdG4SpiKOYCJlOSViklT98hjdAVjnTz0BQp6sxUI65peyvE
 iMbA==
X-Gm-Message-State: AOJu0YzQqjKYtgovl3M3kUnUuaTYGzWB1+1SHTIiBo6hJLavIyoUJmPx
 40Juo6tR8JQaWsBIYt8OcAKUxdrU4nsKbuo6rxXATlKpiAOPMljAv3EnlvgtISJnxmYKLVKQZCn
 ySp7PkZ3D3Sv3xDEoHgiphaFkAYDl
X-Received: by 2002:a05:6000:1ce:b0:31f:f753:5897 with SMTP id
 t14-20020a05600001ce00b0031ff7535897mr72278wrx.59.1698336876195; 
 Thu, 26 Oct 2023 09:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQaNzdFYUQZuJNMctsX19g73EWqaINU0zuG0BE9jSNwpFvPD/pr9spfEaTsx8iQV8LgYBa3w==
X-Received: by 2002:a05:6000:1ce:b0:31f:f753:5897 with SMTP id
 t14-20020a05600001ce00b0031ff7535897mr72246wrx.59.1698336875640; 
 Thu, 26 Oct 2023 09:14:35 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b0032d09f7a713sm14549521wrt.18.2023.10.26.09.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 09:14:35 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net, luben.tuikov@amd.com
Subject: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow control
Date: Thu, 26 Oct 2023 18:13:00 +0200
Message-ID: <20231026161431.5934-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, job flow control is implemented simply by limiting the number
of jobs in flight. Therefore, a scheduler is initialized with a credit
limit that corresponds to the number of jobs which can be sent to the
hardware.

This implies that for each job, drivers need to account for the maximum
job size possible in order to not overflow the ring buffer.

However, there are drivers, such as Nouveau, where the job size has a
rather large range. For such drivers it can easily happen that job
submissions not even filling the ring by 1% can block subsequent
submissions, which, in the worst case, can lead to the ring run dry.

In order to overcome this issue, allow for tracking the actual job size
instead of the number of jobs. Therefore, add a field to track a job's
credit count, which represents the number of credits a job contributes
to the scheduler's credit limit.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in V2:
==============
  - fixed up influence on scheduling fairness due to consideration of a job's
    size
    - If we reach a ready entity in drm_sched_select_entity() but can't actually
      queue a job from it due to size limitations, just give up and go to sleep
      until woken up due to a pending job finishing, rather than continue to try
      other entities.
  - added a callback to dynamically update a job's credits (Boris)
  - renamed 'units' to 'credits'
  - fixed commit message and comments as requested by Luben

Changes in V3:
==============
  - rebased onto V7 of the "DRM scheduler changes for Xe" series by Matt
  - move up drm_sched_can_queue() instead of adding a forward declaration
    (Boris)
  - add a drm_sched_available_credits() helper (Boris)
  - adjust control flow in drm_sched_rq_select_entity_fifo() to Luben's proposal
  - re-phrase a few comments and fix a typo (Luben)
  - change naming of all structures credit fields and function parameters to the
    following scheme
    - drm_sched_job::credits
    - drm_gpu_scheduler::credit_limit
    - drm_gpu_scheduler::credit_count
    - drm_sched_init(..., u32 credit_limit, ...)
    - drm_sched_job_init(..., u32 credits, ...)
  - add proper documentation for the scheduler's job-flow control mechanism

This patch is based on V7 of the "DRM scheduler changes for Xe" series. [1]
provides a branch based on drm-misc-next, with the named series and this patch
on top of it.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/sched-credits/
---
 Documentation/gpu/drm-mm.rst                  |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
 drivers/gpu/drm/lima/lima_sched.c             |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 142 ++++++++++++++----
 drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
 include/drm/gpu_scheduler.h                   |  33 +++-
 12 files changed, 152 insertions(+), 49 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 602010cb6894..acc5901ac840 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -552,6 +552,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Overview
 
+Flow Control
+------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Flow Control
+
 Scheduler Function References
 -----------------------------
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1f357198533f..62bb7fc7448a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (!entity)
 		return 0;
 
-	return drm_sched_job_init(&(*job)->base, entity, owner);
+	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
 }
 
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 2416c526f9b0..3d0f8d182506 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&submit->sched_job,
 				 &ctx->sched_entity[args->pipe],
-				 submit->ctx);
+				 1, submit->ctx);
 	if (ret)
 		goto err_submit_put;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 23a6276f1332..cdcb37ff62c3 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	for (i = 0; i < num_bos; i++)
 		drm_gem_object_get(&bos[i]->base.base);
 
-	err = drm_sched_job_init(&task->base, &context->base, vm);
+	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
 	if (err) {
 		kfree(task->bos);
 		return err;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 99744de6c05a..c002cabe7b9c 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
+	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
 	if (ret) {
 		kfree(submit->hw_fence);
 		kfree(submit);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 7e64b5ef90fb..1b2cc3f2e1c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
 
 	}
 
-	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
+	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
 	if (ret)
 		goto err_free_chains;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b834777b409b..54d1c19bea84 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -274,7 +274,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&job->base,
 				 &file_priv->sched_entity[slot],
-				 NULL);
+				 1, NULL);
 	if (ret)
 		goto out_put_job;
 
diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 3143ecaaff86..f8ed093b7356 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __assign_str(name, sched_job->sched->name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
-				   &sched_job->sched->hw_rq_count);
+				   &sched_job->sched->credit_count);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 409e4256f6e7..b79e0672b94f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(entity->rq->sched);
+	drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(entity->rq->sched);
+		drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 246213963928..3cc3dc0091fc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -48,6 +48,30 @@
  * through the jobs entity pointer.
  */
 
+/**
+ * DOC: Flow Control
+ *
+ * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
+ * in which the jobs fetched from scheduler entities are executed.
+ *
+ * In this context the &drm_gpu_scheduler keeps track of a driver specified
+ * credit limit representing the capacity of this scheduler and a credit count;
+ * every &drm_sched_job carries a driver specified number of credits.
+ *
+ * Once a job is executed (but not yet finished), the job's credits contribute
+ * to the scheduler's credit count until the job is finished. If by executing
+ * one more job the scheduler's credit count would exceed the scheduler's
+ * credit limit, the job won't be executed. Instead, the scheduler will wait
+ * until the credit count has decreased enough to not overflow its credit limit.
+ * This implies waiting for previously executed jobs.
+ *
+ * Optionally, drivers can register a callback (update_job_credits) provided by
+ * struct drm_sched_backend_ops to update the job's credits dynamically. The
+ * scheduler will execute this callback every time the scheduler considers a job
+ * for execution and subsequently checks whether the job fits the scheduler's
+ * credit limit.
+ */
+
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
@@ -75,6 +99,46 @@ int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
 module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
+static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
+{
+	u32 credits;
+
+	WARN_ON(check_sub_overflow(sched->credit_limit,
+				   atomic_read(&sched->credit_count),
+				   &credits));
+
+	return credits;
+}
+
+/**
+ * drm_sched_can_queue -- Can we queue more to the hardware?
+ * @sched: scheduler instance
+ * @entity: the scheduler entity
+ *
+ * Return true if we can push at least one more job from @entity, false
+ * otherwise.
+ */
+static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
+				struct drm_sched_entity *entity)
+{
+	struct drm_sched_job *s_job;
+
+	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+	if (!s_job)
+		return false;
+
+	if (sched->ops->update_job_credits) {
+		u32 credits = sched->ops->update_job_credits(s_job);
+
+		if (credits)
+			s_job->credits = credits;
+	}
+
+	WARN_ON(s_job->credits > sched->credit_limit);
+
+	return drm_sched_available_credits(sched) >= s_job->credits;
+}
+
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
 {
@@ -186,12 +250,14 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 /**
  * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
+ * @sched: the gpu scheduler
  * @rq: scheduler run queue to check.
  *
  * Try to find a ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
+			      struct drm_sched_rq *rq)
 {
 	struct drm_sched_entity *entity;
 
@@ -201,6 +267,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	if (entity) {
 		list_for_each_entry_continue(entity, &rq->entities, list) {
 			if (drm_sched_entity_is_ready(entity)) {
+				/* If we can't queue yet, preserve the current
+				 * entity in terms of fairness.
+				 */
+				if (!drm_sched_can_queue(sched, entity))
+					goto out;
+
 				rq->current_entity = entity;
 				reinit_completion(&entity->entity_idle);
 				spin_unlock(&rq->lock);
@@ -210,8 +282,13 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	}
 
 	list_for_each_entry(entity, &rq->entities, list) {
-
 		if (drm_sched_entity_is_ready(entity)) {
+			/* If we can't queue yet, preserve the current entity in
+			 * terms of fairness.
+			 */
+			if (!drm_sched_can_queue(sched, entity))
+				goto out;
+
 			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			spin_unlock(&rq->lock);
@@ -222,20 +299,22 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 			break;
 	}
 
+out:
 	spin_unlock(&rq->lock);
-
 	return NULL;
 }
 
 /**
  * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
  *
+ * @sched: the gpu scheduler
  * @rq: scheduler run queue to check.
  *
  * Find oldest waiting ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
+				struct drm_sched_rq *rq)
 {
 	struct rb_node *rb;
 
@@ -245,6 +324,15 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
 		if (drm_sched_entity_is_ready(entity)) {
+			/* If we can't queue yet, don't pick another entity
+			 * which's job might fit and wait until we got space for
+			 * this one in terms of fairness.
+			 */
+			if (!drm_sched_can_queue(sched, entity)) {
+				rb = NULL;
+				break;
+			}
+
 			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			break;
@@ -266,18 +354,6 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 		queue_work(sched->submit_wq, &sched->work_run_job);
 }
 
-/**
- * drm_sched_can_queue -- Can we queue more to the hardware?
- * @sched: scheduler instance
- *
- * Return true if we can push more jobs to the hw, otherwise false.
- */
-static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
-{
-	return atomic_read(&sched->hw_rq_count) <
-		sched->hw_submission_limit;
-}
-
 /**
  * drm_sched_select_entity - Select next entity to process
  *
@@ -291,14 +367,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	if (!drm_sched_can_queue(sched))
-		return NULL;
-
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
+			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
@@ -353,7 +426,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	struct drm_sched_fence *s_fence = s_job->s_fence;
 	struct drm_gpu_scheduler *sched = s_fence->sched;
 
-	atomic_dec(&sched->hw_rq_count);
+	atomic_sub(s_job->credits, &sched->credit_count);
 	atomic_dec(sched->score);
 
 	trace_drm_sched_process_job(s_fence);
@@ -576,7 +649,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 					      &s_job->cb)) {
 			dma_fence_put(s_job->s_fence->parent);
 			s_job->s_fence->parent = NULL;
-			atomic_dec(&sched->hw_rq_count);
+			atomic_sub(s_job->credits, &sched->credit_count);
 		} else {
 			/*
 			 * remove job from pending_list.
@@ -637,7 +710,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct dma_fence *fence = s_job->s_fence->parent;
 
-		atomic_inc(&sched->hw_rq_count);
+		atomic_add(s_job->credits, &sched->credit_count);
 
 		if (!full_recovery)
 			continue;
@@ -718,6 +791,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * drm_sched_job_init - init a scheduler job
  * @job: scheduler job to init
  * @entity: scheduler entity to use
+ * @credits: the number of credits this job contributes to the schedulers
+ * credit limit
  * @owner: job owner for debugging
  *
  * Refer to drm_sched_entity_push_job() documentation
@@ -735,7 +810,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       void *owner)
+		       u32 credits, void *owner)
 {
 	if (!entity->rq) {
 		/* This will most likely be followed by missing frames
@@ -752,6 +827,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&job->list);
+	job->credits = credits ? credits : 1;
 
 	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
 
@@ -961,12 +1037,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 /**
  * drm_sched_wakeup_if_can_queue - Wake up the scheduler
  * @sched: scheduler instance
+ * @entity: the scheduler entity
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
+				   struct drm_sched_entity *entity)
 {
-	if (drm_sched_can_queue(sched))
+	if (drm_sched_can_queue(sched, entity))
 		drm_sched_run_job_queue(sched);
 }
 
@@ -1104,7 +1182,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	s_fence = sched_job->s_fence;
 
-	atomic_inc(&sched->hw_rq_count);
+	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
 	trace_drm_run_job(sched_job, entity);
@@ -1139,7 +1217,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
  *	       allocated and used
  * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
- * @hw_submission: number of hw submissions that can be in flight
+ * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
  * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
@@ -1153,14 +1231,14 @@ static void drm_sched_run_job_work(struct work_struct *w)
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
-		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,
+		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
 
 	sched->ops = ops;
-	sched->hw_submission_limit = hw_submission;
+	sched->credit_limit = credit_limit;
 	sched->name = name;
 	if (submit_wq) {
 		sched->submit_wq = submit_wq;
@@ -1211,7 +1289,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
-	atomic_set(&sched->hw_rq_count, 0);
+	atomic_set(&sched->credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 2e94ce788c71..8479e5302f7b 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->free = free;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 v3d_priv);
+				 1, v3d_priv);
 	if (ret)
 		goto fail;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e5a6166eb152..a911b3f5917e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -321,6 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
+ * @credits: the number of credits this job contributes to the scheduler
  * @work: Helper to reschdeule job kill to different context.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
@@ -340,6 +341,8 @@ struct drm_sched_job {
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
 
+	u32				credits;
+
 	/*
 	 * work is used only after finish_cb has been used and will not be
 	 * accessed anymore.
@@ -463,13 +466,29 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @update_job_credits: Called once the scheduler is considering this
+	 * job for execution.
+	 *
+	 * Drivers may use this to update the job's submission credits, which is
+	 * useful to e.g. deduct the number of native fences which have been
+	 * signaled meanwhile.
+	 *
+	 * The callback must either return the new number of submission credits
+	 * for the given job, or zero if no update is required.
+	 *
+	 * This callback is optional.
+	 */
+	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
 };
 
 /**
  * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
- * @hw_submission_limit: the max size of the hardware queue.
+ * @credit_limit: the credit limit of this scheduler
+ * @credit_count: the current credit count of this scheduler
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
@@ -478,7 +497,6 @@ struct drm_sched_backend_ops {
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
- * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
  * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
@@ -502,13 +520,13 @@ struct drm_sched_backend_ops {
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
-	uint32_t			hw_submission_limit;
+	u32				credit_limit;
+	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
 	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
-	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
@@ -530,14 +548,14 @@ struct drm_gpu_scheduler {
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
-		   u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
+		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       void *owner);
+		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
@@ -559,7 +577,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
+				   struct drm_sched_entity *entity);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.41.0

