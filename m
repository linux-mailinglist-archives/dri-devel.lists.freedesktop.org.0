Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64946EF23
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A9110EA5D;
	Thu,  9 Dec 2021 16:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977E5891B9;
 Thu,  9 Dec 2021 13:26:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218118465"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218118465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:26:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="462130487"
Received: from achlenov-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.252.52.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:26:31 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 10/11] drm/i915: Use to_gt() helper for GGTT accesses
Date: Thu,  9 Dec 2021 15:25:11 +0200
Message-Id: <20211209132512.47241-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209132512.47241-1-andi.shyti@linux.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/display/intel_fbc.c         |  2 +-
 .../gpu/drm/i915/display/intel_plane_initial.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c         | 16 ++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_pm.c           |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c     |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c       |  2 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c    |  2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_mman.c   | 16 ++++++++--------
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c             | 14 +++++++-------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c     |  6 +++---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c      |  4 ++--
 drivers/gpu/drm/i915/gt/selftest_reset.c         |  2 +-
 drivers/gpu/drm/i915/i915_driver.c               |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h                  |  2 +-
 drivers/gpu/drm/i915/i915_gem.c                  | 16 ++++++++--------
 drivers/gpu/drm/i915/i915_gem_gtt.c              |  6 +++---
 drivers/gpu/drm/i915/i915_getparam.c             |  2 +-
 drivers/gpu/drm/i915/i915_perf.c                 |  4 ++--
 drivers/gpu/drm/i915/selftests/i915_gem.c        |  8 ++++----
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c    |  6 +++---
 drivers/gpu/drm/i915/selftests/i915_request.c    |  2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c        |  2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c |  4 ++--
 drivers/gpu/drm/i915/selftests/mock_gtt.c        |  2 +-
 28 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 8be01b93015f..98319c0322d7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -595,7 +595,7 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-	if (i915->ggtt.num_fences)
+	if (to_gt(i915)->ggtt->num_fences)
 		snb_fbc_program_fence(fbc);
 
 	intel_de_write(i915, ILK_DPFC_CONTROL,
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 01ce1d72297f..e4186a0b8edb 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -94,7 +94,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 		goto err_obj;
 	}
 
-	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
+	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
 	if (IS_ERR(vma))
 		goto err_obj;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index babfecb17ad1..e5b0f66ea1fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -174,7 +174,7 @@ i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
 
 	vm = ctx->vm;
 	if (!vm)
-		vm = &ctx->i915->ggtt.vm;
+		vm = &to_gt(ctx->i915)->ggtt->vm;
 	vm = i915_vm_get(vm);
 
 	return vm;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index ec7c4a29a720..3078611d5bfe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1106,7 +1106,7 @@ static inline struct i915_ggtt *cache_to_ggtt(struct reloc_cache *cache)
 {
 	struct drm_i915_private *i915 =
 		container_of(cache, struct i915_execbuffer, reloc_cache)->i915;
-	return &i915->ggtt;
+	return to_gt(i915)->ggtt;
 }
 
 static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer *eb)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 1ca5c062974e..bd5890780810 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -295,7 +295,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	struct drm_device *dev = obj->base.dev;
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	bool write = area->vm_flags & VM_WRITE;
 	struct i915_gem_ww_ctx ww;
 	intel_wakeref_t wakeref;
@@ -388,16 +388,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	assert_rpm_wakelock_held(rpm);
 
 	/* Mark as being mmapped into userspace for later revocation */
-	mutex_lock(&i915->ggtt.vm.mutex);
+	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
 	if (!i915_vma_set_userfault(vma) && !obj->userfault_count++)
-		list_add(&obj->userfault_link, &i915->ggtt.userfault_list);
-	mutex_unlock(&i915->ggtt.vm.mutex);
+		list_add(&obj->userfault_link, &to_gt(i915)->ggtt->userfault_list);
+	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
 
 	/* Track the mmo associated with the fenced vma */
 	vma->mmo = mmo;
 
 	if (CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND)
