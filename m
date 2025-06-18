Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21464ADF67C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0B10E91E;
	Wed, 18 Jun 2025 18:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzPpTSUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A4210E29D;
 Wed, 18 Jun 2025 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750273006; x=1781809006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kg6luWoLneNa75AfccUJ/Kpk5nWyStT1Hfi8JfIGLuc=;
 b=CzPpTSUM/+d3AgIqLxZlI79L+eHYz+h66xcmR+0rBWZnncLk2fU9pZX2
 BWKdVu0LSvuCjPOnOADf5nzTaqEFcjBs+nNhX2/Mew+bDH82R0dNZUyKb
 xkigLYGJ17F2r9uDxBQblbjN6dQ+qmEwRHYD2+JrpAYhkZQUc+TB/Gj5q
 jBTJB7/VJ2l7BC3UVBUFwzQT0Nqf+5itcGJnE1Fd8/Noe6WjznE7ZG3zT
 Tn7LmhHLF3wQiMNnA+VcYsgi1tPvjBgyfm+H2XNr/iDZ0eGaxEBouJ0UB
 VOkOVW3anZrcKgrCTX9jT1bfHcOQPI4gLzV/DalBWdComvqf3rDh9usZY g==;
X-CSE-ConnectionGUID: Q9KlleI/Qzm1o5WI0cDtsQ==
X-CSE-MsgGUID: plAyEFkOS4qL30tJEEte+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210203"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52210203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:56:46 -0700
X-CSE-ConnectionGUID: had5b1EOS7CvJRa/c8xbYA==
X-CSE-MsgGUID: P161PHf/S/6b4PGi/EWtQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153951774"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:43 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v3 05/10] drm/xe/xe_late_bind_fw: Load late binding firmware
Date: Thu, 19 Jun 2025 00:30:02 +0530
Message-Id: <20250618190007.2932322-6-badal.nilawar@intel.com>
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

Load late binding firmware

v2:
 - s/EAGAIN/EBUSY/
 - Flush worker in suspend and driver unload (Daniele)
v3:
 - Use retry interval of 6s, in steps of 200ms, to allow
   other OS components release MEI CL handle (Sasha)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 113 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index d416d6cc1fa2..54aa08c6bdfd 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -16,6 +16,20 @@
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
+/*
+ * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
+ * other OS components to release the MEI CL handle
+ */
+#define LB_FW_LOAD_RETRY_MAXCOUNT 30
+#define LB_FW_LOAD_RETRY_PAUSE_MS 200
 
 static const u32 fw_id_to_type[] = {
 		[FAN_CONTROL_FW_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
@@ -44,6 +58,85 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
+static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->valid && late_bind->wq) {
+			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
+				fw_id_to_name[lbfw->id]);
+				flush_work(&lbfw->work);
+		}
+	}
+}
+
+static void late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw[lbfw->id]);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
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
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
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
+			fw_id_to_name[lbfw->id], ret);
+	else
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_id_to_name[lbfw->id]);
+out:
+	mutex_unlock(&late_bind->mutex);
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	if (!late_bind->component_added)
+		return -EINVAL;
+
+	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->valid)
+			queue_work(late_bind->wq, &lbfw->work);
+	}
+	return 0;
+}
+
 static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -93,6 +186,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 
 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, late_bind_work);
 	lb_fw->valid = true;
 
 	return 0;
@@ -103,11 +197,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 	int ret;
 	int fw_id;
 
+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
+	if (!late_bind->wq)
+		return -ENOMEM;
+
 	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
 		ret = __xe_late_bind_fw_init(late_bind, fw_id);
 		if (ret)
 			return ret;
 	}
+
 	return ret;
 }
 
@@ -131,6 +230,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
 	mutex_lock(&late_bind->mutex);
 	late_bind->component.ops = NULL;
 	mutex_unlock(&late_bind->mutex);
@@ -146,8 +247,14 @@ static void xe_late_bind_remove(void *arg)
 	struct xe_late_bind *late_bind = arg;
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
 	component_del(xe->drm.dev, &xe_late_bind_component_ops);
 	late_bind->component_added = false;
+	if (late_bind->wq) {
+		destroy_workqueue(late_bind->wq);
+		late_bind->wq = NULL;
+	}
 	mutex_destroy(&late_bind->mutex);
 }
 
@@ -184,5 +291,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	if (err)
 		return err;
 
-	return xe_late_bind_fw_init(late_bind);
+	err = xe_late_bind_fw_init(late_bind);
+	if (err)
+		return err;
+
+	return xe_late_bind_fw_load(late_bind);
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 4c73571c3e62..28d56ed2bfdc 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -11,5 +11,6 @@
 struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index c6fd33fd5484..d256f53d59e6 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define MAX_PAYLOAD_SIZE (1024 * 4)
 
@@ -38,6 +39,8 @@ struct xe_late_bind_fw {
 	u8  payload[MAX_PAYLOAD_SIZE];
 	/** @late_bind_fw.payload_size: late binding blob payload_size */
 	size_t payload_size;
+	/** @late_bind_fw.work: worker to upload latebind blob */
+	struct work_struct work;
 };
 
 /**
@@ -66,6 +69,8 @@ struct xe_late_bind {
 	struct mutex mutex;
 	/** @late_bind.late_bind_fw: late binding firmware array */
 	struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
+	/** @late_bind.wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
 };
 
 #endif
-- 
2.34.1

