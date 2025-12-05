Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FECA6A0C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393DB10EA30;
	Fri,  5 Dec 2025 08:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnHNhO9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7C10EA2F;
 Fri,  5 Dec 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764922279; x=1796458279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QO2wvKo4Cw1LR7qkX4YgfqkHrCDIsljitXLrpiSX5Ic=;
 b=LnHNhO9Z8xTvDZURKhYnfQAYhmpT5IjXLFaCMlZ7S4QgRZXyAEQjW/d+
 gP23DsThP+KHVCPsCBBMf7caA9DWT5mLGDu+pQGzardfeYzvIAJUe2hDQ
 Q52lle40i+6Jp4tQnmQKS2ChQogRufaJx1TYVad1URj3DjWw370ow6KMR
 aUOCnPcBBXxduOQf5VQdqum239cc6NU4i09Qn9nPZBRt+/SGS9FLuFlWl
 oYRNY6zJGZwH5m/28jPUAth84y7sfgJxY1pNFNkwjAsQvJmibPHpWiXkR
 ZbuQs0J8g0/bkQAh5mipAG5OK/KJVrrbnRqKcJXkZcNhFX333EsliCtv0 g==;
X-CSE-ConnectionGUID: KzZYg94aQCWv3VGWYcwtXQ==
X-CSE-MsgGUID: PcyouHMWTM+xzff4tE/TzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77572001"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="77572001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:11:19 -0800
X-CSE-ConnectionGUID: jETMuNfcTFSMWiki6XLZtA==
X-CSE-MsgGUID: EZ6EaHzkTkummgQ9VJ/pIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="225890178"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:11:15 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 3/4] drm/xe/xe_hw_error: Add support for GT hardware errors
Date: Fri,  5 Dec 2025 14:09:35 +0530
Message-ID: <20251205083934.3602030-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251205083934.3602030-6-riana.tauro@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PVC supports GT error reporting via vector registers along with
error status register. Add support to report these errors and
update respective counters. Incase of Subslice error reported
by vector register, process the error status register
for applicable bits.

Incorporate the counter inside the driver itself and start
using the drm_ras generic netlink to report them.

Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  44 +++++
 drivers/gpu/drm/xe/xe_hw_error.c           | 182 ++++++++++++++++++++-
 2 files changed, 221 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index c146b9ef44eb..b54712e893d5 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -11,10 +11,54 @@
 
 #define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
 
+#define ERR_STAT_GT_COR				0x100160
+#define ERR_STAT_GT_NONFATAL			0x100164
+#define ERR_STAT_GT_FATAL			0x100168
+#define ERR_STAT_GT_REG(x)			XE_REG(_PICK_EVEN((x), \
+								 ERR_STAT_GT_COR, \
+								 ERR_STAT_GT_NONFATAL))
+
+#define  GT_HW_ERROR_MAX_ERR_BITS		16
+#define  EU_GRF_ERR				(15)
+#define  EU_IC_ERR				(14)
+#define  SLM_ERR				(13)
+#define  GUC_COR_ERR				(1)
+
+#define  GUC_FAT_ERR				(6)
+#define  FPU_FAT_ERR				(3)
+
+#define PVC_COR_ERR_MASK			(BIT(GUC_COR_ERR) | BIT(SLM_ERR) | \
+						 BIT(EU_IC_ERR) | BIT(EU_GRF_ERR))
+
+#define PVC_FAT_ERR_MASK			(BIT(FPU_FAT_ERR) | BIT(GUC_FAT_ERR) | \
+						 BIT(EU_GRF_ERR) | BIT(SLM_ERR))
+
 #define DEV_ERR_STAT_NONFATAL			0x100178
 #define DEV_ERR_STAT_CORRECTABLE		0x10017c
 #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
 								  DEV_ERR_STAT_CORRECTABLE, \
 								  DEV_ERR_STAT_NONFATAL))
+
 #define   XE_CSC_ERROR				BIT(17)
