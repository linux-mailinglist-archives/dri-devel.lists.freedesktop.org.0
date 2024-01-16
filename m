Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70B82F2F9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157EC10E5B7;
	Tue, 16 Jan 2024 17:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694B010E554;
 Tue, 16 Jan 2024 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425245; x=1736961245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=flRjd73e521e5g8H5uqItw09KxnYmCE7mhwdkBmlwy8=;
 b=FA4vlHLodIINiz1amfnnG5z56fCrtIRRbNTw6sNxNmXw6NQVps5pvAic
 3Xz38G1QJ4phKWFjTJKy01cOGlXgbF78/tkm08GJO1oyT7VjYjdyRQwkk
 EpMhCFi9NNopdXI8Uknam+W8O55DEMgzHNzbEMENEZG+U2d1C08iC3M5u
 BT5eEX7pQyJrB1flXqwiUmCCeX2aQqilLi3J+zgl39/60AYaHOoniAscm
 2vqooLkul1LiIl+GuEWm9Q7jU/ljINtqZsyYkP9st9tuMutHYJ2J41EO/
 y6mL0aztRAzcp9tcQi+6gWRAeFHN9hXkoo/YcFDG/B5nV+DNufNuuhRz6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593353"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593353"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869615"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:45 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Update GuC ADS size for error capture
Date: Tue, 16 Jan 2024 09:12:31 -0800
Message-Id: <20240116171237.118463-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update GuC ADS size allocation to include space for
the lists of error state capture register descriptors.

Then, populate GuC ADS with the lists of registers we want
GuC to report back to host on engine reset events. This list
should include global, engine-class and engine-instance
registers for every engine-class type on the current hardware.

Ensure we allocate a persistent store for the register lists
that are populated into ADS so that we don't need to allocate
memory during GT resets when GuC is reloaded and ADS population
happens again.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c          | 255 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |   2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 265 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   6 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h | 225 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h         |  20 ++
 drivers/gpu/drm/xe/xe_guc_types.h        |   2 +
 7 files changed, 739 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 390e6f1bf4e1..9b84a9c1a78f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -14,6 +14,8 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -133,8 +135,7 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 {
-	/* FIXME: Allocate a proper capture list */
-	return PAGE_ALIGN(PAGE_SIZE);
+	return PAGE_ALIGN(ads->capture_size);
 }
 
 static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
@@ -260,6 +261,34 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static size_t calculate_capture_worst_size(struct xe_guc_ads *ads)
+{
+	struct xe_guc *guc = ads_to_guc(ads);
+	size_t total_size, class_size, instance_size, global_size;
+	int i, j;
+
+	/* Early calcuate the capture size, to reserve capture size before guc init finished,
+	 * as engine mask is not ready, the calculate here is the worst case size
+	 */
+	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
+		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
+			class_size = 0;
+			instance_size = 0;
+			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+						   j, &class_size);
+			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+						   j, &instance_size);
+			total_size += class_size + instance_size;
+		}
+		global_size = 0;
+		xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &global_size);
+		total_size += PAGE_ALIGN(global_size);
+	}
+
+	return total_size;
+}
+
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
 int xe_guc_ads_init(struct xe_guc_ads *ads)
@@ -270,6 +299,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	struct xe_bo *bo;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
+	ads->capture_size = calculate_capture_worst_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
@@ -283,33 +313,6 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	return 0;
 }
 
-/**
- * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
- * @ads: Additional data structures object
- *
- * Recalcuate golden_lrc_size & regset_size as the number hardware engines may
- * have changed after the hwconfig was loaded. Also verify the new sizes fit in
- * the already allocated ADS buffer object.
- *
- * Return: 0 on success, negative error code on error.
- */
-int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
-{
-	struct xe_gt *gt = ads_to_gt(ads);
-	u32 prev_regset_size = ads->regset_size;
-
-	xe_gt_assert(gt, ads->bo);
-
-	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
-	ads->regset_size = calculate_regset_size(gt);
-
-	xe_gt_assert(gt, ads->golden_lrc_size +
-		     (ads->regset_size - prev_regset_size) <=
-		     MAX_GOLDEN_LRC_SIZE);
-
-	return 0;
-}
-
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -393,20 +396,171 @@ static void guc_mapping_table_init(struct xe_gt *gt,
 	}
 }
 
