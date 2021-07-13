Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A0A3C6ED8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 12:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DE689D2E;
	Tue, 13 Jul 2021 10:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3215D897C5;
 Tue, 13 Jul 2021 10:47:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197325324"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="197325324"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="503054384"
Received: from ewaterla-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: convert drm_i915_gem_object to kernel-doc
Date: Tue, 13 Jul 2021 11:45:52 +0100
Message-Id: <20210713104554.2381406-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713104554.2381406-1-matthew.auld@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before we can pull in the previous kernel doc for the caching bits, we
first get to add kernel doc for all of drm_i915_gem_object so this
actually builds.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 422 +++++++++++++++---
 1 file changed, 366 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 02c3529b774c..da2194290436 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -174,24 +174,75 @@ struct i915_gem_object_page_iter {
 	struct mutex lock; /* protects this cache */
 };
 
-struct drm_i915_gem_object {
-	/*
-	 * We might have reason to revisit the below since it wastes
-	 * a lot of space for non-ttm gem objects.
-	 * In any case, always use the accessors for the ttm_buffer_object
-	 * when accessing it.
+/**
+ * struct i915_page_sizes - Track the various pieces we need to
+ * both track and construct huge GTT entries, when binding the
+ * object.
+ */
+struct i915_page_sizes {
+	/**
+	 * @phys:
+	 *
+	 * The sg mask of the pages sg_table. i.e the
+	 * mask of of the lengths for each sg entry.
 	 */
+	unsigned int phys;
+
+	/**
+	 * @sg:
+	 *
+	 * The gtt page sizes we are allowed to use given
+	 * the sg mask and the supported page sizes. This will
+	 * express the smallest unit we can use for the whole
+	 * object, as well as the larger sizes we may be able to
+	 * use opportunistically.
+	 */
+	unsigned int sg;
+
+	/**
+	 * @gtt:
+	 *
+	 * The actual gtt page size usage. Since we can
+	 * have multiple vma associated with this object we need
+	 * to prevent any trampling of state, hence a copy of
+	 * this struct also lives in each vma, therefore the gtt
+	 * value here should only be read/write through the vma.
+	 */
+	unsigned int gtt;
+};
+
+/**
+ * struct drm_i915_gem_object - Our core GEM object which extends the base
+ * struct drm_gem_object behaviour.
+ */
+struct drm_i915_gem_object {
 	union {
+		/** @base: The base DRM GEM object. */
 		struct drm_gem_object base;
+
+		/**
+		 * @__do_not_access:
+		 *
+		 * The base TTM object, if we are using the TTM backend. Note
+		 * that this also embeds its own DRM_GEM base object.
+		 *
+		 * We might have reason to revisit the below since it wastes a
+		 * lot of space for non-ttm gem objects.  In any case, always
+		 * use the accessors for the ttm_buffer_object when accessing
+		 * it.
+		 */
 		struct ttm_buffer_object __do_not_access;
 	};
 
+	/**
+	 * @ops: The struct drm_i915_gem_object_ops interface implemented by the
+	 * object instance.
+	 */
 	const struct drm_i915_gem_object_ops *ops;
 
+	/** @vma: Track all the struct i915_vma instances for this object. */
 	struct {
-		/**
-		 * @vma.lock: protect the list/tree of vmas
-		 */
+		/** @vma.lock: protect the list/tree of vmas */
 		spinlock_t lock;
 
 		/**
@@ -224,7 +275,9 @@ struct drm_i915_gem_object {
 	 * this translation from object to context->handles_vma.
 	 */
 	struct list_head lut_list;
-	spinlock_t lut_lock; /* guards lut_list */
+
+	/** @lut_lock: Guards the lut_list */
+	spinlock_t lut_lock;
 
 	/**
 	 * @obj_link: Link into @i915_gem_ww_ctx.obj_list
@@ -234,29 +287,123 @@ struct drm_i915_gem_object {
 	 * when i915_gem_ww_ctx_backoff() or i915_gem_ww_ctx_fini() are called.
 	 */
 	struct list_head obj_link;
-	/**
-	 * @shared_resv_from: The object shares the resv from this vm.
-	 */
+
+	/** @shares_resv_from: The object shares the resv from this vm. */
 	struct i915_address_space *shares_resv_from;
 
 	union {
+		/** @rcu: Embedded rcu_head */
 		struct rcu_head rcu;
+
+		/**
+		 * @freed:
+		 *
+		 * When objects need to be destroyed we batch them together into
+		 * an llist, for a separate worker thread to then pick up and
+		 * process.
+		 */
 		struct llist_node freed;
 	};
 
 	/**
-	 * Whether the object is currently in the GGTT mmap.
+	 * @userfault_count: Whether the object is currently in the GGTT mmap.
 	 */
 	unsigned int userfault_count;
+	/**
+	 * @userfault_link:
+	 *
+	 * We need to maintain the list of all objects which might have been
+	 * faulted into the GGTT mappable aperture, for easy revocation later.
+	 */
 	struct list_head userfault_link;
 
+	/**
+	 * @mmo: Track the mmap_offset nodes for this object.
+	 */
 	struct {
-		spinlock_t lock; /* Protects access to mmo offsets */
+		/** @lock: Protects access to mmo offsets. */
+		spinlock_t lock;
+
+		/** @offsets: The rb-tree of mmo offsets. */
 		struct rb_root offsets;
 	} mmo;
 
-	I915_SELFTEST_DECLARE(struct list_head st_link);
+	/** @st_link: SELFTEST ONLY */
+	struct list_head st_link;
 
+	/**
+	 * @flags: The object flags
+	 *
+	 * The currently supported I915_BO_ALLOC_FLAGS. Note that these can only
+	 * be set at object creation, after which they should be considered
+	 * immutable. Also some of these largely depend on whether the backend
+	 * supports it.
+	 *
+	 * I915_BO_ALLOC_CONTIGUOUS:
+	 *
+	 * Allocate the physical pages for the object as one contiguous block or
+	 * page. Currently only supported for device local-memory.
+	 *
+	 * I915_BO_ALLOC_VOLATILE:
+	 *
+	 * Volatile here refers to the volatility of the allocated pages when
+	 * unpinned. This effectively just sets the @madv hint to
+	 * I915_MADV_DONTNEED while the pages are pinned/allocated. This way as
+	 * soon as the pages become unpinned the shrinker is free to discard the
+	 * pages if needed.  This is only intended for kernel internal objects
+	 * where they are often short lived anyway, and don't require any kind
+	 * of persistence.
+	 *
+	 * I915_BO_ALLOC_CPU_CLEAR:
+	 *
+	 * After allocating the pages, zero them using a simple memset. This is
+	 * very specialised and is only intended for kernel internal objects
+	 * where we are unable(too early during probe) or prefer not to use a
+	 * normal accelerated blitter clear.
+	 *
+	 * I915_BO_ALLOC_USER:
+	 *
+	 * All normal userspace objects are allocated with this flag. This is
+	 * useful where the kernel needs to know if the object is merely kernel
+	 * internal, or was created by userspace, where slightly different rules
+	 * might be needed.
+	 *
+	 * Other special flags, note that these might be mutable:
+	 *
+	 * I915_BO_READONLY:
+	 *
+	 * Should this object be marked as read-only. This applies to both CPU
+	 * and GPU access, when dealing with userspace objects, at least where
+	 * it can be enforced. From a userspace perspective this only exposed
+	 * for userptr objects.
+	 *
+	 * When dealing with kernel internal objects this *only* applies to GPU
+	 * access, usually where we need to prevent userspace access to some
+	 * security critical object, which might need to share the user visible
+	 * ppGTT address space.
+	 *
+	 * Note that for GPU access the HW needs to actually support the
+	 * read-only bit in the ppGTT PTE field. On some newer hardware this
+	 * support is completely busted. So whether this is actually supported
+	 * depends on the vm. Currently the caller is expected to check this
+	 * first before marking the object as readonly, if they really do need
+	 * it, since it just gets silently ignored when setting up the PTEs,
+	 * during i915_vma_pin().
+	 *
+	 * FIXME: Note that this might be a slight wart in the api. Once idea
+	 * could be to move this to I915_BO_ALLOC_FLAGS, that way it becomes
+	 * immutable, and then we don't have to worry about unbinding and
+	 * rebinding objects on the fly if the object suddenly becomes readonly.
+	 * The final piece is to make i915_vma_pin() fall over if the vm doesn't
+	 * have read-only support, when the object is marked as readonly. The
+	 * callers should then be updated to account for this.
+	 *
+	 * I915_TILING_QUIRK_BIT:
+	 *
+	 * Tiled objects with unknown swizzling need special care. For example,
+	 * we are not allowed to swap the pages out if this is set, otherwise we
+	 * may see corruption.
+	 */
 	unsigned long flags;
 #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
 #define I915_BO_ALLOC_VOLATILE   BIT(1)
@@ -270,15 +417,26 @@ struct drm_i915_gem_object {
 #define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
 
 	/**
-	 * @mem_flags - Mutable placement-related flags
+	 * @mem_flags: Mutable placement-related flags
 	 *
 	 * These are flags that indicate specifics of the memory region
 	 * the object is currently in. As such they are only stable
 	 * either under the object lock or if the object is pinned.
+	 *
+	 * Possible values:
+	 *
+	 * I915_BO_FLAG_STRUCT_PAGE:
+	 *
+	 * Object backed by struct pages, aka system memory
+	 *
+	 * I915_BO_FLAG_IOMEM:
+	 *
+	 * Object backed by device memory, aka local memory
 	 */
 	unsigned int mem_flags;
-#define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages */
-#define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
+#define I915_BO_FLAG_STRUCT_PAGE BIT(0)
+#define I915_BO_FLAG_IOMEM       BIT(1)
+
 	/**
 	 * @cache_level: The desired GTT caching level.
 	 *
@@ -286,6 +444,7 @@ struct drm_i915_gem_object {
 	 * each does.
 	 */
 	unsigned int cache_level:3;
+
 	/**
 	 * @cache_coherent:
 	 *
@@ -339,6 +498,7 @@ struct drm_i915_gem_object {
 #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
 #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
 	unsigned int cache_coherent:2;
+
 	/**
 	 * @cache_dirty:
 	 *
@@ -380,124 +540,274 @@ struct drm_i915_gem_object {
 	 */
 	u16 write_domain;
 
+	/**
+	 * @frontbuffer:
+	 *
+	 * Frontbuffer tracking bits, or NULL if this is just a normal object.
+	 */
 	struct intel_frontbuffer __rcu *frontbuffer;
 
-	/** Current tiling stride for the object, if it's tiled. */
+	/**
+	 * @tiling_and_stride:
+	 *
+	 * Current tiling stride for the object, if it's tiled.
+	 */
 	unsigned int tiling_and_stride;
 #define FENCE_MINIMUM_STRIDE 128 /* See i915_tiling_ok() */
 #define TILING_MASK (FENCE_MINIMUM_STRIDE - 1)
 #define STRIDE_MASK (~TILING_MASK)
 
+	/** @mm: Manage all the state related to the backing storage */
 	struct {
-		/*
-		 * Protects the pages and their use. Do not use directly, but
-		 * instead go through the pin/unpin interfaces.
+		/**
+		 * @pages_pin_count:
+		 *
+		 * Protects the @pages and their use. Do not use directly, but
+		 * instead go through the i915_gem_object_{pin, unpin}_pages()
+		 * interface.
+		 *
+		 * When the @pages_pin_count reaches zero the pages might be
+		 * discared when under memory pressure, if the @madv is also
+		 * I915_MADV_DONTNEED.
+		 *
+		 * When the final ref for the object is dropped, the object
+		 * destruction code will also zero the @pages_pin_count, and
+		 * free the @pages and related state.
 		 */
 		atomic_t pages_pin_count;
+
+		/**
+		 * @shrink_pin:
+		 *
+		 * While @shrink_pin is non-zero, the object is not visible to
+		 * the shrinker. Usually when the kernel knows the object can't
+		 * be swapped out or discarded, we try to hide it from the
+		 * shrinker so that it doesn't needlessly waste effort on such
+		 * objects.
+		 */
 		atomic_t shrink_pin;
 
 		/**
+		 * @placements:
+		 *
 		 * Priority list of potential placements for this object.
 		 */
 		struct intel_memory_region **placements;
+
+		/**
+		 * @n_placements: Number of elements in @placements.
+		 */
 		int n_placements;
 
 		/**
-		 * Memory region for this object.
+		 * @region: Memory region for this object.
 		 */
 		struct intel_memory_region *region;
 
 		/**
+		 * @res:
+		 *
 		 * Memory manager resource allocated for this object. Only
 		 * needed for the mock region.
 		 */
 		struct ttm_resource *res;
 
 		/**
+		 * @region_link:
+		 *
 		 * Element within memory_region->objects or region->purgeable
 		 * if the object is marked as DONTNEED. Access is protected by
 		 * region->obj_lock.
 		 */
 		struct list_head region_link;
 
+		/**
+		 * @pages:
+		 *
+		 * Only valid while the @pages_pin_count is not zero.
+		 *
+		 * The cached struct sg_table for the backing pages, or NULL if
+		 * the pages have yet to be allocated. We use this when mapping
+		 * the object(or rather the struct i915_vma) through the GTT,
+		 * effectively each GTT PTE is programmed using this table.
+		 *
+		 * If we are using an IOMMU then this will contain the
+		 * respective DMA addresses for the physical pages, when dealing
+		 * with system memory.
+		 *
+		 * We also like to abuse this as a general container for device
+		 * addresses, like for device local memory and stolen memory.
+		 */
 		struct sg_table *pages;
-		void *mapping;
 
-		struct i915_page_sizes {
-			/**
-			 * The sg mask of the pages sg_table. i.e the mask of
-			 * of the lengths for each sg entry.
-			 */
-			unsigned int phys;
-
-			/**
-			 * The gtt page sizes we are allowed to use given the
-			 * sg mask and the supported page sizes. This will
-			 * express the smallest unit we can use for the whole
-			 * object, as well as the larger sizes we may be able
-			 * to use opportunistically.
-			 */
-			unsigned int sg;
+		/*
+		 * @mapping:
+		 *
+		 * Only valid while the @pages_pin_count is not zero.
+		 *
+		 * The cached CPU virtual address for the @pages, or NULL if
+		 * there is no current mapping.
+		 *
+		 * The caching type is encoded in the unused lower bits of the
+		 * address, so this should not be directly accessed. Rather the
+		 * i915_gem_object_pin_map() should be used to obtain the
+		 * address, which also ensures the pages are correctly pinned
+		 * during CPU access of the virtual address.
+		 * i915_gem_object_unpin_map() should be called when done.
+		 */
+		void *mapping;
 
-			/**
-			 * The actual gtt page size usage. Since we can have
-			 * multiple vma associated with this object we need to
-			 * prevent any trampling of state, hence a copy of this
-			 * struct also lives in each vma, therefore the gtt
-			 * value here should only be read/write through the vma.
-			 */
-			unsigned int gtt;
-		} page_sizes;
+		/** @page_sizes: Track the GTT page size related bits */
+		struct i915_page_sizes page_sizes;
 
-		I915_SELFTEST_DECLARE(unsigned int page_mask);
+		/**
+		 * @page_mask: SELFTEST ONLY
+		 */
+		unsigned int page_mask;
 
+		/**
+		 * @get_page:
+		 *
+		 * The cached iterator for looking up struct pages in @pages.
+		 */
 		struct i915_gem_object_page_iter get_page;
+
+		/**
+		 * @get_dma_page:
+		 *
+		 * The cached iterator for looking up device addresses in
+		 * @pages.
+		 */
 		struct i915_gem_object_page_iter get_dma_page;
 
 		/**
+		 * @link:
+		 *
 		 * Element within i915->mm.unbound_list or i915->mm.bound_list,
 		 * locked by i915->mm.obj_lock.
 		 */
 		struct list_head link;
 
 		/**
-		 * Advice: are the backing pages purgeable?
+		 * @madv: The advice hint for the pages.
+		 *
+		 * See &drm_i915_gem_madvise.madv.
 		 */
 		unsigned int madv:2;
 
 		/**
-		 * This is set if the object has been written to since the
-		 * pages were last acquired.
+		 * @dirty:
+		 *
+		 * This is set if the object might have been written to since
+		 * the pages were acquired. Tracking if the object is dirty
+		 * tells us if we can for example simply discard the pages,
+		 * instead of having to persist their contents, assuming the
+		 * object is still marked as I915_MADV_WILLNEED.
 		 */
 		bool dirty:1;
 	} mm;
 
+	/**
+	 * @ttm:
+	 *
+	 * The TTM specific state for this object. Currently for discrete
+	 * only.
+	 */
 	struct {
+		/**
+		 * @cached_io_st:
+		 *
+		 * Some nasty sleight of hand to manage the sg_table for
+		 * discrete, which uses use the TTM backend instead.
+		 */
 		struct sg_table *cached_io_st;
+
+		/**
+		 * @get_io_page: The cached iterator for @cached_io_st
+		 */
 		struct i915_gem_object_page_iter get_io_page;
+
+		/**
+		 * @created:
+		 *
+		 * Some more nasty sleight of hand to manage the object
+		 * destruction differences when the TTM backend is used. Nothing
+		 * to see here.
+		 */
 		bool created:1;
 	} ttm;
 
-	/** Record of address bit 17 of each page at last unbind. */
+	/** @bit_17 : Record of address bit 17 of each page at last unbind. */
 	unsigned long *bit_17;
 
 	union {
 #ifdef CONFIG_MMU_NOTIFIER
-		struct i915_gem_userptr {
+		/**
+		 * @userptr:
+		 *
+		 * Track the userptr specific state if this is a userptr object.
+		 */
+		struct {
+			/**
+			 * @ptr:
+			 *
+			 * The user provided virtual address for the memory.
+			 */
 			uintptr_t ptr;
+
+			/**
+			 * @notifier_seq: The notifier sequence number.
+			 */
 			unsigned long notifier_seq;
 
+			/** @notifier: The struct mmu_interval_notifier */
 			struct mmu_interval_notifier notifier;
+
+			/**
+			 * @pvec:
+			 *
+			 * The array of struct pages, as per the provided @ptr.
+			 */
 			struct page **pvec;
+
+			/**
+			 * @page_ref:
+			 *
+			 * The userptr reference count for the pages.
+			 */
 			int page_ref;
 		} userptr;
 #endif
-
+		/**
+		 * @stolen:
+		 *
+		 * Pointer to the contiguous memory block if this is a stolen
+		 * memory object.
+		 */
 		struct drm_mm_node *stolen;
 
+		/** @scratch: SELFTEST ONLY */
 		unsigned long scratch;
+
+		/**
+		 * @encode:
+		 *
+		 * Cached PTE encoding for this object, i.e it has the PTE_LM,
+		 * caching bits, DMA address etc already built.
+		 *
+		 * Note that this is *only* used for scratch pages, where it's
+		 * an extremely common operation to point the various paging
+		 * structures(PDE, PTE etc) at the respective scratch page, and
+		 * since the scratch page is static the encoding value here
+		 * shouldn't change.
+		 */
 		u64 encode;
 
+		/**
+		 * @gvt_info:
+		 *
+		 * The GVT specific state, assuming GVT is indeed active.
+		 */
 		void *gvt_info;
 	};
 };
-- 
2.26.3

