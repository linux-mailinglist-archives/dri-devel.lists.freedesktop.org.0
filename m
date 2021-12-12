Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3218471B56
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 16:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0055110F5C5;
	Sun, 12 Dec 2021 15:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93B10F5C0;
 Sun, 12 Dec 2021 15:22:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="219292984"
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="219292984"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:22:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="504602572"
Received: from nipunpan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:22:44 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND v7 12/12] drm/i915: Move the GGTT from i915 private
 data to the GT
Date: Sun, 12 Dec 2021 17:21:17 +0200
Message-Id: <20211212152117.118428-13-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211212152117.118428-1-andi.shyti@linux.intel.com>
References: <20211212152117.118428-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GGTT was available both through i915->ggtt and gt->ggtt, and we
eventually want to get rid of the i915->ggtt one.
Move the GGTT from i915 to gt and use to_gt() for accesssing the
ggtt.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 .../drm/i915/display/intel_plane_initial.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 19 +++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  6 ++---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  8 +++---
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    | 17 +++++++-----
 .../i915/gem/selftests/i915_gem_client_blt.c  |  6 ++---
 .../i915/gem/selftests/i915_gem_coherency.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  4 +--
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 21 ++++++++-------
 .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  6 ++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 14 +++++-----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  6 ++---
 drivers/gpu/drm/i915/gt/intel_gt.c            |  9 ++-----
 drivers/gpu/drm/i915/gt/intel_gt.h            |  1 -
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 +--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  4 +--
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  8 +++---
 drivers/gpu/drm/i915/gt/intel_ring.c          |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 10 +++----
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  6 ++---
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  6 ++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  6 ++---
 drivers/gpu/drm/i915/gvt/aperture_gm.c        | 26 +++++++++----------
 drivers/gpu/drm/i915/gvt/dmabuf.c             |  2 +-
 drivers/gpu/drm/i915/gvt/gvt.h                |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  4 +--
 drivers/gpu/drm/i915/i915_driver.c            |  6 ++---
 drivers/gpu/drm/i915/i915_drv.h               |  4 +--
 drivers/gpu/drm/i915/i915_gem.c               | 23 ++++++++--------
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  6 ++---
 drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 10 +++----
 drivers/gpu/drm/i915/i915_gpu_error.h         |  4 +--
 drivers/gpu/drm/i915/i915_perf.c              |  6 ++---
 drivers/gpu/drm/i915/i915_request.c           |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |  8 +++---
 .../gpu/drm/i915/selftests/i915_gem_evict.c   | 12 ++++-----
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  8 +++---
 drivers/gpu/drm/i915/selftests/i915_request.c |  2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  4 +--
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  6 ++---
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  1 -
 62 files changed, 173 insertions(+), 176 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 98319c0322d7..484cb2a80723 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -595,7 +595,7 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-	if (to_gt(i915)->ggtt->num_fences)
+	if (to_gt(i915)->ggtt.num_fences)
 		snb_fbc_program_fence(fbc);
 
 	intel_de_write(i915, ILK_DPFC_CONTROL,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 41d279db2be6..ffecfec465c3 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -180,7 +180,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(dev_priv)->ggtt;
 	const struct i915_ggtt_view view = {
 		.type = I915_GGTT_VIEW_NORMAL,
 	};
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index e4186a0b8edb..305293e681e3 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -94,7 +94,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 		goto err_obj;
 	}
 
-	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt.vm, NULL);
 	if (IS_ERR(vma))
 		goto err_obj;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index e5b0f66ea1fe..2a15bd916934 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -174,7 +174,7 @@ i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
 
 	vm = ctx->vm;
 	if (!vm)
-		vm = &to_gt(ctx->i915)->ggtt->vm;
+		vm = &to_gt(ctx->i915)->ggtt.vm;
 	vm = i915_vm_get(vm);
 
 	return vm;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 3078611d5bfe..3fe071c965aa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1106,7 +1106,7 @@ static inline struct i915_ggtt *cache_to_ggtt(struct reloc_cache *cache)
 {
 	struct drm_i915_private *i915 =
 		container_of(cache, struct i915_execbuffer, reloc_cache)->i915;
-	return to_gt(i915)->ggtt;
+	return &to_gt(i915)->ggtt;
 }
 
 static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer *eb)