-static void guc_capture_list_init(struct xe_guc_ads *ads)
+static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
+				       u32 capture_class)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 mask;
+
+	switch (capture_class) {
+	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
+		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEO:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_BLITTER:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
+		break;
+
+	default:
+		mask = 0;
+	}
+
+	return mask;
+}
+
+static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 {
+	struct xe_guc *guc = ads_to_guc(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
+	struct iosys_map info_map;
+	bool ads_is_mapped;
+	size_t size = 0;
+	void *ptr;
 	int i, j;
-	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
 
-	/* FIXME: Populate a proper capture list */
+	ads_is_mapped = ads->capture_size != 0;
+	if (ads_is_mapped) {
+		capture_offset = guc_ads_capture_offset(ads);
+		ads_ggtt =  xe_bo_ggtt_addr(ads->bo);
+		info_map =  IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
+						  offsetof(struct __guc_ads_blob, system_info));
+	} else {
+		/* Bail with worst case size calculations */
+		total_size = calculate_capture_worst_size(ads);
+		return total_size;
+	}
+
+	/* first, set aside the first page for a capture_list with zero descriptors */
+	total_size = PAGE_SIZE;
+	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
+
+	null_ggtt = ads_ggtt + capture_offset;
+	capture_offset += PAGE_SIZE;
+
+	/* Populate capture list : at this point adps is already allocated and mapped to worst case
+	 * size
+	 */
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
+		bool write_empty_list;
 		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
-			ads_blob_write(ads, ads.capture_instance[i][j], addr);
-			ads_blob_write(ads, ads.capture_class[i][j], addr);
+			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
+			/* null list if we dont have said engine or list */
+			if (!engine_mask) {
+				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
+				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
+				continue;
+			}
+			/********************************************************/
+			/*** engine exists: start with engine-class registers ***/
+			/********************************************************/
+			write_empty_list = true; /* starting assumption is an empty list */
+			size = 0;
+			if (!xe_guc_capture_getlistsize(guc, i,
+							GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+							j, &size)) {
+				if (total_size + size > ads->capture_size)
+					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+						  total_size + size, ads->capture_size);
+				else if (!xe_guc_capture_getlist(guc, i,
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+								 j, &ptr))
+					/* everything checked out, populate! */
+					write_empty_list = false;
+			}
+			if (!write_empty_list) {
+				ads_blob_write(ads, ads.capture_class[i][j],
+					       ads_ggtt + capture_offset);
+				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
+						 ptr, size);
+				total_size += size;
+				capture_offset += size;
+			} else {
+				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
+			}
+
+			/********************************************************/
+			/*** engine exists: next, engine-instance registers   ***/
+			/********************************************************/
+			write_empty_list = true; /* starting assumption is an empty list */
+			size = 0;
+			if (!xe_guc_capture_getlistsize(guc, i,
+							GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+							j, &size)) {
+				if (total_size + size > ads->capture_size)
+					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+						  total_size + size, ads->capture_size);
+				else if (!xe_guc_capture_getlist(guc, i,
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+								 j, &ptr))
+					/* everything checked out, populate! */
+					write_empty_list = false;
+			}
+
+			if (!write_empty_list) {
+				ads_blob_write(ads, ads.capture_instance[i][j],
+					       ads_ggtt + capture_offset);
+				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
+						 ptr, size);
+				total_size += size;
+				capture_offset += size;
+			} else {
+				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
+			}
 		}
 
-		ads_blob_write(ads, ads.capture_global[i], addr);
+		/********************************************************/
+		/*** global registers is last in our PF/VF loops      ***/
+		/********************************************************/
+		write_empty_list = true; /* starting assumption is an empty list */
+		size = 0;
+		if (!xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &size)) {
+			if (total_size + size > ads->capture_size)
+				xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+					  total_size + size, ads->capture_size);
+			else if (!xe_guc_capture_getlist(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0,
+							 &ptr))
+				write_empty_list = false; /* everything checked out, populate! */
+		}
+		if (!write_empty_list) {
+			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
+			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
+					 size);
+			total_size += size;
+			capture_offset += size;
+		} else {
+			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
+		}
 	}
