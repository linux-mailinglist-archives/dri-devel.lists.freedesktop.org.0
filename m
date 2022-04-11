Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C874FC510
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 21:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DDD10E991;
	Mon, 11 Apr 2022 19:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B31E10E0EE;
 Mon, 11 Apr 2022 19:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 010061F43CB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649705112;
 bh=7WaEI4OzpgN35n/Q5nV4+2XZrYAKBkpBehXWOKkygu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=htp2uFmG+HkSeWmeJXHY67i2cg+Xk14bGsJY+VZk1CwAHT+iOfLPyTRU5q8Wq6dUu
 oz4ASb5apBYAKvF6F21Ws/Sv0p2I4JOWb73k/EtZaZhhhVnq1uS5/ytqIJkHwv5VIN
 oH9g4EIyefvzMNQng/26WzffySiyDKB6AOvhsqOSV8DMn3sw/6UPI2dYX/T74oIceV
 n5lyVwClVFZNIjpnkkBGlUdgRnIkSzhKwV9Ji7dKkoqCui1uWiXpcr+Z8Ybx5vFAO0
 GyiHdJgCulphH9GOmN2XjHgERMEzhmtCPsU1eUDed4/iu1tz3TzPvGCA5gvBKs9Fr8
 U37AF1yeuLJRw==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/5] drm/i915: stolen memory use ttm backend
Date: Mon, 11 Apr 2022 19:24:53 +0000
Message-Id: <20220411192453.1000147-6-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411192453.1000147-1-bob.beckett@collabora.com>
References: <20220411192453.1000147-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

refactor stolen memory region to use ttm.
this necessitates using ttm resources to track reserved stolen regions
instead of drm_mm_nodes.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c      |  78 ++--
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 405 +++++-------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   7 +
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  16 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   5 -
 drivers/gpu/drm/i915/intel_region_ttm.c       |  36 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   3 +-
 12 files changed, 232 insertions(+), 360 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b653f3ba7c66..dbad1b6471b8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -38,6 +38,7 @@
  * forcibly disable it to allow proper screen updates.
  */
 
+#include "gem/i915_gem_stolen.h"
 #include <linux/string_helpers.h>
 
 #include <drm/drm_fourcc.h>
@@ -51,6 +52,7 @@
 #include "intel_display_types.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
+#include "gem/i915_gem_region.h"
 
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
@@ -93,8 +95,8 @@ struct intel_fbc {
 	unsigned int possible_framebuffer_bits;
 	unsigned int busy_bits;
 
-	struct drm_mm_node compressed_fb;
-	struct drm_mm_node compressed_llb;
+	struct ttm_resource *compressed_fb;
+	struct ttm_resource *compressed_llb;
 
 	enum intel_fbc_id id;
 
@@ -332,16 +334,20 @@ static void i8xx_fbc_nuke(struct intel_fbc *fbc)
 static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
+	u64 fb_offset = i915_gem_stolen_reserve_offset(fbc->compressed_fb);
+	u64 llb_offset = i915_gem_stolen_reserve_offset(fbc->compressed_llb);
 
+	GEM_BUG_ON(fb_offset == I915_BO_INVALID_OFFSET);
+	GEM_BUG_ON(llb_offset == I915_BO_INVALID_OFFSET);
 	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
-					 fbc->compressed_fb.start, U32_MAX));
+					 fb_offset, U32_MAX));
 	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
