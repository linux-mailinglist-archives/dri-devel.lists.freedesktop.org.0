Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB223F36E3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0046EB52;
	Fri, 20 Aug 2021 22:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EC26EB2C;
 Fri, 20 Aug 2021 22:50:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580031"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580031"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098558"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 01/27] drm/i915/guc: Squash Clean up GuC CI failures,
 simplify locking, and kernel DOC
Date: Fri, 20 Aug 2021 15:44:20 -0700
Message-Id: <20210820224446.30620-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

https://patchwork.freedesktop.org/series/93704/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  19 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  81 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   4 -
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  19 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   6 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 952 +++++++++++-------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 +++
 drivers/gpu/drm/i915/i915_gpu_error.c         |  39 +-
 drivers/gpu/drm/i915/i915_request.h           |  23 +-
 drivers/gpu/drm/i915/i915_trace.h             |  12 +-
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 drivers/gpu/drm/i915/selftests/i915_request.c | 100 ++
 .../i915/selftests/intel_scheduler_helpers.c  |  12 +
 .../i915/selftests/intel_scheduler_helpers.h  |   2 +
 16 files changed, 965 insertions(+), 466 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 745e84c72c90..adfe49b53b1b 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -394,19 +394,18 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
+	INIT_LIST_HEAD(&ce->guc_state.requests);
 
-	spin_lock_init(&ce->guc_active.lock);
-	INIT_LIST_HEAD(&ce->guc_active.requests);
-
-	ce->guc_id = GUC_INVALID_LRC_ID;
-	INIT_LIST_HEAD(&ce->guc_id_link);
+	ce->guc_id.id = GUC_INVALID_LRC_ID;
+	INIT_LIST_HEAD(&ce->guc_id.link);
 
 	/*
 	 * Initialize fence to be complete as this is expected to be complete
 	 * unless there is a pending schedule disable outstanding.
 	 */
-	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
-	i915_sw_fence_commit(&ce->guc_blocked);
+	i915_sw_fence_init(&ce->guc_state.blocked_fence,
+			   sw_fence_dummy_notify);
+	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
 
 	i915_active_init(&ce->active,
 			 __intel_context_active, __intel_context_retire, 0);
@@ -520,15 +519,15 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 
 	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
 
-	spin_lock_irqsave(&ce->guc_active.lock, flags);
-	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
 				    sched.link) {
 		if (i915_request_completed(rq))
 			break;
 
 		active = rq;
 	}
-	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	return active;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e54351a170e2..80bbdc7810f6 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -112,6 +112,7 @@ struct intel_context {
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
 #define CONTEXT_LRCA_DIRTY		9
+#define CONTEXT_GUC_INIT		10
 
 	struct {
 		u64 timeout_us;
@@ -155,49 +156,73 @@ struct intel_context {
 	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
 
 	struct {
-		/** lock: protects everything in guc_state */
+		/** @lock: protects everything in guc_state */
 		spinlock_t lock;
 		/**
-		 * sched_state: scheduling state of this context using GuC
+		 * @sched_state: scheduling state of this context using GuC
 		 * submission
 		 */
-		u16 sched_state;
+		u32 sched_state;
 		/*
-		 * fences: maintains of list of requests that have a submit
-		 * fence related to GuC submission
+		 * @fences: maintains a list of requests are currently being
+		 * fenced until a GuC operation completes
 		 */
 		struct list_head fences;
+		/**
+		 * @blocked_fence: fence used to signal when the blocking of a
+		 * contexts submissions is complete.
+		 */
+		struct i915_sw_fence blocked_fence;
+		/** @number_committed_requests: number of committed requests */
+		int number_committed_requests;
+		/** @requests: list of active requests on this context */
+		struct list_head requests;
+		/** @prio: the contexts current guc priority */
+		u8 prio;
+		/**
+		 * @prio_count: a counter of the number requests inflight in
+		 * each priority bucket
+		 */
+		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
 	} guc_state;
 
 	struct {
-		/** lock: protects everything in guc_active */
-		spinlock_t lock;
-		/** requests: active requests on this context */
-		struct list_head requests;
-	} guc_active;
-
-	/* GuC scheduling state flags that do not require a lock. */
-	atomic_t guc_sched_state_no_lock;
-
-	/* GuC LRC descriptor ID */
-	u16 guc_id;
-
-	/* GuC LRC descriptor reference count */
-	atomic_t guc_id_ref;
+		/**
+		 * @id: unique handle which is used to communicate information
+		 * with the GuC about this context, protected by
+		 * guc->contexts_lock
+		 */
+		u16 id;
+		/**
+		 * @ref: the number of references to the guc_id, when
+		 * transitioning in and out of zero protected by
+		 * guc->contexts_lock
+		 */
+		atomic_t ref;
+		/**
+		 * @link: in guc->guc_id_list when the guc_id has no refs but is
+		 * still valid, protected by guc->contexts_lock
+		 */
+		struct list_head link;
+	} guc_id;
 
-	/*
-	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
+#ifdef CONFIG_DRM_I915_SELFTEST
+	/**
+	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
 	 */
-	struct list_head guc_id_link;
+	bool drop_schedule_enable;
 
-	/* GuC context blocked fence */
-	struct i915_sw_fence guc_blocked;
+	/**
+	 * @drop_schedule_disable: Force drop of schedule disable G2H for
+	 * selftest
+	 */
+	bool drop_schedule_disable;
 
-	/*
-	 * GuC priority management
+	/**
+	 * @drop_deregister: Force drop of deregister G2H for selftest
 	 */
-	u8 guc_prio;
-	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
+	bool drop_deregister;
+#endif
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de5f9c86b9a4..cafb0608ffb4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2140,10 +2140,6 @@ static void __execlists_unhold(struct i915_request *rq)
 			if (p->flags & I915_DEPENDENCY_WEAK)
 				continue;
 
-			/* Propagate any change in error status */
-			if (rq->fence.error)
-				i915_request_set_error_once(w, rq->fence.error);
-
 			if (w->engine != rq->engine)
 				continue;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 08f011f893b2..bf43bed905db 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -789,7 +789,7 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 				if (err)
 					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
 					       engine->name, rq->fence.context,
-					       rq->fence.seqno, rq->context->guc_id, err);
+					       rq->fence.seqno, rq->context->guc_id.id, err);
 			}
 
 skip:
@@ -1098,7 +1098,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 				if (err)
 					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
 					       engine->name, rq->fence.context,
-					       rq->fence.seqno, rq->context->guc_id, err);
+					       rq->fence.seqno, rq->context->guc_id.id, err);
 			}
 
 			count++;
@@ -1108,7 +1108,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 					pr_err("i915_reset_engine(%s:%s): failed to reset request %lld:%lld [0x%04X]\n",
 					       engine->name, test_name,
 					       rq->fence.context,
-					       rq->fence.seqno, rq->context->guc_id);
+					       rq->fence.seqno, rq->context->guc_id.id);
 					i915_request_put(rq);
 
 					GEM_TRACE_DUMP();
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index b0977a3b699b..cdc6ae48a1e1 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1074,6 +1074,32 @@ record_registers(struct intel_context *ce,
 	goto err_after;
 }
 