+
+	if (ads->capture_size != PAGE_ALIGN(total_size))
+		xe_gt_info(gt, "ADS capture alloc size changed from %d to %d\n",
+			   ads->capture_size, PAGE_ALIGN(total_size));
+	return PAGE_ALIGN(total_size);
 }
 
 static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
@@ -549,6 +703,35 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
 	}
 }
 
+/**
+ * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
+ * @ads: Additional data structures object
+ *
+ * Recalcuate golden_lrc_size & regset_size as the number hardware engines may
+ * have changed after the hwconfig was loaded. Also verify the new sizes fit in
+ * the already allocated ADS buffer object.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
+{
+	struct xe_gt *gt = ads_to_gt(ads);
+	u32 prev_regset_size = ads->regset_size;
+
+	xe_gt_assert(gt, ads->bo);
+
+	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
+	ads->capture_size = 0; /* Clear capture_size before run guc_capture_prep_lists */
+	ads->capture_size = guc_capture_prep_lists(ads);
+	ads->regset_size = calculate_regset_size(gt);
+
+	xe_gt_assert(gt, ads->golden_lrc_size + ads->capture_size +
+		     (ads->regset_size - prev_regset_size) <=
+		     MAX_GOLDEN_LRC_SIZE);
+
+	return 0;
+}
+
 /**
  * xe_guc_ads_populate_minimal - populate minimal ADS
  * @ads: Additional data structures object
@@ -595,7 +778,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_mmio_reg_state_init(ads);
 	guc_prep_golden_lrc_null(ads);
 	guc_mapping_table_init(gt, &info_map);
-	guc_capture_list_init(ads);
+	guc_capture_prep_lists(ads);
 	guc_doorbell_init(ads);
 
 	if (xe->info.has_usm) {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 4afe44bece4b..82cf569b0710 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -20,6 +20,8 @@ struct xe_guc_ads {
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
 	u32 regset_size;
+	/** @capture_size: size of register set passed to GuC for capture */
+	u32 capture_size;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 5e8b063f723f..c8048b35a7eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_guc_ct.h"
 
 #include "xe_guc_log.h"
@@ -93,6 +94,28 @@
 	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
 	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
 
