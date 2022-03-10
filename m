Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3557A4D409E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 06:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A700110EAE2;
	Thu, 10 Mar 2022 05:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C2910EAE2;
 Thu, 10 Mar 2022 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646889538; x=1678425538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t8olrd5rKSTa+0ciPGG11S4vtbwiB+k54wzTx/8UzVk=;
 b=a4e6YS9Jg00Lfhwh74OQmJqyhyLg204jQsl0YdxsBWX824ffdsGrOnZq
 II+DXZu4itvqNzPLFUHjYqjzSeZ564LaMovysL/AR6I+XAitQiJkua3y8
 +BxhQEO5H97DalMUE3N1TyjRAUq5H5LBc6TFW5sjRghq+/kt2mUbY6tcQ
 +Uqux2jyqXXd5b0hpIFK06EsBU5Cuoknaa1vk5Wad7aSnrPPgT8d7t5ql
 OWZJTca9qhf+sJ/7HyLsl469Ez78Xh/StFUjwANksIGEVkKN8A+6GQ1ge
 MYaNXJdGtMt9tyca6bPveGZg4yjl0NXRl2TbQVNigU88apRY4vjX8l/ee g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="315880554"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="315880554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 21:18:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="554478308"
Received: from slsmith2-mobl.amr.corp.intel.com (HELO msatwood-mobl.intel.com)
 ([10.209.13.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 21:18:57 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/uapi: Add DRM_I915_QUERY_GEOMETRY_SUBSLICES
Date: Wed,  9 Mar 2022 21:18:53 -0800
Message-Id: <20220310051853.30440-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.21.3
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer platforms have DSS that aren't necessarily available for both
geometry and compute, two queries will need to exist. This introduces
the first, when passing a valid engine class and engine instance in the
flags returns a topology describing geometry.

v2: fix white space errors

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 68 ++++++++++++++++++++++---------
 include/uapi/drm/i915_drm.h       | 24 +++++++----
 2 files changed, 65 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 2dfbc22857a3..e4f35da28642 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "i915_perf.h"
 #include "i915_query.h"
+#include "gt/intel_engine_user.h"
 #include <uapi/drm/i915_drm.h>
 
 static int copy_query_item(void *query_hdr, size_t query_sz,
@@ -28,36 +29,30 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
 	return 0;
 }
 
-static int query_topology_info(struct drm_i915_private *dev_priv,
-			       struct drm_i915_query_item *query_item)
+static int fill_topology_info(const struct sseu_dev_info *sseu,
+			      struct drm_i915_query_item *query_item,
+			      const u8 *subslice_mask)
 {
-	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
 	struct drm_i915_query_topology_info topo;
 	u32 slice_length, subslice_length, eu_length, total_length;
 	int ret;
 
-	if (query_item->flags != 0)
-		return -EINVAL;
+	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
 
 	if (sseu->max_slices == 0)
 		return -ENODEV;
 
-	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
-
 	slice_length = sizeof(sseu->slice_mask);
 	subslice_length = sseu->max_slices * sseu->ss_stride;
 	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
 	total_length = sizeof(topo) + slice_length + subslice_length +
 		       eu_length;
 
-	ret = copy_query_item(&topo, sizeof(topo), total_length,
-			      query_item);
+	ret = copy_query_item(&topo, sizeof(topo), total_length, query_item);
+
 	if (ret != 0)
 		return ret;
 
-	if (topo.flags != 0)
-		return -EINVAL;
-
 	memset(&topo, 0, sizeof(topo));
 	topo.max_slices = sseu->max_slices;
 	topo.max_subslices = sseu->max_subslices;
@@ -69,27 +64,61 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
 	topo.eu_stride = sseu->eu_stride;
 
 	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
-			   &topo, sizeof(topo)))
+			 &topo, sizeof(topo)))
 		return -EFAULT;
 
 	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr + sizeof(topo)),
-			   &sseu->slice_mask, slice_length))
+			 &sseu->slice_mask, slice_length))
 		return -EFAULT;
 
 	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