-		intel_wakeref_auto(&i915->ggtt.userfault_wakeref,
+		intel_wakeref_auto(&to_gt(i915)->ggtt->userfault_wakeref,
 				   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
 
 	if (write) {
@@ -512,7 +512,7 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
 	 * wakeref.
 	 */
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
-	mutex_lock(&i915->ggtt.vm.mutex);
+	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
 
 	if (!obj->userfault_count)
 		goto out;
@@ -530,7 +530,7 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
 	wmb();
 
 out:
-	mutex_unlock(&i915->ggtt.vm.mutex);
+	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
 
@@ -787,7 +787,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 
 	switch (args->flags) {
 	case I915_MMAP_OFFSET_GTT:
-		if (!i915_ggtt_has_aperture(&i915->ggtt))
+		if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 			return -ENODEV;
 		type = I915_MMAP_TYPE_GTT;
 		break;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index ac56124760e1..6da68b38f00f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -23,7 +23,7 @@ void i915_gem_suspend(struct drm_i915_private *i915)
 {
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
 
-	intel_wakeref_auto(&i915->ggtt.userfault_wakeref, 0);
+	intel_wakeref_auto(&to_gt(i915)->ggtt->userfault_wakeref, 0);
 	flush_workqueue(i915->wq);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 05a1ba2f2e7b..793fbf3da46b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -403,9 +403,9 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 					       I915_SHRINK_VMAPS);
 
 	/* We also want to clear any cached iomaps as they wrap vmap */
-	mutex_lock(&i915->ggtt.vm.mutex);
+	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
 	list_for_each_entry_safe(vma, next,
-				 &i915->ggtt.vm.bound_list, vm_link) {
+				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
 		unsigned long count = vma->node.size >> PAGE_SHIFT;
 
 		if (!vma->iomap || i915_vma_is_active(vma))
@@ -414,7 +414,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 		if (__i915_vma_unbind(vma) == 0)
 			freed_pages += count;
 	}
-	mutex_unlock(&i915->ggtt.vm.mutex);
+	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
 
 	*(unsigned long *)ptr += freed_pages;
 	return NOTIFY_DONE;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index bce03d74a0b4..eb6bf6779d2c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -71,7 +71,7 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
 static int i915_adjust_stolen(struct drm_i915_private *i915,
 			      struct resource *dsm)
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
 	struct resource *r;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index 75947e9dada2..c08f766e6e15 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -543,7 +543,7 @@ static bool has_bit17_swizzle(int sw)
 
 static bool bad_swizzling(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	if (i915->quirks & QUIRK_PIN_SWIZZLED_PAGES)
 		return true;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 45398adda9c8..250fe3ba6def 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1374,7 +1374,7 @@ static int igt_ctx_readonly(void *arg)
 		goto out_file;
 	}
 
-	vm = ctx->vm ?: &i915->ggtt.alias->vm;
+	vm = ctx->vm ?: &to_gt(i915)->ggtt->alias->vm;
 	if (!vm || !vm->has_read_only) {
 		err = 0;
 		goto out_file;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 743e6ab2c40b..ebe41a8ea36c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -307,7 +307,7 @@ static int igt_partial_tiling(void *arg)
 	int tiling;
 	int err;
 
-	if (!i915_ggtt_has_aperture(&i915->ggtt))
+	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 		return 0;
 
 	/* We want to check the page mapping and fencing of a large object
@@ -320,7 +320,7 @@ static int igt_partial_tiling(void *arg)
 
 	obj = huge_gem_object(i915,
 			      nreal << PAGE_SHIFT,
-			      (1 + next_prime_number(i915->ggtt.vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
+			      (1 + next_prime_number(to_gt(i915)->ggtt->vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
@@ -366,10 +366,10 @@ static int igt_partial_tiling(void *arg)
 		tile.tiling = tiling;
 		switch (tiling) {
 		case I915_TILING_X:
-			tile.swizzle = i915->ggtt.bit_6_swizzle_x;
+			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_x;
 			break;
 		case I915_TILING_Y:
-			tile.swizzle = i915->ggtt.bit_6_swizzle_y;
+			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_y;
 			break;
 		}
 
@@ -440,7 +440,7 @@ static int igt_smoke_tiling(void *arg)
 	IGT_TIMEOUT(end);
 	int err;
 
-	if (!i915_ggtt_has_aperture(&i915->ggtt))
+	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 		return 0;
 
 	/*
@@ -457,7 +457,7 @@ static int igt_smoke_tiling(void *arg)
 
 	obj = huge_gem_object(i915,
 			      nreal << PAGE_SHIFT,
-			      (1 + next_prime_number(i915->ggtt.vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
+			      (1 + next_prime_number(to_gt(i915)->ggtt->vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
@@ -486,10 +486,10 @@ static int igt_smoke_tiling(void *arg)
 			break;
 
 		case I915_TILING_X:
-			tile.swizzle = i915->ggtt.bit_6_swizzle_x;
+			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_x;
 			break;
 		case I915_TILING_Y:
-			tile.swizzle = i915->ggtt.bit_6_swizzle_y;
+			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_y;
 			break;
 		}
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
index 740ee8086a27..fe0a890775e2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
@@ -43,7 +43,7 @@ static int igt_gem_huge(void *arg)
 
 	obj = huge_gem_object(i915,
 			      nreal * PAGE_SIZE,
-			      i915->ggtt.vm.total + PAGE_SIZE);
+			      to_gt(i915)->ggtt->vm.total + PAGE_SIZE);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index f5c8fd3911b0..75e99160b31f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -89,7 +89,7 @@ int i915_ggtt_init_hw(struct drm_i915_private *i915)
 	 * beyond the end of the batch buffer, across the page boundary,
 	 * and beyond the end of the GTT if we do not provide a guard.
 	 */
-	ret = ggtt_init_hw(&i915->ggtt);
+	ret = ggtt_init_hw(to_gt(i915)->ggtt);
 	if (ret)
 		return ret;
 
@@ -725,14 +725,14 @@ int i915_init_ggtt(struct drm_i915_private *i915)
 {
 	int ret;
 
-	ret = init_ggtt(&i915->ggtt);
+	ret = init_ggtt(to_gt(i915)->ggtt);
 	if (ret)
 		return ret;
 
 	if (INTEL_PPGTT(i915) == INTEL_PPGTT_ALIASING) {
-		ret = init_aliasing_ppgtt(&i915->ggtt);
+		ret = init_aliasing_ppgtt(to_gt(i915)->ggtt);
 		if (ret)
-			cleanup_init_ggtt(&i915->ggtt);
+			cleanup_init_ggtt(to_gt(i915)->ggtt);
 	}
 
 	return 0;
@@ -775,7 +775,7 @@ static void ggtt_cleanup_hw(struct i915_ggtt *ggtt)
  */
 void i915_ggtt_driver_release(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	fini_aliasing_ppgtt(ggtt);
 
@@ -790,7 +790,7 @@ void i915_ggtt_driver_release(struct drm_i915_private *i915)
  */
 void i915_ggtt_driver_late_release(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	GEM_WARN_ON(kref_read(&ggtt->vm.resv_ref) != 1);
 	dma_resv_fini(&ggtt->vm._resv);
@@ -1229,7 +1229,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
 {
 	int ret;
 
-	ret = ggtt_probe_hw(&i915->ggtt, to_gt(i915));
+	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index f8948de72036..beabf3bc9b75 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -728,8 +728,8 @@ static void detect_bit_6_swizzle(struct i915_ggtt *ggtt)
 		swizzle_y = I915_BIT_6_SWIZZLE_NONE;
 	}
 
-	i915->ggtt.bit_6_swizzle_x = swizzle_x;
-	i915->ggtt.bit_6_swizzle_y = swizzle_y;
+	to_gt(i915)->ggtt->bit_6_swizzle_x = swizzle_x;
+	to_gt(i915)->ggtt->bit_6_swizzle_y = swizzle_y;
 }
 
 /*
@@ -896,7 +896,7 @@ void intel_gt_init_swizzling(struct intel_gt *gt)
 	struct intel_uncore *uncore = gt->uncore;
 
 	if (GRAPHICS_VER(i915) < 5 ||
-	    i915->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
+	    to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
 		return;
 
 	intel_uncore_rmw(uncore, DISP_ARB_CTL, 0, DISP_TILE_SURFACE_SWIZZLING);
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 9ea49e0a27c0..b255cf4c26e6 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -15,7 +15,7 @@
 static int init_fake_lmem_bar(struct intel_memory_region *mem)
 {
 	struct drm_i915_private *i915 = mem->i915;
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	unsigned long n;
 	int ret;
 
@@ -131,7 +131,7 @@ intel_gt_setup_fake_lmem(struct intel_gt *gt)
 	if (!i915->params.fake_lmem_start)
 		return ERR_PTR(-ENODEV);
 
-	GEM_BUG_ON(i915_ggtt_has_aperture(&i915->ggtt));
+	GEM_BUG_ON(i915_ggtt_has_aperture(to_gt(i915)->ggtt));
 
 	/* Your mappable aperture belongs to me now! */
 	mappable_end = pci_resource_len(pdev, 2);
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 8a873f6bda7f..37c38bdd5f47 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -19,7 +19,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 		   intel_engine_mask_t mask,
 		   const char *msg)
 {
-	struct i915_ggtt *ggtt = &gt->i915->ggtt;
+	struct i915_ggtt *ggtt = gt->ggtt;
 	const struct resource *dsm = &gt->i915->dsm;
 	resource_size_t num_pages, page;
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 95174938b160..60f8cbf24de7 100644
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
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b0d929012ff3..96e3553838ef 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1757,7 +1757,7 @@ static inline bool i915_gem_object_needs_bit17_swizzle(struct drm_i915_gem_objec
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	return i915->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
+	return to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
 		i915_gem_object_is_tiled(obj);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 8ba2119092f2..d94f901ea61f 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -289,7 +289,7 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
 					     bool write)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	struct i915_gem_ww_ctx ww;
 	int ret;
@@ -350,7 +350,7 @@ static void i915_gem_gtt_cleanup(struct drm_i915_gem_object *obj,
 				 struct i915_vma *vma)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	i915_gem_object_unpin_pages(obj);
 	if (drm_mm_node_allocated(node)) {
@@ -366,7 +366,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 		   const struct drm_i915_gem_pread *args)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node node;
 	void __user *user_data;
@@ -522,7 +522,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 			 const struct drm_i915_gem_pwrite *args)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node node;
@@ -823,7 +823,7 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	 */
 
 	list_for_each_entry_safe(obj, on,
-				 &i915->ggtt.userfault_list, userfault_link)
+				 &to_gt(i915)->ggtt->userfault_list, userfault_link)
 		__i915_gem_object_release_mmap_gtt(obj);
 
 	/*
@@ -831,8 +831,8 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	 * in use by hardware (i.e. they are pinned), we should not be powering
 	 * down! All other fences will be reacquired by the user upon waking.
 	 */
-	for (i = 0; i < i915->ggtt.num_fences; i++) {
-		struct i915_fence_reg *reg = &i915->ggtt.fence_regs[i];
+	for (i = 0; i < to_gt(i915)->ggtt->num_fences; i++) {
+		struct i915_fence_reg *reg = &to_gt(i915)->ggtt->fence_regs[i];
 
 		/*
 		 * Ideally we want to assert that the fence register is not
@@ -873,7 +873,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    u64 size, u64 alignment, u64 flags)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	int ret;
 
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
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index b5576888cd78..1628b81d0a35 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -41,7 +41,7 @@ static int switch_to_context(struct i915_gem_context *ctx)
 
 static void trash_stolen(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	const u64 slot = ggtt->error_capture.start;
 	const resource_size_t size = resource_size(&i915->dsm);
 	unsigned long page;
@@ -99,7 +99,7 @@ static void igt_pm_suspend(struct drm_i915_private *i915)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_suspend(&i915->ggtt);
+		i915_ggtt_suspend(to_gt(i915)->ggtt);
 		i915_gem_suspend_late(i915);
 	}
 }
@@ -109,7 +109,7 @@ static void igt_pm_hibernate(struct drm_i915_private *i915)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_suspend(&i915->ggtt);
+		i915_ggtt_suspend(to_gt(i915)->ggtt);
 
 		i915_gem_freeze(i915);
 		i915_gem_freeze_late(i915);
@@ -125,7 +125,7 @@ static void igt_pm_resume(struct drm_i915_private *i915)
 	 * that runtime-pm just works.
 	 */
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_resume(&i915->ggtt);
+		i915_ggtt_resume(to_gt(i915)->ggtt);
 		i915_gem_resume(i915);
 	}
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 48123c3e1ff0..9afe7cf9d068 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1122,7 +1122,7 @@ static int exercise_ggtt(struct drm_i915_private *i915,
 				     u64 hole_start, u64 hole_end,
 				     unsigned long end_time))
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	u64 hole_start, hole_end, last = 0;
 	struct drm_mm_node *node;
 	IGT_TIMEOUT(end_time);
@@ -1182,7 +1182,7 @@ static int igt_ggtt_page(void *arg)
 	const unsigned int count = PAGE_SIZE/sizeof(u32);
 	I915_RND_STATE(prng);
 	struct drm_i915_private *i915 = arg;
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node tmp;
@@ -2110,7 +2110,7 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_cs_tlb),
 	};
 
-	GEM_BUG_ON(offset_in_page(i915->ggtt.vm.total));
+	GEM_BUG_ON(offset_in_page(to_gt(i915)->ggtt->vm.total));
 
 	return i915_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 92a859b34190..7f66f6d299b2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -843,7 +843,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
 
 	intel_gt_chipset_flush(to_gt(i915));
 
-	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
+	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err;
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 1f10fe36619b..6ac15d3bc5bc 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -967,7 +967,7 @@ static int igt_vma_remapped_gtt(void *arg)
 	intel_wakeref_t wakeref;
 	int err = 0;
 
-	if (!i915_ggtt_has_aperture(&i915->ggtt))
+	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 		return 0;
 
 	obj = i915_gem_object_create_internal(i915, 10 * 10 * PAGE_SIZE);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 8aa7b1d33865..2f12f8748262 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -69,7 +69,7 @@ static void mock_device_release(struct drm_device *dev)
 	i915_gem_drain_workqueue(i915);
 	i915_gem_drain_freed_objects(i915);
 
-	mock_fini_ggtt(&i915->ggtt);
+	mock_fini_ggtt(to_gt(i915)->ggtt);
 	destroy_workqueue(i915->wq);
 
 	intel_region_ttm_device_fini(i915);
@@ -195,7 +195,7 @@ struct drm_i915_private *mock_gem_device(void)
 	mock_init_contexts(i915);
 
 	mock_init_ggtt(i915, &i915->ggtt);
-	to_gt(i915)->vm = i915_vm_get(&i915->ggtt.vm);
+	to_gt(i915)->vm = i915_vm_get(&to_gt(i915)->ggtt->vm);
 
 	mkwrite_device_info(i915)->platform_engine_mask = BIT(0);
 	to_gt(i915)->info.engine_mask = BIT(0);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index f0b87de0aca3..41fae5c9ea34 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -130,7 +130,7 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
 	ggtt->vm.vma_ops.clear_pages = clear_pages;
 
 	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
-	to_gt(i915)->ggtt = ggtt;
+	intel_gt_init_hw_early(to_gt(i915), ggtt);
 }
 
 void mock_fini_ggtt(struct i915_ggtt *ggtt)
-- 
2.34.1

