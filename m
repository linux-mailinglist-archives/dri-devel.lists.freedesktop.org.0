Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BC937612
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 11:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1965910EB90;
	Fri, 19 Jul 2024 09:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a9ca9JXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4FF10EB8D;
 Fri, 19 Jul 2024 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U4l7oPvLpcOUlX63hrBIA6+vXR4CzjUhW0YL7XhDSxU=; b=a9ca9JXenS3gBMVblA7eB7jd+2
 34snSGqcM6qV0+ykcjYgeZh8TyDAZTf1e2st22HrwfUc0y3OqbOdmJyZY8sJaTOEMJ68v/4zwqaGr
 jimT6A5TOuJNtagrFGlpobQyBX2WijajfSZARSgN2JA40sGsvkYmE6tF1QQYQGLT2Vg/AVlAIFPZa
 6g99KCqad2eNhudKwZZlD2mjdUXpiZ9F963/tcdkWdYEbKCDAzcQyMuhiRf8jl+F2AbP1Zi16sBLe
 bZ9FhELw1V4hYkmY/fg6kZKGoVN2dLRcohxBmfRKgEbq5UIc884hh6e4kMDfMCXYwhdayRUKp0/lE
 3DdeIMhw==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sUkD7-00H9MK-25; Fri, 19 Jul 2024 11:47:33 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()
Date: Fri, 19 Jul 2024 10:47:30 +0100
Message-ID: <20240719094730.55301-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Long time ago in commit b3ac17667f11 ("drm/scheduler: rework entity
creation") a change was made which prevented priority changes for entities
with only one assigned scheduler.

The commit reduced drm_sched_entity_set_priority() to simply update the
entities priority, but the run queue selection logic in
drm_sched_entity_select_rq() was never able to actually change the
originally assigned run queue.

In practice that only affected amdgpu, being the only driver which can do
dynamic priority changes. And that appears was attempted to be rectified
there in 2316a86bde49 ("drm/amdgpu: change hw sched list on ctx priority
override").

A few unresolved problems however were that this only fixed
drm_sched_entity_set_priority() *if* drm_sched_entity_modify_sched() was
called first. That was not documented anywhere.

Secondly, this only works if drm_sched_entity_modify_sched() is actually
called, which in amdgpu's case today is true only for gfx and compute.
Priority changes for other engines with only one scheduler assigned, such
as jpeg and video decode will still not work.

Note that this was also noticed in 981b04d96856 ("drm/sched: improve docs
around drm_sched_entity").

Completely different set of non-obvious confusion was that whereas
drm_sched_entity_init() was not keeping the passed in list of schedulers
(courtesy of 8c23056bdc7a ("drm/scheduler: do not keep a copy of sched
list")), drm_sched_entity_modify_sched() was disagreeing with that and
would simply assign the single item list.

That incosistency appears to be semi-silently fixed in ac4eb83ab255
("drm/sched: select new rq even if there is only one v3").

What was also not documented is why it was important to not keep the
list of schedulers when there is only one. I suspect it could have
something to do with the fact the passed in array is on stack for many
callers with just one scheduler. With more than one scheduler amdgpu is
the only caller, and there the container is not on the stack. Keeping a
stack backed list in the entity would obviously be undefined behaviour
*if* the list was kept.

Amdgpu however did only stop passing in stack backed container for the more
than one scheduler case in 977f7e1068be ("drm/amdgpu: allocate entities on
demand"). Until then I suspect dereferencing freed stack from
drm_sched_entity_select_rq() was still present.

In order to untangle all that and fix priority changes this patch is
bringing back the entity owned container for storing the passed in
scheduler list. Container is now owned by the entity and the pointers are
owned by the drivers. List of schedulers is always kept including for the
one scheduler case.

The patch can therefore also removes the single scheduler special case,
which means that priority changes should now work (be able to change the
selected run-queue) for all drivers and engines. In other words
drm_sched_entity_set_priority() should now just work for all cases.

To enable maintaining its own container some API calls needed to grow a
capability for returning success/failure, which is a change which
percolates mostly through amdgpu source.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: b3ac17667f11 ("drm/scheduler: rework entity creation")
References: 8c23056bdc7a ("drm/scheduler: do not keep a copy of sched list")
References: 977f7e1068be ("drm/amdgpu: allocate entities on demand")
References: 2316a86bde49 ("drm/amdgpu: change hw sched list on ctx priority override")
References: ac4eb83ab255 ("drm/sched: select new rq even if there is only one v3")
References: 981b04d96856 ("drm/sched: improve docs around drm_sched_entity")
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.6+
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 31 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 13 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c   |  3 +-
 drivers/gpu/drm/scheduler/sched_entity.c  | 96 ++++++++++++++++-------
 include/drm/gpu_scheduler.h               | 16 ++--
 6 files changed, 100 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 5cb33ac99f70..387247f8307e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -802,15 +802,15 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
 	return fence;
 }
 
-static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
-					   struct amdgpu_ctx_entity *aentity,
-					   int hw_ip,
-					   int32_t priority)
+static int amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
+					  struct amdgpu_ctx_entity *aentity,
+					  int hw_ip,
+					  int32_t priority)
 {
 	struct amdgpu_device *adev = ctx->mgr->adev;
-	unsigned int hw_prio;
 	struct drm_gpu_scheduler **scheds = NULL;
-	unsigned num_scheds;
+	unsigned int hw_prio, num_scheds;
+	int ret = 0;
 
 	/* set sw priority */
 	drm_sched_entity_set_priority(&aentity->entity,
@@ -822,16 +822,18 @@ static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
 		hw_prio = array_index_nospec(hw_prio, AMDGPU_RING_PRIO_MAX);
 		scheds = adev->gpu_sched[hw_ip][hw_prio].sched;
 		num_scheds = adev->gpu_sched[hw_ip][hw_prio].num_scheds;
-		drm_sched_entity_modify_sched(&aentity->entity, scheds,
-					      num_scheds);
+		ret = drm_sched_entity_modify_sched(&aentity->entity, scheds,
+						    num_scheds);
 	}
+
+	return ret;
 }
 
-void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
-				  int32_t priority)
+int amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t priority)
 {
 	int32_t ctx_prio;
 	unsigned i, j;
+	int ret;
 
 	ctx->override_priority = priority;
 
@@ -842,10 +844,15 @@ void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
 			if (!ctx->entities[i][j])
 				continue;
 
-			amdgpu_ctx_set_entity_priority(ctx, ctx->entities[i][j],
-						       i, ctx_prio);
+			ret = amdgpu_ctx_set_entity_priority(ctx,
+							     ctx->entities[i][j],
+							     i, ctx_prio);
+			if (ret)
+				return ret;
 		}
 	}
