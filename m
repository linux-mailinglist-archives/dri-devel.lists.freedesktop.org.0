Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB18489806
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAAD14A5A9;
	Mon, 10 Jan 2022 11:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2612412BD2C;
 Mon, 10 Jan 2022 11:51:38 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/7] drm/i915: Add locking to i915_gem_evict_vm()
Date: Mon, 10 Jan 2022 12:51:28 +0100
Message-Id: <20220110115133.1500718-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220110115133.1500718-1-maarten.lankhorst@linux.intel.com>
References: <20220110115133.1500718-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  3 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         | 30 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_vma.c               |  7 ++++-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   | 10 +++++--
 6 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 5ecc85b96a3d..da35a143af36 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -766,7 +766,7 @@ static int eb_reserve(struct i915_execbuffer *eb)
 		case 1:
 			/* Too fragmented, unbind everything and retry */
 			mutex_lock(&eb->context->vm->mutex);
-			err = i915_gem_evict_vm(eb->context->vm);
+			err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
 			mutex_unlock(&eb->context->vm->mutex);
 			if (err)
 				return err;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 4337f3c1400c..4afad1604a6a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -366,7 +366,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		if (vma == ERR_PTR(-ENOSPC)) {
 			ret = mutex_lock_interruptible(&ggtt->vm.mutex);
 			if (!ret) {
-				ret = i915_gem_evict_vm(&ggtt->vm);
+				ret = i915_gem_evict_vm(&ggtt->vm, &ww);
 				mutex_unlock(&ggtt->vm.mutex);
 			}
 			if (ret)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 2f9336302e6c..ef121ddef418 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1729,7 +1729,8 @@ int __must_check i915_gem_evict_something(struct i915_address_space *vm,
 int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
 					 struct drm_mm_node *node,
 					 unsigned int flags);
-int i915_gem_evict_vm(struct i915_address_space *vm);
+int i915_gem_evict_vm(struct i915_address_space *vm,
+		      struct i915_gem_ww_ctx *ww);
 
 /* i915_gem_internal.c */
 struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 2b73ddb11c66..bfd66f539fc1 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -367,7 +367,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
  * To clarify: This is for freeing up virtual address space, not for freeing
  * memory in e.g. the shrinker.
  */
-int i915_gem_evict_vm(struct i915_address_space *vm)
+int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 {
 	int ret = 0;
 
@@ -388,24 +388,50 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
 	do {
 		struct i915_vma *vma, *vn;
 		LIST_HEAD(eviction_list);
+		LIST_HEAD(locked_eviction_list);
 
 		list_for_each_entry(vma, &vm->bound_list, vm_link) {
 			if (i915_vma_is_pinned(vma))
 				continue;
 
+			/*
+			 * If we already own the lock, trylock fails. In case the resv
+			 * is shared among multiple objects, we still need the object ref.
+			 */
+			if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
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
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index be208a8f1ed0..32620f93beab 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1463,7 +1463,12 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
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
index 75b709c26dd3..7c075c16a573 100644
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
@@ -352,9 +353,14 @@ static int igt_evict_vm(void *arg)
 
 	unpin_ggtt(ggtt);
 
+	i915_gem_ww_ctx_init(&ww, false);
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_vm(&ggtt->vm);
+	err = i915_gem_evict_vm(&ggtt->vm, &ww);
 	mutex_unlock(&ggtt->vm.mutex);
+
+	/* no -EDEADLK handling; can't happen with vm.mutex in place */
+	i915_gem_ww_ctx_fini(&ww);
+
 	if (err) {
 		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
 		       err);
-- 
2.34.1

