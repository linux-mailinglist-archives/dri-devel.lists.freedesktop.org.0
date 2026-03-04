Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACcOB6Lbp2kRkQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:13:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE61FB6E7
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D1410E96A;
	Wed,  4 Mar 2026 07:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No9N0g2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFDD10E959;
 Wed,  4 Mar 2026 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772608414; x=1804144414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jdxsn+I2GHLaqKwKaZNfgFGh5u+ddEXwyDh6mu3rabs=;
 b=No9N0g2GKNrLZqe124qhtWCmrWc++FP/REAhgN7cRs5wPgWGd8jeiOIq
 U8XMoFz/KJBNfgmjC1tgz59TtgZ/0EB4QelFiUsIUAxMZwnrJyOwXe8kM
 o2cEBvbb9xTwci/gIhQTrsYmLGw3A7MzoI0TUOBq2Z+bkjouPB5bfQA+d
 DHcZL6/4jd12NjTe3QJFwyU39E1aSBVHp2tdwEyYd9OnKjZaNfU2eeTzj
 qcC+WehK3lUdNpFaukkvR6NVf1zKUGY6VIAWObq/Jg1Kx2XV7CTAjLjE2
 SKqw4MEp0s2L28dyBeJZ/s8JNAQMksbr+4jWQoNOqJy77eZl7QLFB7OWt Q==;
X-CSE-ConnectionGUID: FKkdDs91Qh+8ksKCePdU5Q==
X-CSE-MsgGUID: oD66A+TSRqSlf43AqnGcGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61236979"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="61236979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:13:34 -0800
X-CSE-ConnectionGUID: j6o5g72yQj+tbsX1kGK5vA==
X-CSE-MsgGUID: l6KghkdURa+6r+BgYPWk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="256141219"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:13:29 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v10 4/5] drm/xe/xe_hw_error: Add support for Core-Compute
 errors
Date: Wed,  4 Mar 2026 13:14:11 +0530
Message-ID: <20260304074412.464435-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260304074412.464435-7-riana.tauro@intel.com>
References: <20260304074412.464435-7-riana.tauro@intel.com>
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
X-Rspamd-Queue-Id: 88EE61FB6E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

PVC supports GT error reporting via vector registers along with
error status register. Add support to report these errors and
update respective counters. Incase of Subslice error reported
by vector register, process the error status register
for applicable bits.

The counter is embedded in the xe drm ras structure and is
exposed to the userspace using the drm_ras generic netlink
interface.

$ sudo ynl --family drm_ras --do get-error-counter \
--json '{"node-id":0, "error-id":1}'
{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0}

Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)
    Add documentation
    Modify commit message

v3: remove 'error' from counters
    use drmm_kcalloc
    add a for_each for severity
    differentitate error classes and severity in UAPI(Raag)
    Use correctable and uncorrectable in uapi (Pratik / Aravind)

v4: modify enums in UAPI
    improve comments
    add bounds check in handler
    add error mask macro (Raag)
    use atomic_t
    add null pointer checks

v5: fix alignment
    remove info check
    fix csc bit check (Raag)

v6: add macro for gt vector len (Raag)
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  61 ++++++-
 drivers/gpu/drm/xe/xe_hw_error.c           | 195 +++++++++++++++++++--
 2 files changed, 236 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index c146b9ef44eb..cd17d7d7372c 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -6,15 +6,58 @@
 #ifndef _XE_HW_ERROR_REGS_H_
 #define _XE_HW_ERROR_REGS_H_
 
-#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
-#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
+#define HEC_UNCORR_ERR_STATUS(base)			XE_REG((base) + 0x118)
+#define   UNCORR_FW_REPORTED_ERR			REG_BIT(6)
 
-#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
+#define HEC_UNCORR_FW_ERR_DW0(base)			XE_REG((base) + 0x124)
 
