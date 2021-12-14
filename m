Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EF474C1F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521E110E17A;
	Tue, 14 Dec 2021 19:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B8510E178;
 Tue, 14 Dec 2021 19:35:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226349194"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="226349194"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:35:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="614421397"
Received: from njayagop-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.16])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:35:50 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 15/16] drm/i915: Use to_gt() helper for GGTT accesses
Date: Tue, 14 Dec 2021 21:33:45 +0200
Message-Id: <20211214193346.21231-16-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214193346.21231-1-andi.shyti@linux.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

GGTT is currently available both through i915->ggtt and gt->ggtt, and we
eventually want to get rid of the i915->ggtt one.
Use to_gt() for all i915->ggtt accesses to help with the future
refactoring.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c    |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c  |  4 ++--
 drivers/gpu/drm/i915/i915_driver.c   |  8 ++++----
 drivers/gpu/drm/i915/i915_drv.h      |  2 +-
 drivers/gpu/drm/i915/i915_gem.c      | 23 ++++++++++++-----------
 drivers/gpu/drm/i915/i915_gem_gtt.c  |  6 +++---
 drivers/gpu/drm/i915/i915_getparam.c |  2 +-
 drivers/gpu/drm/i915/i915_perf.c     |  4 ++--
 8 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 8e65cd8258b9..94c3eb1586b0 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -84,7 +84,7 @@ static int vgpu_gem_get_pages(
 		kfree(st);
 		return ret;
 	}
-	gtt_entries = (gen8_pte_t __iomem *)dev_priv->ggtt.gsm +
+	gtt_entries = (gen8_pte_t __iomem *)to_gt(dev_priv)->ggtt->gsm +
 		(fb_info->start >> PAGE_SHIFT);
 	for_each_sg(st->sgl, sg, page_num, i) {
 		dma_addr_t dma_addr =
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 93c3d154885b..0913daff62d7 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -390,9 +390,9 @@ static int i915_swizzle_info(struct seq_file *m, void *data)
 	intel_wakeref_t wakeref;
 
 	seq_printf(m, "bit6 swizzle for X-tiling = %s\n",
-		   swizzle_string(dev_priv->ggtt.bit_6_swizzle_x));
+		   swizzle_string(to_gt(dev_priv)->ggtt->bit_6_swizzle_x));
 	seq_printf(m, "bit6 swizzle for Y-tiling = %s\n",
-		   swizzle_string(dev_priv->ggtt.bit_6_swizzle_y));
+		   swizzle_string(to_gt(dev_priv)->ggtt->bit_6_swizzle_y));
 
 	if (dev_priv->quirks & QUIRK_PIN_SWIZZLED_PAGES)
 		seq_puts(m, "L-shaped memory detected\n");
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 95174938b160..3c984553d86f 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -571,6 +571,8 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	i915_perf_init(dev_priv);
 
+	intel_gt_init_hw_early(to_gt(dev_priv), &dev_priv->ggtt);
+
 	ret = i915_ggtt_probe_hw(dev_priv);
 	if (ret)
 		goto err_perf;
@@ -587,8 +589,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_ggtt;
 
-	intel_gt_init_hw_early(to_gt(dev_priv), &dev_priv->ggtt);
-
 	ret = intel_gt_probe_lmem(to_gt(dev_priv));
 	if (ret)
 		goto err_mem_regions;
@@ -1146,7 +1146,7 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	/* Must be called before GGTT is suspended. */
 	intel_dpt_suspend(dev_priv);
-	i915_ggtt_suspend(&dev_priv->ggtt);
+	i915_ggtt_suspend(to_gt(dev_priv)->ggtt);
 
 	i915_save_display(dev_priv);
 
@@ -1270,7 +1270,7 @@ static int i915_drm_resume(struct drm_device *dev)
 	if (ret)
 		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
 
-	i915_ggtt_resume(&dev_priv->ggtt);
+	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
 	/* Must be called after GGTT is resumed. */
 	intel_dpt_resume(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 28c1524e2e3b..65724e4df3bd 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1762,7 +1762,7 @@ static inline bool i915_gem_object_needs_bit17_swizzle(struct drm_i915_gem_objec
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	return i915->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
+	return to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
 		i915_gem_object_is_tiled(obj);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 8ba2119092f2..45e3b4c540a1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -88,7 +88,8 @@ int
 i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file)
 {
-	struct i915_ggtt *ggtt = &to_i915(dev)->ggtt;
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct drm_i915_gem_get_aperture *args = data;
 	struct i915_vma *vma;
 	u64 pinned;
@@ -289,7 +290,7 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
 					     bool write)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	struct i915_gem_ww_ctx ww;
 	int ret;
@@ -350,7 +351,7 @@ static void i915_gem_gtt_cleanup(struct drm_i915_gem_object *obj,
 				 struct i915_vma *vma)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	i915_gem_object_unpin_pages(obj);
 	if (drm_mm_node_allocated(node)) {
@@ -366,7 +367,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 		   const struct drm_i915_gem_pread *args)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node node;
 	void __user *user_data;
@@ -522,7 +523,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 			 const struct drm_i915_gem_pwrite *args)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node node;
@@ -823,7 +824,7 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	 */
 
 	list_for_each_entry_safe(obj, on,
-				 &i915->ggtt.userfault_list, userfault_link)
+				 &to_gt(i915)->ggtt->userfault_list, userfault_link)
 		__i915_gem_object_release_mmap_gtt(obj);
 
 	/*
@@ -831,8 +832,8 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	 * in use by hardware (i.e. they are pinned), we should not be powering
 	 * down! All other fences will be reacquired by the user upon waking.
 	 */
