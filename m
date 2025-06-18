Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144CEADF677
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CCF10E91B;
	Wed, 18 Jun 2025 18:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIb80hz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E810E943;
 Wed, 18 Jun 2025 18:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750272998; x=1781808998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9K3w8vnfN4fxeur8c3NRnZDviAUw24vTKeSJ2wZZBtI=;
 b=cIb80hz45d/CO/QWhVE4S707FHnWEc/qie/PeuMC6PnrMpxHlthdd5ai
 7Vvo8ksKE9ZyatzVIFMzlGgYncIUOJuEtEh3k8e9W50Z1uEdNIm22usVO
 ALY91s8YNQCs1t5lUlTZILgavu91i4C8W53bj496yyp09xiJG/+OKteXI
 zI4ult5JN2pfruiGzFHaMmq6dbGG1ZFPgjReI07AnbK1BVMKZUFtINPZ7
 znLB4gAS4mC/ac5OykdDys/rqLqIL0iYS/hQe7RrOsmEtjJI0ujVhf5gA
 N9ucTF+WhLXYa8ZYiRthOpOKSgJmy4xkmcvBJn8lk+Dfz8/yADWuU8uRz A==;
X-CSE-ConnectionGUID: XtK8z0pTTWWkzLH8ql6z1A==
X-CSE-MsgGUID: B7nZiyZdT6CgCbVUyb7xIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210185"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52210185"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:56:37 -0700
X-CSE-ConnectionGUID: zq1vqjncQyKRu52Swa7tIg==
X-CSE-MsgGUID: 4l890lChSw+yr2T/801HBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153951538"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v3 02/10] mei: late_bind: add late binding component driver
Date: Thu, 19 Jun 2025 00:29:59 +0530
Message-Id: <20250618190007.2932322-3-badal.nilawar@intel.com>
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

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add late binding component driver.
It allows pushing the late binding configuration from, for example,
the Xe graphics driver to the Intel discrete graphics card's CSE device.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2:
 - Use generic naming (Jani)
 - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
v3:
 - Updated kconfig description
 - Move CSC late binding specific flags/defines to late_bind_mei_interface.h (Daniele)
v4:
 - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards (Anshuman)
---
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 264 ++++++++++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  50 ++++
 7 files changed, 339 insertions(+)
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index 7575fee96cc6..771becc68095 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -84,5 +84,6 @@ config INTEL_MEI_VSC
 source "drivers/misc/mei/hdcp/Kconfig"
 source "drivers/misc/mei/pxp/Kconfig"
 source "drivers/misc/mei/gsc_proxy/Kconfig"
+source "drivers/misc/mei/late_bind/Kconfig"
 
 endif
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
index 6f9fdbf1a495..84bfde888d81 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
 obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/
 
 obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o
 mei-vsc-hw-y := vsc-tp.o
