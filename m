Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39522C6569
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E486ED16;
	Fri, 27 Nov 2020 12:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F746ED16;
 Fri, 27 Nov 2020 12:11:54 +0000 (UTC)
IronPort-SDR: LvXJ1ebxDnqdTd+aWocmO9RwkT8mBUSUrlAxwnG9UMCMpWyFowe/v5WMhTvK1B/syn9z7YLmSC
 H7uz1zGYH+rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092964"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:54 -0800
IronPort-SDR: QscCP7qxL+8SMY4vL54TYTZ9tvZfMgsHcRmiTC0hf+x9by5rx9CC+4A53IObv69sP+ov0d/JTU
 PkExWzdysNWg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029913"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 137/162] drm/i915: blt copy between objs using pre-created
 vma windows
Date: Fri, 27 Nov 2020 12:06:53 +0000
Message-Id: <20201127120718.454037-138-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

To avoid the locking issues in vma handling during the blt copy of
objects, dummy vmas with sg_tables of size BLT_WINDOW_SZ (with
WINDOW_SIZE / PAGE_SIZE number of scatterlists) are created
in driver load for source and destination objects.

Two sets of these vmas are created, where one set is for lmem and
another set is for smem to enable the blt copy of the contents of
objects belongs to same mem regions or different mem regions

When blitter copy is required between objects, pages of size
<=WINDOW_SIZE are assigned to the dummy_vma->pages for both source and
destination objects into corrresponding windows.

Then PTE are created at runtime for the pages attached and batch
commands are filled into the BCS ring for the pages filled in the
window and request is submitted for the BCS0.

Until all pages of the source object are copied into destination
object pages above process will be executed in a loop.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 355 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |   5 +
 drivers/gpu/drm/i915/i915_drv.c            |  11 +
 drivers/gpu/drm/i915/i915_drv.h            |   6 +
 4 files changed, 377 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 46d0f8731db0..3943a184fbe3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -22,11 +22,13 @@
  *
  */
 
+#include <drm/drm_print.h>
 #include <linux/sched/mm.h>
 
 #include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
+#include "gt/intel_ring.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
@@ -718,6 +720,359 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 	.export = i915_gem_prime_export,
 };
 
