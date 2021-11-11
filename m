Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0B44D6D5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 13:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9966EA54;
	Thu, 11 Nov 2021 12:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C476EA39;
 Thu, 11 Nov 2021 12:50:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="232845934"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="232845934"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 04:50:23 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="589915810"
Received: from isyrjala-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.216])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 04:50:21 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/i915/ttm: Break refcounting loops at device region
 unref time
Date: Thu, 11 Nov 2021 13:50:01 +0100
Message-Id: <20211111125003.178247-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111125003.178247-1-thomas.hellstrom@linux.intel.com>
References: <20211111125003.178247-1-thomas.hellstrom@linux.intel.com>
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

Break this loop when we drop the device reference count on the
region by putting the region move fence.

Also hold dropping the device reference count until all objects of
the region has been deleted, to avoid issues if proceeding with the
device takedown while the region is still present.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c     |  1 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  1 +
 drivers/gpu/drm/i915/intel_memory_region.c  |  5 +++-
 drivers/gpu/drm/i915/intel_memory_region.h  |  1 +
 drivers/gpu/drm/i915/intel_region_ttm.c     | 28 +++++++++++++++++++++
 drivers/gpu/drm/i915/intel_region_ttm.h     |  2 ++
 6 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 537a81445b90..a1df49378a0f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1044,6 +1044,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 
 static const struct intel_memory_region_ops ttm_system_region_ops = {
 	.init_object = __i915_gem_ttm_object_init,
+	.disable = intel_region_ttm_disable,
 };
 
 struct intel_memory_region *
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index aec838ecb2ef..956916fd21f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -108,6 +108,7 @@ region_lmem_init(struct intel_memory_region *mem)
 static const struct intel_memory_region_ops intel_region_lmem_ops = {
 	.init = region_lmem_init,
 	.release = region_lmem_release,
+	.disable = intel_region_ttm_disable,
 	.init_object = __i915_gem_ttm_object_init,
 };
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index e7f7e6627750..1f67d2b68c24 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -233,8 +233,11 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
 		struct intel_memory_region *region =
 			fetch_and_zero(&i915->mm.regions[i]);
 
-		if (region)
+		if (region) {
+			if (region->ops->disable)
+				region->ops->disable(region);
 			intel_memory_region_put(region);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3feae3353d33..9bb77eacd206 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -52,6 +52,7 @@ struct intel_memory_region_ops {
 
 	int (*init)(struct intel_memory_region *mem);
 	void (*release)(struct intel_memory_region *mem);
+	void (*disable)(struct intel_memory_region *mem);
 
 	int (*init_object)(struct intel_memory_region *mem,
 			   struct drm_i915_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 2e901a27e259..4219d83a2b19 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -114,6 +114,34 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
 	mem->region_private = NULL;
 }
 
+/**
+ * intel_region_ttm_disable - A TTM region disable callback helper
+ * @mem: The memory region.
+ *
+ * A helper that ensures that nothing any longer references a region at
+ * device takedown. Breaks refcounting loops and waits for objects in the
+ * region to be deleted.
+ */
+void intel_region_ttm_disable(struct intel_memory_region *mem)
+{
+	struct ttm_resource_manager *man = mem->region_private;
+
+	/*
+	 * Put the region's move fences. This releases requests that
+	 * may hold on to contexts and vms that may hold on to buffer
+	 * objects that may have a refcount on the region. :/
+	 */
+	if (man)
+		ttm_resource_manager_cleanup(man);
+
+	/* Flush objects that may just have been freed */
+	i915_gem_flush_free_objects(mem->i915);
+
+	/* Wait until the only region reference left is our own. */
+	while (kref_read(&mem->kref) > 1)
+		msleep(20);
+}
+
 /**
  * intel_region_ttm_resource_to_rsgt -
  * Convert an opaque TTM resource manager resource to a refcounted sg_table.
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index 7bbe2b46b504..197a8c179370 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -22,6 +22,8 @@ int intel_region_ttm_init(struct intel_memory_region *mem);
 
 void intel_region_ttm_fini(struct intel_memory_region *mem);
 
+void intel_region_ttm_disable(struct intel_memory_region *mem);
+
 struct i915_refct_sgt *
 intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 				  struct ttm_resource *res);
-- 
2.31.1

