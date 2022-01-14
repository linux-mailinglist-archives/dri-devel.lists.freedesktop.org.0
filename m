Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2348EA95
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 14:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5F910E3E4;
	Fri, 14 Jan 2022 13:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE410E32F;
 Fri, 14 Jan 2022 13:23:25 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 3/6] drm/i915: Add object locking to
 i915_gem_evict_for_node and i915_gem_evict_something, v2.
Date: Fri, 14 Jan 2022 14:23:17 +0100
Message-Id: <20220114132320.109030-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114132320.109030-1-maarten.lankhorst@linux.intel.com>
References: <20220114132320.109030-1-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because we will start to require the obj->resv lock for unbinding,
ensure these vma eviction utility functions also take the lock.

This requires some function signature changes, to ensure that the
ww context is passed around, but is mostly straightforward.

Previously this was split up into several patches, but reworking
should allow for easier bisection.

Changes since v1:
- Handle evicting dead objects better.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |  2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         | 69 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gem_evict.h         |  2 +
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  8 ++-
 drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               |  9 +--
 .../gpu/drm/i915/selftests/i915_gem_evict.c   | 16 ++---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  6 +-
 11 files changed, 91 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index a1b2761bc16e..da7f54b6fa38 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -506,7 +506,7 @@ static int ggtt_reserve_guc_top(struct i915_ggtt *ggtt)
 	GEM_BUG_ON(ggtt->vm.total <= GUC_GGTT_TOP);
 	size = ggtt->vm.total - GUC_GGTT_TOP;
 
-	ret = i915_gem_gtt_reserve(&ggtt->vm, &ggtt->uc_fw, size,
+	ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, &ggtt->uc_fw, size,
 				   GUC_GGTT_TOP, I915_COLOR_UNEVICTABLE,
 				   PIN_NOEVICT);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 4a20ba63446c..c078d3f55815 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -1383,7 +1383,7 @@ static int evict_vma(void *data)
 	complete(&arg->completion);
 
 	mutex_lock(&vm->mutex);
-	err = i915_gem_evict_for_node(vm, &evict, 0);
+	err = i915_gem_evict_for_node(vm, NULL, &evict, 0);
 	mutex_unlock(&vm->mutex);
 
 	return err;
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 0d6d59871308..c08098a167e9 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -63,7 +63,7 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
 
 	mutex_lock(&gt->ggtt->vm.mutex);
 	mmio_hw_access_pre(gt);
-	ret = i915_gem_gtt_insert(&gt->ggtt->vm, node,
+	ret = i915_gem_gtt_insert(&gt->ggtt->vm, NULL, node,
 				  size, I915_GTT_PAGE_SIZE,
 				  I915_COLOR_UNEVICTABLE,
 				  start, end, flags);
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 91f82ecb9ef4..e93fe26930fb 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -38,6 +38,11 @@ I915_SELFTEST_DECLARE(static struct igt_evict_ctl {
 	bool fail_if_busy:1;
 } igt_evict_ctl;)
 
+static bool dying_vma(struct i915_vma *vma)
+{
+	return !kref_read(&vma->obj->base.refcount);
+}
+
 static int ggtt_flush(struct intel_gt *gt)
 {
 	/*
@@ -50,8 +55,37 @@ static int ggtt_flush(struct intel_gt *gt)
 	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 }
 
+static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
+{
+	/*
+	 * We add the extra refcount so the object doesn't drop to zero until
+	 * after ungrab_vma(), this way trylock is always paired with unlock.
+	 */
+	if (i915_gem_object_get_rcu(vma->obj)) {
+		if (!i915_gem_object_trylock(vma->obj, ww)) {
+			i915_gem_object_put(vma->obj);
+			return false;
+		}
+	} else {
+		/* Dead objects don't need pins */
+		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+	}
+
+	return true;
+}
+
+static void ungrab_vma(struct i915_vma *vma)
+{
+	if (dying_vma(vma))
+		return;
+
+	i915_gem_object_unlock(vma->obj);
+	i915_gem_object_put(vma->obj);
+}
+
 static bool
 mark_free(struct drm_mm_scan *scan,
+	  struct i915_gem_ww_ctx *ww,
 	  struct i915_vma *vma,
 	  unsigned int flags,
 	  struct list_head *unwind)
@@ -59,6 +93,9 @@ mark_free(struct drm_mm_scan *scan,
 	if (i915_vma_is_pinned(vma))
 		return false;
 
+	if (!grab_vma(vma, ww))
+		return false;
+
 	list_add(&vma->evict_link, unwind);
 	return drm_mm_scan_add_block(scan, &vma->node);
 }
@@ -99,6 +136,7 @@ static bool defer_evict(struct i915_vma *vma)
  */
 int
 i915_gem_evict_something(struct i915_address_space *vm,
+			 struct i915_gem_ww_ctx *ww,
 			 u64 min_size, u64 alignment,
 			 unsigned long color,
 			 u64 start, u64 end,
@@ -171,7 +209,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 			continue;
 		}
 
-		if (mark_free(&scan, vma, flags, &eviction_list))
+		if (mark_free(&scan, ww, vma, flags, &eviction_list))
 			goto found;
 	}
 