+static u32 safe_offset(u32 offset, u32 reg)
+{
+	/* XXX skip testing of watchdog - VLK-22772 */
+	if (offset == 0x178 || offset == 0x17c)
+		reg = 0;
+
+	return reg;
+}
+
+static int get_offset_mask(struct intel_engine_cs *engine)
+{
+	if (GRAPHICS_VER(engine->i915) < 12)
+		return 0xfff;
+
+	switch (engine->class) {
+	default:
+	case RENDER_CLASS:
+		return 0x07ff;
+	case COPY_ENGINE_CLASS:
+		return 0x0fff;
+	case VIDEO_DECODE_CLASS:
+	case VIDEO_ENHANCEMENT_CLASS:
+		return 0x3fff;
+	}
+}
+
 static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 {
 	struct i915_vma *batch;
@@ -1117,7 +1143,8 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 		len = (len + 1) / 2;
 		*cs++ = MI_LOAD_REGISTER_IMM(len);
 		while (len--) {
-			*cs++ = hw[dw];
+			*cs++ = safe_offset(hw[dw] & get_offset_mask(ce->engine),
+					    hw[dw]);
 			*cs++ = poison;
 			dw += 2;
 		}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 2e27fe59786b..112dd29a63fe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -41,6 +41,10 @@ struct intel_guc {
 	spinlock_t irq_lock;
 	unsigned int msg_enabled_mask;
 
+	/**
+	 * @outstanding_submission_g2h: number of outstanding G2H related to GuC
+	 * submission, used to determine if the GT is idle
+	 */
 	atomic_t outstanding_submission_g2h;
 
 	struct {
@@ -49,12 +53,16 @@ struct intel_guc {
 		void (*disable)(struct intel_guc *guc);
 	} interrupts;
 
-	/*
-	 * contexts_lock protects the pool of free guc ids and a linked list of
-	 * guc ids available to be stolen
+	/**
+	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
+	 * ce->guc_id.ref when transitioning in and out of zero
 	 */
 	spinlock_t contexts_lock;
+	/** @guc_ids: used to allocate new guc_ids */
 	struct ida guc_ids;
+	/**
+	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
+	 */
 	struct list_head guc_id_list;
 
 	bool submission_supported;
@@ -70,7 +78,10 @@ struct intel_guc {
 	struct i915_vma *lrc_desc_pool;
 	void *lrc_desc_pool_vaddr;
 
-	/* guc_id to intel_context lookup */
+	/**
+	 * @context_lookup: used to resolve intel_context from guc_id, if a
+	 * context is present in this structure it is registered with the GuC
+	 */
 	struct xarray context_lookup;
 
 	/* Control params for fw initialization */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 22b4733b55e2..20c710a74498 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1042,9 +1042,9 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
 		container_of(w, struct intel_guc_ct, requests.worker);
 	bool done;
 
-	done = ct_process_incoming_requests(ct);
-	if (!done)
-		queue_work(system_unbound_wq, &ct->requests.worker);
+	do {
+		done = ct_process_incoming_requests(ct);
+	} while (!done);
 }
 
 static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 87d8dc8f51b9..46158d996bf6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -28,21 +28,6 @@
 /**
  * DOC: GuC-based command submission
  *
- * IMPORTANT NOTE: GuC submission is currently not supported in i915. The GuC
- * firmware is moving to an updated submission interface and we plan to
- * turn submission back on when that lands. The below documentation (and related
- * code) matches the old submission model and will be updated as part of the
- * upgrade to the new flow.
- *
- * GuC stage descriptor:
- * During initialization, the driver allocates a static pool of 1024 such
- * descriptors, and shares them with the GuC. Currently, we only use one
- * descriptor. This stage descriptor lets the GuC know about the workqueue and
- * process descriptor. Theoretically, it also lets the GuC know about our HW
- * contexts (context ID, etc...), but we actually employ a kind of submission
- * where the GuC uses the LRCA sent via the work item instead. This is called
- * a "proxy" submission.
- *
  * The Scratch registers:
  * There are 16 MMIO-based registers start from 0xC180. The kernel driver writes
  * a value to the action register (SOFT_SCRATCH_0) along with any data. It then
@@ -51,14 +36,82 @@
  * processes the request. The kernel driver polls waiting for this update and
  * then proceeds.
  *
- * Work Items:
- * There are several types of work items that the host may place into a
- * workqueue, each with its own requirements and limitations. Currently only
- * WQ_TYPE_INORDER is needed to support legacy submission via GuC, which
- * represents in-order queue. The kernel driver packs ring tail pointer and an
- * ELSP context descriptor dword into Work Item.
- * See guc_add_request()
+ * Command Transport buffers (CTBs):
+ * Covered in detail in other sections but CTBs (host-to-guc, H2G, guc-to-host
+ * G2H) are a message interface between the i915 and GuC used to controls
+ * submissions.
+ *
+ * Context registration:
+ * Before a context can be submitted it must be registered with the GuC via a
+ * H2G. A unique guc_id is associated with each context. The context is either
+ * registered at request creation time (normal operation) or at submission time
+ * (abnormal operation, e.g. after a reset).
+ *
+ * Context submission:
+ * The i915 updates the LRC tail value in memory. Either a schedule enable H2G
+ * or context submit H2G is used to submit a context.
+ *
+ * Context unpin:
+ * To unpin a context a H2G is used to disable scheduling and when the
+ * corresponding G2H returns indicating the scheduling disable operation has
+ * completed it is safe to unpin the context. While a disable is in flight it
+ * isn't safe to resubmit the context so a fence is used to stall all future
+ * requests until the G2H is returned.
+ *
+ * Context deregistration:
+ * Before a context can be destroyed or we steal its guc_id we must deregister
+ * the context with the GuC via H2G. If stealing the guc_id it isn't safe to
+ * submit anything to this guc_id until the deregister completes so a fence is
+ * used to stall all requests associated with this guc_ids until the
+ * corresponding G2H returns indicating the guc_id has been deregistered.
+ *
+ * guc_ids:
+ * Unique number associated with private GuC context data passed in during
+ * context registration / submission / deregistration. 64k available. Simple ida
+ * is used for allocation.
+ *
+ * Stealing guc_ids:
+ * If no guc_ids are available they can be stolen from another context at
+ * request creation time if that context is unpinned. If a guc_id can't be found
+ * we punt this problem to the user as we believe this is near impossible to hit
+ * during normal use cases.
+ *
+ * Locking:
+ * In the GuC submission code we have 3 basic spin locks which protect
+ * everything. Details about each below.
+ *
+ * sched_engine->lock
+ * This is the submission lock for all contexts that share a i915 schedule
+ * engine (sched_engine), thus only 1 context which share a sched_engine can be
+ * submitting at a time. Currently only 1 sched_engine used for all of GuC
+ * submission but that could change in the future.
  *
+ * guc->contexts_lock
+ * Protects guc_id allocation. Global lock i.e. Only 1 context that uses GuC
+ * submission can hold this at a time.
+ *
+ * ce->guc_state.lock
+ * Protects everything under ce->guc_state. Ensures that a context is in the
+ * correct state before issuing a H2G. e.g. We don't issue a schedule disable
+ * on disabled context (bad idea), we don't issue schedule enable when a
+ * schedule disable is inflight, etc... Also protects list of inflight requests
+ * on the context and the priority management state. Lock individual to each
+ * context.
+ *
+ * Lock ordering rules:
+ * sched_engine->lock -> ce->guc_state.lock
+ * guc->contexts_lock -> ce->guc_state.lock
+ *
+ * Reset races:
+ * When a GPU full reset is triggered it is assumed that some G2H responses to
+ * a H2G can be lost as the GuC is likely toast. Losing these G2H can prove to
+ * fatal as we do certain operations upon receiving a G2H (e.g. destroy
+ * contexts, release guc_ids, etc...). Luckly when this occurs we can scrub
+ * context state and cleanup appropriately, however this is quite racey. To
+ * avoid races the rules are check for submission being disabled (i.e. check for
+ * mid reset) with the appropriate lock being held. If submission is disabled
+ * don't send the H2G or update the context state. The reset code must disable
+ * submission and grab all these locks before scrubbing for the missing G2H.
  */
 
 /* GuC Virtual Engine */
@@ -73,167 +126,165 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
 /*
- * Below is a set of functions which control the GuC scheduling state which do
- * not require a lock as all state transitions are mutually exclusive. i.e. It
- * is not possible for the context pinning code and submission, for the same
- * context, to be executing simultaneously. We still need an atomic as it is
- * possible for some of the bits to changing at the same time though.
+ * Below is a set of functions which control the GuC scheduling state which
+ * require a lock.
  */
-#define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
-#define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
-#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
-static inline bool context_enabled(struct intel_context *ce)
+#define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
+#define SCHED_STATE_DESTROYED				BIT(1)
+#define SCHED_STATE_PENDING_DISABLE			BIT(2)
+#define SCHED_STATE_BANNED				BIT(3)
+#define SCHED_STATE_ENABLED				BIT(4)
+#define SCHED_STATE_PENDING_ENABLE			BIT(5)
+#define SCHED_STATE_REGISTERED				BIT(6)
+#define SCHED_STATE_BLOCKED_SHIFT			7
+#define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
+#define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
+static void init_sched_state(struct intel_context *ce)
 {
-	return (atomic_read(&ce->guc_sched_state_no_lock) &
-		SCHED_STATE_NO_LOCK_ENABLED);
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
 }
 
-static inline void set_context_enabled(struct intel_context *ce)
+__maybe_unused
+static bool sched_state_is_init(struct intel_context *ce)
 {
-	atomic_or(SCHED_STATE_NO_LOCK_ENABLED, &ce->guc_sched_state_no_lock);
+	/*
+	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
+	 * suspend.
+	 */
+	return !(ce->guc_state.sched_state &=
+		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
 }
 
-static inline void clr_context_enabled(struct intel_context *ce)
+static bool
+context_wait_for_deregister_to_register(struct intel_context *ce)
 {
-	atomic_and((u32)~SCHED_STATE_NO_LOCK_ENABLED,
-		   &ce->guc_sched_state_no_lock);
+	return ce->guc_state.sched_state &
+		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline bool context_pending_enable(struct intel_context *ce)
+static void
+set_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
-	return (atomic_read(&ce->guc_sched_state_no_lock) &
-		SCHED_STATE_NO_LOCK_PENDING_ENABLE);
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |=
+		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline void set_context_pending_enable(struct intel_context *ce)
+static void
+clr_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
-	atomic_or(SCHED_STATE_NO_LOCK_PENDING_ENABLE,
-		  &ce->guc_sched_state_no_lock);
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &=
+		~SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline void clr_context_pending_enable(struct intel_context *ce)
+static bool
+context_destroyed(struct intel_context *ce)
 {
-	atomic_and((u32)~SCHED_STATE_NO_LOCK_PENDING_ENABLE,
-		   &ce->guc_sched_state_no_lock);
+	return ce->guc_state.sched_state & SCHED_STATE_DESTROYED;
 }
 
-static inline bool context_registered(struct intel_context *ce)
+static void
+set_context_destroyed(struct intel_context *ce)
 {
-	return (atomic_read(&ce->guc_sched_state_no_lock) &
-		SCHED_STATE_NO_LOCK_REGISTERED);
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
 }
 
-static inline void set_context_registered(struct intel_context *ce)
+static bool context_pending_disable(struct intel_context *ce)
 {
-	atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
-		  &ce->guc_sched_state_no_lock);
+	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
 }
 
-static inline void clr_context_registered(struct intel_context *ce)
+static void set_context_pending_disable(struct intel_context *ce)
 {
-	atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
-		   &ce->guc_sched_state_no_lock);
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_PENDING_DISABLE;
 }
 
-/*
- * Below is a set of functions which control the GuC scheduling state which
- * require a lock, aside from the special case where the functions are called
- * from guc_lrc_desc_pin(). In that case it isn't possible for any other code
- * path to be executing on the context.
- */
-#define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
-#define SCHED_STATE_DESTROYED				BIT(1)
-#define SCHED_STATE_PENDING_DISABLE			BIT(2)
-#define SCHED_STATE_BANNED				BIT(3)
-#define SCHED_STATE_BLOCKED_SHIFT			4
-#define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
-#define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
-static inline void init_sched_state(struct intel_context *ce)
+static void clr_context_pending_disable(struct intel_context *ce)
 {
-	/* Only should be called from guc_lrc_desc_pin() */
-	atomic_set(&ce->guc_sched_state_no_lock, 0);
-	ce->guc_state.sched_state = 0;
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_DISABLE;
 }
 
-static inline bool
-context_wait_for_deregister_to_register(struct intel_context *ce)
+static bool context_banned(struct intel_context *ce)
 {
-	return ce->guc_state.sched_state &
-		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
+	return ce->guc_state.sched_state & SCHED_STATE_BANNED;
 }
 
-static inline void
-set_context_wait_for_deregister_to_register(struct intel_context *ce)
+static void set_context_banned(struct intel_context *ce)
 {
-	/* Only should be called from guc_lrc_desc_pin() without lock */
-	ce->guc_state.sched_state |=
-		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
 }
 
-static inline void
-clr_context_wait_for_deregister_to_register(struct intel_context *ce)
+static void clr_context_banned(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	ce->guc_state.sched_state &=
-		~SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
+	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
 }
 
-static inline bool
-context_destroyed(struct intel_context *ce)
+static bool context_enabled(struct intel_context *ce)
 {
-	return ce->guc_state.sched_state & SCHED_STATE_DESTROYED;
+	return ce->guc_state.sched_state & SCHED_STATE_ENABLED;
 }
 
-static inline void
-set_context_destroyed(struct intel_context *ce)
+static void set_context_enabled(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
+	ce->guc_state.sched_state |= SCHED_STATE_ENABLED;
 }
 
-static inline bool context_pending_disable(struct intel_context *ce)
+static void clr_context_enabled(struct intel_context *ce)
 {
-	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_ENABLED;
 }
 
-static inline void set_context_pending_disable(struct intel_context *ce)
+static bool context_pending_enable(struct intel_context *ce)
+{
+	return ce->guc_state.sched_state & SCHED_STATE_PENDING_ENABLE;
+}
+
+static void set_context_pending_enable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	ce->guc_state.sched_state |= SCHED_STATE_PENDING_DISABLE;
+	ce->guc_state.sched_state |= SCHED_STATE_PENDING_ENABLE;
 }
 
-static inline void clr_context_pending_disable(struct intel_context *ce)
+static void clr_context_pending_enable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_DISABLE;
+	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_ENABLE;
 }
 
-static inline bool context_banned(struct intel_context *ce)
+static bool context_registered(struct intel_context *ce)
 {
-	return ce->guc_state.sched_state & SCHED_STATE_BANNED;
+	return ce->guc_state.sched_state & SCHED_STATE_REGISTERED;
 }
 
-static inline void set_context_banned(struct intel_context *ce)
+static void set_context_registered(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
+	ce->guc_state.sched_state |= SCHED_STATE_REGISTERED;
 }
 
-static inline void clr_context_banned(struct intel_context *ce)
+static void clr_context_registered(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
+	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
 }
 
-static inline u32 context_blocked(struct intel_context *ce)
+static u32 context_blocked(struct intel_context *ce)
 {
 	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
 		SCHED_STATE_BLOCKED_SHIFT;
 }
 
-static inline void incr_context_blocked(struct intel_context *ce)
+static void incr_context_blocked(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->engine->sched_engine->lock);
 	lockdep_assert_held(&ce->guc_state.lock);
 
 	ce->guc_state.sched_state += SCHED_STATE_BLOCKED;
@@ -241,9 +292,8 @@ static inline void incr_context_blocked(struct intel_context *ce)
 	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
 }
 
