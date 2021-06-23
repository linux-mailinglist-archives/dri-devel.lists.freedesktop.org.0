Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84493B18D6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266316E8BA;
	Wed, 23 Jun 2021 11:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A966E8B1;
 Wed, 23 Jun 2021 11:26:55 +0000 (UTC)
IronPort-SDR: fQXT/aIWUD1OHOLFNhOXhx8Q5yDqvWFJtdmzLm+OYMCabKlvigruMTOsnuNxJzybUKohKhe8cl
 7k0O5HFzVBgQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="271086588"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="271086588"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 04:26:54 -0700
IronPort-SDR: 72oVXtcVzcdFUMyXvJCYrUu4HPz01ZTyXQg3lUe7nVVCqfL9ybbWK+YLnjVBlY2RTYjbRAHcz6
 BV2UNtgSLe7g==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="454619209"
Received: from dconnon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 04:26:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: support forcing the page size with lmem
Date: Wed, 23 Jun 2021 12:26:36 +0100
Message-Id: <20210623112637.266855-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210623112637.266855-1-matthew.auld@intel.com>
References: <20210623112637.266855-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For some specialised objects we might need something larger than the
regions min_page_size due to some hw restriction, and slightly more
hairy is needing something smaller with the guarantee that such objects
will never be inserted into any GTT, which is the case for the paging
structures.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      | 33 +++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |  5 ++
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 10 ++-
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 14 +++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  1 +
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  3 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  8 +--
 drivers/gpu/drm/i915/intel_memory_region.h    |  1 +
 .../drm/i915/selftests/intel_memory_region.c  | 63 ++++++++++++++++++-
 drivers/gpu/drm/i915/selftests/mock_region.c  |  1 +
 14 files changed, 130 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 93bf63bbaff1..51f92e4b1a69 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -90,7 +90,7 @@ i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 	 */
 	flags = I915_BO_ALLOC_USER;
 
-	ret = mr->ops->init_object(mr, obj, size, flags);
+	ret = mr->ops->init_object(mr, obj, size, 0, flags);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index d539dffa1554..174a9e34ad93 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -71,11 +71,42 @@ bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
 }
 
+/**
+ * __i915_gem_object_create_lmem_with_ps - Create lmem object and force the
+ * minimum page size for the backing pages.
+ * @i915: The i915 instance.
+ * @size: The size in bytes for the object. Note that we need to round the size
+ * up depending on the @page_size. The final object size can be fished out from
+ * the drm GEM object.
+ * @page_size: The requested minimum page size in bytes for this object. The is
+ * useful if we need something bigger than the regions min_page_size due to some
+ * hw restriction, or in some very specialised cases where it needs to be
+ * smaller, where the internal fragmentation cost is too great when rounding up
+ * the object size.
+ * @flags: the optional BO allocation flags
+ *
+ * Note that this interface assumes you know what you are doing when forcing the
+ * page_size. If this is smaller than the regions min_page_size then it can
+ * never be inserted into any GTT, otherwise it might lead to undefined
+ * behaviour.
+ *
+ * Return: The object pointer, which might be an ERR_PTR in the case of failure.
+ */
+struct drm_i915_gem_object *
+__i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
+				      resource_size_t size,
+				      resource_size_t page_size,
+				      unsigned int flags)
+{
+	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
+					     size, page_size, flags);
+}
+
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
 			    unsigned int flags)
 {
 	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
-					     size, flags);
+					     size, 0, flags);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
index ea76fd11ccb0..e98608cebbbc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
@@ -21,6 +21,11 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
 
 bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
 