@@ -179,6 +217,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
 		ret = drm_mm_scan_remove_block(&scan, &vma->node);
 		BUG_ON(ret);
+		ungrab_vma(vma);
 	}
 
 	/*
@@ -223,10 +262,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	 * of any of our objects, thus corrupting the list).
 	 */
 	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
-		if (drm_mm_scan_remove_block(&scan, &vma->node))
+		if (drm_mm_scan_remove_block(&scan, &vma->node)) {
 			__i915_vma_pin(vma);
-		else
+		} else {
 			list_del(&vma->evict_link);
+			ungrab_vma(vma);
+		}
 	}
 
 	/* Unbinding will emit any required flushes */
@@ -235,16 +276,20 @@ i915_gem_evict_something(struct i915_address_space *vm,
 		__i915_vma_unpin(vma);
 		if (ret == 0)
 			ret = __i915_vma_unbind(vma);
+		ungrab_vma(vma);
 	}
 
 	while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
 		vma = container_of(node, struct i915_vma, node);
 
 		/* If we find any non-objects (!vma), we cannot evict them */
-		if (vma->node.color != I915_COLOR_UNEVICTABLE)
+		if (vma->node.color != I915_COLOR_UNEVICTABLE &&
+		    grab_vma(vma, ww)) {
 			ret = __i915_vma_unbind(vma);
-		else
-			ret = -ENOSPC; /* XXX search failed, try again? */
+			ungrab_vma(vma);
+		} else {
+			ret = -ENOSPC;
+		}
 	}
 
 	return ret;
@@ -262,6 +307,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
  * memory in e.g. the shrinker.
  */
 int i915_gem_evict_for_node(struct i915_address_space *vm,
+			    struct i915_gem_ww_ctx *ww,
 			    struct drm_mm_node *target,
 			    unsigned int flags)
 {
@@ -334,6 +380,11 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 			break;
 		}
 
+		if (!grab_vma(vma, ww)) {
+			ret = -ENOSPC;
+			break;
+		}
+
 		/*
 		 * Never show fear in the face of dragons!
 		 *
@@ -351,6 +402,8 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 		__i915_vma_unpin(vma);
 		if (ret == 0)
 			ret = __i915_vma_unbind(vma);
+
+		ungrab_vma(vma);
 	}
 
 	return ret;
@@ -400,8 +453,8 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 			 * the resv is shared among multiple objects, we still
 			 * need the object ref.
 			 */
