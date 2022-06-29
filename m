Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF155FF5E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279171139B4;
	Wed, 29 Jun 2022 12:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0D21134A9;
 Wed, 29 Jun 2022 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656504894; x=1688040894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xrXpTkl1tds//Iyc1Vj9DrMKuyDlPwg7elgiQKrnGo=;
 b=IZH8LoztRFK2gmRpFQJhCxHj/yCcF1gJMMM28DRaPHuoQ5wiJAX6XvyY
 Tbgyt/3yJqQ+k74R66Gjqe3s/3HD3R1z4sQg/Ax61l/GkmcqWb0zBaUXw
 5KVpD3IU3bftgubCaUMsD/9pgNplvOEbfEA77APBwOn8P12eA30cZ/bme
 JClTqGuk1xzD7+sybzCjkqbA0cQockP20kuDFSQwj0Pnon4SRGK5aRB8I
 o4sKCxFqN0oB10x5c3io9ht1s58hy0BMUSgV+Wq2Zx0Pj8TBWj2D5tF27
 ajKJ+QJbB3RfBzhEHJBdqi4QpEQq8yrNdPC3N2Ivlrz3X+ucPZK1jWtrw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262421370"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262421370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:14:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595215020"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:14:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 03/13] drm/i915/uapi: expose the avail tracking
Date: Wed, 29 Jun 2022 13:14:17 +0100
Message-Id: <20220629121427.353800-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629121427.353800-1-matthew.auld@intel.com>
References: <20220629121427.353800-1-matthew.auld@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vulkan would like to have a rough measure of how much device memory can
in theory be allocated. Also add unallocated_cpu_visible_size to track
the visible portion, in case the device is using small BAR. Also tweak
the locking so we nice consistent values for both the mm->avail and the
visible tracking.

v2: tweak the locking slightly so we update the mm->avail and visible
tracking as one atomic operation, such that userspace doesn't get
strange values when sampling the values.

Testcase: igt@i915_query@query-regions-unallocated
Testcase: igt@i915_query@query-regions-sanity-check
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_query.c             | 10 +++++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 31 ++++++++++++++-----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  3 ++
 drivers/gpu/drm/i915/intel_memory_region.c    | 14 +++++++++
 drivers/gpu/drm/i915/intel_memory_region.h    |  3 ++
 include/uapi/drm/i915_drm.h                   | 31 ++++++++++++++++++-
 6 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 9894add651dd..6ec9c9fb7b0d 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -504,7 +504,15 @@ static int query_memregion_info(struct drm_i915_private *i915,
 		else
 			info.probed_cpu_visible_size = mr->total;
 
-		info.unallocated_size = mr->avail;
+		if (perfmon_capable()) {
+			intel_memory_region_avail(mr,
+						  &info.unallocated_size,
+						  &info.unallocated_cpu_visible_size);
+		} else {
+			info.unallocated_size = info.probed_size;
+			info.unallocated_cpu_visible_size =
+				info.probed_cpu_visible_size;
+		}
 
 		if (__copy_to_user(info_ptr, &info, sizeof(info)))
 			return -EFAULT;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a5109548abc0..427de1aaab36 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -104,18 +104,15 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 				     min_page_size,
 				     &bman_res->blocks,
 				     bman_res->flags);
-	mutex_unlock(&bman->lock);
 	if (unlikely(err))
 		goto err_free_blocks;
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
 		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
 
-		mutex_lock(&bman->lock);
 		drm_buddy_block_trim(mm,
 				     original_size,
 				     &bman_res->blocks);
-		mutex_unlock(&bman->lock);
 	}
 
 	if (lpfn <= bman->visible_size) {
@@ -137,11 +134,10 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		}
 	}
 
-	if (bman_res->used_visible_size) {
-		mutex_lock(&bman->lock);
+	if (bman_res->used_visible_size)
 		bman->visible_avail -= bman_res->used_visible_size;
-		mutex_unlock(&bman->lock);
-	}
+
+	mutex_unlock(&bman->lock);
 
 	if (place->lpfn - place->fpfn == n_pages)
 		bman_res->base.start = place->fpfn;
@@ -154,7 +150,6 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	return 0;
 
 err_free_blocks:
