Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3704FC7CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB3210E417;
	Mon, 11 Apr 2022 22:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D1B10E0FC;
 Mon, 11 Apr 2022 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649717006; x=1681253006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6WwvN7y4ArFU4yNiuCpSi6x5yHhjL93Oi6aMccisVRc=;
 b=c/+vkzymkPsOg4iJM9BNUx7fJ75tQgkX7dOT4Ne818mVoARH85YitR3j
 /s9wmcAE8rdjzhsqLBK7552MZF2VeKBX2wDt3047UN81rUYimiMMVI92Y
 EEZeX4eC8Iks2J7+qBruYthk/Bgl9hdawXEr7g2OvJ+0WgV9MzZKsCbKw
 Z33jSwDc8L8fSPs5923aQhmvRkdhZLHlt1sT3YkTLqs5Jd/fjqKSsvWkD
 1J4ZfCiWW9/Pp0YdzK8rvmWngOHF+lvAuvTVQs9pGtG81eAiI/jamiczG
 KRQ3jJoRUPPZcHsekBl2Zx2qf/G/Vp0F9kkaQoOnWVHlLxiirqRqmkRLa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249513174"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249513174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551432097"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/uapi: Add DRM_I915_QUERY_GEOMETRY_SUBSLICES
Date: Mon, 11 Apr 2022 15:43:19 -0700
Message-Id: <20220411224319.467166-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220411224319.467166-1-matthew.d.roper@intel.com>
References: <20220411224319.467166-1-matthew.d.roper@intel.com>
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
Cc: Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Atwood <matthew.s.atwood@intel.com>

Newer platforms have DSS that aren't necessarily available for both
geometry and compute, two queries will need to exist. This introduces
the first, when passing a valid engine class and engine instance in the
flags returns a topology describing geometry.

Based on past discussion, we currently only support this new query item
on Xe_HP and beyond; earlier platforms do not need to worry about
geometry and compute pipelines having access to different topology and
should continue to use the existing topology query.

v2: fix white space errors
v3: change flags from hosting 2 8 bit numbers to holding a
i915_engine_class_instance struct
v4: add error if non rcs engine passed.
v5 (by MattR):
 - Improve kerneldoc and cross references to related structs/enums.
   (Daniel)
 - Clarify that geometry query is only supported on render engines
   (Francisco)
 - Clarify that the new query is only supported on Xe_HP+.
 - Fix checkpatch warnings.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Francisco Jerez <currojerez@riseup.net>
UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 71 ++++++++++++++++++++++---------
 include/uapi/drm/i915_drm.h       | 27 ++++++++++--
 2 files changed, 75 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index b5ca00cb6cf6..7584cec53d5d 100644
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
@@ -69,27 +64,64 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
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
+	struct i915_engine_class_instance classinstance;
+
+	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+		return -ENODEV;
+
+	classinstance = *((struct i915_engine_class_instance *)&query_item->flags);
+
+	engine = intel_engine_lookup_user(i915, (u8)classinstance.engine_class,
+					  (u8)classinstance.engine_instance);
+
+	if (!engine)
+		return -EINVAL;
+
+	if (engine->class != RENDER_CLASS)
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
@@ -508,6 +540,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 	query_perf_config,
 	query_memregion_info,
 	query_hwconfig_blob,
+	query_geometry_subslices,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 097a7935a510..35ca528803fd 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -172,7 +172,9 @@ enum drm_i915_gem_engine_class {
 	I915_ENGINE_CLASS_INVALID	= -1
 };
 
-/*
+/**
+ * struct i915_engine_class_instance - Engine class/instance identifier
+ *
  * There may be more than one engine fulfilling any role within the system.
  * Each engine of a class is given a unique instance number and therefore
  * any engine can be specified by its class:instance tuplet. APIs that allow
@@ -180,10 +182,21 @@ enum drm_i915_gem_engine_class {
  * for this identification.
  */
 struct i915_engine_class_instance {
-	__u16 engine_class; /* see enum drm_i915_gem_engine_class */
-	__u16 engine_instance;
+	/**
+	 * @engine_class:
+	 *
+	 * Engine class from enum drm_i915_gem_engine_class
+	 */
+	__u16 engine_class;
 #define I915_ENGINE_CLASS_INVALID_NONE -1
 #define I915_ENGINE_CLASS_INVALID_VIRTUAL -2
+
+	/**
+	 * @engine_instance:
+	 *
+	 * Engine instance.
+	 */
+	__u16 engine_instance;
 };
 
 /**
@@ -2735,6 +2748,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_PERF_CONFIG (see struct drm_i915_query_perf_config)
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
+	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -2742,6 +2756,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_PERF_CONFIG		3
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
+#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -2765,6 +2780,9 @@ struct drm_i915_query_item {
 	 *	- %DRM_I915_QUERY_PERF_CONFIG_LIST
 	 *      - %DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
 	 *      - %DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
+	 *
+	 * When &query_id == %DRM_I915_QUERY_GEOMETRY_SUBSLICES must contain
+	 * a struct i915_engine_class_instance that references a render engine.
 	 */
 	__u32 flags;
 #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
@@ -3051,7 +3069,8 @@ struct drm_i915_query_engine_info {
 /**
  * struct drm_i915_query_perf_config
  *
- * Data written by the kernel with query %DRM_I915_QUERY_PERF_CONFIG.
+ * Data written by the kernel with query %DRM_I915_QUERY_PERF_CONFIG and
+ * %DRM_I915_QUERY_GEOMETRY_SUBSLICES.
  */
 struct drm_i915_query_perf_config {
 	union {
-- 
2.34.1

