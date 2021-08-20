Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A0D3F36F6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C61E6EB71;
	Fri, 20 Aug 2021 22:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E0A6EB38;
 Fri, 20 Aug 2021 22:50:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580045"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580045"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098601"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 14/27] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
Date: Fri, 20 Aug 2021 15:44:33 -0700
Message-Id: <20210820224446.30620-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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

v2:
 (Daniel Vetter)
  - Explictly state why we assign consecutive guc_ids

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 107 +++++++++++++-----
 2 files changed, 86 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 023953e77553..3f95b1b4f15c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -61,9 +61,13 @@ struct intel_guc {
 		 */
 		spinlock_t lock;
 		/**
-		 * @guc_ids: used to allocate new guc_ids
+		 * @guc_ids: used to allocate new guc_ids, single-lrc
 		 */
 		struct ida guc_ids;
+		/**
+		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
+		 */
+		unsigned long *guc_ids_bitmap;
 		/** @num_guc_ids: number of guc_ids that can be used */
 		u32 num_guc_ids;
 		/** @max_guc_ids: max number of guc_ids that can be used */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 00d54bb00bfb..e9dfd43d29a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -125,6 +125,18 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
+/*
+ * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
+ * per the GuC submission interface. A different allocation algorithm is used
+ * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
+ * partition the guc_id space. We believe the number of multi-lrc contexts in
+ * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
+ * multi-lrc.
+ */
+#define NUMBER_MULTI_LRC_GUC_ID(guc) \
+	((guc)->submission_state.num_guc_ids / 16 > 32 ? \
+	 (guc)->submission_state.num_guc_ids / 16 : 32)
+
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock.
@@ -1176,6 +1188,10 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
 	intel_gt_pm_unpark_work_init(&guc->submission_state.destroyed_worker,
 				     destroyed_worker_func);
+	guc->submission_state.guc_ids_bitmap =
+		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
+	if (!guc->submission_state.guc_ids_bitmap)
+		return -ENOMEM;
 
 	return 0;
 }
@@ -1188,6 +1204,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	guc_lrc_desc_pool_destroy(guc);
 	guc_flush_destroyed_contexts(guc);
 	i915_sched_engine_put(guc->sched_engine);
+	bitmap_free(guc->submission_state.guc_ids_bitmap);
 }
 
 static void queue_request(struct i915_sched_engine *sched_engine,
@@ -1239,18 +1256,43 @@ static void guc_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
-static int new_guc_id(struct intel_guc *guc)
+static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
-	return ida_simple_get(&guc->submission_state.guc_ids, 0,
-			      guc->submission_state.num_guc_ids, GFP_KERNEL |
-			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	int ret;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
+
+	if (intel_context_is_parent(ce))
+		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
+					      NUMBER_MULTI_LRC_GUC_ID(guc),
+					      order_base_2(ce->guc_number_children
+							   + 1));
+	else
+		ret = ida_simple_get(&guc->submission_state.guc_ids,
+				     NUMBER_MULTI_LRC_GUC_ID(guc),
+				     guc->submission_state.num_guc_ids,
+				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+				     __GFP_NOWARN);
+	if (unlikely(ret < 0))
+		return ret;
+
+	ce->guc_id.id = ret;
+	return 0;
 }
 
 static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	if (!context_guc_id_invalid(ce)) {
-		ida_simple_remove(&guc->submission_state.guc_ids,
-				  ce->guc_id.id);
+		if (intel_context_is_parent(ce))
+			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
+					      ce->guc_id.id,
+					      order_base_2(ce->guc_number_children
+							   + 1));
+		else
+			ida_simple_remove(&guc->submission_state.guc_ids,
+					  ce->guc_id.id);
 		reset_lrc_desc(guc, ce->guc_id.id);
 		set_context_guc_id_invalid(ce);
 	}
@@ -1267,49 +1309,60 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 }
 
-static int steal_guc_id(struct intel_guc *guc)
+static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
-	struct intel_context *ce;
-	int guc_id;
+	struct intel_context *cn;
 
 	lockdep_assert_held(&guc->submission_state.lock);
+	GEM_BUG_ON(intel_context_is_child(ce));
+	GEM_BUG_ON(intel_context_is_parent(ce));
 
 	if (!list_empty(&guc->submission_state.guc_id_list)) {
-		ce = list_first_entry(&guc->submission_state.guc_id_list,
+		cn = list_first_entry(&guc->submission_state.guc_id_list,
 				      struct intel_context,
 				      guc_id.link);
 
-		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
-		GEM_BUG_ON(context_guc_id_invalid(ce));
-
-		list_del_init(&ce->guc_id.link);
-		guc_id = ce->guc_id.id;
+		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
+		GEM_BUG_ON(context_guc_id_invalid(cn));
+		GEM_BUG_ON(intel_context_is_child(cn));
+		GEM_BUG_ON(intel_context_is_parent(cn));
 
-		spin_lock(&ce->guc_state.lock);
-		clr_context_registered(ce);
-		spin_unlock(&ce->guc_state.lock);
+		list_del_init(&cn->guc_id.link);
+		ce->guc_id = cn->guc_id;
+		clr_context_registered(cn);
+		set_context_guc_id_invalid(cn);
 
-		set_context_guc_id_invalid(ce);
-		return guc_id;
+		return 0;
 	} else {
 		return -EAGAIN;
 	}
 }
 
-static int assign_guc_id(struct intel_guc *guc, u16 *out)
+static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	int ret;
 
 	lockdep_assert_held(&guc->submission_state.lock);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
-	ret = new_guc_id(guc);
+	ret = new_guc_id(guc, ce);
 	if (unlikely(ret < 0)) {
-		ret = steal_guc_id(guc);
+		if (intel_context_is_parent(ce))
+			return -ENOSPC;
+
+		ret = steal_guc_id(guc, ce);
 		if (ret < 0)
 			return ret;
 	}
 
-	*out = ret;
+	if (intel_context_is_parent(ce)) {
+		struct intel_context *child;
+		int i = 1;
+
+		for_each_child(ce, child)
+			child->guc_id.id = ce->guc_id.id + i++;
+	}
+
 	return 0;
 }
 
@@ -1327,7 +1380,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	might_lock(&ce->guc_state.lock);
 
 	if (context_guc_id_invalid(ce)) {
-		ret = assign_guc_id(guc, &ce->guc_id.id);
+		ret = assign_guc_id(guc, ce);
 		if (ret)
 			goto out_unlock;
 		ret = 1;	/* Indidcates newly assigned guc_id */
@@ -1369,8 +1422,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	unsigned long flags;
 
 	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
-	if (unlikely(context_guc_id_invalid(ce)))
+	if (unlikely(context_guc_id_invalid(ce) ||
+		     intel_context_is_parent(ce)))
 		return;
 
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
-- 
2.32.0

