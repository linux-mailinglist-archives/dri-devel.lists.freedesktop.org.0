Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351289C2EC0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5B10E363;
	Sat,  9 Nov 2024 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ya4mmyV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547FE10E359;
 Sat,  9 Nov 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173355; x=1762709355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pVOl7WNTOsrMVXeRIMy6wmjwXhzwv/z4G4PCD14dnh4=;
 b=Ya4mmyV53NACYwZWCA7ARS3dMEQNGIFdsJ/QqGh2puqZ6EOHdqX2XF8E
 F641yhQWn5JhSuQWhgFR9YTk3vUmT2gn963mvsZ4FnxLqjMZYdtcvrxzX
 ICObVqESxQSgSOt+vmTf14mgGPhbLf0ig0flbiHK/4a1EwIrWb3AjTC0o
 3X5EpESpcg9SiqhjQNv+O0mJWaUcTK+r3vhr0gi8eiaiGU7zyWwtsutlQ
 oQFNZfjOVZaxGAkNMRjuRdb5cXn27Zv1HaDqqat1kckmSeEgpUyZd8ZBi
 VXENdAsGtXdf9ZQvnKdoPUYo5gjWKZgwSus8h0opDUOemgWMShY6ZMxM8 A==;
X-CSE-ConnectionGUID: KDblF98XR2Kf95Oqktraqw==
X-CSE-MsgGUID: 5FlDiwCFSw2yBZQbHepYfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600114"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600114"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:14 -0800
X-CSE-ConnectionGUID: 95whTxFXThKZu6vzhGk3eg==
X-CSE-MsgGUID: /F6FtNB2T5+BIaR1IaN66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499488"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 mihail.atanassov@arm.com, steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 2/6] drm/sched: Teach scheduler about
 DMA_RESV_USAGE_PREEMPT
Date: Sat,  9 Nov 2024 09:29:38 -0800
Message-Id: <20241109172942.482630-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Follow the semantics of DMA_RESV_USAGE_PREEMPT in the DRM scheduler by
storing preemptive fences in a dedicated xarray, which is waited on
after all other fences are signaled. In addition to following these
semantics, pipeline preemptive fences by enabling signaling on all
preemptive fences before waiting on any of them.

Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 29 ++++++++++++--
 drivers/gpu/drm/scheduler/sched_main.c   | 48 ++++++++++++++++--------
 include/drm/gpu_scheduler.h              | 15 ++++++++
 3 files changed, 73 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..c6c4978aa65a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -201,11 +201,13 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
 	unsigned long index;
+	struct xarray *dependencies = &job->dependencies;
 
 	dma_fence_put(f);
 
+again:
 	/* Wait for all dependencies to avoid data corruptions */
-	xa_for_each(&job->dependencies, index, f) {
+	xa_for_each(dependencies, index, f) {
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
 
 		if (s_fence && f == &s_fence->scheduled) {
@@ -223,7 +225,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 			dma_fence_put(&s_fence->scheduled);
 		}
 
-		xa_erase(&job->dependencies, index);
+		xa_erase(dependencies, index);
 		if (f && !dma_fence_add_callback(f, &job->finish_cb,
 						 drm_sched_entity_kill_jobs_cb))
 			return;
@@ -231,6 +233,11 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 		dma_fence_put(f);
 	}
 
+	if (dependencies != &job->preempt_dependencies) {
+		dependencies = &job->preempt_dependencies;
+		goto again;
+	}
+
 	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
 	schedule_work(&job->work);
 }