diff --git a/drivers/misc/mei/late_bind/Kconfig b/drivers/misc/mei/late_bind/Kconfig
new file mode 100644
index 000000000000..65c7180c5678
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+config INTEL_MEI_LATE_BIND
+	tristate "Intel late binding support on ME Interface"
+	select INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  MEI Support for Late Binding for Intel graphics card.
+
+	  Enables the ME FW interfaces for Late Binding feature,
+	  allowing loading of firmware for the devices like Fan
+	  Controller during by Intel Xe driver.
diff --git a/drivers/misc/mei/late_bind/Makefile b/drivers/misc/mei/late_bind/Makefile
new file mode 100644
index 000000000000..a0aeda5853f0
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+# Makefile - Late Binding client driver for Intel MEI Bus Driver.
+
+subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
+
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c b/drivers/misc/mei/late_bind/mei_late_bind.c
new file mode 100644
index 000000000000..cb985f32309e
--- /dev/null
+++ b/drivers/misc/mei/late_bind/mei_late_bind.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Intel Corporation
+ */
+#include <drm/drm_connector.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/late_bind_mei_interface.h>
+#include <linux/component.h>
+#include <linux/pci.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+
+#include "mkhi.h"
+
+#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12
+#define GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD | 0x80)
+
+#define LATE_BIND_SEND_TIMEOUT_MSEC 3000
+#define LATE_BIND_RECV_TIMEOUT_MSEC 3000
+
+/**
+ * struct csc_heci_late_bind_req - late binding request
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @flags: flags to be passed to the firmware
+ * @reserved: reserved field
+ * @payload_size: size of the payload data in bytes
+ * @payload: data to be sent to the firmware
+ */
+struct csc_heci_late_bind_req {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 flags;
+	u32 reserved[2];
+	u32 payload_size;
+	u8  payload[] __counted_by(payload_size);
+} __packed;
+
+/**
+ * struct csc_heci_late_bind_rsp - late binding response
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @reserved: reserved field
+ * @status: status of the late binding command execution by firmware
+ */
+struct csc_heci_late_bind_rsp {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 reserved[2];
+	u32 status;
+} __packed;
+
+static int mei_late_bind_check_response(const struct device *dev, const struct mkhi_msg_hdr *hdr)
+{
+	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
+		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
+			hdr->group_id, MKHI_GROUP_ID_GFX);
+		return -EINVAL;
+	}
+
+	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
+		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
+			hdr->command, GFX_SRV_MKHI_LATE_BINDING_RSP);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * mei_late_bind_push_config - Sends a config to the firmware.
+ * @dev: device struct corresponding to the mei device
+ * @type: payload type
+ * @flags: payload flags
+ * @payload: payload buffer
+ * @payload_size: payload buffer size
+ *
+ * Return: 0 success, negative errno value on transport failure,
+ *         positive status returned by FW
+ */
+static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
+				     const void *payload, size_t payload_size)
+{
+	struct mei_cl_device *cldev;
+	struct csc_heci_late_bind_req *req = NULL;
+	struct csc_heci_late_bind_rsp rsp;
+	size_t req_size;
+	int ret;
+
+	if (!dev || !payload || !payload_size)
+		return -EINVAL;
+
+	cldev = to_mei_cl_device(dev);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
+		return ret;
+	}
+
+	req_size = struct_size(req, payload, payload_size);
+	if (req_size > mei_cldev_mtu(cldev)) {
+		dev_err(dev, "Payload is too big %zu\n", payload_size);
+		ret = -EMSGSIZE;
+		goto end;
+	}
+
+	req = kmalloc(req_size, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	req->header.group_id = MKHI_GROUP_ID_GFX;
+	req->header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
+	req->type = type;
+	req->flags = flags;
+	req->reserved[0] = 0;
+	req->reserved[1] = 0;
+	req->payload_size = payload_size;
+	memcpy(req->payload, payload, payload_size);
+
+	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size, LATE_BIND_SEND_TIMEOUT_MSEC);
+	if (ret < 0) {
+		dev_err(dev, "mei_cldev_send failed. %d\n", ret);
+		goto end;
+	}
+	ret = mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp), LATE_BIND_RECV_TIMEOUT_MSEC);
+	if (ret < 0) {
+		dev_err(dev, "mei_cldev_recv failed. %d\n", ret);
+		goto end;
+	}
+	ret = mei_late_bind_check_response(dev, &rsp.header);
+	if (ret) {
+		dev_err(dev, "bad result response from the firmware: 0x%x\n",
+			*(uint32_t *)&rsp.header);
+		goto end;
+	}
+	ret = (int)rsp.status;
+	dev_dbg(dev, "%s status = %d\n", __func__, ret);
+
+end:
+	mei_cldev_disable(cldev);
+	kfree(req);
+	return ret;
+}
+
+static const struct late_bind_component_ops mei_late_bind_ops = {
+	.owner = THIS_MODULE,
+	.push_config = mei_late_bind_push_config,
+};
+
+static int mei_component_master_bind(struct device *dev)
+{
+	return component_bind_all(dev, (void *)&mei_late_bind_ops);
+}
+
+static void mei_component_master_unbind(struct device *dev)
+{
+	component_unbind_all(dev, (void *)&mei_late_bind_ops);
+}
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_component_master_bind,
+	.unbind = mei_component_master_unbind,
+};
+
+/**
+ * mei_late_bind_component_match - compare function for matching mei late bind.
+ *
+ *    The function checks if requested is Intel VGA device
+ *    and the parent of requester and the grand parent of mei_if are the same
+ *    device.
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (I915_COMPONENT_LATE_BIND)
+ * @data: compare data (mei late-bind bus device)
+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_late_bind_component_match(struct device *dev, int subcomponent,
+					 void *data)
+{
+	struct device *base = data;
+	struct pci_dev *pdev;
+
+	if (!dev)
+		return 0;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
+	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
+		return 0;
+
+	if (subcomponent != I915_COMPONENT_LATE_BIND)
+		return 0;
+
+	base = base->parent;
+	if (!base) /* mei device */
+		return 0;
+
+	base = base->parent; /* pci device */
+
+	return !!base && dev == base;
+}
+
+static int mei_late_bind_probe(struct mei_cl_device *cldev,
+			       const struct mei_cl_device_id *id)
+{
+	struct component_match *master_match = NULL;
+	int ret;
+
+	component_match_add_typed(&cldev->dev, &master_match,
+				  mei_late_bind_component_match, &cldev->dev);
+	if (IS_ERR_OR_NULL(master_match))
+		return -ENOMEM;
+
+	ret = component_master_add_with_match(&cldev->dev,
+					      &mei_component_master_ops,
+					      master_match);
+	if (ret < 0)
+		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
+
+	return ret;
+}
+
+static void mei_late_bind_remove(struct mei_cl_device *cldev)
+{
+	component_master_del(&cldev->dev, &mei_component_master_ops);
+}
+
+#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
+			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
+
+static struct mei_cl_device_id mei_late_bind_tbl[] = {
+	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
+
+static struct mei_cl_driver mei_late_bind_driver = {
+	.id_table = mei_late_bind_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_late_bind_probe,
+	.remove	= mei_late_bind_remove,
+};
+
+module_mei_cl_driver(mei_late_bind_driver);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MEI Late Binding");
diff --git a/include/drm/intel/i915_component.h b/include/drm/intel/i915_component.h
index 4ea3b17aa143..4945044d41e6 100644
--- a/include/drm/intel/i915_component.h
+++ b/include/drm/intel/i915_component.h
@@ -31,6 +31,7 @@ enum i915_component_type {
 	I915_COMPONENT_HDCP,
 	I915_COMPONENT_PXP,
 	I915_COMPONENT_GSC_PROXY,
+	I915_COMPONENT_LATE_BIND,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/intel/late_bind_mei_interface.h b/include/drm/intel/late_bind_mei_interface.h
new file mode 100644
index 000000000000..2c53657ce91b
--- /dev/null
+++ b/include/drm/intel/late_bind_mei_interface.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2025 Intel Corporation
+ */
+
+#ifndef _LATE_BIND_MEI_INTERFACE_H_
+#define _LATE_BIND_MEI_INTERFACE_H_
+
+#include <linux/types.h>
+
+struct device;
+struct module;
+
+/**
+ * Late Binding flags
+ * Persistent across warm reset
+ */
+#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
+
+/**
+ * xe_late_bind_fw_type - enum to determine late binding fw type
+ */
+enum late_bind_type {
+	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
+};
+
+/**
+ * struct late_bind_component_ops - ops for Late Binding services.
+ * @owner: Module providing the ops
+ * @push_config: Sends a config to FW.
+ */
+struct late_bind_component_ops {
+	struct module *owner;
+
+	/**
+	 * @push_config: Sends a config to FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @type: payload type
+	 * @flags: payload flags
+	 * @payload: payload buffer
+	 * @payload_size: payload buffer size
+	 *
+	 * Return: 0 success, negative errno value on transport failure,
+	 *         positive status returned by FW
+	 */
+	int (*push_config)(struct device *dev, u32 type, u32 flags,
+			   const void *payload, size_t payload_size);
+};
+
+#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
-- 
2.34.1