-					 fbc->compressed_llb.start, U32_MAX));
+					 llb_offset, U32_MAX));
 
 	intel_de_write(i915, FBC_CFB_BASE,
-		       i915->dsm.start + fbc->compressed_fb.start);
+		       i915->dsm.start + fb_offset);
 	intel_de_write(i915, FBC_LL_BASE,
-		       i915->dsm.start + fbc->compressed_llb.start);
+		       i915->dsm.start + llb_offset);
 }
 
 static const struct intel_fbc_funcs i8xx_fbc_funcs = {
@@ -449,8 +455,10 @@ static bool g4x_fbc_is_compressing(struct intel_fbc *fbc)
 static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
+	u64 fb_offset = i915_gem_stolen_reserve_offset(fbc->compressed_fb);
 
-	intel_de_write(i915, DPFC_CB_BASE, fbc->compressed_fb.start);
+	GEM_BUG_ON(fb_offset == I915_BO_INVALID_OFFSET);
+	intel_de_write(i915, DPFC_CB_BASE, fb_offset);
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -500,8 +508,10 @@ static bool ilk_fbc_is_compressing(struct intel_fbc *fbc)
 static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
+	u64 fb_offset = i915_gem_stolen_reserve_offset(fbc->compressed_fb);
 
-	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id), fbc->compressed_fb.start);
+	GEM_BUG_ON(fb_offset == I915_BO_INVALID_OFFSET);
+	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id), fb_offset);
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -741,21 +751,24 @@ static int find_compression_limit(struct intel_fbc *fbc,
 {
 	struct drm_i915_private *i915 = fbc->i915;
 	u64 end = intel_fbc_stolen_end(i915);
-	int ret, limit = min_limit;
+	int limit = min_limit;
+	struct ttm_resource *res;
 
 	size /= limit;
 
 	/* Try to over-allocate to reduce reallocations and fragmentation. */
-	ret = i915_gem_stolen_insert_node_in_range(i915, &fbc->compressed_fb,
-						   size <<= 1, 4096, 0, end);
-	if (ret == 0)
+	res = i915_gem_stolen_reserve_range(i915, size <<= 1, 0, end);
+	if (!IS_ERR(res)) {
+		fbc->compressed_fb = res;
 		return limit;
+	}
 
 	for (; limit <= intel_fbc_max_limit(i915); limit <<= 1) {
-		ret = i915_gem_stolen_insert_node_in_range(i915, &fbc->compressed_fb,
-							   size >>= 1, 4096, 0, end);
-		if (ret == 0)
+		res = i915_gem_stolen_reserve_range(i915, size >>= 1, 0, end);
+		if (!IS_ERR(res)) {
+			fbc->compressed_fb = res;
 			return limit;
+		}
 	}
 
 	return 0;
@@ -766,17 +779,18 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 {
 	struct drm_i915_private *i915 = fbc->i915;
 	int ret;
+	struct ttm_resource *res;
 
-	drm_WARN_ON(&i915->drm,
-		    drm_mm_node_allocated(&fbc->compressed_fb));
-	drm_WARN_ON(&i915->drm,
-		    drm_mm_node_allocated(&fbc->compressed_llb));
+	drm_WARN_ON(&i915->drm, fbc->compressed_fb);
+	drm_WARN_ON(&i915->drm, fbc->compressed_llb);
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
-		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
-						  4096, 4096);
-		if (ret)
+		res = i915_gem_stolen_reserve_range(i915, 4096, I915_GEM_STOLEN_BIAS, 0);
+		if (IS_ERR(res)) {
+			ret = PTR_ERR(res);
 			goto err;
+		}
+		fbc->compressed_llb = res;
 	}
 
 	ret = find_compression_limit(fbc, size, min_limit);
@@ -790,15 +804,14 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    fbc->compressed_fb.size, fbc->limit);
+		    i915_gem_stolen_reserve_size(fbc->compressed_fb), fbc->limit);
 
 	return 0;
 
 err_llb:
-	if (drm_mm_node_allocated(&fbc->compressed_llb))
-		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
+	i915_gem_stolen_release_range(i915, fetch_and_zero(&fbc->compressed_llb));
 err:
-	if (drm_mm_initialized(&i915->mm.stolen))
+	if (IS_ERR(res) && (PTR_ERR(res) == -ENOMEM || PTR_ERR(res) == -ENXIO))
 		drm_info_once(&i915->drm, "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);
 	return -ENOSPC;
 }
@@ -815,10 +828,10 @@ static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (drm_mm_node_allocated(&fbc->compressed_llb))
-		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (drm_mm_node_allocated(&fbc->compressed_fb))
-		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
+	if (fbc->compressed_llb)
+		i915_gem_stolen_release_range(i915, fetch_and_zero(&fbc->compressed_llb));
+	if (fbc->compressed_fb)
+		i915_gem_stolen_release_range(i915, fetch_and_zero(&fbc->compressed_fb));
 }
 
 void intel_fbc_cleanup(struct drm_i915_private *i915)
