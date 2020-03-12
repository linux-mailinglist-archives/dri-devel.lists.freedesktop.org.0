Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEBD18300E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 13:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191DF6E19A;
	Thu, 12 Mar 2020 12:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4BA6E19A;
 Thu, 12 Mar 2020 12:19:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20535604-1500050 
 for multiple; Thu, 12 Mar 2020 12:19:02 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/mm: Use debugobject to track lifetimes
Date: Thu, 12 Mar 2020 12:19:01 +0000
Message-Id: <20200312121901.25569-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312103548.19962-1-chris@chris-wilson.co.uk>
References: <20200312103548.19962-1-chris@chris-wilson.co.uk>
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
And now switch on for CI. Expect failure from unmarked drm_mm_nodes.
---
 drivers/gpu/drm/Kconfig              |  13 +++
 drivers/gpu/drm/drm_mm.c             | 113 +++++++++++++++++++++++----
 drivers/gpu/drm/i915/Kconfig.debug   |   1 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c |   2 -
 drivers/gpu/drm/i915/i915_vma.c      |  17 +++-
 include/drm/drm_mm.h                 |  31 ++++++++
 6 files changed, 158 insertions(+), 19 deletions(-)

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
index bc6e208949e8..3cbee92f5832 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -116,38 +116,99 @@ static noinline void save_stack(struct drm_mm_node *node)
 	node->stack = stack_depot_save(entries, n, GFP_NOWAIT);
 }
 
-static void show_leaks(struct drm_mm *mm)
+static void __print_node(struct drm_mm_node *node,
+			 char *buf, int sz,
+			 const char *reason)
 {
-	struct drm_mm_node *node;
 	unsigned long *entries;
 	unsigned int nr_entries;
+
+	if (!node->stack) {
+		DRM_ERROR("node [%08llx + %08llx]: %s, unknown owner\n",
+			  node->start, node->size, reason);
+		return;
+	}
+
+	nr_entries = stack_depot_fetch(node->stack, &entries);
+	stack_trace_snprint(buf, sz, entries, nr_entries, 0);
+	DRM_ERROR("node [%08llx + %08llx]: %s, inserted at\n%s",
+		  node->start, node->size, reason, buf);
+}
+
+static void show_leaks(struct drm_mm *mm)
+{
+	struct drm_mm_node *node;
 	char *buf;
 
 	buf = kmalloc(BUFSZ, GFP_KERNEL);
 	if (!buf)
 		return;
 
-	list_for_each_entry(node, drm_mm_nodes(mm), node_list) {
-		if (!node->stack) {
-			DRM_ERROR("node [%08llx + %08llx]: unknown owner\n",
-				  node->start, node->size);
-			continue;
-		}
-
-		nr_entries = stack_depot_fetch(node->stack, &entries);
-		stack_trace_snprint(buf, BUFSZ, entries, nr_entries, 0);
-		DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
-			  node->start, node->size, buf);
-	}
+	list_for_each_entry(node, drm_mm_nodes(mm), node_list)
+		__print_node(node, buf, BUFSZ, "leaked");
 
 	kfree(buf);
 }
 
+static void show_node(struct drm_mm_node *node, const char *reason)
+{
+	char buf[128];
+
+	__print_node(node, buf, sizeof(buf), reason);
+}
+
 #undef STACKDEPTH
 #undef BUFSZ
 #else
 static void save_stack(struct drm_mm_node *node) { }
 static void show_leaks(struct drm_mm *mm) { }
+
+static void show_node(struct drm_mm_node *node, const char *reason)
+{
+	DRM_ERROR("node [%08llx + %08llx]: %s\n",
+		  node->start, node->size, reason);
+}
+#endif
+
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
+static inline void debug_node_assert(struct drm_mm_node *node)
+{
+	debug_object_assert_init(node, &drm_mm_debug_descr);
+}
+
+#else
+
+static inline void debug_node_init(struct drm_mm_node *node) { }
+static inline void debug_node_activate(struct drm_mm_node *node) { }
+static inline void debug_node_deactivate(struct drm_mm_node *node) { }
+static inline void debug_node_free(struct drm_mm_node *node) { }
+static inline void debug_node_assert(struct drm_mm_node *node) { }
+
 #endif
 
 #define START(node) ((node)->start)