+#define   XE_GT_ERROR				BIT(0)
+
+#define  ERR_STAT_GT_FATAL_VECTOR_0		0x100260
+#define  ERR_STAT_GT_FATAL_VECTOR_1		0x100264
+
+#define  ERR_STAT_GT_FATAL_VECTOR_REG(x)	XE_REG(_PICK_EVEN((x), \
+								  ERR_STAT_GT_FATAL_VECTOR_0, \
+								  ERR_STAT_GT_FATAL_VECTOR_1))
+
+#define  ERR_STAT_GT_COR_VECTOR_LEN		(4)
+#define  ERR_STAT_GT_COR_VECTOR_0		0x1002a0
+#define  ERR_STAT_GT_COR_VECTOR_1		0x1002a4
+
+#define  ERR_STAT_GT_COR_VECTOR_REG(x)		XE_REG(_PICK_EVEN((x), \
+								 ERR_STAT_GT_COR_VECTOR_0,\
+								 ERR_STAT_GT_COR_VECTOR_1))
+
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == DRM_XE_RAS_ERROR_CORRECTABLE ? \
+						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						 ERR_STAT_GT_FATAL_VECTOR_REG(x))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index d63078d00b56..77c90f1b06fd 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/bitmap.h>
 #include <linux/fault-inject.h>
 
 #include "regs/xe_gsc_regs.h"
@@ -16,6 +17,8 @@
 #include "xe_survivability_mode.h"
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
+#define XE_RAS_REG_SIZE 32
+
 extern struct fault_attr inject_csc_hw_error;
 static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
@@ -26,6 +29,25 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
+#define ERR_INDEX(_bit, index) \
+	[__ffs(_bit)] = index
+
+static const unsigned long xe_hw_error_map[] = {
+	ERR_INDEX(XE_GT_ERROR, DRM_XE_RAS_ERROR_CORE_COMPUTE),
+};
+
+enum gt_vector_regs {
+	ERR_STAT_GT_VECTOR0 = 0,
+	ERR_STAT_GT_VECTOR1,
+	ERR_STAT_GT_VECTOR2,
+	ERR_STAT_GT_VECTOR3,
+	ERR_STAT_GT_VECTOR4,
+	ERR_STAT_GT_VECTOR5,
+	ERR_STAT_GT_VECTOR6,
+	ERR_STAT_GT_VECTOR7,
+	ERR_STAT_GT_VECTOR_MAX,
+};
+
 static bool fault_inject_csc_hw_error(void)
 {
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
@@ -78,14 +100,136 @@ static void csc_hw_error_handler(struct xe_tile *tile,
 	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
 }
 
+static void log_hw_error(struct xe_tile *tile, const char *name,
+			 const enum drm_xe_ras_error_severity severity)
+{
+	const char *severity_str = error_severity[severity];
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (severity == DRM_XE_RAS_ERROR_FATAL)
+		drm_err_ratelimited(&xe->drm, "%s %s error detected\n", name, severity_str);
+	else
+		drm_warn(&xe->drm, "%s %s error detected\n", name, severity_str);
+}
+
+static void
+log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
+	   const enum drm_xe_ras_error_severity severity)
+{
+	const char *severity_str = error_severity[severity];
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (severity == DRM_XE_RAS_ERROR_FATAL)
+		drm_err_ratelimited(&xe->drm, "%s %s error detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
+				    name, severity_str, i, err);
+	else
+		drm_warn(&xe->drm, "%s %s error detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
+			 name, severity_str, i, err);
+}
+
+static void gt_handle_errors(struct xe_tile *tile,
+			     const enum drm_xe_ras_error_severity severity, u32 error_id)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[severity];
+	struct xe_mmio *mmio = &tile->mmio;
+	unsigned long err_stat = 0;
+	int i;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	for (i = 0; i < ERR_STAT_GT_VECTOR_MAX; i++) {
+		u32 vector, val;
+
+		if (severity == DRM_XE_RAS_ERROR_CORRECTABLE && i >= ERR_STAT_GT_COR_VECTOR_LEN)
+			break;
+
+		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(severity, i));
+		if (!vector)
+			continue;
+
+		switch (i) {
+		case ERR_STAT_GT_VECTOR0:
+		case ERR_STAT_GT_VECTOR1:
+			u32 errbit;
+
+			val = hweight32(vector);
+			atomic64_add(val, &info[error_id].counter);
+			log_gt_err(tile, "Subslice", i, vector, severity);
+
+			if (err_stat)
+				break;
+
+			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(severity));
+			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
+				if (severity == DRM_XE_RAS_ERROR_CORRECTABLE &&
+				    (BIT(errbit) & PVC_COR_ERR_MASK))
+					atomic64_inc(&info[error_id].counter);
+				if (severity == DRM_XE_RAS_ERROR_FATAL &&
+				    (BIT(errbit) & PVC_FAT_ERR_MASK))
+					atomic64_inc(&info[error_id].counter);
+			}
+			if (err_stat)
+				xe_mmio_write32(mmio, ERR_STAT_GT_REG(severity), err_stat);
+			break;
+		case ERR_STAT_GT_VECTOR2:
+		case ERR_STAT_GT_VECTOR3:
+			val = hweight32(vector);
+			atomic64_add(val, &info[error_id].counter);
+			log_gt_err(tile, "L3 BANK", i, vector, severity);
+			break;
+		case ERR_STAT_GT_VECTOR6:
+			val = hweight32(vector);
+			atomic64_add(val, &info[error_id].counter);
+			log_gt_err(tile, "TLB", i, vector, severity);
+			break;
+		case ERR_STAT_GT_VECTOR7:
+			val = hweight32(vector);
+			atomic64_add(val, &info[error_id].counter);
+			break;
+		default:
+			log_gt_err(tile, "Undefined", i, vector, severity);
+		}
+
+		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(severity, i), vector);
+	}
+}
+
+static void gt_hw_error_handler(struct xe_tile *tile,
+				const enum drm_xe_ras_error_severity severity, u32 error_id)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[severity];
+
+	switch (severity) {
+	case DRM_XE_RAS_ERROR_CORRECTABLE:
+		gt_handle_errors(tile, severity, error_id);
+		break;
+	case DRM_XE_RAS_ERROR_NONFATAL:
+		atomic64_inc(&info[error_id].counter);
+		log_hw_error(tile, "GT", severity);
+		break;
+	case DRM_XE_RAS_ERROR_FATAL:
+		gt_handle_errors(tile, severity, error_id);
+		break;
+	default:
+		drm_warn(&xe->drm, "Undefined error detected\n");
+	}
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_severity severity)
 {
 	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
-	unsigned long flags;
-	u32 err_src;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[severity];
+	unsigned long flags, err_src;
+	u32 err_bit;
 
-	if (xe->info.platform != XE_BATTLEMAGE)
+	if (!IS_DGFX(xe))
 		return;
 
 	spin_lock_irqsave(&xe->irq.lock, flags);
@@ -96,11 +240,39 @@ static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_
 		goto unlock;
 	}
 
