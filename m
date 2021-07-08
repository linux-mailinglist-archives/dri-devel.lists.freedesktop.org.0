Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A63C1856
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8236E956;
	Thu,  8 Jul 2021 17:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D496E94A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so4545028wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJWoyA6G2JkaA69/5nx0S1j8TXeHRpIQLImqh6Ok90g=;
 b=Iwa4RGJc6pSVqcozSr7UVAs6Kjgohf+512xvkF19bAHlYjAb6/MrzkXrHlFYT1p8v4
 hCfzIc3bXfn+YT3bIgQcfcM8/Fog5pLsCj8MiYSl000W7pH6D7a3x2idQiMAozRYokq7
 aF8S+Tk0VvVe2I6JGmj0wEPEj6JdukJsWkBWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJWoyA6G2JkaA69/5nx0S1j8TXeHRpIQLImqh6Ok90g=;
 b=Pfur4Hk24qNhHCReMWT6iPiL13Fy5X1gR6MAE5XjWlMxeKnnGb6cUcTqWh3SC42yL6
 8Sb83mKTh+3ar4P5y1HafHjWQiy7etX8VwFN9E1VCD7oSunv/BKGv/3PrI9K6XnLHd05
 XZMsXicojZL2+C9rl9nsnw8cYCxPcm1gkKFmrXHYR8QPm39THNtUYK5R7OWvCkTO9gHn
 vlIn+cuzkFoo7wkqscb2ua+sNO6I2e2C7fnN0m95ALp8aDg9FNkjS36mjgiZ9Yya1R6U
 X7q2VNEB0o0OA3aCoGl219+M5fPCR3BdPWbR5V5cZek5DiX5owShQzhjDiMkeFKMjgAN
 UF+g==
X-Gm-Message-State: AOAM532/NpQW/N8c8nN9va52BGm/mQT4yKh3BwQDaRSwqFRx2jTPOpDd
 BG7oo3Doh+GkELQ2KBYJu6AX9CoQ0nB3KA==
X-Google-Smtp-Source: ABdhPJz485+ixssBY3blmTtjvLk/Z9doZfYtZuK1N73H8Y07YN8HhAWiiPAwL5W7gNTzIAgs4w2QJQ==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr6523070wmj.99.1625765888779; 
 Thu, 08 Jul 2021 10:38:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 02/20] drm/sched: Split drm_sched_job_init
Date: Thu,  8 Jul 2021 19:37:36 +0200
Message-Id: <20210708173754.3877540-3-daniel.vetter@ffwll.ch>
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Sonny Jiang <sonny.jiang@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>,
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

v3: Emma noticed that I leak the memory allocated in
drm_sched_job_init if we bail out before the point of no return in
subsequent driver patches. To be able to fix this change
drm_sched_job_cleanup() so it can handle being called both before and
after drm_sched_job_arm().

Also improve the kerneldoc for this.

v4:
- Fix the drm_sched_job_cleanup logic, I inverted the booleans, as
  usual (Melissa)

- Christian pointed out that drm_sched_entity_select_rq() also needs
  to be moved into drm_sched_job_arm, which made me realize that the
  job->id definitely needs to be moved too.

  Shuffle things to fit between job_init and job_arm.

Cc: Melissa Wen <melissa.srw@gmail.com>
Acked-by: Steven Price <steven.price@arm.com> (v2)
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
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +
 drivers/gpu/drm/lima/lima_sched.c        |  2 +
 drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +
 drivers/gpu/drm/scheduler/sched_entity.c |  6 +--
 drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++---
 drivers/gpu/drm/scheduler/sched_main.c   | 64 ++++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_gem.c            |  2 +
 include/drm/gpu_scheduler.h              |  7 ++-
 10 files changed, 86 insertions(+), 22 deletions(-)

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
index feb6da1b6ceb..05f412204118 100644
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
index dba8329937a3..38f755580507 100644
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
index 71a72fb50e6b..2992dc85325f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
 		goto unlock;
 	}
 