+static const char * capture_list_type_names [] = {
+	"Global",
+	"Class",
+	"Instance",
+	"unknown",	/* Default name, if out of bound */
+};
+
+static const char * capture_engine_class_names [] = {
+	"Render/Compute",
+	"Video",
+	"VideoEnhance",
+	"Blitter",
+	"GSC-Other",
+	"unknown",	/* Default name, if out of bound */
+};
+
+/* Get item from array by index.
+ * The last item is the default value, referenced for index out of bound condition.
+ */
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])
+ 
 static inline void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
 					     unsigned int *group, unsigned int *instance)
 {
@@ -120,8 +143,250 @@ static inline bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslic
 	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
 		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
 
+static const struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
+			 u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].list; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+static struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
+			     u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].extlist; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+static const struct __guc_mmio_reg_descr_group *
+guc_capture_get_device_reglist(struct xe_guc *guc)
+{
+	//FIXME: add register list
+	return NULL;
+}
+
+static int
+guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
+		      struct guc_mmio_reg *ptr, u16 num_entries)
+{
+	u32 i = 0, j = 0;
+	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
+	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
+	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+
+	if (!reglists)
+		return -ENODEV;
+
+	match = guc_capture_get_one_list(reglists, owner, type, classid);
+	if (!match)
+		return -ENODATA;
+
+	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
+		ptr[i].offset = match->list[i].reg.addr;
+		ptr[i].value = 0xDEADF00D;
+		ptr[i].flags = match->list[i].flags;
+		ptr[i].mask = match->list[i].mask;
+	}
+
+	matchext = guc_capture_get_one_ext_list(extlists, owner, type, classid);
+	if (matchext) {
+		for (i = match->num_regs, j = 0; i < num_entries &&
+		     i < (match->num_regs + matchext->num_regs) &&
+			j < matchext->num_regs; ++i, ++j) {
+			ptr[i].offset = matchext->extlist[j].reg.addr;
+			ptr[i].value = 0xDEADF00D;
+			ptr[i].flags = matchext->extlist[j].flags;
+			ptr[i].mask = matchext->extlist[j].mask;
+		}
+	}
+	if (i < num_entries)
+		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
+			  num_entries);
+
+	return 0;
+}
+
+static int
+guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
+{
+	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+	int num_regs;
+
+	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
+	if (!match)
+		return 0;
+
+	num_regs = match->num_regs;
+
+	matchext = guc_capture_get_one_ext_list(gc->extlists, owner, type, classid);
+	if (matchext)
+		num_regs += matchext->num_regs;
+
+	return num_regs;
+}
+
+static int
+guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
+			size_t *size, bool is_purpose_est)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
+	int num_regs;
+
+	if (!gc->reglists) {
+		xe_gt_warn(guc_to_gt(guc), "No capture reglist for this device\n");
+		return -ENODEV;
+	}
+
+	if (cache->is_valid) {
+		*size = cache->size;
+		return cache->status;
+	}
+
+	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
+	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
+		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
+			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: global!\n");
+		else
+			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: %s(%u):%s(%u)!\n",
+				   get_item_with_default(capture_list_type_names, type), type,
+				   get_item_with_default(capture_engine_class_names, classid),
+				   classid);
+		return -ENODEV;
+	}
+
+	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
+	/* intentional empty lists can exist depending on hw config */
+	if (!num_regs)
+		return -ENODATA;
+
+	if (size)
+		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
+				   (num_regs * sizeof(struct guc_mmio_reg)));
+
+	return 0;
+}
+
+int
+xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
+{
+	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
+}
+
+int
+xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
+	struct guc_debug_capture_list *listnode;
+	int ret, num_regs;
+	u8 *caplist, *tmp;
+	size_t size = 0;
+
+	if (!gc->reglists)
+		return -ENODEV;
+
+	if (cache->is_valid) {
+		*outptr = cache->ptr;
+		return cache->status;
+	}
+
+	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
+	if (ret) {
+		cache->is_valid = true;
+		cache->ptr = NULL;
+		cache->size = 0;
+		cache->status = ret;
+		return ret;
+	}
+
+	caplist = kzalloc(size, GFP_KERNEL);
+	if (!caplist) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");
+		return -ENOMEM;
+	}
+
+	/* populate capture list header */
+	tmp = caplist;
+	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
+	listnode = (struct guc_debug_capture_list *)tmp;
+	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
+
+	/* populate list of register descriptor */
+	tmp += sizeof(struct guc_debug_capture_list);
+	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
+
+	/* cache this list */
+	cache->is_valid = true;
+	cache->ptr = caplist;
+	cache->size = size;
+	cache->status = 0;
+
+	*outptr = caplist;
+
+	return 0;
+}
+
+int
+xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	int tmp = sizeof(u32) * 4;
+	void *null_header;
+
+	if (gc->ads_null_cache) {
+		*outptr = gc->ads_null_cache;
+		*size = tmp;
+		return 0;
+	}
+
+	null_header = kzalloc(tmp, GFP_KERNEL);
+	if (!null_header) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");
+		return -ENOMEM;
+	}
+
+	gc->ads_null_cache = null_header;
+	*outptr = null_header;
+	*size = tmp;
+
+	return 0;
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
+	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
+	if (!guc->capture)
+		return -ENOMEM;
+
+	guc->capture->reglists = guc_capture_get_device_reglist(guc);
+
+	INIT_LIST_HEAD(&guc->capture->outlist);
+	INIT_LIST_HEAD(&guc->capture->cachelist);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 35fedc78d9e2..efa4f177aab5 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -14,6 +14,12 @@ struct xe_hw_engine;
 struct xe_gt;
 struct xe_guc;
 
