Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6186F8669
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0810E648;
	Fri,  5 May 2023 16:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7BF10E637;
 Fri,  5 May 2023 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683302912; x=1714838912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MrXjQL+JlnFSHd8I8fUatNDKhrRm/KY91Oe5q7b90MQ=;
 b=Apg43jtzq2NK5M4GsA8ZBu1bD5ug9wrMqnKHMw87Gt6qICj1qyNZIGGp
 G6YFopvUPRW4hr+JdKBTIg3ZNQzvwmvptkyotFQXzGySR32hKOnazice7
 SkhGW+wZXDVM/pp3mFo18XTQkWT+jYC7HrH5HSdVPySIsTt4L7JqZLWi/
 GgUA35QLywdcEu1LYkAyZhSt5D0buQfopPUyKl+vAjj9v64sN72G7VYaO
 Sg3Y7fSLQQiJA7zBrDYxL4fIE54IfesQ716VdSnttrxIkkc4DPUOUpzfL
 NzMK6xuRS7K02aNpM025VKbX9AqU4ntfps6Egm0NitETtiONbK6UhJWUo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349276982"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349276982"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871911297"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871911297"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:33 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/uc/gsc: define gsc fw
Date: Fri,  5 May 2023 09:04:14 -0700
Message-Id: <20230505160415.889525-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add FW definition and the matching override modparam.

The GSC FW has both a release version, based on platform and a rolling
counter, and a compatibility version, which is the one tracking
interface changes. Since what we care about is the interface, we use
the compatibility version in the buinary names.

Same as with the GuC, a major version bump indicate a
backward-incompatible change, while a minor version bump indicates a
backward-compatible one, so we use only the former in the file name.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 ++++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 36ee96c02d74..531cd172151d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -124,6 +124,18 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(BROXTON,      0, huc_mmp(bxt,  2, 0, 0)) \
 	fw_def(SKYLAKE,      0, huc_mmp(skl,  2, 0, 0))
 
+/*
+ * The GSC FW has both a release version, based on platform and a rolling
+ * counter, and a compatibility version, which is the one tracking
+ * interface changes. Since what we care about is the interface, we use
+ * the compatibility version in the buinary names.
+ * Same as with the GuC, a major version bump indicate a
+ * backward-incompatible change, while a minor version bump indicates a
+ * backward-compatible one, so we use only the former in the file name.
+ */
+#define INTEL_GSC_FIRMWARE_DEFS(fw_def, gsc_def) \
+	fw_def(METEORLAKE,   0, gsc_def(mtl, 1, 0))
+
 /*
  * Set of macros for producing a list of filenames from the above table.
  */
@@ -159,6 +171,9 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 #define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
 	__MAKE_UC_FW_PATH_MMP(prefix_, "huc", major_, minor_, patch_)
 
+#define MAKE_GSC_FW_PATH(prefix_, major_, minor_) \
+	__MAKE_UC_FW_PATH_MAJOR(prefix_, "gsc", major_)
+
 /*
  * All blobs need to be declared via MODULE_FIRMWARE().
  * This first expansion of the table macros is solely to provide
@@ -169,6 +184,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 
 INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH_MAJOR, MAKE_GUC_FW_PATH_MMP)
 INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, MAKE_HUC_FW_PATH_MMP, MAKE_HUC_FW_PATH_GSC)
+INTEL_GSC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GSC_FW_PATH)
 
 /*
  * The next expansion of the table macros (in __uc_fw_auto_select below) provides
@@ -218,6 +234,10 @@ struct __packed uc_fw_blob {
 #define HUC_FW_BLOB_GSC(prefix_) \
 	UC_FW_BLOB_NEW(0, 0, 0, true, MAKE_HUC_FW_PATH_GSC(prefix_))
 
+#define GSC_FW_BLOB(prefix_, major_, minor_) \
+	UC_FW_BLOB_NEW(major_, minor_, 0, true, \
+		       MAKE_GSC_FW_PATH(prefix_, major_, minor_))
+
 struct __packed uc_fw_platform_requirement {
 	enum intel_platform p;
 	u8 rev; /* first platform rev using this FW */
@@ -245,9 +265,13 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 	static const struct uc_fw_platform_requirement blobs_huc[] = {
 		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
 	};
+	static const struct uc_fw_platform_requirement blobs_gsc[] = {
+		INTEL_GSC_FIRMWARE_DEFS(MAKE_FW_LIST, GSC_FW_BLOB)
+	};
 	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
 		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
 		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
+		[INTEL_UC_FW_TYPE_GSC] = { blobs_gsc, ARRAY_SIZE(blobs_gsc) },
 	};
 	static bool verified[INTEL_UC_FW_NUM_TYPES];
 	const struct uc_fw_platform_requirement *fw_blobs;
@@ -257,14 +281,6 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 	int i;
 	bool found;
 
-	/*
-	 * GSC FW support is still not fully in place, so we're not defining
-	 * the FW blob yet because we don't want the driver to attempt to load
-	 * it until we're ready for it.
-	 */
-	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
-		return;
-
 	/*
 	 * The only difference between the ADL GuC FWs is the HWConfig support.
 	 * ADL-N does not support HWConfig, so we should use the same binary as
-- 
2.40.0

