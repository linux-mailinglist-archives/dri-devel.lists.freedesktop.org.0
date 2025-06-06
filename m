Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B08AD07CA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 19:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF3210E184;
	Fri,  6 Jun 2025 17:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEsW8Mb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7641E10E184;
 Fri,  6 Jun 2025 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232425; x=1780768425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ssc2d467Pvxhrqs8K9Iz3hP2Z9HXP6316U2zZeMx45g=;
 b=aEsW8Mb9tW8Op4B6ushTcKFnGdcHIcsg8UC2FSnu9qQNXkZimGo36ciU
 +5RRkrHR1VGujn81bli99lgEoM9GCU+pIFLUeIjqiq/efzv2jb0besFkh
 SiKRnDKNre3jXBVx3V4RtZzCbKKY9vuY3/AQxIe5fuy5QJ1uRraeNvP7e
 l4moFxrQCUC4BKjHeILpQWDfK1S7fF8aOWTq2i+YY8LhYMelBXg72ZxBb
 bPo6oe8XybZ8WFSXfsJuh5AGVWYXvqs+GsYxDR5j0vAkXWTomVZnHEXPT
 CkyZm6KAvKrkoYOlbBR/YVqTBwxh5kzi3SQqmRaeag14zhWWNOdwQ0rJP g==;
X-CSE-ConnectionGUID: CRbPczcARBOtp4jiM0snjA==
X-CSE-MsgGUID: XquAw3jNQXyguOo+0x/4BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486772"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:53:45 -0700
X-CSE-ConnectionGUID: WpOARv7lSTKX3FBDPdWjOg==
X-CSE-MsgGUID: 3n4hw6HYSvqe7gXoivHLFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787098"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:53:43 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 03/10] drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
Date: Fri,  6 Jun 2025 23:27:00 +0530
Message-Id: <20250606175707.1403384-4-badal.nilawar@intel.com>
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

Introducing xe_late_bind_fw to enable firmware loading for the devices,
such as the fan controller, during the driver probe. Typically,
firmware for such devices are part of IFWI flash image but can be
replaced at probe after OEM tuning.
This patch binds late binding component to enable firmware loading
through CSE.

v2:
 - Add devm_add_action_or_reset to remove the component (Daniele)
 - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/xe_device.c             |  3 +
 drivers/gpu/drm/xe/xe_device_types.h       |  4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 96 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 39 +++++++++
 6 files changed, 158 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 01d231777901..134eee21c75e 100644
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
index d4b6e623aa48..e062ddaa83bb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -43,6 +43,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -888,6 +889,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_late_bind_init(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 043515f8c068..3fda450a0774 100644
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
@@ -549,6 +550,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @late_bind: xe mei late bind interface */
+	struct xe_late_bind late_bind;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
new file mode 100644
index 000000000000..22eb9b51b4ee
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -0,0 +1,96 @@
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
+	mutex_lock(&late_bind->mutex);
+	late_bind->component.ops = data;
+	late_bind->component.mei_dev = mei_kdev;
+	mutex_unlock(&late_bind->mutex);
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
+	late_bind->component.ops = NULL;
+	mutex_unlock(&late_bind->mutex);
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
+	if (!late_bind->component_added)
+		return;
+
+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+	late_bind->component_added = false;
+	mutex_destroy(&late_bind->mutex);
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
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return 0;
+
+	mutex_init(&late_bind->mutex);
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
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
index 000000000000..afa1917b5f51
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -0,0 +1,39 @@
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
+	/** @late_bind.component_added: whether the component has been added */
+	bool component_added;
+	/** @late_bind.mutex: protects the component binding and usage */
+	struct mutex mutex;
+};
+
+#endif
-- 
2.34.1