-static inline void decr_context_blocked(struct intel_context *ce)
+static void decr_context_blocked(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->engine->sched_engine->lock);
 	lockdep_assert_held(&ce->guc_state.lock);
 
 	GEM_BUG_ON(!context_blocked(ce));	/* Underflow check */
@@ -251,22 +301,41 @@ static inline void decr_context_blocked(struct intel_context *ce)
 	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
 }
 
-static inline bool context_guc_id_invalid(struct intel_context *ce)
+static bool context_has_committed_requests(struct intel_context *ce)
+{
+	return !!ce->guc_state.number_committed_requests;
+}
+
+static void incr_context_committed_requests(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	++ce->guc_state.number_committed_requests;
+	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
+}
+
+static void decr_context_committed_requests(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	--ce->guc_state.number_committed_requests;
+	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
+}
+
+static bool context_guc_id_invalid(struct intel_context *ce)
 {
-	return ce->guc_id == GUC_INVALID_LRC_ID;
+	return ce->guc_id.id == GUC_INVALID_LRC_ID;
 }
 
-static inline void set_context_guc_id_invalid(struct intel_context *ce)
+static void set_context_guc_id_invalid(struct intel_context *ce)
 {
-	ce->guc_id = GUC_INVALID_LRC_ID;
+	ce->guc_id.id = GUC_INVALID_LRC_ID;
 }
 
-static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
+static struct intel_guc *ce_to_guc(struct intel_context *ce)
 {
 	return &ce->engine->gt->uc.guc;
 }
 
-static inline struct i915_priolist *to_priolist(struct rb_node *rb)
+static struct i915_priolist *to_priolist(struct rb_node *rb)
 {
 	return rb_entry(rb, struct i915_priolist, node);
 }
@@ -280,7 +349,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 	return &base[index];
 }
 
-static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
+static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
@@ -310,12 +379,12 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
 }
 
-static inline bool guc_submission_initialized(struct intel_guc *guc)
+static bool guc_submission_initialized(struct intel_guc *guc)
 {
 	return !!guc->lrc_desc_pool_vaddr;
 }
 
-static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
+static void reset_lrc_desc(struct intel_guc *guc, u32 id)
 {
 	if (likely(guc_submission_initialized(guc))) {
 		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
@@ -333,13 +402,13 @@ static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
 	}
 }
 
-static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
+static bool lrc_desc_registered(struct intel_guc *guc, u32 id)
 {
 	return __get_context(guc, id);
 }
 
-static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
-					   struct intel_context *ce)
+static void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
+				    struct intel_context *ce)
 {
 	unsigned long flags;
 
@@ -352,6 +421,12 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
+static void decr_outstanding_submission_g2h(struct intel_guc *guc)
+{
+	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
+		wake_up_all(&guc->ct.wq);
+}
+
 static int guc_submission_send_busy_loop(struct intel_guc *guc,
 					 const u32 *action,
 					 u32 len,
@@ -360,11 +435,11 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 {
 	int err;
 
-	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
-
-	if (!err && g2h_len_dw)
+	if (g2h_len_dw)
 		atomic_inc(&guc->outstanding_submission_g2h);
 
+	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+
 	return err;
 }
 
@@ -430,6 +505,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	u32 g2h_len_dw = 0;
 	bool enabled;
 
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+
 	/*
 	 * Corner case where requests were sitting in the priority list or a
 	 * request resubmitted after the context was banned.
@@ -437,22 +514,24 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	if (unlikely(intel_context_is_banned(ce))) {
 		i915_request_put(i915_request_mark_eio(rq));
 		intel_engine_signal_breadcrumbs(ce->engine);
-		goto out;
+		return 0;
 	}
 
-	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
+	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
 	GEM_BUG_ON(context_guc_id_invalid(ce));
 
 	/*
 	 * Corner case where the GuC firmware was blown away and reloaded while
 	 * this context was pinned.
 	 */
-	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
+	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
 		err = guc_lrc_desc_pin(ce, false);
 		if (unlikely(err))
-			goto out;
+			return err;
 	}
 
+	spin_lock(&ce->guc_state.lock);
+
 	/*
 	 * The request / context will be run on the hardware when scheduling
 	 * gets enabled in the unblock.
@@ -464,14 +543,14 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 
 	if (!enabled) {
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
-		action[len++] = ce->guc_id;
+		action[len++] = ce->guc_id.id;
 		action[len++] = GUC_CONTEXT_ENABLE;
 		set_context_pending_enable(ce);
 		intel_context_get(ce);
 		g2h_len_dw = G2H_LEN_DW_SCHED_CONTEXT_MODE_SET;
 	} else {
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
-		action[len++] = ce->guc_id;
+		action[len++] = ce->guc_id.id;
 	}
 
 	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
@@ -487,16 +566,17 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		trace_i915_request_guc_submit(rq);
 
 out:
+	spin_unlock(&ce->guc_state.lock);
 	return err;
 }
 
-static inline void guc_set_lrc_tail(struct i915_request *rq)
+static void guc_set_lrc_tail(struct i915_request *rq)
 {
 	rq->context->lrc_reg_state[CTX_RING_TAIL] =
 		intel_ring_set_tail(rq->ring, rq->tail);
 }
 
-static inline int rq_prio(const struct i915_request *rq)
+static int rq_prio(const struct i915_request *rq)
 {
 	return rq->sched.attr.priority;
 }
@@ -596,10 +676,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	unsigned long index, flags;
 	bool pending_disable, pending_enable, deregister, destroyed, banned;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		/* Flush context */
-		spin_lock_irqsave(&ce->guc_state.lock, flags);
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		/*
+		 * Corner case where the ref count on the object is zero but and
+		 * deregister G2H was lost. In this case we don't touch the ref
+		 * count and finish the destroy of the context.
+		 */
+		bool do_put = kref_get_unless_zero(&ce->ref);
+
+		xa_unlock(&guc->context_lookup);
+
+		spin_lock(&ce->guc_state.lock);
 
 		/*
 		 * Once we are at this point submission_disabled() is guaranteed
@@ -615,8 +703,12 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 		banned = context_banned(ce);
 		init_sched_state(ce);
 
+		spin_unlock(&ce->guc_state.lock);
+
+		GEM_BUG_ON(!do_put && !destroyed);
+
 		if (pending_enable || destroyed || deregister) {
-			atomic_dec(&guc->outstanding_submission_g2h);
+			decr_outstanding_submission_g2h(guc);
 			if (deregister)
 				guc_signal_context_fence(ce);
 			if (destroyed) {
@@ -635,17 +727,23 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 				intel_engine_signal_breadcrumbs(ce->engine);
 			}
 			intel_context_sched_disable_unpin(ce);
-			atomic_dec(&guc->outstanding_submission_g2h);
-			spin_lock_irqsave(&ce->guc_state.lock, flags);
+			decr_outstanding_submission_g2h(guc);
+
+			spin_lock(&ce->guc_state.lock);
 			guc_blocked_fence_complete(ce);
-			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+			spin_unlock(&ce->guc_state.lock);
 
 			intel_context_put(ce);
 		}
+
+		if (do_put)
+			intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
-static inline bool
+static bool
 submission_disabled(struct intel_guc *guc)
 {
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
@@ -694,8 +792,6 @@ static void guc_flush_submissions(struct intel_guc *guc)
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
-	int i;
-
 	if (unlikely(!guc_submission_initialized(guc))) {
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
@@ -709,22 +805,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
 	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
 
-	guc_flush_submissions(guc);
+	flush_work(&guc->ct.requests.worker);
 
-	/*
-	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
-	 * each pass as interrupt have been disabled. We always scrub for
-	 * outstanding G2H as it is possible for outstanding_submission_g2h to
-	 * be incremented after the context state update.
-	 */
-	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
-		intel_guc_to_host_event_handler(guc);
-#define wait_for_reset(guc, wait_var) \
-		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
-		do {
-			wait_for_reset(guc, &guc->outstanding_submission_g2h);
-		} while (!list_empty(&guc->ct.requests.incoming));
-	}
 	scrub_guc_desc_for_outstanding_g2h(guc);
 }
 
@@ -742,7 +824,7 @@ guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
 	return NULL;
 }
 