@@ -428,6 +489,8 @@ int drm_mm_reserve_node(struct drm_mm *mm, struct drm_mm_node *node)
 	if (adj_start > node->start || adj_end < end)
 		return -ENOSPC;
 
+	debug_node_activate(node);
+
 	node->mm = mm;
 
 	__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &node->flags);
@@ -543,6 +606,8 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 			}
 		}
 
+		debug_node_activate(node);
+
 		node->mm = mm;
 		node->size = size;
 		node->start = adj_start;
@@ -587,6 +652,7 @@ void drm_mm_remove_node(struct drm_mm_node *node)
 
 	DRM_MM_BUG_ON(!drm_mm_node_allocated(node));
 	DRM_MM_BUG_ON(drm_mm_node_scanned_block(node));
+	debug_node_deactivate(node);
 
 	prev_node = list_prev_entry(node, node_list);
 
@@ -618,6 +684,8 @@ void drm_mm_replace_node(struct drm_mm_node *old, struct drm_mm_node *new)
 	struct drm_mm *mm = old->mm;
 
 	DRM_MM_BUG_ON(!drm_mm_node_allocated(old));
+	debug_node_deactivate(old);
+	debug_node_activate(new);
 
 	*new = *old;
 
@@ -639,6 +707,21 @@ void drm_mm_replace_node(struct drm_mm_node *old, struct drm_mm_node *new)
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
+	if (unlikely(drm_mm_node_allocated(node)))
+		show_node(node, "use-after-free");
+
+	debug_node_free(node);
+}
+EXPORT_SYMBOL(__drm_mm_node_fini);
+
 /**
  * DOC: lru scan roster
  *
@@ -742,6 +825,7 @@ bool drm_mm_scan_add_block(struct drm_mm_scan *scan,
 	u64 col_start, col_end;
 	u64 adj_start, adj_end;
 
+	debug_node_assert(node);
 	DRM_MM_BUG_ON(node->mm != mm);
 	DRM_MM_BUG_ON(!drm_mm_node_allocated(node));
 	DRM_MM_BUG_ON(drm_mm_node_scanned_block(node));
@@ -829,6 +913,7 @@ bool drm_mm_scan_remove_block(struct drm_mm_scan *scan,
 {
 	struct drm_mm_node *prev_node;
 
+	debug_node_assert(node);
 	DRM_MM_BUG_ON(node->mm != scan->mm);
 	DRM_MM_BUG_ON(!drm_mm_node_scanned_block(node));
 	__clear_bit(DRM_MM_NODE_SCANNED_BIT, &node->flags);
diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 206882e154bc..21ecc4cb3e8b 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -35,6 +35,7 @@ config DRM_I915_DEBUG
 	select X86_MSR # used by igt/pm_rpm
 	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
 	select DRM_DEBUG_MM if DRM=y
+	select DRM_DEBUG_MM_OBJECTS
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_DEBUG_SELFTEST
 	select DMABUF_SELFTESTS
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
index d7939c054259..514685590603 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -275,6 +275,37 @@ static inline bool drm_mm_initialized(const struct drm_mm *mm)
 	return mm->hole_stack.next;
 }
 
+/* stubs for external module compatiblity */
+void __drm_mm_node_init(struct drm_mm_node *node);
+void __drm_mm_node_fini(struct drm_mm_node *node);
+
+/**
+ * drm_mm_node_init - Prepare a node for use.
+ *
+ * Drivers should clear the drm_mm_node prior to use. If debug is enabled,
+ * the lifetime of the embedded drm_mm_node will be tracked.
+ */
+static inline void drm_mm_node_init(struct drm_mm_node *node)
+{
+#ifdef CONFIG_DRM_DEBUG_MM_OBJECTS
+	__drm_mm_node_init(node);
+#endif
+	memset(node, 0, sizeof(*node));
+}
+
+/**
+ * drm_mm_node_fini - Finalize a node for use.
+ *
+ * Drivers should indicate that the drm_mm_node is finished, and its
+ * state will then be verified by drm_mm.
+ */
+static inline void drm_mm_node_fini(struct drm_mm_node *node)
+{
+#ifdef CONFIG_DRM_DEBUG_MM_OBJECTS
+	__drm_mm_node_fini(node);
+#endif
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
