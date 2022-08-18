Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726E95990E0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F197E10EF86;
	Thu, 18 Aug 2022 23:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6D10E07A;
 Thu, 18 Aug 2022 23:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863807; x=1692399807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/NB+UoNEoX8bVqRbsn5l2zvCiRR1JPTN1FEZNzuR33E=;
 b=V71HtvVnQAXbmWVcrMk6WXlncihTR3/pktJWcJT0CHnZ6Njiz+rsS41p
 tTZ8+4Y9VvWblCH5o0Cy8Xu9ntz5TPZ1ifvfiovnr0L7W3Ly1WPglAzh+
 9WA66y4tatH40JNDdWJYS3szH7UBCwCdg7MKEufFuz+B22qmnszUywo97
 kGmbkjYUu83cxKDmy0lqvbx15Smca9lkm1BViTWRrRARJUMbTZQg28E6t
 u8sqB1RInlpVHKcEQtObqaqOb4YoLrhdz3z5+RZG9C2srKXHXFmELZeEu
 OkO+pgUjw+ymYDe/6VWRGon+ohBmDymCAevahYfB6OV8xYJErn8aNQs42 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677584"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677584"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042892"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:27 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/15] drm/i915/huc: define gsc-compatible HuC fw for DG2
Date: Thu, 18 Aug 2022 16:02:42 -0700
Message-Id: <20220818230243.3921066-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fw name is different and we need to record the fact that the blob is
gsc-loaded, so add a new macro to help.

Note: A-step DG2 G10 does not support HuC loading via GSC and would
require a separate firmware to be loaded the legacy way, but that's
not a production stepping so we're not going to bother.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 64 ++++++++++++++----------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index cec6bf6bad3f..776b43d79772 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -74,35 +74,39 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3))
 
-#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
-	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
-	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
-	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
-	fw_def(ROCKETLAKE,   0, huc_def(tgl,  7, 9, 3)) \
-	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3)) \
-	fw_def(JASPERLAKE,   0, huc_def(ehl,  9, 0, 0)) \
-	fw_def(ELKHARTLAKE,  0, huc_def(ehl,  9, 0, 0)) \
-	fw_def(ICELAKE,      0, huc_def(icl,  9, 0, 0)) \
-	fw_def(COMETLAKE,    5, huc_def(cml,  4, 0, 0)) \
-	fw_def(COMETLAKE,    0, huc_def(kbl,  4, 0, 0)) \
-	fw_def(COFFEELAKE,   0, huc_def(kbl,  4, 0, 0)) \
-	fw_def(GEMINILAKE,   0, huc_def(glk,  4, 0, 0)) \
-	fw_def(KABYLAKE,     0, huc_def(kbl,  4, 0, 0)) \
-	fw_def(BROXTON,      0, huc_def(bxt,  2, 0, 0)) \
-	fw_def(SKYLAKE,      0, huc_def(skl,  2, 0, 0))
-
-#define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
+#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_dma_def, huc_gsc_def) \
+	fw_def(DG2,          0, huc_gsc_def(dg2,  7, 10, 0)) \
+	fw_def(ALDERLAKE_P,  0, huc_dma_def(tgl,  7, 9, 3)) \
+	fw_def(ALDERLAKE_S,  0, huc_dma_def(tgl,  7, 9, 3)) \
+	fw_def(DG1,          0, huc_dma_def(dg1,  7, 9, 3)) \
+	fw_def(ROCKETLAKE,   0, huc_dma_def(tgl,  7, 9, 3)) \
+	fw_def(TIGERLAKE,    0, huc_dma_def(tgl,  7, 9, 3)) \
+	fw_def(JASPERLAKE,   0, huc_dma_def(ehl,  9, 0, 0)) \
+	fw_def(ELKHARTLAKE,  0, huc_dma_def(ehl,  9, 0, 0)) \
+	fw_def(ICELAKE,      0, huc_dma_def(icl,  9, 0, 0)) \
+	fw_def(COMETLAKE,    5, huc_dma_def(cml,  4, 0, 0)) \
+	fw_def(COMETLAKE,    0, huc_dma_def(kbl,  4, 0, 0)) \
+	fw_def(COFFEELAKE,   0, huc_dma_def(kbl,  4, 0, 0)) \
+	fw_def(GEMINILAKE,   0, huc_dma_def(glk,  4, 0, 0)) \
+	fw_def(KABYLAKE,     0, huc_dma_def(kbl,  4, 0, 0)) \
+	fw_def(BROXTON,      0, huc_dma_def(bxt,  2, 0, 0)) \
+	fw_def(SKYLAKE,      0, huc_dma_def(skl,  2, 0, 0))
+
+#define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_, postfix_) \
 	"i915/" \
 	__stringify(prefix_) name_ \
 	__stringify(major_) "." \
 	__stringify(minor_) "." \
-	__stringify(patch_) ".bin"
+	__stringify(patch_) postfix_ ".bin"
 
 #define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
-	__MAKE_UC_FW_PATH(prefix_, "_guc_", major_, minor_, patch_)
+	__MAKE_UC_FW_PATH(prefix_, "_guc_", major_, minor_, patch_, "")
 
 #define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
-	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
+	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_, "")
+
+#define MAKE_HUC_GSC_FW_PATH(prefix_, major_, minor_, bld_num_) \
+	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_, "_gsc")
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define INTEL_UC_MODULE_FW(platform_, revid_, uc_) \
@@ -110,26 +114,31 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 
 INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
 INTEL_GUC_FIRMWARE_DEFS_FALLBACK(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
-INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
+INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH, MAKE_HUC_GSC_FW_PATH)
 
 /* The below structs and macros are used to iterate across the list of blobs */
 struct __packed uc_fw_blob {
 	u8 major;
 	u8 minor;
+	bool loaded_via_gsc;
 	const char *path;
 };
 
-#define UC_FW_BLOB(major_, minor_, path_) \
-	{ .major = major_, .minor = minor_, .path = path_ }
+#define UC_FW_BLOB(major_, minor_, gsc_, path_) \
+	{ .major = major_, .minor = minor_, .loaded_via_gsc = gsc_, .path = path_ }
 
 #define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
-	UC_FW_BLOB(major_, minor_, \
+	UC_FW_BLOB(major_, minor_, false, \
 		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
 
 #define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
-	UC_FW_BLOB(major_, minor_, \
+	UC_FW_BLOB(major_, minor_, false, \
 		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
 
+#define HUC_GSC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
+	UC_FW_BLOB(major_, minor_, true, \
+		   MAKE_HUC_GSC_FW_PATH(prefix_, major_, minor_, bld_num_))
+
 struct __packed uc_fw_platform_requirement {
 	enum intel_platform p;
 	u8 rev; /* first platform rev using this FW */
@@ -158,7 +167,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		INTEL_GUC_FIRMWARE_DEFS_FALLBACK(MAKE_FW_LIST, GUC_FW_BLOB)
 	};
 	static const struct uc_fw_platform_requirement blobs_huc[] = {
-		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
+		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_GSC_FW_BLOB)
 	};
 	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
 		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
@@ -190,6 +199,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 			uc_fw->wanted_path = blob->path;
 			uc_fw->major_ver_wanted = blob->major;
 			uc_fw->minor_ver_wanted = blob->minor;
+			uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
 			break;
 		}
 	}
-- 
2.37.2