-static inline struct intel_engine_cs *
+static struct intel_engine_cs *
 __context_to_physical_engine(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
@@ -796,16 +878,14 @@ __unwind_incomplete_requests(struct intel_context *ce)
 	unsigned long flags;
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
-	spin_lock(&ce->guc_active.lock);
-	list_for_each_entry_safe(rq, rn,
-				 &ce->guc_active.requests,
-				 sched.link) {
+	spin_lock(&ce->guc_state.lock);
+	list_for_each_entry_safe_reverse(rq, rn,
+					 &ce->guc_state.requests,
+					 sched.link) {
 		if (i915_request_completed(rq))
 			continue;
 
 		list_del_init(&rq->sched.link);
-		spin_unlock(&ce->guc_active.lock);
-
 		__i915_request_unsubmit(rq);
 
 		/* Push the request back into the queue for later resubmission. */
@@ -816,29 +896,44 @@ __unwind_incomplete_requests(struct intel_context *ce)
 		}
 		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
 
-		list_add_tail(&rq->sched.link, pl);
+		list_add(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
-
-		spin_lock(&ce->guc_active.lock);
 	}
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
 	struct i915_request *rq;
+	unsigned long flags;
 	u32 head;
+	bool skip = false;
 
 	intel_context_get(ce);
 
 	/*
-	 * GuC will implicitly mark the context as non-schedulable
-	 * when it sends the reset notification. Make sure our state
-	 * reflects this change. The context will be marked enabled
-	 * on resubmission.
+	 * GuC will implicitly mark the context as non-schedulable when it sends
+	 * the reset notification. Make sure our state reflects this change. The
+	 * context will be marked enabled on resubmission.
+	 *
+	 * XXX: If the context is reset as a result of the request cancellation
+	 * this G2H is received after the schedule disable complete G2H which is
+	 * likely wrong as this creates a race between the request cancellation
+	 * code re-submitting the context and this G2H handler. This likely
+	 * should be fixed in the GuC but until if / when that gets fixed we
+	 * need to workaround this. Convert this function to a NOP if a pending
+	 * enable is in flight as this indicates that a request cancellation has
+	 * occurred.
 	 */
-	clr_context_enabled(ce);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (likely(!context_pending_enable(ce)))
+		clr_context_enabled(ce);
+	else
+		skip = true;
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	if (unlikely(skip))
+		goto out_put;
 
 	rq = intel_context_find_active_request(ce);
 	if (!rq) {
@@ -857,6 +952,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 out_replay:
 	guc_reset_state(ce, head, stalled);
 	__unwind_incomplete_requests(ce);
+out_put:
 	intel_context_put(ce);
 }
 
@@ -864,16 +960,29 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
 
 	if (unlikely(!guc_submission_initialized(guc))) {
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
 	}
 
-	xa_for_each(&guc->context_lookup, index, ce)
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!kref_get_unless_zero(&ce->ref))
+			continue;
+
+		xa_unlock(&guc->context_lookup);
+
 		if (intel_context_is_pinned(ce))
 			__guc_reset_context(ce, stalled);
 
+		intel_context_put(ce);
+
+		xa_lock(&guc->context_lookup);
+	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
 }
@@ -886,10 +995,10 @@ static void guc_cancel_context_requests(struct intel_context *ce)
 
 	/* Mark all executing requests as skipped. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
-	spin_lock(&ce->guc_active.lock);
-	list_for_each_entry(rq, &ce->guc_active.requests, sched.link)
+	spin_lock(&ce->guc_state.lock);
+	list_for_each_entry(rq, &ce->guc_state.requests, sched.link)
 		i915_request_put(i915_request_mark_eio(rq));
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
@@ -948,11 +1057,24 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
+
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!kref_get_unless_zero(&ce->ref))
+			continue;
+
+		xa_unlock(&guc->context_lookup);
 
-	xa_for_each(&guc->context_lookup, index, ce)
 		if (intel_context_is_pinned(ce))
 			guc_cancel_context_requests(ce);
 
+		intel_context_put(ce);
+
+		xa_lock(&guc->context_lookup);
+	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	guc_cancel_sched_engine_requests(guc->sched_engine);
 
 	/* GuC is blown away, drop all references to contexts */
@@ -1019,14 +1141,15 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	i915_sched_engine_put(guc->sched_engine);
 }
 
-static inline void queue_request(struct i915_sched_engine *sched_engine,
-				 struct i915_request *rq,
-				 int prio)
+static void queue_request(struct i915_sched_engine *sched_engine,
+			  struct i915_request *rq,
+			  int prio)
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
 		      i915_sched_lookup_priolist(sched_engine, prio));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+	tasklet_hi_schedule(&sched_engine->tasklet);
 }
 
 static int guc_bypass_tasklet_submit(struct intel_guc *guc,
@@ -1077,12 +1200,12 @@ static int new_guc_id(struct intel_guc *guc)
 static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	if (!context_guc_id_invalid(ce)) {
-		ida_simple_remove(&guc->guc_ids, ce->guc_id);
-		reset_lrc_desc(guc, ce->guc_id);
+		ida_simple_remove(&guc->guc_ids, ce->guc_id.id);
+		reset_lrc_desc(guc, ce->guc_id.id);
 		set_context_guc_id_invalid(ce);
 	}
-	if (!list_empty(&ce->guc_id_link))
-		list_del_init(&ce->guc_id_link);
+	if (!list_empty(&ce->guc_id.link))
+		list_del_init(&ce->guc_id.link);
 }
 
 static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
@@ -1104,14 +1227,18 @@ static int steal_guc_id(struct intel_guc *guc)
 	if (!list_empty(&guc->guc_id_list)) {
 		ce = list_first_entry(&guc->guc_id_list,
 				      struct intel_context,
-				      guc_id_link);
+				      guc_id.link);
 
-		GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
+		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
 		GEM_BUG_ON(context_guc_id_invalid(ce));
 
-		list_del_init(&ce->guc_id_link);
-		guc_id = ce->guc_id;
+		list_del_init(&ce->guc_id.link);
+		guc_id = ce->guc_id.id;
+
+		spin_lock(&ce->guc_state.lock);
 		clr_context_registered(ce);
+		spin_unlock(&ce->guc_state.lock);
+
 		set_context_guc_id_invalid(ce);
 		return guc_id;
 	} else {
@@ -1142,26 +1269,28 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	int ret = 0;
 	unsigned long flags, tries = PIN_GUC_ID_TRIES;
 
-	GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
+	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
 
 try_again:
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 
+	might_lock(&ce->guc_state.lock);
+
 	if (context_guc_id_invalid(ce)) {
-		ret = assign_guc_id(guc, &ce->guc_id);
+		ret = assign_guc_id(guc, &ce->guc_id.id);
 		if (ret)
 			goto out_unlock;
 		ret = 1;	/* Indidcates newly assigned guc_id */
 	}
-	if (!list_empty(&ce->guc_id_link))
-		list_del_init(&ce->guc_id_link);
-	atomic_inc(&ce->guc_id_ref);
+	if (!list_empty(&ce->guc_id.link))
+		list_del_init(&ce->guc_id.link);
+	atomic_inc(&ce->guc_id.ref);
 
 out_unlock:
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 
 	/*
-	 * -EAGAIN indicates no guc_ids are available, let's retire any
+	 * -EAGAIN indicates no guc_id are available, let's retire any
 	 * outstanding requests to see if that frees up a guc_id. If the first
 	 * retire didn't help, insert a sleep with the timeslice duration before
 	 * attempting to retire more requests. Double the sleep period each
@@ -1189,15 +1318,15 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	unsigned long flags;
 
-	GEM_BUG_ON(atomic_read(&ce->guc_id_ref) < 0);
+	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
 
 	if (unlikely(context_guc_id_invalid(ce)))
 		return;
 
 	spin_lock_irqsave(&guc->contexts_lock, flags);
-	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id_link) &&
-	    !atomic_read(&ce->guc_id_ref))
-		list_add_tail(&ce->guc_id_link, &guc->guc_id_list);
+	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id.link) &&
+	    !atomic_read(&ce->guc_id.ref))
+		list_add_tail(&ce->guc_id.link, &guc->guc_id_list);
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 }
 
@@ -1220,14 +1349,19 @@ static int register_context(struct intel_context *ce, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
-		ce->guc_id * sizeof(struct guc_lrc_desc);
+		ce->guc_id.id * sizeof(struct guc_lrc_desc);
 	int ret;
 
 	trace_intel_context_register(ce);
 
-	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
-	if (likely(!ret))
+	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
+	if (likely(!ret)) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		set_context_registered(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	}
 
 	return ret;
 }
@@ -1285,22 +1419,19 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
-static inline u8 map_i915_prio_to_guc_prio(int prio);
-
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
 	struct intel_guc *guc = &engine->gt->uc.guc;
-	u32 desc_idx = ce->guc_id;
+	u32 desc_idx = ce->guc_id.id;
 	struct guc_lrc_desc *desc;
-	const struct i915_gem_context *ctx;
-	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
 	bool context_registered;
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
+	GEM_BUG_ON(!sched_state_is_init(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -1311,12 +1442,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
-	rcu_read_lock();
-	ctx = rcu_dereference(ce->gem_context);
-	if (ctx)
-		prio = ctx->sched.priority;
-	rcu_read_unlock();
-
 	reset_lrc_desc(guc, desc_idx);
 	set_lrc_desc_registered(guc, desc_idx, ce);
 
@@ -1325,11 +1450,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
 	desc->hw_context_desc = ce->lrc.lrca;
-	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
-	desc->priority = ce->guc_prio;
+	desc->priority = ce->guc_state.prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
-	init_sched_state(ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
@@ -1340,26 +1463,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	 * registering this context.
 	 */
 	if (context_registered) {
+		bool disabled;
+		unsigned long flags;
+
 		trace_intel_context_steal_guc_id(ce);
-		if (!loop) {
+		GEM_BUG_ON(!loop);
+
+		/* Seal race with Reset */
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		disabled = submission_disabled(guc);
+		if (likely(!disabled)) {
 			set_context_wait_for_deregister_to_register(ce);
 			intel_context_get(ce);
-		} else {
-			bool disabled;
-			unsigned long flags;
-
-			/* Seal race with Reset */
-			spin_lock_irqsave(&ce->guc_state.lock, flags);
-			disabled = submission_disabled(guc);
-			if (likely(!disabled)) {
-				set_context_wait_for_deregister_to_register(ce);
-				intel_context_get(ce);
-			}
-			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-			if (unlikely(disabled)) {
-				reset_lrc_desc(guc, desc_idx);
-				return 0;	/* Will get registered later */
-			}
+		}
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		if (unlikely(disabled)) {
+			reset_lrc_desc(guc, desc_idx);
+			return 0;	/* Will get registered later */
 		}
 
 		/*
@@ -1367,20 +1487,19 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		 * context whose guc_id was stolen.
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			ret = deregister_context(ce, ce->guc_id, loop);
-		if (unlikely(ret == -EBUSY)) {
-			clr_context_wait_for_deregister_to_register(ce);
-			intel_context_put(ce);
-		} else if (unlikely(ret == -ENODEV)) {
+			ret = deregister_context(ce, ce->guc_id.id, loop);
+		if (unlikely(ret == -ENODEV)) {
 			ret = 0;	/* Will get registered later */
 		}
 	} else {
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			ret = register_context(ce, loop);
-		if (unlikely(ret == -EBUSY))
+		if (unlikely(ret == -EBUSY)) {
+			reset_lrc_desc(guc, desc_idx);
+		} else if (unlikely(ret == -ENODEV)) {
 			reset_lrc_desc(guc, desc_idx);
-		else if (unlikely(ret == -ENODEV))
 			ret = 0;	/* Will get registered later */
+		}
 	}
 
 	return ret;
@@ -1440,7 +1559,7 @@ static void __guc_context_sched_enable(struct intel_guc *guc,
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
-		ce->guc_id,
+		ce->guc_id.id,
 		GUC_CONTEXT_ENABLE
 	};
 
@@ -1456,7 +1575,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
-		guc_id,	/* ce->guc_id not stable */
+		guc_id,	/* ce->guc_id.id not stable */
 		GUC_CONTEXT_DISABLE
 	};
 
