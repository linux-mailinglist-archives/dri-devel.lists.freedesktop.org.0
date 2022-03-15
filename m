Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F54DA1F5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786710E0D5;
	Tue, 15 Mar 2022 18:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1110E0D5;
 Tue, 15 Mar 2022 18:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 2BDFE1F4304E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367511;
 bh=RKwbPfrUW2qjlvc4CHjlXd82fd97XR2D3/aFyOO8Xrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XY3lKRkFtSaZHthLOjN22pfqLkKMy0lZu/zGu6zHMJEwd2hpO8/X4c4u00M/WbXnH
 hdNapswV9iaQ7czu/bz53i5jAfCZyVJRMqj7lq7wrY9xSASG38UPqP6Vc9gWroLKK3
 sgOFZoTOBoPFdEoXmBhLBslqF9dAOBBt//BWhfRtxNygLFjCkEczKYYguP/K3MZNGC
 AT6uDgQcMzvKagetM4S5gt4MYC6s45J9yRrkIpY5XYf8GhzR7spwX3noh7+UFmxU4D
 3H0ztlxwBPe1JytmaJViyO4EditSUTlTUx1wttMkGe43ha27PmNFXB7p6a3n0yZmY2
 TW9vpHUq/5RIQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 7/7] drm/i915: cleanup old stolen state
Date: Tue, 15 Mar 2022 18:04:44 +0000
Message-Id: <20220315180444.3327283-8-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315180444.3327283-1-bob.beckett@collabora.com>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

remove i915->mm.stolen
remove i915->mm.stolen_lock

they are no longer needed.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c   |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c |  2 --
 drivers/gpu/drm/i915/gt/selftest_reset.c   | 16 +++++++++-------
 drivers/gpu/drm/i915/i915_drv.h            |  5 -----
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 9df64ecab70e..644bb599eee6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -805,7 +805,7 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 err_llb:
 	i915_gem_object_put(fetch_and_zero(&fbc->compressed_llb));
 err:
-	if (drm_mm_initialized(&i915->mm.stolen))
+	if (IS_ERR(obj) && (PTR_ERR(obj) == -ENOMEM || PTR_ERR(obj) == -ENXIO))
 		drm_info_once(&i915->drm, "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);
 	return -ENOSPC;
 }
@@ -1708,7 +1708,7 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-	if (!drm_mm_initialized(&i915->mm.stolen))
+	if (!i915->mm.stolen_region)
 		mkwrite_device_info(i915)->display.fbc_mask = 0;
 
 	if (need_fbc_vtd_wa(i915))
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index e58f9902ef47..930521a84607 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -347,8 +347,6 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	resource_size_t reserved_base, stolen_top;
 	resource_size_t reserved_total, reserved_size;
 
-	mutex_init(&i915->mm.stolen_lock);
-
 	if (intel_vgpu_active(i915)) {
 		drm_notice(&i915->drm,
 			   "%s, disabling use of stolen memory\n",
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..ad2ecc582be2 100644
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
+						   PFN_PHYS(page), PFN_PHYS(page + 1) - 1);
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
+						   PFN_PHYS(page), PFN_PHYS(page + 1) - 1);
+		if (x != crc[page] && !busy) {
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7d622d1afe93..1f9fa2d6d198 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -247,11 +247,6 @@ struct i915_gem_mm {
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
-- 
2.25.1

