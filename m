Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BBAB353DD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A6410E5C4;
	Tue, 26 Aug 2025 06:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA9lvmJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585B10E5C4;
 Tue, 26 Aug 2025 06:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188585; x=1787724585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U+zmNIf4bq6pVIb4AaoNIbST506HujxzqzNX2rbk7BA=;
 b=eA9lvmJLCyoGHhJIVNC0LPnBsKHvoNW9SZuV6p36ASL6HEUPs6Ur7yQT
 TaQ7EHPZXDfVU1J3Fb8G1aworEeNivGoI4w/b35kbJa3231kTIOqQLMjD
 v160EivQwOpe7oVHe8Swogzmvq05zjd7SdwBPBrTkH0ejEGZhtjS6BqGG
 YNWZzSFSKflpigwSIGBfxtnIEG/i1diwO1HnkfhOrdsKFMCEv5bBp1FMZ
 1JfLOFmZQSlg5D11R/Ain51e4dAYT9vgMmQIU8cgQ0Gb1fBv8DrhfG63R
 1lqVrVTDxgMkHiflQC0ZX+1DSMQjgjuxHUVRq6wFBTlbU4kQQUDAFjfmn w==;
X-CSE-ConnectionGUID: c9vDLEcbQ7a/ut6XM08w5w==
X-CSE-MsgGUID: cFGKtnw3SlWRUGmXir1kyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58272070"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58272070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:44 -0700
X-CSE-ConnectionGUID: QmDbp1boRDSvcHj7CznSJA==
X-CSE-MsgGUID: jbIIHAtqR3GEDwLphiO7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756889"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v9 09/10] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Date: Tue, 26 Aug 2025 12:04:16 +0530
Message-ID: <20250826063419.3022216-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250826063419.3022216-1-riana.tauro@intel.com>
References: <20250826063419.3022216-1-riana.tauro@intel.com>
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

Add support to handle CSC firmware reported errors. When CSC firmware
errors are encoutered, a error interrupt is received by the GFX device as
a MSI interrupt.

Device Source control registers indicates the source of the error as CSC
The HEC error status register indicates that the error is firmware reported
Depending on the type of error, the error cause is written to the HEC
Firmware error register.

On encountering such CSC firmware errors, the graphics device is
non-recoverable from driver context. The only way to recover from these
errors is firmware flash.

System admin/userspace is notified of the necessity of firmware flash
with a combination of vendor-specific drm device edged uevent, dmesg logs
and runtime survivability sysfs. It is the responsiblity of the consumer
to verify all the actions and then trigger a firmware flash using tools
like fwupd.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=vendor-specific
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5973
MAJOR=226
MINOR=0

Logs

xe 0000:03:00.0: [drm] *ERROR* [Hardware Error]: Tile0 reported NONFATAL error 0x20000
xe 0000:03:00.0: [drm] *ERROR* [Hardware Error]: NONFATAL: HEC Uncorrected FW FD Corruption error reported, bit[2] is set
xe 0000:03:00.0: Runtime Survivability mode enabled
xe 0000:03:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:03:00.0 as wedged.
               IOCTLs and executions are blocked. Only a rebind may clear the failure
               Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
xe 0000:03:00.0: [drm] device wedged, needs recovery
xe 0000:03:00.0: Firmware flash required, Please refer to the userspace documentation for more details!

Runtime survivability Sysfs:

/sys/bus/pci/devices/<device>/survivability_mode

v2: use vendor recovery method with
    runtime survivability (Christian, Rodrigo, Raag)
v3: move declare wedged to runtime survivability mode (Rodrigo)
v4: update commit message

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
 drivers/gpu/drm/xe/xe_device_types.h       |  3 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 64 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  2 +-
 5 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 9b66cc972a63..180be82672ab 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -13,6 +13,8 @@
 
 /* Definitions of GSC H/W registers, bits, etc */
 
+#define BMG_GSC_HECI1_BASE	0x373000
+
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
 
diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index ed9b81fb28a0..c146b9ef44eb 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -6,10 +6,15 @@
 #ifndef _XE_HW_ERROR_REGS_H_
 #define _XE_HW_ERROR_REGS_H_
 
+#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
+#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
+
+#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
+
 #define DEV_ERR_STAT_NONFATAL			0x100178
 #define DEV_ERR_STAT_CORRECTABLE		0x10017c
 #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
 								  DEV_ERR_STAT_CORRECTABLE, \
 								  DEV_ERR_STAT_NONFATAL))
-
+#define   XE_CSC_ERROR				BIT(17)
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b1c75c588e03..71fc29b3372a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -192,6 +192,9 @@ struct xe_tile {
 	/** @memirq: Memory Based Interrupts. */
 	struct xe_memirq memirq;
 
+	/** @csc_hw_error_work: worker to report CSC HW errors */
+	struct work_struct csc_hw_error_work;
+
 	/** @pcode: tile's PCODE */
 	struct {
 		/** @pcode.lock: protecting tile's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 0fa45792f1c0..4099ed1262e1 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,12 +3,16 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
 
 #include "xe_device.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_survivability_mode.h"
+
+#define  HEC_UNCORR_FW_ERR_BITS 4
 
 /* Error categories reported by hardware */
 enum hardware_error {
@@ -18,6 +22,13 @@ enum hardware_error {
 	HARDWARE_ERROR_MAX,
 };
 
+static const char * const hec_uncorrected_fw_errors[] = {
+	"Fatal",
+	"CSE Disabled",
+	"FD Corruption",
+	"Data Corruption"
+};
+
 static const char *hw_error_to_str(const enum hardware_error hw_err)
 {
 	switch (hw_err) {
@@ -32,6 +43,52 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+static void csc_hw_error_work(struct work_struct *work)
+{
+	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_device *xe = tile_to_xe(tile);
+	int ret;
+
+	ret = xe_survivability_mode_runtime_enable(xe);
+	if (ret)
+		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
+}
+
+static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hw_error_to_str(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mmio *mmio = &tile->mmio;
+	u32 base, err_bit, err_src;
+	unsigned long fw_err;
+
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return;
+
+	base = BMG_GSC_HECI1_BASE;
+	lockdep_assert_held(&xe->irq.lock);
+	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
+	if (!err_src) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
+				    tile->id, hw_err_str);
+		return;
+	}
+
+	if (err_src & UNCORR_FW_REPORTED_ERR) {
+		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
+		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
+			drm_err_ratelimited(&xe->drm, HW_ERR
+					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
+					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
+					     err_bit);
+
+			schedule_work(&tile->csc_hw_error_work);
+		}
+	}
+
+	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const char *hw_err_str = hw_error_to_str(hw_err);
@@ -50,7 +107,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		goto unlock;
 	}
 
-	/* TODO: Process errrors per source */
+	if (err_src & XE_CSC_ERROR)
+		csc_hw_error_handler(tile, hw_err);
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 
@@ -102,8 +160,12 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
+	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
+
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 86ba767c4e44..53c5af4b810c 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -346,7 +346,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&pdev->dev, "Firmware flash required, Refer the userspace documentation for more details!\n");
+	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
 
 	return 0;
 }
-- 
2.47.1