@@ -1472,24 +1591,24 @@ static void guc_blocked_fence_complete(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
-	if (!i915_sw_fence_done(&ce->guc_blocked))
-		i915_sw_fence_complete(&ce->guc_blocked);
+	if (!i915_sw_fence_done(&ce->guc_state.blocked_fence))
+		i915_sw_fence_complete(&ce->guc_state.blocked_fence);
 }
 
 static void guc_blocked_fence_reinit(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
+	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_state.blocked_fence));
 
 	/*
 	 * This fence is always complete unless a pending schedule disable is
 	 * outstanding. We arm the fence here and complete it when we receive
 	 * the pending schedule disable complete message.
 	 */
-	i915_sw_fence_fini(&ce->guc_blocked);
-	i915_sw_fence_reinit(&ce->guc_blocked);
-	i915_sw_fence_await(&ce->guc_blocked);
-	i915_sw_fence_commit(&ce->guc_blocked);
+	i915_sw_fence_fini(&ce->guc_state.blocked_fence);
+	i915_sw_fence_reinit(&ce->guc_state.blocked_fence);
+	i915_sw_fence_await(&ce->guc_state.blocked_fence);
+	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
 }
 
 static u16 prep_context_pending_disable(struct intel_context *ce)
@@ -1501,13 +1620,12 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
 	guc_blocked_fence_reinit(ce);
 	intel_context_get(ce);
 
-	return ce->guc_id;
+	return ce->guc_id.id;
 }
 
 static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
 	unsigned long flags;
 	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
 	intel_wakeref_t wakeref;
@@ -1516,20 +1634,14 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
-	/*
-	 * Sync with submission path, increment before below changes to context
-	 * state.
-	 */
-	spin_lock(&sched_engine->lock);
 	incr_context_blocked(ce);
-	spin_unlock(&sched_engine->lock);
 
 	enabled = context_enabled(ce);
 	if (unlikely(!enabled || submission_disabled(guc))) {
 		if (enabled)
 			clr_context_enabled(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-		return &ce->guc_blocked;
+		return &ce->guc_state.blocked_fence;
 	}
 
 	/*
@@ -1545,13 +1657,12 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	with_intel_runtime_pm(runtime_pm, wakeref)
 		__guc_context_sched_disable(guc, ce, guc_id);
 
-	return &ce->guc_blocked;
+	return &ce->guc_state.blocked_fence;
 }
 
 static void guc_context_unblock(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
 	unsigned long flags;
 	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
 	intel_wakeref_t wakeref;
@@ -1562,6 +1673,9 @@ static void guc_context_unblock(struct intel_context *ce)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	if (unlikely(submission_disabled(guc) ||
+		     intel_context_is_banned(ce) ||
+		     context_guc_id_invalid(ce) ||
+		     !lrc_desc_registered(guc, ce->guc_id.id) ||
 		     !intel_context_is_pinned(ce) ||
 		     context_pending_disable(ce) ||
 		     context_blocked(ce) > 1)) {
@@ -1573,13 +1687,7 @@ static void guc_context_unblock(struct intel_context *ce)
 		intel_context_get(ce);
 	}
 
-	/*
-	 * Sync with submission path, decrement after above changes to context
-	 * state.
-	 */
-	spin_lock(&sched_engine->lock);
 	decr_context_blocked(ce);
-	spin_unlock(&sched_engine->lock);
 
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
@@ -1593,15 +1701,25 @@ static void guc_context_cancel_request(struct intel_context *ce,
 				       struct i915_request *rq)
 {
 	if (i915_sw_fence_signaled(&rq->submit)) {
-		struct i915_sw_fence *fence = guc_context_block(ce);
+		struct i915_sw_fence *fence;
 
+		intel_context_get(ce);
+		fence = guc_context_block(ce);
 		i915_sw_fence_wait(fence);
 		if (!i915_request_completed(rq)) {
 			__i915_request_skip(rq);
 			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
 					true);
 		}
+
+		/*
+		 * XXX: Racey if context is reset, see comment in
+		 * __guc_reset_context().
+		 */
+		flush_work(&ce_to_guc(ce)->ct.requests.worker);
+
 		guc_context_unblock(ce);
+		intel_context_put(ce);
 	}
 }
 
@@ -1662,7 +1780,7 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 		if (!context_guc_id_invalid(ce))
 			with_intel_runtime_pm(runtime_pm, wakeref)
 				__guc_context_set_preemption_timeout(guc,
-								     ce->guc_id,
+								     ce->guc_id.id,
 								     1);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	}
@@ -1678,8 +1796,10 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	bool enabled;
 
 	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