+struct drm_i915_gem_object *
+__i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
+				      resource_size_t size,
+				      resource_size_t page_size,
+				      unsigned int flags);
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index d1f1840540dd..b18182b46ee9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -36,6 +36,7 @@ void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj)
 struct drm_i915_gem_object *
 i915_gem_object_create_region(struct intel_memory_region *mem,
 			      resource_size_t size,
+			      resource_size_t page_size,
 			      unsigned int flags)
 {
 	struct drm_i915_gem_object *obj;
@@ -48,11 +49,16 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	 */
 
 	GEM_BUG_ON(flags & ~I915_BO_ALLOC_FLAGS);
+	GEM_BUG_ON(!is_power_of_2_u64(page_size));
+	GEM_BUG_ON(page_size < PAGE_SIZE);
 
 	if (!mem)
 		return ERR_PTR(-ENODEV);
 
-	size = round_up(size, mem->min_page_size);
+	if (!page_size)
+		page_size = mem->min_page_size;
+
+	size = round_up(size, page_size);
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_MIN_ALIGNMENT));
@@ -64,7 +70,7 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
-	err = mem->ops->init_object(mem, obj, size, flags);
+	err = mem->ops->init_object(mem, obj, size, page_size, flags);
 	if (err)
 		goto err_object_free;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index 84fcb3297400..1008e580a89a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -19,6 +19,7 @@ void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj);
 struct drm_i915_gem_object *
 i915_gem_object_create_region(struct intel_memory_region *mem,
 			      resource_size_t size,
+			      resource_size_t page_size,
 			      unsigned int flags);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 5d16c4462fda..f5791611b9ca 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -489,6 +489,7 @@ static int __create_shmem(struct drm_i915_private *i915,
 static int shmem_object_init(struct intel_memory_region *mem,
 			     struct drm_i915_gem_object *obj,
 			     resource_size_t size,
+			     resource_size_t page_size,
 			     unsigned int flags)
 {
 	static struct lock_class_key lock_class;
@@ -548,7 +549,7 @@ i915_gem_object_create_shmem(struct drm_i915_private *i915,
 			     resource_size_t size)
 {
 	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_SMEM],
-					     size, 0);
+					     size, 0, 0);
 }
 
 /* Allocate a new GEM object and fill it with the supplied data */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index b0c3a7dc60d1..90708de27684 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -670,6 +670,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 					struct drm_i915_gem_object *obj,
 					resource_size_t size,
+					resource_size_t page_size,
 					unsigned int flags)
 {
 	struct drm_i915_private *i915 = mem->i915;
@@ -708,7 +709,7 @@ struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
-	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0);
+	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0, 0);
 }
 
 static int init_stolen_smem(struct intel_memory_region *mem)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5d894bba6430..2024dd0c7c22 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -758,9 +758,6 @@ static u64 i915_gem_object_page_size(struct drm_i915_gem_object *obj)
 	u64 page_size;
 	int i;
 
