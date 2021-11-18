Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C4455C1F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 14:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0B06E990;
	Thu, 18 Nov 2021 13:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9D289FCE;
 Thu, 18 Nov 2021 13:02:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="297596133"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="297596133"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 05:02:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="455319599"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.166])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 05:02:44 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/6] drm/i915/ttm: Drop region reference counting
Date: Thu, 18 Nov 2021 14:02:27 +0100
Message-Id: <20211118130230.154988-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118130230.154988-1-thomas.hellstrom@linux.intel.com>
References: <20211118130230.154988-1-thomas.hellstrom@linux.intel.com>
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

There is an interesting refcounting loop:
struct intel_memory_region has a struct ttm_resource_manager,
ttm_resource_manager->move may hold a reference to i915_request,
i915_request may hold a reference to intel_context,
intel_context may hold a reference to drm_i915_gem_object,
drm_i915_gem_object may hold a reference to intel_memory_region.

Break this loop by dropping region reference counting.

In addition, Have regions with a manager moving fence make sure
that all region objects are released before freeing the region.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c    |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  6 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   | 10 ++++--
 drivers/gpu/drm/i915/intel_memory_region.c    | 26 ++++----------
 drivers/gpu/drm/i915/intel_memory_region.h    |  9 ++---
 drivers/gpu/drm/i915/intel_region_ttm.c       | 35 +++++++++++++++++--
 drivers/gpu/drm/i915/intel_region_ttm.h       |  2 +-
 .../drm/i915/selftests/intel_memory_region.c  |  8 ++---
 drivers/gpu/drm/i915/selftests/mock_region.c  |  7 ++--
 12 files changed, 69 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index a016ccec36f3..a4350227e9ae 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -11,7 +11,7 @@
 void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
 					struct intel_memory_region *mem)
 {
-	obj->mm.region = intel_memory_region_get(mem);
+	obj->mm.region = mem;
 
 	mutex_lock(&mem->objects.lock);
 	list_add(&obj->mm.region_link, &mem->objects.list);
@@ -25,8 +25,6 @@ void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj)
 	mutex_lock(&mem->objects.lock);
 	list_del(&obj->mm.region_link);
 	mutex_unlock(&mem->objects.lock);
-
-	intel_memory_region_put(mem);
 }
 
 struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 4a88c89b7a14..cc9fe258fba7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -664,9 +664,10 @@ static int init_shmem(struct intel_memory_region *mem)
 	return 0; /* Don't error, we can simply fallback to the kernel mnt */
 }
 
-static void release_shmem(struct intel_memory_region *mem)
+static int release_shmem(struct intel_memory_region *mem)
 {
 	i915_gemfs_fini(mem->i915);
+	return 0;
 }
 
 static const struct intel_memory_region_ops shmem_region_ops = {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ddd37ccb1362..80680395bb3b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -720,9 +720,10 @@ static int init_stolen_smem(struct intel_memory_region *mem)
 	return i915_gem_init_stolen(mem);
 }
 
-static void release_stolen_smem(struct intel_memory_region *mem)
+static int release_stolen_smem(struct intel_memory_region *mem)
 {
 	i915_gem_cleanup_stolen(mem->i915);
+	return 0;
 }
 
 static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
@@ -759,10 +760,11 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 	return err;
 }
 
-static void release_stolen_lmem(struct intel_memory_region *mem)
+static int release_stolen_lmem(struct intel_memory_region *mem)
 {
 	io_mapping_fini(&mem->iomap);
 	i915_gem_cleanup_stolen(mem->i915);
+	return 0;
 }
 
 static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 537a81445b90..350bf1a23db5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -997,7 +997,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 
 	/* Don't put on a region list until we're either locked or fully initialized. */