-	    !lrc_desc_registered(guc, ce->guc_id)) {
+	    !lrc_desc_registered(guc, ce->guc_id.id)) {
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		clr_context_enabled(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		goto unpin;
 	}
 
@@ -1689,14 +1809,11 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	/*
-	 * We have to check if the context has been disabled by another thread.
-	 * We also have to check if the context has been pinned again as another
-	 * pin operation is allowed to pass this function. Checking the pin
-	 * count, within ce->guc_state.lock, synchronizes this function with
-	 * guc_request_alloc ensuring a request doesn't slip through the
-	 * 'context_pending_disable' fence. Checking within the spin lock (can't
-	 * sleep) ensures another process doesn't pin this context and generate
-	 * a request before we set the 'context_pending_disable' flag here.
+	 * We have to check if the context has been disabled by another thread,
+	 * check if submssion has been disabled to seal a race with reset and
+	 * finally check if any more requests have been committed to the
+	 * context ensursing that a request doesn't slip through the
+	 * 'context_pending_disable' fence.
 	 */
 	enabled = context_enabled(ce);
 	if (unlikely(!enabled || submission_disabled(guc))) {
@@ -1705,7 +1822,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		goto unpin;
 	}
-	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
+	if (unlikely(context_has_committed_requests(ce))) {
+		intel_context_sched_disable_unpin(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		return;
 	}
@@ -1721,24 +1839,24 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	intel_context_sched_disable_unpin(ce);
 }
 
-static inline void guc_lrc_desc_unpin(struct intel_context *ce)
+static void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
-	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
-	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
+	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
+	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
 	GEM_BUG_ON(context_enabled(ce));
 
-	clr_context_registered(ce);
-	deregister_context(ce, ce->guc_id, true);
+	deregister_context(ce, ce->guc_id.id, true);
 }
 
 static void __guc_context_destroy(struct intel_context *ce)
 {
-	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
-		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
-		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
-		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+	GEM_BUG_ON(ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
+		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
+		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
+		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+	GEM_BUG_ON(ce->guc_state.number_committed_requests);
 
 	lrc_fini(ce);
 	intel_context_fini(ce);
@@ -1774,7 +1892,7 @@ static void guc_context_destroy(struct kref *kref)
 		__guc_context_destroy(ce);
 		return;
 	} else if (submission_disabled(guc) ||
-		   !lrc_desc_registered(guc, ce->guc_id)) {
+		   !lrc_desc_registered(guc, ce->guc_id.id)) {
 		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
 		return;
@@ -1783,10 +1901,10 @@ static void guc_context_destroy(struct kref *kref)
 	/*
 	 * We have to acquire the context spinlock and check guc_id again, if it
 	 * is valid it hasn't been stolen and needs to be deregistered. We
-	 * delete this context from the list of unpinned guc_ids available to
+	 * delete this context from the list of unpinned guc_id available to
 	 * steal to seal a race with guc_lrc_desc_pin(). When the G2H CTB
 	 * returns indicating this context has been deregistered the guc_id is
-	 * returned to the pool of available guc_ids.
+	 * returned to the pool of available guc_id.
 	 */
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 	if (context_guc_id_invalid(ce)) {
@@ -1795,15 +1913,17 @@ static void guc_context_destroy(struct kref *kref)
 		return;
 	}
 
-	if (!list_empty(&ce->guc_id_link))
-		list_del_init(&ce->guc_id_link);
+	if (!list_empty(&ce->guc_id.link))
+		list_del_init(&ce->guc_id.link);
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 
 	/* Seal race with Reset */
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	disabled = submission_disabled(guc);
-	if (likely(!disabled))
+	if (likely(!disabled)) {
 		set_context_destroyed(ce);
+		clr_context_registered(ce);
+	}
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	if (unlikely(disabled)) {
 		release_guc_id(guc, ce);
@@ -1839,24 +1959,27 @@ static void guc_context_set_prio(struct intel_guc *guc,
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
-		ce->guc_id,
+		ce->guc_id.id,
 		prio,
 	};
 
 	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
 		   prio > GUC_CLIENT_PRIORITY_NORMAL);
+	lockdep_assert_held(&ce->guc_state.lock);
 
-	if (ce->guc_prio == prio || submission_disabled(guc) ||
-	    !context_registered(ce))
+	if (ce->guc_state.prio == prio || submission_disabled(guc) ||
+	    !context_registered(ce)) {
+		ce->guc_state.prio = prio;
 		return;
+	}
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
 
-	ce->guc_prio = prio;
+	ce->guc_state.prio = prio;
 	trace_intel_context_set_prio(ce);
 }
 
-static inline u8 map_i915_prio_to_guc_prio(int prio)
+static u8 map_i915_prio_to_guc_prio(int prio)
 {
 	if (prio == I915_PRIORITY_NORMAL)
 		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
@@ -1868,31 +1991,29 @@ static inline u8 map_i915_prio_to_guc_prio(int prio)
 		return GUC_CLIENT_PRIORITY_KMD_HIGH;
 }
 
-static inline void add_context_inflight_prio(struct intel_context *ce,
-					     u8 guc_prio)
+static void add_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
 {
-	lockdep_assert_held(&ce->guc_active.lock);
-	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+	lockdep_assert_held(&ce->guc_state.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
 
-	++ce->guc_prio_count[guc_prio];
+	++ce->guc_state.prio_count[guc_prio];
 
 	/* Overflow protection */
-	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
 }
 
-static inline void sub_context_inflight_prio(struct intel_context *ce,
-					     u8 guc_prio)
+static void sub_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
 {
-	lockdep_assert_held(&ce->guc_active.lock);
-	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+	lockdep_assert_held(&ce->guc_state.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
 
 	/* Underflow protection */
-	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
 
-	--ce->guc_prio_count[guc_prio];
+	--ce->guc_state.prio_count[guc_prio];
 }
 
-static inline void update_context_prio(struct intel_context *ce)
+static void update_context_prio(struct intel_context *ce)
 {
 	struct intel_guc *guc = &ce->engine->gt->uc.guc;
 	int i;
@@ -1900,17 +2021,17 @@ static inline void update_context_prio(struct intel_context *ce)
 	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
 	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH > GUC_CLIENT_PRIORITY_NORMAL);
 
-	lockdep_assert_held(&ce->guc_active.lock);
+	lockdep_assert_held(&ce->guc_state.lock);
 
-	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
-		if (ce->guc_prio_count[i]) {
+	for (i = 0; i < ARRAY_SIZE(ce->guc_state.prio_count); ++i) {
+		if (ce->guc_state.prio_count[i]) {
 			guc_context_set_prio(guc, ce, i);
 			break;
 		}
 	}
 }
 
-static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
+static bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
 {
 	/* Lower value is higher priority */
 	return new_guc_prio < old_guc_prio;
@@ -1923,8 +2044,8 @@ static void add_to_context(struct i915_request *rq)
 
 	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
 
-	spin_lock(&ce->guc_active.lock);
-	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
+	spin_lock(&ce->guc_state.lock);
+	list_move_tail(&rq->sched.link, &ce->guc_state.requests);
 
 	if (rq->guc_prio == GUC_PRIO_INIT) {
 		rq->guc_prio = new_guc_prio;
@@ -1936,12 +2057,12 @@ static void add_to_context(struct i915_request *rq)
 	}
 	update_context_prio(ce);
 
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 }
 
 static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->guc_active.lock);
+	lockdep_assert_held(&ce->guc_state.lock);
 
 	if (rq->guc_prio != GUC_PRIO_INIT &&
 	    rq->guc_prio != GUC_PRIO_FINI) {
@@ -1955,7 +2076,7 @@ static void remove_from_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 
-	spin_lock_irq(&ce->guc_active.lock);
+	spin_lock_irq(&ce->guc_state.lock);
 
 	list_del_init(&rq->sched.link);
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
@@ -1965,9 +2086,11 @@ static void remove_from_context(struct i915_request *rq)
 
 	guc_prio_fini(rq, ce);
 
-	spin_unlock_irq(&ce->guc_active.lock);
+	decr_context_committed_requests(ce);
 
-	atomic_dec(&ce->guc_id_ref);
+	spin_unlock_irq(&ce->guc_state.lock);
+
+	atomic_dec(&ce->guc_id.ref);
 	i915_request_notify_execute_cb_imm(rq);
 }
 
@@ -1994,6 +2117,14 @@ static const struct intel_context_ops guc_context_ops = {
 	.create_virtual = guc_create_virtual,
 };
 
+static void submit_work_cb(struct irq_work *wrk)
+{
+	struct i915_request *rq = container_of(wrk, typeof(*rq), submit_work);
+
+	might_lock(&rq->engine->sched_engine->lock);
+	i915_sw_fence_complete(&rq->submit);
+}
+
 static void __guc_signal_context_fence(struct intel_context *ce)
 {
 	struct i915_request *rq;
@@ -2003,8 +2134,12 @@ static void __guc_signal_context_fence(struct intel_context *ce)
 	if (!list_empty(&ce->guc_state.fences))
 		trace_intel_context_fence_release(ce);
 
+	/*
+	 * Use an IRQ to ensure locking order of sched_engine->lock ->
+	 * ce->guc_state.lock is preserved.
+	 */
 	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
-		i915_sw_fence_complete(&rq->submit);
+		irq_work_queue(&rq->submit_work);
 
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 }
@@ -2022,10 +2157,24 @@ static void guc_signal_context_fence(struct intel_context *ce)
 static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
 {
 	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
-		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id)) &&
+		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id)) &&
 		!submission_disabled(ce_to_guc(ce));
 }
 
+static void guc_context_init(struct intel_context *ce)
+{
+	const struct i915_gem_context *ctx;
+	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
+
+	rcu_read_lock();
+	ctx = rcu_dereference(ce->gem_context);
+	if (ctx)
+		prio = ctx->sched.priority;
+	rcu_read_unlock();
+
+	ce->guc_state.prio = map_i915_prio_to_guc_prio(prio);
+}
+
 static int guc_request_alloc(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
@@ -2057,14 +2206,17 @@ static int guc_request_alloc(struct i915_request *rq)
 
 	rq->reserved_space -= GUC_REQUEST_SIZE;
 
+	if (unlikely(!test_bit(CONTEXT_GUC_INIT, &ce->flags)))
+		guc_context_init(ce);
+
 	/*
 	 * Call pin_guc_id here rather than in the pinning step as with
 	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
-	 * guc_ids and creating horrible race conditions. This is especially bad
-	 * when guc_ids are being stolen due to over subscription. By the time
+	 * guc_id and creating horrible race conditions. This is especially bad
+	 * when guc_id are being stolen due to over subscription. By the time
 	 * this function is reached, it is guaranteed that the guc_id will be
 	 * persistent until the generated request is retired. Thus, sealing these
-	 * race conditions. It is still safe to fail here if guc_ids are
+	 * race conditions. It is still safe to fail here if guc_id are
 	 * exhausted and return -EAGAIN to the user indicating that they can try
 	 * again in the future.
 	 *
@@ -2074,7 +2226,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * decremented on each retire. When it is zero, a lock around the
 	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
 	 */
-	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
+	if (atomic_add_unless(&ce->guc_id.ref, 1, 0))
 		goto out;
 
 	ret = pin_guc_id(guc, ce);	/* returns 1 if new guc_id assigned */
@@ -2087,7 +2239,7 @@ static int guc_request_alloc(struct i915_request *rq)
 				disable_submission(guc);
 				goto out;	/* GPU will be reset */
 			}
-			atomic_dec(&ce->guc_id_ref);
+			atomic_dec(&ce->guc_id.ref);
 			unpin_guc_id(guc, ce);
 			return ret;
 		}
@@ -2102,22 +2254,16 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * schedule enable or context registration if either G2H is pending
 	 * respectfully. Once a G2H returns, the fence is released that is
 	 * blocking these requests (see guc_signal_context_fence).
-	 *
-	 * We can safely check the below fields outside of the lock as it isn't
-	 * possible for these fields to transition from being clear to set but
-	 * converse is possible, hence the need for the check within the lock.
 	 */
-	if (likely(!context_wait_for_deregister_to_register(ce) &&
-		   !context_pending_disable(ce)))
-		return 0;
-
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	if (context_wait_for_deregister_to_register(ce) ||
 	    context_pending_disable(ce)) {
+		init_irq_work(&rq->submit_work, submit_work_cb);
 		i915_sw_fence_await(&rq->submit);
 
 		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
 	}
+	incr_context_committed_requests(ce);
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	return 0;
@@ -2259,7 +2405,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
 		return;
 
-	spin_lock(&ce->guc_active.lock);
+	spin_lock(&ce->guc_state.lock);
 	if (rq->guc_prio != GUC_PRIO_FINI) {
 		if (rq->guc_prio != GUC_PRIO_INIT)
 			sub_context_inflight_prio(ce, rq->guc_prio);
@@ -2267,16 +2413,16 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 		add_context_inflight_prio(ce, rq->guc_prio);
 		update_context_prio(ce);
 	}
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 }
 
 static void guc_retire_inflight_request_prio(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 
-	spin_lock(&ce->guc_active.lock);
+	spin_lock(&ce->guc_state.lock);
 	guc_prio_fini(rq, ce);
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 }
 
 static void sanitize_hwsp(struct intel_engine_cs *engine)
@@ -2355,15 +2501,15 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
 	engine->submit_request = guc_submit_request;
 }
 
-static inline void guc_kernel_context_pin(struct intel_guc *guc,
-					  struct intel_context *ce)
+static void guc_kernel_context_pin(struct intel_guc *guc,
+				   struct intel_context *ce)
 {
 	if (context_guc_id_invalid(ce))
 		pin_guc_id(guc, ce);
 	guc_lrc_desc_pin(ce, true);
 }
 
-static inline void guc_init_lrc_mapping(struct intel_guc *guc)
+static void guc_init_lrc_mapping(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
@@ -2466,7 +2612,7 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 	}
 }
 
-static inline void guc_default_irqs(struct intel_engine_cs *engine)
+static void guc_default_irqs(struct intel_engine_cs *engine)
 {
 	engine->irq_keep_mask = GT_RENDER_USER_INTERRUPT;
 	intel_engine_set_irq_handler(engine, cs_irq_handler);
@@ -2562,7 +2708,7 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
-static inline struct intel_context *
+static struct intel_context *
 g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
 	struct intel_context *ce;
@@ -2583,12 +2729,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 	return ce;
 }
 
-static void decr_outstanding_submission_g2h(struct intel_guc *guc)
-{
-	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
-		wake_up_all(&guc->ct.wq);
-}
-
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg,
 					  u32 len)
@@ -2607,6 +2747,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 
 	trace_intel_context_deregister_done(ce);
 
+#ifdef CONFIG_DRM_I915_SELFTEST
+	if (unlikely(ce->drop_deregister)) {
+		ce->drop_deregister = false;
+		return 0;
+	}
+#endif
+
 	if (context_wait_for_deregister_to_register(ce)) {
 		struct intel_runtime_pm *runtime_pm =
 			&ce->engine->gt->i915->runtime_pm;
@@ -2652,8 +2799,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, 0x%x, desc_idx %u",
-			atomic_read(&ce->guc_sched_state_no_lock),
+			"Bad context sched_state 0x%x, desc_idx %u",
 			ce->guc_state.sched_state, desc_idx);
 		return -EPROTO;
 	}
