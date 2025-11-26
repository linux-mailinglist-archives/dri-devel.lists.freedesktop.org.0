Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB0C8A299
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F6210E616;
	Wed, 26 Nov 2025 14:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfLo7tdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214D710E619;
 Wed, 26 Nov 2025 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166123; x=1795702123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQOAUpiUAyU1g6S7/C1sc/JjhXSVbiUPycAJnc/dUu8=;
 b=BfLo7tdPv3PRzU9eDyPtYnFum1fYcaNEPy6dMe7DlgtmavMCaUV9peXl
 i1nK292Y8B5S46dLSwEkmjqICl1WJefkRqAsAAY2X8a+iuM62j6PGZ/YA
 MfLeXIoVvC/Oaxggz/DpWY8TJK/IjBzpYkJnGwAU5p0kUeIxI9TPXpUyC
 ECkP0yWJSHbqCr4FNnhYKJ/ZuIpfXvrux90nH2dm1uniMJdpCV3P77eQU
 +PP8j0jbTTNA2n8m9zVHdh6TzpnqVMqD249zQP3gaUoxmNqUW+JdA7CnG
 GA+yEJQkNvNyqzvoyqX6gTAMn6HSmV0Te714pj8r4cmgHpSfzl2FqsQFg w==;
X-CSE-ConnectionGUID: mZu31f9QQOiCHmrvENzTGQ==
X-CSE-MsgGUID: uRTkfZC6RZ+KzQ/DrAVthQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66365938"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66365938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:43 -0800
X-CSE-ConnectionGUID: fK4nTP16Rp+k6avbirdyJg==
X-CSE-MsgGUID: xQTMPXsrQ9mrLtbrUc1AVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192740595"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:40 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, lucas.demarchi@intel.com,
 Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 3/4] drm/xe/xe_hw_error: Add support for GT hardware errors
Date: Wed, 26 Nov 2025 20:06:46 +0530
Message-ID: <20251126143652.2843242-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251126143652.2843242-6-riana.tauro@intel.com>
References: <20251126143652.2843242-6-riana.tauro@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PVC supports GT error reporting via vector registers alongwith
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
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  44 ++++++
 drivers/gpu/drm/xe/xe_hw_error.c           | 175 ++++++++++++++++++++-
 2 files changed, 215 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index c146b9ef44eb..a9e829dac9a9 100644
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
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						 ERR_STAT_GT_FATAL_VECTOR_REG(x))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2adc2e6540f6..1bfda1b3bae4 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -15,7 +15,9 @@
 #include "xe_mmio.h"
 #include "xe_survivability_mode.h"
 
+#define XE_RAS_REG_SIZE 32
 #define  HEC_UNCORR_FW_ERR_BITS 4