@@ -1022,9 +1035,10 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct intel_fbc *fbc = plane->fbc;
+	u64 fb_size = i915_gem_stolen_reserve_size(fbc->compressed_fb);
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
-		intel_fbc_cfb_size(plane_state) <= fbc->compressed_fb.size * fbc->limit;
+		intel_fbc_cfb_size(plane_state) <= fb_size * fbc->limit;
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
@@ -1703,7 +1717,7 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-	if (!drm_mm_initialized(&i915->mm.stolen))
+	if (!i915->mm.stolen_region)
 		mkwrite_device_info(i915)->display.fbc_mask = 0;
 
 	if (need_fbc_vtd_wa(i915))
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 2c88bdb8ff7c..492600907e99 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -629,8 +629,6 @@ struct drm_i915_gem_object {
 		} userptr;
 #endif
 
-		struct drm_mm_node *stolen;
-
 		resource_size_t bo_offset;
 
 		unsigned long scratch;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 47b5e0e342ab..b379f7208687 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -4,75 +4,101 @@
  * Copyright © 2008-2012 Intel Corporation
  */
 
+#include "drm/ttm/ttm_placement.h"
+#include "gem/i915_gem_object_types.h"
 #include <linux/errno.h>
 #include <linux/mutex.h>
 
-#include <drm/drm_mm.h>
 #include <drm/i915_drm.h>
 
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_region_lmem.h"
+#include "gem/i915_gem_ttm.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
 #include "intel_mchbar_regs.h"
-
-/*
- * The BIOS typically reserves some of the system's memory for the exclusive
- * use of the integrated graphics. This memory is no longer available for
- * use by the OS and so the user finds that his system has less memory
- * available than he put in. We refer to this memory as stolen.
+#include "intel_region_ttm.h"
+
+/**
+ * i915_gem_stolen_reserve_range - reserve a region of space in a given range
+ * @i915: i915 device instance
+ * @size: size of region to reserve
+ * @start: start of search area
+ * @end: end of search area
  *
- * The BIOS will allocate its framebuffer from the stolen memory. Our
- * goal is try to reuse that object for our own fbcon which must always
- * be available for panics. Anything else we can reuse the stolen memory
- * for is a boon.
+ * Search for @size amount of free space within the region delimeted by @start and @end.
+ * If found reserve it from future use until later release with @i915_gem_stolen_release_range.
+ *
+ * Return: pointer to resource tracking structure on success, ERR_PTR otherwise
  */
-
-int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *i915,
-					 struct drm_mm_node *node, u64 size,
-					 unsigned alignment, u64 start, u64 end)
+struct ttm_resource *
+i915_gem_stolen_reserve_range(struct drm_i915_private *i915,
+			      resource_size_t size,
+			      u64 start, u64 end)
 {
-	int ret;
+	struct intel_memory_region *mem = i915->mm.stolen_region;
 
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return -ENODEV;
-
-	/* WaSkipStolenMemoryFirstPage:bdw+ */
-	if (GRAPHICS_VER(i915) >= 8 && start < 4096)
-		start = 4096;
-
-	mutex_lock(&i915->mm.stolen_lock);
-	ret = drm_mm_insert_node_in_range(&i915->mm.stolen, node,
-					  size, alignment, 0,
-					  start, end, DRM_MM_INSERT_BEST);
-	mutex_unlock(&i915->mm.stolen_lock);
+	if (!mem)
+		return ERR_PTR(-ENODEV);
+	return intel_region_ttm_resource_alloc(mem, size, start, end, I915_BO_ALLOC_CONTIGUOUS);
+}
 
-	return ret;
+/**
+ * i915_gem_stolen_reserve_offset - return the offset of the reserved space
+ * @res: pointer to resource tracking structure to check
+ *
+ * Return: The offset of the reserved resource, or I915_BO_INVALID_OFFSET on error
+ */
+u64 i915_gem_stolen_reserve_offset(struct ttm_resource *res)
+{
+	if (!res)
+		return I915_BO_INVALID_OFFSET;
+	return PFN_PHYS(res->start);
 }
 