@@ -2661,10 +2807,26 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	trace_intel_context_sched_done(ce);
 
 	if (context_pending_enable(ce)) {
+#ifdef CONFIG_DRM_I915_SELFTEST
+		if (unlikely(ce->drop_schedule_enable)) {
+			ce->drop_schedule_enable = false;
+			return 0;
+		}
+#endif
+
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		clr_context_pending_enable(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	} else if (context_pending_disable(ce)) {
 		bool banned;
 
+#ifdef CONFIG_DRM_I915_SELFTEST
+		if (unlikely(ce->drop_schedule_disable)) {
+			ce->drop_schedule_disable = false;
+			return 0;
+		}
+#endif
+
 		/*
 		 * Unpin must be done before __guc_signal_context_fence,
 		 * otherwise a race exists between the requests getting
@@ -2721,7 +2883,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
-	if (likely(!intel_context_is_banned(ce))) {
+	/*
+	 * XXX: Racey if request cancellation has occurred, see comment in
+	 * __guc_reset_context().
+	 */
+	if (likely(!intel_context_is_banned(ce) &&
+		   !context_blocked(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	}
@@ -2797,33 +2964,48 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 	struct intel_context *ce;
 	struct i915_request *rq;
 	unsigned long index;
+	unsigned long flags;
 
 	/* Reset called during driver load? GuC not yet initialised! */
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		if (!intel_context_is_pinned(ce))
+		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
+		xa_unlock(&guc->context_lookup);
+
+		if (!intel_context_is_pinned(ce))
+			goto next;
+
 		if (intel_engine_is_virtual(ce->engine)) {
 			if (!(ce->engine->mask & engine->mask))
-				continue;
+				goto next;
 		} else {
 			if (ce->engine != engine)
-				continue;
+				goto next;
 		}
 
-		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
+		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
 			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
 				continue;
 
 			intel_engine_set_hung_context(engine, ce);
 
 			/* Can only cope with one hang at a time... */
-			return;
+			intel_context_put(ce);
+			xa_lock(&guc->context_lookup);
+			goto done;
 		}
+next:
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
+
 	}
+done:
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
@@ -2839,23 +3021,34 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		if (!intel_context_is_pinned(ce))
+		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
+		xa_unlock(&guc->context_lookup);
+
+		if (!intel_context_is_pinned(ce))
+			goto next;
+
 		if (intel_engine_is_virtual(ce->engine)) {
 			if (!(ce->engine->mask & engine->mask))
-				continue;
+				goto next;
 		} else {
 			if (ce->engine != engine)
-				continue;
+				goto next;
 		}
 
-		spin_lock_irqsave(&ce->guc_active.lock, flags);
-		intel_engine_dump_active_requests(&ce->guc_active.requests,
+		spin_lock(&ce->guc_state.lock);
+		intel_engine_dump_active_requests(&ce->guc_state.requests,
 						  hung_rq, m);
-		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+		spin_unlock(&ce->guc_state.lock);
+
+next:
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 void intel_guc_submission_print_info(struct intel_guc *guc,
@@ -2881,25 +3074,24 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 
 		priolist_for_each_request(rq, pl)
 			drm_printf(p, "guc_id=%u, seqno=%llu\n",
-				   rq->context->guc_id,
+				   rq->context->guc_id.id,
 				   rq->fence.seqno);
 	}
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 	drm_printf(p, "\n");
 }
 
-static inline void guc_log_context_priority(struct drm_printer *p,
-					    struct intel_context *ce)
+static void guc_log_context_priority(struct drm_printer *p,
+				     struct intel_context *ce)
 {
 	int i;
 
-	drm_printf(p, "\t\tPriority: %d\n",
-		   ce->guc_prio);
+	drm_printf(p, "\t\tPriority: %d\n", ce->guc_state.prio);
 	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
 	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
 	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
 		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
-			   i, ce->guc_prio_count[i]);
+			   i, ce->guc_state.prio_count[i]);
 	}
 	drm_printf(p, "\n");
 }
@@ -2909,9 +3101,11 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
+		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
 		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
 			   ce->ring->head,
@@ -2922,13 +3116,13 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 		drm_printf(p, "\t\tContext Pin Count: %u\n",
 			   atomic_read(&ce->pin_count));
 		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
-			   atomic_read(&ce->guc_id_ref));
-		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
-			   ce->guc_state.sched_state,
-			   atomic_read(&ce->guc_sched_state_no_lock));
+			   atomic_read(&ce->guc_id.ref));
+		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
+			   ce->guc_state.sched_state);
 
 		guc_log_context_priority(p, ce);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 static struct intel_context *
@@ -3036,3 +3230,7 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
 
 	return false;
 }
+
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+#include "selftest_guc.c"
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
new file mode 100644
index 000000000000..264e2f705c17
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright �� 2021 Intel Corporation
+ */
+
+#include "selftests/intel_scheduler_helpers.h"
+
+static struct i915_request *nop_user_request(struct intel_context *ce,
+					     struct i915_request *from)
+{
+	struct i915_request *rq;
+	int ret;
+
+	rq = intel_context_create_request(ce);
+	if (IS_ERR(rq))
+		return rq;
+
+	if (from) {
+		ret = i915_sw_fence_await_dma_fence(&rq->submit,
+						    &from->fence, 0,
+						    I915_FENCE_GFP);
+		if (ret < 0) {
+			i915_request_put(rq);
+			return ERR_PTR(ret);
+		}
+	}
+
+	i915_request_get(rq);
+	i915_request_add(rq);
+
+	return rq;
+}
+
+static int intel_guc_scrub_ctbs(void *arg)
+{
+	struct intel_gt *gt = arg;
+	int ret = 0;
+	int i;
+	struct i915_request *last[3] = {NULL, NULL, NULL}, *rq;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine;
+	struct intel_context *ce;
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+	engine = intel_selftest_find_any_engine(gt);
+
+	/* Submit requests and inject errors forcing G2H to be dropped */
+	for (i = 0; i < 3; ++i) {
+		ce = intel_context_create(engine);
+		if (IS_ERR(ce)) {
+			ret = PTR_ERR(ce);
+			pr_err("Failed to create context, %d: %d\n", i, ret);
+			goto err;
+		}
+
+		switch (i) {
+		case 0:
+			ce->drop_schedule_enable = true;
+			break;
+		case 1:
+			ce->drop_schedule_disable = true;
+			break;
+		case 2:
+			ce->drop_deregister = true;
+			break;
+		}
+
+		rq = nop_user_request(ce, NULL);
+		intel_context_put(ce);
+
+		if (IS_ERR(rq)) {
+			ret = PTR_ERR(rq);
+			pr_err("Failed to create request, %d: %d\n", i, ret);
+			goto err;
+		}
+
+		last[i] = rq;
+	}
+
+	for (i = 0; i < 3; ++i) {
+		ret = i915_request_wait(last[i], 0, HZ);
+		if (ret < 0) {
+			pr_err("Last request failed to complete: %d\n", ret);
+			goto err;
+		}
+		i915_request_put(last[i]);
+		last[i] = NULL;
+	}
+
+	/* Force all H2G / G2H to be submitted / processed */
+	intel_gt_retire_requests(gt);
+	msleep(500);
+
+	/* Scrub missing G2H */
+	intel_gt_handle_error(engine->gt, -1, 0, "selftest reset");
+
+	ret = intel_gt_wait_for_idle(gt, HZ);
+	if (ret < 0) {
+		pr_err("GT failed to idle: %d\n", ret);
+		goto err;
+	}
+
+err:
+	for (i = 0; i < 3; ++i)
+		if (last[i])
+			i915_request_put(last[i]);
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
+
+	return ret;
+}
+
+int intel_guc_live_selftests(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(intel_guc_scrub_ctbs),
+	};
+	struct intel_gt *gt = &i915->gt;
+
+	if (intel_gt_is_wedged(gt))
+		return 0;
+
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		return 0;
+
+	return intel_gt_live_subtests(tests, gt);
+}
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 0f08bcfbe964..2819b69fbb72 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -49,8 +49,7 @@
 #include "i915_memcpy.h"
 #include "i915_scatterlist.h"
 
-#define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
-#define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)
+#define ATOMIC_MAYFAIL (GFP_NOWAIT | __GFP_NOWARN)
 
 static void __sg_set_buf(struct scatterlist *sg,
 			 void *addr, unsigned int len, loff_t it)