+bool xe_guc_capture_is_matching_engine(struct xe_gt *gt, struct xe_exec_queue *ce,
+				       struct xe_hw_engine *engine);
+void xe_guc_capture_process(struct xe_guc *guc);
+int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
+int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
+int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif /* _XE_GUC_CAPTURE_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
new file mode 100644
index 000000000000..544f56b0ae93
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -0,0 +1,225 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_FWIF_H
+#define _XE_GUC_CAPTURE_FWIF_H
+
+#include <linux/types.h>
+#include "regs/xe_reg_defs.h"
+#include "xe_guc_fwif.h"
+
+struct xe_guc;
+struct file;
+
+/*
+ * struct __guc_capture_bufstate
+ *
+ * Book-keeping structure used to track read and write pointers
+ * as we extract error capture data from the GuC-log-buffer's
+ * error-capture region as a stream of dwords.
+ */
+struct __guc_capture_bufstate {
+	u32 size;
+	void *data;
+	u32 rd;
+	u32 wr;
+};
+
+/*
+ * struct __guc_capture_parsed_output - extracted error capture node
+ *
+ * A single unit of extracted error-capture output data grouped together
+ * at an engine-instance level. We keep these nodes in a linked list.
+ * See cachelist and outlist below.
+ */
+struct __guc_capture_parsed_output {
+	/*
+	 * A single set of 3 capture lists: a global-list
+	 * an engine-class-list and an engine-instance list.
+	 * outlist in __guc_capture_parsed_output will keep
+	 * a linked list of these nodes that will eventually
+	 * be detached from outlist and attached into to
+	 * i915_gpu_codedump in response to a context reset
+	 */
+	struct list_head link;
+	bool is_partial;
+	u32 eng_class;
+	u32 eng_inst;
+	u32 guc_id;
+	u32 lrca;
+	struct gcap_reg_list_info {
+		u32 vfid;
+		u32 num_regs;
+		struct guc_mmio_reg *regs;
+	} reginfo[GUC_CAPTURE_LIST_TYPE_MAX];
+#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_CAPTURE_LIST_TYPE_GLOBAL)
+#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS)
+};
+
+/*
+ * struct guc_debug_capture_list_header / struct guc_debug_capture_list
+ *
+ * As part of ADS registration, these header structures (followed by
+ * an array of 'struct guc_mmio_reg' entries) are used to register with
+ * GuC microkernel the list of registers we want it to dump out prior
+ * to a engine reset.
+ */
+struct guc_debug_capture_list_header {
+	u32 info;
+#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
+} __packed;
+
+struct guc_debug_capture_list {
+	struct guc_debug_capture_list_header header;
+	struct guc_mmio_reg regs[];
+} __packed;
+
+/*
+ * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
+ *
+ * xe_guc_capture module uses these structures to maintain static
+ * tables (per unique platform) that consists of lists of registers
+ * (offsets, names, flags,...) that are used at the ADS regisration
+ * time as well as during runtime processing and reporting of error-
+ * capture states generated by GuC just prior to engine reset events.
+ */
+struct __guc_mmio_reg_descr {
+	struct xe_reg reg;
+	u32 flags;
+	u32 mask;
+	const char *regname;
+};
+
+struct __guc_mmio_reg_descr_group {
+	const struct __guc_mmio_reg_descr *list;
+	u32 num_regs;
+	u32 owner; /* see enum guc_capture_owner */
+	u32 type; /* see enum guc_capture_type */
+	u32 engine; /* as per MAX_ENGINE_CLASS */
+	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
+};
+
+/*
+ * struct guc_state_capture_header_t / struct guc_state_capture_t /
+ * guc_state_capture_group_header_t / guc_state_capture_group_t
+ *
+ * Prior to resetting engines that have hung or faulted, GuC microkernel
+ * reports the engine error-state (register values that was read) by
+ * logging them into the shared GuC log buffer using these hierarchy
+ * of structures.
+ */
+struct guc_state_capture_header_t {
+	u32 owner;
+#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
+	u32 info;
+#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
+#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
+#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
+	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
+	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
+	u32 num_mmios;
+#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
+} __packed;
+
+struct guc_state_capture_t {
+	struct guc_state_capture_header_t header;
+	struct guc_mmio_reg mmio_entries[];
+} __packed;
+
+enum guc_capture_group_types {
+	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
+	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
+	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
+};
+
+struct guc_state_capture_group_header_t {
+	u32 owner;
+	u32 info;
+#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
+#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
+} __packed;
+
+/* this is the top level structure where an error-capture dump starts */
+struct guc_state_capture_group_t {
+	struct guc_state_capture_group_header_t grp_header;
+	struct guc_state_capture_t capture_entries[];
+} __packed;
+
+/*
+ * struct __guc_capture_ads_cache
+ *
+ * A structure to cache register lists that were populated and registered
+ * with GuC at startup during ADS registration. This allows much quicker
+ * GuC resets without re-parsing all the tables for the given gt.
+ */
+struct __guc_capture_ads_cache {
+	bool is_valid;
+	void *ptr;
+	size_t size;
+	int status;
+};
+
+/**
+ * struct xe_guc_state_capture
+ *
+ * Internal context of the xe_guc_capture module.
+ */
+struct xe_guc_state_capture {
+	/**
+	 * @reglists: static table of register lists used for error-capture state.
+	 */
+	const struct __guc_mmio_reg_descr_group *reglists;
+
+	/**
+	 * @extlists: allocated table of steered register lists used for error-capture state.
+	 *
+	 * NOTE: steered registers have multiple instances depending on the HW configuration
+	 * (slices or dual-sub-slices) and thus depends on HW fuses discovered at startup
+	 */
+	struct __guc_mmio_reg_descr_group *extlists;
+
+	/**
+	 * @ads_cache: cached register lists that is ADS format ready
+	 */
+	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
+						[GUC_CAPTURE_LIST_TYPE_MAX]
+						[GUC_MAX_ENGINE_CLASSES];
+
+	/**
+	 * @ads_null_cache: ADS null cache.
+	 */
+	void *ads_null_cache;
+
+	/**
+	 * @cachelist: Pool of pre-allocated nodes for error capture output
+	 *
+	 * We need this pool of pre-allocated nodes because we cannot
+	 * dynamically allocate new nodes when receiving the G2H notification
+	 * because the event handlers for all G2H event-processing is called
+	 * by the ct processing worker queue and when that queue is being
+	 * processed, there is no absoluate guarantee that we are not in the
+	 * midst of a GT reset operation (which doesn't allow allocations).
+	 */
+	struct list_head cachelist;
+#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
+#define PREALLOC_NODES_DEFAULT_NUMREGS 64
+
+	/**
+	 * @max_mmio_per_node: Max MMIO per node.
+	 */
+	int max_mmio_per_node;
+
+	/**
+	 * @outlist: Pool of pre-allocated nodes for error capture output
+	 *
+	 * A linked list of parsed GuC error-capture output data before
+	 * reporting with formatting via i915_gpu_coredump. Each node in this linked list shall
+	 * contain a single engine-capture including global, engine-class and
+	 * engine-instance register dumps as per guc_capture_parsed_output_node
+	 */
+	struct list_head outlist;
+};
+
+#endif /* _XE_GUC_CAPTURE_FWIF_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 65e181122079..227500c98825 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 
 #include "abi/guc_klvs_abi.h"
