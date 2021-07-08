Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121C3C1860
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01A86E964;
	Thu,  8 Jul 2021 17:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DE86E957
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:13 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a8so8532588wrp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1pvMr02hIHq2AEIJDWAC7sVPUBJ1dbEEa4aJ2D+xVCw=;
 b=BMeONXb5sS1kIcrHUY6v/jOtLtXPvpzXsLrkqKS0rhufnuy0mCjpIHYEKQrIVgsSP7
 EYz10n+o0MEqnFESxpTj95W4GZpvGXvrO1UYLYkRVuMdeGzd42nUjFbrcj9vdxPF7zwv
 paVASeOml48hFOo0JLW6rd/1enG1JDhLqMp28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1pvMr02hIHq2AEIJDWAC7sVPUBJ1dbEEa4aJ2D+xVCw=;
 b=GxKhwsbFbrJ5P/Ke0RLZpQx4+Uc6S+Dx7x6tFnCnUWxLItGnj/DqoFEcIqlLPw4uq7
 +7sGWYHaB9OwWfNPD5IAt3MNv8GM9drA8I0Bl1ArprL/55h6IWaJEyy0zv+s/+r+GrEC
 cpiSLtVXzeGHeFroplHPR3LBaLzjbhNYUzI4EMFNAvvsDS4rlCeCA7VxSN0yhHnKjAHK
 Zgd3v+uAa/rKutqSTZeX0GTX2IWqRH/ntWrOrdksokRSlWiJSCkInXITkofjEHaFO05/
 IqrFVkPJS0JqAKGrDwMgOm4cbXbz16MXn0P8/q9CADQhvxJX+vtd3yHEDUmMjOZnuG+G
 KfpA==
X-Gm-Message-State: AOAM532hxbF2jlJEGdSLnq21cAsPZIwO7sOTLcdufPJmk0d+JoN8ztG5
 FY9MPuPK0S7XOZXpjGaoh3hP9NwOPeVZlA==
X-Google-Smtp-Source: ABdhPJz41FriE+mWoHnECaVxKDRxy5Ks/qVFZhTl5/nxmEaG5dhrbcz7KjRV07gqng/d/uz/5fJB+g==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr5243376wru.381.1625765892433; 
 Thu, 08 Jul 2021 10:38:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 05/20] drm/sched: drop entity parameter from
 drm_sched_push_job
Date: Thu,  8 Jul 2021 19:37:39 +0200
Message-Id: <20210708173754.3877540-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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

Reviewed-by: Steven Price <steven.price@arm.com> (v1)
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
index 05f412204118..180bb633d5c5 100644
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
index 38f755580507..e968b5a8f0b0 100644
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
index 2992dc85325f..4bc962763e1f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -301,7 +301,7 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	kref_get(&job->refcount); /* put by scheduler job completion */
 
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	mutex_unlock(&pfdev->sched_lock);
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c7e6d29c9a33..e2a6803910ce 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -516,9 +516,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 /**
  * drm_sched_entity_push_job - Submit a job to the entity's job queue
- *
  * @sched_job: job to submit
- * @entity: scheduler entity
  *
  * Note: To guarantee that the order of insertion to queue matches the job's
  * fence sequence number this function should be called with drm_sched_job_arm()
@@ -526,9 +524,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
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
index 5c3a99027ecd..69ac20e11b09 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -482,7 +482,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	/* put by scheduler job completion */
 	kref_get(&job->refcount);
 
-	drm_sched_entity_push_job(&job->base, &v3d_priv->sched_entity[queue]);
+	drm_sched_entity_push_job(&job->base);
 
 	return 0;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 74fb321dbc44..2bb1869f2352 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -407,8 +407,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity);
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
2.32.0

