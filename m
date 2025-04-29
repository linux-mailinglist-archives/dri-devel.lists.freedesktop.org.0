Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B949AA1141
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5F110E514;
	Tue, 29 Apr 2025 16:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHatTEVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120C10E512;
 Tue, 29 Apr 2025 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942899; x=1777478899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=An94MrJ1lpqZ4LYrbUqiW0Nj8JyFU5tAOanobRtFWwk=;
 b=gHatTEVSaFkldT5164eoVjKjXJwYHmbPSQqfBcg0yOGHGnrVVMGACON8
 MViY51Lcs1nfPvT67R9cc6D44FE4nHIyGgxWHpvNN9if3Jz/v5koTjVeO
 0r6GdIWuJUCs9FE8n0vg4rfiWp1D8hzhI25tQlyRh5tNfgnNp4CS4prR2
 rVw4Ge9oS8Dp9iwtNvl3OpasEIcSN0QwnsdNKKtwzDrpXCMckuZcCyPIp
 EXbZrG5qlVfz7hLUo7Y8n/tZtgcece14igWjtr3I30l7w1KLoB/gIfEqZ
 W70WkYc/xhevMECmOaSWGTfbYyM69Nkt/uU9+Z6DYdw1MwiRR6c0GjVE3 Q==;
X-CSE-ConnectionGUID: vsFmR0EiSEyUw9/7EYGLhA==
X-CSE-MsgGUID: mCO847kaRVW3Jz0Afi/XnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585516"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585516"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:08:19 -0700
X-CSE-ConnectionGUID: +WYrVyZNRdS7zF2lAa7PVg==
X-CSE-MsgGUID: zk7PdYUNRDef4RlFamrmig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055955"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:08:16 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Date: Tue, 29 Apr 2025 21:39:56 +0530
Message-Id: <20250429160956.1014376-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited
access from user space (as admin) to some very specific PCODE
Mailboxes only related to hardware configuration.

PCODE is a Firmware in Intel GPUs which is the main responsible
component for power and thermal aspects of the Intel GPUs.

Each different Intel GPU came with different PCODE versions with
different mailboxes and different needs. In the lack of an unified
interface, the per platform sysfs entries at the device level is
trending to grow, to allow admins to control different aspects of
the Hardware.

In this first experiment, xe_pcode_fwctl only adds support for the
Battlemage late-binding firmware information.

Late-binding is the name given to 2 other new auxiliary firmware
blobs that for now lives in the Flash like PCODE, but that soon
it is coming to linux-firmware.git: Fan-controller and
Voltage-regulator. Then, PCODE provides some mailboxes where the
status of both late-binding firmware can be queried as specified
in the documentation that is added along with the new uAPI here.

RFC IMPORTANT NOTE:
===================
Admins will need to query this information. This code here aims
to be used by Level0-Sysman and/or Intel XPU Manager directly
from user space. But following the drm upstream rules, the
userspace code will need to be ready before we can consider
getting this patch merged!

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 Documentation/userspace-api/fwctl/index.rst |   1 +
 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_pci.c                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_fwctl.c         | 218 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_fwctl.h         |  13 ++
 include/uapi/fwctl/fwctl.h                  |   1 +
 include/uapi/fwctl/xe_pcode.h               |  80 +++++++
 8 files changed, 320 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
 create mode 100644 include/uapi/fwctl/xe_pcode.h

diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
index 316ac456ad3b..186f8cf17583 100644
--- a/Documentation/userspace-api/fwctl/index.rst
+++ b/Documentation/userspace-api/fwctl/index.rst
@@ -12,3 +12,4 @@ to securely construct and execute RPCs inside device firmware.
    fwctl
    fwctl-cxl
    pds_fwctl
+   xe_pcode_fwctl
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index a8cc1876a24f..ee77039b9256 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select AUXILIARY_BUS
 	select HMM_MIRROR
 	select INTEL_MEI_LATE_BIND