-	obj->mm.region = intel_memory_region_get(mem);
+	obj->mm.region = mem;
 	INIT_LIST_HEAD(&obj->mm.region_link);
 
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
@@ -1044,6 +1044,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 
 static const struct intel_memory_region_ops ttm_system_region_ops = {
 	.init_object = __i915_gem_ttm_object_init,
+	.release = intel_region_ttm_fini,
 };
 
 struct intel_memory_region *
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 257588b68adc..c69c7d45aabc 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -568,7 +568,7 @@ static int igt_mock_memory_region_huge_pages(void *arg)
 out_put:
 	i915_gem_object_put(obj);
 out_region:
-	intel_memory_region_put(mem);
+	intel_memory_region_destroy(mem);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index aec838ecb2ef..9ea49e0a27c0 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -66,12 +66,16 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
 			   DMA_ATTR_FORCE_CONTIGUOUS);
 }
 
-static void
+static int
 region_lmem_release(struct intel_memory_region *mem)
 {
-	intel_region_ttm_fini(mem);
+	int ret;
+
+	ret = intel_region_ttm_fini(mem);
 	io_mapping_fini(&mem->iomap);
 	release_fake_lmem_bar(mem);
+
+	return ret;
 }
 
 static int
@@ -231,7 +235,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	return mem;
 
 err_region_put:
-	intel_memory_region_put(mem);
+	intel_memory_region_destroy(mem);
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index e7f7e6627750..b43121609e25 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -126,7 +126,6 @@ intel_memory_region_create(struct drm_i915_private *i915,
 			goto err_free;
 	}
 
-	kref_init(&mem->kref);
 	return mem;
 
 err_free:
@@ -144,28 +143,17 @@ void intel_memory_region_set_name(struct intel_memory_region *mem,
 	va_end(ap);
 }
 
-static void __intel_memory_region_destroy(struct kref *kref)
+void intel_memory_region_destroy(struct intel_memory_region *mem)
 {
-	struct intel_memory_region *mem =
-		container_of(kref, typeof(*mem), kref);
+	int ret = 0;
 
 	if (mem->ops->release)
-		mem->ops->release(mem);
+		ret = mem->ops->release(mem);
 
+	GEM_WARN_ON(!list_empty_careful(&mem->objects.list));
 	mutex_destroy(&mem->objects.lock);
-	kfree(mem);
-}
-
-struct intel_memory_region *
-intel_memory_region_get(struct intel_memory_region *mem)
-{
-	kref_get(&mem->kref);
-	return mem;
-}
-
-void intel_memory_region_put(struct intel_memory_region *mem)
-{
-	kref_put(&mem->kref, __intel_memory_region_destroy);
+	if (!ret)
+		kfree(mem);
 }
 
 /* Global memory region registration -- only slight layer inversions! */
@@ -234,7 +222,7 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
 			fetch_and_zero(&i915->mm.regions[i]);
 
 		if (region)
-			intel_memory_region_put(region);
+			intel_memory_region_destroy(region);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3feae3353d33..5625c9c38993 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -6,7 +6,6 @@
 #ifndef __INTEL_MEMORY_REGION_H__
 #define __INTEL_MEMORY_REGION_H__
 
-#include <linux/kref.h>
 #include <linux/ioport.h>
 #include <linux/mutex.h>
 #include <linux/io-mapping.h>
