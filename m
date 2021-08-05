Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B633E1302
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE56F6E836;
	Thu,  5 Aug 2021 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152FE6E7FE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hw6so8786604ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEDa94/WcqC93JTwI4vmAWB7y82SXtnY9IZP9E0Rtio=;
 b=d10ohb+Uf4TktRlM6eWFNfkmHgAt9Rl9O+6fTeHiELsQyL1zAiY+BRueWXxwaATBqw
 lXG2q0nkcahyqpcgM3kIilG0t0APsyDqQwYl1AB32A3RWqfsedxiON46H77qdHRENwRz
 pHiFJZATI8uZLdO7z9FSTcWAQyubM5UAgA/Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEDa94/WcqC93JTwI4vmAWB7y82SXtnY9IZP9E0Rtio=;
 b=OBLSnZ+UKOsVILz7iBelV6xvgVeB9g9HS10mGt3qmvVLytEGA8o4fgBSHs1ecbw6K1
 hlH+gP0/L8VetHZupMB7WuHKhTJpms7QZd/Ata6+v/bXB6e2YmOyjVFbVl3JpBDShrB8
 puMg8P3AQ76Y6+xxxXPx4gYcD1jeqigLifsrvnvmVbDOEqeSWcfmsaTqgzUSVepYgFgT
 LXonFfDSMHK0KiZi6gURBKHGAT4DUsxiDXvkxgknkMIsHCo3AW5YcCyih9KkmVoCc8xY
 A+OwbivJAyVmQuqRNuzC8YwwuSQYA5w3TzNCv4b4/wielkaXCfQGQaCShP0eEACqCnWE
 lXeA==
X-Gm-Message-State: AOAM5323w89XDox0CvFXypoMsV6KE39cK5rvsa6XkjEesrCNlLQ4/TcL
 Nv7a5Blk/xoqYRIdZBQFeAurne77fgj16g==
X-Google-Smtp-Source: ABdhPJyUA0rcvBi12OfV5BKk7AMSHcqL5POFJaEVG+mA6291u3qZKadnwaQSLdYhAVYgKMXt7lfuFg==
X-Received: by 2002:a17:907:990d:: with SMTP id
 ka13mr4234996ejc.392.1628160434532; 
 Thu, 05 Aug 2021 03:47:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 04/20] drm/sched: Add dependency tracking
Date: Thu,  5 Aug 2021 12:46:49 +0200
Message-Id: <20210805104705.862416-5-daniel.vetter@ffwll.ch>
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

Instead of just a callback we can just glue in the gem helpers that
panfrost, v3d and lima currently use. There's really not that many
ways to skin this cat.

v2/3: Rebased.

v4: Repaint this shed. The functions are now called _add_dependency()
and _add_implicit_dependency()

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v3)
Reviewed-by: Steven Price <steven.price@arm.com> (v1)
Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
 drivers/gpu/drm/scheduler/sched_main.c   | 104 +++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  33 ++++++-
 3 files changed, 149 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 89e3f6eaf519..381fbf462ea7 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	job->sched->ops->free_job(job);
 }
 
+static struct dma_fence *
+drm_sched_job_dependency(struct drm_sched_job *job,
+			 struct drm_sched_entity *entity)
+{
+	if (!xa_empty(&job->dependencies))
+		return xa_erase(&job->dependencies, job->last_dependency++);
+
+	if (job->sched->ops->dependency)
+		return job->sched->ops->dependency(job, entity);
+
+	return NULL;
+}
+
 /**
  * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
  *
@@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		/* Wait for all dependencies to avoid data corruptions */
-		while ((f = job->sched->ops->dependency(job, entity)))
+		while ((f = drm_sched_job_dependency(job, entity)))
 			dma_fence_wait(f, false);
 
 		drm_sched_fence_scheduled(s_fence);
