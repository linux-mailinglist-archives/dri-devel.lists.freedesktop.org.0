Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BE3E130E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CB16E849;
	Thu,  5 Aug 2021 10:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CCE6E7DD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u3so8836986ejz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGgyLQM9fjpIJHEqIqszmKIM4QjRrF1HCjvx1q5xP7s=;
 b=DsqS+KaQtS2qyGKSch/axaBdtn1FMdHUMfonxEVGlFxFOMdhnog4yaxz8Crg6xES/s
 oii+NWpftF9DkPehN+4iRGRRXtX8UujsfnUZBt0c/4pzBHEU9lY3loXie9hSTn2SlFrr
 5Qhj8DevpKf1l+38kIiYc0cjt8SCDARbkaT0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGgyLQM9fjpIJHEqIqszmKIM4QjRrF1HCjvx1q5xP7s=;
 b=l66r0spCZBpGkMCxBP2K76VjexahRVS7rveM9288GVmGz67CSlFcu37EEytcKOZbkE
 YMhoLNa/wxOshm+yUGTCS1yCpXUaH7OcSKyK2myeB0Kiw18J9RSKmRYXHW3A5ax7r5Mw
 43Ssbw6u22CQ9fRL3Goh0TUIN2ontX/D1AgRGEbfom3jggRIWzkcY1gmEEZVvUQnw5Yz
 cmDEL4W33gsnsQilDcBwb/1tKUooVUQvVpBua0g5ojd7Sc0pLGMkXlf7+C66dUTiyZRc
 x/+X/RV3CBXspqzXZUqP5PhkT6K0i6LTQ1mR9QrmkQYVPpNKU63Zx/MkYAmt9TK8M1R2
 yegA==
X-Gm-Message-State: AOAM533GSX6TQqzz6DW8ulymwTGPsDuUT2EUXadobmyqV3SG0EcxgaFh
 un7tc/6Ad2jj9SuDLo6FfXZo2h8CpYuP2w==
X-Google-Smtp-Source: ABdhPJzC2OA7k5M8A16QFTlxnjaxNky1IVgCYtegib7d2hNvvFwM1r28DXONj14/49w/U91xQTf1Lg==
X-Received: by 2002:a17:906:35d0:: with SMTP id
 p16mr4288877ejb.284.1628160435867; 
 Thu, 05 Aug 2021 03:47:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Dave Airlie <airlied@redhat.com>, Chen Li <chenli@uniontech.com>,
 Lee Jones <lee.jones@linaro.org>, Deepak R Varma <mh12gx2825@gmail.com>,
 Kevin Wang <kevin1.wang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v5 05/20] drm/sched: drop entity parameter from
 drm_sched_push_job
Date: Thu,  5 Aug 2021 12:46:50 +0200
Message-Id: <20210805104705.862416-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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

Originally a job was only bound to the queue when we pushed this, but
now that's done in drm_sched_job_init, making that parameter entirely
redundant.

Remove it.

The same applies to the context parameter in
lima_sched_context_queue_task, simplify that too.

v2:
Rebase on top of msm adopting drm/sched

Acked-by: Emma Anholt <emma@anholt.net>
Acked-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Steven Price <steven.price@arm.com> (v1)
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v1)
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
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Melissa Wen <mwen@igalia.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  | 2 +-
 drivers/gpu/drm/lima/lima_gem.c          | 3 +--
 drivers/gpu/drm/lima/lima_sched.c        | 5 ++---
 drivers/gpu/drm/lima/lima_sched.h        | 3 +--
 drivers/gpu/drm/msm/msm_gem_submit.c     | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c  | 2 +-
 drivers/gpu/drm/scheduler/sched_entity.c | 6 ++----
 drivers/gpu/drm/v3d/v3d_gem.c            | 2 +-
 include/drm/gpu_scheduler.h              | 3 +--
 11 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 32e80bc6af22..1d8a914108af 100644
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
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d0ed4ddc509e..96cea0ba4cfd 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -909,7 +909,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
-	drm_sched_entity_push_job(&submit->base, &queue->entity);
+	drm_sched_entity_push_job(&submit->base);
 
 	args->fence = submit->fence_id;
 
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
index 381fbf462ea7..e4d33db1eb45 100644
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
index 2e808097b4d1..957228bef29c 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -487,7 +487,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	/* put by scheduler job completion */
 	kref_get(&job->refcount);
 
-	drm_sched_entity_push_job(&job->base, &v3d_priv->sched_entity[queue]);
+	drm_sched_entity_push_job(&job->base);
 
 	return 0;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a47946f904b6..b72f73b375a2 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -409,8 +409,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity);
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