-int i915_gem_stolen_insert_node(struct drm_i915_private *i915,
-				struct drm_mm_node *node, u64 size,
-				unsigned alignment)
+/**
+ * i915_gem_stolen_reserve_size - return the reserved size of the reserved space
+ * @res: pointer to resource tracking structure to check
+ *
+ * Return: The size of the reserved resource, or I915_BO_INVALID_OFFSET on error
+ */
+u64 i915_gem_stolen_reserve_size(struct ttm_resource *res)
 {
-	return i915_gem_stolen_insert_node_in_range(i915, node,
-						    size, alignment,
-						    I915_GEM_STOLEN_BIAS,
-						    U64_MAX);
+	if (!res)
+		return I915_BO_INVALID_OFFSET;
+	return PFN_PHYS(res->num_pages);
 }
 
-void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
-				 struct drm_mm_node *node)
+/**
+ * i915_gem_stolen_release_range - release the reserved area to be free for allocation again
+ * @i915: i915 device instance
+ * @res: pointer to resource tracking structure allocated via @i915_gem_stolen_reserve_range
+ */
+void i915_gem_stolen_release_range(struct drm_i915_private *i915,
+				   struct ttm_resource *res)
 {
-	mutex_lock(&i915->mm.stolen_lock);
-	drm_mm_remove_node(node);
-	mutex_unlock(&i915->mm.stolen_lock);
+	struct intel_memory_region *mem = i915->mm.stolen_region;
+
+	intel_region_ttm_resource_free(mem, res);
 }
 
+/*
+ * The BIOS typically reserves some of the system's memory for the exclusive
+ * use of the integrated graphics. This memory is no longer available for
+ * use by the OS and so the user finds that his system has less memory
+ * available than he put in. We refer to this memory as stolen.
+ *
+ * The BIOS will allocate its framebuffer from the stolen memory. Our
+ * goal is try to reuse that object for our own fbcon which must always
+ * be available for panics. Anything else we can reuse the stolen memory
+ * for is a boon.
+ */
+
 static int i915_adjust_stolen(struct drm_i915_private *i915,
 			      struct resource *dsm)
 {
@@ -173,14 +199,6 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 	return 0;
 }
 
-static void i915_gem_cleanup_stolen(struct drm_i915_private *i915)
-{
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return;
-
-	drm_mm_takedown(&i915->mm.stolen);
-}
-
 static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 				    struct intel_uncore *uncore,
 				    resource_size_t *base,
@@ -395,8 +413,6 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	resource_size_t reserved_base, stolen_top;
 	resource_size_t reserved_total, reserved_size;
 