-					   sizeof(topo) + slice_length),
-			   sseu->subslice_mask, subslice_length))
+					 sizeof(topo) + slice_length),
+			 subslice_mask, subslice_length))
 		return -EFAULT;
 
 	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
-					   sizeof(topo) +
-					   slice_length + subslice_length),
-			   sseu->eu_mask, eu_length))
+					 sizeof(topo) +
+					 slice_length + subslice_length),
+			 sseu->eu_mask, eu_length))
 		return -EFAULT;
 
 	return total_length;
 }
 
+static int query_topology_info(struct drm_i915_private *dev_priv,
+			       struct drm_i915_query_item *query_item)
+{
+	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
+
+	if (query_item->flags != 0)
+		return -EINVAL;
+
+	return fill_topology_info(sseu, query_item, sseu->subslice_mask);
+}
+
+static int query_geometry_subslices(struct drm_i915_private *i915,
+				    struct drm_i915_query_item *query_item)
+{
+	const struct sseu_dev_info *sseu;
+	struct intel_engine_cs *engine;
+	u8 engine_class, engine_instance;
+
+	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+		return -ENODEV;
+
+	engine_class = query_item->flags & 0xFF;
+	engine_instance = (query_item->flags >> 8) & 0xFF;
+
+	engine = intel_engine_lookup_user(i915, engine_class, engine_instance);
+
+	if (!engine)
+		return -EINVAL;
+
+	sseu = &engine->gt->info.sseu;
+
+	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
+}
+
 static int
 query_engine_info(struct drm_i915_private *i915,
 		  struct drm_i915_query_item *query_item)
@@ -485,6 +514,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 	query_engine_info,
 	query_perf_config,
 	query_memregion_info,
+	query_geometry_subslices,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 05c3642aaece..1fa6022e1558 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2687,10 +2687,11 @@ struct drm_i915_perf_oa_config {
 struct drm_i915_query_item {
 	/** @query_id: The id for this query */
 	__u64 query_id;
-#define DRM_I915_QUERY_TOPOLOGY_INFO    1
-#define DRM_I915_QUERY_ENGINE_INFO	2
-#define DRM_I915_QUERY_PERF_CONFIG      3
-#define DRM_I915_QUERY_MEMORY_REGIONS   4
+#define DRM_I915_QUERY_TOPOLOGY_INFO		1
+#define DRM_I915_QUERY_ENGINE_INFO		2
+#define DRM_I915_QUERY_PERF_CONFIG		3
+#define DRM_I915_QUERY_MEMORY_REGIONS		4
+#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	5
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -2714,6 +2715,9 @@ struct drm_i915_query_item {
 	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
 	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
 	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
+	 *
+	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have bits 0:7 set
+	 * as a valid engine class, and bits 8:15 must have a valid engine instance.
 	 */
 	__u32 flags;
 #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
@@ -2772,16 +2776,20 @@ struct drm_i915_query {
 };
 
 /*
- * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO :
+ * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO,
+ * DRM_I915_QUERY_GEOMETRY_SUBSLICE:
  *
  * data: contains the 3 pieces of information :
  *
- * - the slice mask with one bit per slice telling whether a slice is
- *   available. The availability of slice X can be queried with the following
- *   formula :
+ * - For DRM_I915_QUERY_TOPOLOGY_INFO the slice mask with one bit per slice
+ *   telling whether a slice is available. The availability of slice X can be
+ *   queried with the following formula :
  *
  *           (data[X / 8] >> (X % 8)) & 1
  *
+ * - For DRM_I915_QUERY_GEOMETRY_SUBSLICES Slices are equal to 1 and this field
+ *   is not used.
+ *
  * - the subslice mask for each slice with one bit per subslice telling
  *   whether a subslice is available. Gen12 has dual-subslices, which are
  *   similar to two gen11 subslices. For gen12, this array represents dual-
-- 
2.21.3

