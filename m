Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA574182DE4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20E6E125;
	Thu, 12 Mar 2020 10:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B7C6E125;
 Thu, 12 Mar 2020 10:35:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20532644-1500050 
 for multiple; Thu, 12 Mar 2020 10:35:49 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/mm: Use debugobject to track lifetimes
Date: Thu, 12 Mar 2020 10:35:48 +0000
Message-Id: <20200312103548.19962-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since drm_mm_node are intended to be embedded into larger structs, we
can use the DEBUG_OBJECTS facility to help track the lifetime of the
drm_mm_node and ensure that they are not being used after the containing
object has been freed, along with the usual verification that the
drm_mm_nodes are being used correctly.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/Kconfig              | 13 +++++++
 drivers/gpu/drm/drm_mm.c             | 54 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c |  2 --
 drivers/gpu/drm/i915/i915_vma.c      | 17 +++++++--
 include/drm/drm_mm.h                 | 19 ++++++++++
 5 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 43594978958e..33ac38be55b0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -54,6 +54,19 @@ config DRM_DEBUG_MM
 
 	  If in doubt, say "N".
 
+config DRM_DEBUG_MM_OBJECTS
+	bool "Use debugobjects to track live drm_mm_nodes"
+	default n
+	depends on DRM_DEBUG_MM
+	depends on DEBUG_OBJECTS
+	help
+	  Enable allocation tracking of memory manager and leak detection on
+	  shutdown.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_DEBUG_SELFTEST
 	tristate "kselftests for DRM"
 	depends on DRM
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index bc6e208949e8..c149c54d8ede 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -150,6 +150,41 @@ static void save_stack(struct drm_mm_node *node) { }
 static void show_leaks(struct drm_mm *mm) { }
 #endif
 
+#ifdef CONFIG_DRM_DEBUG_MM_OBJECTS
+
+static struct debug_obj_descr drm_mm_debug_descr = {
+	.name = "drm_mm_node",
+};
+
+static inline void debug_node_init(struct drm_mm_node *node)
+{
+	debug_object_init(node, &drm_mm_debug_descr);
+}
+
+static inline void debug_node_activate(struct drm_mm_node *node)
+{
+	debug_object_activate(node, &drm_mm_debug_descr);
+}
+
+static inline void debug_node_deactivate(struct drm_mm_node *node)
+{
+	debug_object_deactivate(node, &drm_mm_debug_descr);
+}
+
+static inline void debug_node_free(struct drm_mm_node *node)
+{
+	debug_object_free(node, &drm_mm_debug_descr);
+}
+
+#else
+
+static inline void debug_node_init(struct drm_mm_node *node) { }
+static inline void debug_node_activate(struct drm_mm_node *node) { }
+static inline void debug_node_deactivate(struct drm_mm_node *node) { }
+static inline void debug_node_free(struct drm_mm_node *node) { }
+
+#endif
+
 #define START(node) ((node)->start)
 #define LAST(node)  ((node)->start + (node)->size - 1)
 
@@ -428,6 +463,8 @@ int drm_mm_reserve_node(struct drm_mm *mm, struct drm_mm_node *node)
 	if (adj_start > node->start || adj_end < end)
 		return -ENOSPC;
 
+	debug_node_activate(node);
+
 	node->mm = mm;
 
 	__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &node->flags);
@@ -543,6 +580,8 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 			}
 		}
 
+		debug_node_activate(node);
+
 		node->mm = mm;
 		node->size = size;
 		node->start = adj_start;
@@ -587,6 +626,7 @@ void drm_mm_remove_node(struct drm_mm_node *node)
 
 	DRM_MM_BUG_ON(!drm_mm_node_allocated(node));
 	DRM_MM_BUG_ON(drm_mm_node_scanned_block(node));
+	debug_node_deactivate(node);
 
 	prev_node = list_prev_entry(node, node_list);
 
@@ -618,6 +658,8 @@ void drm_mm_replace_node(struct drm_mm_node *old, struct drm_mm_node *new)
 	struct drm_mm *mm = old->mm;
 
 	DRM_MM_BUG_ON(!drm_mm_node_allocated(old));
+	debug_node_deactivate(old);
+	debug_node_activate(new);
 
 	*new = *old;
 
@@ -639,6 +681,18 @@ void drm_mm_replace_node(struct drm_mm_node *old, struct drm_mm_node *new)
 }
 EXPORT_SYMBOL(drm_mm_replace_node);
 
+void __drm_mm_node_init(struct drm_mm_node *node)
+{
+	debug_node_init(node);
+}
+EXPORT_SYMBOL(__drm_mm_node_init);
+
+void __drm_mm_node_fini(struct drm_mm_node *node)
+{
+	debug_node_free(node);
+}
+EXPORT_SYMBOL(__drm_mm_node_fini);
+
 /**
  * DOC: lru scan roster
  *
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index f4fec7eb4064..0c34d4dd6458 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -359,8 +359,6 @@ static struct i915_vma *pd_vma_create(struct gen6_ppgtt *ppgtt, int size)
 
 	i915_active_init(&vma->active, NULL, NULL);
 
-	kref_init(&vma->ref);
-	mutex_init(&vma->pages_mutex);
 	vma->vm = i915_vm_get(&ggtt->vm);
 	vma->ops = &pd_vma_ops;
 	vma->private = ppgtt;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 5b3efb43a8ef..64140d51ae2c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -45,11 +45,24 @@ static struct i915_global_vma {
 
 struct i915_vma *i915_vma_alloc(void)
 {
-	return kmem_cache_zalloc(global.slab_vmas, GFP_KERNEL);
+	struct i915_vma *vma;
+
+	vma = kmem_cache_zalloc(global.slab_vmas, GFP_KERNEL);
+	if (!vma)
+		return NULL;
+
+	kref_init(&vma->ref);
+	mutex_init(&vma->pages_mutex);
+	drm_mm_node_init(&vma->node);
+
+	return vma;
 }
 
 void i915_vma_free(struct i915_vma *vma)
 {
+	drm_mm_node_fini(&vma->node);
+	mutex_destroy(&vma->pages_mutex);
+
 	return kmem_cache_free(global.slab_vmas, vma);
 }
 
@@ -114,8 +127,6 @@ vma_create(struct drm_i915_gem_object *obj,
 	if (vma == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	kref_init(&vma->ref);
-	mutex_init(&vma->pages_mutex);
 	vma->vm = i915_vm_get(vm);
 	vma->ops = &vm->vma_ops;
 	vma->obj = obj;
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index d7939c054259..5ecadb7ca8fb 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -275,6 +275,25 @@ static inline bool drm_mm_initialized(const struct drm_mm *mm)
 	return mm->hole_stack.next;
 }
 
+#ifdef CONFIG_DRM_DEBUG_MM_OBJECTS
+void __drm_mm_node_init(struct drm_mm_node *node);
+void __drm_mm_node_fini(struct drm_mm_node *node);
+#else
+static inline void __drm_mm_node_init(struct drm_mm_node *node) { }
+static inline void __drm_mm_node_fini(struct drm_mm_node *node) { }
+#endif
+
+static inline void drm_mm_node_init(struct drm_mm_node *node)
+{
+	__drm_mm_node_init(node);
+	memset(node, 0, sizeof(*node));
+}
+
+static inline void drm_mm_node_fini(struct drm_mm_node *node)
+{
+	__drm_mm_node_fini(node);
+}
+
 /**
  * drm_mm_hole_follows - checks whether a hole follows this node
  * @node: drm_mm_node to check
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