-#define DEV_ERR_STAT_NONFATAL			0x100178
-#define DEV_ERR_STAT_CORRECTABLE		0x10017c
-#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
-								  DEV_ERR_STAT_CORRECTABLE, \
-								  DEV_ERR_STAT_NONFATAL))
-#define   XE_CSC_ERROR				BIT(17)
+#define ERR_STAT_GT_COR					0x100160
+#define   EU_GRF_COR_ERR				REG_BIT(15)
+#define   EU_IC_COR_ERR					REG_BIT(14)
+#define   SLM_COR_ERR					REG_BIT(13)
+#define   GUC_COR_ERR					REG_BIT(1)
+
+#define ERR_STAT_GT_NONFATAL				0x100164
+#define ERR_STAT_GT_FATAL				0x100168
+#define   EU_GRF_FAT_ERR				REG_BIT(15)
+#define   SLM_FAT_ERR					REG_BIT(13)
+#define   GUC_FAT_ERR					REG_BIT(6)
+#define   FPU_FAT_ERR					REG_BIT(3)
+
+#define ERR_STAT_GT_REG(x)				XE_REG(_PICK_EVEN((x), \
+									  ERR_STAT_GT_COR, \
+									  ERR_STAT_GT_NONFATAL))
+
+#define PVC_COR_ERR_MASK				(GUC_COR_ERR | SLM_COR_ERR | \
+							 EU_IC_COR_ERR | EU_GRF_COR_ERR)
+
+#define PVC_FAT_ERR_MASK				(FPU_FAT_ERR | GUC_FAT_ERR | \
+							 EU_GRF_FAT_ERR | SLM_FAT_ERR)
+
+#define DEV_ERR_STAT_NONFATAL				0x100178
+#define DEV_ERR_STAT_CORRECTABLE			0x10017c
+#define DEV_ERR_STAT_REG(x)				XE_REG(_PICK_EVEN((x), \
+									  DEV_ERR_STAT_CORRECTABLE, \
+									  DEV_ERR_STAT_NONFATAL))
+
+#define   XE_CSC_ERROR					17
+#define   XE_GT_ERROR					0
+
+#define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
+#define ERR_STAT_GT_FATAL_VECTOR_1			0x100264
+
+#define ERR_STAT_GT_FATAL_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
+									  ERR_STAT_GT_FATAL_VECTOR_0, \
+									  ERR_STAT_GT_FATAL_VECTOR_1))
+
+#define ERR_STAT_GT_COR_VECTOR_0			0x1002a0
+#define ERR_STAT_GT_COR_VECTOR_1			0x1002a4
+
+#define ERR_STAT_GT_COR_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
+									  ERR_STAT_GT_COR_VECTOR_0, \
+									  ERR_STAT_GT_COR_VECTOR_1))
+
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+							 ERR_STAT_GT_FATAL_VECTOR_REG(x))
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index baae050163df..8062a6ff98a4 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/bitmap.h>
 #include <linux/fault-inject.h>
 
 #include "regs/xe_gsc_regs.h"
@@ -15,7 +16,13 @@
 #include "xe_mmio.h"
 #include "xe_survivability_mode.h"
 
-#define  HEC_UNCORR_FW_ERR_BITS 4
+#define GT_HW_ERROR_MAX_ERR_BITS		16
+#define HEC_UNCORR_FW_ERR_BITS			4
+#define XE_RAS_REG_SIZE				32
+
+#define PVC_ERROR_MASK_SET(hw_err, err_bit)	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
+						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
+						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
 
 extern struct fault_attr inject_csc_hw_error;
 
@@ -28,10 +35,24 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
-static bool fault_inject_csc_hw_error(void)
-{
-	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
-}
+static const unsigned long xe_hw_error_map[] = {
+	[XE_GT_ERROR]	= DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,
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
+	ERR_STAT_GT_VECTOR_MAX
+};
+
+#define PVC_GT_VECTOR_LEN(hw_err)	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
+					 ERR_STAT_GT_VECTOR4 : ERR_STAT_GT_VECTOR_MAX)
 
 static enum drm_xe_ras_error_severity hw_err_to_severity(const enum hardware_error hw_err)
 {
@@ -42,6 +63,11 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(const enum hardware_err
 	return DRM_XE_RAS_ERR_SEV_UNCORRECTABLE;
 }
 
+static bool fault_inject_csc_hw_error(void)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
+}
+
 static void csc_hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
@@ -89,15 +115,119 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
 }
 
