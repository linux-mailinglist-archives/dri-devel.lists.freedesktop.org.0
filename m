Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86DAF8144
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F2D10E8D3;
	Thu,  3 Jul 2025 19:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcpTQA2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F83D10E8CA;
 Thu,  3 Jul 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570813; x=1783106813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SsTnvwJ+cEVA7NM8KwrGIh0nmDOkD5TYSCwiYE+RYKE=;
 b=GcpTQA2bsMtVWbkEG4qLtRo454NpKwYielP9JCjiZR4QFqE8+eoGM3O3
 vMWQgofX/E7doqfY5yfShTKtembpAMj/i1uNUI4u8J/YzqP9LDsAhY1Ga
 qWjvVSZt6PSq2EtToOUb3o0waDqbUln+hRHcyXjns3mkQt4hHJunWJwkE
 QIGScK6S4qOh0PYu6rPDsCM17x9MZ5qX4uDTtXPgYhHb/y93KNUIYvpwF
 +bIL42bHxojrUBqld99ryuaZxEIEFtcs28bRgL9Z3j11KVmPskYjaSlF6
 BVmG8IOQJe6AGcEWA0uiK/UgVmiWCAn3fTjgyl7jJA3W1gEZupyuZPNOR Q==;
X-CSE-ConnectionGUID: Dd4rc4iYTRG7YzmN22OuPw==
X-CSE-MsgGUID: mD7p/zxETq+XdWlSU2dBjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65361999"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="65361999"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:26:53 -0700
X-CSE-ConnectionGUID: QoAjFWCXRFmYDCmq6unlIA==
X-CSE-MsgGUID: Yf0UsJ/RTw6LQAEqB6YTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="191624631"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:26:51 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v6 03/10] drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
Date: Fri,  4 Jul 2025 01:00:59 +0530
Message-Id: <20250703193106.954536-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703193106.954536-1-badal.nilawar@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
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

Introducing xe_late_bind_fw to enable firmware loading for the devices,
such as the fan controller, during the driver probe. Typically,
firmware for such devices are part of IFWI flash image but can be
replaced at probe after OEM tuning.
This patch binds mei late binding component to enable firmware loading.

v2:
 - Add devm_add_action_or_reset to remove the component (Daniele)
 - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
v3:
 - Fail driver probe if late bind initialization fails,
   add has_late_bind flag (Daniele)
v4:
 - %S/I915_COMPONENT_LATE_BIND/INTEL_COMPONENT_LATE_BIND/
v6:
 - rebased

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/xe_device.c             |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 83 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 35 +++++++++
 drivers/gpu/drm/xe/xe_pci.c                |  2 +
 drivers/gpu/drm/xe/xe_pci_types.h          |  1 +
 8 files changed, 148 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7c039caefd00..521547d78fd2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -76,6 +76,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
+	xe_late_bind_fw.o \
 	xe_migrate.o \
 	xe_mmio.o \
 	xe_mocs.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..cb595bae5f55 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -44,6 +44,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
@@ -866,6 +867,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_late_bind_init(&xe->late_bind);
+	if (err && err != -ENODEV)
+		return err;
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 78c4acafd268..a8891833f980 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,6 +16,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
+#include "xe_late_bind_fw_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
@@ -325,6 +326,8 @@ struct xe_device {
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @info.has_late_bind: Device has firmware late binding support */
+		u8 has_late_bind:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mbx_power_limits: Device has support to manage power limits using
@@ -557,6 +560,9 @@ struct xe_device {
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
+	/** @late_bind: xe mei late bind interface */
+	struct xe_late_bind late_bind;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
new file mode 100644
index 000000000000..22e79f0dbbdf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+
+#include <drm/drm_managed.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/late_bind_mei_interface.h>
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_late_bind_fw.h"
+
+static struct xe_device *
+late_bind_to_xe(struct xe_late_bind *late_bind)
+{
+	return container_of(late_bind, struct xe_device, late_bind);
+}
+
+static int xe_late_bind_component_bind(struct device *xe_kdev,
+				       struct device *mei_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_late_bind *late_bind = &xe->late_bind;
+
+	late_bind->component.ops = data;
+	late_bind->component.mei_dev = mei_kdev;
+
+	return 0;
+}
+
+static void xe_late_bind_component_unbind(struct device *xe_kdev,
+					  struct device *mei_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_late_bind *late_bind = &xe->late_bind;
+
+	late_bind->component.ops = NULL;
+}
+
+static const struct component_ops xe_late_bind_component_ops = {
+	.bind   = xe_late_bind_component_bind,
+	.unbind = xe_late_bind_component_unbind,
+};
+
+static void xe_late_bind_remove(void *arg)
+{
+	struct xe_late_bind *late_bind = arg;
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+
+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+}
+
+/**
+ * xe_late_bind_init() - add xe mei late binding component
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
+int xe_late_bind_init(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int err;
+
+	if (!xe->info.has_late_bind)
+		return 0;
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
+		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
+		return -ENODEV;
+	}
+
+	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
+				  INTEL_COMPONENT_LATE_BIND);
+	if (err < 0) {
+		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+}
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
new file mode 100644
index 000000000000..4c73571c3e62
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LATE_BIND_FW_H_
+#define _XE_LATE_BIND_FW_H_
+
+#include <linux/types.h>
+
+struct xe_late_bind;
+
+int xe_late_bind_init(struct xe_late_bind *late_bind);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
new file mode 100644
index 000000000000..9806d17291ad
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LATE_BIND_TYPES_H_
+#define _XE_LATE_BIND_TYPES_H_
+
+#include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/**
+ * struct xe_late_bind_component - Late Binding services component
+ * @mei_dev: device that provide Late Binding service.
+ * @ops: Ops implemented by Late Binding driver, used by Xe driver.
+ *
+ * Communication between Xe and MEI drivers for Late Binding services
+ */
+struct xe_late_bind_component {
+	/** @late_bind_component.mei_dev: mei device */
+	struct device *mei_dev;
+	/** @late_bind_component.ops: late binding ops */
+	const struct late_bind_component_ops *ops;
+};
+
+/**
+ * struct xe_late_bind
+ */
+struct xe_late_bind {
+	/** @late_bind.component: struct for communication with mei component */
+	struct xe_late_bind_component component;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 42aaef9fa2ea..b1fe5a323897 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -329,6 +329,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.max_gt_per_tile = 2,
+	.has_late_bind = true,
 	.needs_scratch = true,
 };
 
@@ -575,6 +576,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
+	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 4de6f69ed975..51a607d323fb 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -39,6 +39,7 @@ struct xe_device_desc {
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
+	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_pxp:1;
-- 
2.34.1

