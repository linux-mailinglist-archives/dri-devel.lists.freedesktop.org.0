Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4B3B3819
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E3E6ECD1;
	Thu, 24 Jun 2021 20:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996AB6ECD1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:45:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id r3so338814wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wHE/fYmMxY6FXP/wVA8Ya/i+wIf9M9VbRR8Y3eo07s=;
 b=eXjQUQFT3eFRAb5GnCMrl/A1WHS+QIHp6ikRkqNGpjCNoFvivJ3vKEbDnL/simxgsx
 DQtkGxJuz2PP/xGWpDYGuXccVgK48nRijqnwNMyPNz/H1rC70T+45qvDHYIWuzfrUbFc
 EkRYkKWOpOhrZYkjgI9QaS30ZgRe95AjBwgDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wHE/fYmMxY6FXP/wVA8Ya/i+wIf9M9VbRR8Y3eo07s=;
 b=LRht1mI7o+ScZQBs4nH7QQwbbP99zHiXtPedUbNA5B3xMUEXQ9Suhkpp6F5XFmdSH8
 qMdCbTtkaCRf0mZIsmFx3esyysGGIyARS7wTOSpFL/m7NuvEMWMQQtBa6w7GonQQnuMs
 MNfd7hQZ9YYTBxNVhVYpqtjyta/+P6cjc8UCeg9IO6c7ltN2Vu9ShJZ8kJ9fM2Xe5sOm
 v/u+ucSoXHGAbSuF0V8XderV2ps74DSctUVJiF49eYaeK5cmPr0scTvS+atfJOx26pXm
 Hn0CvRUMIyqkXVkYERhMSG6egTQ6zKw/ZuUm7MxJs9XUyzEpH4/XhM75ybL0mlcv+coE
 ePdQ==
X-Gm-Message-State: AOAM531wYor3twUPCdcEBnySLOM2Ai/sPsGpW2bXAedbR9vwICFE+Yg/
 xYB6WTCcUfts/XOrTZtP/TZdfVT0OcLNaQ==
X-Google-Smtp-Source: ABdhPJzteO1y3/1bk09TQ+0WIlLPmn1+2uguMNM2IZTJzkofWSW2y0HEK91JTmvvFzZRDb12Lx5kIA==
X-Received: by 2002:a05:600c:291:: with SMTP id
 17mr6468737wmk.52.1624567541309; 
 Thu, 24 Jun 2021 13:45:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u18sm3580678wmj.15.2021.06.24.13.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:45:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Split drm_sched_job_init
Date: Thu, 24 Jun 2021 22:45:35 +0200
Message-Id: <20210624204535.614168-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kevin Wang <kevin1.wang@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Nick Terrell <terrelln@fb.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a very confusingly named function, because not just does it
init an object, it arms it and provides a point of no return for
pushing a job into the scheduler. It would be nice if that's a bit
clearer in the interface.

But the real reason is that I want to push the dependency tracking
helpers into the scheduler code, and that means drm_sched_job_init
must be called a lot earlier, without arming the job.

v2:
- don't change .gitignore (Steven)
- don't forget v3d (Emma)

Acked-by: Steven Price <steven.price@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Adam Borowski <kilobyte@angband.pl>
Cc: Nick Terrell <terrelln@fb.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: Chen Li <chenli@uniontech.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: "Marek Olšák" <marek.olsak@amd.com>
Cc: Dennis Li <Dennis.Li@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Sonny Jiang <sonny.jiang@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
 drivers/gpu/drm/lima/lima_sched.c        |  2 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
 drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
 drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
 drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
 include/drm/gpu_scheduler.h              |  6 +++++-
 10 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index c5386d13eb4a..a4ec092af9a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	if (r)
 		goto error_unlock;
 