+
+	return 0;
 }
 
 int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 85376baaa92f..835661515e33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -82,7 +82,7 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
 				       struct drm_sched_entity *entity,
 				       uint64_t seq);
 bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
-void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t ctx_prio);
+int amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t ctx_prio);
 
 int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *filp);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index 863b2a34b2d6..944edb7f00a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -54,12 +54,15 @@ static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
 
 	mgr = &fpriv->ctx_mgr;
 	mutex_lock(&mgr->lock);
-	idr_for_each_entry(&mgr->ctx_handles, ctx, id)
-		amdgpu_ctx_priority_override(ctx, priority);
+	idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
+		r = amdgpu_ctx_priority_override(ctx, priority);
+		if (r)
+			break;
+	}
 	mutex_unlock(&mgr->lock);
 
 	fdput(f);
-	return 0;
+	return r;
 }
 
 static int amdgpu_sched_context_priority_override(struct amdgpu_device *adev,
@@ -88,11 +91,11 @@ static int amdgpu_sched_context_priority_override(struct amdgpu_device *adev,
 		return -EINVAL;
 	}
 
-	amdgpu_ctx_priority_override(ctx, priority);
+	r = amdgpu_ctx_priority_override(ctx, priority);
 	amdgpu_ctx_put(ctx);
 	fdput(f);
 
-	return 0;
+	return r;
 }
 
 int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 81fb99729f37..2453decc73c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -1362,8 +1362,7 @@ static int vcn_v4_0_5_limit_sched(struct amdgpu_cs_parser *p,
 
 	scheds = p->adev->gpu_sched[AMDGPU_HW_IP_VCN_ENC]
 		[AMDGPU_RING_PRIO_0].sched;
-	drm_sched_entity_modify_sched(job->base.entity, scheds, 1);
-	return 0;
+	return drm_sched_entity_modify_sched(job->base.entity, scheds, 1);
 }
 
 static int vcn_v4_0_5_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..cb5cc65f461d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -45,7 +45,12 @@
  * @guilty: atomic_t set to 1 when a job on this queue
  *          is found to be guilty causing a timeout
  *
- * Note that the &sched_list must have at least one element to schedule the entity.
+ * Note that the &sched_list must have at least one element to schedule the
+ * entity.
+ *
+ * The individual drm_gpu_scheduler pointers have borrow semantics, ie.
+ * they must remain valid during entities lifetime, while the containing
+ * array can be freed after this call returns.
  *
  * For changing @priority later on at runtime see
  * drm_sched_entity_set_priority(). For changing the set of schedulers
@@ -69,27 +74,24 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
 	entity->guilty = guilty;
