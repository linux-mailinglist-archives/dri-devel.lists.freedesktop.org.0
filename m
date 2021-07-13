Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3C3C6EDD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 12:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918886E072;
	Tue, 13 Jul 2021 10:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02D897C5;
 Tue, 13 Jul 2021 10:47:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197325320"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="197325320"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="503054371"
Received: from ewaterla-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915: document caching related bits
Date: Tue, 13 Jul 2021 11:45:50 +0100
Message-Id: <20210713104554.2381406-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to document the object caching related bits, like cache_coherent and
cache_dirty.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 135 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_drv.h               |   9 --
 2 files changed, 131 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index ef3de2ae9723..02c3529b774c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -92,6 +92,57 @@ struct drm_i915_gem_object_ops {
 	const char *name; /* friendly name for debug, e.g. lockdep classes */
 };
 
+/**
+ * enum i915_cache_level - The supported GTT caching values for system memory
+ * pages.
+ *
+ * These translate to some special GTT PTE bits when binding pages into some
+ * address space. It also determines whether an object, or rather its pages are
+ * coherent with the GPU, when also reading or writing through the CPU cache
+ * with those pages.
+ *
+ * Userspace can also control this through struct drm_i915_gem_caching.
+ */
+enum i915_cache_level {
+	/**
+	 * @I915_CACHE_NONE:
+	 *
+	 * Not coherent with the CPU cache. If the cache is dirty and we need
+	 * the underlying pages to be coherent with some later GPU access then
+	 * we need to manually flush the pages.
+	 *
+	 * Note that on shared-LLC platforms reads through the CPU cache are
+	 * still coherent even with this setting. See also
+	 * I915_BO_CACHE_COHERENT_FOR_READ for more details.
+	 */
+	I915_CACHE_NONE = 0,
+	/**
+	 * @I915_CACHE_LLC:
+	 *
+	 * Coherent with the CPU cache. If the cache is dirty, then the GPU will
+	 * ensure that access remains coherent, when both reading and writing
+	 * through the CPU cache.
+	 *
+	 * Applies to both platforms with shared-LLC(HAS_LLC), and snooping
+	 * based platforms(HAS_SNOOP).
+	 */
+	I915_CACHE_LLC,
+	/**
+	 * @I915_CACHE_L3_LLC:
+	 *
+	 * gen7+, L3 sits between the domain specifc caches, eg sampler/render
+	 * caches, and the large Last-Level-Cache. LLC is coherent with the CPU,
+	 * but L3 is only visible to the GPU.
+	 */
+	I915_CACHE_L3_LLC,
+	/**
+	 * @I915_CACHE_WT:
+	 *
+	 * hsw:gt3e Write-through for scanout buffers.
+	 */
+	I915_CACHE_WT,
+};
+
 enum i915_map_type {
 	I915_MAP_WB = 0,
 	I915_MAP_WC,
@@ -228,14 +279,90 @@ struct drm_i915_gem_object {
 	unsigned int mem_flags;
 #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages */
 #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
-	/*
-	 * Is the object to be mapped as read-only to the GPU
-	 * Only honoured if hardware has relevant pte bit
+	/**
+	 * @cache_level: The desired GTT caching level.
+	 *
+	 * See enum i915_cache_level for possible values, along with what
+	 * each does.
 	 */
 	unsigned int cache_level:3;
-	unsigned int cache_coherent:2;
+	/**
+	 * @cache_coherent:
+	 *
+	 * Track whether the pages are coherent with the GPU if reading or
+	 * writing through the CPU cache.
+	 *
+	 * This largely depends on the @cache_level, for example if the object
+	 * is marked as I915_CACHE_LLC, then GPU access is coherent for both
+	 * reads and writes through the CPU cache.
+	 *
+	 * Note that on platforms with shared-LLC support(HAS_LLC) reads through
+	 * the CPU cache are always coherent, regardless of the @cache_level. On
+	 * snooping based platforms this is not the case, unless the full
+	 * I915_CACHE_LLC or similar setting is used.
+	 *
+	 * As a result of this we need to track coherency separately for reads
+	 * and writes, in order to avoid superfluous flushing on shared-LLC
+	 * platforms, for reads.
+	 *
+	 * I915_BO_CACHE_COHERENT_FOR_READ:
+	 *
+	 * When reading through the CPU cache, the GPU is still coherent. Note
+	 * that no data has actually been modified here, so it might seem
+	 * strange that we care about this.
+	 *
+	 * As an example, if some object is mapped on the CPU with write-back
+	 * caching, and we read some page, then the cache likely now contains
+	 * the data from that read. At this point the cache and main memory
+	 * match up, so all good. But next the GPU needs to write some data to
+	 * that same page. Now if the @cache_level is I915_CACHE_NONE and the
+	 * the platform doesn't have the shared-LLC, then the GPU will
+	 * effectively skip invalidating the cache(or however that works
+	 * internally) when writing the new value.  This is really bad since the
+	 * GPU has just written some new data to main memory, but the CPU cache
+	 * is still valid and now contains stale data. As a result the next time
+	 * we do a cached read with the CPU, we are rewarded with stale data.
+	 * Likewise if the cache is later flushed, we might be rewarded with
+	 * overwriting main memory with stale data.
+	 *
+	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
+	 *
+	 * When writing through the CPU cache, the GPU is still coherent. Note
+	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
+	 *
+	 * This is never set when I915_CACHE_NONE is used for @cache_level,
+	 * where instead we have to manually flush the caches after writing
+	 * through the CPU cache. For other cache levels this should be set and
+	 * the object is therefore considered coherent for both reads and writes
+	 * through the CPU cache.
+	 */
 #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
 #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
+	unsigned int cache_coherent:2;
+	/**
+	 * @cache_dirty:
+	 *
+	 * Track if the cache might be dirty for the @pages i.e it has yet to be
+	 * written back to main memory. As a result reading directly from main
+	 * memory might yield stale data.
+	 *
+	 * This also ties into whether the kernel is tracking the object as
+	 * coherent with the GPU, as per @cache_coherent, as it determines if
+	 * flushing might be needed at various points.
+	 *
+	 * Another part of @cache_dirty is managing flushing when first
+	 * acquiring the pages for system memory, at this point the pages are
+	 * considered foreign, so the default assumption is that the cache is
+	 * dirty, for example the page zeroing done my the kernel might leave
+	 * writes though the CPU cache, or swapping-in, while the actual data in
+	 * main memory is potentially stale.  Note that this is a potential
+	 * security issue when dealing with userspace objects and zeroing. Now,
+	 * whether we actually need apply the big sledgehammer of flushing all
+	 * the pages on acquire depends on if @cache_coherent is marked as
+	 * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coherent
+	 * for both reads and writes though the CPU cache. So pretty much this
+	 * should only be needed for I915_CACHE_NONE objects.
+	 */
 	unsigned int cache_dirty:1;
 
 	/**
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c4747f4407ef..37bb1a3cadd4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -394,15 +394,6 @@ struct drm_i915_display_funcs {
 	void (*read_luts)(struct intel_crtc_state *crtc_state);
 };
 
-enum i915_cache_level {
-	I915_CACHE_NONE = 0,
-	I915_CACHE_LLC, /* also used for snoopable memory on non-LLC */
-	I915_CACHE_L3_LLC, /* gen7+, L3 sits between the domain specifc
-			      caches, eg sampler/render caches, and the
-			      large Last-Level-Cache. LLC is coherent with
-			      the CPU, but L3 is only visible to the GPU. */
-	I915_CACHE_WT, /* hsw:gt3e WriteThrough for scanouts */
-};
 
 #define I915_COLOR_UNEVICTABLE (-1) /* a non-vma sharing the address space */
 
-- 
2.26.3

