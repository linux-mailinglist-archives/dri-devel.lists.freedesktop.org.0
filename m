Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B80A3B30A9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ED06EB9A;
	Thu, 24 Jun 2021 14:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCD56EB9A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j1so6784649wrn.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AfvS2CHpLHStVRmSiWV4LmqT0jaSoSWbAuxRKBKg0MI=;
 b=efVp0uuz44SmwyZp/yiml6E52F0vij2qsqLXfBmkVYfzaqhZTB6MXbeEr6zAIvDsyz
 uWUB/SzKWGNYmJ8XlDwqQvYPHU/Gd7gttaZo40b0IeFHXNJAzR2f7i4aRXAdXWKQE7Hx
 Nga63r8oRis14izSlqQulC5gxBghMTmHkaAmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AfvS2CHpLHStVRmSiWV4LmqT0jaSoSWbAuxRKBKg0MI=;
 b=LC83VyddZToRU3Jr0hT/rRXkYVnOF15FDYfRCmtf9WUurL1fa1sMeJOVBAiQ4Bdl7k
 QAD426x3oNNukN9VKKMqoCx4nJ2KIgDNDCFzYQrjkswaANGTc+mzkB7fB0tei6f+RDsq
 cPcWtr7mnEYE0301HhI5CLRCn7mGzHvDcjP0bhHK6GllAxIyYpDNx/Ba5Z29veTPk0fu
 hhc0O/J5l7nRKBqdsHZLXllJBMyYqOkhWWAIPrUAVeUt+jXWeXureeCtofJMTaluC0vj
 dMzHcBeoMfjNyhfW8eZwci7r/dOdqXr0IfqeTTk1wxyYQK/beJT0cbYOUElAHk68LgQ4
 AN6g==
X-Gm-Message-State: AOAM533hE4wefR9h1zvgPxTve2T4ZCz/W6POsL9HICvL1Nxv20PUIA0y
 EcxxmpOLeMssaHr5FHyDswyHimbSRdWBaw==
X-Google-Smtp-Source: ABdhPJzsxHa8CehvPCCSj5H9y7FHfJ6zEUBd7vbXEw9x75aSuV/2bVykeGmSfxY8mvROytmTKKmf9Q==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr4752068wru.9.1624543234785;
 Thu, 24 Jun 2021 07:00:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/11] drm/sched: drop entity parameter from drm_sched_push_job
Date: Thu, 24 Jun 2021 16:00:17 +0200
Message-Id: <20210624140025.438303-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 lima@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally a job was only bound to the queue when we pushed this, but
now that's done in drm_sched_job_init, making that parameter entirely
redundant.

Remove it.

The same applies to the context parameter in
lima_sched_context_queue_task, simplify that too.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Chen Li <chenli@uniontech.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: "Marek Olšák" <marek.olsak@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Dennis Li <Dennis.Li@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  | 2 +-
 drivers/gpu/drm/lima/lima_gem.c          | 3 +--
 drivers/gpu/drm/lima/lima_sched.c        | 5 ++---
 drivers/gpu/drm/lima/lima_sched.h        | 3 +--
 drivers/gpu/drm/panfrost/panfrost_job.c  | 2 +-
 drivers/gpu/drm/scheduler/sched_entity.c | 6 ++----
 drivers/gpu/drm/v3d/v3d_gem.c            | 2 +-
 include/drm/gpu_scheduler.h              | 3 +--
 10 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a4ec092af9a7..18f63567fb69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1267,7 +1267,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	trace_amdgpu_cs_ioctl(job);
 	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 5ddb955d2315..b8609cccc9c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -174,7 +174,7 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 
 	*f = dma_fence_get(&job->base.s_fence->finished);
 	amdgpu_job_free_resources(job);
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index af1671f01c7f..77995f190790 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -178,7 +178,7 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
 	/* the scheduler holds on to the job now */
 	kref_get(&submit->refcount);
 
-	drm_sched_entity_push_job(&submit->sched_job, sched_entity);
+	drm_sched_entity_push_job(&submit->sched_job);
 
 out_unlock:
 	mutex_unlock(&submit->gpu->fence_lock);
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index de62966243cd..c528f40981bb 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -359,8 +359,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 			goto err_out2;
 	}
 
-	fence = lima_sched_context_queue_task(
-		submit->ctx->context + submit->pipe, submit->task);
+	fence = lima_sched_context_queue_task(submit->task);
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index bd1af1fd8c0f..de7e71c42a69 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -177,13 +177,12 @@ void lima_sched_context_fini(struct lima_sched_pipe *pipe,
 	drm_sched_entity_fini(&context->base);
 }
 
-struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
-						struct lima_sched_task *task)
+struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
 {
 	struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
 
 	trace_lima_task_submit(task);
-	drm_sched_entity_push_job(&task->base, &context->base);
+	drm_sched_entity_push_job(&task->base);
 	return fence;
 }
 
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 90f03c48ef4a..ac70006b0e26 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -98,8 +98,7 @@ int lima_sched_context_init(struct lima_sched_pipe *pipe,
 			    atomic_t *guilty);
 void lima_sched_context_fini(struct lima_sched_pipe *pipe,
 			     struct lima_sched_context *context);
-struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
-						struct lima_sched_task *task);
+struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task);
 
 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name);
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 1e950534b9b0..2d01a670a4e8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -257,7 +257,7 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	kref_get(&job->refcount); /* put by scheduler job completion */
 
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	mutex_unlock(&pfdev->sched_lock);
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index b6f72fafd504..2ab1b9e648f2 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -493,9 +493,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 /**
  * drm_sched_entity_push_job - Submit a job to the entity's job queue
- *
  * @sched_job: job to submit
- * @entity: scheduler entity
  *
  * Note: To guarantee that the order of insertion to queue matches the job's
  * fence sequence number this function should be called with drm_sched_job_arm()
@@ -503,9 +501,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
-			       struct drm_sched_entity *entity)
+void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
+	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 4eb354226972..ac608eb9b594 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -480,7 +480,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	/* put by scheduler job completion */
 	kref_get(&job->refcount);
 
-	drm_sched_entity_push_job(&job->base, &v3d_priv->sched_entity[queue]);
+	drm_sched_entity_push_job(&job->base);
 
 	return 0;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e4d7e1496296..55e0acf8015a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -372,8 +372,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
-			       struct drm_sched_entity *entity);
+void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
-- 
2.32.0.rc2