@@ -79,7 +78,7 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
 	if (e->cur == e->end) {
 		struct scatterlist *sgl;
 
-		sgl = (typeof(sgl))__get_free_page(ALLOW_FAIL);
+		sgl = (typeof(sgl))__get_free_page(ATOMIC_MAYFAIL);
 		if (!sgl) {
 			e->err = -ENOMEM;
 			return false;
@@ -99,10 +98,10 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
 	}
 
 	e->size = ALIGN(len + 1, SZ_64K);
-	e->buf = kmalloc(e->size, ALLOW_FAIL);
+	e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
 	if (!e->buf) {
 		e->size = PAGE_ALIGN(len + 1);
-		e->buf = kmalloc(e->size, GFP_KERNEL);
+		e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
 	}
 	if (!e->buf) {
 		e->err = -ENOMEM;
@@ -243,12 +242,12 @@ static bool compress_init(struct i915_vma_compress *c)
 {
 	struct z_stream_s *zstream = &c->zstream;
 
-	if (pool_init(&c->pool, ALLOW_FAIL))
+	if (pool_init(&c->pool, ATOMIC_MAYFAIL))
 		return false;
 
 	zstream->workspace =
 		kmalloc(zlib_deflate_workspacesize(MAX_WBITS, MAX_MEM_LEVEL),
-			ALLOW_FAIL);
+			ATOMIC_MAYFAIL);
 	if (!zstream->workspace) {
 		pool_fini(&c->pool);
 		return false;
@@ -256,7 +255,7 @@ static bool compress_init(struct i915_vma_compress *c)
 
 	c->tmp = NULL;
 	if (i915_has_memcpy_from_wc())
-		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
+		c->tmp = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
 
 	return true;
 }
@@ -280,7 +279,7 @@ static void *compress_next_page(struct i915_vma_compress *c,
 	if (dst->page_count >= dst->num_pages)
 		return ERR_PTR(-ENOSPC);
 
-	page = pool_alloc(&c->pool, ALLOW_FAIL);
+	page = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
@@ -376,7 +375,7 @@ struct i915_vma_compress {
 
 static bool compress_init(struct i915_vma_compress *c)
 {
-	return pool_init(&c->pool, ALLOW_FAIL) == 0;
+	return pool_init(&c->pool, ATOMIC_MAYFAIL) == 0;
 }
 
 static bool compress_start(struct i915_vma_compress *c)
@@ -391,7 +390,7 @@ static int compress_page(struct i915_vma_compress *c,
 {
 	void *ptr;
 
-	ptr = pool_alloc(&c->pool, ALLOW_FAIL);
+	ptr = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
 	if (!ptr)
 		return -ENOMEM;
 
@@ -997,7 +996,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 	num_pages = min_t(u64, vma->size, vma->obj->base.size) >> PAGE_SHIFT;
 	num_pages = DIV_ROUND_UP(10 * num_pages, 8); /* worstcase zlib growth */
-	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ALLOW_FAIL);
+	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ATOMIC_MAYFAIL);
 	if (!dst)
 		return NULL;
 
@@ -1433,7 +1432,7 @@ capture_engine(struct intel_engine_cs *engine,
 	struct i915_request *rq = NULL;
 	unsigned long flags;
 
-	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
+	ee = intel_engine_coredump_alloc(engine, ATOMIC_MAYFAIL);
 	if (!ee)
 		return NULL;
 
@@ -1481,7 +1480,7 @@ gt_record_engines(struct intel_gt_coredump *gt,
 		struct intel_engine_coredump *ee;
 
 		/* Refill our page pool before entering atomic section */
-		pool_refill(&compress->pool, ALLOW_FAIL);
+		pool_refill(&compress->pool, ATOMIC_MAYFAIL);
 
 		ee = capture_engine(engine, compress);
 		if (!ee)
@@ -1507,7 +1506,7 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	const struct intel_uc *uc = &gt->_gt->uc;
 	struct intel_uc_coredump *error_uc;
 
-	error_uc = kzalloc(sizeof(*error_uc), ALLOW_FAIL);
+	error_uc = kzalloc(sizeof(*error_uc), ATOMIC_MAYFAIL);
 	if (!error_uc)
 		return NULL;
 
@@ -1518,8 +1517,8 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	 * As modparams are generally accesible from the userspace make
 	 * explicit copies of the firmware paths.
 	 */
-	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
-	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
+	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ATOMIC_MAYFAIL);
+	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ATOMIC_MAYFAIL);
 	error_uc->guc_log =
 		i915_vma_coredump_create(gt->_gt,
 					 uc->guc.log.vma, "GuC log buffer",
@@ -1778,7 +1777,7 @@ i915_vma_capture_prepare(struct intel_gt_coredump *gt)
 {
 	struct i915_vma_compress *compress;
 
-	compress = kmalloc(sizeof(*compress), ALLOW_FAIL);
+	compress = kmalloc(sizeof(*compress), ATOMIC_MAYFAIL);
 	if (!compress)
 		return NULL;
 
@@ -1811,11 +1810,11 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 	if (IS_ERR(error))
 		return error;
 
-	error = i915_gpu_coredump_alloc(i915, ALLOW_FAIL);
+	error = i915_gpu_coredump_alloc(i915, ATOMIC_MAYFAIL);
 	if (!error)
 		return ERR_PTR(-ENOMEM);
 
-	error->gt = intel_gt_coredump_alloc(gt, ALLOW_FAIL);
+	error->gt = intel_gt_coredump_alloc(gt, ATOMIC_MAYFAIL);
 	if (error->gt) {
 		struct i915_vma_compress *compress;
 
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 1bc1349ba3c2..177eaf55adff 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -218,6 +218,11 @@ struct i915_request {
 	};
 	struct llist_head execute_cb;
 	struct i915_sw_fence semaphore;
+	/**
+	 * @submit_work: complete submit fence from an IRQ if needed for
+	 * locking hierarchy reasons.
+	 */
+	struct irq_work submit_work;
 
 	/*
 	 * A list of everyone we wait upon, and everyone who waits upon us.
@@ -285,18 +290,20 @@ struct i915_request {
 		struct hrtimer timer;
 	} watchdog;
 
-	/*
-	 * Requests may need to be stalled when using GuC submission waiting for
-	 * certain GuC operations to complete. If that is the case, stalled
-	 * requests are added to a per context list of stalled requests. The
-	 * below list_head is the link in that list.
+	/**
+	 * @guc_fence_link: Requests may need to be stalled when using GuC
+	 * submission waiting for certain GuC operations to complete. If that is
+	 * the case, stalled requests are added to a per context list of stalled
+	 * requests. The below list_head is the link in that list. Protected by
+	 * ce->guc_state.lock.
 	 */
 	struct list_head guc_fence_link;
 
 	/**
-	 * Priority level while the request is inflight. Differs from i915
-	 * scheduler priority. See comment above
-	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details.
+	 * @guc_prio: Priority level while the request is inflight. Differs from
+	 * i915 scheduler priority. See comment above
+	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details. Protected by
+	 * ce->guc_active.lock.
 	 */
 #define	GUC_PRIO_INIT	0xff
 #define	GUC_PRIO_FINI	0xfe
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 806ad688274b..ec7fe12b94aa 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -805,7 +805,7 @@ DECLARE_EVENT_CLASS(i915_request,
 			   __entry->dev = rq->engine->i915->drm.primary->index;
 			   __entry->class = rq->engine->uabi_class;
 			   __entry->instance = rq->engine->uabi_instance;
-			   __entry->guc_id = rq->context->guc_id;
+			   __entry->guc_id = rq->context->guc_id.id;
 			   __entry->ctx = rq->fence.context;
 			   __entry->seqno = rq->fence.seqno;
 			   __entry->tail = rq->tail;
@@ -903,23 +903,19 @@ DECLARE_EVENT_CLASS(intel_context,
 			     __field(u32, guc_id)
 			     __field(int, pin_count)
 			     __field(u32, sched_state)
-			     __field(u32, guc_sched_state_no_lock)
 			     __field(u8, guc_prio)
 			     ),
 
 		    TP_fast_assign(
-			   __entry->guc_id = ce->guc_id;
+			   __entry->guc_id = ce->guc_id.id;
 			   __entry->pin_count = atomic_read(&ce->pin_count);
 			   __entry->sched_state = ce->guc_state.sched_state;
-			   __entry->guc_sched_state_no_lock =
-			   atomic_read(&ce->guc_sched_state_no_lock);
-			   __entry->guc_prio = ce->guc_prio;
+			   __entry->guc_prio = ce->guc_state.prio;
 			   ),
 
-		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x, guc_prio=%u",
+		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",
 			      __entry->guc_id, __entry->pin_count,
 			      __entry->sched_state,
-			      __entry->guc_sched_state_no_lock,
 			      __entry->guc_prio)
 );
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index cfa5c4165a4f..3cf6758931f9 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -47,5 +47,6 @@ selftest(execlists, intel_execlists_live_selftests)
 selftest(ring_submission, intel_ring_submission_live_selftests)
 selftest(perf, i915_perf_live_selftests)
 selftest(slpc, intel_slpc_live_selftests)
+selftest(guc, intel_guc_live_selftests)
 /* Here be dragons: keep last to run last! */
 selftest(late_gt_pm, intel_gt_pm_late_selftests)
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index d67710d10615..e2c5db77f087 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -772,6 +772,98 @@ static int __cancel_completed(struct intel_engine_cs *engine)
 	return err;
 }
 
+static int __cancel_reset(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq, *nop;
+	unsigned long preempt_timeout_ms;
+	int err = 0;
+
+	preempt_timeout_ms = engine->props.preempt_timeout_ms;
+	engine->props.preempt_timeout_ms = 100;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		goto out_restore;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_ce;
+	}
+
+	pr_debug("%s: Cancelling active request\n", engine->name);
+	i915_request_get(rq);
+	i915_request_add(rq);
+	if (!igt_wait_for_spinner(&spin, rq)) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("Failed to start spinner on %s\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_rq;
+	}
+
+	nop = intel_context_create_request(ce);
+	if (IS_ERR(nop))
+		goto out_nop;
+	i915_request_get(nop);
+	i915_request_add(nop);
+
+	i915_request_cancel(rq, -EINTR);
+
+	if (i915_request_wait(rq, 0, HZ) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to cancel hung request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_nop;
+	}
+
+	if (rq->fence.error != -EINTR) {
+		pr_err("%s: fence not cancelled (%u)\n",
+		       engine->name, rq->fence.error);
+		err = -EINVAL;
+		goto out_nop;
+	}
+
+	if (i915_request_wait(nop, 0, HZ) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to complete nop request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_nop;
+	}
+
+	if (nop->fence.error != 0) {
+		pr_err("%s: Nop request errored (%u)\n",
+		       engine->name, nop->fence.error);
+		err = -EINVAL;
+	}
+
+out_nop:
+	i915_request_put(nop);
+out_rq:
+	i915_request_put(rq);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+out_restore:
+	engine->props.preempt_timeout_ms = preempt_timeout_ms;
+	if (err)
+		pr_err("%s: %s error %d\n", __func__, engine->name, err);
+	return err;
+}
+
 static int live_cancel_request(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -804,6 +896,14 @@ static int live_cancel_request(void *arg)
 			return err;
 		if (err2)
 			return err2;
+
+		/* Expects reset so call outside of igt_live_test_* */
+		err = __cancel_reset(engine);
+		if (err)
+			return err;
+
+		if (igt_flush_test(i915))
+			return -EIO;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index 4b328346b48a..310fb83c527e 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -14,6 +14,18 @@
 #define REDUCED_PREEMPT		10
 #define WAIT_FOR_RESET_TIME	10000
 
+struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id)
+		return engine;
+
+	pr_err("No valid engine found!\n");
+	return NULL;
+}
+
 int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 				 struct intel_selftest_saved_policy *saved,
 				 u32 modify_type)
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
index 35c098601ac0..ae60bb507f45 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
@@ -10,6 +10,7 @@
 
 struct i915_request;
 struct intel_engine_cs;
+struct intel_gt;
 
 struct intel_selftest_saved_policy {
 	u32 flags;
@@ -23,6 +24,7 @@ enum selftest_scheduler_modify {
 	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
 };
 
+struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt);
 int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 				 struct intel_selftest_saved_policy *saved,
 				 enum selftest_scheduler_modify modify_type);
-- 
2.32.0