+#define BLT_WINDOW_SZ SZ_4M
+static int i915_alloc_vm_range(struct i915_vma *vma)
+{
+	struct i915_vm_pt_stash stash = {};
+	int err;
+	struct i915_gem_ww_ctx ww;
+
+	err = i915_vm_alloc_pt_stash(vma->vm, &stash, vma->size);
+	if (err)
+		return err;
+
+	for_i915_gem_ww(&ww, err, false) {
+		err = i915_vm_lock_objects(vma->vm, &ww);
+		if (err)
+			continue;
+
+		dma_resv_assert_held(&vma->vm->resv);
+
+		err = i915_vm_map_pt_stash(vma->vm, &stash);
+		if (err)
+			continue;
+
+		vma->vm->allocate_va_range(vma->vm, &stash,
+					   vma->node.start, vma->size);
+
+		set_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma));
+		/* Implicit unlock */
+	}
+
+	i915_vm_free_pt_stash(vma->vm, &stash);
+
+	return err;
+}
+
+static inline void i915_insert_vma_pages(struct i915_vma *vma, bool is_lmem)
+{
+	enum i915_cache_level cache_level = I915_CACHE_NONE;
+
+	vma->vm->insert_entries(vma->vm, vma, cache_level,
+				is_lmem ? PTE_LM : 0);
+	wmb();
+}
+
+static struct i915_vma *
+i915_window_vma_init(struct drm_i915_private *i915,
+		     struct intel_memory_region *mem)
+{
+	struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
+	struct i915_address_space *vm = ce->vm;
+	struct i915_vma *vma;
+	int ret;
+
+	vma = i915_alloc_window_vma(i915, vm, BLT_WINDOW_SZ,
+				    mem->min_page_size);
+	if (IS_ERR(vma)) {
+		DRM_ERROR("window vma alloc failed(%ld)\n", PTR_ERR(vma));
+		return vma;
+	}
+
+	vma->pages = kmalloc(sizeof(*vma->pages), GFP_KERNEL);
+	if (!vma->pages) {
+		ret = -ENOMEM;
+		DRM_ERROR("page alloc failed. %d", ret);
+		goto err_page;
+	}
+
+	ret = sg_alloc_table(vma->pages, BLT_WINDOW_SZ / PAGE_SIZE,
+			     GFP_KERNEL);
+	if (ret) {
+		DRM_ERROR("sg alloc table failed(%d)", ret);
+		goto err_sg_table;
+	}
+
+	mutex_lock(&vm->mutex);
+	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
+					  BLT_WINDOW_SZ, BLT_WINDOW_SZ,
+					  I915_COLOR_UNEVICTABLE,
+					  0, vm->total,
+					  DRM_MM_INSERT_LOW);
+	mutex_unlock(&vm->mutex);
+	if (ret) {
+		DRM_ERROR("drm_mm_insert_node_in_range failed. %d\n", ret);
+		goto err_mm_node;
+	}
+
+	ret = i915_alloc_vm_range(vma);
+	if (ret) {
+		DRM_ERROR("src: Page table alloc failed(%d)\n", ret);
+		goto err_alloc;
+	}
+
+	return vma;
+
+err_alloc:
+	mutex_lock(&vm->mutex);
+	drm_mm_remove_node(&vma->node);
+	mutex_unlock(&vm->mutex);
+err_mm_node:
+	sg_free_table(vma->pages);
+err_sg_table:
+	kfree(vma->pages);
+err_page:
+	i915_destroy_window_vma(vma);
+
+	return ERR_PTR(ret);
+}
+
+static void i915_window_vma_teardown(struct i915_vma *vma)
+{
+	vma->vm->clear_range(vma->vm, vma->node.start, vma->size);
+	drm_mm_remove_node(&vma->node);
+	sg_free_table(vma->pages);
+	kfree(vma->pages);
+	i915_destroy_window_vma(vma);
+}
+
+int i915_setup_blt_windows(struct drm_i915_private *i915)
+{
+	struct intel_memory_region *lmem_region =
+		intel_memory_region_by_type(i915, INTEL_MEMORY_LOCAL);
+	struct intel_memory_region *smem_region =
+		intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
+	struct i915_vma *lmem[2];
+	struct i915_vma *smem[2];
+	int ret, i;
+
+	if (intel_gt_is_wedged(&i915->gt)) {
+		drm_dbg(&i915->drm, "GT0 is wedged; BCS0 not available\n");
+		return -EIO;
+	}
+
+	if (!i915->gt.engine[BCS0]) {
+		DRM_DEBUG("No BCS0 engine, hence blt evict is not setup\n");
+		return 0;
+	}
+
+	mutex_init(&i915->mm.window_mutex);
+	for (i = 0; i < ARRAY_SIZE(lmem); i++) {
+		lmem[i] = i915_window_vma_init(i915, lmem_region);
+		if (IS_ERR_OR_NULL(lmem[i])) {
+			ret = PTR_ERR(lmem[i]);
+			DRM_ERROR("Err for lmem[%d]. %d\n", i, ret);
+			if (i--)
+				for (; i >= 0; i--)
+					i915_window_vma_teardown(lmem[i]);
+			return ret;
+		}
+		i915->mm.lmem_window[i] = lmem[i];
+		GEM_BUG_ON(!i915->mm.lmem_window[i]);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(smem); i++) {
+		smem[i] = i915_window_vma_init(i915, smem_region);
+		if (IS_ERR_OR_NULL(smem[i])) {
+			ret = PTR_ERR(smem[i]);
+			DRM_ERROR("Err for smem[%d]. %d\n", i, ret);
+			if (i--)
+				for (; i >= 0; i--)
+					i915_window_vma_teardown(smem[i]);
+			for (i = 0; i < ARRAY_SIZE(lmem); i++)
+				i915_window_vma_teardown(lmem[i]);
+			return ret;
+		}
+		i915->mm.smem_window[i] = smem[i];
+		GEM_BUG_ON(!i915->mm.smem_window[i]);
+	}
+
+	return 0;
+}
+
+void i915_teardown_blt_windows(struct drm_i915_private *i915)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(i915->mm.lmem_window); i++) {
+		if (!i915->mm.lmem_window[i])
+			continue;
+		i915_window_vma_teardown(i915->mm.lmem_window[i]);
+	}
+	for (i = 0; i < ARRAY_SIZE(i915->mm.smem_window); i++) {
+		if (!i915->mm.smem_window[i])
+			continue;
+		i915_window_vma_teardown(i915->mm.smem_window[i]);
+	}
+	mutex_destroy(&i915->mm.window_mutex);
+}
+
+static int i915_window_blt_copy_prepare_obj(struct drm_i915_gem_object *obj)
+{
+	int ret;
+
+	ret = i915_gem_object_wait(obj,
+				   I915_WAIT_INTERRUPTIBLE,
+				   MAX_SCHEDULE_TIMEOUT);
+	if (ret)
+		return ret;
+
+	return i915_gem_object_pin_pages(obj);
+}
+
+static int
+i915_window_blt_copy_batch_prepare(struct i915_request *rq,
+				   struct i915_vma *src,
+				   struct i915_vma *dst, size_t size)
+{
+	u32 *cmd;
+
+	GEM_BUG_ON(size > BLT_WINDOW_SZ);
+	cmd = intel_ring_begin(rq, 10);
+	if (IS_ERR(cmd))
+		return PTR_ERR(cmd);
+
+	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
+	GEM_BUG_ON(INTEL_GEN(rq->engine->i915) < 9);
+
+	*cmd++ = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
+	*cmd++ = BLT_DEPTH_32 | PAGE_SIZE;
+	*cmd++ = 0;
+	*cmd++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+	*cmd++ = lower_32_bits(dst->node.start);
+	*cmd++ = upper_32_bits(dst->node.start);
+	*cmd++ = 0;
+	*cmd++ = PAGE_SIZE;
+	*cmd++ = lower_32_bits(src->node.start);
+	*cmd++ = upper_32_bits(src->node.start);
+	intel_ring_advance(rq, cmd);
+
+	return 0;
+}
+
+int i915_window_blt_copy(struct drm_i915_gem_object *dst,
+			 struct drm_i915_gem_object *src)
+{
+	struct drm_i915_private *i915 = to_i915(src->base.dev);
+	struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
+	bool src_is_lmem = i915_gem_object_is_lmem(src);
+	bool dst_is_lmem = i915_gem_object_is_lmem(dst);
+	struct scatterlist *last_sgl;
+	struct i915_vma *src_vma, *dst_vma;
+	struct i915_request *rq;
+	u64 cur_win_sz, blt_copied, offset;
+	long timeout;
+	u32 size;
+	int err;
+
+	src_vma = src_is_lmem ? i915->mm.lmem_window[0] :
+				i915->mm.smem_window[0];
+	dst_vma = dst_is_lmem ? i915->mm.lmem_window[1] :
+				i915->mm.smem_window[1];
+
+	if (!src_vma || !dst_vma)
+		return -ENODEV;
+
+	blt_copied = 0;
+
+	err = i915_window_blt_copy_prepare_obj(src);
+	if (err)
+		return err;
+
+	err = i915_window_blt_copy_prepare_obj(dst);
+	if (err) {
+		i915_gem_object_unpin_pages(src);
+		return err;
+	}
+
+	mutex_lock(&i915->mm.window_mutex);
+	src_vma->obj = src;
+	dst_vma->obj = dst;
+	do {
+		cur_win_sz = min_t(u64, BLT_WINDOW_SZ,
+				   (src->base.size - blt_copied));
+		offset = blt_copied >> PAGE_SHIFT;
+		size = ALIGN(cur_win_sz, src->mm.region->min_page_size) >>
+		       PAGE_SHIFT;
+		intel_partial_pages_for_sg_table(src, src_vma->pages, offset,
+						 size, &last_sgl);
+
+		/*
+		 * Insert pages into vm, expects the pages to the full
+		 * length of VMA. But we may have the pages of <= vma_size.
+		 * Hence altering the vma size to match the total size of
+		 * the pages attached.
+		 */
+		src_vma->size = size << PAGE_SHIFT;
+		i915_insert_vma_pages(src_vma, src_is_lmem);
+		sg_unmark_end(last_sgl);
+
+		/*
+		 * Source obj size could be smaller than the dst obj size,
+		 * due to the varying min_page_size of the mem regions the
+		 * obj belongs to. But when we insert the pages into vm,
+		 * the total size of the pages supposed to be multiples of
+		 * the min page size of that mem region.
+		 */
+		size = ALIGN(cur_win_sz, dst->mm.region->min_page_size) >>
+		       PAGE_SHIFT;
+		intel_partial_pages_for_sg_table(dst, dst_vma->pages, offset,
+						 size, &last_sgl);
+
+		dst_vma->size = size << PAGE_SHIFT;
+		i915_insert_vma_pages(dst_vma, dst_is_lmem);
+		sg_unmark_end(last_sgl);
+
+		rq = i915_request_create(ce);
+		if (IS_ERR(rq)) {
+			err = PTR_ERR(rq);
+			break;
+		}
+		if (rq->engine->emit_init_breadcrumb) {
+			err = rq->engine->emit_init_breadcrumb(rq);
+			if (unlikely(err)) {
+				DRM_ERROR("init_breadcrumb failed. %d\n", err);
+				break;
+			}
+		}
+		err = i915_window_blt_copy_batch_prepare(rq, src_vma, dst_vma,
+							 cur_win_sz);
+		if (err) {
+			DRM_ERROR("Batch preparation failed. %d\n", err);
+			i915_request_set_error_once(rq, -EIO);
+		}
+
+		i915_request_get(rq);
+		i915_request_add(rq);
+
+		timeout = i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
+		if (timeout < 0) {
+			DRM_ERROR("BLT Request is not completed. %ld\n",
+				  timeout);
+			err = timeout;
+			i915_request_put(rq);
+			break;
+		}
+
+		blt_copied += cur_win_sz;
+		err = 0;
+		i915_request_put(rq);
+		flush_work(&i915->gt.engine[BCS0]->retire_work);
+	} while (src->base.size != blt_copied);
+
+	src_vma->size = BLT_WINDOW_SZ;
+	dst_vma->size = BLT_WINDOW_SZ;
+	src_vma->obj = NULL;
+	dst_vma->obj = NULL;
+	mutex_unlock(&i915->mm.window_mutex);
+
+	dst->mm.dirty = true;
+	i915_gem_object_unpin_pages(src);
+	i915_gem_object_unpin_pages(dst);
+
+	return err;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index ee1914ed2070..52a36b4052f0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -598,4 +598,9 @@ static inline int i915_gem_object_userptr_submit_done(struct drm_i915_gem_object
 static inline void i915_gem_object_userptr_submit_fini(struct drm_i915_gem_object *obj) { GEM_BUG_ON(1); }
 #endif
 
+int i915_window_blt_copy(struct drm_i915_gem_object *dst,
+			 struct drm_i915_gem_object *src);
+int i915_setup_blt_windows(struct drm_i915_private *i915);
+void i915_teardown_blt_windows(struct drm_i915_private *i915);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f4540c048cd9..683643b211fa 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -891,6 +891,12 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_driver_register(i915);
 
+	if (HAS_LMEM(i915)) {
+		ret = i915_setup_blt_windows(i915);
+		if (ret)
+			goto out_cleanup_drv_register;
+	}
+
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 
 	i915_welcome_messages(i915);
@@ -899,6 +905,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 
+out_cleanup_drv_register:
+	i915_driver_unregister(i915);
 out_cleanup_gem:
 	i915_gem_suspend(i915);
 	i915_gem_driver_remove(i915);
@@ -931,6 +939,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 void i915_driver_remove(struct drm_i915_private *i915)
 {
+	if (HAS_LMEM(i915))
+		i915_teardown_blt_windows(i915);
+
 	disable_rpm_wakeref_asserts(&i915->runtime_pm);
 
 	i915_driver_unregister(i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 10823abab224..07da059640a1 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -595,6 +595,12 @@ struct i915_gem_mm {
 	/* shrinker accounting, also useful for userland debugging */
 	u64 shrink_memory;
 	u32 shrink_count;
+
+	struct i915_vma *lmem_window[2];
+	struct i915_vma *smem_window[2];
+
+	/* To protect above two set of vmas */
+	struct mutex window_mutex;
 };
 
 #define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
