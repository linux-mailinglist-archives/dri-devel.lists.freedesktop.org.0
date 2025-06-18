Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E650EADF67B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B5A10E29D;
	Wed, 18 Jun 2025 18:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdZr29xL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA52A10E91E;
 Wed, 18 Jun 2025 18:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750273003; x=1781809003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFAch/KdLyqNVnaEUcPYmMXyt3vXS5Y7eQZh/jJVWxg=;
 b=LdZr29xL2UmWUZYAf1YSuL1K/UkXUP4atllg88AFDN27aeeCtN0J92Ew
 4P2mNCbKW9zWxUNg9LdCLSIXoIYgb/8DPAgJwD5pGcGsPFmOq2/lzQ10e
 74odJS8KNBm30vmutHLeXbqBs/0kUiWteb3zfGRir2chyAjsm5vsQePkQ
 X/mtQ5Xr7olU4f2DiqOTVtlPt3abEnBJv7Oc1rrHRN5fyC5/dEcXq12gW
 bc8bsR16LdDtC5d0plKFQdBHLnzx4gzymfDv6MOGoFYk/Zxv7oKqMZ4yz
 AH8QnIg3w4gKOEhxCEYl5KQre1MCOR8Lx8/NpHsWFmKIhmrTisu7LAvUA Q==;
X-CSE-ConnectionGUID: GP3LP/dMSCqZxRgMufo35Q==
X-CSE-MsgGUID: kcnNEXEiTKG7DcFsK1QBHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210198"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52210198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:56:43 -0700
X-CSE-ConnectionGUID: QzqCr6nsR0ydzltTF4UPwA==
X-CSE-MsgGUID: iAgK3UiAT+C9zJxbw+OVhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153951699"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:40 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v3 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
Date: Thu, 19 Jun 2025 00:30:01 +0530
Message-Id: <20250618190007.2932322-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618190007.2932322-1-badal.nilawar@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
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

v2 (Daniele):
 - drm_err if firmware size is more than max pay load size
 - s/request_firmware/firmware_request_nowarn/ as firmware will
   not be available for all possible cards
v3 (Daniele):
 - init firmware from within xe_late_bind_init, propagate error
 - switch late_bind_fw to array to handle multiple firmware types

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 97 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 32 +++++++
 drivers/misc/mei/late_bind/mei_late_bind.c |  1 -
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 52cb295b7df6..d416d6cc1fa2 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -5,6 +5,7 @@
 
 #include <linux/component.h>
 #include <linux/delay.h>
+#include <linux/firmware.h>
 
 #include <drm/drm_managed.h>
 #include <drm/intel/i915_component.h>
@@ -13,6 +14,16 @@
 
 #include "xe_device.h"
 #include "xe_late_bind_fw.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
+
+static const u32 fw_id_to_type[] = {
+		[FAN_CONTROL_FW_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
+	};
+
+static const char * const fw_id_to_name[] = {
+		[FAN_CONTROL_FW_ID] = "fan_control",
+	};
 
 static struct xe_device *
 late_bind_to_xe(struct xe_late_bind *late_bind)
@@ -20,6 +31,86 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
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
+static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_late_bind_fw *lb_fw;
+	const struct firmware *fw;
+	u32 num_fans;
+	int ret;
+
+	if (fw_id >= MAX_FW_ID)
+		return -EINVAL;
+
+	lb_fw = &late_bind->late_bind_fw[fw_id];
+
+	lb_fw->valid = false;
+	lb_fw->id = fw_id;
+	lb_fw->type = fw_id_to_type[lb_fw->id];
+	lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
+
+	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
+		num_fans = xe_late_bind_fw_num_fans(late_bind);
+		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
+		if (!num_fans)
+			return 0;
+	}
+
+	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+		 fw_id_to_name[lb_fw->id], pdev->device,
+		 pdev->subsystem_vendor, pdev->subsystem_device);
+
+	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
+	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
+	if (ret) {
+		drm_dbg(&xe->drm, "%s late binding fw not available for current device",
+			fw_id_to_name[lb_fw->id]);
+		return 0;
+	}
+
+	if (fw->size > MAX_PAYLOAD_SIZE) {
+		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
+			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
+		release_firmware(fw);
+		return -ENODATA;
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
+static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
+{
+	int ret;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
+		ret = __xe_late_bind_fw_init(late_bind, fw_id);
+		if (ret)
+			return ret;
+	}
+	return ret;
+}
+
 static int xe_late_bind_component_bind(struct device *xe_kdev,
 				       struct device *mei_kdev, void *data)
 {
@@ -89,5 +180,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 
 	late_bind->component_added = true;
 
-	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+	if (err)
+		return err;
+
+	return xe_late_bind_fw_init(late_bind);
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index ef0a9723bee4..c6fd33fd5484 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,6 +10,36 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#define MAX_PAYLOAD_SIZE (1024 * 4)
+
+/**
+ * xe_late_bind_fw_id - enum to determine late binding fw index
+ */
+enum xe_late_bind_fw_id {
+	FAN_CONTROL_FW_ID = 0,
+	MAX_FW_ID
+};
+
+/**
+ * struct xe_late_bind_fw
+ */
+struct xe_late_bind_fw {
+	/** @late_bind_fw.valid: to check if fw is valid */
+	bool valid;
+	/** @late_bind_fw.id: firmware index */
+	u32 id;
+	/** @late_bind_fw.blob_path: firmware binary path */
+	char blob_path[PATH_MAX];
+	/** @late_bind_fw.type: firmware type */
+	u32  type;
+	/** @late_bind_fw.flags: firmware flags */
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
@@ -34,6 +64,8 @@ struct xe_late_bind {
 	bool component_added;
 	/** @late_bind.mutex: protects the component binding and usage */
 	struct mutex mutex;
+	/** @late_bind.late_bind_fw: late binding firmware array */
+	struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
 };
 
 #endif
diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c b/drivers/misc/mei/late_bind/mei_late_bind.c
index cb985f32309e..6ea64c44bb94 100644
--- a/drivers/misc/mei/late_bind/mei_late_bind.c
+++ b/drivers/misc/mei/late_bind/mei_late_bind.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (C) 2025 Intel Corporation
  */
-#include <drm/drm_connector.h>
 #include <drm/intel/i915_component.h>
 #include <drm/intel/late_bind_mei_interface.h>
 #include <linux/component.h>
-- 
2.34.1

