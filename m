Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55627B76E9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 05:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F15F10E320;
	Wed,  4 Oct 2023 03:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0A510E320;
 Wed,  4 Oct 2023 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696390822; x=1727926822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/hSDWFRYWYd09ryU4fxVLH3BV1ZYDDqRpoLBrYp55Uw=;
 b=TuXqO8lZaiMs5CEWi+AzXruRwglxVsAH+Luylq+yrxf/dF2JK07dW1r3
 sXJ46Uo3K9KvScZpdk6EXXak9qj9Om7BplKakhiFqMuNsh/BmudKOo5QC
 7UzGsObYL6uWgSgtWxMtP+jy2KS2BZZ2AUko+fK7tTAujylIjdcQoCCzk
 fiIhnIEZxq4SVuMIa1ovTgDh2NzMKISPuHtJvwsLIJ289sL2O4vsu1/Lm
 yVvrdfCRgVtt0sHZg8sbtaDBM2Z0FKX1aGFIg5Pp+1V6YA+fL2+Oy33YU
 3TI8PRA1POvMx00og4qIcoaLzL+aZrl9e3etVPEPv5ef/7vo4RcJ+Isx9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449538870"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="449538870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="841620847"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="841620847"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:40:20 -0700
From: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [Patch v2] Add uAPI to query microcontroller fw version
Date: Tue,  3 Oct 2023 20:40:12 -0700
Message-Id: <20231004034012.66334-1-vivaik.balasubrawmanian@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: vivaik.balasubrawmanian@intel.com, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 jose.souza@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a bug in GuC firmware, Mesa can't enable by default the usage of 
async compute engines feature in DG2 and newer. A new GuC firmware fixed the issue but 
until now there was no way for Mesa to know if KMD was running with the fixed GuC version or not,
so this uAPI is required.

More context on the issue:
Vulkan allows applications to create types of queues: graphics, compute and copy.
Today Intel Vulkan driver uses Render engine to implement all those 3 queues types.

There is a set of operations that a queue type is required to implement, 
DG2 compute engine have almost all the operations required by compute queue but still lacks some.
So the solution is to send those operations not supported by compute engine to render engine 
and do some synchronization around it. But doing so causes the GuC scheduler to get stuck 
around the synchronization, until KMD resets the engine and ban the application context.
This issue was root caused to a GuC firmware issue and was fixed in newer version.

So Mesa can't enable the "async compute" without knowing for sure that KMD is running 
with a GuC version that has the scheduler fix. Same will happen when Mesa start to use 
copy engine.

This uAPI  may be expanded in future to query other firmware versions too.

More information:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233

v2:
- incorporated feedback from Tvrtko Ursulin:
  - updated patch description to clarify the use case that identified
    this issue.
  - updated query_uc_fw_version() to use copy_query_item() helper.
  - updated the implemented GuC version query to return Submission
    version.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>

Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 42 +++++++++++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       | 32 +++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 00871ef99792..3e3563ab62b7 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -551,6 +551,47 @@ static int query_hwconfig_blob(struct drm_i915_private *i915,
 	return hwconfig->size;
 }
 
+static int
+query_uc_fw_version(struct drm_i915_private *i915, struct drm_i915_query_item *query)
+{
+	struct drm_i915_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data_ptr);
+	size_t size = sizeof(struct drm_i915_query_uc_fw_version);
+	struct drm_i915_query_uc_fw_version resp;
+	int ret;
+
+	ret = copy_query_item(&resp, size, size, query);
+	if (ret == size) {
+		query->length = size;
+		return 0;
+	} else if (ret != 0)
+		return ret;
+
+	if (resp.pad || resp.pad2 || resp.reserved) {
+		drm_dbg(&i915->drm,
+			"Invalid input fw version query structure parameters received");
+		return -EINVAL;
+	}
+
+	switch (resp.uc_type) {
+	case I915_QUERY_UC_TYPE_GUC_SUBMISSION: {
+		struct intel_guc *guc = &i915->gt0.uc.guc;
+
+		resp.major_ver = guc->submission_version.major;
+		resp.minor_ver = guc->submission_version.minor;
+		resp.patch_ver = guc->submission_version.patch;
+		resp.branch_ver = 0;
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(query_ptr, &resp, size))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 					struct drm_i915_query_item *query_item) = {
 	query_topology_info,
@@ -559,6 +600,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 	query_memregion_info,
 	query_hwconfig_blob,
 	query_geometry_subslices,
+	query_uc_fw_version,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 7000e5910a1d..6f9d52263c77 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
 	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_UC_FW_VERSION (see struct drm_i915_query_uc_fw_version)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
+#define DRM_I915_QUERY_UC_FW_VERSION        7
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -3213,6 +3215,36 @@ struct drm_i915_query_topology_info {
 	__u8 data[];
 };
 
+/**
+* struct drm_i915_query_uc_fw_version - query a micro-controller firmware version
+*
+* Given a uc_type this will return the major, minor, patch and branch version
+* of the micro-controller firmware.
+*/
+struct drm_i915_query_uc_fw_version {
+	/** @uc: The micro-controller type to query firmware version */
+#define I915_QUERY_UC_TYPE_GUC_SUBMISSION 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/* @major_ver: major uc fw version */
+	__u32 major_ver;
+	/* @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/* @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+	/* @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * DOC: Engine Discovery uAPI
  *

base-commit: e2d29b46ca6d480bc3bc328a7775c3028bc1e5c8
-- 
2.34.1