+static void log_hw_error(struct xe_tile *tile, const char *name,
+			 const enum drm_xe_ras_error_severity severity)
+{
+	const char *severity_str = error_severity[severity];
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
+		drm_warn(&xe->drm, "%s %s detected\n", name, severity_str);
+	else
+		drm_err_ratelimited(&xe->drm, "%s %s detected\n", name, severity_str);
+}
+
+static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
+		       const enum drm_xe_ras_error_severity severity)
+{
+	const char *severity_str = error_severity[severity];
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
+		drm_warn(&xe->drm, "%s %s detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
+			 name, severity_str, i, err);
+	else
+		drm_err_ratelimited(&xe->drm, "%s %s detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
+				    name, severity_str, i, err);
+}
+
+static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
+				u32 error_id)
+{
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
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
+	if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		atomic_inc(&info[error_id].counter);
+		log_hw_error(tile, info[error_id].name, severity);
+		return;
+	}
+
+	for (i = 0; i < PVC_GT_VECTOR_LEN(hw_err); i++) {
+		u32 vector, val;
+
+		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i));
+		if (!vector)
+			continue;
+
+		switch (i) {
+		case ERR_STAT_GT_VECTOR0:
+		case ERR_STAT_GT_VECTOR1: {
+			u32 errbit;
+
+			val = hweight32(vector);
+			atomic_add(val, &info[error_id].counter);
+			log_gt_err(tile, "Subslice", i, vector, severity);
+
+			/*
+			 * Error status register is only populated once per error.
+			 * Read the register and clear once.
+			 */
+			if (err_stat)
+				break;
+
+			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(hw_err));
+			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
+				if (PVC_ERROR_MASK_SET(hw_err, errbit))
+					atomic_inc(&info[error_id].counter);
+			}
+			if (err_stat)
+				xe_mmio_write32(mmio, ERR_STAT_GT_REG(hw_err), err_stat);
+			break;
+		}
+		case ERR_STAT_GT_VECTOR2:
+		case ERR_STAT_GT_VECTOR3:
+			val = hweight32(vector);
+			atomic_add(val, &info[error_id].counter);
+			log_gt_err(tile, "L3 BANK", i, vector, severity);
+			break;
+		case ERR_STAT_GT_VECTOR6:
+			val = hweight32(vector);
+			atomic_add(val, &info[error_id].counter);
+			log_gt_err(tile, "TLB", i, vector, severity);
+			break;
+		case ERR_STAT_GT_VECTOR7:
+			val = hweight32(vector);
+			atomic_add(val, &info[error_id].counter);
+			log_gt_err(tile, "L3 Fabric", i, vector, severity);
+			break;
+		default:
+			log_gt_err(tile, "Undefined", i, vector, severity);
+		}
+
+		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
+	}
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
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
@@ -108,11 +238,53 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		goto unlock;
 	}
 
-	if (err_src & XE_CSC_ERROR)
+	/*
+	 * On encountering CSC firmware errors, the graphics device becomes unrecoverable
+	 * so return immediately on error. The only way to recover from these errors is
+	 * firmware flash. The device will enter Runtime Survivability mode when such
+	 * errors are detected.
+	 */
+	if (err_src & REG_BIT(XE_CSC_ERROR)) {
 		csc_hw_error_handler(tile, hw_err);
+		goto clear_reg;
+	}
 
-	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
+	if (!info)
+		goto clear_reg;
+
+	for_each_set_bit(err_bit, &err_src, XE_RAS_REG_SIZE) {
+		const char *name;
+		u32 error_id;
+
+		/* Check error bit is within bounds */
+		if (err_bit >= ARRAY_SIZE(xe_hw_error_map))
+			break;
+
+		error_id = xe_hw_error_map[err_bit];
+
+		/* Check error component is within max */
+		if (!error_id || error_id >= DRM_XE_RAS_ERR_COMP_MAX)
+			continue;
 
+		name = info[error_id].name;
+		if (!name)
+			continue;
+
+		if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE) {
+			drm_warn(&xe->drm, HW_ERR
+				 "TILE%d reported %s %s, bit[%d] is set\n",
+				 tile->id, name, severity_str, err_bit);
+		} else {
+			drm_err_ratelimited(&xe->drm, HW_ERR
+					    "TILE%d reported %s %s, bit[%d] is set\n",
+					    tile->id, name, severity_str, err_bit);
+		}
+		if (err_bit == XE_GT_ERROR)
+			gt_hw_error_handler(tile, hw_err, error_id);
+	}
+
+clear_reg:
+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 unlock:
 	spin_unlock_irqrestore(&xe->irq.lock, flags);
 }
@@ -134,9 +306,10 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	if (fault_inject_csc_hw_error())
 		schedule_work(&tile->csc_hw_error_work);
 
-	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
+	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
 		if (master_ctl & ERROR_IRQ(hw_err))
 			hw_error_source_handler(tile, hw_err);
+	}
 }
 
 static int hw_error_info_init(struct xe_device *xe)
-- 
2.47.1

