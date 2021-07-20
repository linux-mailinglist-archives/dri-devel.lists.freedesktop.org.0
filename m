Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE53D02E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08EF6E52C;
	Tue, 20 Jul 2021 20:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B665E6E513;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885370"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885370"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906074"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 16/42] drm/i915/guc: Introduce context parent-child
 relationship
Date: Tue, 20 Jul 2021 13:57:36 -0700
Message-Id: <20210720205802.39610-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

Introduce context parent-child relationship. Once this relationship is
created all pinning / unpinning operations are directed to the parent
context. The parent context is responsible for pinning all of its'
children and itself.

This is a precursor to the full GuC multi-lrc implementation but aligns
to how GuC mutli-lrc interface is defined - a single H2G is used
register / deregister all of the contexts simultaneously.

Subsequent patches in the series will implement the pinning / unpinning
operations for parent / child contexts.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context.h       | 18 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index b1e3d00fb1f2..76dd038c57d2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -399,6 +399,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 
+	INIT_LIST_HEAD(&ce->guc_child_list);
+
 	spin_lock_init(&ce->guc_active.lock);
 	INIT_LIST_HEAD(&ce->guc_active.requests);
 
@@ -414,10 +416,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 
 void intel_context_fini(struct intel_context *ce)
 {
+	struct intel_context *child, *next;
+
 	if (ce->timeline)
 		intel_timeline_put(ce->timeline);
 	i915_vm_put(ce->vm);
 
+	/* Need to put the creation ref for the children */
+	if (intel_context_is_parent(ce))
+		for_each_child_safe(ce, child, next)
+			intel_context_put(child);
+
 	mutex_destroy(&ce->pin_mutex);
 	i915_active_fini(&ce->active);
 }
@@ -544,6 +553,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 	return active;
 }
 
+void intel_context_bind_parent_child(struct intel_context *parent,
+				     struct intel_context *child)
+{
+	/*
+	 * Callers responsibility to validate that this function is used
+	 * correctly but we use GEM_BUG_ON here ensure that they do.
+	 */
+	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
+	GEM_BUG_ON(intel_context_is_pinned(parent));
+	GEM_BUG_ON(intel_context_is_child(parent));
+	GEM_BUG_ON(intel_context_is_pinned(child));
+	GEM_BUG_ON(intel_context_is_child(child));
+	GEM_BUG_ON(intel_context_is_parent(child));
+
+        parent->guc_number_children++;
+        list_add_tail(&child->guc_child_link,
+		      &parent->guc_child_list);
+	child->parent = parent;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_context.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 876bdb08303c..28378fd9eb99 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -41,6 +41,24 @@ void intel_context_free(struct intel_context *ce);
 int intel_context_reconfigure_sseu(struct intel_context *ce,
 				   const struct intel_sseu sseu);
 
+static inline bool intel_context_is_child(struct intel_context *ce)
+{
+	return !!ce->parent;
+}
+
+static inline bool intel_context_is_parent(struct intel_context *ce)
+{
+	return !!ce->guc_number_children;
+}
+
+void intel_context_bind_parent_child(struct intel_context *parent,
+				     struct intel_context *child);
+
+#define for_each_child(parent, ce)\
+	list_for_each_entry(ce, &parent->guc_child_list, guc_child_link)
+#define for_each_child_safe(parent, ce, cn)\
+	list_for_each_entry_safe(ce, cn, &parent->guc_child_list, guc_child_link)
+
 /**
  * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
  * @ce - the context
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index aabc1b349044..c2e66acaf892 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -202,6 +202,18 @@ struct intel_context {
 	/* GuC context blocked fence */
 	struct i915_sw_fence guc_blocked;
 
+	/* Head of children list or link in parent's children list */
+	union {
+		struct list_head guc_child_list;	/* parent */
+		struct list_head guc_child_link;	/* child */
+	};
+
+	/* Pointer to parent */
+	struct intel_context *parent;
+
+	/* Number of children if parent */
+	u8 guc_number_children;
+
 	/*
 	 * GuC priority management
 	 */
-- 
2.28.0