-	mutex_init(&i915->mm.stolen_lock);
-
 	if (intel_vgpu_active(i915)) {
 		drm_notice(&i915->drm,
 			   "%s, disabling use of stolen memory\n",
@@ -513,237 +529,25 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		return 0;
 
 	/* Basic memrange allocator for stolen space. */
-	drm_mm_init(&i915->mm.stolen, 0, i915->stolen_usable_size);
-
-	return 0;
+	return intel_region_ttm_init(mem);
 }
 
-static void dbg_poison(struct i915_ggtt *ggtt,
-		       dma_addr_t addr, resource_size_t size,
-		       u8 x)
-{
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
-	if (!drm_mm_node_allocated(&ggtt->error_capture))
-		return;
-
-	if (ggtt->vm.bind_async_flags & I915_VMA_GLOBAL_BIND)
-		return; /* beware stop_machine() inversion */
-
-	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
-
-	mutex_lock(&ggtt->error_mutex);
-	while (size) {
-		void __iomem *s;
-
-		ggtt->vm.insert_page(&ggtt->vm, addr,
-				     ggtt->error_capture.start,
-				     I915_CACHE_NONE, 0);
-		mb();
-
-		s = io_mapping_map_wc(&ggtt->iomap,
-				      ggtt->error_capture.start,
-				      PAGE_SIZE);
-		memset_io(s, x, PAGE_SIZE);
-		io_mapping_unmap(s);
-
-		addr += PAGE_SIZE;
-		size -= PAGE_SIZE;
-	}
-	mb();
-	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
-	mutex_unlock(&ggtt->error_mutex);
-#endif
-}
-
-static struct sg_table *
-i915_pages_create_for_stolen(struct drm_device *dev,
-			     resource_size_t offset, resource_size_t size)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-	struct sg_table *st;
-	struct scatterlist *sg;
-
-	GEM_BUG_ON(range_overflows(offset, size, resource_size(&i915->dsm)));
-
-	/* We hide that we have no struct page backing our stolen object
-	 * by wrapping the contiguous physical allocation with a fake
-	 * dma mapping in a single scatterlist.
-	 */
-
-	st = kmalloc(sizeof(*st), GFP_KERNEL);
-	if (st == NULL)
-		return ERR_PTR(-ENOMEM);
-
-	if (sg_alloc_table(st, 1, GFP_KERNEL)) {
-		kfree(st);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	sg = st->sgl;
-	sg->offset = 0;
-	sg->length = size;
-
-	sg_dma_address(sg) = (dma_addr_t)i915->dsm.start + offset;
-	sg_dma_len(sg) = size;
-
-	return st;
-}
-
-static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct sg_table *pages =
-		i915_pages_create_for_stolen(obj->base.dev,
-					     obj->stolen->start,
-					     obj->stolen->size);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
-
-	dbg_poison(to_gt(i915)->ggtt,
-		   sg_dma_address(pages->sgl),
-		   sg_dma_len(pages->sgl),
-		   POISON_INUSE);
-
-	__i915_gem_object_set_pages(obj, pages, obj->stolen->size);
-
-	return 0;
-}
-
-static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
-					     struct sg_table *pages)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	/* Should only be called from i915_gem_object_release_stolen() */
-
-	dbg_poison(to_gt(i915)->ggtt,
-		   sg_dma_address(pages->sgl),
-		   sg_dma_len(pages->sgl),
-		   POISON_FREE);
-
-	sg_free_table(pages);
-	kfree(pages);
-}
-
-static void
-i915_gem_object_release_stolen(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct drm_mm_node *stolen = fetch_and_zero(&obj->stolen);
-
-	GEM_BUG_ON(!stolen);
-	i915_gem_stolen_remove_node(i915, stolen);
-	kfree(stolen);
-
-	i915_gem_object_release_memory_region(obj);
-}
-
-static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
-	.name = "i915_gem_object_stolen",
-	.get_pages = i915_gem_object_get_pages_stolen,
-	.put_pages = i915_gem_object_put_pages_stolen,
-	.release = i915_gem_object_release_stolen,
-};
-
-static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
-					   struct drm_i915_gem_object *obj,
-					   struct drm_mm_node *stolen)
-{
-	static struct lock_class_key lock_class;
-	unsigned int cache_level;
-	unsigned int flags;
-	int err;
-
-	/*
-	 * Stolen objects are always physically contiguous since we just
-	 * allocate one big block underneath using the drm_mm range allocator.
-	 */
-	flags = I915_BO_ALLOC_CONTIGUOUS;
-
-	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
-	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
-
-	obj->stolen = stolen;
-	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
-	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
-
-	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
-		return -EBUSY;
-
-	i915_gem_object_init_memory_region(obj, mem);
-
-	err = i915_gem_object_pin_pages(obj);
-	if (err)
-		i915_gem_object_release_memory_region(obj);
-	i915_gem_object_unlock(obj);
-
-	return err;
-}
-
-static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
-					struct drm_i915_gem_object *obj,
-					resource_size_t offset,
-					resource_size_t size,
-					resource_size_t page_size,
-					unsigned int flags)
+struct drm_i915_gem_object *
+i915_gem_object_create_stolen(struct drm_i915_private *i915,
+			      resource_size_t size)
 {
-	struct drm_i915_private *i915 = mem->i915;
-	struct drm_mm_node *stolen;
+	struct drm_i915_gem_object *obj;
 	int ret;
 
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return -ENODEV;
-
-	if (size == 0)
-		return -EINVAL;
-
-	/*
-	 * With discrete devices, where we lack a mappable aperture there is no
-	 * possible way to ever access this memory on the CPU side.
-	 */
-	if (mem->type == INTEL_MEMORY_STOLEN_LOCAL && !mem->io_size &&
-	    !(flags & I915_BO_ALLOC_GPU_ONLY))
-		return -ENOSPC;
-
-	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
-	if (!stolen)
-		return -ENOMEM;
-
-	if (offset != I915_BO_INVALID_OFFSET) {
-		drm_dbg(&i915->drm,
-			"creating preallocated stolen object: stolen_offset=%pa, size=%pa\n",
-			&offset, &size);
-
-		stolen->start = offset;
-		stolen->size = size;
-		mutex_lock(&i915->mm.stolen_lock);
-		ret = drm_mm_reserve_node(&i915->mm.stolen, stolen);
-		mutex_unlock(&i915->mm.stolen_lock);
-	} else {
-		ret = i915_gem_stolen_insert_node(i915, stolen, size,
-						  mem->min_page_size);
+	obj = i915_gem_object_create_region(i915->mm.stolen_region, size, 0,
+					    I915_BO_ALLOC_CONTIGUOUS);
+	ret = i915_gem_object_pin_pages_unlocked(obj);
+	if (ret) {
+		i915_gem_object_put(obj);
+		return ERR_PTR(ret);
 	}
-	if (ret)
-		goto err_free;
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
-	if (ret)
-		goto err_remove;
-
-	return 0;
-
-err_remove:
-	i915_gem_stolen_remove_node(i915, stolen);
-err_free:
-	kfree(stolen);
-	return ret;
-}
-
-struct drm_i915_gem_object *
-i915_gem_object_create_stolen(struct drm_i915_private *i915,
-			      resource_size_t size)
-{
-	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0, 0);
+	return obj;
 }
 
 static int init_stolen_smem(struct intel_memory_region *mem)
