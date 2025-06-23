Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F2AE4031
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249D610E3A7;
	Mon, 23 Jun 2025 12:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z5bh+rX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1B610E399;
 Mon, 23 Jun 2025 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lnXKOVD0w0FmAdcMKTewHphfr62RHepl5TopkuEf2rI=; b=Z5bh+rX06E/NwZ+nWDNH2/d9e4
 wrgzeAbCQn6LOpRLIY6kNNldHM6S4htT5whk2Yi4F2ONw8lv/MtL02V2VmWtiSvG34piLKbPrPkIg
 jULnaep7/XEcKvoEYc2mrJHaEVcCEULUZ6Y/bMfNaKX3KhIl5fVXx9JN8Pq9ps+EeTM++Z5KO/p+3
 UEDCyml2BFYPGC/pLBFJzwpMAuqyKG0gWCHkhuyrRXK48UrWXaHFyzfntAEgIwtO1Narx38svMK/c
 /VwJ20KjnKYfifuTjmaYTkinyYRT8nOLJr0Rwvpm8h4NDTsJDtuRAnpZ6hlOHd9f0UjrRuWxZAY7P
 STumVxTQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uTgHM-007U4v-5x; Mon, 23 Jun 2025 14:28:04 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 16/16] drm/sched: Embed run queue singleton into the
 scheduler
Date: Mon, 23 Jun 2025 13:27:46 +0100
Message-ID: <20250623122746.46478-17-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
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

