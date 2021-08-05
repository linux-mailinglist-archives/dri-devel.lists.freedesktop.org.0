Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C526E3E12FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D53289E19;
	Thu,  5 Aug 2021 10:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5662489E19
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id o5so8829407ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CoG2esdMRwLFR8uHGGrQFQm0ZCUOJRe/ckDv511Bsxs=;
 b=RTDZrPcaNrPyY/63CGHz3uXbwe2TFSbcxXG/lWDMIuN+EK+WeIM9CG6VpXlMlluGQ5
 nB0vodUebjlU3Lf59Qs3xsLDQ+eWeDRiGc3wFRjw7AnnNVQtji7hTdRA9MrwDdANAheP
 tWkaSUQ+0wDX4QH1A7A1vW6wpPmuOH/V71B8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CoG2esdMRwLFR8uHGGrQFQm0ZCUOJRe/ckDv511Bsxs=;
 b=UCbFrevqo4MndoVpGrLFkzoxa0zzrQiws4xp99m00+ZsqP3ROOc4QDViZLRpZA+ZiX
 crmub/gf0tEnx7EDW2ZnnRCJJ9BWEUY1zN+Bq9bouyhBf+WLYt9hy834lkjiAqslRdNy
 pugfDlFQqZKpTK+1LHEw9RlCpeiJaO+ipRVZhb3vUzf5xYKbHxiRXkrZ/tFuZgOeLLDg
 22xr2vqYA5tDjZfPHkeaLnXIWDuPsCrfheo+zVwvoiQUicgC0XZ4AK9JhjpqY574BBq/
 mqJAtbLkgktwKkeuyGLI3i+iZloyoQXFl7W4WRTSNzdUjHvKRcNKw87dA39zIwpwrffi
 0VDA==
X-Gm-Message-State: AOAM532AQIgDsiRvuYqi7X1FYLhRliEVtu7pPXGyNSkzZ2Jm5LOJEC/S
 6llBdwM66+J52E3sp76B+tWFfl9/6lG2MA==
X-Google-Smtp-Source: ABdhPJwKOARNyuAw0W/beCDS0nOUJqk3su10tEZmG/j8ymKhq644348cvEJBhIRTyIph93tXawPD0g==
X-Received: by 2002:a17:906:b317:: with SMTP id
 n23mr3486132ejz.456.1628160431778; 
 Thu, 05 Aug 2021 03:47:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Melissa Wen <melissa.srw@gmail.com>, Emma Anholt <emma@anholt.net>,
 Steven Price <steven.price@arm.com>,
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
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>,
 Adam Borowski <kilobyte@angband.pl>, Nick Terrell <terrelln@fb.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 Sami Tolvanen <samitolvanen@google.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Kevin Wang <kevin1.wang@amd.com>,
 Chen Li <chenli@uniontech.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Dennis Li <Dennis.Li@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 01/20] drm/sched: Split drm_sched_job_init
Date: Thu,  5 Aug 2021 12:46:46 +0200
Message-Id: <20210805104705.862416-2-daniel.vetter@ffwll.ch>
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

v5:
Reshuffle the split between init/arm once more, amdgpu abuses
drm_sched.ready to signal gpu reset failures. Also document this
somewhat. (Christian)

v6:
Rebase on top of the msm drm/sched support. Note that the
drm_sched_job_init() call is completely misplaced, and hence also the
split-out drm_sched_entity_push_job(). I've put in a FIXME which the next
patch will address.

Acked-by: Melissa Wen <mwen@igalia.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Acked-by: Emma Anholt <emma@anholt.net>
Acked-by: Steven Price <steven.price@arm.com> (v2)
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v5)
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
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +
 drivers/gpu/drm/lima/lima_sched.c        |  2 +
 drivers/gpu/drm/msm/msm_gem_submit.c     |  3 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +
 drivers/gpu/drm/scheduler/sched_entity.c |  6 +--
 drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++---
 drivers/gpu/drm/scheduler/sched_main.c   | 69 ++++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_gem.c            |  2 +
 include/drm/gpu_scheduler.h              |  7 ++-
 11 files changed, 94 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 139cd3bf1ad6..32e80bc6af22 100644
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
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fdc5367aecaa..6d6c44f0e1f3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,6 +52,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
+	/* FIXME: this is way too early */
+	drm_sched_job_arm(&job->base);
+
 	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
 
 	kref_init(&submit->ref);
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
index 33c414d55fab..454cb6164bdc 100644
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
@@ -577,27 +578,28 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
  * Refer to drm_sched_entity_push_job() documentation
  * for locking considerations.
  *
+ * Drivers must make sure drm_sched_job_cleanup() if this function returns
+ * successfully, even when @job is aborted before drm_sched_job_arm() is called.
+ *
+ * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
+ * has died, which can mean that there's no valid runqueue for a @entity.
+ * This function returns -ENOENT in this case (which probably should be -EIO as
+ * a more meanigful return value).
+ *
  * Returns 0 for success, negative error code otherwise.
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	struct drm_gpu_scheduler *sched;
-
 	drm_sched_entity_select_rq(entity);
 	if (!entity->rq)
 		return -ENOENT;
 
-	sched = entity->rq->sched;
-
-	job->sched = sched;
 	job->entity = entity;
-	job->s_priority = entity->rq - sched->sched_rq;
-	job->s_fence = drm_sched_fence_create(entity, owner);
+	job->s_fence = drm_sched_fence_alloc(entity, owner);
 	if (!job->s_fence)
 		return -ENOMEM;
-	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	INIT_LIST_HEAD(&job->list);
 
@@ -606,13 +608,58 @@ int drm_sched_job_init(struct drm_sched_job *job,
 EXPORT_SYMBOL(drm_sched_job_init);
 
 /**
- * drm_sched_job_cleanup - clean up scheduler job resources
+ * drm_sched_job_arm - arm a scheduler job for execution
+ * @job: scheduler job to arm
+ *
+ * This arms a scheduler job for execution. Specifically it initializes the
+ * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
+ * or other places that need to track the completion of this job.
+ *
+ * Refer to drm_sched_entity_push_job() documentation for locking
+ * considerations.
  *
+ * This can only be called if drm_sched_job_init() succeeded.
+ */
+void drm_sched_job_arm(struct drm_sched_job *job)
+{
+	struct drm_gpu_scheduler *sched;
+	struct drm_sched_entity *entity = job->entity;
+
+	BUG_ON(!entity);
+
+	sched = entity->rq->sched;
+
+	job->sched = sched;
+	job->s_priority = entity->rq - sched->sched_rq;
+	job->id = atomic64_inc_return(&sched->job_id_count);
+
+	drm_sched_fence_init(job->s_fence, job->entity);
+}
+EXPORT_SYMBOL(drm_sched_job_arm);
+
+/**
+ * drm_sched_job_cleanup - clean up scheduler job resources
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
index 5689da118197..2e808097b4d1 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -480,6 +480,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
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

