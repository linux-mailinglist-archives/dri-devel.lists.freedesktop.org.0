Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856BA04221
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C43910E700;
	Tue,  7 Jan 2025 14:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXqVM1wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC6410E700
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259756; x=1767795756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2Bkmo0oDud3Gq/Vd+Y1q9kccBCi2UZ6RyABcC7Y/Jk=;
 b=eXqVM1wgEgkB02wNHMECYOKUyW7WWJDhoItdDnAhdKVm5ygjz/ZSszh0
 Ylq8vhj4DizWLvlWjDHrPceyoXKK3zmmEotGekmDE2GQJwVP+xtO+5tNd
 iJA4LmKfjCs7yEU9GkuLyKkSnbeiIOhL5HEHgesAqcaVuRgJN8d/IMsY2
 dlU9nxEF6Ek/qS64sHnK95A1YedIlIX+eT5XpIXM9/9UnkYt7lvYqmBEI
 lLbOl5Yo9JkR+efgCGXrVtut+Dv9OnqtgIlzWKKeeuqIp5UzCmxVR2PeB
 OanoSi3hBBLOkOlITBRN1sjiCqygdkhh7RzR1Djg/excdQv3UibgggDWK Q==;
X-CSE-ConnectionGUID: 1q22kjKhTYO1ZdYdq95r2A==
X-CSE-MsgGUID: dJm+o3eoQJmeXjamVpi6aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324434"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:36 -0800
X-CSE-ConnectionGUID: l1+O0xvoTb+VYSX5yiNDNw==
X-CSE-MsgGUID: yjHS969oSWyI4CWQ7xaF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635421"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:35 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 04/14] accel/ivpu: Expose NPU memory utilization info in sysfs
Date: Tue,  7 Jan 2025 18:32:27 +0100
Message-ID: <20250107173238.381120-5-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

Expose NPU memory utilization info in sysfs in bytes
to show total memory used by NPU (FW + runtime).

Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_sysfs.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
index 8a616791c32f..97102feaf8dd 100644
--- a/drivers/accel/ivpu/ivpu_sysfs.c
+++ b/drivers/accel/ivpu/ivpu_sysfs.c
@@ -7,11 +7,14 @@
 #include <linux/err.h>
 
 #include "ivpu_drv.h"
+#include "ivpu_gem.h"
 #include "ivpu_fw.h"
 #include "ivpu_hw.h"
 #include "ivpu_sysfs.h"
 
-/*
+/**
+ * DOC: npu_busy_time_us
+ *
  * npu_busy_time_us is the time that the device spent executing jobs.
  * The time is counted when and only when there are jobs submitted to firmware.
  *
@@ -42,6 +45,30 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
 
 static DEVICE_ATTR_RO(npu_busy_time_us);
 
+/**
+ * DOC: npu_memory_utilization
+ *
+ * The npu_memory_utilization is used to report in bytes a current NPU memory utilization.
+ *
+ */
+static ssize_t
+npu_memory_utilization_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+	struct ivpu_bo *bo;
+	u64 total_npu_memory = 0;
+
+	mutex_lock(&vdev->bo_list_lock);
+	list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
+		total_npu_memory += bo->base.base.size;
+	mutex_unlock(&vdev->bo_list_lock);
+
+	return sysfs_emit(buf, "%lld\n", total_npu_memory);
+}
+
+static DEVICE_ATTR_RO(npu_memory_utilization);
+
 /**
  * DOC: sched_mode
  *
@@ -65,6 +92,7 @@ static DEVICE_ATTR_RO(sched_mode);
 
 static struct attribute *ivpu_dev_attrs[] = {
 	&dev_attr_npu_busy_time_us.attr,
+	&dev_attr_npu_memory_utilization.attr,
 	&dev_attr_sched_mode.attr,
 	NULL,
 };
-- 
2.43.0