-	if (!obj->mm.n_placements)
-		return obj->mm.region->min_page_size;
-
 	page_size = 0;
 	for (i = 0; i < obj->mm.n_placements; i++) {
 		struct intel_memory_region *mr = obj->mm.placements[i];
@@ -784,6 +781,7 @@ static u64 i915_gem_object_page_size(struct drm_i915_gem_object *obj)
 int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       struct drm_i915_gem_object *obj,
 			       resource_size_t size,
+			       resource_size_t page_size,
 			       unsigned int flags)
 {
 	static struct lock_class_key lock_class;
@@ -802,6 +800,14 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
 		ttm_bo_type_kernel;
 
+	GEM_BUG_ON(!page_size);
+
+	if (obj->mm.n_placements) {
+		/* Forcing the page size is kernel internal only */
+		GEM_BUG_ON(page_size != mem->min_page_size);
+		page_size = i915_gem_object_page_size(obj);
+	}
+
 	/*
 	 * If this function fails, it will call the destructor, but
 	 * our caller still owns the object. So no freeing in the
@@ -812,7 +818,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
 			  bo_type, &i915_sys_placement,
-			  i915_gem_object_page_size(obj) >> PAGE_SHIFT,
+			  page_size >> PAGE_SHIFT,
 			  true, NULL, NULL, i915_ttm_bo_destroy);
 	if (!ret)
 		obj->ttm.created = true;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index b8d3dcbb50df..40927f67b6d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -44,5 +44,6 @@ i915_ttm_to_gem(struct ttm_buffer_object *bo)
 int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       struct drm_i915_gem_object *obj,
 			       resource_size_t size,
+			       resource_size_t page_size,
 			       unsigned int flags);
 #endif
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index dadd485bc52f..9d17bff8b36d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -497,7 +497,8 @@ static int igt_mock_memory_region_huge_pages(void *arg)
 		int i;
 
 		for (i = 0; i < ARRAY_SIZE(flags); ++i) {
-			obj = i915_gem_object_create_region(mem, page_size,
+			obj = i915_gem_object_create_region(mem,
+							    page_size, page_size,
 							    flags[i]);
 			if (IS_ERR(obj)) {
 				err = PTR_ERR(obj);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 44b5de06ce64..7398b502738a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -955,7 +955,7 @@ static int igt_mmap(void *arg)
 			struct drm_i915_gem_object *obj;
 			int err;
 
-			obj = i915_gem_object_create_region(mr, sizes[i], I915_BO_ALLOC_USER);
+			obj = i915_gem_object_create_region(mr, sizes[i], 0, I915_BO_ALLOC_USER);
 			if (obj == ERR_PTR(-ENODEV))
 				continue;
 
@@ -1075,7 +1075,7 @@ static int igt_mmap_access(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, I915_BO_ALLOC_USER);
+		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
@@ -1220,7 +1220,7 @@ static int igt_mmap_gpu(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, I915_BO_ALLOC_USER);
+		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
@@ -1375,7 +1375,7 @@ static int igt_mmap_revoke(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, I915_BO_ALLOC_USER);
+		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 2be8433d373a..359cd8424b9a 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -55,6 +55,7 @@ struct intel_memory_region_ops {
 	int (*init_object)(struct intel_memory_region *mem,
 			   struct drm_i915_gem_object *obj,
 			   resource_size_t size,
+			   resource_size_t page_size,
 			   unsigned int flags);
 };
 
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index ecc3b9e6c22b..1aaccb9841a0 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -68,7 +68,7 @@ static int igt_mock_fill(void *arg)
 		resource_size_t size = page_num * page_size;
 		struct drm_i915_gem_object *obj;
 
-		obj = i915_gem_object_create_region(mem, size, 0);
+		obj = i915_gem_object_create_region(mem, size, 0, 0);
 		if (IS_ERR(obj)) {
 			err = PTR_ERR(obj);
 			break;
@@ -110,7 +110,7 @@ igt_object_create(struct intel_memory_region *mem,
 	struct drm_i915_gem_object *obj;
 	int err;
 
-	obj = i915_gem_object_create_region(mem, size, flags);
+	obj = i915_gem_object_create_region(mem, size, 0, flags);
 	if (IS_ERR(obj))
 		return obj;
 
@@ -647,6 +647,62 @@ static int igt_lmem_create(void *arg)
 	return err;
 }
 
+static int igt_lmem_create_with_ps(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	int err = 0;
+	u32 ps;
+
+	for (ps = PAGE_SIZE; ps <= SZ_1G; ps <<= 1) {
+		struct drm_i915_gem_object *obj;
+		dma_addr_t daddr;
+
+		obj = __i915_gem_object_create_lmem_with_ps(i915, ps, ps, 0);
+		if (IS_ERR(obj)) {
+			err = PTR_ERR(obj);
+			if (err == -ENXIO || err == -E2BIG) {
+				pr_info("%s not enough lmem for ps(%u) err=%d\n",
+					__func__, ps, err);
+				err = 0;
+			}
+
+			break;
+		}
+
+		if (obj->base.size != ps) {
+			pr_err("%s size(%zu) != ps(%u)\n",
+			       __func__, obj->base.size, ps);
+			err = -EINVAL;
+			goto out_put;
+		}
+
+		i915_gem_object_lock(obj, NULL);
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			goto out_put;
+
+		daddr = i915_gem_object_get_dma_address(obj, 0);
+		if (!IS_ALIGNED(daddr, ps)) {
+			pr_err("%s daddr(%pa) not aligned with ps(%u)\n",
+			       __func__, &daddr, ps);
+			err = -EINVAL;
+			goto out_unpin;
+		}
+
+out_unpin:
+		i915_gem_object_unpin_pages(obj);
+		__i915_gem_object_put_pages(obj);
+out_put:
+		i915_gem_object_unlock(obj);
+		i915_gem_object_put(obj);
+
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
 static int igt_lmem_create_cleared_cpu(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -932,7 +988,7 @@ create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
 	struct drm_i915_gem_object *obj;
 	void *addr;
 
-	obj = i915_gem_object_create_region(mr, size, 0);
+	obj = i915_gem_object_create_region(mr, size, 0, 0);
 	if (IS_ERR(obj)) {
 		if (PTR_ERR(obj) == -ENOSPC) /* Stolen memory */
 			return ERR_PTR(-ENODEV);
@@ -1149,6 +1205,7 @@ int intel_memory_region_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_lmem_create),
+		SUBTEST(igt_lmem_create_with_ps),
 		SUBTEST(igt_lmem_create_cleared_cpu),
 		SUBTEST(igt_lmem_write_cpu),
 		SUBTEST(igt_lmem_write_gpu),
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index fa786dede608..efa86dffe3c6 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -63,6 +63,7 @@ static const struct drm_i915_gem_object_ops mock_region_obj_ops = {
 static int mock_object_init(struct intel_memory_region *mem,
 			    struct drm_i915_gem_object *obj,
 			    resource_size_t size,
+			    resource_size_t page_size,
 			    unsigned int flags)
 {
 	static struct lock_class_key lock_class;
-- 
2.26.3