@@ -456,17 +463,33 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 			 struct drm_sched_entity *entity)
 {
 	struct dma_fence *f;
+	struct xarray *dependencies;
+
+again:
+	dependencies = job->resolve_preempt_dependencies ?
+		&job->preempt_dependencies : &job->dependencies;
 
 	/* We keep the fence around, so we can iterate over all dependencies
 	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
 	 * before killing the job.
 	 */
-	f = xa_load(&job->dependencies, job->last_dependency);
+	f = xa_load(dependencies, job->last_dependency);
 	if (f) {
 		job->last_dependency++;
 		return dma_fence_get(f);
 	}
 
+	/* Switch resolving preempt dependencies pipelining signaling */
+	if (!job->resolve_preempt_dependencies) {
+		unsigned long index;
+
+		xa_for_each(&job->preempt_dependencies, index, f)
+			dma_fence_enable_sw_signaling(f);
+
+		job->resolve_preempt_dependencies = true;
+		goto again;
+	}
+
 	if (job->sched->ops->prepare_job)
 		return job->sched->ops->prepare_job(job, entity);
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ce25281c74c..eceb9b8c6f5f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -829,6 +829,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 	INIT_LIST_HEAD(&job->list);
 
 	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
+	xa_init_flags(&job->preempt_dependencies, XA_FLAGS_ALLOC);
 
 	return 0;
 }
@@ -864,21 +865,14 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
-/**
- * drm_sched_job_add_dependency - adds the fence as a job dependency
- * @job: scheduler job to add the dependencies to
- * @fence: the dma_fence to add to the list of dependencies.
- *
- * Note that @fence is consumed in both the success and error cases.
- *
- * Returns:
- * 0 on success, or an error on failing to expand the array.
- */
-int drm_sched_job_add_dependency(struct drm_sched_job *job,
-				 struct dma_fence *fence)
+static int __drm_sched_job_add_dependency(struct drm_sched_job *job,
+					  struct dma_fence *fence,
+					  bool is_preempt)
 {
 	struct dma_fence *entry;
 	unsigned long index;
+	struct xarray *dependencies = is_preempt ? &job->preempt_dependencies :
+		&job->dependencies;
 	u32 id = 0;
 	int ret;
 
@@ -889,25 +883,41 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
 	 */
-	xa_for_each(&job->dependencies, index, entry) {
+	xa_for_each(dependencies, index, entry) {
 		if (entry->context != fence->context)
 			continue;
 
 		if (dma_fence_is_later(fence, entry)) {
 			dma_fence_put(entry);
-			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
+			xa_store(dependencies, index, fence, GFP_KERNEL);
 		} else {
 			dma_fence_put(fence);
 		}
 		return 0;
 	}
 
-	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
+	ret = xa_alloc(dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
 	if (ret != 0)
 		dma_fence_put(fence);
 
 	return ret;
 }
+
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
+	return __drm_sched_job_add_dependency(job, fence, false);
+}
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
 /**
@@ -963,7 +973,9 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
 	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
 		/* Make sure to grab an additional ref on the added fence */
 		dma_fence_get(fence);
-		ret = drm_sched_job_add_dependency(job, fence);
+		ret = __drm_sched_job_add_dependency(job, fence,
+						     cursor.fence_usage ==
+						     DMA_RESV_USAGE_PREEMPT);
 		if (ret) {
 			dma_fence_put(fence);
 			return ret;
@@ -1030,6 +1042,10 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 	}
 	xa_destroy(&job->dependencies);
 
+	xa_for_each(&job->preempt_dependencies, index, fence) {
+		dma_fence_put(fence);
+	}
+	xa_destroy(&job->preempt_dependencies);
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..de16cf6b1869 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -353,6 +353,13 @@ struct drm_sched_job {
 
 	u32				credits;
 
+	/**
+	 * @resolve_preempt_dependencies:
+	 *
+	 * Job is currently resolving preempt dependencies.
+	 */
+	bool				resolve_preempt_dependencies;
+
 	/*
 	 * work is used only after finish_cb has been used and will not be
 	 * accessed anymore.
@@ -376,6 +383,14 @@ struct drm_sched_job {
 	 */
 	struct xarray			dependencies;
 
+	/**
+	 * @preempt_dependencies:
+	 *
+	 * Contains the dependencies as struct dma_fence for this job which are
+	 * preempt fences.
+	 */
+	struct xarray			preempt_dependencies;
+
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
 
-- 
2.34.1