@@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
  */
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	struct drm_sched_job *sched_job;
 
 	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		return NULL;
 
 	while ((entity->dependency =
-			sched->ops->dependency(sched_job, entity))) {
+			drm_sched_job_dependency(sched_job, entity))) {
 		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
 
 		if (drm_sched_entity_add_dependency_cb(entity))
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 454cb6164bdc..f77456929139 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -603,6 +603,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	INIT_LIST_HEAD(&job->list);
 
+	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_init);
@@ -637,6 +639,99 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_add_dependency - adds the fence as a job dependency
+ * @job: scheduler job to add the dependencies to
+ * @fence: the dma_fence to add to the list of dependencies.
+ *
+ * Note that @fence is consumed in both the success and error cases.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_add_dependency(struct drm_sched_job *job,
+				 struct dma_fence *fence)
+{
+	struct dma_fence *entry;
+	unsigned long index;
+	u32 id = 0;
+	int ret;
+
+	if (!fence)
+		return 0;
+
+	/* Deduplicate if we already depend on a fence from the same context.
+	 * This lets the size of the array of deps scale with the number of
+	 * engines involved, rather than the number of BOs.
+	 */
+	xa_for_each(&job->dependencies, index, entry) {
+		if (entry->context != fence->context)
+			continue;
+
+		if (dma_fence_is_later(fence, entry)) {
+			dma_fence_put(entry);
+			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
+		} else {
+			dma_fence_put(fence);
+		}
+		return 0;
+	}
+
+	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
+	if (ret != 0)
+		dma_fence_put(fence);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_sched_job_add_dependency);
+
+/**
+ * drm_sched_job_add_implicit_dependencies - adds implicit dependencies as job
+ *   dependencies
+ * @job: scheduler job to add the dependencies to
+ * @obj: the gem object to add new dependencies from.
+ * @write: whether the job might write the object (so we need to depend on
+ * shared fences in the reservation object).
+ *
+ * This should be called after drm_gem_lock_reservations() on your array of
+ * GEM objects used in the job but before updating the reservations with your
+ * own fences.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
+					    struct drm_gem_object *obj,
+					    bool write)
+{
+	int ret;
+	struct dma_fence **fences;
+	unsigned int i, fence_count;
+
+	if (!write) {
+		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
+
+		return drm_sched_job_add_dependency(job, fence);
+	}
+
+	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
+	if (ret || !fence_count)
+		return ret;
+
+	for (i = 0; i < fence_count; i++) {
+		ret = drm_sched_job_add_dependency(job, fences[i]);
+		if (ret)
+			break;
+	}
+
+	for (; i < fence_count; i++)
+		dma_fence_put(fences[i]);
+	kfree(fences);
+	return ret;
+}
+EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
+
+
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
  * @job: scheduler job to clean up
@@ -652,6 +747,9 @@ EXPORT_SYMBOL(drm_sched_job_arm);
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
+	struct dma_fence *fence;
+	unsigned long index;
+
 	if (kref_read(&job->s_fence->finished.refcount)) {
 		/* drm_sched_job_arm() has been called */
 		dma_fence_put(&job->s_fence->finished);
@@ -661,6 +759,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 	}
 
 	job->s_fence = NULL;
+
+	xa_for_each(&job->dependencies, index, fence) {
+		dma_fence_put(fence);
+	}
+	xa_destroy(&job->dependencies);
+
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 83afc3aa8e2f..a47946f904b6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -27,9 +27,12 @@
 #include <drm/spsc_queue.h>
 #include <linux/dma-fence.h>
 #include <linux/completion.h>
+#include <linux/xarray.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
+struct drm_gem_object;
+
 struct drm_gpu_scheduler;
 struct drm_sched_rq;
 
@@ -198,6 +201,17 @@ struct drm_sched_job {
 	enum drm_sched_priority		s_priority;
 	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
+	/**
+	 * @dependencies:
+	 *
+	 * Contains the dependencies as struct dma_fence for this job, see
+	 * drm_sched_job_add_dependency() and
+	 * drm_sched_job_add_implicit_dependencies().
+	 */
+	struct xarray			dependencies;
+
+	/** @last_dependency: tracks @dependencies as they signal */
+	unsigned long			last_dependency;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
@@ -220,9 +234,15 @@ enum drm_gpu_sched_stat {
  */
 struct drm_sched_backend_ops {
 	/**
-         * @dependency: Called when the scheduler is considering scheduling
-         * this job next, to get another struct dma_fence for this job to
-	 * block on.  Once it returns NULL, run_job() may be called.
+	 * @dependency:
+	 *
+	 * Called when the scheduler is considering scheduling this job next, to
+	 * get another struct dma_fence for this job to block on.  Once it
+	 * returns NULL, run_job() may be called.
+	 *
+	 * If a driver exclusively uses drm_sched_job_add_dependency() and
+	 * drm_sched_job_add_implicit_dependencies() this can be ommitted and
+	 * left as NULL.
 	 */
 	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
 					struct drm_sched_entity *s_entity);
@@ -349,6 +369,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
+int drm_sched_job_add_dependency(struct drm_sched_job *job,
+				 struct dma_fence *fence);
+int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
+					    struct drm_gem_object *obj,
+					    bool write);
+
+
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
-- 
2.32.0

