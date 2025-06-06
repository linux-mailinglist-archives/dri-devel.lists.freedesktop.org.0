Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0DAD07CB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 19:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169CC10E2F2;
	Fri,  6 Jun 2025 17:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOf/yNLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E5D10E28A;
 Fri,  6 Jun 2025 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232428; x=1780768428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VGihjaajQuvPnSGrbplDa3QcjPlMOyDSYn3PNJzvqr4=;
 b=FOf/yNLFPnvBsHwvjNcMwFpx1StE97LaoumhtRBOxB3HfjPECqmD0McJ
 2GTWBobRPn9zTomCF6TJWIXA2CC0kD7ltdrRVwFeQcz8xoK7aSkyB+lDy
 QP1wRuJcDR1RZOgc6/3VkxH+GdRCakZOMKmLU0YF5TfQ34Q1Vtv3/RSnQ
 TKl9zk319/1vQOSpIn3VL9PlQVP73PluCzXtepnDhoIoAL3KFzPj21jGz
 gqvFiyXfkoB+r7TdtwgFvbI3Sq4aBhzju0kzqLuOobbisEL6XW25hls4K
 PJBw7aI3qGdy9ZE4hlKMSsEMxQmZJT0/gmXMLw9tB6OjC3RL3qlgl8Cc/ g==;
X-CSE-ConnectionGUID: ZjVMup5+SDimeE1qm+gKZw==
X-CSE-MsgGUID: vjCP6IeDSCi60vW+/4PfYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486775"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:53:48 -0700
X-CSE-ConnectionGUID: 5hWUoADYRjqQnruhNiaV2g==
X-CSE-MsgGUID: z3LlB+GgQqyjlg8WFNhfKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787102"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:53:46 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
Date: Fri,  6 Jun 2025 23:27:01 +0530
Message-Id: <20250606175707.1403384-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606175707.1403384-1-badal.nilawar@intel.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
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

Search for late binding firmware binaries and populate the meta data of
firmware structures.

v2:
 - drm_err if firmware size is more than max pay load size (Daniele)
 - s/request_firmware/firmware_request_nowarn/ as firmware will
   not be available for all possible cards (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  2 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 86 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |  1 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 37 ++++++++++
 4 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e062ddaa83bb..df4b0e038a6d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -891,6 +891,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_late_bind_init(&xe->late_bind);
 
+	xe_late_bind_fw_init(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 22eb9b51b4ee..0231f3dcfc18 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -5,6 +5,7 @@
 
 #include <linux/component.h>
 #include <linux/delay.h>
+#include <linux/firmware.h>
 
 #include <drm/drm_managed.h>
 #include <drm/intel/i915_component.h>
@@ -13,13 +14,94 @@
 
 #include "xe_device.h"
 #include "xe_late_bind_fw.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
-static struct xe_device *
-late_bind_to_xe(struct xe_late_bind *late_bind)
+static const char * const fw_type_to_name[] = {
+		[CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
+	};
+
+static struct xe_device *late_bind_to_xe(struct xe_late_bind *late_bind)
 {
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	u32 uval;
+
+	if (!xe_pcode_read(root_tile,
+			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
+		return uval;
+	else
+		return 0;
+}
+
+static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_late_bind_fw *lb_fw;
+	const struct firmware *fw;
+	u32 num_fans;
+	int ret;
+
+	if (!late_bind->component_added)
+		return 0;
+
+	lb_fw = &late_bind->late_bind_fw;
+
+	lb_fw->type = type;
+	lb_fw->valid = false;
+
+	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
+		num_fans = late_bind_fw_num_fans(late_bind);
+		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
+		if (!num_fans)
+			return 0;
+	}
+
+	lb_fw->flags = CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
+
+	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+		 fw_type_to_name[type], pdev->device,
+		 pdev->subsystem_vendor, pdev->subsystem_device);
+
+	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
+	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
+	if (ret) {
+		drm_dbg(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);
+		return 0;
+	}
+
+	if (fw->size > MAX_PAYLOAD_SIZE) {
+		lb_fw->payload_size = MAX_PAYLOAD_SIZE;
+		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
+			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
+		return 0;
+	}
+
+	lb_fw->payload_size = fw->size;
+
+	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
+	release_firmware(fw);
+	lb_fw->valid = true;
+
+	return 0;
+}
+
+/**
+ * xe_mei_late_bind_fw_init() - Initialize late bind firmware
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
+int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
+{
+	return late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
+}
+
 static int xe_late_bind_component_bind(struct device *xe_kdev,
 				       struct device *mei_kdev, void *data)
 {
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 4c73571c3e62..a8b47523b203 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -11,5 +11,6 @@
 struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index afa1917b5f51..c427e141c685 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,6 +10,41 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#define MAX_PAYLOAD_SIZE (1024 * 4)
+
+/**
+ * xe_late_bind_fw_type - enum to determine late binding fw type
+ */
+enum xe_late_bind_type {
+	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
+};
+
+/**
+ * Late Binding flags
+ */
+enum csc_late_binding_flags {
+	/** Persistent across warm reset */
+	CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1
+};
+
+/**
+ * struct xe_late_bind_fw
+ */
+struct xe_late_bind_fw {
+	/** @late_bind_fw.valid */
+	bool valid;
+	/** @late_bind_fw.blob_path: late binding fw blob path */
+	char blob_path[PATH_MAX];
+	/** @late_bind_fw.type */
+	u32  type;
+	/** @late_bind_fw.flags */
+	u32  flags;
+	/** @late_bind_fw.payload: to store the late binding blob */
+	u8  payload[MAX_PAYLOAD_SIZE];
+	/** @late_bind_fw.payload_size: late binding blob payload_size */
+	size_t payload_size;
+};
+
 /**
  * struct xe_late_bind_component - Late Binding services component
  * @mei_dev: device that provide Late Binding service.
@@ -34,6 +69,8 @@ struct xe_late_bind {
 	bool component_added;
 	/** @late_bind.mutex: protects the component binding and usage */
 	struct mutex mutex;
+	/** @late_bind.late_bind_fw: late binding firmware */
+	struct xe_late_bind_fw late_bind_fw;
 };
 
 #endif
-- 
2.34.1