+
 extern struct fault_attr inject_csc_hw_error;
 
 static const char * const hec_uncorrected_fw_errors[] = {
@@ -25,6 +27,25 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
+#define ERR_INDEX(_bit, index) \
+	[__ffs(_bit)] = index
+
+static const unsigned long xe_hw_error_map[] = {
+	ERR_INDEX(XE_GT_ERROR, DRM_XE_GENL_CORE_COMPUTE),
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
@@ -76,14 +97,133 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
 }
 
+static void log_hw_error(struct xe_tile *tile, const char *name,  const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hw_error_to_str(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (hw_err == HARDWARE_ERROR_FATAL)
+		drm_err_ratelimited(&xe->drm, "%s %s  error detected\n", name, hw_err_str);
+	else
+		drm_warn(&xe->drm, "%s %s  error detected\n", name, hw_err_str);
+}
+
+static void
+log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hw_error_to_str(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (hw_err == HARDWARE_ERROR_FATAL)
+		drm_err_ratelimited(&xe->drm, "%s %s error detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
+				    name, hw_err_str, i, err);
+	else
+		drm_warn(&xe->drm, "%s %s error detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
+			 name, hw_err_str, i, err);
+}
+
+static void gt_handle_errors(struct xe_tile *tile, const enum hardware_error hw_err, u32 err_bit)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[hw_err];
+	struct xe_mmio *mmio = &tile->mmio;
+	u32 index;
+	int i;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	index = xe_hw_error_map[err_bit];
+
+	for (i = 0; i < ERR_STAT_GT_VECTOR_MAX; i++) {
+		u32 vector;
+		unsigned long err_stat;
+
+		if (hw_err == HARDWARE_ERROR_CORRECTABLE && i >= ERR_STAT_GT_COR_VECTOR_LEN)
+			break;
+
+		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i));
+		if (!vector)
+			continue;
+
+		switch (i) {
+		case ERR_STAT_GT_VECTOR0:
+		case ERR_STAT_GT_VECTOR1:
+			u32 errbit;
+
+			info[index].counter += hweight32(vector);
+			log_gt_err(tile, "Subslice", i, vector, hw_err);
+
+			if (err_stat)
+				break;
+
+			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(hw_err));
+			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
+				if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
+				    (BIT(errbit) & PVC_COR_ERR_MASK))
+					info[index].counter++;
+				if (hw_err == HARDWARE_ERROR_FATAL &&
+				    (BIT(errbit) & PVC_FAT_ERR_MASK))
+					info[index].counter++;
+			}
+			if (err_stat)
+				xe_mmio_write32(mmio, ERR_STAT_GT_REG(hw_err), err_stat);
+			break;
+		case ERR_STAT_GT_VECTOR2:
+		case ERR_STAT_GT_VECTOR3:
+			info[index].counter += hweight32(vector);
+			log_gt_err(tile, "L3 BANK", i, vector, hw_err);
+					break;
+		case ERR_STAT_GT_VECTOR6:
+			info[index].counter += hweight32(vector);
+			log_gt_err(tile, "TLB", i, vector, hw_err);
+			break;
+		case ERR_STAT_GT_VECTOR7:
+			info[index].counter += hweight32(vector);
+			log_gt_err(tile, "L3 Fabric", i, vector, hw_err);
+			break;
+		default:
+			log_gt_err(tile, "Undefined", i, vector, hw_err);
+		}
+
+		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
+	}
+}
+
+static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 err_bit)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[hw_err];
+	u32 index = xe_hw_error_map[err_bit];
+
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		gt_handle_errors(tile, hw_err, err_bit);
+		break;
+	case HARDWARE_ERROR_NONFATAL:
+		info[index].counter++;
+		log_hw_error(tile, "GT", hw_err);
+		break;
+	case HARDWARE_ERROR_FATAL:
+		gt_handle_errors(tile, hw_err, err_bit);
+		break;
+	default:
+		log_hw_error(tile, "Undefined", hw_err);
+	}
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const char *hw_err_str = hw_error_to_str(hw_err);
 	struct xe_device *xe = tile_to_xe(tile);
-	unsigned long flags;
-	u32 err_src;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[hw_err];
+	unsigned long flags, err_src;
+	u32 err_bit;
 
-	if (xe->info.platform != XE_BATTLEMAGE)
+	if (!IS_DGFX(xe))
 		return;
 
 	spin_lock_irqsave(&xe->irq.lock, flags);
@@ -94,9 +234,36 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		goto unlock;
 	}
 
-	if (err_src & XE_CSC_ERROR)
+	if (err_src & XE_CSC_ERROR) {
 		csc_hw_error_handler(tile, hw_err);
+		goto clear_reg;
+	}
+
+	if (!info) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Errors undefined\n");
+		goto clear_reg;
+	}
+
+	for_each_set_bit(err_bit, &err_src, XE_RAS_REG_SIZE) {
+		u32 index = xe_hw_error_map[err_bit];
+		const char *name = info[index].name;
+
+		if (hw_err == HARDWARE_ERROR_FATAL) {
+			drm_err_ratelimited(&xe->drm, HW_ERR
+					    "TILE%d reported %s %s error, bit[%d] is set\n",
+					    tile->id, name, hw_err_str, err_bit);
+		} else {
+			drm_warn(&xe->drm, HW_ERR
+				 "TILE%d reported %s %s error, bit[%d] is set\n",
+				 tile->id, name, hw_err_str, err_bit);
+		}
+
+
+		if (BIT(err_bit) & XE_GT_ERROR)
+			gt_hw_error_handler(tile, hw_err, err_bit);
+	}
 
+clear_reg:
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 
 unlock:
-- 
2.47.1

