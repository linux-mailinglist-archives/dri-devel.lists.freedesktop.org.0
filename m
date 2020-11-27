Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE82C6509
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EC36ECBA;
	Fri, 27 Nov 2020 12:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E116ECB0;
 Fri, 27 Nov 2020 12:10:14 +0000 (UTC)
IronPort-SDR: UBUf+8cUaY2RWoB2yK3Ke4EGFUrZsK0pRzEHgPVgXdzlByWrqm5pCe0hyixkZl3as/4fvyQIX/
 aMFZXnjxtk2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540783"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540783"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:14 -0800
IronPort-SDR: 18mjr8VqtP8qdlCorn/NxKlKxekUNynMS1eqRfQpDIJXoIlN6wFfUDtMnpHPvurr4NHEeVEUZw
 R7UHe6NwnJsg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029283"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 090/162] drm/i915/query: Expose memory regions through the
 query uAPI
Date: Fri, 27 Nov 2020 12:06:06 +0000
Message-Id: <20201127120718.454037-91-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

Returns the available memory region areas supported by the HW.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 12 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h |  3 ++
 drivers/gpu/drm/i915/i915_drv.c            |  2 +-
 drivers/gpu/drm/i915/i915_pci.c            |  2 +-
 drivers/gpu/drm/i915/i915_query.c          | 62 ++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_memory_region.c | 32 ++++++-----
 drivers/gpu/drm/i915/intel_memory_region.h | 38 +++++++------
 include/uapi/drm/i915_drm.h                | 58 ++++++++++++++++++++
 8 files changed, 172 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ce9086d3a647..25e3cc53316e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -704,11 +704,19 @@ _i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	return obj;
 }
 
+struct intel_memory_region *i915_stolen_region(struct drm_i915_private *i915)
+{
+	if (HAS_LMEM(i915))
+		return i915->mm.regions[INTEL_REGION_STOLEN_LMEM];
+
+	return i915->mm.regions[INTEL_REGION_STOLEN_SMEM];
+}
+
 struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_STOLEN],
+	return i915_gem_object_create_region(i915_stolen_region(i915),
 					     size, I915_BO_ALLOC_CONTIGUOUS);
 }
 
@@ -748,7 +756,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 					       resource_size_t stolen_offset,
 					       resource_size_t size)
 {
-	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_STOLEN];
+	struct intel_memory_region *mem = i915_stolen_region(i915);
 	struct drm_i915_gem_object *obj;
 	struct drm_mm_node *stolen;
 	int ret;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index 61e028063f9f..67f6264f3ff9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -22,6 +22,9 @@ int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *dev_priv,
 void i915_gem_stolen_remove_node(struct drm_i915_private *dev_priv,
 				 struct drm_mm_node *node);
 struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915);
+
+struct intel_memory_region *i915_stolen_region(struct drm_i915_private *i915);
+
 struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *dev_priv,
 			      resource_size_t size);
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 320856b665a1..07b3a89ec09e 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -843,7 +843,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		if (INTEL_GEN(i915) >= 9 && i915_selftest.live < 0 &&
 		    i915->params.fake_lmem_start) {
 			mkwrite_device_info(i915)->memory_regions =
-				REGION_SMEM | REGION_LMEM | REGION_STOLEN;
+				REGION_SMEM | REGION_LMEM | REGION_STOLEN_SMEM;
 			GEM_BUG_ON(!HAS_LMEM(i915));
 		}
 	}
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 11fe790b1969..8243178a56f9 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -154,7 +154,7 @@
 	.page_sizes = I915_GTT_PAGE_SIZE_4K
 
 #define GEN_DEFAULT_REGIONS \
-	.memory_regions = REGION_SMEM | REGION_STOLEN
+	.memory_regions = REGION_SMEM | REGION_STOLEN_SMEM
 
 #define I830_FEATURES \
 	GEN(2), \
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index fed337ad7b68..d4ca040c528b 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -419,11 +419,73 @@ static int query_perf_config(struct drm_i915_private *i915,
 	}
 }
 