Now that the run queue to scheduler relationship is always 1:1 we can
embed it (the run queue) directly in the scheduler struct and save on
some allocation error handling code and such.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |  5 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |  8 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  8 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |  8 +++---
 drivers/gpu/drm/scheduler/sched_entity.c    | 32 +++++++++------------
 drivers/gpu/drm/scheduler/sched_fence.c     |  2 +-
 drivers/gpu/drm/scheduler/sched_internal.h  |  6 ++--
 drivers/gpu/drm/scheduler/sched_main.c      | 31 ++++----------------
 drivers/gpu/drm/scheduler/sched_rq.c        | 18 ++++++------
 include/drm/gpu_scheduler.h                 |  5 +---
 12 files changed, 58 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 4240a6de1f32..98c2228fe715 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1118,7 +1118,8 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush) {
 		for (i = 0; i < p->gang_size; ++i) {
 			struct drm_sched_entity *entity = p->entities[i];
-			struct drm_gpu_scheduler *sched = entity->rq->sched;
+			struct drm_gpu_scheduler *sched =
+				container_of(entity->rq, typeof(*sched), rq);
 			struct amdgpu_ring *ring = to_amdgpu_ring(sched);
 
 			if (amdgpu_vmid_uses_reserved(vm, ring->vm_hub))
@@ -1246,7 +1247,8 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	sched = p->gang_leader->base.entity->rq->sched;
+	sched = container_of(p->gang_leader->base.entity->rq, typeof(*sched),
+			     rq);
 	while ((fence = amdgpu_sync_get_fence(&p->sync))) {
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(fence);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c0cb8b0193f2..b0e614f520f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -362,7 +362,9 @@ static struct dma_fence *
 amdgpu_job_prepare_job(struct drm_sched_job *sched_job,
 		      struct drm_sched_entity *s_entity)
 {
-	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
+	struct drm_gpu_scheduler *sched =
+		container_of(s_entity->rq, typeof(*sched), rq);
+	struct amdgpu_ring *ring = to_amdgpu_ring(sched);
 	struct amdgpu_job *job = to_amdgpu_job(sched_job);
 	struct dma_fence *fence;
 	int r;
@@ -462,7 +464,7 @@ drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
 
 void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 {
-	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_rq *rq = &sched->rq;
 	struct drm_sched_entity *s_entity;
 	struct drm_sched_job *s_job;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 2f302266662b..d7415eb32982 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -86,7 +86,10 @@ struct amdgpu_job {
 
 static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
 {
-	return to_amdgpu_ring(job->base.entity->rq->sched);
+	struct drm_gpu_scheduler *sched =
+		container_of(job->base.entity->rq, typeof(*sched), rq);
+
+	return to_amdgpu_ring(sched);
 }
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index d13e64a69e25..85724ec6aaf8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -145,6 +145,7 @@ TRACE_EVENT(amdgpu_cs,
 		     struct amdgpu_ib *ib),
 	    TP_ARGS(p, job, ib),
 	    TP_STRUCT__entry(
+			     __field(struct drm_gpu_scheduler *, sched)
 			     __field(struct amdgpu_bo_list *, bo_list)
 			     __field(u32, ring)
 			     __field(u32, dw)
@@ -152,11 +153,14 @@ TRACE_EVENT(amdgpu_cs,
 			     ),
 
 	    TP_fast_assign(
+			   __entry->sched = container_of(job->base.entity->rq,
+							 typeof(*__entry->sched),
+							 rq);
 			   __entry->bo_list = p->bo_list;
-			   __entry->ring = to_amdgpu_ring(job->base.entity->rq->sched)->idx;
+			   __entry->ring = to_amdgpu_ring(__entry->sched)->idx;
 			   __entry->dw = ib->length_dw;
 			   __entry->fences = amdgpu_fence_count_emitted(
-				to_amdgpu_ring(job->base.entity->rq->sched));
+				to_amdgpu_ring(__entry->sched));
 			   ),
 	    TP_printk("bo_list=%p, ring=%u, dw=%u, fences=%u",
 		      __entry->bo_list, __entry->ring, __entry->dw,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 46d9fb433ab2..42f2bfb30af1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -105,13 +105,13 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 				 struct dma_fence **fence)
 {
+	struct drm_gpu_scheduler *sched =
+		container_of(p->vm->delayed.rq, typeof(*sched), rq);
+	struct amdgpu_ring *ring =
+		container_of(sched, struct amdgpu_ring, sched);
 	struct amdgpu_ib *ib = p->job->ibs;
-	struct amdgpu_ring *ring;
 	struct dma_fence *f;
 
-	ring = container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
-			    sched);
-
 	WARN_ON(ib->length_dw == 0);
 	amdgpu_ring_pad_ib(ring, ib);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index 322816805bfb..38318aab7a52 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -432,15 +432,15 @@ int amdgpu_xcp_open_device(struct amdgpu_device *adev,
 void amdgpu_xcp_release_sched(struct amdgpu_device *adev,
 				  struct amdgpu_ctx_entity *entity)
 {
-	struct drm_gpu_scheduler *sched;
-	struct amdgpu_ring *ring;
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->entity.rq, typeof(*sched), rq);
 
 	if (!adev->xcp_mgr)
 		return;
 
-	sched = entity->entity.rq->sched;
 	if (drm_sched_wqueue_ready(sched)) {
-		ring = to_amdgpu_ring(entity->entity.rq->sched);
+		struct amdgpu_ring *ring = to_amdgpu_ring(sched);
+
 		atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
 	}
 }
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 3dce102e9880..bd2a6c36aef4 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -104,19 +104,12 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	 * is initialized itself.
 	 */
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
+	if (num_sched_list) {
+		entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
+		entity->rq = &sched_list[0]->rq;
+	}
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
-
-	if (num_sched_list && !sched_list[0]->rq) {
-		/* Since every entry covered by num_sched_list
-		 * should be non-NULL and therefore we warn drivers
-		 * not to do this and to fix their DRM calling order.
-		 */
-		pr_warn("%s: called with uninitialized scheduler\n", __func__);
-	} else if (num_sched_list) {
-		entity->rq = sched_list[0]->rq;
-	}
-
 	init_completion(&entity->entity_idle);
 
 	/* We start in an idle state. */
@@ -304,7 +297,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	if (!entity->rq)
 		return 0;
 
-	sched = entity->rq->sched;
+	sched = container_of(entity->rq, typeof(*sched), rq);
 	/**
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
@@ -396,9 +389,11 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 {
 	struct drm_sched_entity *entity =
 		container_of(cb, struct drm_sched_entity, cb);
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->rq, typeof(*sched), rq);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(sched);
 }
 
 /**
@@ -424,7 +419,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->rq, typeof(*sched), rq);
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -563,7 +559,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->rq : NULL;
+	rq = sched ? &sched->rq : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
@@ -586,6 +582,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->rq, typeof(*sched), rq);
 	bool first;
 
 	trace_drm_sched_job_queue(sched_job, entity);
@@ -597,7 +595,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		xa_for_each(&sched_job->dependencies, index, entry)
 			trace_drm_sched_job_add_dep(sched_job, entry);
 	}
-	atomic_inc(entity->rq->sched->score);
+	atomic_inc(sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -608,8 +606,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 	/* first job wakes up scheduler */
 	if (first) {
-		struct drm_gpu_scheduler *sched;
-
 		sched = drm_sched_rq_add_entity(entity);
 		if (sched)
 			drm_sched_wakeup(sched);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 9391d6f0dc01..da4f53a9ca35 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -227,7 +227,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = entity->rq->sched;
+	fence->sched = container_of(entity->rq, typeof(*fence->sched), rq);
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index fcba928289de..4fa05f8bf9be 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -17,11 +17,9 @@ struct drm_sched_entity_stats {
 
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 
-void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_rq *rq);
+void drm_sched_rq_init(struct drm_gpu_scheduler *sched);
 struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
-			   struct drm_sched_rq *rq);
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched);
 struct drm_gpu_scheduler *
 drm_sched_rq_add_entity(struct drm_sched_entity *entity);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ca0d960b424..1c2f5b953156 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -578,7 +578,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	BUG_ON(!entity);
 	drm_sched_entity_select_rq(entity);
-	sched = entity->rq->sched;
+	sched = container_of(entity->rq, typeof(*sched), rq);
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
@@ -919,7 +919,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	while (!READ_ONCE(sched->pause_submit)) {
 		/* Find entity with a ready job */
-		entity = drm_sched_rq_select_entity(sched, sched->rq);
+		entity = drm_sched_rq_select_entity(sched);
 		if (!entity)
 			break;	/* No more work */
 
@@ -1017,15 +1017,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
-	if (sched->rq) {
-		/* Not an error, but warn anyway so drivers can
-		 * fine-tune their DRM calling order, and return all
-		 * is good.
-		 */
-		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__);
-		return 0;
-	}
-
 	if (args->submit_wq) {
 		sched->submit_wq = args->submit_wq;
 		sched->own_submit_wq = false;
@@ -1037,11 +1028,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 		sched->own_submit_wq = true;
 	}
 
-	sched->rq = kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
-	if (!sched->rq)
-		goto Out_check_own;
-
-	drm_sched_rq_init(sched, sched->rq);
+	drm_sched_rq_init(sched);
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
@@ -1056,12 +1043,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ready = true;
 	return 0;
-
-Out_check_own:
-	if (sched->own_submit_wq)
-		destroy_workqueue(sched->submit_wq);
-	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
-	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_sched_init);
 
@@ -1089,7 +1070,7 @@ EXPORT_SYMBOL(drm_sched_init);
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
 
-	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_rq *rq = &sched->rq;
 	struct drm_sched_entity *s_entity;
 
 	drm_sched_wqueue_stop(sched);
@@ -1113,8 +1094,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
-	kfree(sched->rq);
-	sched->rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1131,7 +1110,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 {
 	struct drm_gpu_scheduler *sched = bad->sched;
 	struct drm_sched_entity *entity, *tmp;
-	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_rq *rq = &sched->rq;
 
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index b18265c7f073..f2f10f7d6ddf 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -52,17 +52,16 @@ static void drm_sched_rq_update_tree_locked(struct drm_sched_entity *entity,
  * drm_sched_rq_init - initialize a given run queue struct
  *
  * @sched: scheduler instance to associate with this run queue
- * @rq: scheduler run queue
  *
  * Initializes a scheduler runqueue.
  */
-void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_rq *rq)
+void drm_sched_rq_init(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_rq *rq = &sched->rq;
+
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
-	rq->sched = sched;
 }
 
 static ktime_t
@@ -109,8 +108,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity)
 	}
 
 	rq = entity->rq;
+	sched = container_of(rq, typeof(*sched), rq);
 	spin_lock(&rq->lock);
-	sched = rq->sched;
 
 	if (list_empty(&entity->list)) {
 		atomic_inc(sched->score);
@@ -138,6 +137,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity)
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	struct drm_gpu_scheduler *sched = container_of(rq, typeof(*sched), rq);
+
 	lockdep_assert_held(&entity->lock);
 
 	if (list_empty(&entity->list))
@@ -145,7 +146,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 
 	spin_lock(&rq->lock);
 
-	atomic_dec(rq->sched->score);
+	atomic_dec(sched->score);
 	list_del_init(&entity->list);
 
 	drm_sched_rq_remove_tree_locked(entity, rq);
@@ -186,16 +187,15 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
  * drm_sched_rq_select_entity - Select an entity which provides a job to run
  *
  * @sched: the gpu scheduler
- * @rq: scheduler run queue to check.
  *
  * Find oldest waiting ready entity.
  *
  * Return an entity if one is found or NULL if no ready entity was found.
  */
 struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
-			   struct drm_sched_rq *rq)
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_rq *rq = &sched->rq;
 	struct rb_node *rb;
 
 	spin_lock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ba3b1bdb8f22..f3daa9295182 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -242,7 +242,6 @@ struct drm_sched_entity {
 /**
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
- * @sched: the scheduler to which this rq belongs to.
  * @lock: protects @entities, @rb_tree_root and @rr_deadline.
  * @entities: list of the entities to be scheduled.
  * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
@@ -252,8 +251,6 @@ struct drm_sched_entity {
  * the next entity to emit commands from.
  */
 struct drm_sched_rq {
-	struct drm_gpu_scheduler	*sched;
-
 	spinlock_t			lock;
 	/* Following members are protected by the @lock: */
 	ktime_t				rr_deadline;
@@ -550,7 +547,7 @@ struct drm_gpu_scheduler {
 	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq             *rq;
+	struct drm_sched_rq             rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
-- 
2.48.0

