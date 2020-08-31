Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C5A2582A7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE626E507;
	Mon, 31 Aug 2020 20:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCCA6E370
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:35:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-SNDAmgB8P6O04OS5W6OoPg-1; Mon, 31 Aug 2020 16:33:47 -0400
X-MC-Unique: SNDAmgB8P6O04OS5W6OoPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1385E10ABDA6;
 Mon, 31 Aug 2020 20:33:46 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-195.bne.redhat.com
 [10.64.54.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E0DA747B0;
 Mon, 31 Aug 2020 20:33:44 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] [RFC] drm/i915: make object creation avoid regions layering.
Date: Tue,  1 Sep 2020 06:33:43 +1000
Message-Id: <20200831203343.1198057-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: gmail.com
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This looked like indirect ptr for not much reason in the create
object path, I just wonder why it couldn't be simpler like this,

The tests aren't cleaned up but this was more of is this a good idea
test patch.
---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c   | 16 ++++-------
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 33 +++++++++-------------
 drivers/gpu/drm/i915/gem/i915_gem_region.h |  6 ++--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 22 ++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 24 ++++++----------
 drivers/gpu/drm/i915/i915_gem.c            | 29 ++++++++-----------
 drivers/gpu/drm/i915/intel_memory_region.h |  5 ----
 drivers/gpu/drm/i915/intel_region_lmem.c   |  1 -
 8 files changed, 50 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 932ee21e6609..710fb1158904 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -27,18 +27,14 @@ i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
 			    unsigned int flags)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
-					     size, flags);
-}
-
-struct drm_i915_gem_object *
-__i915_gem_lmem_object_create(struct intel_memory_region *mem,
-			      resource_size_t size,
-			      unsigned int flags)
-{
+	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_LMEM];
 	static struct lock_class_key lock_class;
-	struct drm_i915_private *i915 = mem->i915;
 	struct drm_i915_gem_object *obj;
+	int ret;
+
+	ret = i915_gem_object_pre_check(mem, &size, flags);
+	if (ret)
+		return ERR_PTR(ret);
 
 	obj = i915_gem_object_alloc();
 	if (!obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 1515384d7e0e..0902b3790e70 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -133,13 +133,12 @@ void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj)
 	intel_memory_region_put(mem);
 }
 
-struct drm_i915_gem_object *
-i915_gem_object_create_region(struct intel_memory_region *mem,
-			      resource_size_t size,
+int i915_gem_object_pre_check(struct intel_memory_region *mem,
+			      resource_size_t *size,
 			      unsigned int flags)
 {
-	struct drm_i915_gem_object *obj;
 
+	GEM_BUG_ON(!is_power_of_2(mem->min_page_size));
 	/*
 	 * NB: Our use of resource_size_t for the size stems from using struct
 	 * resource for the mem->region. We might need to revisit this in the
@@ -148,13 +147,13 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 
 	GEM_BUG_ON(flags & ~I915_BO_ALLOC_FLAGS);
 
-	if (!mem)
-		return ERR_PTR(-ENODEV);
+	*size = round_up(*size, mem->min_page_size);
+	if (*size == 0)
+		return -EINVAL;
 
-	size = round_up(size, mem->min_page_size);
-
-	GEM_BUG_ON(!size);
-	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_MIN_ALIGNMENT));
+	/* For most of the ABI (e.g. mmap) we think in system pages */
+	GEM_BUG_ON(!IS_ALIGNED(*size, PAGE_SIZE));
+	GEM_BUG_ON(!IS_ALIGNED(*size, I915_GTT_MIN_ALIGNMENT));
 
 	/*
 	 * XXX: There is a prevalence of the assumption that we fit the
@@ -163,15 +162,11 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	 * spot such a local variable, please consider fixing!
 	 */
 
-	if (size >> PAGE_SHIFT > INT_MAX)
-		return ERR_PTR(-E2BIG);
-
-	if (overflows_type(size, obj->base.size))
-		return ERR_PTR(-E2BIG);
+	if (*size >> PAGE_SHIFT > INT_MAX)
+		return -E2BIG;
 
-	obj = mem->ops->create_object(mem, size, flags);
-	if (!IS_ERR(obj))
-		trace_i915_gem_object_create(obj);
+	if (overflows_type(*size, size_t))
+		return -E2BIG;
 
-	return obj;
+	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index f2ff6f8bff74..584f3e91060c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -21,9 +21,7 @@ void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
 					unsigned long flags);
 void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj);
 
-struct drm_i915_gem_object *
-i915_gem_object_create_region(struct intel_memory_region *mem,
-			      resource_size_t size,
+int i915_gem_object_pre_check(struct intel_memory_region *mem,
+			      resource_size_t *size,
 			      unsigned int flags);
-
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 38113d3c0138..a190933399d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -464,19 +464,22 @@ static int __create_shmem(struct drm_i915_private *i915,
 	return 0;
 }
 
-static struct drm_i915_gem_object *
-create_shmem(struct intel_memory_region *mem,
-	     resource_size_t size,
-	     unsigned int flags)
+struct drm_i915_gem_object *
+i915_gem_object_create_shmem(struct drm_i915_private *i915,
+			     resource_size_t size)
 {
+	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_SMEM];	
 	static struct lock_class_key lock_class;
-	struct drm_i915_private *i915 = mem->i915;
 	struct drm_i915_gem_object *obj;
 	struct address_space *mapping;
 	unsigned int cache_level;
 	gfp_t mask;
 	int ret;
+	int flags = 0;
 
+	ret = i915_gem_object_pre_check(mem, &size, flags);
+	if (ret)
+		return ERR_PTR(ret);
 	obj = i915_gem_object_alloc();
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
@@ -529,14 +532,6 @@ create_shmem(struct intel_memory_region *mem,
 	return ERR_PTR(ret);
 }
 
-struct drm_i915_gem_object *
-i915_gem_object_create_shmem(struct drm_i915_private *i915,
-			     resource_size_t size)
-{
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_SMEM],
-					     size, 0);
-}
-
 /* Allocate a new GEM object and fill it with the supplied data */
 struct drm_i915_gem_object *
 i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