+	select FWCTL
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6de291a21965..c1f3b2e2da5f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -86,6 +86,7 @@ xe-y += xe_bb.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_pcode_fwctl.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 882398e09b7e..222e75c7427e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -27,6 +27,7 @@
 #include "xe_module.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
+#include "xe_pcode_fwctl.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
@@ -868,6 +869,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_driver_cleanup;
 
+	err = xe_pcode_fwctl_init(xe);
+	if (err)
+		goto err_driver_cleanup;
+
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
new file mode 100644
index 000000000000..d6443aa4a60a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_pcode_fwctl.h"
+
+#include <linux/fwctl.h>
+#include <uapi/fwctl/xe_pcode.h>
+
+#include "xe_device.h"
+#include "xe_pcode_api.h"
+#include "xe_pcode.h"
+#include "xe_pm.h"
+
+/**
+ * DOC: XE PCODE FWCTL
+ *
+ * Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited access
+ * from user space (as admin) to some very specific PCODE Mailboxes.
+ *
+ * User space first needs to issue the ```FWCTL_INFO``` ioctl and check for the
+ * capability flag, which will indicate which group of Mailboxes commands are
+ * supported on that current running firmware.
+ *
+ * After verifying the availability of the desired Mailbox command,
+ * ```FWCTL_RPC``` needs to be issued with in and out parameter both using
+ * pointers to a ```struct fwctl_rpc_xe_pcode``` allocated by userspace.
+ * In and out length needs to be sizeof(struct fwctl_rpc_xe_pcode).
+ *
+ * Any command that is not listed in the include/uapi/fwctl/xe_pcode.h or not
+ * supported by the running firmware, will return ERR_PTR(-EBADMSG).
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ *  struct fwctl_info_xe_pcode xe_pcode_info;
+ *
+ *  struct fwctl_info info = {
+ *           .size = sizeof(struct fwctl_info),
+ *           .flags = 0,
+ *           .out_device_type = 0,
+ *           .device_data_len = sizeof(struct fwctl_info_xe_pcode),
+ *           .out_device_data = (__aligned_u64) &xe_pcode_info,
+ *   };
+ *
+ *   fd = open("/dev/fwctl/fwctl0", O_RDWR);
+ *   if (fd < 0) {
+ *       perror("Failed to open /dev/fwctl/fwctl0");
+ *       return -1;
+ *   }
+ *
+ *   if (ioctl(fd, FWCTL_INFO, &info)) {
+ *           perror("ioctl(FWCTL_INFO) failed");
+ *           close(fd);
+ *           return -1;
+ *   }
+ *
+ *   if (xe_pcode_info.uctx_caps & FWCTL_XE_PCODE_LATEBINDING) {
+ *           struct fwctl_rpc_xe_pcode rpc_in = {
+ *                   .command = PCODE_CMD_LATE_BINDING,
+ *                   .param1 = PARAM1_GET_CAPABILITY_STATUS,
+ *           };
+ *
+ *           struct fwctl_rpc_xe_pcode rpc_out = {0};
+ *
+ *           struct fwctl_rpc rpc = {
+ *                   .size = sizeof(struct fwctl_rpc),
+ *                   .scope = FWCTL_RPC_CONFIGURATION,
+ *                   .in_len = sizeof(struct fwctl_rpc_xe_pcode),
+ *                   .out_len = sizeof(struct fwctl_rpc_xe_pcode),
+ *                   .in = (__aligned_u64) &rpc_in,
+ *                   .out = (__aligned_u64) &rpc_out,
+ *           };
+ *
+ *           if (ioctl(fd, FWCTL_RPC, &rpc)) {
+ *                   perror("ioctl(FWCTL_RPC) failed");
+ *                   close(fd);
+ *                   return -1;
+ *           }
+ *
+ */
+
+struct xe_pcode_fwctl_dev {
+	struct fwctl_device fwctl;
+	struct xe_device *xe;
+};
+
+DEFINE_FREE(xe_pcode_fwctl, struct xe_pcode_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
+
+static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_device *xe = fwctl_dev->xe;
+
+	xe_pm_runtime_get(xe);
+
+	return 0;
+}
+
+static void xe_pcode_fwctl_uctx_close(struct fwctl_uctx *uctx)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_device *xe = fwctl_dev->xe;
+
+	xe_pm_runtime_put(xe);
+}
+
+static void *xe_pcode_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_device *xe = fwctl_dev->xe;
+	struct fwctl_info_xe_pcode *info;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	if (xe->info.platform == XE_BATTLEMAGE)
+		info->uctx_caps = FWCTL_XE_PCODE_LATEBINDING;
+
+	*length = sizeof(*info);
+
+	return info;
+}
+
+static bool xe_pcode_fwctl_rpc_validate(struct fwctl_rpc_xe_pcode *rpc,
+					enum fwctl_rpc_scope scope)
+{
+	u32 mbox = PCODE_MBOX(rpc->command, rpc->param1, rpc->param2);
+
+	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
+			       PARAM1_GET_CAPABILITY_STATUS, 0))
+		return scope == FWCTL_RPC_CONFIGURATION;
+
+	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
+			       PARAM1_GET_VERSION_LOW, 0))
+		return (rpc->data0 == DATA0_TYPE_FAN_CONTROLLER ||
+			rpc->data0 == DATA0_TYPE_VOLTAGE_REGULATOR) &&
+			scope == FWCTL_RPC_CONFIGURATION;
+
+	return false;
+}
+
+static void *xe_pcode_fwctl_rpc(struct fwctl_uctx *uctx,
+				enum fwctl_rpc_scope scope,
+				void *in, size_t in_len, size_t *out_len)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_tile *root_tile = xe_device_get_root_tile(fwctl_dev->xe);
+	struct fwctl_rpc_xe_pcode *rpc = in;
+	int err;
+
+	if (in_len != sizeof(struct fwctl_rpc_xe_pcode) ||
+	    *out_len != sizeof(struct fwctl_rpc_xe_pcode))
+		return ERR_PTR(-EMSGSIZE);
+
+	if (!xe_pcode_fwctl_rpc_validate(rpc, scope))
+		return ERR_PTR(-EBADMSG);
+
+	err = xe_pcode_read(root_tile, PCODE_MBOX(rpc->command,
+						  rpc->param1,
+						  rpc->param2),
+			    &rpc->data0,
+			    &rpc->data1);
+	if (err)
+		return ERR_PTR(err);
+
+	return rpc;
+}
+
+static const struct fwctl_ops xe_pcode_fwctl_ops = {
+	.device_type = FWCTL_DEVICE_TYPE_XE_PCODE,
+	.uctx_size = sizeof(struct fwctl_uctx),
+	.open_uctx = xe_pcode_fwctl_uctx_open,
+	.close_uctx = xe_pcode_fwctl_uctx_close,
+	.info = xe_pcode_fwctl_info,
+	.fw_rpc = xe_pcode_fwctl_rpc,
+};
+
+static void xe_pcode_fwctl_fini(void *dev)
+{
+	struct fwctl_device *fwctl = dev;
+
+	fwctl_unregister(fwctl);
+	fwctl_put(fwctl);
+}
+
+int xe_pcode_fwctl_init(struct xe_device *xe)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev __free(xe_pcode_fwctl) =
+		fwctl_alloc_device(xe->drm.dev, &xe_pcode_fwctl_ops,
+				   struct xe_pcode_fwctl_dev, fwctl);
+	int err;
+
+	/* For now xe_pcode_fwctl supports only Late-Binding commands on BMG */
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return -ENODEV;
+
+	if (!fwctl_dev)
+		return -ENOMEM;
+
+	fwctl_dev->xe = xe;
+
+	err = fwctl_register(&fwctl_dev->fwctl);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_pcode_fwctl_fini,
+					&fwctl_dev->fwctl);
+}
+
+MODULE_IMPORT_NS("FWCTL");
diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.h b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
new file mode 100644
index 000000000000..67386d7bf2ea
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PCODE_FWCTL_H_
+#define _XE_PCODE_FWCTL_H_
+
+struct xe_device;
+
+int xe_pcode_fwctl_init(struct xe_device *xe);
+
+#endif
diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
index 716ac0eee42d..9e7e84aef791 100644
--- a/include/uapi/fwctl/fwctl.h
+++ b/include/uapi/fwctl/fwctl.h
@@ -45,6 +45,7 @@ enum fwctl_device_type {
 	FWCTL_DEVICE_TYPE_MLX5 = 1,
 	FWCTL_DEVICE_TYPE_CXL = 2,
 	FWCTL_DEVICE_TYPE_PDS = 4,
+	FWCTL_DEVICE_TYPE_XE_PCODE = 5,
 };
 
 /**
diff --git a/include/uapi/fwctl/xe_pcode.h b/include/uapi/fwctl/xe_pcode.h
new file mode 100644
index 000000000000..8df6db34e5ce
--- /dev/null
+++ b/include/uapi/fwctl/xe_pcode.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _UAPI_FWCTL_XE_PCODE_H_
+#define _UAPI_FWCTL_XE_PCODE_H_
+
+#include <linux/types.h>
+
+/**
+ * struct fwctl_info_xe_pcode - FWCTL Information struct for Xe PCODE
+ *
+ * @uctx_caps:  bitmap of available capabilities:
+ *  - %FWCTL_XE_PCODE_LATEBINDING - Command to configure Late Bind FW such as
+ * Fan Controller and Voltage Regulator
+ * @rsvd: Reserved for future usage or flags
+ */
+struct fwctl_info_xe_pcode {
+	__u32 uctx_caps;
+	__u32 rsvd[3];
+};
+
+#define FWCTL_XE_PCODE_LATEBINDING	(1 << 0)
+
+/**
+ * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
+ */
+struct fwctl_rpc_xe_pcode {
+	/** @command: The main Mailbox command */
+	__u8 command;
+	/** @param1: A subcommand or a parameter of the main command */
+	__u16 param1;
+	/** @param2: A parameter of a subcommand or a subsubcommand */
+	__u16 param2;
+	/** @data0: The first 32 bits of data. In general data-in as param */
+	__u32 data0;
+	/** @data1: The other 32 bits of data. In general data-out */
+	__u32 data1;
+	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
+	__u8 pad[3];
+};
+
+/**
+ * DOC: Late Binding Commands
+ *
+ * FWCTL info.uctx_caps: FWCTL_XE_PCODE_LATEBINDING
+ * FWCTL rpc.scope: FWCTL_RPC_CONFIGURATION
+ *
+ * Command	0x5C - LATE_BINDING
+ * Param1	0x0 - GET_CAPABILITY_STATUS
+ * Param2	0
+ * Data in	None
+ * Data out:
+ *
+ *  - Bit0: ate binding for V1 Fan Tables is supported.
+ *  - Bit3: Late binding for VR parameters.
+ *  - Bit16: Late binding done for V1 Fan tables
+ *  - Bit17: Late binding done for power co-efficients.
+ *  - Bit18: Late binding done for V2 Fan tables
+ *  - Bit19: Late binding done for VR Parameters
+ *
+ * Command	0x5C - LATE_BINDING
+ * Param1	0x1 - GET_VERSION_LOW
+ * Param2	0
+ * Data in - conveys the Type of the Late Binding Configuration:
+ *
+ *  - FAN_CONTROLLER = 1
+ *  - VOLTAGE_REGULATOR = 2
+ *
+ * Data out - Lower 32 bits of Version Number for Late Binding configuration
+ *            that has been applied successfully.
+ */
+#define PCODE_CMD_LATE_BINDING		0x5C
+#define  PARAM1_GET_CAPABILITY_STATUS	0x0
+#define  PARAM1_GET_VERSION_LOW		0x1
+#define   DATA0_TYPE_FAN_CONTROLLER	1
+#define   DATA0_TYPE_VOLTAGE_REGULATOR	2
+
+#endif /* _UAPI_FWCTL_XE_PCODE_H_ */
-- 
2.34.1

