Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB73DF763
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DBC6E924;
	Tue,  3 Aug 2021 22:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086CB6E8DD;
 Tue,  3 Aug 2021 22:11:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745907"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745907"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512715"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/46] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
Date: Tue,  3 Aug 2021 15:29:16 -0700
Message-Id: <20210803222943.27686-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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

Assign contexts in parent-child relationship consecutive guc_ids. This
is accomplished by partitioning guc_id space between ones that need to
be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
available guc_ids). The consecutive search is implemented via the bitmap
API.

This is a precursor to the full GuC multi-lrc implementation but aligns
to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
when using the GuC multi-lrc interface.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.h       |   6 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 222 ++++++++++++------
 .../i915/gt/uc/intel_guc_submission_types.h   |  10 +
 5 files changed, 179 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index c208691fc87d..7ce3b3d2edb7 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -54,6 +54,12 @@ static inline bool intel_context_is_parent(struct intel_context *ce)
 	return !!ce->guc_number_children;
 }
 
+static inline struct intel_context *
+intel_context_to_parent(struct intel_context *ce)
+{
+	return intel_context_is_child(ce) ? ce->parent : ce;
+}
+
 void intel_context_bind_parent_child(struct intel_context *parent,
 				     struct intel_context *child);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index ea763138197f..c3d4baa1b2b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -849,6 +849,7 @@ static void reset_finish(struct intel_gt *gt, intel_engine_mask_t awake)
 
 static void nop_submit_request(struct i915_request *request)
 {
+	struct intel_context *ce = intel_context_to_parent(request->context);
 	RQ_TRACE(request, "-EIO\n");
 
 	/*
@@ -857,7 +858,7 @@ static void nop_submit_request(struct i915_request *request)
 	 * this for now.
 	 */
 	if (intel_engine_uses_guc(request->engine))
-		intel_guc_decr_num_rq_not_ready(request->context);
+		intel_guc_decr_num_rq_not_ready(ce);
 
 	request = i915_request_mark_eio(request);
 	if (request) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index c0c60ccabfa4..30a0f364db8f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -24,6 +24,7 @@ struct __guc_ads_blob;
 
 enum {
 	GUC_SUBMIT_ENGINE_SINGLE_LRC,
+	GUC_SUBMIT_ENGINE_MULTI_LRC,
 	GUC_SUBMIT_ENGINE_MAX
 };
 
@@ -59,8 +60,10 @@ struct intel_guc {
 	struct ida guc_ids;
 	u32 num_guc_ids;
 	u32 max_guc_ids;
-	struct list_head guc_id_list_no_ref;
-	struct list_head guc_id_list_unpinned;
+	unsigned long *guc_ids_bitmap;
+#define MAX_GUC_ID_ORDER	(order_base_2(MAX_ENGINE_INSTANCE + 1))
+	struct list_head guc_id_list_no_ref[MAX_GUC_ID_ORDER + 1];
+	struct list_head guc_id_list_unpinned[MAX_GUC_ID_ORDER + 1];
 
 	spinlock_t destroy_lock;	/* protects list / worker */
 	struct list_head destroyed_contexts;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f23dd716723f..afb9b4bb8971 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -169,6 +169,15 @@ static void clr_guc_ids_exhausted(struct guc_submit_engine *gse)
 	clear_bit(GSE_STATE_GUC_IDS_EXHAUSTED, &gse->flags);
 }
 
+/*
+ * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
+ * and a different allocation algorithm is used (bitmap vs. ida). We believe the
+ * number of multi-lrc contexts in use should be low and 1/16 should be
+ * sufficient. Minimum of 32 ids for multi-lrc.
+ */
+#define NUMBER_MULTI_LRC_GUC_ID(guc) \
+	((guc)->num_guc_ids / 16 > 32 ? (guc)->num_guc_ids / 16 : 32)
+
 /*
  * Below is a set of functions which control the GuC scheduling state which do
  * not require a lock as all state transitions are mutually exclusive. i.e. It
@@ -405,16 +414,10 @@ static inline void decr_context_blocked(struct intel_context *ce)
 	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
 }
 
-static inline struct intel_context *
-to_parent(struct intel_context *ce)
-{
-	return intel_context_is_child(ce) ? ce->parent : ce;
-}
-
 static inline struct intel_context *
 request_to_scheduling_context(struct i915_request *rq)
 {
-	return to_parent(rq->context);
+	return intel_context_to_parent(rq->context);
 }
 
 static inline bool context_guc_id_invalid(struct intel_context *ce)
@@ -1436,7 +1439,7 @@ static void destroy_worker_func(struct work_struct *w);
  */
 int intel_guc_submission_init(struct intel_guc *guc)
 {
-	int ret;
+	int ret, i;
 
 	if (guc_submission_initialized(guc))
 		return 0;
@@ -1448,9 +1451,13 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
 
 	spin_lock_init(&guc->contexts_lock);
-	INIT_LIST_HEAD(&guc->guc_id_list_no_ref);
-	INIT_LIST_HEAD(&guc->guc_id_list_unpinned);
+	for (i = 0; i < MAX_GUC_ID_ORDER + 1; ++i) {
+		INIT_LIST_HEAD(&guc->guc_id_list_no_ref[i]);
+		INIT_LIST_HEAD(&guc->guc_id_list_unpinned[i]);
+	}
 	ida_init(&guc->guc_ids);
+	guc->guc_ids_bitmap =
+		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
 
 	spin_lock_init(&guc->destroy_lock);
 
@@ -1476,6 +1483,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 
 		i915_sched_engine_put(sched_engine);
 	}
+
+	bitmap_free(guc->guc_ids_bitmap);
 }
 
 static inline void queue_request(struct i915_sched_engine *sched_engine,
@@ -1499,11 +1508,13 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
 static bool too_many_guc_ids_not_ready(struct guc_submit_engine *gse,
 				       struct intel_context *ce)
 {
-	u32 available_guc_ids, guc_ids_consumed;
 	struct intel_guc *guc = gse->sched_engine.private_data;
+	u32 available_guc_ids = intel_context_is_parent(ce) ?
+		NUMBER_MULTI_LRC_GUC_ID(guc) :
+		guc->num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc);
+	u32 guc_ids_consumed = atomic_read(&gse->num_guc_ids_not_ready);
 
-	available_guc_ids = guc->num_guc_ids;
-	guc_ids_consumed = atomic_read(&gse->num_guc_ids_not_ready);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	if (TOO_MANY_GUC_IDS_NOT_READY(available_guc_ids, guc_ids_consumed)) {
 		set_and_update_guc_ids_exhausted(gse);
@@ -1517,17 +1528,26 @@ static void incr_num_rq_not_ready(struct intel_context *ce)
 {
 	struct guc_submit_engine *gse = ce_to_gse(ce);
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+	GEM_BUG_ON(!intel_context_is_parent(ce) &&
+		   ce->guc_number_children);
+
 	if (!atomic_fetch_add(1, &ce->guc_num_rq_not_ready))
-		atomic_inc(&gse->num_guc_ids_not_ready);
+		atomic_add(ce->guc_number_children + 1,
+			   &gse->num_guc_ids_not_ready);
 }
 
 void intel_guc_decr_num_rq_not_ready(struct intel_context *ce)
 {
 	struct guc_submit_engine *gse = ce_to_gse(ce);
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	if (atomic_fetch_add(-1, &ce->guc_num_rq_not_ready) == 1) {
 		GEM_BUG_ON(!atomic_read(&gse->num_guc_ids_not_ready));
-		atomic_dec(&gse->num_guc_ids_not_ready);
+
+		atomic_sub(ce->guc_number_children + 1,
+			   &gse->num_guc_ids_not_ready);
 	}
 }
 
@@ -1579,20 +1599,42 @@ static void guc_submit_request(struct i915_request *rq)
 
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 
-	intel_guc_decr_num_rq_not_ready(rq->context);
+	intel_guc_decr_num_rq_not_ready(request_to_scheduling_context(rq));
 }
 
-static int new_guc_id(struct intel_guc *guc)
+static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
-	return ida_simple_get(&guc->guc_ids, 0,
-			      guc->num_guc_ids, GFP_KERNEL |
-			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	int ret;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
+
+	if (intel_context_is_parent(ce))
+		ret = bitmap_find_free_region(guc->guc_ids_bitmap,
+					      NUMBER_MULTI_LRC_GUC_ID(guc),
+					      order_base_2(ce->guc_number_children
+							   + 1));
+	else
+		ret = ida_simple_get(&guc->guc_ids,
+				     NUMBER_MULTI_LRC_GUC_ID(guc),
+				     guc->num_guc_ids, GFP_KERNEL |
+				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (unlikely(ret < 0))
+		return ret;
+
+	ce->guc_id = ret;
+	return 0;
 }
 
 static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
+	GEM_BUG_ON(intel_context_is_child(ce));
 	if (!context_guc_id_invalid(ce)) {
-		ida_simple_remove(&guc->guc_ids, ce->guc_id);
+		if (intel_context_is_parent(ce))
+			bitmap_release_region(guc->guc_ids_bitmap, ce->guc_id,
+					      order_base_2(ce->guc_number_children
+							   + 1));
+		else
+			ida_simple_remove(&guc->guc_ids, ce->guc_id);
 		clr_lrc_desc_registered(guc, ce->guc_id);
 		set_context_guc_id_invalid(ce);
 	}
@@ -1604,6 +1646,8 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 	__release_guc_id(guc, ce);
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
@@ -1618,54 +1662,93 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
  * schedule disable H2G + a deregister H2G.
  */
 static struct list_head *get_guc_id_list(struct intel_guc *guc,
+					 u8 number_children,
 					 bool unpinned)
 {
+	GEM_BUG_ON(order_base_2(number_children + 1) > MAX_GUC_ID_ORDER);
+
 	if (unpinned)
-		return &guc->guc_id_list_unpinned;
+		return &guc->guc_id_list_unpinned[order_base_2(number_children + 1)];
 	else
-		return &guc->guc_id_list_no_ref;
+		return &guc->guc_id_list_no_ref[order_base_2(number_children + 1)];
 }
 
-static int steal_guc_id(struct intel_guc *guc, bool unpinned)
+static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce,
+			bool unpinned)
 {
-	struct intel_context *ce;
-	int guc_id;
-	struct list_head *guc_id_list = get_guc_id_list(guc, unpinned);
+	struct intel_context *cn;
+	u8 number_children = ce->guc_number_children;
 
 	lockdep_assert_held(&guc->contexts_lock);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
-	if (!list_empty(guc_id_list)) {
-		ce = list_first_entry(guc_id_list,
-				      struct intel_context,
-				      guc_id_link);
+	do {
+		struct list_head *guc_id_list =
+			get_guc_id_list(guc, number_children, unpinned);
 
-		/* Ensure context getting stolen in expected state */
-		GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
-		GEM_BUG_ON(context_guc_id_invalid(ce));
-		GEM_BUG_ON(context_guc_id_stolen(ce));
+		if (!list_empty(guc_id_list)) {
+			u8 cn_o2, ce_o2 =
+				order_base_2(ce->guc_number_children + 1);
 
-		list_del_init(&ce->guc_id_link);
-		guc_id = ce->guc_id;
-		clr_context_registered(ce);
+			cn = list_first_entry(guc_id_list,
+					      struct intel_context,
+					      guc_id_link);
+			cn_o2 = order_base_2(cn->guc_number_children + 1);
+
+			/*
+			 * Corner case where a multi-lrc context steals a guc_id
+			 * from another context that has more guc_id that itself.
+			 */
+			if (cn_o2 != ce_o2) {
+				bitmap_release_region(guc->guc_ids_bitmap,
+						      cn->guc_id,
+						      cn_o2);
+				bitmap_allocate_region(guc->guc_ids_bitmap,
+						       ce->guc_id,
+						       ce_o2);
+			}
+
+			/* Ensure context getting stolen in expected state */
+			GEM_BUG_ON(atomic_read(&cn->guc_id_ref));
+			GEM_BUG_ON(context_guc_id_invalid(cn));
+			GEM_BUG_ON(context_guc_id_stolen(cn));
+			GEM_BUG_ON(ce_to_gse(ce) != ce_to_gse(cn));
+
+			list_del_init(&cn->guc_id_link);
+			ce->guc_id = cn->guc_id;
+
+			/*
+			 * If stealing from the pinned list, defer invalidating
+			 * the guc_id until the retire workqueue processes this
+			 * context.
+			 */
+			clr_context_registered(cn);
+			if (!unpinned) {
+				GEM_BUG_ON(ce_to_gse(cn)->stalled_context);
+				ce_to_gse(cn)->stalled_context =
+					intel_context_get(cn);
+				set_context_guc_id_stolen(cn);
+			} else {
+				set_context_guc_id_invalid(cn);
+			}
+
+			return 0;
+		}
 
 		/*
-		 * If stealing from the pinned list, defer invalidating
-		 * the guc_id until the retire workqueue processes this
-		 * context.
+		 * When using multi-lrc we search the guc_id_lists with the
+		 * least amount of guc_ids required first but will consume a
+		 * block larger of guc_ids if necessary. 2x the children always
+		 * moves you two the next list.
 		 */
-		if (!unpinned) {
-			GEM_BUG_ON(ce_to_gse(ce)->stalled_context);
+		if (!number_children ||
+		    order_base_2(number_children + 1) == MAX_GUC_ID_ORDER)
+			break;
 
-			ce_to_gse(ce)->stalled_context = intel_context_get(ce);
-			set_context_guc_id_stolen(ce);
-		} else {
-			set_context_guc_id_invalid(ce);
-		}
+		number_children *= 2;
+	} while (true);
 
-		return guc_id;
-	} else {
-		return -EAGAIN;
-	}
+	return -EAGAIN;
 }
 
 enum {	/* Return values for pin_guc_id / assign_guc_id */
@@ -1674,17 +1757,18 @@ enum {	/* Return values for pin_guc_id / assign_guc_id */
 	NEW_GUC_ID_ENABLED	= 2,
 };
 
-static int assign_guc_id(struct intel_guc *guc, u16 *out, bool tasklet)
+static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce,
+			 bool tasklet)
 {
 	int ret;
 
 	lockdep_assert_held(&guc->contexts_lock);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
-	ret = new_guc_id(guc);
+	ret = new_guc_id(guc, ce);
 	if (unlikely(ret < 0)) {
-		ret = steal_guc_id(guc, true);
-		if (ret >= 0) {
-			*out = ret;
+		ret = steal_guc_id(guc, ce, true);
+		if (!ret) {
 			ret = NEW_GUC_ID_DISABLED;
 		} else if (ret < 0 && tasklet) {
 			/*
@@ -1692,15 +1776,18 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out, bool tasklet)
 			 * enabled if guc_ids are exhausted and we are submitting
 			 * from the tasklet.
 			 */
-			ret = steal_guc_id(guc, false);
-			if (ret >= 0) {
-				*out = ret;
+			ret = steal_guc_id(guc, ce, false);
+			if (!ret)
 				ret = NEW_GUC_ID_ENABLED;
-			}
 		}
-	} else {
-		*out = ret;
-		ret = SAME_GUC_ID;
+	}
+
+	if (!(ret < 0) && intel_context_is_parent(ce)) {
+		struct intel_context *child;
+		int i = 1;
+
+		for_each_child(ce, child)
+			child->guc_id = ce->guc_id + i++;
 	}
 
 	return ret;
@@ -1713,6 +1800,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce,
 	int ret = 0;
 	unsigned long flags, tries = PIN_GUC_ID_TRIES;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
 
 try_again:
@@ -1724,7 +1812,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce,
 	}
 
 	if (context_guc_id_invalid(ce)) {
-		ret = assign_guc_id(guc, &ce->guc_id, tasklet);
+		ret = assign_guc_id(guc, ce, tasklet);
 		if (unlikely(ret < 0))
 			goto out_unlock;
 	}
@@ -1770,6 +1858,7 @@ static void unpin_guc_id(struct intel_guc *guc,
 	unsigned long flags;
 
 	GEM_BUG_ON(atomic_read(&ce->guc_id_ref) < 0);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	if (unlikely(context_guc_id_invalid(ce)))
 		return;
@@ -1781,7 +1870,8 @@ static void unpin_guc_id(struct intel_guc *guc,
 
 	if (!context_guc_id_invalid(ce) && !context_guc_id_stolen(ce) &&
 	    !atomic_read(&ce->guc_id_ref)) {
-		struct list_head *head = get_guc_id_list(guc, unpinned);
+		struct list_head *head =
+			get_guc_id_list(guc, ce->guc_number_children, unpinned);
 
 		list_add_tail(&ce->guc_id_link, head);
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
index 7069b7248f55..a5933e07bdd2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
@@ -22,6 +22,16 @@ struct guc_virtual_engine {
 /*
  * Object which encapsulates the globally operated on i915_sched_engine +
  * the GuC submission state machine described in intel_guc_submission.c.
+ *
+ * Currently we have two instances of these per GuC. One for single-lrc and one
+ * for multi-lrc submission. We split these into two submission engines as they
+ * can operate in parallel allowing a blocking condition on one not to affect
+ * the other. i.e. guc_ids are statically allocated between these two submission
+ * modes. One mode may have guc_ids exhausted which requires blocking while the
+ * other has plenty of guc_ids and can make forward progres.
+ *
+ * In the future if different submission use cases arise we can simply
+ * instantiate another of these objects and assign it to the context.
  */
 struct guc_submit_engine {
 	struct i915_sched_engine sched_engine;
-- 
2.28.0

