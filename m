Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249CF723546
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 04:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB96D10E1FE;
	Tue,  6 Jun 2023 02:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB24710E1F2;
 Tue,  6 Jun 2023 02:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686018256; x=1717554256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t18/r5+5f2/oeNVORiqEcX5Gv347gxNmSa4eS1mAhZI=;
 b=ZPcEfmdz3xyAGEHdh2KYf1Fu03QlLH3r0Gn5J7s9TtBR6x7PT7WgCT2A
 jKtWigS3QCkG9RWvRV/2vaa0wXvh8+kP6IHD4V9HIa0wfE2CsWi3UXqfW
 yfSviQVt1JS/D7Mi24TD/Agog6qqN29uLEMaa4inGGuD789MV7igy9JcI
 16L0iwoAeh0rTd2E81krV3/4AM+/EGpIRb5JMfM9shWUwOOwTjosH5lrz
 AuDZQyMaWGN4MDsmAmedBIouMA9heGnL+GQuiPpIasG64VJ95NwzqxmWA
 dleiq7zdWjTDMndcgAEt11WzPQk/fbPYmieQqRZsdr0KeJc8LTiyp1+YR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358995793"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="358995793"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712019567"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="712019567"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/i915/gsc: define gsc fw
Date: Mon,  5 Jun 2023 19:24:02 -0700
Message-Id: <20230606022402.2048235-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
References: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
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
the compatibility version in the binary names.

Same as with the GuC, a major version bump indicate a
backward-incompatible change, while a minor version bump indicates a
backward-compatible one, so we use only the former in the file name.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 ++++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d408856ae4c0..08e16017584b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -130,6 +130,17 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(BROXTON,      0, huc_mmp(bxt,  2, 0, 0)) \
 	fw_def(SKYLAKE,      0, huc_mmp(skl,  2, 0, 0))
 
+/*
+ * The GSC FW has multiple version (see intel_gsc_uc.h for details); since what
+ * we care about is the interface, we use the compatibility version in the
+ * binary names.
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
@@ -165,6 +176,9 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 #define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
 	__MAKE_UC_FW_PATH_MMP(prefix_, "huc", major_, minor_, patch_)
 
+#define MAKE_GSC_FW_PATH(prefix_, major_, minor_) \
+	__MAKE_UC_FW_PATH_MAJOR(prefix_, "gsc", major_)
+
 /*
  * All blobs need to be declared via MODULE_FIRMWARE().
  * This first expansion of the table macros is solely to provide
@@ -175,6 +189,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 
 INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH_MAJOR, MAKE_GUC_FW_PATH_MMP)
 INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, MAKE_HUC_FW_PATH_MMP, MAKE_HUC_FW_PATH_GSC)
+INTEL_GSC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GSC_FW_PATH)
 
 /*
  * The next expansion of the table macros (in __uc_fw_auto_select below) provides
@@ -224,6 +239,10 @@ struct __packed uc_fw_blob {
 #define HUC_FW_BLOB_GSC(prefix_) \
 	UC_FW_BLOB_NEW(0, 0, 0, true, MAKE_HUC_FW_PATH_GSC(prefix_))
 
+#define GSC_FW_BLOB(prefix_, major_, minor_) \
+	UC_FW_BLOB_NEW(major_, minor_, 0, true, \
+		       MAKE_GSC_FW_PATH(prefix_, major_, minor_))
+
 struct __packed uc_fw_platform_requirement {
 	enum intel_platform p;
 	u8 rev; /* first platform rev using this FW */
@@ -250,9 +269,14 @@ static const struct uc_fw_platform_requirement blobs_huc[] = {
 	INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
 };
 
+static const struct uc_fw_platform_requirement blobs_gsc[] = {
+	INTEL_GSC_FIRMWARE_DEFS(MAKE_FW_LIST, GSC_FW_BLOB)
+};
+
 static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
 	[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
 	[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
+	[INTEL_UC_FW_TYPE_GSC] = { blobs_gsc, ARRAY_SIZE(blobs_gsc) },
 };
 
 static void
@@ -265,14 +289,6 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
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