+static int query_memregion_info(struct drm_i915_private *dev_priv,
+				struct drm_i915_query_item *query_item)
+{
+	struct drm_i915_query_memory_regions __user *query_ptr =
+		u64_to_user_ptr(query_item->data_ptr);
+	struct drm_i915_memory_region_info __user *info_ptr =
+		&query_ptr->regions[0];
+	struct drm_i915_memory_region_info info = { };
+	struct drm_i915_query_memory_regions query;
+	u32 total_length;
+	int ret, i;
+
+	if (query_item->flags != 0)
+		return -EINVAL;
+
+	total_length = sizeof(query);
+	for (i = 0; i < ARRAY_SIZE(dev_priv->mm.regions); ++i) {
+		struct intel_memory_region *region = dev_priv->mm.regions[i];
+
+		if (!region)
+			continue;
+
+		total_length += sizeof(info);
+	}
+
+	ret = copy_query_item(&query, sizeof(query), total_length, query_item);
+	if (ret != 0)
+		return ret;
+
+	if (query.num_regions)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(query.rsvd); ++i) {
+		if (query.rsvd[i])
+			return  -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dev_priv->mm.regions); ++i) {
+		struct intel_memory_region *region = dev_priv->mm.regions[i];
+
+		if (!region)
+			continue;
+
+		info.region.memory_class = region->type;
+		info.region.memory_instance = region->instance;
+		info.probed_size = region->total;
+		info.unallocated_size = region->avail;
+
+		if (__copy_to_user(info_ptr, &info, sizeof(info)))
+			return -EFAULT;
+
+		query.num_regions++;
+		info_ptr++;
+	}
+
+	if (__copy_to_user(query_ptr, &query, sizeof(query)))
+		return -EFAULT;
+
+	return total_length;
+}
+
 static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 					struct drm_i915_query_item *query_item) = {
 	query_topology_info,
 	query_engine_info,
 	query_perf_config,
+	query_memregion_info,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 308f89b87834..dca1e367ab98 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -6,14 +6,19 @@
 #include "intel_memory_region.h"
 #include "i915_drv.h"
 
-/* XXX: Hysterical raisins. BIT(inst) needs to just be (inst) at some point. */
-#define REGION_MAP(type, inst) \
-	BIT((type) + INTEL_MEMORY_TYPE_SHIFT) | BIT(inst)
-
-const u32 intel_region_map[] = {
-	[INTEL_REGION_SMEM] = REGION_MAP(INTEL_MEMORY_SYSTEM, 0),
-	[INTEL_REGION_LMEM] = REGION_MAP(INTEL_MEMORY_LOCAL, 0),
-	[INTEL_REGION_STOLEN] = REGION_MAP(INTEL_MEMORY_STOLEN, 0),
+const struct intel_memory_region_info intel_region_map[] = {
+       [INTEL_REGION_SMEM] = {
+               .class = INTEL_MEMORY_SYSTEM,
+               .instance = 0,
+       },
+       [INTEL_REGION_LMEM] = {
+               .class = INTEL_MEMORY_LOCAL,
+               .instance = 0,
+       },
+       [INTEL_REGION_STOLEN_SMEM] = {
+               .class = INTEL_MEMORY_STOLEN_SYSTEM,
+               .instance = 0,
+       },
 };
 
 struct intel_memory_region *
@@ -263,17 +268,18 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 
 	for (i = 0; i < ARRAY_SIZE(i915->mm.regions); i++) {
 		struct intel_memory_region *mem = ERR_PTR(-ENODEV);
-		u32 type;
+		u16 type, instance;
 
 		if (!HAS_REGION(i915, BIT(i)))
 			continue;
 
-		type = MEMORY_TYPE_FROM_REGION(intel_region_map[i]);
+		type = intel_region_map[i].class;
+		instance = intel_region_map[i].instance;
 		switch (type) {
 		case INTEL_MEMORY_SYSTEM:
 			mem = i915_gem_shmem_setup(i915);
 			break;
-		case INTEL_MEMORY_STOLEN:
+		case INTEL_MEMORY_STOLEN_SYSTEM:
 			mem = i915_gem_stolen_setup(i915);
 			break;
 		case INTEL_MEMORY_LOCAL:
@@ -289,9 +295,9 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 			goto out_cleanup;
 		}
 
-		mem->id = intel_region_map[i];
+		mem->id = i;
 		mem->type = type;
-		mem->instance = MEMORY_INSTANCE_FROM_REGION(intel_region_map[i]);
+		mem->instance = instance;
 
 		i915->mm.regions[i] = mem;
 	}
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 232490d89a83..c047cf7c5e7c 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/io-mapping.h>
 #include <drm/drm_mm.h>
+#include <drm/i915_drm.h>
 
 #include "i915_buddy.h"
 
@@ -19,30 +20,25 @@ struct drm_i915_gem_object;
 struct intel_memory_region;
 struct sg_table;
 
-/**
- *  Base memory type
- */
 enum intel_memory_type {
-	INTEL_MEMORY_SYSTEM = 0,
-	INTEL_MEMORY_LOCAL,
-	INTEL_MEMORY_STOLEN,
+	INTEL_MEMORY_SYSTEM = I915_MEMORY_CLASS_SYSTEM,
+	INTEL_MEMORY_LOCAL = I915_MEMORY_CLASS_DEVICE,
+	INTEL_MEMORY_STOLEN_SYSTEM = I915_MEMORY_CLASS_STOLEN_SYSTEM,
+	INTEL_MEMORY_STOLEN_LOCAL = I915_MEMORY_CLASS_STOLEN_DEVICE,
 };
 
 enum intel_region_id {
 	INTEL_REGION_SMEM = 0,
 	INTEL_REGION_LMEM,
-	INTEL_REGION_STOLEN,
+	INTEL_REGION_STOLEN_SMEM,
+	INTEL_REGION_STOLEN_LMEM,
 	INTEL_REGION_UNKNOWN, /* Should be last */
 };
 
 #define REGION_SMEM     BIT(INTEL_REGION_SMEM)
 #define REGION_LMEM     BIT(INTEL_REGION_LMEM)
-#define REGION_STOLEN   BIT(INTEL_REGION_STOLEN)
-
-#define INTEL_MEMORY_TYPE_SHIFT 16
-
-#define MEMORY_TYPE_FROM_REGION(r) (ilog2((r) >> INTEL_MEMORY_TYPE_SHIFT))
-#define MEMORY_INSTANCE_FROM_REGION(r) (ilog2((r) & 0xffff))
+#define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
+#define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
 
 #define I915_ALLOC_MIN_PAGE_SIZE  BIT(0)
 #define I915_ALLOC_CONTIGUOUS     BIT(1)
@@ -51,10 +47,12 @@ enum intel_region_id {
 	for (id = 0; id < ARRAY_SIZE((i915)->mm.regions); id++) \
 		for_each_if((mr) = (i915)->mm.regions[id])
 
-/**
- * Memory regions encoded as type | instance
- */
-extern const u32 intel_region_map[];
+struct intel_memory_region_info {
+       u16 class;
+       u16 instance;
+};
+
+extern const struct intel_memory_region_info intel_region_map[];
 
 struct intel_memory_region_ops {
 	unsigned int flags;
@@ -89,9 +87,9 @@ struct intel_memory_region {
 	resource_size_t total;
 	resource_size_t avail;
 
-	unsigned int type;
-	unsigned int instance;
-	unsigned int id;
+	u16 type;
+	u16 instance;
+	enum intel_region_id id;
 	char name[8];
 
 	dma_addr_t remap_addr;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index fa1f3d62f9a6..41845203250d 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2175,6 +2175,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_TOPOLOGY_INFO    1
 #define DRM_I915_QUERY_ENGINE_INFO	2
 #define DRM_I915_QUERY_PERF_CONFIG      3
+#define DRM_I915_QUERY_MEMORY_REGIONS   4
 /* Must be kept compact -- no holes and well documented */
 
 	/*
@@ -2375,6 +2376,63 @@ struct drm_i915_query_perf_config {
 	__u8 data[];
 };
 
+enum drm_i915_gem_memory_class {
+	I915_MEMORY_CLASS_SYSTEM = 0,
+	I915_MEMORY_CLASS_DEVICE,
+	I915_MEMORY_CLASS_STOLEN_SYSTEM,
+	I915_MEMORY_CLASS_STOLEN_DEVICE,
+};
+
+struct drm_i915_gem_memory_class_instance {
+	__u16 memory_class; /* see enum drm_i915_gem_memory_class */
+	__u16 memory_instance;
+};
+
+/**
+ * struct drm_i915_memory_region_info
+ *
+ * Describes one region as known to the driver.
+ */
+struct drm_i915_memory_region_info {
+	/** class:instance pair encoding */
+	struct drm_i915_gem_memory_class_instance region;
+
+	/** MBZ */
+	__u32 rsvd0;
+
+	/** MBZ */
+	__u64 caps;
+
+	/** MBZ */
+	__u64 flags;
+
+	/** Memory probed by the driver (-1 = unknown) */
+	__u64 probed_size;
+
+	/** Estimate of memory remaining (-1 = unknown) */
+	__u64 unallocated_size;
+
+	/** MBZ */
+	__u64 rsvd1[8];
+};
+
+/**
+ * struct drm_i915_query_memory_regions
+ *
+ * Region info query enumerates all regions known to the driver by filling in
+ * an array of struct drm_i915_memory_region_info structures.
+ */
+struct drm_i915_query_memory_regions {
+	/** Number of supported regions */
+	__u32 num_regions;
+
+	/** MBZ */
+	__u32 rsvd[3];
+
+	/* Info about each supported region */
+	struct drm_i915_memory_region_info regions[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
