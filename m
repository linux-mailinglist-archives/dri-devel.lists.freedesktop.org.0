Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE4AD8D7D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2C10E21D;
	Fri, 13 Jun 2025 13:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D841410E9AE;
 Fri, 13 Jun 2025 13:45:47 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 David Kershner <david.kershner@intel.com>
Subject: [RFC PATCH 6/8] drm/xe/uapi: Add query ioctl for fabric connectivity
Date: Fri, 13 Jun 2025 15:45:25 +0200
Message-ID: <20250613134520.2458175-16-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613134520.2458175-10-dev@lankhorst.se>
References: <20250613134520.2458175-10-dev@lankhorst.se>
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

UMDs need to understand if two devices have connectivity, and what
that connectivity is.

Add to the query_ioctl the ability to determine if a fabric id and
current device have connectivity.

Signed-off-by: David Kershner <david.kershner@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_iaf.c   | 13 ++++++++
 drivers/gpu/drm/xe/xe_iaf.h   |  9 ++++++
 drivers/gpu/drm/xe/xe_query.c | 58 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 32 +++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_iaf.c b/drivers/gpu/drm/xe/xe_iaf.c
index d93b13d30fbcd..431d20fea5369 100644
--- a/drivers/gpu/drm/xe/xe_iaf.c
+++ b/drivers/gpu/drm/xe/xe_iaf.c
@@ -403,3 +403,16 @@ u64 xe_iaf_dpa_base(struct xe_device *xe)
 	return xe->iaf->dpa;
 }
 
+struct query_info *xe_iaf_connectivity_query(struct xe_iaf *iaf, u32 fabric_id)
+{
+	if (!iaf)
+		return ERR_PTR(-ENODEV);
+
+	if (iaf->fabric_id == fabric_id)
+		return NULL;
+
+	if (!iaf->ops)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	return iaf->ops->connectivity_query(iaf->handle, fabric_id);
+}
diff --git a/drivers/gpu/drm/xe/xe_iaf.h b/drivers/gpu/drm/xe/xe_iaf.h
index 78d7cca447983..df6b8f9f2bc5f 100644
--- a/drivers/gpu/drm/xe/xe_iaf.h
+++ b/drivers/gpu/drm/xe/xe_iaf.h
@@ -8,6 +8,9 @@
 
 #include <linux/types.h>
 
+struct query_info;
+struct xe_iaf;
+
 /*
  * Define the maximum number of devices instances based on the amount of
  * FID space.
@@ -34,6 +37,7 @@ struct xe_device;
 int xe_iaf_init(struct xe_device *xe);
 int xe_iaf_init_aux(struct xe_device *xe);
 u64 xe_iaf_dpa_base(struct xe_device *xe);
+struct query_info *xe_iaf_connectivity_query(struct xe_iaf *iaf, u32 fabric_id);
 
 #else
 
@@ -52,6 +56,11 @@ static inline u64 xe_iaf_dpa_base(struct xe_device *xe)
 	return 0ULL;
 }
 
+struct query_info *xe_iaf_connectivity_query(struct xe_iaf *iaf, u32 fabric_id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2dbf4066d86ff..b7f8300ab34c2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -12,6 +12,8 @@
 #include <generated/xe_wa_oob.h>
 #include <uapi/drm/xe_drm.h>
 
+#include <drm/intel/intel_iaf_platform.h>
+
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
@@ -22,6 +24,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
+#include "xe_iaf.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -776,6 +779,60 @@ static int query_eu_stall(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
 }
 
+static int
+query_fabric_connectivity(struct xe_device *xe,
+			  struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_fabric_info __user *query_ptr;
+	struct drm_xe_query_fabric_info info;
+	struct query_info *qi;
+	u32 latency = 0;
+	int cnt;
+	int i;
+
+	query_ptr = u64_to_user_ptr(query->data);
+	if (copy_from_user(&info, query_ptr, sizeof(info)))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, info.pad))
+		return -EINVAL;
+
+	info.bandwidth = 0;
+	info.latency = 0;
+
+	qi = xe_iaf_connectivity_query(xe->iaf, info.fabric_id);
+	if (IS_ERR(qi))
+		return PTR_ERR(qi);
+
+	if (!qi)
+		goto done;
+	/*
+	 * Examine the query information for connectivity.
+	 * Minimum bandwidth value is the bandwidth, 0 == no connectivity
+	 * Latency is averaged.
+	 */
+	cnt = qi->src_cnt * qi->dst_cnt;
+	if (!cnt) {
+		kfree(qi);
+		return -ENXIO;
+	}
+
+	info.bandwidth = 0xffffffff;
+	for (i = 0; i < cnt; i++) {
+		info.bandwidth = min(qi->sd2sd[i].bandwidth, info.bandwidth);
+		XE_WARN_ON(check_add_overflow(latency, qi->sd2sd[i].latency,
+					      &latency));
+	}
+
+	info.latency = latency / cnt;
+
+	kfree(qi);
+done:
+	if (copy_to_user(query_ptr, &info, sizeof(info)))
+		return -EFAULT;
+	return 0;
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
@@ -789,6 +846,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_oa_units,
 	query_pxp_status,
 	query_eu_stall,
+	query_fabric_connectivity,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6a702ba7817c3..9d30876cc8e91 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -668,6 +668,33 @@ struct drm_xe_query_pxp_status {
 	__u32 supported_session_types;
 };
 
+/**
+ * struct drm_xe_query_fabric_info
+ *
+ * With the given fabric id, query fabric info wrt the device.
+ * Higher bandwidth is better.  0 means no fabric.
+ * Latency is averaged latency (from all paths)
+ *
+ * fabric_id can be obtained from
+ *    /sys/class/drm/cardx/device/iaf.y/iaf_fabric_id
+ * Bandwidth is in Gigabits per second (max value of 8 * 4 * 90)
+ *    8 possible ports
+ *    4 lanes max per port
+ *   90 gigabits per lane
+ * Latency is in tenths of path length. 10 == 1 fabric link between src and dst
+ *   POR is max 1 link (zero hops).
+ */
+struct drm_xe_query_fabric_info {
+	/** @fabric_id: (in) Fabric id associated with info */
+	__u32 fabric_id;
+	/** @bandwidth: minimum bandwidth of all connected ports, if 0 no fabric */
+	__u32 bandwidth;
+	/** @latency: latency averaged across all connected ports. */
+	__u32 latency;
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -687,7 +714,11 @@ struct drm_xe_query_pxp_status {
  *    attributes.
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
+ *  - %DRM_XE_DEVICE_QUERY_OA_UNITS
  *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
+ *  - %DRM_XE_DEVICE_QUERY_EU_STALL
+ *  - %DRM_XE_DEVICE_QUERY_FABRIC_INFO
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -742,6 +773,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
 #define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
 #define DRM_XE_DEVICE_QUERY_EU_STALL		10
+#define DRM_XE_DEVICE_QUERY_FABRIC_INFO		11
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.45.2