-	for (i = 0; i < i915->ggtt.num_fences; i++) {
-		struct i915_fence_reg *reg = &i915->ggtt.fence_regs[i];
+	for (i = 0; i < to_gt(i915)->ggtt->num_fences; i++) {
+		struct i915_fence_reg *reg = &to_gt(i915)->ggtt->fence_regs[i];
 
 		/*
 		 * Ideally we want to assert that the fence register is not
@@ -873,7 +874,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    u64 size, u64 alignment, u64 flags)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	int ret;
 
@@ -1101,7 +1102,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 
 		/* Minimal basic recovery for KMS */
 		ret = i915_ggtt_enable_hw(dev_priv);
-		i915_ggtt_resume(&dev_priv->ggtt);
+		i915_ggtt_resume(to_gt(dev_priv)->ggtt);
 		intel_init_clock_gating(dev_priv);
 	}
 
@@ -1124,7 +1125,7 @@ void i915_gem_driver_unregister(struct drm_i915_private *i915)
 
 void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 {
-	intel_wakeref_auto_fini(&dev_priv->ggtt.userfault_wakeref);
+	intel_wakeref_auto_fini(&to_gt(dev_priv)->ggtt->userfault_wakeref);
 
 	i915_gem_suspend_late(dev_priv);
 	intel_gt_driver_remove(to_gt(dev_priv));
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index cd5f2348a187..2f2ba7a2955d 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -56,7 +56,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	/* XXX This does not prevent more requests being submitted! */
 	if (unlikely(ggtt->do_idle_maps))
@@ -103,7 +103,7 @@ int i915_gem_gtt_reserve(struct i915_address_space *vm,
 	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE));
 	GEM_BUG_ON(!IS_ALIGNED(offset, I915_GTT_MIN_ALIGNMENT));
 	GEM_BUG_ON(range_overflows(offset, size, vm->total));
-	GEM_BUG_ON(vm == &vm->i915->ggtt.alias->vm);
+	GEM_BUG_ON(vm == &to_gt(vm->i915)->ggtt->alias->vm);
 	GEM_BUG_ON(drm_mm_node_allocated(node));
 
 	node->size = size;
@@ -201,7 +201,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 	GEM_BUG_ON(start >= end);
 	GEM_BUG_ON(start > 0  && !IS_ALIGNED(start, I915_GTT_PAGE_SIZE));
 	GEM_BUG_ON(end < U64_MAX && !IS_ALIGNED(end, I915_GTT_PAGE_SIZE));
-	GEM_BUG_ON(vm == &vm->i915->ggtt.alias->vm);
+	GEM_BUG_ON(vm == &to_gt(vm->i915)->ggtt->alias->vm);
 	GEM_BUG_ON(drm_mm_node_allocated(node));
 
 	if (unlikely(range_overflows(start, size, end)))
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 7f80ad247bc8..5b8a2157d797 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -31,7 +31,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = pdev->revision;
 		break;
 	case I915_PARAM_NUM_FENCES_AVAIL:
-		value = i915->ggtt.num_fences;
+		value = to_gt(i915)->ggtt->num_fences;
 		break;
 	case I915_PARAM_HAS_OVERLAY:
 		value = !!i915->overlay;
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 170bba913c30..128315aec517 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1630,7 +1630,7 @@ static int alloc_noa_wait(struct i915_perf_stream *stream)
 	struct drm_i915_gem_object *bo;
 	struct i915_vma *vma;
 	const u64 delay_ticks = 0xffffffffffffffff -
-		intel_gt_ns_to_clock_interval(stream->perf->i915->ggtt.vm.gt,
+		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt->vm.gt,
 					      atomic64_read(&stream->perf->noa_programming_delay));
 	const u32 base = stream->engine->mmio_base;
 #define CS_GPR(x) GEN8_RING_CS_GPR(base, x)
@@ -3542,7 +3542,7 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 
 static u64 oa_exponent_to_ns(struct i915_perf *perf, int exponent)
 {
-	return intel_gt_clock_interval_to_ns(perf->i915->ggtt.vm.gt,
+	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt->vm.gt,
 					     2ULL << exponent);
 }
 
-- 
2.34.1