@@ -611,7 +606,6 @@ static void release_shmem(struct intel_memory_region *mem)
 static const struct intel_memory_region_ops shmem_region_ops = {
 	.init = init_shmem,
 	.release = release_shmem,
-	.create_object = create_shmem,
 };
 
 struct intel_memory_region *i915_gem_shmem_setup(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index e0f21f12d3ce..1dd4ccd020b1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -607,21 +607,22 @@ __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	return ERR_PTR(err);
 }
 
-static struct drm_i915_gem_object *
-_i915_gem_object_create_stolen(struct intel_memory_region *mem,
-			       resource_size_t size,
-			       unsigned int flags)
+struct drm_i915_gem_object *
+i915_gem_object_create_stolen(struct drm_i915_private *i915,
+			      resource_size_t size)
 {
-	struct drm_i915_private *i915 = mem->i915;
+	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_STOLEN];
 	struct drm_i915_gem_object *obj;
 	struct drm_mm_node *stolen;
 	int ret;
+	int flags = I915_BO_ALLOC_CONTIGUOUS;
 
 	if (!drm_mm_initialized(&i915->mm.stolen))
 		return ERR_PTR(-ENODEV);
 
-	if (size == 0)
-		return ERR_PTR(-EINVAL);
+	ret = i915_gem_object_pre_check(mem, &size, flags);
+	if (ret)
+		return ERR_PTR(ret);
 
 	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
 	if (!stolen)
@@ -646,14 +647,6 @@ _i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	return obj;
 }
 
-struct drm_i915_gem_object *
-i915_gem_object_create_stolen(struct drm_i915_private *i915,
-			      resource_size_t size)
-{
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_STOLEN],
-					     size, I915_BO_ALLOC_CONTIGUOUS);
-}
-
 static int init_stolen(struct intel_memory_region *mem)
 {
 	intel_memory_region_set_name(mem, "stolen");
@@ -673,7 +666,6 @@ static void release_stolen(struct intel_memory_region *mem)
 static const struct intel_memory_region_ops i915_region_stolen_ops = {
 	.init = init_stolen,
 	.release = release_stolen,
-	.create_object = _i915_gem_object_create_stolen,
 };
 
 struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 9aa3066cb75d..1096c1818a66 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -45,6 +45,7 @@
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_region.h"
+#include "gem/i915_gem_lmem.h"
 #include "gt/intel_engine_user.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
@@ -205,7 +206,8 @@ i915_gem_phys_pwrite(struct drm_i915_gem_object *obj,
 
 static int
 i915_gem_create(struct drm_file *file,
-		struct intel_memory_region *mr,
+		struct drm_i915_private *i915,
+		enum intel_memory_type mem_type,
 		u64 *size_p,
 		u32 *handle_p)
 {
@@ -214,16 +216,12 @@ i915_gem_create(struct drm_file *file,
 	u64 size;
 	int ret;
 
-	GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
-	size = round_up(*size_p, mr->min_page_size);
-	if (size == 0)
-		return -EINVAL;
-
-	/* For most of the ABI (e.g. mmap) we think in system pages */
-	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
-
-	/* Allocate the new object */
-	obj = i915_gem_object_create_region(mr, size, 0);
+	if (mem_type == INTEL_MEMORY_LOCAL)
+		obj = i915_gem_object_create_lmem(i915, size, 0);
+	else if (mem_type == INTEL_MEMORY_SYSTEM)
+		obj = i915_gem_object_create_shmem(i915, size);
+	else
+		obj = ERR_PTR(-ENODEV);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
@@ -278,9 +276,8 @@ i915_gem_dumb_create(struct drm_file *file,
 	if (HAS_LMEM(to_i915(dev)))
 		mem_type = INTEL_MEMORY_LOCAL;
 
-	return i915_gem_create(file,
-			       intel_memory_region_by_type(to_i915(dev),
-							   mem_type),
+	return i915_gem_create(file, to_i915(dev),
+			       mem_type,
 			       &args->size, &args->handle);
 }
 
@@ -299,9 +296,7 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	i915_gem_flush_free_objects(i915);
 
-	return i915_gem_create(file,
-			       intel_memory_region_by_type(i915,
-							   INTEL_MEMORY_SYSTEM),
+	return i915_gem_create(file, i915, INTEL_MEMORY_SYSTEM,
 			       &args->size, &args->handle);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 232490d89a83..b2db98a89795 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -61,11 +61,6 @@ struct intel_memory_region_ops {
 
 	int (*init)(struct intel_memory_region *mem);
 	void (*release)(struct intel_memory_region *mem);
-
-	struct drm_i915_gem_object *
-	(*create_object)(struct intel_memory_region *mem,
-			 resource_size_t size,
-			 unsigned int flags);
 };
 
 struct intel_memory_region {
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 40d8f1a95df6..e1b14add006b 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -98,7 +98,6 @@ region_lmem_init(struct intel_memory_region *mem)
 const struct intel_memory_region_ops intel_region_lmem_ops = {
 	.init = region_lmem_init,
 	.release = region_lmem_release,
-	.create_object = __i915_gem_lmem_object_create,
 };
 
 struct intel_memory_region *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
