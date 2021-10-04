Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5504219AC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCCC89491;
	Mon,  4 Oct 2021 22:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6B06E223;
 Mon,  4 Oct 2021 22:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248854270"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="248854270"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735479"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 08/26] drm/i915/guc: Add multi-lrc context registration
Date: Mon,  4 Oct 2021 15:06:19 -0700
Message-Id: <20211004220637.14746-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

Add multi-lrc context registration H2G. In addition a workqueue and
process descriptor are setup during multi-lrc context registration as
these data structures are needed for multi-lrc submission.

v2:
 (John Harrison)
  - Move GuC specific fields into sub-struct
  - Clean up WQ defines
  - Add comment explaining math to derive WQ / PD address

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 -
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 +++++++++++++++++-
 5 files changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 76dfca57cb45..48decb5ee954 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -239,6 +239,18 @@ struct intel_context {
 		struct intel_context *parent;
 		/** @number_children: number of children if parent */
 		u8 number_children;
+		/** @guc: GuC specific members for parallel submission */
+		struct {
+			/** @wqi_head: head pointer in work queue */
+			u16 wqi_head;
+			/** @wqi_tail: tail pointer in work queue */
+			u16 wqi_tail;
+			/**
+			 * @parent_page: page in context state (ce->state) used
+			 * by parent for work queue, process descriptor
+			 */
+			u8 parent_page;
+		} guc;
 	} parallel;
 
 #ifdef CONFIG_DRM_I915_SELFTEST
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 3ef9eaf8c50e..57339d5c1fc8 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -942,6 +942,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 		context_size += PAGE_SIZE;
 	}
 
+	if (intel_context_is_parent(ce) && intel_engine_uses_guc(engine)) {
+		ce->parallel.guc.parent_page = context_size / PAGE_SIZE;
+		context_size += PAGE_SIZE;
+	}
+
 	obj = i915_gem_object_create_lmem(engine->i915, context_size,
 					  I915_BO_ALLOC_PM_VOLATILE);
 	if (IS_ERR(obj))
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 8ff582222aff..ba10bd374cee 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -142,6 +142,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
 	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
+	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
 	INTEL_GUC_ACTION_LIMIT
 };
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index fa4be13c8854..0eeb2a9feeed 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -52,8 +52,6 @@
 
 #define GUC_DOORBELL_INVALID		256
 
-#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
-
 /* Work queue item header definitions */
 #define WQ_STATUS_ACTIVE		1
 #define WQ_STATUS_SUSPENDED		2
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 451d9ae861a6..ab6d7fc1b0b1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -344,6 +344,45 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 	return rb_entry(rb, struct i915_priolist, node);
 }
 
+/*
+ * When using multi-lrc submission an extra page in the context state is
+ * reserved for the process descriptor and work queue.
+ *
+ * The layout of this page is below:
+ * 0						guc_process_desc
+ * ...						unused
+ * PAGE_SIZE / 2				work queue start
+ * ...						work queue
+ * PAGE_SIZE - 1				work queue end
+ */
+#define WQ_SIZE			(PAGE_SIZE / 2)
+#define WQ_OFFSET		(PAGE_SIZE - WQ_SIZE)
+static u32 __get_process_desc_offset(struct intel_context *ce)
+{
+	GEM_BUG_ON(!ce->parallel.guc.parent_page);
+
+	return ce->parallel.guc.parent_page * PAGE_SIZE;
+}
+
+static u32 __get_wq_offset(struct intel_context *ce)
+{
+	return __get_process_desc_offset(ce) + WQ_OFFSET;
+}
+
+static struct guc_process_desc *
+__get_process_desc(struct intel_context *ce)
+{
+	/*
+	 * Need to subtract LRC_STATE_OFFSET here as the
+	 * parallel.guc.parent_page is the offset into ce->state while
+	 * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
+	 */
+	return (struct guc_process_desc *)
+		(ce->lrc_reg_state +
+		 ((__get_process_desc_offset(ce) -
+		   LRC_STATE_OFFSET) / sizeof(u32)));
+}
+
 static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 {
 	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
@@ -1365,6 +1404,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 }
 
+static int __guc_action_register_multi_lrc(struct intel_guc *guc,
+					   struct intel_context *ce,
+					   u32 guc_id,
+					   u32 offset,
+					   bool loop)
+{
+	struct intel_context *child;
+	u32 action[4 + MAX_ENGINE_INSTANCE];
+	int len = 0;
+
+	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
+
+	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
+	action[len++] = guc_id;
+	action[len++] = ce->parallel.number_children + 1;
+	action[len++] = offset;
+	for_each_child(ce, child) {
+		offset += sizeof(struct guc_lrc_desc);
+		action[len++] = offset;
+	}
+
+	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
+}
+
 static int __guc_action_register_context(struct intel_guc *guc,
 					 u32 guc_id,
 					 u32 offset,
@@ -1387,9 +1450,15 @@ static int register_context(struct intel_context *ce, bool loop)
 		ce->guc_id.id * sizeof(struct guc_lrc_desc);
 	int ret;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
-	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
+	if (intel_context_is_parent(ce))
+		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
+						      offset, loop);
+	else
+		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
+						    loop);
 	if (likely(!ret)) {
 		unsigned long flags;
 
@@ -1418,6 +1487,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_deregister(ce);
 
 	return __guc_action_deregister_context(guc, guc_id);
@@ -1445,6 +1515,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	struct guc_lrc_desc *desc;
 	bool context_registered;
 	intel_wakeref_t wakeref;
+	struct intel_context *child;
 	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
@@ -1470,6 +1541,41 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
 
+	/*
+	 * Context is a parent, we need to register a process descriptor
+	 * describing a work queue and register all child contexts.
+	 */
+	if (intel_context_is_parent(ce)) {
+		struct guc_process_desc *pdesc;
+
+		ce->parallel.guc.wqi_tail = 0;
+		ce->parallel.guc.wqi_head = 0;
+
+		desc->process_desc = i915_ggtt_offset(ce->state) +
+			__get_process_desc_offset(ce);
+		desc->wq_addr = i915_ggtt_offset(ce->state) +
+			__get_wq_offset(ce);
+		desc->wq_size = WQ_SIZE;
+
+		pdesc = __get_process_desc(ce);
+		memset(pdesc, 0, sizeof(*(pdesc)));
+		pdesc->stage_id = ce->guc_id.id;
+		pdesc->wq_base_addr = desc->wq_addr;
+		pdesc->wq_size_bytes = desc->wq_size;
+		pdesc->wq_status = WQ_STATUS_ACTIVE;
+
+		for_each_child(ce, child) {
+			desc = __get_lrc_desc(guc, child->guc_id.id);
+
+			desc->engine_class =
+				engine_class_to_guc_class(engine->class);
+			desc->hw_context_desc = child->lrc.lrca;
+			desc->priority = ce->guc_state.prio;
+			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
+			guc_context_policy_init(engine, desc);
+		}
+	}
+
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
 	 * context is currently registered. There are two cases in which it
@@ -2804,6 +2910,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 		return NULL;
 	}
 
+	if (unlikely(intel_context_is_child(ce))) {
+		drm_err(&guc_to_gt(guc)->i915->drm,
+			"Context is child, desc_idx %u", desc_idx);
+		return NULL;
+	}
+
 	return ce;
 }
 
-- 
2.32.0