@@ -2242,7 +2242,7 @@ static int eb_parse(struct i915_execbuffer *eb)
 		trampoline = shadow;
 
 		shadow = shadow_batch_pin(eb, pool->obj,
-					  &eb->gt->ggtt->vm,
+					  &eb->gt->ggtt.vm,
 					  PIN_GLOBAL);
 		if (IS_ERR(shadow)) {
 			err = PTR_ERR(shadow);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index bd5890780810..aa181433208c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -295,7 +295,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	struct drm_device *dev = obj->base.dev;
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	bool write = area->vm_flags & VM_WRITE;
 	struct i915_gem_ww_ctx ww;
 	intel_wakeref_t wakeref;
@@ -388,16 +388,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	assert_rpm_wakelock_held(rpm);
 
 	/* Mark as being mmapped into userspace for later revocation */
-	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
+	mutex_lock(&to_gt(i915)->ggtt.vm.mutex);
 	if (!i915_vma_set_userfault(vma) && !obj->userfault_count++)
-		list_add(&obj->userfault_link, &to_gt(i915)->ggtt->userfault_list);
-	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
+		list_add(&obj->userfault_link, &to_gt(i915)->ggtt.userfault_list);
+	mutex_unlock(&to_gt(i915)->ggtt.vm.mutex);
 
 	/* Track the mmo associated with the fenced vma */
 	vma->mmo = mmo;
 
 	if (CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND)
-		intel_wakeref_auto(&to_gt(i915)->ggtt->userfault_wakeref,
+		intel_wakeref_auto(&to_gt(i915)->ggtt.userfault_wakeref,
 				   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
 
 	if (write) {
@@ -512,7 +512,7 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
 	 * wakeref.
 	 */
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
-	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
+	mutex_lock(&to_gt(i915)->ggtt.vm.mutex);
 
 	if (!obj->userfault_count)
 		goto out;
@@ -530,7 +530,7 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
 	wmb();
 
 out:
-	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
+	mutex_unlock(&to_gt(i915)->ggtt.vm.mutex);
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
 
@@ -733,13 +733,14 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
 			  u32 handle,
 			  u64 *offset)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	enum i915_mmap_type mmap_type;
 
 	if (HAS_LMEM(to_i915(dev)))
 		mmap_type = I915_MMAP_TYPE_FIXED;
 	else if (boot_cpu_has(X86_FEATURE_PAT))
 		mmap_type = I915_MMAP_TYPE_WC;
-	else if (!i915_ggtt_has_aperture(&to_i915(dev)->ggtt))
+	else if (!i915_ggtt_has_aperture(&to_gt(i915)->ggtt))
 		return -ENODEV;
 	else
 		mmap_type = I915_MMAP_TYPE_GTT;
@@ -787,7 +788,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 
 	switch (args->flags) {
 	case I915_MMAP_OFFSET_GTT:
-		if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
+		if (!i915_ggtt_has_aperture(&to_gt(i915)->ggtt))
 			return -ENODEV;
 		type = I915_MMAP_TYPE_GTT;
 		break;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 6da68b38f00f..5c1e4c7bd4b7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -23,7 +23,7 @@ void i915_gem_suspend(struct drm_i915_private *i915)
 {
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
 
-	intel_wakeref_auto(&to_gt(i915)->ggtt->userfault_wakeref, 0);
+	intel_wakeref_auto(&to_gt(i915)->ggtt.userfault_wakeref, 0);
 	flush_workqueue(i915->wq);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 793fbf3da46b..daf2539eee2c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -403,9 +403,9 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 					       I915_SHRINK_VMAPS);
 
 	/* We also want to clear any cached iomaps as they wrap vmap */
-	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
+	mutex_lock(&to_gt(i915)->ggtt.vm.mutex);
 	list_for_each_entry_safe(vma, next,
-				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
+				 &to_gt(i915)->ggtt.vm.bound_list, vm_link) {
 		unsigned long count = vma->node.size >> PAGE_SHIFT;
 
 		if (!vma->iomap || i915_vma_is_active(vma))
@@ -414,7 +414,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 		if (__i915_vma_unbind(vma) == 0)
 			freed_pages += count;
 	}
-	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
+	mutex_unlock(&to_gt(i915)->ggtt.vm.mutex);
 
 	*(unsigned long *)ptr += freed_pages;
 	return NOTIFY_DONE;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 55cc96b1f2b3..35b6b99c1724 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -71,7 +71,7 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
 static int i915_adjust_stolen(struct drm_i915_private *i915,
 			      struct resource *dsm)
 {
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
 	struct resource *r;
 
@@ -579,6 +579,7 @@ i915_pages_create_for_stolen(struct drm_device *dev,
 
 static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct sg_table *pages =
 		i915_pages_create_for_stolen(obj->base.dev,
 					     obj->stolen->start,
@@ -586,7 +587,7 @@ static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	dbg_poison(&to_i915(obj->base.dev)->ggtt,
+	dbg_poison(&to_gt(i915)->ggtt,
 		   sg_dma_address(pages->sgl),
 		   sg_dma_len(pages->sgl),
 		   POISON_INUSE);
@@ -599,9 +600,10 @@ static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
 static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
 					     struct sg_table *pages)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	/* Should only be called from i915_gem_object_release_stolen() */
 
-	dbg_poison(&to_i915(obj->base.dev)->ggtt,
+	dbg_poison(&to_gt(i915)->ggtt,
 		   sg_dma_address(pages->sgl),
 		   sg_dma_len(pages->sgl),
 		   POISON_FREE);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index 6bea0b180c89..44eedae5cb8a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -181,7 +181,8 @@ static int
 i915_gem_object_fence_prepare(struct drm_i915_gem_object *obj,
 			      int tiling_mode, unsigned int stride)
 {
-	struct i915_ggtt *ggtt = &to_i915(obj->base.dev)->ggtt;
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct i915_vma *vma, *vn;
 	LIST_HEAD(unbind);
 	int ret = 0;
@@ -336,7 +337,7 @@ i915_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_object *obj;
 	int err;
 
-	if (!to_gt(dev_priv)->ggtt->num_fences)
+	if (!to_gt(dev_priv)->ggtt.num_fences)
 		return -EOPNOTSUPP;
 
 	obj = i915_gem_object_lookup(file, args->handle);
@@ -362,9 +363,11 @@ i915_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
 		args->stride = 0;
 	} else {
 		if (args->tiling_mode == I915_TILING_X)
-			args->swizzle_mode = to_i915(dev)->ggtt.bit_6_swizzle_x;
+			args->swizzle_mode =
+					to_gt(dev_priv)->ggtt.bit_6_swizzle_x;
 		else
-			args->swizzle_mode = to_i915(dev)->ggtt.bit_6_swizzle_y;
+			args->swizzle_mode =
+					to_gt(dev_priv)->ggtt.bit_6_swizzle_y;
 
 		/* Hide bit 17 swizzling from the user.  This prevents old Mesa
 		 * from aborting the application on sw fallbacks to bit 17,
@@ -419,7 +422,7 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_object *obj;
 	int err = -ENOENT;
 
-	if (!to_gt(dev_priv)->ggtt->num_fences)
+	if (!to_gt(dev_priv)->ggtt.num_fences)
 		return -EOPNOTSUPP;
 
 	rcu_read_lock();
@@ -435,10 +438,10 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
 
 	switch (args->tiling_mode) {
 	case I915_TILING_X:
-		args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_x;
+		args->swizzle_mode = to_gt(dev_priv)->ggtt.bit_6_swizzle_x;
 		break;
 	case I915_TILING_Y:
-		args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_y;
+		args->swizzle_mode = to_gt(dev_priv)->ggtt.bit_6_swizzle_y;
 		break;
 	default:
 	case I915_TILING_NONE:
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index c08f766e6e15..58a967330706 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -220,7 +220,7 @@ static u64 tiled_offset(const struct intel_gt *gt,
 		v += div64_u64_rem(x, 512, &x) << 12;
 		v += x;
 
-		swizzle = gt->ggtt->bit_6_swizzle_x;
+		swizzle = gt->ggtt.bit_6_swizzle_x;
 	} else {
 		const unsigned int ytile_span = 16;
 		const unsigned int ytile_height = 512;
@@ -230,7 +230,7 @@ static u64 tiled_offset(const struct intel_gt *gt,
 		v += div64_u64_rem(x, ytile_span, &x) * ytile_height;
 		v += x;
 
-		swizzle = gt->ggtt->bit_6_swizzle_y;
+		swizzle = gt->ggtt.bit_6_swizzle_y;
 	}
 
 	switch (swizzle) {
@@ -543,7 +543,7 @@ static bool has_bit17_swizzle(int sw)
 
 static bool bad_swizzling(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 
 	if (i915->quirks & QUIRK_PIN_SWIZZLED_PAGES)
 		return true;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index 13b088cc787e..6c724310b76d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -265,7 +265,7 @@ static bool needs_fence_registers(struct context *ctx)
 	if (intel_gt_is_wedged(gt))
 		return false;
 
-	return gt->ggtt->num_fences;
+	return gt->ggtt.num_fences;
 }
 
 static bool needs_mi_store_dword(struct context *ctx)
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 250fe3ba6def..89c739223fd0 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1374,7 +1374,7 @@ static int igt_ctx_readonly(void *arg)
 		goto out_file;
 	}
 
-	vm = ctx->vm ?: &to_gt(i915)->ggtt->alias->vm;
+	vm = ctx->vm ?: &to_gt(i915)->ggtt.alias->vm;
 	if (!vm || !vm->has_read_only) {
 		err = 0;
 		goto out_file;
@@ -1637,7 +1637,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		const u32 reg = engine->mmio_base + 0x420;
 
 		/* hsw: register access even to 3DPRIM! is protected */
-		vm = i915_vm_get(&engine->gt->ggtt->vm);
+		vm = i915_vm_get(&engine->gt->ggtt.vm);
 		vma = i915_vma_instance(obj, vm, NULL);
 		if (IS_ERR(vma)) {
 			err = PTR_ERR(vma);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index ebe41a8ea36c..69f06cffce52 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -307,7 +307,7 @@ static int igt_partial_tiling(void *arg)
 	int tiling;
 	int err;
 
-	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
+	if (!i915_ggtt_has_aperture(&to_gt(i915)->ggtt))
 		return 0;
 
 	/* We want to check the page mapping and fencing of a large object
@@ -320,7 +320,7 @@ static int igt_partial_tiling(void *arg)
 
 	obj = huge_gem_object(i915,
 			      nreal << PAGE_SHIFT,
-			      (1 + next_prime_number(to_gt(i915)->ggtt->vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
+			      (1 + next_prime_number(to_gt(i915)->ggtt.vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
@@ -366,10 +366,10 @@ static int igt_partial_tiling(void *arg)
 		tile.tiling = tiling;
 		switch (tiling) {
 		case I915_TILING_X:
-			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_x;
+			tile.swizzle = to_gt(i915)->ggtt.bit_6_swizzle_x;
 			break;
 		case I915_TILING_Y:
-			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_y;
+			tile.swizzle = to_gt(i915)->ggtt.bit_6_swizzle_y;
 			break;
 		}
 
@@ -440,7 +440,7 @@ static int igt_smoke_tiling(void *arg)
 	IGT_TIMEOUT(end);
 	int err;
 
-	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
+	if (!i915_ggtt_has_aperture(&to_gt(i915)->ggtt))
 		return 0;
 
 	/*
@@ -457,7 +457,7 @@ static int igt_smoke_tiling(void *arg)
 
 	obj = huge_gem_object(i915,
 			      nreal << PAGE_SHIFT,
-			      (1 + next_prime_number(to_gt(i915)->ggtt->vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
+			      (1 + next_prime_number(to_gt(i915)->ggtt.vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
@@ -486,10 +486,10 @@ static int igt_smoke_tiling(void *arg)
 			break;
 
 		case I915_TILING_X:
-			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_x;
+			tile.swizzle = to_gt(i915)->ggtt.bit_6_swizzle_x;
 			break;
 		case I915_TILING_Y:
-			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_y;
+			tile.swizzle = to_gt(i915)->ggtt.bit_6_swizzle_y;
 			break;
 		}
 
@@ -534,7 +534,7 @@ static int make_obj_busy(struct drm_i915_gem_object *obj)
 		struct i915_gem_ww_ctx ww;
 		int err;
 
-		vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+		vma = i915_vma_instance(obj, &engine->gt->ggtt.vm, NULL);
 		if (IS_ERR(vma))
 			return PTR_ERR(vma);
 
@@ -856,6 +856,7 @@ static int wc_check(struct drm_i915_gem_object *obj)
 
 static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	bool no_map;
 
 	if (obj->ops->mmap_offset)
@@ -864,7 +865,7 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 		return false;
 
 	if (type == I915_MMAP_TYPE_GTT &&
-	    !i915_ggtt_has_aperture(&to_i915(obj->base.dev)->ggtt))
+	    !i915_ggtt_has_aperture(&to_gt(i915)->ggtt))
 		return false;
 
 	i915_gem_object_lock(obj, NULL);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
index fe0a890775e2..1365f5f19857 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
@@ -43,7 +43,7 @@ static int igt_gem_huge(void *arg)
 
 	obj = huge_gem_object(i915,
 			      nreal * PAGE_SIZE,
-			      to_gt(i915)->ggtt->vm.total + PAGE_SIZE);
+			      to_gt(i915)->ggtt.vm.total + PAGE_SIZE);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index c0d149f04949..626968caef4d 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -159,7 +159,7 @@ static void gen6_flush_pd(struct gen6_ppgtt *ppgtt, u64 start, u64 end)
 
 	mb();
 	ioread32(ppgtt->pd_addr + pde - 1);
-	gen6_ggtt_invalidate(ppgtt->base.vm.gt->ggtt);
+	gen6_ggtt_invalidate(&ppgtt->base.vm.gt->ggtt);
 	mb();
 
 	mutex_unlock(&ppgtt->flush);
@@ -385,7 +385,7 @@ static const struct drm_i915_gem_object_ops pd_dummy_obj_ops = {
 static struct i915_page_directory *
 gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
 {
-	struct i915_ggtt * const ggtt = ppgtt->base.vm.gt->ggtt;
+	struct i915_ggtt * const ggtt = &ppgtt->base.vm.gt->ggtt;
 	struct i915_page_directory *pd;
 	int err;
 
@@ -433,7 +433,7 @@ void gen6_ppgtt_unpin(struct i915_ppgtt *base)
 
 struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
 {
-	struct i915_ggtt * const ggtt = gt->ggtt;
+	struct i915_ggtt * const ggtt = &gt->ggtt;
 	struct gen6_ppgtt *ppgtt;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 352254e001b4..a90e644dae18 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -754,7 +754,7 @@ static int pin_ggtt_status_page(struct intel_engine_cs *engine,
 {
 	unsigned int flags;
 
-	if (!HAS_LLC(engine->i915) && i915_ggtt_has_aperture(engine->gt->ggtt))
+	if (!HAS_LLC(engine->i915) && i915_ggtt_has_aperture(&engine->gt->ggtt))
 		/*
 		 * On g33, we cannot place HWS above 256MiB, so
 		 * restrict its pinning to the low mappable arena.
@@ -799,7 +799,7 @@ static int init_status_page(struct intel_engine_cs *engine)
 
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
 
-	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &engine->gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto err_put;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index ec3b998392ff..467fc33a46f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -89,7 +89,7 @@ int i915_ggtt_init_hw(struct drm_i915_private *i915)
 	 * beyond the end of the batch buffer, across the page boundary,
 	 * and beyond the end of the GTT if we do not provide a guard.
 	 */
-	ret = ggtt_init_hw(to_gt(i915)->ggtt);
+	ret = ggtt_init_hw(&to_gt(i915)->ggtt);
 	if (ret)
 		return ret;
 
@@ -725,14 +725,14 @@ int i915_init_ggtt(struct drm_i915_private *i915)
 {
 	int ret;
 
-	ret = init_ggtt(to_gt(i915)->ggtt);
+	ret = init_ggtt(&to_gt(i915)->ggtt);
 	if (ret)
 		return ret;
 
 	if (INTEL_PPGTT(i915) == INTEL_PPGTT_ALIASING) {
-		ret = init_aliasing_ppgtt(to_gt(i915)->ggtt);
+		ret = init_aliasing_ppgtt(&to_gt(i915)->ggtt);
 		if (ret)
-			cleanup_init_ggtt(to_gt(i915)->ggtt);
+			cleanup_init_ggtt(&to_gt(i915)->ggtt);
 	}
 
 	return 0;
@@ -775,7 +775,7 @@ static void ggtt_cleanup_hw(struct i915_ggtt *ggtt)
  */
 void i915_ggtt_driver_release(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 
 	fini_aliasing_ppgtt(ggtt);
 
@@ -790,7 +790,7 @@ void i915_ggtt_driver_release(struct drm_i915_private *i915)
  */
 void i915_ggtt_driver_late_release(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 
 	GEM_WARN_ON(kref_read(&ggtt->vm.resv_ref) != 1);
 	dma_resv_fini(&ggtt->vm._resv);
@@ -1232,7 +1232,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
 {
 	int ret;
 
-	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
+	ret = ggtt_probe_hw(&to_gt(i915)->ggtt, to_gt(i915));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index beabf3bc9b75..02a35ae08462 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -728,8 +728,8 @@ static void detect_bit_6_swizzle(struct i915_ggtt *ggtt)
 		swizzle_y = I915_BIT_6_SWIZZLE_NONE;
 	}
 
-	to_gt(i915)->ggtt->bit_6_swizzle_x = swizzle_x;
-	to_gt(i915)->ggtt->bit_6_swizzle_y = swizzle_y;
+	to_gt(i915)->ggtt.bit_6_swizzle_x = swizzle_x;
+	to_gt(i915)->ggtt.bit_6_swizzle_y = swizzle_y;
 }
 
 /*
@@ -896,7 +896,7 @@ void intel_gt_init_swizzling(struct intel_gt *gt)
 	struct intel_uncore *uncore = gt->uncore;
 
 	if (GRAPHICS_VER(i915) < 5 ||
-	    to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
+	    to_gt(i915)->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
 		return;
 
 	intel_uncore_rmw(uncore, DISP_ARB_CTL, 0, DISP_TILE_SURFACE_SWIZZLING);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f98f0fb21efb..33d0b2689a40 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -85,11 +85,6 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 	return 0;
 }
 
-void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
-{
-	gt->ggtt = ggtt;
-}
-
 static const struct intel_mmio_range icl_l3bank_steering_table[] = {
 	{ 0x00B100, 0x00B3FF },
 	{},
@@ -460,7 +455,7 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
 		return PTR_ERR(obj);
 	}
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto err_unref;
@@ -489,7 +484,7 @@ static struct i915_address_space *kernel_vm(struct intel_gt *gt)
 	if (INTEL_PPGTT(gt->i915) > INTEL_PPGTT_ALIASING)
 		return &i915_ppgtt_create(gt, I915_BO_ALLOC_PM_EARLY)->vm;
 	else
-		return i915_vm_get(&gt->ggtt->vm);
+		return i915_vm_get(&gt->ggtt.vm);
 }
 
 static int __engines_record_defaults(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 3ace129eb2af..2da0f34df033 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -36,7 +36,6 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
 
 void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
 void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
-void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt);
 int intel_gt_probe_lmem(struct intel_gt *gt);
 int intel_gt_init_mmio(struct intel_gt *gt);
 int __must_check intel_gt_init_hw(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index c0fa41e4c803..d4a119c460c5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -368,7 +368,7 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
 
 	GT_TRACE(gt, "\n");
 	intel_gt_init_swizzling(gt);
-	intel_ggtt_restore_fences(gt->ggtt);
+	intel_ggtt_restore_fences(&gt->ggtt);
 
 	ret = intel_uc_runtime_resume(&gt->uc);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 14216cc471b1..02fc7641b82e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -69,7 +69,7 @@ enum intel_submission_method {
 struct intel_gt {
 	struct drm_i915_private *i915;
 	struct intel_uncore *uncore;
-	struct i915_ggtt *ggtt;
+	struct i915_ggtt ggtt;
 
 	struct intel_uc uc;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index b3489599e4de..cc25210c6eb4 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -954,7 +954,7 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &engine->gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		i915_gem_object_put(obj);
 		return vma;
@@ -1550,7 +1550,7 @@ static int lrc_create_wa_ctx(struct intel_engine_cs *engine)
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &engine->gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err;
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 21215a080088..e23ffca745d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -15,7 +15,7 @@
 static int init_fake_lmem_bar(struct intel_memory_region *mem)
 {
 	struct drm_i915_private *i915 = mem->i915;
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	unsigned long n;
 	int ret;
 
@@ -131,7 +131,7 @@ intel_gt_setup_fake_lmem(struct intel_gt *gt)
 	if (!i915->params.fake_lmem_start)
 		return ERR_PTR(-ENODEV);
 
-	GEM_BUG_ON(i915_ggtt_has_aperture(to_gt(i915)->ggtt));
+	GEM_BUG_ON(i915_ggtt_has_aperture(&to_gt(i915)->ggtt));
 
 	/* Your mappable aperture belongs to me now! */
 	mappable_end = pci_resource_len(pdev, 2);
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index b575cd6e0b7a..a6f9a418ee94 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -155,7 +155,7 @@ int intel_renderstate_init(struct intel_renderstate *so,
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
-		so->vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+		so->vma = i915_vma_instance(obj, &engine->gt->ggtt.vm, NULL);
 		if (IS_ERR(so->vma)) {
 			err = PTR_ERR(so->vma);
 			goto err_obj;
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 63199f0550e6..276b115aedef 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -723,19 +723,19 @@ static void revoke_mmaps(struct intel_gt *gt)
 {
 	int i;
 
-	for (i = 0; i < gt->ggtt->num_fences; i++) {
+	for (i = 0; i < gt->ggtt.num_fences; i++) {
 		struct drm_vma_offset_node *node;
 		struct i915_vma *vma;
 		u64 vma_offset;
 
-		vma = READ_ONCE(gt->ggtt->fence_regs[i].vma);
+		vma = READ_ONCE(gt->ggtt.fence_regs[i].vma);
 		if (!vma)
 			continue;
 
 		if (!i915_vma_has_userfault(vma))
 			continue;
 
-		GEM_BUG_ON(vma->fence != &gt->ggtt->fence_regs[i]);
+		GEM_BUG_ON(vma->fence != &gt->ggtt.fence_regs[i]);
 
 		if (!vma->mmo)
 			continue;
@@ -793,7 +793,7 @@ static int gt_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
 
 	intel_uc_reset(&gt->uc, true);
 
-	intel_ggtt_restore_fences(gt->ggtt);
+	intel_ggtt_restore_fences(&gt->ggtt);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index 2fdd52b62092..7710ca670387 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -168,7 +168,7 @@ intel_engine_create_ring(struct intel_engine_cs *engine, int size)
 
 	intel_ring_update_space(ring);
 
-	vma = create_ring_vma(engine->gt->ggtt, size);
+	vma = create_ring_vma(&engine->gt->ggtt, size);
 	if (IS_ERR(vma)) {
 		kfree(ring);
 		return ERR_CAST(vma);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 3e6fac0340ef..e0059378b3bf 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -543,7 +543,7 @@ alloc_context_vma(struct intel_engine_cs *engine)
 	if (IS_IVYBRIDGE(i915))
 		i915_gem_object_set_cache_coherency(obj, I915_CACHE_L3_LLC);
 
-	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &engine->gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err_obj;
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 438bbc7b8147..56d24e8b7ecf 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -25,7 +25,7 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
 
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma))
 		i915_gem_object_put(obj);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index ab3277a3d593..77d078a2f2a5 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2702,7 +2702,7 @@ static int engine_wa_list_verify(struct intel_context *ce,
 	if (!wal->count)
 		return 0;
 
-	vma = __vm_create_scratch_for_read(&ce->engine->gt->ggtt->vm,
+	vma = __vm_create_scratch_for_read(&ce->engine->gt->ggtt.vm,
 					   wal->count * sizeof(u32));
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index a94b8d56c4bb..9e5aa0b0846a 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -72,7 +72,7 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
 	ring->vaddr = (void *)(ring + 1);
 	atomic_set(&ring->pin_count, 1);
 
-	ring->vma = create_ring_vma(engine->gt->ggtt, PAGE_SIZE);
+	ring->vma = create_ring_vma(&engine->gt->ggtt, PAGE_SIZE);
 	if (IS_ERR(ring->vma)) {
 		kfree(ring);
 		return NULL;
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index e10da897e07a..a3b6bea7cb53 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -999,7 +999,7 @@ static int live_timeslice_preempt(void *arg)
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err_obj;
@@ -1306,7 +1306,7 @@ static int live_timeslice_queue(void *arg)
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err_obj;
@@ -1561,7 +1561,7 @@ static int live_busywait_preempt(void *arg)
 		goto err_obj;
 	}
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err_map;
@@ -3123,7 +3123,7 @@ static struct i915_vma *create_global(struct intel_gt *gt, size_t sz)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		i915_gem_object_put(obj);
 		return vma;
@@ -4205,7 +4205,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
 	u32 *cs;
 
 	scratch =
-		__vm_create_scratch_for_read_pinned(&siblings[0]->gt->ggtt->vm,
+		__vm_create_scratch_for_read_pinned(&siblings[0]->gt->ggtt.vm,
 						    PAGE_SIZE);
 	if (IS_ERR(scratch))
 		return PTR_ERR(scratch);
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 15d63435ec4d..1857b5af3c0a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -1434,7 +1434,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	unsigned int pin_flags;
 	int err;
 
-	if (!gt->ggtt->num_fences && flags & EXEC_OBJECT_NEEDS_FENCE)
+	if (!gt->ggtt.num_fences && flags & EXEC_OBJECT_NEEDS_FENCE)
 		return 0;
 
 	if (!engine || !intel_engine_can_store_dword(engine))
@@ -1586,7 +1586,7 @@ static int igt_reset_evict_ggtt(void *arg)
 {
 	struct intel_gt *gt = arg;
 
-	return __igt_reset_evict_vma(gt, &gt->ggtt->vm,
+	return __igt_reset_evict_vma(gt, &gt->ggtt.vm,
 				     evict_vma, EXEC_OBJECT_WRITE);
 }
 
@@ -1615,7 +1615,7 @@ static int igt_reset_evict_fence(void *arg)
 {
 	struct intel_gt *gt = arg;
 
-	return __igt_reset_evict_vma(gt, &gt->ggtt->vm,
+	return __igt_reset_evict_vma(gt, &gt->ggtt.vm,
 				     evict_fence, EXEC_OBJECT_NEEDS_FENCE);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 618c905daa19..3b2eb75b6f5a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -27,7 +27,7 @@
 
 static struct i915_vma *create_scratch(struct intel_gt *gt)
 {
-	return __vm_create_scratch_for_read_pinned(&gt->ggtt->vm, PAGE_SIZE);
+	return __vm_create_scratch_for_read_pinned(&gt->ggtt.vm, PAGE_SIZE);
 }
 
 static bool is_active(struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index c1d861333c44..efdab61c7731 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -76,7 +76,7 @@ static int live_mocs_init(struct live_mocs *arg, struct intel_gt *gt)
 		arg->mocs = &arg->table;
 
 	arg->scratch =
-		__vm_create_scratch_for_read_pinned(&gt->ggtt->vm, PAGE_SIZE);
+		__vm_create_scratch_for_read_pinned(&gt->ggtt.vm, PAGE_SIZE);
 	if (IS_ERR(arg->scratch))
 		return PTR_ERR(arg->scratch);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..cfc083d715e8 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -19,7 +19,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 		   intel_engine_mask_t mask,
 		   const char *msg)
 {
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	const struct resource *dsm = &gt->i915->dsm;
 	resource_size_t num_pages, page;
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 0287c2573c51..9168df92df69 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -121,7 +121,7 @@ read_nonprivs(struct intel_context *ce)
 	i915_gem_object_flush_map(result);
 	i915_gem_object_unpin_map(result);
 
-	vma = i915_vma_instance(result, &engine->gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(result, &engine->gt->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err_obj;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 6e228343e8cb..f56603d47467 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -348,7 +348,7 @@ int intel_guc_init(struct intel_guc *guc)
 	guc_init_params(guc);
 
 	/* We need to notify the guc whenever we change the GGTT */
-	i915_ggtt_enable_guc(gt->ggtt);
+	i915_ggtt_enable_guc(&gt->ggtt);
 
 	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_LOADABLE);
 
@@ -376,7 +376,7 @@ void intel_guc_fini(struct intel_guc *guc)
 	if (!intel_uc_fw_is_loadable(&guc->fw))
 		return;
 
-	i915_ggtt_disable_guc(gt->ggtt);
+	i915_ggtt_disable_guc(&gt->ggtt);
 
 	if (intel_guc_slpc_is_used(guc))
 		intel_guc_slpc_fini(&guc->slpc);
@@ -659,7 +659,7 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &gt->ggtt.vm, NULL);
 	if (IS_ERR(vma))
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index a7788ce50736..416826b2935c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -441,7 +441,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 
 static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
 {
-	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
+	struct i915_ggtt *ggtt = &__uc_fw_to_gt(uc_fw)->ggtt;
 	struct drm_mm_node *node = &ggtt->uc_fw;
 
 	GEM_BUG_ON(!drm_mm_node_allocated(node));
@@ -454,7 +454,7 @@ static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
 static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 {
 	struct drm_i915_gem_object *obj = uc_fw->obj;
-	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
+	struct i915_ggtt *ggtt = &__uc_fw_to_gt(uc_fw)->ggtt;
 	struct i915_vma *dummy = &uc_fw->dummy;
 	u32 pte_flags = 0;
 
@@ -479,7 +479,7 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
 {
 	struct drm_i915_gem_object *obj = uc_fw->obj;
-	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
+	struct i915_ggtt *ggtt = &__uc_fw_to_gt(uc_fw)->ggtt;
 	u64 start = uc_fw_ggtt_offset(uc_fw);
 
 	ggtt->vm.clear_range(&ggtt->vm, start, obj->base.size);
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 0d6d59871308..6f553505cb70 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -61,14 +61,14 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
 		flags = PIN_MAPPABLE;
 	}
 
-	mutex_lock(&gt->ggtt->vm.mutex);
+	mutex_lock(&gt->ggtt.vm.mutex);
 	mmio_hw_access_pre(gt);
-	ret = i915_gem_gtt_insert(&gt->ggtt->vm, node,
+	ret = i915_gem_gtt_insert(&gt->ggtt.vm, node,
 				  size, I915_GTT_PAGE_SIZE,
 				  I915_COLOR_UNEVICTABLE,
 				  start, end, flags);
 	mmio_hw_access_post(gt);
-	mutex_unlock(&gt->ggtt->vm.mutex);
+	mutex_unlock(&gt->ggtt.vm.mutex);
 	if (ret)
 		gvt_err("fail to alloc %s gm space from host\n",
 			high_gm ? "high" : "low");
@@ -98,9 +98,9 @@ static int alloc_vgpu_gm(struct intel_vgpu *vgpu)
 
 	return 0;
 out_free_aperture:
-	mutex_lock(&gt->ggtt->vm.mutex);
+	mutex_lock(&gt->ggtt.vm.mutex);
 	drm_mm_remove_node(&vgpu->gm.low_gm_node);
-	mutex_unlock(&gt->ggtt->vm.mutex);
+	mutex_unlock(&gt->ggtt.vm.mutex);
 	return ret;
 }
 
@@ -109,10 +109,10 @@ static void free_vgpu_gm(struct intel_vgpu *vgpu)
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gt *gt = gvt->gt;
 
-	mutex_lock(&gt->ggtt->vm.mutex);
+	mutex_lock(&gt->ggtt.vm.mutex);
 	drm_mm_remove_node(&vgpu->gm.low_gm_node);
 	drm_mm_remove_node(&vgpu->gm.high_gm_node);
-	mutex_unlock(&gt->ggtt->vm.mutex);
+	mutex_unlock(&gt->ggtt.vm.mutex);
 }
 
 /**
@@ -175,14 +175,14 @@ static void free_vgpu_fence(struct intel_vgpu *vgpu)
 
 	wakeref = intel_runtime_pm_get(uncore->rpm);
 
-	mutex_lock(&gvt->gt->ggtt->vm.mutex);
+	mutex_lock(&gvt->gt->ggtt.vm.mutex);
 	_clear_vgpu_fence(vgpu);
 	for (i = 0; i < vgpu_fence_sz(vgpu); i++) {
 		reg = vgpu->fence.regs[i];
 		i915_unreserve_fence(reg);
 		vgpu->fence.regs[i] = NULL;
 	}
-	mutex_unlock(&gvt->gt->ggtt->vm.mutex);
+	mutex_unlock(&gvt->gt->ggtt.vm.mutex);
 
 	intel_runtime_pm_put(uncore->rpm, wakeref);
 }
@@ -198,10 +198,10 @@ static int alloc_vgpu_fence(struct intel_vgpu *vgpu)
 	wakeref = intel_runtime_pm_get(uncore->rpm);
 
 	/* Request fences from host */
-	mutex_lock(&gvt->gt->ggtt->vm.mutex);
+	mutex_lock(&gvt->gt->ggtt.vm.mutex);
 
 	for (i = 0; i < vgpu_fence_sz(vgpu); i++) {
-		reg = i915_reserve_fence(gvt->gt->ggtt);
+		reg = i915_reserve_fence(&gvt->gt->ggtt);
 		if (IS_ERR(reg))
 			goto out_free_fence;
 
@@ -210,7 +210,7 @@ static int alloc_vgpu_fence(struct intel_vgpu *vgpu)
 
 	_clear_vgpu_fence(vgpu);
 
-	mutex_unlock(&gvt->gt->ggtt->vm.mutex);
+	mutex_unlock(&gvt->gt->ggtt.vm.mutex);
 	intel_runtime_pm_put(uncore->rpm, wakeref);
 	return 0;
 
@@ -224,7 +224,7 @@ static int alloc_vgpu_fence(struct intel_vgpu *vgpu)
 		i915_unreserve_fence(reg);
 		vgpu->fence.regs[i] = NULL;
 	}
-	mutex_unlock(&gvt->gt->ggtt->vm.mutex);
+	mutex_unlock(&gvt->gt->ggtt.vm.mutex);
 	intel_runtime_pm_put_unchecked(uncore->rpm);
 	return -ENOSPC;
 }
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 94c3eb1586b0..94b2edcf82c4 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -84,7 +84,7 @@ static int vgpu_gem_get_pages(
 		kfree(st);
 		return ret;
 	}
-	gtt_entries = (gen8_pte_t __iomem *)to_gt(dev_priv)->ggtt->gsm +
+	gtt_entries = (gen8_pte_t __iomem *)to_gt(dev_priv)->ggtt.gsm +
 		(fb_info->start >> PAGE_SHIFT);
 	for_each_sg(st->sgl, sg, page_num, i) {
 		dma_addr_t dma_addr =
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0c0615602343..bd32b814288b 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -378,7 +378,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
 #define HOST_HIGH_GM_SIZE MB_TO_BYTES(384)
 #define HOST_FENCE 4
 
-#define gvt_to_ggtt(gvt)	((gvt)->gt->ggtt)
+#define gvt_to_ggtt(gvt)	(&(gvt)->gt->ggtt)
 
 /* Aperture/GM space definitions for GVT device */
 #define gvt_aperture_sz(gvt)	  gvt_to_ggtt(gvt)->mappable_end
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 20b82fb036f8..38ea83b8f902 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1078,7 +1078,7 @@ static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, u64 off,
 		return -EINVAL;
 	}
 
-	aperture_va = io_mapping_map_wc(&vgpu->gvt->gt->ggtt->iomap,
+	aperture_va = io_mapping_map_wc(&vgpu->gvt->gt->ggtt.iomap,
 					ALIGN_DOWN(off, PAGE_SIZE),
 					count + offset_in_page(off));
 	if (!aperture_va)
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 0913daff62d7..02d27e1bac83 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -390,9 +390,9 @@ static int i915_swizzle_info(struct seq_file *m, void *data)
 	intel_wakeref_t wakeref;
 
 	seq_printf(m, "bit6 swizzle for X-tiling = %s\n",
-		   swizzle_string(to_gt(dev_priv)->ggtt->bit_6_swizzle_x));
+		   swizzle_string(to_gt(dev_priv)->ggtt.bit_6_swizzle_x));
 	seq_printf(m, "bit6 swizzle for Y-tiling = %s\n",
-		   swizzle_string(to_gt(dev_priv)->ggtt->bit_6_swizzle_y));
+		   swizzle_string(to_gt(dev_priv)->ggtt.bit_6_swizzle_y));
 
 	if (dev_priv->quirks & QUIRK_PIN_SWIZZLED_PAGES)
 		seq_puts(m, "L-shaped memory detected\n");
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 2619bb17b6eb..3e5c97a558a5 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -571,8 +571,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	i915_perf_init(dev_priv);
 
-	intel_gt_init_hw_early(to_gt(dev_priv), to_gt(dev_priv)->ggtt);
-
 	ret = i915_ggtt_probe_hw(dev_priv);
 	if (ret)
 		goto err_perf;
@@ -1146,7 +1144,7 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	/* Must be called before GGTT is suspended. */
 	intel_dpt_suspend(dev_priv);
-	i915_ggtt_suspend(to_gt(dev_priv)->ggtt);
+	i915_ggtt_suspend(&to_gt(dev_priv)->ggtt);
 
 	i915_save_display(dev_priv);
 
@@ -1270,7 +1268,7 @@ static int i915_drm_resume(struct drm_device *dev)
 	if (ret)
 		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
 
-	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
+	i915_ggtt_resume(&to_gt(dev_priv)->ggtt);
 	/* Must be called after GGTT is resumed. */
 	intel_dpt_resume(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 2c8f6c5298bd..91bac6fe3694 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -838,8 +838,6 @@ struct drm_i915_private {
 	struct drm_atomic_state *modeset_restore_state;
 	struct drm_modeset_acquire_ctx reset_ctx;
 
-	struct i915_ggtt ggtt; /* VM representing the global address space */
-
 	struct i915_gem_mm mm;
 
 	/* Kernel Modesetting */
@@ -1762,7 +1760,7 @@ static inline bool i915_gem_object_needs_bit17_swizzle(struct drm_i915_gem_objec
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	return to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
+	return to_gt(i915)->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
 		i915_gem_object_is_tiled(obj);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index abd8d13833b3..0889adee5e08 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -88,7 +88,8 @@ int
 i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file)
 {
-	struct i915_ggtt *ggtt = &to_i915(dev)->ggtt;
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct drm_i915_gem_get_aperture *args = data;
 	struct i915_vma *vma;
 	u64 pinned;
@@ -289,7 +290,7 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
 					     bool write)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	struct i915_gem_ww_ctx ww;
 	int ret;
@@ -350,7 +351,7 @@ static void i915_gem_gtt_cleanup(struct drm_i915_gem_object *obj,
 				 struct i915_vma *vma)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 
 	i915_gem_object_unpin_pages(obj);
 	if (drm_mm_node_allocated(node)) {
@@ -366,7 +367,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 		   const struct drm_i915_gem_pread *args)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node node;
 	void __user *user_data;
@@ -522,7 +523,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 			 const struct drm_i915_gem_pwrite *args)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node node;
@@ -823,7 +824,7 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	 */
 
 	list_for_each_entry_safe(obj, on,
-				 &to_gt(i915)->ggtt->userfault_list, userfault_link)
+				 &to_gt(i915)->ggtt.userfault_list, userfault_link)
 		__i915_gem_object_release_mmap_gtt(obj);
 
 	/*
@@ -831,8 +832,8 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	 * in use by hardware (i.e. they are pinned), we should not be powering
 	 * down! All other fences will be reacquired by the user upon waking.
 	 */
-	for (i = 0; i < to_gt(i915)->ggtt->num_fences; i++) {
-		struct i915_fence_reg *reg = &to_gt(i915)->ggtt->fence_regs[i];
+	for (i = 0; i < to_gt(i915)->ggtt.num_fences; i++) {
+		struct i915_fence_reg *reg = &to_gt(i915)->ggtt.fence_regs[i];
 
 		/*
 		 * Ideally we want to assert that the fence register is not
@@ -873,7 +874,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    u64 size, u64 alignment, u64 flags)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	int ret;
 
@@ -1101,7 +1102,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 
 		/* Minimal basic recovery for KMS */
 		ret = i915_ggtt_enable_hw(dev_priv);
-		i915_ggtt_resume(to_gt(dev_priv)->ggtt);
+		i915_ggtt_resume(&to_gt(dev_priv)->ggtt);
 		intel_init_clock_gating(dev_priv);
 	}
 
@@ -1124,7 +1125,7 @@ void i915_gem_driver_unregister(struct drm_i915_private *i915)
 
 void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 {
-	intel_wakeref_auto_fini(&to_gt(dev_priv)->ggtt->userfault_wakeref);
+	intel_wakeref_auto_fini(&to_gt(dev_priv)->ggtt.userfault_wakeref);
 
 	i915_gem_suspend_late(dev_priv);
 	intel_gt_driver_remove(to_gt(dev_priv));
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 2f2ba7a2955d..87b84ca6b728 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -56,7 +56,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 
 	/* XXX This does not prevent more requests being submitted! */
 	if (unlikely(ggtt->do_idle_maps))
@@ -103,7 +103,7 @@ int i915_gem_gtt_reserve(struct i915_address_space *vm,
 	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE));
 	GEM_BUG_ON(!IS_ALIGNED(offset, I915_GTT_MIN_ALIGNMENT));
 	GEM_BUG_ON(range_overflows(offset, size, vm->total));
-	GEM_BUG_ON(vm == &to_gt(vm->i915)->ggtt->alias->vm);
+	GEM_BUG_ON(vm == &to_gt(vm->i915)->ggtt.alias->vm);
 	GEM_BUG_ON(drm_mm_node_allocated(node));
 
 	node->size = size;
@@ -201,7 +201,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 	GEM_BUG_ON(start >= end);
 	GEM_BUG_ON(start > 0  && !IS_ALIGNED(start, I915_GTT_PAGE_SIZE));
 	GEM_BUG_ON(end < U64_MAX && !IS_ALIGNED(end, I915_GTT_PAGE_SIZE));
-	GEM_BUG_ON(vm == &to_gt(vm->i915)->ggtt->alias->vm);
+	GEM_BUG_ON(vm == &to_gt(vm->i915)->ggtt.alias->vm);
 	GEM_BUG_ON(drm_mm_node_allocated(node));
 
 	if (unlikely(range_overflows(start, size, end)))
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 5b8a2157d797..69a1e75cf6dc 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -31,7 +31,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = pdev->revision;
 		break;
 	case I915_PARAM_NUM_FENCES_AVAIL:
-		value = to_gt(i915)->ggtt->num_fences;
+		value = to_gt(i915)->ggtt.num_fences;
 		break;
 	case I915_PARAM_HAS_OVERLAY:
 		value = !!i915->overlay;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 90b5bbcd344c..2fa45a841b20 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1012,11 +1012,11 @@ void __i915_gpu_coredump_free(struct kref *error_ref)
 }
 
 static struct i915_vma_coredump *
-i915_vma_coredump_create(const struct intel_gt *gt,
+i915_vma_coredump_create(struct intel_gt *gt,
 			 const struct i915_vma_snapshot *vsnap,
 			 struct i915_vma_compress *compress)
 {
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	const u64 slot = ggtt->error_capture.start;
 	struct i915_vma_coredump *dst;
 	struct sgt_iter iter;
@@ -1122,7 +1122,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 static void gt_record_fences(struct intel_gt_coredump *gt)
 {
-	struct i915_ggtt *ggtt = gt->_gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->_gt->ggtt;
 	struct intel_uncore *uncore = gt->_gt->uncore;
 	int i;
 
@@ -1412,7 +1412,7 @@ static void add_vma(struct intel_engine_coredump *ee,
 }
 
 static struct i915_vma_coredump *
-create_vma_coredump(const struct intel_gt *gt, struct i915_vma *vma,
+create_vma_coredump(struct intel_gt *gt, struct i915_vma *vma,
 		    const char *name, struct i915_vma_compress *compress)
 {
 	struct i915_vma_coredump *ret = NULL;
@@ -1433,7 +1433,7 @@ create_vma_coredump(const struct intel_gt *gt, struct i915_vma *vma,
 }
 
 static void add_vma_coredump(struct intel_engine_coredump *ee,
-			     const struct intel_gt *gt,
+			     struct intel_gt *gt,
 			     struct i915_vma *vma,
 			     const char *name,
 			     struct i915_vma_compress *compress)
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 5aedf5129814..df893279cf13 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -54,7 +54,7 @@ struct i915_request_coredump {
 };
 
 struct intel_engine_coredump {
-	const struct intel_engine_cs *engine;
+	struct intel_engine_cs *engine;
 
 	bool hung;
 	bool simulated;
@@ -113,7 +113,7 @@ struct intel_engine_coredump {
 };
 
 struct intel_gt_coredump {
-	const struct intel_gt *_gt;
+	struct intel_gt *_gt;
 	bool awake;
 	bool simulated;
 
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 128315aec517..2b8629fa9769 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1630,7 +1630,7 @@ static int alloc_noa_wait(struct i915_perf_stream *stream)
 	struct drm_i915_gem_object *bo;
 	struct i915_vma *vma;
 	const u64 delay_ticks = 0xffffffffffffffff -
-		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt->vm.gt,
+		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt.vm.gt,
 					      atomic64_read(&stream->perf->noa_programming_delay));
 	const u32 base = stream->engine->mmio_base;
 #define CS_GPR(x) GEN8_RING_CS_GPR(base, x)
@@ -1910,7 +1910,7 @@ alloc_oa_config_buffer(struct i915_perf_stream *stream,
 	__i915_gem_object_release_map(obj);
 
 	oa_bo->vma = i915_vma_instance(obj,
-				       &stream->engine->gt->ggtt->vm,
+				       &stream->engine->gt->ggtt.vm,
 				       NULL);
 	if (IS_ERR(oa_bo->vma)) {
 		err = PTR_ERR(oa_bo->vma);
@@ -3542,7 +3542,7 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 
 static u64 oa_exponent_to_ns(struct i915_perf *perf, int exponent)
 {
-	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt->vm.gt,
+	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt.vm.gt,
 					     2ULL << exponent);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 471cde0e9883..1c1f607bb69a 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1177,7 +1177,7 @@ __emit_semaphore_wait(struct i915_request *to,
 static bool
 can_use_semaphore_wait(struct i915_request *to, struct i915_request *from)
 {
-	return to->engine->gt->ggtt == from->engine->gt->ggtt;
+	return &to->engine->gt->ggtt == &from->engine->gt->ggtt;
 }
 
 static int
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 927f0d4f8e11..7d5c731d0e0f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -102,7 +102,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	struct rb_node *rb, **p;
 
 	/* The aliasing_ppgtt should never be used directly! */
-	GEM_BUG_ON(vm == &vm->gt->ggtt->alias->vm);
+	GEM_BUG_ON(vm == &vm->gt->ggtt.alias->vm);
 
 	vma = i915_vma_alloc();
 	if (vma == NULL)
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 1628b81d0a35..031ddb4f5538 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -41,7 +41,7 @@ static int switch_to_context(struct i915_gem_context *ctx)
 
 static void trash_stolen(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	const u64 slot = ggtt->error_capture.start;
 	const resource_size_t size = resource_size(&i915->dsm);
 	unsigned long page;
@@ -99,7 +99,7 @@ static void igt_pm_suspend(struct drm_i915_private *i915)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_suspend(to_gt(i915)->ggtt);
+		i915_ggtt_suspend(&to_gt(i915)->ggtt);
 		i915_gem_suspend_late(i915);
 	}
 }
@@ -109,7 +109,7 @@ static void igt_pm_hibernate(struct drm_i915_private *i915)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_suspend(to_gt(i915)->ggtt);
+		i915_ggtt_suspend(&to_gt(i915)->ggtt);
 
 		i915_gem_freeze(i915);
 		i915_gem_freeze_late(i915);
@@ -125,7 +125,7 @@ static void igt_pm_resume(struct drm_i915_private *i915)
 	 * that runtime-pm just works.
 	 */
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_resume(to_gt(i915)->ggtt);
+		i915_ggtt_resume(&to_gt(i915)->ggtt);
 		i915_gem_resume(i915);
 	}
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 75b709c26dd3..2d45e9a36840 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -105,7 +105,7 @@ static void cleanup_objects(struct i915_ggtt *ggtt, struct list_head *list)
 static int igt_evict_something(void *arg)
 {
 	struct intel_gt *gt = arg;
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	LIST_HEAD(objects);
 	int err;
 
@@ -151,7 +151,7 @@ static int igt_evict_something(void *arg)
 static int igt_overcommit(void *arg)
 {
 	struct intel_gt *gt = arg;
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	LIST_HEAD(objects);
@@ -188,7 +188,7 @@ static int igt_overcommit(void *arg)
 static int igt_evict_for_vma(void *arg)
 {
 	struct intel_gt *gt = arg;
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	struct drm_mm_node target = {
 		.start = 0,
 		.size = 4096,
@@ -239,7 +239,7 @@ static void mock_color_adjust(const struct drm_mm_node *node,
 static int igt_evict_for_cache_color(void *arg)
 {
 	struct intel_gt *gt = arg;
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	const unsigned long flags = PIN_OFFSET_FIXED;
 	struct drm_mm_node target = {
 		.start = I915_GTT_PAGE_SIZE * 2,
@@ -330,7 +330,7 @@ static int igt_evict_for_cache_color(void *arg)
 static int igt_evict_vm(void *arg)
 {
 	struct intel_gt *gt = arg;
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	LIST_HEAD(objects);
 	int err;
 
@@ -370,7 +370,7 @@ static int igt_evict_contexts(void *arg)
 {
 	const u64 PRETEND_GGTT_SIZE = 16ull << 20;
 	struct intel_gt *gt = arg;
-	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_ggtt *ggtt = &gt->ggtt;
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 9afe7cf9d068..3b1c50ea3f45 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1122,7 +1122,7 @@ static int exercise_ggtt(struct drm_i915_private *i915,
 				     u64 hole_start, u64 hole_end,
 				     unsigned long end_time))
 {
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	u64 hole_start, hole_end, last = 0;
 	struct drm_mm_node *node;
 	IGT_TIMEOUT(end_time);
@@ -1182,7 +1182,7 @@ static int igt_ggtt_page(void *arg)
 	const unsigned int count = PAGE_SIZE/sizeof(u32);
 	I915_RND_STATE(prng);
 	struct drm_i915_private *i915 = arg;
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct i915_ggtt *ggtt = &to_gt(i915)->ggtt;
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node tmp;
@@ -1756,9 +1756,9 @@ int i915_gem_gtt_mock_selftests(void)
 	mock_device_flush(i915);
 	i915_gem_drain_freed_objects(i915);
 	mock_fini_ggtt(ggtt);
+	mock_destroy_device(i915);
 	kfree(ggtt);
 out_put:
-	mock_destroy_device(i915);
 	return err;
 }
 
@@ -2110,7 +2110,7 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_cs_tlb),
 	};
 
-	GEM_BUG_ON(offset_in_page(to_gt(i915)->ggtt->vm.total));
+	GEM_BUG_ON(offset_in_page(to_gt(i915)->ggtt.vm.total));
 
 	return i915_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 7f66f6d299b2..351b573735de 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -843,7 +843,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
 
 	intel_gt_chipset_flush(to_gt(i915));
 
-	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
+	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err;
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 6ac15d3bc5bc..3064aff9d26e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -926,9 +926,9 @@ int i915_vma_mock_selftests(void)
 	mock_device_flush(i915);
 	i915_gem_drain_freed_objects(i915);
 	mock_fini_ggtt(ggtt);
+	mock_destroy_device(i915);
 	kfree(ggtt);
 out_put:
-	mock_destroy_device(i915);
 	return err;
 }
 
@@ -967,7 +967,7 @@ static int igt_vma_remapped_gtt(void *arg)
 	intel_wakeref_t wakeref;
 	int err = 0;
 
-	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
+	if (!i915_ggtt_has_aperture(&to_gt(i915)->ggtt))
 		return 0;
 
 	obj = i915_gem_object_create_internal(i915, 10 * 10 * PAGE_SIZE);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 2f12f8748262..d5b7398808f5 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -69,7 +69,7 @@ static void mock_device_release(struct drm_device *dev)
 	i915_gem_drain_workqueue(i915);
 	i915_gem_drain_freed_objects(i915);
 
-	mock_fini_ggtt(to_gt(i915)->ggtt);
+	mock_fini_ggtt(&to_gt(i915)->ggtt);
 	destroy_workqueue(i915->wq);
 
 	intel_region_ttm_device_fini(i915);
@@ -194,8 +194,8 @@ struct drm_i915_private *mock_gem_device(void)
 
 	mock_init_contexts(i915);
 
-	mock_init_ggtt(i915, &i915->ggtt);
-	to_gt(i915)->vm = i915_vm_get(&to_gt(i915)->ggtt->vm);
+	mock_init_ggtt(i915, &to_gt(i915)->ggtt);
+	to_gt(i915)->vm = i915_vm_get(&to_gt(i915)->ggtt.vm);
 
 	mkwrite_device_info(i915)->platform_engine_mask = BIT(0);
 	to_gt(i915)->info.engine_mask = BIT(0);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index 82867424d203..4cd7f201701e 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -132,7 +132,6 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
 	ggtt->vm.vma_ops.clear_pages = clear_pages;
 
 	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
-	intel_gt_init_hw_early(to_gt(i915), ggtt);
 }
 
 void mock_fini_ggtt(struct i915_ggtt *ggtt)
-- 
2.34.1