-	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
-	/*
-	 * It's perfectly valid to initialize an entity without having a valid
-	 * scheduler attached. It's just not valid to use the scheduler before it
-	 * is initialized itself.
-	 */
-	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if (num_sched_list && !sched_list[0]->sched_rq) {
-		/* Since every entry covered by num_sched_list
-		 * should be non-NULL and therefore we warn drivers
-		 * not to do this and to fix their DRM calling order.
-		 */
-		pr_warn("%s: called with uninitialized scheduler\n", __func__);
-	} else if (num_sched_list) {
-		/* The "priority" of an entity cannot exceed the number of run-queues of a
-		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
-		 * the lowest priority available.
+	if (num_sched_list) {
+		int ret;
+
+		ret = drm_sched_entity_modify_sched(entity,
+						    sched_list,
+						    num_sched_list);
+		if (ret)
+			return ret;
+
+		/*
+		 * The "priority" of an entity cannot exceed the number of
+		 * run-queues of a scheduler. Protect against num_rqs being 0,
+		 * by converting to signed. Choose the lowest priority
+		 * available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
@@ -122,19 +124,58 @@ EXPORT_SYMBOL(drm_sched_entity_init);
  *		 existing entity->sched_list
  * @num_sched_list: number of drm sched in sched_list
  *
+ * The individual drm_gpu_scheduler pointers have borrow semantics, ie.
+ * they must remain valid during entities lifetime, while the containing
+ * array can be freed after this call returns.
+ *
  * Note that this must be called under the same common lock for @entity as
  * drm_sched_job_arm() and drm_sched_entity_push_job(), or the driver needs to
  * guarantee through some other means that this is never called while new jobs
  * can be pushed to @entity.
+ *
+ * Returns zero on success and a negative error code on failure.
  */
-void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
-				    struct drm_gpu_scheduler **sched_list,
-				    unsigned int num_sched_list)
+int drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
+				  struct drm_gpu_scheduler **sched_list,
+				  unsigned int num_sched_list)
 {
-	WARN_ON(!num_sched_list || !sched_list);
+	struct drm_gpu_scheduler **new, **old;
+	unsigned int i;
 
-	entity->sched_list = sched_list;
+	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
+		return -EINVAL;
+
+	/*
+	 * It's perfectly valid to initialize an entity without having a valid
+	 * scheduler attached. It's just not valid to use the scheduler before
+	 * it is initialized itself.
+	 *
+	 * Since every entry covered by num_sched_list should be non-NULL and
+	 * therefore we warn drivers not to do this and to fix their DRM calling
+	 * order.
+	 */
+	for (i = 0; i < num_sched_list; i++) {
+		if (!sched_list[i]) {
+			pr_warn("%s: called with uninitialized scheduler %u!\n",
+				__func__, i);
+			return -EINVAL;
+		}
+	}
+
+	new = kmemdup_array(sched_list,
+			    num_sched_list,
+			    sizeof(*sched_list),
+			    GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	old = entity->sched_list;
+	entity->sched_list = new;
 	entity->num_sched_list = num_sched_list;
+
+	kfree(old);
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_modify_sched);
 
@@ -341,6 +382,8 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 
 	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+
+	kfree(entity->sched_list);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
@@ -531,10 +574,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
-	/* single possible engine and already selected */
-	if (!entity->sched_list)
-		return;
-
 	/* queue non-empty, stay on the same engine */
 	if (spsc_queue_count(&entity->job_queue))
 		return;
@@ -561,9 +600,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 		entity->rq = rq;
 	}
 	spin_unlock(&entity->rq_lock);
-
-	if (entity->num_sched_list == 1)
-		entity->sched_list = NULL;
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..09e1d063a5c0 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -110,18 +110,12 @@ struct drm_sched_entity {
 	/**
 	 * @sched_list:
 	 *
-	 * A list of schedulers (struct drm_gpu_scheduler).  Jobs from this entity can
-	 * be scheduled on any scheduler on this list.
+	 * A list of schedulers (struct drm_gpu_scheduler).  Jobs from this
+	 * entity can be scheduled on any scheduler on this list.
 	 *
 	 * This can be modified by calling drm_sched_entity_modify_sched().
 	 * Locking is entirely up to the driver, see the above function for more
 	 * details.
-	 *
-	 * This will be set to NULL if &num_sched_list equals 1 and @rq has been
-	 * set already.
-	 *
-	 * FIXME: This means priority changes through
-	 * drm_sched_entity_set_priority() will be lost henceforth in this case.
 	 */
 	struct drm_gpu_scheduler        **sched_list;
 
@@ -568,9 +562,9 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    bool write);
 
 
-void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
-				    struct drm_gpu_scheduler **sched_list,
-                                   unsigned int num_sched_list);
+int drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
+				  struct drm_gpu_scheduler **sched_list,
+				  unsigned int num_sched_list);
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-- 
2.44.0

