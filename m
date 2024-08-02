Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5E0945686
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 05:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128A910E06C;
	Fri,  2 Aug 2024 03:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgTyTS6O";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1F610E06C;
 Fri,  2 Aug 2024 03:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722568253; x=1754104253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vhM0cZ2l7EcafYxBEVspUn7G9E+419aE5Dz5i33WE8w=;
 b=SgTyTS6Oyz1GW9V4rInrky2kVoDqVcwYvKQA7Oj/2FxEwABov/66rISe
 CuSel6v1IZO22ZstH7XennHwUVZdQ+j/pTGWqKRSsUIJs4luneFyHA4HU
 uOK0N49WYE7TU4sFpx2FP5mAELnfGTPN6qsRzS9OF9v6hex/IU+hGXmuB
 LVdhrTeV7GVhST6F/RniB/DvOAnDHLvT/GztEnhGRoZES0r38M5DjWtNb
 wBT18YBVdFGCO1tPxzpqs6sgZtuWPCQaTQhR70uYTwZRu0CM/VGnpx/Gr
 QekWARIojwVJSeLkjOkD2Us0jPzRNuqPPKMGwUaMlK1XpjtDqExpCxJ/f Q==;
X-CSE-ConnectionGUID: N/hKpl+MSwe7p1WciJSaqA==
X-CSE-MsgGUID: fKVEA3TxTJaNfFPUVc4ENg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38030307"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="38030307"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 20:10:52 -0700
X-CSE-ConnectionGUID: cKuA64WaQx2tsTvjK+r33w==
X-CSE-MsgGUID: zfKtEuySSg6iGDK3O1gPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="56033703"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 01 Aug 2024 20:10:52 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915: ARL requires a newer GSC firmware
Date: Thu,  1 Aug 2024 20:10:51 -0700
Message-ID: <20240802031051.3816392-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

ARL and MTL share a single GSC firmware blob. However, ARL requires a
newer version of it.

So add differentiate of the PCI ids for ARL from MTL and create ARL as
a sub-platform of MTL. That way, all the existing workarounds and such
still treat ARL as MTL exactly as before. However, now the GSC code
can check for ARL and do an extra version check on the firmware before
committing to it.

Also, the version extraction code has various ways of failing but the
return code was being ignore and so the firmware load would attempt to
continue anyway. Fix that by propagating the return code to the next
level out.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 31 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 10 ++++++--
 drivers/gpu/drm/i915/i915_drv.h           |  2 ++
 drivers/gpu/drm/i915/intel_device_info.c  |  7 +++++
 drivers/gpu/drm/i915/intel_device_info.h  |  3 +++
 include/drm/intel/i915_pciids.h           | 11 +++++---
 6 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 3b69bc6616bd3..551b0d7974ff1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -212,6 +212,37 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 		}
 	}
 
+	if (IS_ARROWLAKE(gt->i915)) {
+		bool too_old = false;
+
+		/*
+		 * ARL requires a newer firmware than MTL did (102.0.10.1878) but the
+		 * firmware is actually common. So, need to do an explicit version check
+		 * here rather than using a separate table entry. And if the older
+		 * MTL-only version is found, then just don't use GSC rather than aborting
+		 * the driver load.
+		 */
+		if (gsc->release.major < 102) {
+			too_old = true;
+		} else if (gsc->release.major == 102) {
+			if (gsc->release.minor == 0) {
+				if (gsc->release.patch < 10) {
+					too_old = true;
+				} else if (gsc->release.patch == 10) {
+					if (gsc->release.build < 1878)
+						too_old = true;
+				}
+			}
+		}
+
+		if (too_old) {
+			gt_info(gt, "GSC firmware too old for ARL, got %d.%d.%d.%d but need at least 102.0.10.1878",
+				gsc->release.major, gsc->release.minor,
+				gsc->release.patch, gsc->release.build);
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d80278eb45d73..ec33ad942115a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -698,12 +698,18 @@ static int check_gsc_manifest(struct intel_gt *gt,
 			      const struct firmware *fw,
 			      struct intel_uc_fw *uc_fw)
 {
+	int ret;
+
 	switch (uc_fw->type) {
 	case INTEL_UC_FW_TYPE_HUC:
-		intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+		ret = intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+		if (ret)
+			return ret;
 		break;
 	case INTEL_UC_FW_TYPE_GSC:
-		intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+		ret = intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+		if (ret)
+			return ret;
 		break;
 	default:
 		MISSING_CASE(uc_fw->type);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 02f28a6170c39..17561b53648e2 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -546,6 +546,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_LUNARLAKE(i915) (0 && i915)
 #define IS_BATTLEMAGE(i915)  (0 && i915)
 
+#define IS_ARROWLAKE(i915) \
+	IS_SUBPLATFORM(i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_ARL)
 #define IS_DG2_G10(i915) \
 	IS_SUBPLATFORM(i915, INTEL_DG2, INTEL_SUBPLATFORM_G10)
 #define IS_DG2_G11(i915) \
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index d26de37719a72..eede5417cb3fe 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -203,6 +203,10 @@ static const u16 subplatform_g12_ids[] = {
 	INTEL_DG2_G12_IDS(ID),
 };
 
+static const u16 subplatform_arl_ids[] = {
+	INTEL_ARL_IDS(ID),
+};
+
 static bool find_devid(u16 id, const u16 *p, unsigned int num)
 {
 	for (; num; num--, p++) {
@@ -260,6 +264,9 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_g12_ids,
 			      ARRAY_SIZE(subplatform_g12_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_G12);
+	} else if (find_devid(devid, subplatform_arl_ids,
+			      ARRAY_SIZE(subplatform_arl_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_ARL);
 	}
 
 	GEM_BUG_ON(mask & ~INTEL_SUBPLATFORM_MASK);
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index d1a2abc7e5139..df73ef94615dd 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -127,6 +127,9 @@ enum intel_platform {
 #define INTEL_SUBPLATFORM_N    1
 #define INTEL_SUBPLATFORM_RPLU  2
 
+/* MTL */
+#define INTEL_SUBPLATFORM_ARL	0
+
 enum intel_ppgtt_type {
 	INTEL_PPGTT_NONE = I915_GEM_PPGTT_NONE,
 	INTEL_PPGTT_ALIASING = I915_GEM_PPGTT_ALIASING,
diff --git a/include/drm/intel/i915_pciids.h b/include/drm/intel/i915_pciids.h
index b21374f76df23..2bf03ebfcf73d 100644
--- a/include/drm/intel/i915_pciids.h
+++ b/include/drm/intel/i915_pciids.h
@@ -772,15 +772,18 @@
 	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
 /* MTL */
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	MACRO__(0x7D41, ## __VA_ARGS__), \
+	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7D67, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__)
+
 #define INTEL_MTL_IDS(MACRO__, ...) \
+	INTEL_ARL_IDS(MACRO__, ## __VA_ARGS__), \
 	MACRO__(0x7D40, ## __VA_ARGS__), \
-	MACRO__(0x7D41, ## __VA_ARGS__), \
 	MACRO__(0x7D45, ## __VA_ARGS__), \
-	MACRO__(0x7D51, ## __VA_ARGS__), \
 	MACRO__(0x7D55, ## __VA_ARGS__), \
 	MACRO__(0x7D60, ## __VA_ARGS__), \
-	MACRO__(0x7D67, ## __VA_ARGS__), \
-	MACRO__(0x7DD1, ## __VA_ARGS__), \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
 /* LNL */
-- 
2.45.2