@@ -51,7 +50,7 @@ struct intel_memory_region_ops {
 	unsigned int flags;
 
 	int (*init)(struct intel_memory_region *mem);
-	void (*release)(struct intel_memory_region *mem);
+	int (*release)(struct intel_memory_region *mem);
 
 	int (*init_object)(struct intel_memory_region *mem,
 			   struct drm_i915_gem_object *obj,
@@ -71,8 +70,6 @@ struct intel_memory_region {
 	/* For fake LMEM */
 	struct drm_mm_node fake_mappable;
 
-	struct kref kref;
-
 	resource_size_t io_start;
 	resource_size_t min_page_size;
 	resource_size_t total;
@@ -110,9 +107,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
 			   u16 instance,
 			   const struct intel_memory_region_ops *ops);
 
-struct intel_memory_region *
-intel_memory_region_get(struct intel_memory_region *mem);
-void intel_memory_region_put(struct intel_memory_region *mem);
+void intel_memory_region_destroy(struct intel_memory_region *mem);
 
 int intel_memory_regions_hw_probe(struct drm_i915_private *i915);
 void intel_memory_regions_driver_release(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 2e901a27e259..f9bda8989074 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -104,14 +104,45 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
  * memory region, and if it was registered with the TTM device,
  * removes that registration.
  */
-void intel_region_ttm_fini(struct intel_memory_region *mem)
+int intel_region_ttm_fini(struct intel_memory_region *mem)
 {
-	int ret;
+	struct ttm_resource_manager *man = mem->region_private;
+	int ret = -EBUSY;
+	int count;
+
+	/*
+	 * Put the region's move fences. This releases requests that
+	 * may hold on to contexts and vms that may hold on to buffer
+	 * objects that may have a refcount on the region. :/
+	 */
+	if (man)
+		ttm_resource_manager_cleanup(man);
+
+	/* Flush objects from region. */
+	for (count = 0; count < 10; ++count) {
+		i915_gem_flush_free_objects(mem->i915);
+
+		mutex_lock(&mem->objects.lock);
+		if (list_empty(&mem->objects.list))
+			ret = 0;
+		mutex_unlock(&mem->objects.lock);
+		if (!ret)
+			break;
+
+		msleep(20);
+		flush_delayed_work(&mem->i915->bdev.wq);
+	}
+
+	/* If we leaked objects, Don't free the region causing use after free */
+	if (ret || !man)
+		return ret;
 
 	ret = i915_ttm_buddy_man_fini(&mem->i915->bdev,
 				      intel_region_to_ttm_type(mem));
 	GEM_WARN_ON(ret);
 	mem->region_private = NULL;
+
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index 7bbe2b46b504..fdee5e7bd46c 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -20,7 +20,7 @@ void intel_region_ttm_device_fini(struct drm_i915_private *dev_priv);
 
 int intel_region_ttm_init(struct intel_memory_region *mem);
 
-void intel_region_ttm_fini(struct intel_memory_region *mem);
+int intel_region_ttm_fini(struct intel_memory_region *mem);
 
 struct i915_refct_sgt *
 intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 418caae84759..0d5df0dc7212 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -225,7 +225,7 @@ static int igt_mock_reserve(void *arg)
 
 out_close:
 	close_objects(mem, &objects);
-	intel_memory_region_put(mem);
+	intel_memory_region_destroy(mem);
 out_free_order:
 	kfree(order);
 	return err;
@@ -439,7 +439,7 @@ static int igt_mock_splintered_region(void *arg)
 out_close:
 	close_objects(mem, &objects);
 out_put:
-	intel_memory_region_put(mem);
+	intel_memory_region_destroy(mem);
 	return err;
 }
 
@@ -507,7 +507,7 @@ static int igt_mock_max_segment(void *arg)
 out_close:
 	close_objects(mem, &objects);
 out_put:
-	intel_memory_region_put(mem);
+	intel_memory_region_destroy(mem);
 	return err;
 }
 
@@ -1196,7 +1196,7 @@ int intel_memory_region_mock_selftests(void)
 
 	err = i915_subtests(tests, mem);
 
-	intel_memory_region_put(mem);
+	intel_memory_region_destroy(mem);
 out_unref:
 	mock_destroy_device(i915);
 	return err;
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 7ec5037eaa58..19bff8afcaaa 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -84,13 +84,16 @@ static int mock_object_init(struct intel_memory_region *mem,
 	return 0;
 }
 
-static void mock_region_fini(struct intel_memory_region *mem)
+static int mock_region_fini(struct intel_memory_region *mem)
 {
 	struct drm_i915_private *i915 = mem->i915;
 	int instance = mem->instance;
+	int ret;
 
-	intel_region_ttm_fini(mem);
+	ret = intel_region_ttm_fini(mem);
 	ida_free(&i915->selftest.mock_region_instances, instance);
+
+	return ret;
 }
 
 static const struct intel_memory_region_ops mock_region_ops = {
-- 
2.31.1