@@ -755,16 +559,10 @@ static int init_stolen_smem(struct intel_memory_region *mem)
 	return i915_gem_init_stolen(mem);
 }
 
-static int release_stolen_smem(struct intel_memory_region *mem)
-{
-	i915_gem_cleanup_stolen(mem->i915);
-	return 0;
-}
-
 static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
 	.init = init_stolen_smem,
-	.release = release_stolen_smem,
-	.init_object = _i915_gem_object_stolen_init,
+	.release = intel_region_ttm_fini,
+	.init_object = __i915_gem_ttm_object_init,
 };
 
 static int init_stolen_lmem(struct intel_memory_region *mem)
@@ -793,7 +591,7 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 	return 0;
 
 err_cleanup:
-	i915_gem_cleanup_stolen(mem->i915);
+	intel_region_ttm_fini(mem);
 	return err;
 }
 
@@ -801,14 +599,13 @@ static int release_stolen_lmem(struct intel_memory_region *mem)
 {
 	if (mem->io_size)
 		io_mapping_fini(&mem->iomap);
-	i915_gem_cleanup_stolen(mem->i915);
-	return 0;
+	return intel_region_ttm_fini(mem);
 }
 
 static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
 	.init = init_stolen_lmem,
 	.release = release_stolen_lmem,
-	.init_object = _i915_gem_object_stolen_init,
+	.init_object = __i915_gem_ttm_object_init,
 };
 
 struct intel_memory_region *
@@ -896,7 +693,37 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 	return mem;
 }
 
-bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj)
+/**
+ * i915_gem_object_stolen_offset - return offset from start of stolen region
+ * @obj: the object to return the offset of
+ *
+ * Get the offset from stolen region if this object is currently placed in stolen memory.
+ *
+ * Return: offset from stolen if successful, I915_BO_INVALID_OFFSET otherwise
+ */
+u64 i915_gem_object_stolen_offset(struct drm_i915_gem_object *obj)
 {
-	return obj->ops == &i915_gem_object_stolen_ops;
+	struct ttm_buffer_object *ttm_obj;
+
+	if (!obj || !i915_gem_object_is_stolen(obj))
+		return I915_BO_INVALID_OFFSET;
+
+	ttm_obj = i915_gem_to_ttm(obj);
+	if (ttm_obj->resource->mem_type != I915_PL_STOLEN)
+		return I915_BO_INVALID_OFFSET;
+
+	return PFN_PHYS(ttm_obj->resource->start);
+}
+
+bool i915_gem_object_is_stolen(struct drm_i915_gem_object *obj)
+{
+	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
+
+#ifdef CONFIG_LOCKDEP
+	if (i915_gem_object_migratable(obj) &&
+	    i915_gem_object_evictable(obj))
+		assert_object_held(obj);
+#endif
+	return mr && (mr->type == INTEL_MEMORY_STOLEN_SYSTEM ||
+		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index d5005a39d130..b39cb6e6c768 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -10,17 +10,9 @@
 
 struct drm_i915_private;
 struct drm_mm_node;
+struct ttm_resource;
 struct drm_i915_gem_object;
 
-int i915_gem_stolen_insert_node(struct drm_i915_private *dev_priv,
-				struct drm_mm_node *node, u64 size,
-				unsigned alignment);
-int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *dev_priv,
-					 struct drm_mm_node *node, u64 size,
-					 unsigned alignment, u64 start,
-					 u64 end);
-void i915_gem_stolen_remove_node(struct drm_i915_private *dev_priv,
-				 struct drm_mm_node *node);
 struct intel_memory_region *
 i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 			   u16 instance);