-	mutex_lock(&bman->lock);
 	drm_buddy_free_list(mm, &bman_res->blocks);
 	mutex_unlock(&bman->lock);
 err_free_res:
@@ -365,6 +360,26 @@ u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager *man)
 	return bman->visible_size;
 }
 
+/**
+ * i915_ttm_buddy_man_avail - Query the avail tracking for the manager.
+ *
+ * @man: The buddy allocator ttm manager
+ * @avail: The total available memory in pages for the entire manager.
+ * @visible_avail: The total available memory in pages for the CPU visible
+ * portion. Note that this will always give the same value as @avail on
+ * configurations that don't have a small BAR.
+ */
+void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
+			      u64 *avail, u64 *visible_avail)
+{
+	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+
+	mutex_lock(&bman->lock);
+	*avail = bman->mm.avail >> PAGE_SHIFT;
+	*visible_avail = bman->visible_avail;
+	mutex_unlock(&bman->lock);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 void i915_ttm_buddy_man_force_visible_size(struct ttm_resource_manager *man,
 					   u64 size)
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index 52d9586d242c..d64620712830 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -61,6 +61,9 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 
 u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager *man);
 
+void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
+			      u64 *avail, u64 *avail_visible);
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 void i915_ttm_buddy_man_force_visible_size(struct ttm_resource_manager *man,
 					   u64 size);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index e38d2db1c3e3..94ee26e99549 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -279,6 +279,20 @@ void intel_memory_region_set_name(struct intel_memory_region *mem,
 	va_end(ap);
 }
 
+void intel_memory_region_avail(struct intel_memory_region *mr,
+			       u64 *avail, u64 *visible_avail)
+{
+	if (mr->type == INTEL_MEMORY_LOCAL) {
+		i915_ttm_buddy_man_avail(mr->region_private,
+					 avail, visible_avail);
+		*avail <<= PAGE_SHIFT;
+		*visible_avail <<= PAGE_SHIFT;
+	} else {
+		*avail = mr->total;
+		*visible_avail = mr->total;
+	}
+}
+
 void intel_memory_region_destroy(struct intel_memory_region *mem)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3d8378c1b447..2214f251bec3 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -127,6 +127,9 @@ int intel_memory_region_reserve(struct intel_memory_region *mem,
 void intel_memory_region_debug(struct intel_memory_region *mr,
 			       struct drm_printer *printer);
 
+void intel_memory_region_avail(struct intel_memory_region *mr,
+			       u64 *avail, u64 *visible_avail);
+
 struct intel_memory_region *
 i915_gem_ttm_system_setup(struct drm_i915_private *i915,
 			  u16 type, u16 instance);
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 7eacacb00373..e4847436bab8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3228,7 +3228,15 @@ struct drm_i915_memory_region_info {
 	 */
 	__u64 probed_size;
 
-	/** @unallocated_size: Estimate of memory remaining */
+	/**
+	 * @unallocated_size: Estimate of memory remaining
+	 *
+	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable accounting.
+	 * Without this (or if this is an older kernel) the value here will
+	 * always equal the @probed_size. Note this is only currently tracked
+	 * for I915_MEMORY_CLASS_DEVICE regions (for other types the value here
+	 * will always equal the @probed_size).
+	 */
 	__u64 unallocated_size;
 
 	union {
@@ -3262,6 +3270,27 @@ struct drm_i915_memory_region_info {
 			 * @probed_size.
 			 */
 			__u64 probed_cpu_visible_size;
+
+			/**
+			 * @unallocated_cpu_visible_size: Estimate of CPU
+			 * visible memory remaining.
+			 *
+			 * Note this is only tracked for
+			 * I915_MEMORY_CLASS_DEVICE regions (for other types the
+			 * value here will always equal the
+			 * @probed_cpu_visible_size).
+			 *
+			 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
+			 * accounting.  Without this the value here will always
+			 * equal the @probed_cpu_visible_size. Note this is only
+			 * currently tracked for I915_MEMORY_CLASS_DEVICE
+			 * regions (for other types the value here will also
+			 * always equal the @probed_cpu_visible_size).
+			 *
+			 * If this is an older kernel the value here will be
+			 * zero, see also @probed_cpu_visible_size.
+			 */
+			__u64 unallocated_cpu_visible_size;
 		};
 	};
 };
-- 
2.36.1

