Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDED948837
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB3510E2E4;
	Tue,  6 Aug 2024 04:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQKfGBl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF0389048;
 Tue,  6 Aug 2024 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722917441; x=1754453441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SPnmSOct1S+IO17hcd9r9Hsb1cuxXerhUYiz4U7zea0=;
 b=gQKfGBl8hYS7H66jTE9zD7kLlMZWRYqdxZiIU5x4NSZkqK0iwrBSb8Cy
 SnHxSdpNkDLoaLPIda+kqaeJPF0GT2IHCfCoOe7VOVWJmYOQ0iP5lkrhW
 MAtNPKhrRsd9ddA8DCMbxmhcnQdt1GH/DI96jPM18M7ra/oo5GAd+UXvY
 d9yYgVo78C/7qBI/C1nagwpwwq2f2JvbF89eXduTySmNJjxdYud+/9gZk
 VDwy+zcvqvjeeuBYSD7PXaOkUXkJF7nsXx07FuRht64z/EuvVT9Q5dDMh
 M5SKJ6gXMKHAbBn6vTeIqMdaG/dh9VmCOEy6a15SrUkS/l3YRHagmXG4v w==;
X-CSE-ConnectionGUID: wH2tjpI8SV2fJPVdOl1Wtg==
X-CSE-MsgGUID: e6xc6mXiRL6xUJGrUtokMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31574089"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="31574089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 21:10:41 -0700
X-CSE-ConnectionGUID: Ex9UJI+RSK6WZm3fGN9X7w==
X-CSE-MsgGUID: c03abkaDSmmvx4vL6tD6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="56464538"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 21:10:36 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/uapi: Bring back reset uevent
Date: Tue,  6 Aug 2024 10:02:31 +0530
Message-Id: <20240806043231.624645-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Bring back uevent for gt reset failure with better uapi naming.
With this in place we can receive failure event using udev.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
SUBSYSTEM=pci
DEVICE_STATUS=NEEDS_RESET
REASON=GT_RESET_FAILED
TILE_ID=0
GT_ID=0
DRIVER=xe
PCI_CLASS=30000
PCI_ID=8086:56B1
PCI_SUBSYS_ID=8086:1210
PCI_SLOT_NAME=0000:03:00.0
MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
SEQNUM=6104

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 27 +++++++++++++++++++++++++--
 include/uapi/drm/xe_drm.h  | 17 +++++++++++++++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b04e47186f5b..5ceef0059861 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -740,6 +740,30 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_id)
+{
+	char *reset_event[5];
+
+	reset_event[0] = DRM_XE_RESET_REQUIRED_UEVENT;
+	reset_event[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
+	reset_event[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
+	reset_event[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
+	reset_event[4] = NULL;
+	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
+
+	kfree(reset_event[2]);
+	kfree(reset_event[3]);
+}
+
+static void gt_reset_failed(struct xe_gt *gt, int err)
+{
+	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
+
+	/* Notify userspace about gt reset failure */
+	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
+				   gt_to_tile(gt)->id, gt->info.id);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -795,8 +819,7 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_pm_runtime_put(gt_to_xe(gt));
 err_fail:
-	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
-
+	gt_reset_failed(gt, err);
 	xe_device_declare_wedged(gt_to_xe(gt));
 
 	return err;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19619d4952a8..9ea3be97535e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -20,6 +20,7 @@ extern "C" {
  *   2. Extension definition and helper structs
  *   3. IOCTL's Query structs in the order of the Query's entries.
  *   4. The rest of IOCTL structs in the order of IOCTL declaration.
+ *   5. uEvents
  */
 
 /**
@@ -1686,6 +1687,22 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * DOC: uevent generated by xe on it's pci node.
+ *
+ * DRM_XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
+ * The REASON is provided along with the event for which reset is required.
+ * On the basis of REASONS, additional information might be supplied.
+ */
+#define DRM_XE_RESET_REQUIRED_UEVENT "DEVICE_STATUS=NEEDS_RESET"
+
+/**
+ * DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to DRM_XE_RESET_REQUIRED_UEVENT
+ * incase of gt reset failure. The additional information supplied is tile id and
+ * gt id of the gt unit for which reset has failed.
+ */
+#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT "REASON=GT_RESET_FAILED"
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

