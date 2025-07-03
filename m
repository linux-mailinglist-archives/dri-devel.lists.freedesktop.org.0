Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2DAF8145
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4608710E8D5;
	Thu,  3 Jul 2025 19:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HN66/8Xd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F0610E8D1;
 Thu,  3 Jul 2025 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570816; x=1783106816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IExCHgbe0DMrwtqO4NJ6ZPg1veUStyH1WFUiZ3vGh2s=;
 b=HN66/8XdlwISt95G2wbdXGT54bV+V2emB90bL0WgE+jf5bsQR7hPXefm
 Uy4WfA6DbAVsI4cw5bBpfkypxazawGuRWll9nxdbvdlcuNaPPZ8v7HNcT
 9VqiQZj48snOAcgwsKk3TVW1iu59rOOwBZDKBZV4jzx9y1aX/A2xkMFfb
 cmf2mjUVk7eRHC4FNGwSGwW5J7lUl0pLHpqdJF8Gatv40GAgM981a2rJi
 5AetOz+p6MLB66Kf5Lej/MpNvL/JEHEs0NlMQMz4zPRfo9X76oSOUs0n2
 fdARJhEDOw08CdY8/LGFsMYdlHmIvZijYjFhnR54+zADjxn3eGLE+k+kC A==;
X-CSE-ConnectionGUID: 3i3hdP+fQsOINDFhz6JMZA==
X-CSE-MsgGUID: a2+jnOXpS5+6xusp996KDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65362005"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="65362005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:26:56 -0700
X-CSE-ConnectionGUID: F/6G2/f+T5acMZaYTx2IxQ==
X-CSE-MsgGUID: UmsElV2nSdixDuAqnj4CSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="191624639"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:26:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v6 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
Date: Fri,  4 Jul 2025 01:01:00 +0530
Message-Id: <20250703193106.954536-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703193106.954536-1-badal.nilawar@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
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
v4 (Daniele):
 - Alloc payload dynamically, fix nits
v6 (Daniele)
 - %s/MAX_PAYLOAD_SIZE/XE_LB_MAX_PAYLOAD_SIZE/

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 100 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  30 +++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 22e79f0dbbdf..ab83ab06aee7 100644
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
+		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
+	};
+
+static const char * const fw_id_to_name[] = {
+		[XE_LB_FW_FAN_CONTROL] = "fan_control",
+	};
 
 static struct xe_device *
 late_bind_to_xe(struct xe_late_bind *late_bind)
@@ -20,6 +31,89 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
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
+	if (fw_id >= XE_LB_FW_MAX_ID)
+		return -EINVAL;
+
+	lb_fw = &late_bind->late_bind_fw[fw_id];
+
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
+	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
+		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
+			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
+		release_firmware(fw);
+		return -ENODATA;
+	}
+
+	lb_fw->payload_size = fw->size;
+	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
+	if (!lb_fw->payload) {
+		release_firmware(fw);
+		return -ENOMEM;
+	}
+
+	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
+	release_firmware(fw);
+
+	return 0;
+}
+
+static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
+{
+	int ret;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		ret = __xe_late_bind_fw_init(late_bind, fw_id);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static int xe_late_bind_component_bind(struct device *xe_kdev,
 				       struct device *mei_kdev, void *data)
 {
@@ -79,5 +173,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 		return err;
 	}
 
-	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+	if (err)
+		return err;
+
+	return xe_late_bind_fw_init(late_bind);
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 9806d17291ad..cd3143256a7c 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,6 +10,34 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
+
+/**
+ * xe_late_bind_fw_id - enum to determine late binding fw index
+ */
+enum xe_late_bind_fw_id {
+	XE_LB_FW_FAN_CONTROL = 0,
+	XE_LB_FW_MAX_ID
+};
+
+/**
+ * struct xe_late_bind_fw
+ */
+struct xe_late_bind_fw {
+	/** @late_bind_fw.id: firmware index */
+	u32 id;
+	/** @late_bind_fw.blob_path: firmware binary path */
+	char blob_path[PATH_MAX];
+	/** @late_bind_fw.type: firmware type */
+	u32  type;
+	/** @late_bind_fw.flags: firmware flags */
+	u32  flags;
+	/** @late_bind_fw.payload: to store the late binding blob */
+	const u8  *payload;
+	/** @late_bind_fw.payload_size: late binding blob payload_size */
+	size_t payload_size;
+};
+
 /**
  * struct xe_late_bind_component - Late Binding services component
  * @mei_dev: device that provide Late Binding service.
@@ -30,6 +58,8 @@ struct xe_late_bind_component {
 struct xe_late_bind {
 	/** @late_bind.component: struct for communication with mei component */
 	struct xe_late_bind_component component;
+	/** @late_bind.late_bind_fw: late binding firmware array */
+	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
 };
 
 #endif
-- 
2.34.1

