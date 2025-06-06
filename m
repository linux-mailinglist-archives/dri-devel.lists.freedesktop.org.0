Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC92AD07D1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 19:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12A10E357;
	Fri,  6 Jun 2025 17:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJGc3FQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4E710E044;
 Fri,  6 Jun 2025 17:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232444; x=1780768444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kZByRN0HKYaiBtLfwsjb0jjIRJLucNwtyXkvFU9O3cg=;
 b=AJGc3FQZz4cdFi0S3arvmf2Mu82nC3S0eWW9MbrsXJD7b7diMIophgps
 DEP3qFx3pGePtgcOrebJUMwk3sFsI0GFNStDGbKMt1BwMX7jjSCQqINS8
 1P15cs8TvFbT+S5Ft2xuUogqZh9+Wqsd0ZqNFWh3SW62HLmRUu2p04VeB
 T1zM18I8CRbFGDj8IVhksJ49KptTshGSUBPjxomkhSW4aDBDcMB1r2c4A
 E1kon25GEzNg1d8sGN7G92EbjvyHUvSEbGCq0/6i0CDiILUlsP3UBrOPU
 NyDGqVnlP3Tc168kTtpUkUIN2qa2IN9DWLlMOH31tHYGS0YbNXabpMFLF Q==;
X-CSE-ConnectionGUID: NFohbmNPTWONeV6/+FbpSA==
X-CSE-MsgGUID: ttBd69aQTnaxrFgsJr2JSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486798"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:54:03 -0700
X-CSE-ConnectionGUID: 9DXju/dCSSi2L8GVI8ORLw==
X-CSE-MsgGUID: O9o9UXi1REKljP1ao56MKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787130"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:54:01 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 09/10] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Date: Fri,  6 Jun 2025 23:27:06 +0530
Message-Id: <20250606175707.1403384-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606175707.1403384-1-badal.nilawar@intel.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
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
v2:
  - Resolve review comments (Jason Gunthorpe)
  - Use explicit padding in structure fwctl_rpc_xe_pcode (Jason Gunthorpe)
  - Add xe_pcode_fwctl.rst
---
 Documentation/userspace-api/fwctl/index.rst   |   1 +
 .../userspace-api/fwctl/xe_pcode_fwctl.rst    |  17 ++
 drivers/gpu/drm/xe/Kconfig                    |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 212 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 ++
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe_pcode.h                 |  82 +++++++
 9 files changed, 333 insertions(+)
 create mode 100644 Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
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
diff --git a/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst b/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
new file mode 100644
index 000000000000..c16d0675a485
--- /dev/null
+++ b/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================
+fwctl drm/xe pcode
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_pcode_fwctl.c
+   :doc: XE PCODE FWCTL
+
+uAPI
+====
+
+.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
+   :internal:
+
+.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
+   :doc: Late Binding Commands
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 98b46c534278..27a06d7359c7 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select FWCTL
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 134eee21c75e..eecf5b1680a6 100644
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
index ac4beaed58ff..d0c428adb4c2 100644
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
@@ -875,6 +876,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
index 000000000000..849bf3fa4d30
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
@@ -0,0 +1,212 @@
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
+	return 0;
+}
+
+static void xe_pcode_fwctl_uctx_close(struct fwctl_uctx *uctx)
+{
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
+		return ERR_PTR(-EPERM);
+
+	xe_pm_runtime_get(fwctl_dev->xe);
+
+	err = xe_pcode_read(root_tile, PCODE_MBOX(rpc->command,
+						  rpc->param1,
+						  rpc->param2),
+			    &rpc->data0,
+			    &rpc->data1);
+
+	xe_pm_runtime_put(fwctl_dev->xe);
+
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
index 000000000000..87544e99faa1
--- /dev/null
+++ b/include/uapi/fwctl/xe_pcode.h
@@ -0,0 +1,82 @@
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
+	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
+	__u8 pad[3];
+	/** @param1: A subcommand or a parameter of the main command */
+	__u16 param1;
+	/** @param2: A parameter of a subcommand or a subsubcommand */
+	__u16 param2;
+	/** @data0: The first 32 bits of data. In general data-in as param */
+	__u32 data0;
+	/** @data1: The other 32 bits of data. In general data-out */
+	__u32 data1;
+	/** @rsvd: Reserved for future use */
+	__u32 rsvd[2];
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
+ *  - Bit0: Late binding for V1 Fan Tables is supported.
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

