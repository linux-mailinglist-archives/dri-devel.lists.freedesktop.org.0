Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DFE44D257
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 08:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D1E6E933;
	Thu, 11 Nov 2021 07:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB346E945;
 Thu, 11 Nov 2021 07:15:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212896393"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="212896393"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452627319"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.199])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:20 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915: Add support for asynchronous moving fence
 waiting
Date: Thu, 11 Nov 2021 08:14:58 +0100
Message-Id: <20211111071502.16826-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
References: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

For now, we will only allow async migration when TTM is used,
so the paths we care about are related to TTM.

The mmap path is handled by having the fence in ttm_bo->moving,
when pinning, the binding only becomes available after the moving
fence is signaled, and pinning a cpu map will only work after
the moving fence signals.

This should close all holes where userspace can read a buffer
before it's fully migrated.

Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  7 ++--
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  6 +++
 .../i915/gem/selftests/i915_gem_coherency.c   |  4 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 18 +++++----
 drivers/gpu/drm/i915/i915_vma.c               | 39 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  3 ++
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  4 +-
 8 files changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index adc3a81be9f7..b1796084596b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -265,10 +265,11 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		info->fix.smem_len = vma->node.size;
 	}
 
-	vaddr = i915_vma_pin_iomap(vma);
+	vaddr = i915_vma_pin_iomap_unlocked(vma);
 	if (IS_ERR(vaddr)) {
-		drm_err(&dev_priv->drm,
-			"Failed to remap framebuffer into virtual memory\n");
+		if (vaddr != ERR_PTR(-EINTR) && vaddr != ERR_PTR(-ERESTARTSYS))
+			drm_err(&dev_priv->drm,
+				"Failed to remap framebuffer into virtual memory\n");
 		ret = PTR_ERR(vaddr);
 		goto out_unpin;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 7e3f5c6ca484..21593f3f2664 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1357,7 +1357,7 @@ static int get_registers(struct intel_overlay *overlay, bool use_phys)
 		overlay->flip_addr = sg_dma_address(obj->mm.pages->sgl);
 	else
 		overlay->flip_addr = i915_ggtt_offset(vma);
-	overlay->regs = i915_vma_pin_iomap(vma);
+	overlay->regs = i915_vma_pin_iomap_unlocked(vma);
 	i915_vma_unpin(vma);
 
 	if (IS_ERR(overlay->regs)) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index c4f684b7cc51..49c6e55c68ce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -418,6 +418,12 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	}
 
 	if (!ptr) {
+		err = i915_gem_object_wait_moving_fence(obj, true);
+		if (err) {
+			ptr = ERR_PTR(err);
+			goto err_unpin;
+		}
+
 		if (GEM_WARN_ON(type == I915_MAP_WC &&
 				!static_cpu_has(X86_FEATURE_PAT)))
 			ptr = ERR_PTR(-ENODEV);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index 13b088cc787e..067c512961ba 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -101,7 +101,7 @@ static int gtt_set(struct context *ctx, unsigned long offset, u32 v)
 
 	intel_gt_pm_get(vma->vm->gt);
 
-	map = i915_vma_pin_iomap(vma);
+	map = i915_vma_pin_iomap_unlocked(vma);
 	i915_vma_unpin(vma);
 	if (IS_ERR(map)) {
 		err = PTR_ERR(map);
@@ -134,7 +134,7 @@ static int gtt_get(struct context *ctx, unsigned long offset, u32 *v)
 
 	intel_gt_pm_get(vma->vm->gt);
 
-	map = i915_vma_pin_iomap(vma);
+	map = i915_vma_pin_iomap_unlocked(vma);
 	i915_vma_unpin(vma);
 	if (IS_ERR(map)) {
 		err = PTR_ERR(map);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 6d30cdfa80f3..b2627eab71ac 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -125,11 +125,12 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	n = page - view.partial.offset;
 	GEM_BUG_ON(n >= view.partial.size);
 
-	io = i915_vma_pin_iomap(vma);
+	io = i915_vma_pin_iomap_unlocked(vma);
 	i915_vma_unpin(vma);
 	if (IS_ERR(io)) {
-		pr_err("Failed to iomap partial view: offset=%lu; err=%d\n",
-		       page, (int)PTR_ERR(io));
+		if (io != ERR_PTR(-EINTR) && io != ERR_PTR(-ERESTARTSYS))
+			pr_err("Failed to iomap partial view: offset=%lu; err=%d\n",
+			       page, (int)PTR_ERR(io));
 		err = PTR_ERR(io);
 		goto out;
 	}
@@ -219,11 +220,12 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		n = page - view.partial.offset;
 		GEM_BUG_ON(n >= view.partial.size);
 
-		io = i915_vma_pin_iomap(vma);
+		io = i915_vma_pin_iomap_unlocked(vma);
 		i915_vma_unpin(vma);
 		if (IS_ERR(io)) {
-			pr_err("Failed to iomap partial view: offset=%lu; err=%d\n",
-			       page, (int)PTR_ERR(io));
+			if (io != ERR_PTR(-EINTR) && io != ERR_PTR(-ERESTARTSYS))
+				pr_err("Failed to iomap partial view: offset=%lu; err=%d\n",
+				       page, (int)PTR_ERR(io));
 			return PTR_ERR(io);
 		}
 
@@ -773,7 +775,7 @@ static int gtt_set(struct drm_i915_gem_object *obj)
 		return PTR_ERR(vma);
 
 	intel_gt_pm_get(vma->vm->gt);
-	map = i915_vma_pin_iomap(vma);
+	map = i915_vma_pin_iomap_unlocked(vma);
 	i915_vma_unpin(vma);
 	if (IS_ERR(map)) {
 		err = PTR_ERR(map);
@@ -799,7 +801,7 @@ static int gtt_check(struct drm_i915_gem_object *obj)
 		return PTR_ERR(vma);
 
 	intel_gt_pm_get(vma->vm->gt);
-	map = i915_vma_pin_iomap(vma);
+	map = i915_vma_pin_iomap_unlocked(vma);
 	i915_vma_unpin(vma);
 	if (IS_ERR(map)) {
 		err = PTR_ERR(map);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 8781c4f61952..120bae524425 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -431,6 +431,13 @@ int i915_vma_bind(struct i915_vma *vma,
 			work->pinned = i915_gem_object_get(vma->obj);
 		}
 	} else {
+		if (vma->obj) {
+			int ret;
+
+			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
+			if (ret)
+				return ret;
+		}
 		vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
 	}
 
@@ -455,6 +462,10 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 
 	ptr = READ_ONCE(vma->iomap);
 	if (ptr == NULL) {
+		err = i915_gem_object_wait_moving_fence(vma->obj, true);
+		if (err)
+			goto err;
+
 		/*
 		 * TODO: consider just using i915_gem_object_pin_map() for lmem
 		 * instead, which already supports mapping non-contiguous chunks
@@ -496,6 +507,25 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 	return IO_ERR_PTR(err);
 }
 
+void __iomem *i915_vma_pin_iomap_unlocked(struct i915_vma *vma)
+{
+	struct i915_gem_ww_ctx ww;
+	void __iomem *map;
+	int err;
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(vma->obj, &ww);
+		if (err)
+			continue;
+
+		map = i915_vma_pin_iomap(vma);
+	}
+	if (err)
+		map = IO_ERR_PTR(err);
+
+	return map;
+}
+
 void i915_vma_flush_writes(struct i915_vma *vma)
 {
 	if (i915_vma_unset_ggtt_write(vma))
@@ -870,6 +900,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		    u64 size, u64 alignment, u64 flags)
 {
 	struct i915_vma_work *work = NULL;
+	struct dma_fence *moving = NULL;
 	intel_wakeref_t wakeref = 0;
 	unsigned int bound;
 	int err;
@@ -895,7 +926,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (flags & PIN_GLOBAL)
 		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
 
-	if (flags & vma->vm->bind_async_flags) {
+	moving = i915_gem_object_get_moving_fence(vma->obj);
+	if (flags & vma->vm->bind_async_flags || moving) {
 		/* lock VM */
 		err = i915_vm_lock_objects(vma->vm, ww);
 		if (err)
@@ -909,6 +941,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 		work->vm = i915_vm_get(vma->vm);
 
+		dma_fence_work_chain(&work->base, moving);
+
 		/* Allocate enough page directories to used PTE */
 		if (vma->vm->allocate_va_range) {
 			err = i915_vm_alloc_pt_stash(vma->vm,
@@ -1013,7 +1047,10 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 err_rpm:
 	if (wakeref)
 		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
+	if (moving)
+		dma_fence_put(moving);
 	vma_put_pages(vma);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 648dbe744c96..1812b2904a31 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -326,6 +326,9 @@ static inline bool i915_node_color_differs(const struct drm_mm_node *node,
  * Returns a valid iomapped pointer or ERR_PTR.
  */
 void __iomem *i915_vma_pin_iomap(struct i915_vma *vma);
+
+void __iomem *i915_vma_pin_iomap_unlocked(struct i915_vma *vma);
+
 #define IO_ERR_PTR(x) ((void __iomem *)ERR_PTR(x))
 
 /**
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 1f10fe36619b..85f43b209890 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -1005,7 +1005,7 @@ static int igt_vma_remapped_gtt(void *arg)
 
 			GEM_BUG_ON(vma->ggtt_view.type != *t);
 
-			map = i915_vma_pin_iomap(vma);
+			map = i915_vma_pin_iomap_unlocked(vma);
 			i915_vma_unpin(vma);
 			if (IS_ERR(map)) {
 				err = PTR_ERR(map);
@@ -1036,7 +1036,7 @@ static int igt_vma_remapped_gtt(void *arg)
 
 			GEM_BUG_ON(vma->ggtt_view.type != I915_GGTT_VIEW_NORMAL);
 
-			map = i915_vma_pin_iomap(vma);
+			map = i915_vma_pin_iomap_unlocked(vma);
 			i915_vma_unpin(vma);
 			if (IS_ERR(map)) {
 				err = PTR_ERR(map);
-- 
2.31.1