@@ -32,7 +24,16 @@ struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *dev_priv,
 			      resource_size_t size);
 
-bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj);
+u64 i915_gem_object_stolen_offset(struct drm_i915_gem_object *obj);
+bool i915_gem_object_is_stolen(struct drm_i915_gem_object *obj);
+struct ttm_resource *
+i915_gem_stolen_reserve_range(struct drm_i915_private *i915,
+			      resource_size_t size,
+			      u64 start, u64 end);
+u64 i915_gem_stolen_reserve_offset(struct ttm_resource *res);
+u64 i915_gem_stolen_reserve_size(struct ttm_resource *res);
+void i915_gem_stolen_release_range(struct drm_i915_private *i915,
+				   struct ttm_resource *res);
 
 #define I915_GEM_STOLEN_BIAS SZ_128K
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 73e371aa3850..81654a51df51 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -49,6 +49,13 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       resource_size_t size,
 			       resource_size_t page_size,
 			       unsigned int flags);
+int i915_gem_ttm_object_init_in_place(struct intel_memory_region *mem,
+				      struct drm_i915_gem_object *obj,
+				      resource_size_t size,
+				      resource_size_t page_size,
+				      unsigned int flags,
+				      u64 start,
+				      u64 end);
 
 /* Internal I915 TTM declarations and definitions below. */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index b4770690e794..269b7f467fdf 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -355,9 +355,9 @@ static int vlv_rc6_init(struct intel_rc6 *rc6)
 
 	GEM_BUG_ON(range_overflows_end_t(u64,
 					 i915->dsm.start,
-					 pctx->stolen->start,
+					 i915_gem_object_stolen_offset(pctx),
 					 U32_MAX));
-	pctx_paddr = i915->dsm.start + pctx->stolen->start;
+	pctx_paddr = i915->dsm.start + i915_gem_object_stolen_offset(pctx);
 	intel_uncore_write(uncore, VLV_PCBR, pctx_paddr);
 
 out:
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..75bc7d90c9dc 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -6,6 +6,7 @@
 #include <linux/crc32.h>
 
 #include "gem/i915_gem_stolen.h"
+#include "intel_region_ttm.h"
 
 #include "i915_memcpy.h"
 #include "i915_selftest.h"
@@ -83,6 +84,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
 		void *in;
+		bool busy;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
 				     ggtt->error_capture.start,
@@ -93,9 +95,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1))
+		busy = intel_region_ttm_range_busy(gt->i915->mm.stolen_region,
+						   PFN_PHYS(page), PAGE_SIZE);
+		if (!busy)
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
 		in = (void __force *)s;
@@ -124,6 +126,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 		void __iomem *s;
 		void *in;
 		u32 x;
+		bool busy;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
 				     ggtt->error_capture.start,
@@ -139,10 +142,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 			in = tmp;
 		x = crc32_le(0, in, PAGE_SIZE);
 