+	drm_sched_job_arm(&job->base);
+
 	/* No memory allocation is allowed while holding the notifier lock.
 	 * The lock is held until amdgpu_cs_submit is finished and fence is
 	 * added to BOs.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index d33e6d97cc89..5ddb955d2315 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 	if (r)
 		return r;
 
+	drm_sched_job_arm(&job->base);
+
 	*f = dma_fence_get(&job->base.s_fence->finished);
 	amdgpu_job_free_resources(job);
 	drm_sched_entity_push_job(&job->base, entity);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 19826e504efc..af1671f01c7f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
 	if (ret)
 		goto out_unlock;
 
+	drm_sched_job_arm(&submit->sched_job);
+
 	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
 	submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
 						submit->out_fence, 0,
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ecf3267334ff..bd1af1fd8c0f 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
 		return err;
 	}
 
+	drm_sched_job_arm(&task->base);
+
 	task->num_bos = num_bos;
 	task->vm = lima_vm_get(vm);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index beb62c8fc851..1e950534b9b0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
 		goto unlock;
 	}
 
+	drm_sched_job_arm(&job->base);
+
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
 	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 79554aa4dbb1..f7347c284886 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * @sched_job: job to submit
  * @entity: scheduler entity
  *
- * Note: To guarantee that the order of insertion to queue matches
- * the job's fence sequence number this function should be
- * called with drm_sched_job_init under common lock.
+ * Note: To guarantee that the order of insertion to queue matches the job's
+ * fence sequence number this function should be called with drm_sched_job_arm()
+ * under common lock.
  *
  * Returns 0 for success, negative error code otherwise.
  */
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 69de2c76731f..0ba810c198bd 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 }
 EXPORT_SYMBOL(to_drm_sched_fence);
 
-struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
-					       void *owner)
+struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
+					      void *owner)
 {
 	struct drm_sched_fence *fence = NULL;
-	unsigned seq;
 
 	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
 	if (fence == NULL)
@@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
 	fence->sched = entity->rq->sched;
 	spin_lock_init(&fence->lock);
 
+	return fence;
+}
+
+void drm_sched_fence_init(struct drm_sched_fence *fence,
+			  struct drm_sched_entity *entity)
+{
+	unsigned seq;
+
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
 		       &fence->lock, entity->fence_context + 1, seq);
-
-	return fence;
 }
 
 module_init(drm_sched_fence_slab_init);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 61420a9c1021..70eefed17e06 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -48,9 +48,11 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
+#include <linux/dma-resv.h>
 #include <uapi/linux/sched/types.h>
 
 #include <drm/drm_print.h>
+#include <drm/drm_gem.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/spsc_queue.h>
 
@@ -594,7 +596,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 	job->sched = sched;
 	job->entity = entity;
 	job->s_priority = entity->rq - sched->sched_rq;
-	job->s_fence = drm_sched_fence_create(entity, owner);
+	job->s_fence = drm_sched_fence_alloc(entity, owner);
 	if (!job->s_fence)
 		return -ENOMEM;
 	job->id = atomic64_inc_return(&sched->job_id_count);
@@ -605,6 +607,25 @@ int drm_sched_job_init(struct drm_sched_job *job,
 }
 EXPORT_SYMBOL(drm_sched_job_init);
 
+/**
+ * drm_sched_job_arm - arm a scheduler job for execution
+ * @job: scheduler job to arm
+ *
+ * This arms a scheduler job for execution. Specifically it initializes the
+ * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
+ * or other places that need to track the completion of this job.
+ *
+ * Refer to drm_sched_entity_push_job() documentation for locking
+ * considerations.
+ *
+ * This can only be called if drm_sched_job_init() succeeded.
+ */
+void drm_sched_job_arm(struct drm_sched_job *job)
+{
+	drm_sched_fence_init(job->s_fence, job->entity);
+}
+EXPORT_SYMBOL(drm_sched_job_arm);
+
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
  *
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 4eb354226972..5c3a99027ecd 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	if (ret)
 		return ret;
 
+	drm_sched_job_arm(&job->base);
+
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
 
 	/* put by scheduler job completion */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d18af49fd009..80438d126c9d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner);
+void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
@@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 
-struct drm_sched_fence *drm_sched_fence_create(
+struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
+void drm_sched_fence_init(struct drm_sched_fence *fence,
+			  struct drm_sched_entity *entity);
+
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 void drm_sched_fence_finished(struct drm_sched_fence *fence);
 
-- 
2.32.0.rc2