-	if (err_src & XE_CSC_ERROR)
+	if (err_src & XE_CSC_ERROR) {
 		csc_hw_error_handler(tile, severity);
+		goto clear_reg;
+	}
 
-	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(severity), err_src);
+	if (!info) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Errors undefined\n");
+		goto clear_reg;
+	}
+
+	for_each_set_bit(err_bit, &err_src, XE_RAS_REG_SIZE) {
+		u32 error_id = xe_hw_error_map[err_bit];
+		const char *name;
+
+		name = info[error_id].name;
+		if (!name)
+			goto clear_reg;
 
+		if (severity == DRM_XE_RAS_ERROR_FATAL) {
+			drm_err_ratelimited(&xe->drm, HW_ERR
+					    "TILE%d reported %s %s error, bit[%d] is set\n",
+					    tile->id, name, severity_str, err_bit);
+		} else {
+			drm_warn(&xe->drm, HW_ERR
+				 "TILE%d reported %s %s error, bit[%d] is set\n",
+				 tile->id, name, severity_str, err_bit);
+		}
+		if (BIT(err_bit) & XE_GT_ERROR)
+			gt_hw_error_handler(tile, severity, error_id);
+	}
+
+clear_reg:
+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(severity), err_src);
 unlock:
 	spin_unlock_irqrestore(&xe->irq.lock, flags);
 }
-- 
2.47.1

