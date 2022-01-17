Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71649033E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B707A10F177;
	Mon, 17 Jan 2022 07:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1F10F179;
 Mon, 17 Jan 2022 07:56:14 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add locking to i915_gem_evict_vm(), v3.
Date: Mon, 17 Jan 2022 08:56:04 +0100
Message-Id: <20220117075604.131477-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bb70ccb8-043c-bd99-e01e-c2f2a0c48d54@shipmail.org>
References: <bb70ccb8-043c-bd99-e01e-c2f2a0c48d54@shipmail.org>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_gem_evict_vm will need to be able to evict objects that are
locked by the current ctx. By testing if the current context already
locked the object, we can do this correctly. This allows us to
evict the entire vm even if we already hold some objects' locks.

Previously, this was spread over several commits, but it makes
more sense to commit the changes to i915_gem_evict_vm separately
from the changes to i915_gem_evict_something() and
i915_gem_evict_for_node().

Changes since v1:
- Handle evicting dead objects better.
Changes since v2:
- Use for_i915_gem_ww in igt_evict_vm. (Thomas)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         | 32 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_gem_evict.h         |  4 ++-
 drivers/gpu/drm/i915/i915_vma.c               |  7 +++-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   | 12 ++++---
 6 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index cf283b5f6ffe..4d832d6696b5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -767,7 +767,7 @@ static int eb_reserve(struct i915_execbuffer *eb)
 		case 1:
 			/* Too fragmented, unbind everything and retry */
 			mutex_lock(&eb->context->vm->mutex);
-			err = i915_gem_evict_vm(eb->context->vm);
+			err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
 			mutex_unlock(&eb->context->vm->mutex);
 			if (err)
 				return err;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index fafd158e5313..a69787999d09 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -367,7 +367,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		if (vma == ERR_PTR(-ENOSPC)) {
 			ret = mutex_lock_interruptible(&ggtt->vm.mutex);
 			if (!ret) {
-				ret = i915_gem_evict_vm(&ggtt->vm);
+				ret = i915_gem_evict_vm(&ggtt->vm, &ww);
 				mutex_unlock(&ggtt->vm.mutex);
 			}
 			if (ret)
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 24eee0c2055f..91f82ecb9ef4 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -368,7 +368,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
  * To clarify: This is for freeing up virtual address space, not for freeing
  * memory in e.g. the shrinker.
  */
-int i915_gem_evict_vm(struct i915_address_space *vm)
+int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 {
 	int ret = 0;
 
@@ -389,24 +389,52 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
 	do {
 		struct i915_vma *vma, *vn;
 		LIST_HEAD(eviction_list);
+		LIST_HEAD(locked_eviction_list);
 
 		list_for_each_entry(vma, &vm->bound_list, vm_link) {
 			if (i915_vma_is_pinned(vma))
 				continue;
 
+			/*
+			 * If we already own the lock, trylock fails. In case
+			 * the resv is shared among multiple objects, we still
+			 * need the object ref.
+			 */
+			if (!kref_read(&vma->obj->base.refcount) ||
+			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx))) {
+				__i915_vma_pin(vma);
+				list_add(&vma->evict_link, &locked_eviction_list);
+				continue;
+			}
+
+			if (!i915_gem_object_trylock(vma->obj, ww))
+				continue;
+
 			__i915_vma_pin(vma);
 			list_add(&vma->evict_link, &eviction_list);
 		}
-		if (list_empty(&eviction_list))
+		if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
 			break;
 
 		ret = 0;
+		/* Unbind locked objects first, before unlocking the eviction_list */
+		list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
+			__i915_vma_unpin(vma);
+
+			if (ret == 0)
+				ret = __i915_vma_unbind(vma);
+			if (ret != -EINTR) /* "Get me out of here!" */
+				ret = 0;
+		}
+
 		list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
 			__i915_vma_unpin(vma);
 			if (ret == 0)
 				ret = __i915_vma_unbind(vma);
 			if (ret != -EINTR) /* "Get me out of here!" */
 				ret = 0;
+
+			i915_gem_object_unlock(vma->obj);
 		}
 	} while (ret == 0);
 
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i915_gem_evict.h
index d4478b6ad11b..f5b7a9100609 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.h
+++ b/drivers/gpu/drm/i915/i915_gem_evict.h
@@ -10,6 +10,7 @@
 
 struct drm_mm_node;
 struct i915_address_space;
+struct i915_gem_ww_ctx;
 
 int __must_check i915_gem_evict_something(struct i915_address_space *vm,
 					  u64 min_size, u64 alignment,
@@ -19,6 +20,7 @@ int __must_check i915_gem_evict_something(struct i915_address_space *vm,
 int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
 					 struct drm_mm_node *node,
 					 unsigned int flags);
-int i915_gem_evict_vm(struct i915_address_space *vm);
+int i915_gem_evict_vm(struct i915_address_space *vm,
+		      struct i915_gem_ww_ctx *ww);
 
 #endif /* __I915_GEM_EVICT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 1f15c3298112..8477cae5f877 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1535,7 +1535,12 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		/* Unlike i915_vma_pin, we don't take no for an answer! */
 		flush_idle_contexts(vm->gt);
 		if (mutex_lock_interruptible(&vm->mutex) == 0) {
-			i915_gem_evict_vm(vm);
+			/*
+			 * We pass NULL ww here, as we don't want to unbind
+			 * locked objects when called from execbuf when pinning
+			 * is removed. This would probably regress badly.
+			 */
+			i915_gem_evict_vm(vm, NULL);
 			mutex_unlock(&vm->mutex);
 		}
 	} while (1);
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 75b709c26dd3..19a348546b73 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -331,6 +331,7 @@ static int igt_evict_vm(void *arg)
 {
 	struct intel_gt *gt = arg;
 	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_gem_ww_ctx ww;
 	LIST_HEAD(objects);
 	int err;
 
@@ -342,7 +343,7 @@ static int igt_evict_vm(void *arg)
 
 	/* Everything is pinned, nothing should happen */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_vm(&ggtt->vm);
+	err = i915_gem_evict_vm(&ggtt->vm, NULL);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err) {
 		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
@@ -352,9 +353,12 @@ static int igt_evict_vm(void *arg)
 
 	unpin_ggtt(ggtt);
 
-	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_vm(&ggtt->vm);
-	mutex_unlock(&ggtt->vm.mutex);
+	for_i915_gem_ww(&ww, err, false) {
+		mutex_lock(&ggtt->vm.mutex);
+		err = i915_gem_evict_vm(&ggtt->vm, &ww);
+		mutex_unlock(&ggtt->vm.mutex);
+	}
+
 	if (err) {
 		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
 		       err);
-- 
2.34.1

