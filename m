Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C63D22CE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 13:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40F6E88A;
	Thu, 22 Jul 2021 11:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7526B6E5D4;
 Thu, 22 Jul 2021 11:35:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198896664"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="198896664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 04:35:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470602848"
Received: from kgreenan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.109])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 04:35:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/i915: document caching related bits
Date: Thu, 22 Jul 2021 12:34:55 +0100
Message-Id: <20210722113456.304882-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to document the object caching related bits, like cache_coherent and
cache_dirty.

v2(Ville):
 - As pointed out by Ville, fix the completely incorrect assumptions
   about the "partial" coherency on shared LLC platforms.
v3(Daniel):
 - Fix nonsense about "dirtying" the cache with reads.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 176 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_drv.h               |   9 -
 2 files changed, 172 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index afbadfc5516b..40cce816a7e3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -92,6 +92,76 @@ struct drm_i915_gem_object_ops {
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
+	 * Note that on shared LLC platforms reads and writes through the CPU
+	 * cache are still coherent even with this setting. See also
+	 * &drm_i915_gem_object.cache_coherent for more details.
+	 *
+	 * Note that on platforms with a shared LLC this should ideally only be
+	 * used for scanout surfaces, otherwise we end up over-flushing in some
+	 * places.
+	 */
+	I915_CACHE_NONE = 0,
+	/**
+	 * @I915_CACHE_LLC:
+	 *
+	 * Coherent with the CPU cache. If the cache is dirty, then the GPU will
+	 * ensure that access remains coherent, when both reading and writing
+	 * through the CPU cache.
+	 *
+	 * Not used for scanout surfaces.
+	 *
+	 * Applies to both platforms with shared LLC(HAS_LLC), and snooping
+	 * based platforms(HAS_SNOOP).
+	 *
+	 * This should be the default for platforms which share the LLC with the
+	 * CPU. The only exception is scanout objects, where the display engine
+	 * is not coherent with the LLC. For such objects I915_CACHE_NONE or
+	 * I915_CACHE_WT should be used.
+	 */
+	I915_CACHE_LLC,
+	/**
+	 * @I915_CACHE_L3_LLC:
+	 *
+	 * Explicitly enable the Gfx L3 cache, with snooped LLC.
+	 *
+	 * The Gfx L3 sits between the domain specific caches, e.g
+	 * sampler/render caches, and the larger LLC. LLC is coherent with the
+	 * GPU, but L3 is only visible to the GPU, so likely needs to be flushed
+	 * when the workload completes.
+	 *
+	 * Not used for scanout surfaces.
+	 *
+	 * Only exposed on some gen7 + GGTT. More recent hardware has dropped
+	 * this.
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
@@ -229,14 +299,112 @@ struct drm_i915_gem_object {
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
+	 * writing through the CPU caches. The largely depends on the
+	 * @cache_level setting.
+	 *
+	 * On platforms which don't have the shared LLC(HAS_SNOOP), like on Atom
+	 * platforms, coherency must be explicitly requested with some special
+	 * GTT caching bits(see enum i915_cache_level). When enabling coherency
+	 * it does come at a performance and power cost on such platforms. On
+	 * the flip side the kernel does need to manually flush any buffers
+	 * which need to be coherent with the GPU, if the object is not
+	 * coherent i.e @cache_coherent is zero.
+	 *
+	 * On platforms that share the LLC with the CPU(HAS_LLC), all GT memory
+	 * access will automatically snoop the CPU caches(even with CACHE_NONE).
+	 * The one exception is when dealing with the display engine, like with
+	 * scanout surfaces. To handle this the kernel will always flush the
+	 * surface out of the CPU caches when preparing it for scanout.  Also
+	 * note that since scanout surfaces are only ever read by the display
+	 * engine we only need to care about flushing any writes through the CPU
+	 * cache, reads on the other hand will always be coherent.
+	 *
+	 * Something strange here is why @cache_coherent is not a simple
+	 * boolean, i.e coherent vs non-coherent. The reasoning for this is back
+	 * to the display engine not being fully coherent. As a result scanout
+	 * surfaces will either be marked as I915_CACHE_NONE or I915_CACHE_WT.
+	 * In the case of seeing I915_CACHE_NONE the kernel makes the assumption
+	 * that this is likely a scanout surface, and will set @cache_coherent
+	 * as only I915_BO_CACHE_COHERENT_FOR_READ, on platforms with the shared
+	 * LLC. The kernel uses this to always flush writes through the CPU
+	 * cache as early as possible, where it can, in effect keeping
+	 * @cache_dirty clean, so we can potentially avoid stalling when
+	 * flushing the surface just before doing the scanout.  This does mean
+	 * we might unnecessarily flush non-scanout objects in some places, but
+	 * the default assumption is that all normal objects should be using
+	 * I915_CACHE_LLC, at least on platforms with the shared LLC.
+	 *
+	 * Supported values:
+	 *
+	 * I915_BO_CACHE_COHERENT_FOR_READ:
+	 *
+	 * On shared LLC platforms, we use this for special scanout surfaces,
+	 * where the display engine is not coherent with the CPU cache. As such
+	 * we need to ensure we flush any writes before doing the scanout. As an
+	 * optimisation we try to flush any writes as early as possible to avoid
+	 * stalling later.
+	 *
+	 * Thus for scanout surfaces using I915_CACHE_NONE, on shared LLC
+	 * platforms, we use:
+	 *
+	 *	cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ
+	 *
+	 * While for normal objects that are fully coherent we use:
+	 *
+	 *	cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ |
+	 *			 I915_BO_CACHE_COHERENT_FOR_WRITE
+	 *
+	 * And then for objects that are not coherent at all we use:
+	 *
+	 *	cache_coherent = 0
+	 *
+	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
+	 *
+	 * When writing through the CPU cache, the GPU is still coherent. Note
+	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
+	 */
 #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
 #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
+	unsigned int cache_coherent:2;
+
+	/**
+	 * @cache_dirty:
+	 *
+	 * Track if we are we dirty with writes through the CPU cache for this
+	 * object. As a result reading directly from main memory might yield
+	 * stale data.
+	 *
+	 * This also ties into whether the kernel is tracking the object as
+	 * coherent with the GPU, as per @cache_coherent, as it determines if
+	 * flushing might be needed at various points.
+	 *
+	 * Another part of @cache_dirty is managing flushing when first
+	 * acquiring the pages for system memory, at this point the pages are
+	 * considered foreign, so the default assumption is that the cache is
+	 * dirty, for example the page zeroing done by the kernel might leave
+	 * writes though the CPU cache, or swapping-in, while the actual data in
+	 * main memory is potentially stale.  Note that this is a potential
+	 * security issue when dealing with userspace objects and zeroing. Now,
+	 * whether we actually need apply the big sledgehammer of flushing all
+	 * the pages on acquire depends on if @cache_coherent is marked as
+	 * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coherent
+	 * for both reads and writes though the CPU cache.
+	 *
+	 * Note that on shared LLC platforms we still apply the heavy flush for
+	 * I915_CACHE_NONE objects, under the assumption that this is going to
+	 * be used for scanout.
+	 */
 	unsigned int cache_dirty:1;
 
 	/**
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 0321a1f9738d..f97792ccc199 100644
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

