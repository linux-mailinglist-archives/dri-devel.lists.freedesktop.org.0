Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F29AA1138
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A1010E41E;
	Tue, 29 Apr 2025 16:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AomgWpYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D9110E4FB;
 Tue, 29 Apr 2025 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942883; x=1777478883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/chJpio1oITwzX6NPefG6//xvwlVI0jmIfCi8dnOIX8=;
 b=AomgWpYGWkIdGDjR4nnLHlluJckqGE9ZX1nOIF245DAyVwMlcqROfGzD
 UiLBj9spkCTD775m6wjzCwXK+VWIfhe6yKs7O3iOY/buhJ2Cg3F+MyucE
 YyKLXDc9sOTcOreQ1zzVnGlFEwKNeroakKOzaIZPPQqTQD3j5t9KmA6Xf
 OCpbf1kEfRi9aatPgqNRnBuYGfO9epb3EDRstGkeF1Qrwp4SCKcK0DWGP
 G+S2v4mF/tV5b7tC2DyehDUnGR3yFdKpt3enMFouqnG2SDITx+MvPemJP
 4SR15tcsreHUaDBSbwFiT3Owh2fHIo0GMFb9qs4HTTLzLQElrdxBo5qbN Q==;
X-CSE-ConnectionGUID: U1ZFjZb6TdeFt0y3sYbrcg==
X-CSE-MsgGUID: sCgwyVtoQGqlrWWSldf0gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585465"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585465"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:08:02 -0700
X-CSE-ConnectionGUID: qZXZBueDQXCAceLp4YF0tg==
X-CSE-MsgGUID: EZefJeDmRMycWhh204dDVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055909"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:08:00 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 3/9] drm/xe/late_bind_fw: Introducing late_bind_fw
Date: Tue, 29 Apr 2025 21:39:50 +0530
Message-Id: <20250429160956.1014376-4-badal.nilawar@intel.com>
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

Introducing late_bind_fw to enable firmware loading for the devices,
such as the fan controller and voltage regulator, during the driver probe.
Typically, firmware for these devices are part of IFWI flash image but
can be replaced at probe after OEM tuning.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                 |   1 +
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_device.c             |   3 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 104 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |  16 ++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  95 +++++++++++++++++++
 7 files changed, 224 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 9bce047901b2..a8cc1876a24f 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c5d6681645ed..6de291a21965 100644
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
index 75e753e0a682..86a7b7065122 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -42,6 +42,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -889,6 +890,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_late_bind_init(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 495bc00ebed4..57b63cc9b8ac 100644
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
@@ -543,6 +544,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @late_bind: xe mei late bind interface */
+	struct xe_late_bind late_bind;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
new file mode 100644
index 000000000000..7981fc500a78
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+
+#include <drm/drm_managed.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/xe_late_bind_mei_interface.h>
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
+	struct xe_late_bind_component *component;
+
+	component = drmm_kzalloc(&xe->drm, sizeof(*component), GFP_KERNEL);
+
+	mutex_lock(&late_bind->mutex);
+	component->mei_dev = mei_kdev;
+	component->ops = data;
+	mutex_unlock(&late_bind->mutex);
+
+	late_bind->component = component;
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
+	mutex_lock(&late_bind->mutex);
+	late_bind->component = NULL;
+	mutex_unlock(&late_bind->mutex);
+}
+
+static const struct component_ops xe_late_bind_component_ops = {
+	.bind   = xe_late_bind_component_bind,
+	.unbind = xe_late_bind_component_unbind,
+};
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
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return 0;
+
+	mutex_init(&late_bind->mutex);
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND)) {
+		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
+		return -ENODEV;
+	}
+
+	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
+				  I915_COMPONENT_LATE_BIND);
+	if (err < 0) {
+		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	late_bind->component_added = true;
+
+	/* the component must be removed before unload, so can't use drmm for cleanup */
+
+	return 0;
+}
+
+/**
+ * xe_late_bind_remove() - remove the xe mei late binding component
+ */
+void xe_late_bind_remove(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+
+	if (!late_bind->component_added)
+		return;
+
+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+	late_bind->component_added = false;
+}
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
new file mode 100644
index 000000000000..21299de54b47
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -0,0 +1,16 @@
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
+void xe_late_bind_remove(struct xe_late_bind *late_bind);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
new file mode 100644
index 000000000000..ea11061ce556
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_MEI_LATE_BIND_TYPES_H_
+#define _XE_MEI_LATE_BIND_TYPES_H_
+
+#include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define MAX_PAYLOAD_SIZE (1024 * 4)
+
+struct xe_bo;
+struct xe_late_bind_component;
+
+/**
+ * xe_late_bind_fw_type - enum to determine late binding fw type
+ */
+enum xe_late_bind_type {
+	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
+	CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
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
+ * xe_late_bind_fw_id - enum to determine late binding fw index
+ */
+enum xe_late_bind_fw_id {
+	FAN_CONTROL_ID = 0,
+	VOLTAGE_REGULATOR_ID,
+	MAX_ID
+};
+
+/**
+ * struct xe_late_bind_fw
+ */
+struct xe_late_bind_fw {
+	/** @late_bind_fw.valid */
+	bool valid;
+
+	/** @late_bind_fw.id */
+	u32 id;
+
+	/** @late_bind_fw.blob_path: late binding fw blob path */
+	char blob_path[PATH_MAX];
+
+	/** @late_bind_fw.type */
+	u32  type;
+
+	/** @late_bind_fw.type */
+	u32  flags;
+
+	/** @late_bind_fw.payload: to store the late binding blob */
+	u8  payload[MAX_PAYLOAD_SIZE];
+
+	/** @late_bind_fw.payload_size: late binding blob payload_size */
+	size_t payload_size;
+
+	/** @late_bind_fw.work: worker to upload latebind blob */
+	struct work_struct work;
+};
+
+/**
+ * struct xe_late_bind
+ */
+struct xe_late_bind {
+	/** @late_bind.component: struct for communication with mei component */
+	struct xe_late_bind_component *component;
+
+	/** @late_bind.component_added: whether the component has been added */
+	bool component_added;
+
+	/** @late_bind.wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
+
+	/** @late_bind.mutex: protects the component binding and usage */
+	struct mutex mutex;
+
+	/** @late_bind.late_bind_fw: late binding firmwares */
+	struct xe_late_bind_fw late_bind_fw[MAX_ID];
+
+};
+
+#endif
-- 
2.34.1

