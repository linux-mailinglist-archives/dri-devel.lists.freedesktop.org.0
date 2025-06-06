Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0EAD07CC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 19:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9F910E156;
	Fri,  6 Jun 2025 17:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6KLN+he";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CAE10E317;
 Fri,  6 Jun 2025 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232431; x=1780768431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NzbAWB/KmaXAOtalEVQCbOTKpEuZWRYGDZl7BQ7TJW4=;
 b=e6KLN+heFsAS5o/HuyWNfskmWx4Gy3/+stLr7eLxgvOzq1n1RoLE9Y2k
 mAPqT8hnQDKSQlfSLWsd5XtI9Q+pG1rm254OZixGSXnU6sT70qh9Gzbtv
 M2pK6qReVM+MqnQC6sqlpcYy5HIrsxR5gCchbDKfKCgL4MPTqkOFqQtOZ
 VcTBkRTWMUfoI/LknP79+bVlGE3/yfgo/xRDBv8HaSJsHxERaY1hs7JVI
 qJLyWvMQIjsnpDjpwAViZMlIOsU+FDG3uvCF6NIT9QTlGR3IhPFg77I7t
 BAxkljb9vDMIVPUKVJ1Pbsaq0OIHuQoJlfZRH05FP0O2P5bRJ4yIOFwKF Q==;
X-CSE-ConnectionGUID: /zKX1InOT7+65afnDx7iWQ==
X-CSE-MsgGUID: PhyZDbmAQGeDwr+7zszojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486779"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:53:51 -0700
X-CSE-ConnectionGUID: 2QeHz+NSTCmSn5RjiGGHbw==
X-CSE-MsgGUID: S/YPhQwZS4iTluGMzXL/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787109"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:53:49 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding firmware
Date: Fri,  6 Jun 2025 23:27:02 +0530
Message-Id: <20250606175707.1403384-6-badal.nilawar@intel.com>
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

Load late binding firmware

v2:
 - s/EAGAIN/EBUSY/
 - Flush worker in suspend and driver unload (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 121 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
 3 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 0231f3dcfc18..7fe304c54374 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -16,6 +16,16 @@
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
+
+/*
+ * The component should load quite quickly in most cases, but it could take
+ * a bit. Using a very big timeout just to cover the worst case scenario
+ */
+#define LB_INIT_TIMEOUT_MS 20000
+
+#define LB_FW_LOAD_RETRY_MAXCOUNT 40
+#define LB_FW_LOAD_RETRY_PAUSE_MS 50
 
 static const char * const fw_type_to_name[] = {
 		[CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
@@ -39,6 +49,95 @@ static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
+static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+
+	lbfw = &late_bind->late_bind_fw;
+	if (lbfw->valid && late_bind->wq) {
+		drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
+			fw_type_to_name[lbfw->type]);
+			flush_work(&lbfw->work);
+	}
+}
+
+static void late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
+
+	if (!late_bind->component_added)
+		return;
+
+	if (!lbfw->valid)
+		return;
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component.ops)
+			break;
+		msleep(100);
+	}
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&late_bind->mutex);
+
+	if (!late_bind->component.ops) {
+		drm_err(&xe->drm, "Late bind component not bound\n");
+		goto out;
+	}
+
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_type_to_name[lbfw->type]);
+
+	do {
+		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
+							    lbfw->type, lbfw->flags,
+							    lbfw->payload, lbfw->payload_size);
+		if (!ret)
+			break;
+		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
+	} while (--retry && ret == -EBUSY);
+
+	if (ret)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
+			fw_type_to_name[lbfw->type], ret);
+	else
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_type_to_name[lbfw->type]);
+out:
+	mutex_unlock(&late_bind->mutex);
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+
+	if (!late_bind->component_added)
+		return -EINVAL;
+
+	lbfw = &late_bind->late_bind_fw;
+	if (lbfw->valid) {
+		drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
+			fw_type_to_name[lbfw->type]);
+			queue_work(late_bind->wq, &lbfw->work);
+	}
+
+	return 0;
+}
+
+/**
+ * late_bind_fw_init() - initialize late bind firmware
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
 static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -87,6 +186,7 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
 
 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, late_bind_work);
 	lb_fw->valid = true;
 
 	return 0;
@@ -99,7 +199,17 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
  */
 int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 {
-	return late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
+	int ret;
+
+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
+	if (!late_bind->wq)
+		return -ENOMEM;
+
+	ret = late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
+	if (ret)
+		return ret;
+
+	return xe_late_bind_fw_load(late_bind);
 }
 
 static int xe_late_bind_component_bind(struct device *xe_kdev,
@@ -122,6 +232,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
 	mutex_lock(&late_bind->mutex);
 	late_bind->component.ops = NULL;
 	mutex_unlock(&late_bind->mutex);
@@ -140,9 +252,16 @@ static void xe_late_bind_remove(void *arg)
 	if (!late_bind->component_added)
 		return;
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
 	component_del(xe->drm.dev, &xe_late_bind_component_ops);
 	late_bind->component_added = false;
+	if (late_bind->wq) {
+		destroy_workqueue(late_bind->wq);
+		late_bind->wq = NULL;
+	}
 	mutex_destroy(&late_bind->mutex);
+
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index a8b47523b203..166957e84c2f 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -12,5 +12,6 @@ struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index c427e141c685..690680e8ff22 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define MAX_PAYLOAD_SIZE (1024 * 4)
 
@@ -43,6 +44,8 @@ struct xe_late_bind_fw {
 	u8  payload[MAX_PAYLOAD_SIZE];
 	/** @late_bind_fw.payload_size: late binding blob payload_size */
 	size_t payload_size;
+	/** @late_bind_fw.work: worker to upload latebind blob */
+	struct work_struct work;
 };
 
 /**
@@ -71,6 +74,8 @@ struct xe_late_bind {
 	struct mutex mutex;
 	/** @late_bind.late_bind_fw: late binding firmware */
 	struct xe_late_bind_fw late_bind_fw;
+	/** @late_bind.wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
 };
 
 #endif
-- 
2.34.1