+#include "xe_hw_engine_types.h"
 
 #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
@@ -164,6 +165,8 @@ struct guc_mmio_reg {
 #define GUC_REGSET_MASKED		BIT(0)
 #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
 #define GUC_REGSET_RESTORE_ONLY		BIT(3)
+#define GUC_REGSET_STEERING_GROUP       GENMASK(15, 12)
+#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
 } __packed;
 
 /* GuC register sets */
@@ -192,6 +195,23 @@ enum {
 	GUC_CAPTURE_LIST_INDEX_MAX = 2,
 };
 
+/*Register-types of GuC capture register lists */
+enum guc_capture_type {
+	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
+	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+	GUC_CAPTURE_LIST_TYPE_MAX,
+};
+
+/* Class indecies for capture_class and capture_instance arrays */
+enum {
+	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
+	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
+	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
+	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
+	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
+};
+
 /* GuC Additional Data Struct */
 struct guc_ads {
 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 16de203c62a7..6d9f5f2de8ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,6 +42,8 @@ struct xe_guc {
 	struct xe_guc_ads ads;
 	/** @ct: GuC ct */
 	struct xe_guc_ct ct;
+	/** @capture: the error-state-capture module's data and objects */
+	struct xe_guc_state_capture *capture;
 	/** @pc: GuC Power Conservation */
 	struct xe_guc_pc pc;
 	/** @dbm: GuC Doorbell Manager */
-- 
2.34.1

