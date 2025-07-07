Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7CCAFBB82
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC8E10E54F;
	Mon,  7 Jul 2025 19:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmKjs9Me";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A892210E54C;
 Mon,  7 Jul 2025 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751915311; x=1783451311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvg1ZkUCHAyT1ZJign96r0uHR2f9F7hjaot1gafCOk0=;
 b=TmKjs9MeZlb/hXQw1xn1B3DUDtQf7D7kKsKirsAhxBw+xWQ/N1GrNhGz
 Cxe21MRyexopiebSpsjqNEYjdkgfl1UNVbieIOIKGAXSoz6U/iSXZM3Jw
 FydDpRLbeJ9l6YicEWlJWzt3TnHG0JJMbr1RejZGdSp61uwdy4gVPIBdC
 qxEapmrl2qSv2vQmqpLuHmcHPG+W+nX0zSAAWxXj8pv20Io+agKIRykJv
 q38WRu9GWEkioGUXpUU/MAbBnj9Q8ENx760inO7sZvhgquWmxS/prXYpO
 OefEb7eu7zOx/1/UMPTl7GU8nfJAZWiFaEDKvpn80IJzcNoCNR1OVQ9Aa g==;
X-CSE-ConnectionGUID: YBYbD0OLSji4nztuSP5SDQ==
X-CSE-MsgGUID: OZ6gtgZbSru8/kwXrGDFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57945678"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="57945678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 12:08:31 -0700
X-CSE-ConnectionGUID: S/b95TdXSUOt/VHwTYftpA==
X-CSE-MsgGUID: X60Br4QRQISEpzXLn9P8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154707510"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 12:08:27 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v7 5/9] drm/xe/xe_late_bind_fw: Load late binding firmware
Date: Tue,  8 Jul 2025 00:42:33 +0530
Message-Id: <20250707191237.1782824-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707191237.1782824-1-badal.nilawar@intel.com>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
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
v4:
 - return -ENODEV if component not added (Daniele)
 - parse and print status returned by csc
v5:
 - Use payload to check firmware valid (Daniele)
 - Obtain the RPM reference before scheduling the worker to
   ensure the device remains awake until the worker completes
   firmware loading (Rodrigo)
v6:
 - In case of error donot re-attempt fw download (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 155 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
 3 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 54b815145a69..9804508ee90d 100644
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
 		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
@@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+static const char *xe_late_bind_parse_status(uint32_t status)
+{
+	switch (status) {
+	case CSC_LATE_BINDING_STATUS_SUCCESS:
+		return "success";
+	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
+		return "4Id Mismatch";
+	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
+		return "ARB Failure";
+	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
+		return "General Error";
+	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
+		return "Invalid Params";
+	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
+		return "Invalid Signature";
+	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
+		return "Invalid Payload";
+	case CSC_LATE_BINDING_STATUS_TIMEOUT:
+		return "Timeout";
+	default:
+		return "Unknown error";
+	}
+}
+
 static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -44,6 +82,99 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
+static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload && late_bind->wq) {
+			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
+				fw_id_to_name[lbfw->id]);
+			flush_work(&lbfw->work);
+		}
+	}
+}
+
+static void xe_late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw[lbfw->id]);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
+
+	xe_device_assert_mem_access(xe);
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component.ops)
+			break;
+		msleep(100);
+	}
+
+	if (!late_bind->component.ops) {
+		drm_err(&xe->drm, "Late bind component not bound\n");
+		/* Do not re-attempt fw load */
+		drmm_kfree(&xe->drm, (void *)lbfw->payload);
+		lbfw->payload = NULL;
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
+	if (!ret) {
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_id_to_name[lbfw->id]);
+		goto out;
+	}
+
+	if (ret > 0)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
+			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
+	else
+		drm_err(&xe->drm, "Load %s firmware failed with err %d",
+			fw_id_to_name[lbfw->id], ret);
+	/* Do not re-attempt fw load */
+	drmm_kfree(&xe->drm, (void *)lbfw->payload);
+	lbfw->payload = NULL;
+
+out:
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	if (!late_bind->component_added)
+		return -ENODEV;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload) {
+			xe_pm_runtime_get_noresume(xe);
+			queue_work(late_bind->wq, &lbfw->work);
+		}
+	}
+	return 0;
+}
+
 static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -97,6 +228,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
 	return 0;
 }
@@ -106,11 +238,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 	int ret;
 	int fw_id;
 
+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
+	if (!late_bind->wq)
+		return -ENOMEM;
+
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		ret = __xe_late_bind_fw_init(late_bind, fw_id);
 		if (ret)
 			return ret;
 	}
+
 	return 0;
 }
 
@@ -132,6 +269,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
 	late_bind->component.ops = NULL;
 }
 
@@ -145,7 +284,15 @@ static void xe_late_bind_remove(void *arg)
 	struct xe_late_bind *late_bind = arg;
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
+	late_bind->component_added = false;
+
 	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+	if (late_bind->wq) {
+		destroy_workqueue(late_bind->wq);
+		late_bind->wq = NULL;
+	}
 }
 
 /**
@@ -174,9 +321,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 		return err;
 	}
 
+	late_bind->component_added = true;
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
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
index c4a8042f2600..3cc5fc0593b3 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
 
@@ -36,6 +37,8 @@ struct xe_late_bind_fw {
 	const u8  *payload;
 	/** @payload_size: late binding blob payload_size */
 	size_t payload_size;
+	/** @work: worker to upload latebind blob */
+	struct work_struct work;
 };
 
 /**
@@ -58,6 +61,10 @@ struct xe_late_bind {
 	struct xe_late_bind_component component;
 	/** @late_bind_fw: late binding firmware array */
 	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
+	/** @wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
+	/** @component_added: whether the component has been added */
+	bool component_added;
 };
 
 #endif
-- 
2.34.1

