Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7941947749F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DD01122D6;
	Thu, 16 Dec 2021 14:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE34010FF3C;
 Thu, 16 Dec 2021 14:28:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 14/17] drm/i915: Add i915_vma_unbind_unlocked,
 and take obj lock for i915_vma_unbind, v2.
Date: Thu, 16 Dec 2021 15:27:46 +0100
Message-Id: <20211216142749.1966107-15-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
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
Cc: Matthew Auld <matthew.william.auld@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to remove more members of i915_vma, which requires the locking to be
held more often.

Start requiring gem object lock for i915_vma_unbind, as it's one of the
callers that may unpin pages.

Some special care is needed when evicting, because the last reference to the
object may be held by the VMA, so after __i915_vma_unbind, vma may be garbage,
and we need to cache vma->obj before unlocking.

Changes since v1:
- Make trylock failing a WARN. (Matt)
- Remove double i915_vma_wait_for_bind() (Matt)
- Move atomic_set to right before mutex_unlock(), to make it more clear
  they belong together. (Matt)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.william.auld@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  6 +++
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 49 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gem.c               |  2 +
 drivers/gpu/drm/i915/i915_vma.c               | 27 +++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  1 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 22 ++++-----
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  8 +--
 10 files changed, 95 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 31c15e5fca95..9c555f6d1958 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -47,7 +47,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 		goto err;
 
 	if (i915_vma_misplaced(vma, 0, alignment, 0)) {
-		ret = i915_vma_unbind(vma);
+		ret = i915_vma_unbind_unlocked(vma);
 		if (ret) {
 			vma = ERR_PTR(ret);
 			goto err;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index c69c7d45aabc..0db62652e3ba 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -647,7 +647,7 @@ static int igt_mock_ppgtt_misaligned_dma(void *arg)
 		 * pages.
 		 */
 		for (offset = 4096; offset < page_size; offset += 4096) {
-			err = i915_vma_unbind(vma);
+			err = i915_vma_unbind_unlocked(vma);
 			if (err)
 				goto out_unpin;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index 8402ed925a69..8fb5be799b3c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -318,7 +318,7 @@ static int pin_buffer(struct i915_vma *vma, u64 addr)
 	int err;
 
 	if (drm_mm_node_allocated(&vma->node) && vma->node.start != addr) {
-		err = i915_vma_unbind(vma);
+		err = i915_vma_unbind_unlocked(vma);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 6d30cdfa80f3..e69e8861352d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -165,7 +165,9 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	kunmap(p);
 
 out:
+	i915_gem_object_lock(obj, NULL);
 	__i915_vma_put(vma);
+	i915_gem_object_unlock(obj);
 	return err;
 }
 
@@ -259,7 +261,9 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		if (err)
 			return err;
 
+		i915_gem_object_lock(obj, NULL);
 		__i915_vma_put(vma);
+		i915_gem_object_unlock(obj);
 
 		if (igt_timeout(end_time,
 				"%s: timed out after tiling=%d stride=%d\n",
@@ -1349,7 +1353,9 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
 	 * for other objects. Ergo we have to revoke the previous mmap PTE
 	 * access as it no longer points to the same object.
 	 */
+	i915_gem_object_lock(obj, NULL);
 	err = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
+	i915_gem_object_unlock(obj);
 	if (err) {
 		pr_err("Failed to unbind object!\n");
 		goto out_unmap;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index ed43e9c80aaa..8bba5b9ceeb0 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -129,22 +129,49 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
 
 	drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
 
+retry:
+	i915_gem_drain_freed_objects(vm->i915);
+
 	mutex_lock(&vm->mutex);
 
 	/* Skip rewriting PTE on VMA unbind. */
 	open = atomic_xchg(&vm->open, 0);
 
 	list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
+		struct drm_i915_gem_object *obj = vma->obj;
+
 		GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
-		i915_vma_wait_for_bind(vma);
 
-		if (i915_vma_is_pinned(vma))
+		if (i915_vma_is_pinned(vma) || !i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
 			continue;
 
-		if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND)) {
-			__i915_vma_evict(vma);
-			drm_mm_remove_node(&vma->node);
+		/* unlikely to race when GPU is idle, so no worry about slowpath.. */
+		if (WARN_ON(!i915_gem_object_trylock(obj, NULL))) {
+			/*
+			 * No dead objects should appear here, GPU should be
+			 * completely idle, and userspace suspended
+			 */
+			i915_gem_object_get(obj);
+
+			atomic_set(&vm->open, open);
+			mutex_unlock(&vm->mutex);
+
+			i915_gem_object_lock(obj, NULL);
+			open = i915_vma_unbind(vma);
+			i915_gem_object_unlock(obj);
+
+			GEM_WARN_ON(open);
+
+			i915_gem_object_put(obj);
+			goto retry;
 		}
+
+		i915_vma_wait_for_bind(vma);
+
+		__i915_vma_evict(vma);
+		drm_mm_remove_node(&vma->node);
+
+		i915_gem_object_unlock(obj);
 	}
 
 	vm->clear_range(vm, 0, vm->total);
@@ -742,11 +769,21 @@ static void ggtt_cleanup_hw(struct i915_ggtt *ggtt)
 	atomic_set(&ggtt->vm.open, 0);
 
 	flush_workqueue(ggtt->vm.i915->wq);
+	i915_gem_drain_freed_objects(ggtt->vm.i915);
 
 	mutex_lock(&ggtt->vm.mutex);
 
-	list_for_each_entry_safe(vma, vn, &ggtt->vm.bound_list, vm_link)
+	list_for_each_entry_safe(vma, vn, &ggtt->vm.bound_list, vm_link) {
+		struct drm_i915_gem_object *obj = vma->obj;
+		bool trylock;
+
+		trylock = i915_gem_object_trylock(obj, NULL);
+		WARN_ON(!trylock);
+
 		WARN_ON(__i915_vma_unbind(vma));
+		if (trylock)
+			i915_gem_object_unlock(obj);
+	}
 
 	if (drm_mm_node_allocated(&ggtt->error_capture))
 		drm_mm_remove_node(&ggtt->error_capture);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 6002045bd194..c31ef87397f1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -118,6 +118,8 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 	struct i915_vma *vma;
 	int ret;
 
+	assert_object_held(obj);
+
 	if (list_empty(&obj->vma.list))
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 83df1290df5e..565819c8bf49 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1604,8 +1604,16 @@ void i915_vma_parked(struct intel_gt *gt)
 		struct drm_i915_gem_object *obj = vma->obj;
 		struct i915_address_space *vm = vma->vm;
 
-		INIT_LIST_HEAD(&vma->closed_link);
-		__i915_vma_put(vma);
+		if (i915_gem_object_trylock(obj, NULL)) {
+			INIT_LIST_HEAD(&vma->closed_link);
+			__i915_vma_put(vma);
+			i915_gem_object_unlock(obj);
+		} else {
+			/* back you go.. */
+			spin_lock_irq(&gt->closed_lock);
+			list_add(&vma->closed_link, &gt->closed_vma);
+			spin_unlock_irq(&gt->closed_lock);
+		}
 
 		i915_gem_object_put(obj);
 		i915_vm_close(vm);
@@ -1721,6 +1729,7 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 void __i915_vma_evict(struct i915_vma *vma)
 {
 	GEM_BUG_ON(i915_vma_is_pinned(vma));
+	assert_object_held_shared(vma->obj);
 
 	if (i915_vma_is_map_and_fenceable(vma)) {
 		/* Force a pagefault for domain tracking on next user access */
@@ -1766,6 +1775,7 @@ int __i915_vma_unbind(struct i915_vma *vma)
 	int ret;
 
 	lockdep_assert_held(&vma->vm->mutex);
+	assert_object_held_shared(vma->obj);
 
 	if (!drm_mm_node_allocated(&vma->node))
 		return 0;
@@ -1797,6 +1807,8 @@ int i915_vma_unbind(struct i915_vma *vma)
 	intel_wakeref_t wakeref = 0;
 	int err;
 
+	assert_object_held_shared(vma->obj);
+
 	/* Optimistic wait before taking the mutex */
 	err = i915_vma_sync(vma);
 	if (err)
@@ -1827,6 +1839,17 @@ int i915_vma_unbind(struct i915_vma *vma)
 	return err;
 }
 
+int i915_vma_unbind_unlocked(struct i915_vma *vma)
+{
+	int err;
+
+	i915_gem_object_lock(vma->obj, NULL);
+	err = i915_vma_unbind(vma);
+	i915_gem_object_unlock(vma->obj);
+
+	return err;
+}
+
 struct i915_vma *i915_vma_make_unshrinkable(struct i915_vma *vma)
 {
 	i915_gem_object_make_unshrinkable(vma->obj);
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 32719431b3df..da69ecb1b860 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -214,6 +214,7 @@ void i915_vma_revoke_mmap(struct i915_vma *vma);
 void __i915_vma_evict(struct i915_vma *vma);
 int __i915_vma_unbind(struct i915_vma *vma);
 int __must_check i915_vma_unbind(struct i915_vma *vma);
+int __must_check i915_vma_unbind_unlocked(struct i915_vma *vma);
 void i915_vma_unlink_ctx(struct i915_vma *vma);
 void i915_vma_close(struct i915_vma *vma);
 void i915_vma_reopen(struct i915_vma *vma);
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 169e2330b386..cafe7936fb6f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -385,7 +385,7 @@ static void close_object_list(struct list_head *objects,
 
 		vma = i915_vma_instance(obj, vm, NULL);
 		if (!IS_ERR(vma))
-			ignored = i915_vma_unbind(vma);
+			ignored = i915_vma_unbind_unlocked(vma);
 
 		list_del(&obj->st_link);
 		i915_gem_object_put(obj);
@@ -496,7 +496,7 @@ static int fill_hole(struct i915_address_space *vm,
 						goto err;
 					}
 
-					err = i915_vma_unbind(vma);
+					err = i915_vma_unbind_unlocked(vma);
 					if (err) {
 						pr_err("%s(%s) (forward) unbind of vma.node=%llx + %llx failed with err=%d\n",
 						       __func__, p->name, vma->node.start, vma->node.size,
@@ -569,7 +569,7 @@ static int fill_hole(struct i915_address_space *vm,
 						goto err;
 					}
 
-					err = i915_vma_unbind(vma);
+					err = i915_vma_unbind_unlocked(vma);
 					if (err) {
 						pr_err("%s(%s) (backward) unbind of vma.node=%llx + %llx failed with err=%d\n",
 						       __func__, p->name, vma->node.start, vma->node.size,
@@ -655,7 +655,7 @@ static int walk_hole(struct i915_address_space *vm,
 				goto err_put;
 			}
 
-			err = i915_vma_unbind(vma);
+			err = i915_vma_unbind_unlocked(vma);
 			if (err) {
 				pr_err("%s unbind failed at %llx + %llx  with err=%d\n",
 				       __func__, addr, vma->size, err);
@@ -732,13 +732,13 @@ static int pot_hole(struct i915_address_space *vm,
 				pr_err("%s incorrect at %llx + %llx\n",
 				       __func__, addr, vma->size);
 				i915_vma_unpin(vma);
-				err = i915_vma_unbind(vma);
+				err = i915_vma_unbind_unlocked(vma);
 				err = -EINVAL;
 				goto err_obj;
 			}
 
 			i915_vma_unpin(vma);
-			err = i915_vma_unbind(vma);
+			err = i915_vma_unbind_unlocked(vma);
 			GEM_BUG_ON(err);
 		}
 
@@ -832,13 +832,13 @@ static int drunk_hole(struct i915_address_space *vm,
 				pr_err("%s incorrect at %llx + %llx\n",
 				       __func__, addr, BIT_ULL(size));
 				i915_vma_unpin(vma);
-				err = i915_vma_unbind(vma);
+				err = i915_vma_unbind_unlocked(vma);
 				err = -EINVAL;
 				goto err_obj;
 			}
 
 			i915_vma_unpin(vma);
-			err = i915_vma_unbind(vma);
+			err = i915_vma_unbind_unlocked(vma);
 			GEM_BUG_ON(err);
 
 			if (igt_timeout(end_time,
@@ -906,7 +906,7 @@ static int __shrink_hole(struct i915_address_space *vm,
 			pr_err("%s incorrect at %llx + %llx\n",
 			       __func__, addr, size);
 			i915_vma_unpin(vma);
-			err = i915_vma_unbind(vma);
+			err = i915_vma_unbind_unlocked(vma);
 			err = -EINVAL;
 			break;
 		}
@@ -1465,7 +1465,7 @@ static int igt_gtt_reserve(void *arg)
 			goto out;
 		}
 
-		err = i915_vma_unbind(vma);
+		err = i915_vma_unbind_unlocked(vma);
 		if (err) {
 			pr_err("i915_vma_unbind failed with err=%d!\n", err);
 			goto out;
@@ -1647,7 +1647,7 @@ static int igt_gtt_insert(void *arg)
 		GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
 		offset = vma->node.start;
 
-		err = i915_vma_unbind(vma);
+		err = i915_vma_unbind_unlocked(vma);
 		if (err) {
 			pr_err("i915_vma_unbind failed with err=%d!\n", err);
 			goto out;
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 5c5809dfe9b2..2c73f7448df7 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -340,7 +340,7 @@ static int igt_vma_pin1(void *arg)
 
 		if (!err) {
 			i915_vma_unpin(vma);
-			err = i915_vma_unbind(vma);
+			err = i915_vma_unbind_unlocked(vma);
 			if (err) {
 				pr_err("Failed to unbind single page from GGTT, err=%d\n", err);
 				goto out;
@@ -691,7 +691,7 @@ static int igt_vma_rotate_remap(void *arg)
 					}
 
 					i915_vma_unpin(vma);
-					err = i915_vma_unbind(vma);
+					err = i915_vma_unbind_unlocked(vma);
 					if (err) {
 						pr_err("Unbinding returned %i\n", err);
 						goto out_object;
@@ -852,7 +852,7 @@ static int igt_vma_partial(void *arg)
 
 				i915_vma_unpin(vma);
 				nvma++;
-				err = i915_vma_unbind(vma);
+				err = i915_vma_unbind_unlocked(vma);
 				if (err) {
 					pr_err("Unbinding returned %i\n", err);
 					goto out_object;
@@ -891,7 +891,7 @@ static int igt_vma_partial(void *arg)
 
 		i915_vma_unpin(vma);
 
-		err = i915_vma_unbind(vma);
+		err = i915_vma_unbind_unlocked(vma);
 		if (err) {
 			pr_err("Unbinding returned %i\n", err);
 			goto out_object;
-- 
2.34.1

