Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91CAA113B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1A510E509;
	Tue, 29 Apr 2025 16:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axCrLed1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4183C10E4FA;
 Tue, 29 Apr 2025 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942888; x=1777478888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4C6WCm1RZahbAL9C3ikuD0/FIV3G/3jSXkBh//tXFI=;
 b=axCrLed1Wk5uP75Lg+Zp9+qqgDTvi22QFvt4Rxd8zidSXwsdk5Uuqcl+
 tTjMCqVEztmiKD6BMCM+tz+UaNcRBnqg39xvDRCvphFAdsXYfuLksUG9B
 +7pXbBB5DKLHant6tLUFf7pR7JIf537Gw+5z46A6esieWdmx6lgk5Y8Ps
 QfyYiTsxciNAYbb8c/ixi4IZyhSOi0CFECFtCfT/xdB/DkVWjay6qt8Cq
 bApMgKN9tGSoggvPiYfZcKxu8uCEkOkwFsOztvIT+1mOqAD2HuEvd8JJu
 7FImg0f4QFoC4eZTW8GhNh5EmjhpYNLYOgXZnblzD3wNUIuv9pxta+eaX A==;
X-CSE-ConnectionGUID: BFaYC+phTnKv4QspNCsycw==
X-CSE-MsgGUID: RHiTh4lFT2iWv21zEZbYug==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585485"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585485"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:08:08 -0700
X-CSE-ConnectionGUID: gurFNbLPQNaDVKq0Ax+bVQ==
X-CSE-MsgGUID: Wk2OrN/zRQqAjoNYUjPKUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055938"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:08:05 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 5/9] drm/xe/xe_late_bind_fw: Load late binding firmware
Date: Tue, 29 Apr 2025 21:39:52 +0530
Message-Id: <20250429160956.1014376-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 91 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h |  1 +
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d83864e7189c..30a416323b37 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -894,6 +894,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_late_bind_fw_init(&xe->late_bind);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 297238fd3d16..7d2bc959027d 100644
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
 
 static const char * const fw_id_to_name[] = {
 		[FAN_CONTROL_ID] = "fan_control",
@@ -45,6 +55,78 @@ static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
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
+	if (!late_bind->component_added)
+		return;
+
+	if (!lbfw->valid)
+		return;
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component)
+			break;
+		msleep(100);
+	}
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&late_bind->mutex);
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
+
+	do {
+		ret = late_bind->component->ops->push_config(late_bind->component->mei_dev,
+							     lbfw->type, lbfw->flags,
+							     lbfw->payload, lbfw->payload_size);
+		if (!ret)
+			break;
+		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
+	} while (--retry && ret == -EAGAIN);
+
+	if (ret)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
+			fw_id_to_name[lbfw->id], ret);
+	else
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_id_to_name[lbfw->id]);
+
+	mutex_unlock(&late_bind->mutex);
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int id;
+
+	if (!late_bind->component_added)
+		return -EINVAL;
+
+	for (id = 0; id < MAX_ID; id++) {
+		lbfw = &late_bind->late_bind_fw[id];
+		if (lbfw->valid) {
+			drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
+				fw_id_to_name[lbfw->id]);
+			queue_work(late_bind->wq, &lbfw->work);
+		}
+	}
+	return 0;
+}
+
+/**
+ * late_bind_fw_init() - initialize late bind firmware
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
 static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -93,6 +175,7 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
 
 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, late_bind_work);
 	lb_fw->valid = true;
 
 	return 0;
@@ -108,12 +191,17 @@ int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 	int id;
 	int ret;
 
+	late_bind->wq = create_singlethread_workqueue("late-bind-ordered-wq");
+	if (!late_bind->wq)
+		return -ENOMEM;
+
 	for (id = 0; id < MAX_ID; id++) {
 		ret = late_bind_fw_init(late_bind, id);
 		if (ret)
 			return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 static int xe_late_bind_component_bind(struct device *xe_kdev,
@@ -179,7 +267,6 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	}
 
 	late_bind->component_added = true;
-	/* the component must be removed before unload, so can't use drmm for cleanup */
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index e88c637b15a6..edd0e4c0650e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -13,5 +13,6 @@ struct xe_late_bind;
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 void xe_late_bind_remove(struct xe_late_bind *late_bind);
 int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
 
 #endif
-- 
2.34.1