-		if (x != crc[page] &&
-		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1)) {
+		busy = intel_region_ttm_range_busy(gt->i915->mm.stolen_region,
+						   PFN_PHYS(page), PAGE_SIZE);
+		if (x != crc[page] && !busy) {
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 94e5c29d2ee3..e538b8f71dcc 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -32,6 +32,7 @@
 
 #include <drm/drm_debugfs.h>
 
+#include "gem/i915_gem_region.h"
 #include "gem/i915_gem_context.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_buffer_pool.h"
@@ -157,6 +158,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
 	struct i915_vma *vma;
 	int pin_count = 0;
+	u64 offset;
 
 	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
 		   &obj->base,
@@ -241,8 +243,9 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 	spin_unlock(&obj->vma.lock);
 
 	seq_printf(m, " (pinned x %d)", pin_count);
-	if (i915_gem_object_is_stolen(obj))
-		seq_printf(m, " (stolen: %08llx)", obj->stolen->start);
+	offset = i915_gem_object_stolen_offset(obj);
+	if (offset != I915_BO_INVALID_OFFSET)
+		seq_printf(m, " (stolen: %08llx)", offset);
 	if (i915_gem_object_is_framebuffer(obj))
 		seq_printf(m, " (fb)");
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 06e7c2802c5e..d05cf2fc3ef6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -231,11 +231,6 @@ struct i915_gem_mm {
 	 * support stolen.
 	 */
 	struct intel_memory_region *stolen_region;
-	/** Memory allocator for GTT stolen memory */
-	struct drm_mm stolen;
-	/** Protects the usage of the GTT stolen memory allocator. This is
-	 * always the inner lock when overlapping with struct_mutex. */
-	struct mutex stolen_lock;
 
 	/* Protects bound_list/unbound_list and #drm_i915_gem_object.mm.link */
 	spinlock_t obj_lock;
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 7d49ea72e33f..4450b4897d59 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -189,11 +189,12 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 	}
 }
 
-#ifdef CONFIG_DRM_I915_SELFTEST
 /**
  * intel_region_ttm_resource_alloc - Allocate memory resources from a region
  * @mem: The memory region,
  * @size: The requested size in bytes
+ * @start: start of allowed range
+ * @end: end of allowed range
  * @flags: Allocation flags
  *
  * This functionality is provided only for callers that need to allocate
@@ -207,8 +208,9 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
  */
 struct ttm_resource *
 intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
-				resource_size_t offset,
 				resource_size_t size,
+				u64 start,
+				u64 end,
 				unsigned int flags)
 {
 	struct ttm_resource_manager *man = mem->region_private;
@@ -219,9 +221,9 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
-	if (offset != I915_BO_INVALID_OFFSET) {
-		place.fpfn = offset >> PAGE_SHIFT;
-		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
+	if (start || end) {
+		place.fpfn = PFN_DOWN(start);
+		place.lpfn = PFN_UP(end);
 	} else if (mem->io_size && mem->io_size < mem->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
@@ -242,8 +244,6 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	return ret ? ERR_PTR(ret) : res;
 }
 
-#endif
-
 /**
  * intel_region_ttm_resource_free - Free a resource allocated from a resource manager
  * @mem: The region the resource was allocated from.
@@ -261,3 +261,25 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
 
 	man->func->free(man, res);
 }
+
+/**
+ * intel_region_ttm_range_busy - check whether range has any allocations
+ * @mem: The region to check
+ * @start: the start of the range to check
+ * @size: size of the range to check
+ *
+ * Return: true if something is alloceted within the region, false otherwise.
+ */
+bool intel_region_ttm_range_busy(struct intel_memory_region *mem,
+				 u64 start, u64 size)
+{
+	struct ttm_resource *dummy;
+
+	dummy = intel_region_ttm_resource_alloc(mem, size, start, start + size,
+						I915_BO_ALLOC_CONTIGUOUS);
+	if (IS_ERR(dummy))
+		return true;
+
+	intel_region_ttm_resource_free(mem, dummy);
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index cf9d86dcf409..1e88472fb2ea 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -29,15 +29,17 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 void intel_region_ttm_resource_free(struct intel_memory_region *mem,
 				    struct ttm_resource *res);
 
+bool intel_region_ttm_range_busy(struct intel_memory_region *mem,
+				 u64 start, u64 size);
+
 int intel_region_to_ttm_type(const struct intel_memory_region *mem);
 
 struct ttm_device_funcs *i915_ttm_driver(void);
 
-#ifdef CONFIG_DRM_I915_SELFTEST
 struct ttm_resource *
 intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
-				resource_size_t offset,
 				resource_size_t size,
+				u64 start,
+				u64 end,
 				unsigned int flags);
-#endif
 #endif /* _INTEL_REGION_TTM_H_ */
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 670557ce1024..15be2440cdb8 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -26,8 +26,9 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 	int err;
 
 	obj->mm.res = intel_region_ttm_resource_alloc(obj->mm.region,
-						      obj->bo_offset,
 						      obj->base.size,
+						      obj->bo_offset,
+						      obj->bo_offset + obj->base.size,
 						      obj->flags);
 	if (IS_ERR(obj->mm.res))
 		return PTR_ERR(obj->mm.res);
-- 
2.25.1

