Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995EAA1139
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5310E4F6;
	Tue, 29 Apr 2025 16:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YENZjnPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A7410E506;
 Tue, 29 Apr 2025 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942885; x=1777478885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gM6cbZHnCkxgQg/eDOsfjfGXIXi9K5EKW7CXkjQ8WCg=;
 b=YENZjnPOyEykbMuwMQXqz+FI/thTDfLJ8UoLyqoZZVb+VbcYxlurvrpf
 r2AJFbdoA6wmoshRVVOFYrmXHmq7l0zDk/m+82O+1pmMkZkR1CHVLH3O7
 ox4925IJGYKUSQrsXjaWpCshnrdqIGjtsQ0ZALP3syfcPcBfw2FBWu19/
 kA1R8lw1rnbC4ueftSVHOjZy3i2H7tVkJ2jyUB6JrscraE5v8irYOxtJf
 HrYkVgUSuJpJ4pvrHBZPXflOXce/z4nqm9FXJe61shTtCxpKB59ifwHjp
 phDjyhgnRoQjYoPPadVPZfjr50q+CsklrtQ31j80VGrOpUlDeGELKzfsk A==;
X-CSE-ConnectionGUID: AtCoywo2QYuc7j2ok80+Sg==
X-CSE-MsgGUID: mr+QGm72QqahFggKUC43sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585471"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:08:05 -0700
X-CSE-ConnectionGUID: NJDoTBuzSKC/axMjKe8L5Q==
X-CSE-MsgGUID: Y7OBFptJTWyNEid8E1RdVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055915"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:08:03 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 4/9] drm/xe/xe_late_bind_fw: Initialize late binding firmware
Date: Tue, 29 Apr 2025 21:39:51 +0530
Message-Id: <20250429160956.1014376-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 101 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h |   1 +
 3 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86a7b7065122..d83864e7189c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -892,6 +892,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_late_bind_init(&xe->late_bind);
 
+	xe_late_bind_fw_init(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 7981fc500a78..297238fd3d16 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -5,6 +5,7 @@
 
 #include <linux/component.h>
 #include <linux/delay.h>
+#include <linux/firmware.h>
 
 #include <drm/drm_managed.h>
 #include <drm/intel/i915_component.h>
@@ -13,13 +14,108 @@
 
 #include "xe_device.h"
 #include "xe_late_bind_fw.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
-static struct xe_device *
-late_bind_to_xe(struct xe_late_bind *late_bind)
+static const char * const fw_id_to_name[] = {
+		[FAN_CONTROL_ID] = "fan_control",
+		[VOLTAGE_REGULATOR_ID] = "voltage_regulator",
+	};
+
+static const u32 fw_id_to_type[] = {
+		[FAN_CONTROL_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
+		[VOLTAGE_REGULATOR_ID] = CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
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
+static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
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
+	if (id >= MAX_ID)
+		return -EINVAL;
+
+	lb_fw = &late_bind->late_bind_fw[id];
+
+	lb_fw->id = id;
+	lb_fw->type = fw_id_to_type[id];
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
+		 fw_id_to_name[id], pdev->device,
+		 pdev->subsystem_vendor, pdev->subsystem_device);
+
+	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
+	ret = request_firmware(&fw, lb_fw->blob_path, xe->drm.dev);
+	if (ret) {
+		drm_err(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);
+		lb_fw->valid = false;
+		return 0;
+	}
+
+	if (fw->size > MAX_PAYLOAD_SIZE)
+		lb_fw->payload_size = MAX_PAYLOAD_SIZE;
+	else
+		lb_fw->payload_size = fw->size;
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
+	int id;
+	int ret;
+
+	for (id = 0; id < MAX_ID; id++) {
+		ret = late_bind_fw_init(late_bind, id);
+		if (ret)
+			return ret;
+	}
+	return ret;
+}
+
 static int xe_late_bind_component_bind(struct device *xe_kdev,
 				       struct device *mei_kdev, void *data)
 {
@@ -83,7 +179,6 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	}
 
 	late_bind->component_added = true;
-
 	/* the component must be removed before unload, so can't use drmm for cleanup */
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 21299de54b47..e88c637b15a6 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -12,5 +12,6 @@ struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 void xe_late_bind_remove(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
 
 #endif
-- 
2.34.1