-			if (!kref_read(&vma->obj->base.refcount) ||
-			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx))) {
+			if (dying_vma(vma) || (ww &&
+			     (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx))) {
 				__i915_vma_pin(vma);
 				list_add(&vma->evict_link, &locked_eviction_list);
 				continue;
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i915_gem_evict.h
index f5b7a9100609..e593c530f9bd 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.h
+++ b/drivers/gpu/drm/i915/i915_gem_evict.h
@@ -13,11 +13,13 @@ struct i915_address_space;
 struct i915_gem_ww_ctx;
 
 int __must_check i915_gem_evict_something(struct i915_address_space *vm,
+					  struct i915_gem_ww_ctx *ww,
 					  u64 min_size, u64 alignment,
 					  unsigned long color,
 					  u64 start, u64 end,
 					  unsigned flags);
 int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
+					 struct i915_gem_ww_ctx *ww,
 					 struct drm_mm_node *node,
 					 unsigned int flags);
 int i915_gem_evict_vm(struct i915_address_space *vm,
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index b7094ca48047..022543f9bf32 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -94,6 +94,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
  * asked to wait for eviction and interrupted.
  */
 int i915_gem_gtt_reserve(struct i915_address_space *vm,
+			 struct i915_gem_ww_ctx *ww,
 			 struct drm_mm_node *node,
 			 u64 size, u64 offset, unsigned long color,
 			 unsigned int flags)
@@ -118,7 +119,7 @@ int i915_gem_gtt_reserve(struct i915_address_space *vm,
 	if (flags & PIN_NOEVICT)
 		return -ENOSPC;
 
-	err = i915_gem_evict_for_node(vm, node, flags);
+	err = i915_gem_evict_for_node(vm, ww, node, flags);
 	if (err == 0)
 		err = drm_mm_reserve_node(&vm->mm, node);
 
@@ -185,6 +186,7 @@ static u64 random_offset(u64 start, u64 end, u64 len, u64 align)
  * asked to wait for eviction and interrupted.
  */
 int i915_gem_gtt_insert(struct i915_address_space *vm,
+			struct i915_gem_ww_ctx *ww,
 			struct drm_mm_node *node,
 			u64 size, u64 alignment, unsigned long color,
 			u64 start, u64 end, unsigned int flags)
@@ -270,7 +272,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 	 */
 	offset = random_offset(start, end,
 			       size, alignment ?: I915_GTT_MIN_ALIGNMENT);
-	err = i915_gem_gtt_reserve(vm, node, size, offset, color, flags);
+	err = i915_gem_gtt_reserve(vm, ww, node, size, offset, color, flags);
 	if (err != -ENOSPC)
 		return err;
 
@@ -278,7 +280,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 		return -ENOSPC;
 
 	/* Randomly selected placement is pinned, do a search */
-	err = i915_gem_evict_something(vm, size, alignment, color,
+	err = i915_gem_evict_something(vm, ww, size, alignment, color,
 				       start, end, flags);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index c9b0ee5e1d23..e4938aba3fe9 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -16,6 +16,7 @@
 
 struct drm_i915_gem_object;
 struct i915_address_space;
+struct i915_gem_ww_ctx;
 
 int __must_check i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 					    struct sg_table *pages);
@@ -23,11 +24,13 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages);
 
 int i915_gem_gtt_reserve(struct i915_address_space *vm,
+			 struct i915_gem_ww_ctx *ww,
 			 struct drm_mm_node *node,
 			 u64 size, u64 offset, unsigned long color,
 			 unsigned int flags);
 
 int i915_gem_gtt_insert(struct i915_address_space *vm,
+			struct i915_gem_ww_ctx *ww,
 			struct drm_mm_node *node,
 			u64 size, u64 alignment, unsigned long color,
 			u64 start, u64 end, unsigned int flags);
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 31a105bc1792..c97323973f9b 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -197,7 +197,7 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
 	drm_info(&dev_priv->drm,
 		 "balloon space: range [ 0x%lx - 0x%lx ] %lu KiB.\n",
 		 start, end, size / 1024);
-	ret = i915_gem_gtt_reserve(&ggtt->vm, node,
+	ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, node,
 				   size, start, I915_COLOR_UNEVICTABLE,
 				   0);
 	if (!ret)
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 8477cae5f877..900cd4d9ebde 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -713,7 +713,8 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
  * 0 on success, negative error code otherwise.
  */
 static int
-i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
+i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
+		u64 size, u64 alignment, u64 flags)
 {
 	unsigned long color;
 	u64 start, end;
@@ -765,7 +766,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 		    range_overflows(offset, size, end))
 			return -EINVAL;
 
-		ret = i915_gem_gtt_reserve(vma->vm, &vma->node,
+		ret = i915_gem_gtt_reserve(vma->vm, ww, &vma->node,
 					   size, offset, color,
 					   flags);
 		if (ret)
@@ -804,7 +805,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 				size = round_up(size, I915_GTT_PAGE_SIZE_2M);
 		}
 
-		ret = i915_gem_gtt_insert(vma->vm, &vma->node,
+		ret = i915_gem_gtt_insert(vma->vm, ww, &vma->node,
 					  size, alignment, color,
 					  start, end, flags);
 		if (ret)
@@ -1452,7 +1453,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		goto err_unlock;
 
 	if (!(bound & I915_VMA_BIND_MASK)) {
-		err = i915_vma_insert(vma, size, alignment, flags);
+		err = i915_vma_insert(vma, ww, size, alignment, flags);
 		if (err)
 			goto err_active;
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 7c075c16a573..3f276b2c2bbf 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -117,7 +117,7 @@ static int igt_evict_something(void *arg)
 
 	/* Everything is pinned, nothing should happen */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_something(&ggtt->vm,
+	err = i915_gem_evict_something(&ggtt->vm, NULL,
 				       I915_GTT_PAGE_SIZE, 0, 0,
 				       0, U64_MAX,
 				       0);
@@ -132,7 +132,7 @@ static int igt_evict_something(void *arg)
 
 	/* Everything is unpinned, we should be able to evict something */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_something(&ggtt->vm,
+	err = i915_gem_evict_something(&ggtt->vm, NULL,
 				       I915_GTT_PAGE_SIZE, 0, 0,
 				       0, U64_MAX,
 				       0);
@@ -204,7 +204,7 @@ static int igt_evict_for_vma(void *arg)
 
 	/* Everything is pinned, nothing should happen */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err != -ENOSPC) {
 		pr_err("i915_gem_evict_for_node on a full GGTT returned err=%d\n",
@@ -216,7 +216,7 @@ static int igt_evict_for_vma(void *arg)
 
 	/* Everything is unpinned, we should be able to evict the node */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err) {
 		pr_err("i915_gem_evict_for_node returned err=%d\n",
@@ -297,7 +297,7 @@ static int igt_evict_for_cache_color(void *arg)
 
 	/* Remove just the second vma */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err) {
 		pr_err("[0]i915_gem_evict_for_node returned err=%d\n", err);
@@ -310,7 +310,7 @@ static int igt_evict_for_cache_color(void *arg)
 	target.color = I915_CACHE_L3_LLC;
 
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (!err) {
 		pr_err("[1]i915_gem_evict_for_node returned err=%d\n", err);
@@ -408,7 +408,7 @@ static int igt_evict_contexts(void *arg)
 	/* Reserve a block so that we know we have enough to fit a few rq */
 	memset(&hole, 0, sizeof(hole));
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_gtt_insert(&ggtt->vm, &hole,
+	err = i915_gem_gtt_insert(&ggtt->vm, NULL, &hole,
 				  PRETEND_GGTT_SIZE, 0, I915_COLOR_UNEVICTABLE,
 				  0, ggtt->vm.total,
 				  PIN_NOEVICT);
@@ -428,7 +428,7 @@ static int igt_evict_contexts(void *arg)
 			goto out_locked;
 		}
 
-		if (i915_gem_gtt_insert(&ggtt->vm, &r->node,
+		if (i915_gem_gtt_insert(&ggtt->vm, NULL, &r->node,
 					1ul << 20, 0, I915_COLOR_UNEVICTABLE,
 					0, ggtt->vm.total,
 					PIN_NOEVICT)) {
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 076d860ce01a..b91ec3d2d66a 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1350,7 +1350,7 @@ static int reserve_gtt_with_resource(struct i915_vma *vma, u64 offset)
 		return PTR_ERR(vma_res);
 
 	mutex_lock(&vm->mutex);
-	err = i915_gem_gtt_reserve(vm, &vma->node, obj->base.size,
+	err = i915_gem_gtt_reserve(vm, NULL, &vma->node, obj->base.size,
 				   offset,
 				   obj->cache_level,
 				   0);
@@ -1531,7 +1531,7 @@ static int insert_gtt_with_resource(struct i915_vma *vma)
 		return PTR_ERR(vma_res);
 
 	mutex_lock(&vm->mutex);
-	err = i915_gem_gtt_insert(vm, &vma->node, obj->base.size, 0,
+	err = i915_gem_gtt_insert(vm, NULL, &vma->node, obj->base.size, 0,
 				  obj->cache_level, 0, vm->total, 0);
 	if (!err) {
 		i915_vma_resource_init_from_vma(vma_res, vma);
@@ -1587,7 +1587,7 @@ static int igt_gtt_insert(void *arg)
 	/* Check a couple of obviously invalid requests */
 	for (ii = invalid_insert; ii->size; ii++) {
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_insert(&ggtt->vm, &tmp,
+		err = i915_gem_gtt_insert(&ggtt->vm, NULL, &tmp,
 					  ii->size, ii->alignment,
 					  I915_COLOR_UNEVICTABLE,
 					  ii->start, ii->end,
-- 
2.34.1