+	drm_sched_job_arm(&job->base);
+
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
 	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6fc116ee7302..64d398166644 100644
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
index 69de2c76731f..bcea035cf4c6 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
  *
  * Free up the fence memory after the RCU grace period.
  */
-static void drm_sched_fence_free(struct rcu_head *rcu)
+void drm_sched_fence_free(struct rcu_head *rcu)
 {
 	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
@@ -152,27 +152,32 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
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
 		return NULL;
 
 	fence->owner = owner;
-	fence->sched = entity->rq->sched;
 	spin_lock_init(&fence->lock);
 
+	return fence;
+}
+
+void drm_sched_fence_init(struct drm_sched_fence *fence,
+			  struct drm_sched_entity *entity)
+{
+	unsigned seq;
+
+	fence->sched = entity->rq->sched;
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
index 01dd47154181..7e94754eb34c 100644
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
 
@@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
 
 /**
  * drm_sched_job_init - init a scheduler job
- *
  * @job: scheduler job to init
  * @entity: scheduler entity to use
  * @owner: job owner for debugging
@@ -577,13 +578,45 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
  * Refer to drm_sched_entity_push_job() documentation
  * for locking considerations.
  *
+ * Drivers must make sure drm_sched_job_cleanup() if this function returns
+ * successfully, even when @job is aborted before drm_sched_job_arm() is called.
+ *
  * Returns 0 for success, negative error code otherwise.
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
+{
+	job->entity = entity;
+	job->s_fence = drm_sched_fence_alloc(entity, owner);
+	if (!job->s_fence)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&job->list);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_sched_job_init);
+
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
 {
 	struct drm_gpu_scheduler *sched;
+	struct drm_sched_entity *entity = job->entity;
+
+	BUG_ON(!entity);
 
 	drm_sched_entity_select_rq(entity);
 	BUG_ON(!entity->rq);
@@ -591,27 +624,36 @@ int drm_sched_job_init(struct drm_sched_job *job,
 	sched = entity->rq->sched;
 
 	job->sched = sched;
-	job->entity = entity;
 	job->s_priority = entity->rq - sched->sched_rq;
-	job->s_fence = drm_sched_fence_create(entity, owner);
-	if (!job->s_fence)
-		return -ENOMEM;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
-	INIT_LIST_HEAD(&job->list);
-
-	return 0;
+	drm_sched_fence_init(job->s_fence, job->entity);
 }
-EXPORT_SYMBOL(drm_sched_job_init);
+EXPORT_SYMBOL(drm_sched_job_arm);
 
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
- *
  * @job: scheduler job to clean up
+ *
+ * Cleans up the resources allocated with drm_sched_job_init().
+ *
+ * Drivers should call this from their error unwind code if @job is aborted
+ * before drm_sched_job_arm() is called.
+ *
+ * After that point of no return @job is committed to be executed by the
+ * scheduler, and this function should be called from the
+ * &drm_sched_backend_ops.free_job callback.
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
-	dma_fence_put(&job->s_fence->finished);
+	if (kref_read(&job->s_fence->finished.refcount)) {
+		/* drm_sched_job_arm() has been called */
+		dma_fence_put(&job->s_fence->finished);
+	} else {
+		/* aborted job before committing to run it */
+		drm_sched_fence_free(&job->s_fence->finished.rcu);
+	}
+
 	job->s_fence = NULL;
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
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
index 88ae7f331bb1..83afc3aa8e2f 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner);
+void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
@@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 
-struct drm_sched_fence *drm_sched_fence_create(
+struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
+void drm_sched_fence_init(struct drm_sched_fence *fence,
+			  struct drm_sched_entity *entity);
+void drm_sched_fence_free(struct rcu_head *rcu);
+
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 void drm_sched_fence_finished(struct drm_sched_fence *fence);
 
-- 
2.32.0

