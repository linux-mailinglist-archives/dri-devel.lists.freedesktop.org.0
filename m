Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A14A3C584
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1610E85C;
	Wed, 19 Feb 2025 16:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC4CL/Iu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F67810E347;
 Wed, 19 Feb 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739984154; x=1771520154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRoA2Otu8KXZFy/YShs2Evzm1qWRGAVUan1amEpzAB8=;
 b=BC4CL/IuD8noSrzL0LO2qO7p2AYXbCt2/30yPEgYTnmn/JCiXk44z6s5
 RxOvfVCVnXwWOTRkJRXBOS50k8ER1Io+1sQC8YHqyzpqqfpeTJd7Z9jr+
 Y8pEvdRnjqgcV9dZfov+4WpUJMTo4TMIvJcz6n21m/v1rmsOvHWoi/2Da
 rc786jLtvEmNc4n3pwjp2z2YF/r7Tr4X/eOvabYgKKRE+0Yjb+/cgflRB
 ZvMfZmQPNZmBIkj5yBQLi68SXhXLOXdo8TJstJsgnw/ABvyO90UXbUUbj
 Jx72gMLRsVljoqQyRhuo/nd6/rQNzBSi/2Y/qUJGqfhFquXvXM3y6ay4l Q==;
X-CSE-ConnectionGUID: MkphdDVdR6qsyDXZI1n2nQ==
X-CSE-MsgGUID: 4tOH4AfmSZmPN2XXifG0XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40991892"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40991892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:55:45 -0800
X-CSE-ConnectionGUID: XorV37fcR1iKalXflUo3gg==
X-CSE-MsgGUID: Dv62fMMUQC+Nd6vRhWrZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114966330"
Received: from dut4410lnl.fm.intel.com ([10.105.8.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:23:41 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@ursulin.net,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v3 6/6] drm/xe/xe_query: Add support for per-drm-client reset
 stat querying
Date: Wed, 19 Feb 2025 16:23:40 +0000
Message-ID: <20250219162340.116499-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219162340.116499-1-jonathan.cavitt@intel.com>
References: <20250219162340.116499-1-jonathan.cavitt@intel.com>
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

Add support for userspace to query per drm client reset stats via the
query ioctl.  This includes the number of engine resets the drm client
has observed, as well as a list of up to the last 50 relevant exec
queue bans and their associated causal pagefaults (if they exists).

v2: Report EOPNOTSUPP if CONFIG_PROC_FS is not set in the kernel
    config, as it is required to trace the reset count and exec
    queue bans.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 70 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 50 +++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 3aad4737bfec..671bc4270b93 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -16,10 +16,12 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_pagefault.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -740,6 +742,73 @@ static int query_pxp_status(struct xe_device *xe,
 	return 0;
 }
 
+static size_t calc_reset_stats_size(struct xe_drm_client *client)
+{
+	size_t size = sizeof(struct drm_xe_query_reset_stats);
+#ifdef CONFIG_PROC_FS
+	spin_lock(&client->blame_lock);
+	size += sizeof(struct drm_xe_exec_queue_ban) * client->blame_len;
+	spin_lock(&client->blame_lock);
+#endif
+	return size;
+}
+
+static int query_reset_stats(struct xe_device *xe,
+			     struct drm_xe_device_query *query,
+			     struct drm_file *file)
+{
+	void __user *query_ptr = u64_to_user_ptr(query->data);
+	struct drm_xe_query_reset_stats resp;
+	struct xe_file *xef = to_xe_file(file);
+	struct xe_drm_client *client = xef->client;
+	struct blame *b;
+	size_t size = calc_reset_stats_size(client);
+	int i = 0;
+
+#ifdef CONFIG_PROC_FS
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	if (copy_from_user(&resp, query_ptr, size))
+		return -EFAULT;
+
+	resp.reset_count = atomic_read(&client->reset_count);
+
+	spin_lock(&client->blame_lock);
+	resp.ban_count = client->blame_len;
+	list_for_each_entry(b, &client->blame_list, list) {
+		struct drm_xe_exec_queue_ban *ban = &resp.ban_list[i++];
+		struct pagefault *pf = b->pf;
+
+		ban->exec_queue_id = b->exec_queue_id;
+		ban->pf_found = pf ? 1 : 0;
+		if (!pf)
+			continue;
+
+		ban->access_type = pf->access_type;
+		ban->fault_type = pf->fault_type;
+		ban->vfid = pf->vfid;
+		ban->asid = pf->asid;
+		ban->pdata = pf->pdata;
+		ban->engine_class = xe_to_user_engine_class[pf->engine_class];
+		ban->engine_instance = pf->engine_instance;
+		ban->fault_addr = pf->page_addr;
+	}
+	spin_unlock(&client->blame_lock);
+
+	if (copy_to_user(query_ptr, &resp, size))
+		return -EFAULT;
+
+	return 0;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query,
 				      struct drm_file *file) = {
@@ -753,6 +822,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_uc_fw_version,
 	query_oa_units,
 	query_pxp_status,
+	query_reset_stats,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 892f54d3aa09..ffeb2a79e084 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -682,6 +682,7 @@ struct drm_xe_query_pxp_status {
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
  *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
+ *  - %DRM_XE_DEVICE_QUERY_RESET_STATS
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -735,6 +736,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
 #define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
+#define DRM_XE_DEVICE_QUERY_RESET_STATS		10
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1845,6 +1847,54 @@ enum drm_xe_pxp_session_type {
 	DRM_XE_PXP_TYPE_HWDRM = 1,
 };
 
+/**
+ * struct drm_xe_exec_queue_ban - Per drm client exec queue ban info returned
+ * from @DRM_XE_DEVICE_QUERY_RESET_STATS query.  Includes the exec queue ID and
+ * all associated pagefault information, if relevant.
+ */
+struct drm_xe_exec_queue_ban {
+	/** @exec_queue_id: ID of banned exec queue */
+	__u32 exec_queue_id;
+	/**
+	 * @pf_found: whether or not the ban is associated with a pagefault.
+	 * If not, all pagefault data will default to 0 and will not be relevant.
+	 */
+	__u8 pf_found;
+	/** @access_type: access type of associated pagefault */
+	__u8 access_type;
+	/** @fault_type: fault type of associated pagefault */
+	__u8 fault_type;
+	/** @vfid: VFID of associated pagefault */
+	__u8 vfid;
+	/** @asid: ASID of associated pagefault */
+	__u32 asid;
+	/** @pdata: PDATA of associated pagefault */
+	__u16 pdata;
+	/** @engine_class: engine class of associated pagefault */
+	__u8 engine_class;
+	/** @engine_instance: engine instance of associated pagefault */
+	__u8 engine_instance;
+	/** @fault_addr: faulted address of associated pagefault */
+	__u64 fault_addr;
+};
+
+/**
+ * struct drm_xe_query_reset_stats - Per drm client reset stats query.
+ */
+struct drm_xe_query_reset_stats {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @reset_count: Number of times the drm client has observed an engine reset */
+	__u64 reset_count;
+	/** @ban_count: number of exec queue bans saved by the drm client */
+	__u64 ban_count;
+	/**
+	 * @ban_list: flexible array of struct drm_xe_exec_queue_ban, reporting all
+	 * observed exec queue bans on the drm client.
+	 */
+	struct drm_xe_exec_queue_ban ban_list[];
+};
+
 /* ID of the protected content session managed by Xe when PXP is active */
 #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
 
-- 
2.43.0

