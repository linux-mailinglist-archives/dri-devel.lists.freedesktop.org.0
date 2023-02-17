Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FC69B686
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 00:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C460B10E482;
	Fri, 17 Feb 2023 23:48:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2C10E05E;
 Fri, 17 Feb 2023 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676677683; x=1708213683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XgMEwA0sQ4xrw1tkWmVGumzBiEzvZ/Nc2FHT9DAe8sM=;
 b=MzJ7V+ox187tNOqMVOWGryv1ytQ4YxDnnF4vcbrjjo99/m0J2WSbsLPF
 0yfy6lYy/VtDZw5ejOoVMnXb3uRkuHId27eCxPrx0PyaGrJX37awWJV3E
 cjuGnsApA5NK7Ixo+raA8vS4b6SVpGNmXg05d6RuglW2hUKXL+E0sDUv7
 5nGCMERsL5qub7TMySCxUQrTYdPCJRWuXMKgyJBdNChQTUhT01kIdObLW
 fF4Zp76jqTL+FWFOTSz/QC46dSts+Rb+LBSU9/VAHoiAIeFV5IzQbcXRs
 oAw5W9a3yXvmapPMxLEraHWmQKw2aqRBtYqY1YpKkBRGU+G7NpYOV7J9G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394600974"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394600974"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 15:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739427157"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="739427157"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 15:47:56 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915/guc: Improve GuC load error reporting
Date: Fri, 17 Feb 2023 15:47:14 -0800
Message-Id: <20230217234715.3609670-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
References: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There are multiple ways in which the GuC load can fail. The driver was
reporting the status register as is, but not everyone can read the
matrix unfiltered. So add decoding of the common error cases.

Also, remove the comment about interrupt based load completion
checking being not recommended. The interrupt was removed from the GuC
firmware some time ago so it is no longer an option anyway. While at
it, also abort the timeout if a known error code is reported. No need
to keep waiting if the GuC has already given up the load.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   | 17 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 95 +++++++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |  4 +-
 3 files changed, 95 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index 8085fb1812748..750fe0c6d8529 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -21,6 +21,9 @@ enum intel_guc_load_status {
 	INTEL_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
 	INTEL_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
 	INTEL_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
+	INTEL_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
+	INTEL_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
+	INTEL_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
 	INTEL_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
 	INTEL_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
 	INTEL_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
@@ -38,4 +41,18 @@ enum intel_guc_load_status {
 	INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
 };
 
+enum intel_bootrom_load_status {
+	INTEL_BOOTROM_STATUS_NO_KEY_FOUND                 = 0x13,
+	INTEL_BOOTROM_STATUS_AES_PROD_KEY_FOUND           = 0x1A,
+	INTEL_BOOTROM_STATUS_RSA_FAILED                   = 0x50,
+	INTEL_BOOTROM_STATUS_PAVPC_FAILED                 = 0x73,
+	INTEL_BOOTROM_STATUS_WOPCM_FAILED                 = 0x74,
+	INTEL_BOOTROM_STATUS_LOADLOC_FAILED               = 0x75,
+	INTEL_BOOTROM_STATUS_JUMP_PASSED                  = 0x76,
+	INTEL_BOOTROM_STATUS_JUMP_FAILED                  = 0x77,
+	INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED          = 0x79,
+	INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT             = 0x7a,
+	INTEL_BOOTROM_STATUS_EXCEPTION                    = 0x7E,
+};
+
 #endif /* _ABI_GUC_ERRORS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 69133420c78b2..2f5942606913d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -88,31 +88,64 @@ static int guc_xfer_rsa(struct intel_uc_fw *guc_fw,
 /*
  * Read the GuC status register (GUC_STATUS) and store it in the
  * specified location; then return a boolean indicating whether
- * the value matches either of two values representing completion
- * of the GuC boot process.
+ * the value matches either completion or a known failure code.
  *
  * This is used for polling the GuC status in a wait_for()
  * loop below.
  */
-static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
+static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool *success)
 {
 	u32 val = intel_uncore_read(uncore, GUC_STATUS);
 	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
+	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
 
 	*status = val;
-	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
+	*success = true;
+	switch (uk_val) {
+	case INTEL_GUC_LOAD_STATUS_READY:
+		return true;
+
+	case INTEL_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
+	case INTEL_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
+	case INTEL_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
+	case INTEL_GUC_LOAD_STATUS_HWCONFIG_ERROR:
+	case INTEL_GUC_LOAD_STATUS_DPC_ERROR:
+	case INTEL_GUC_LOAD_STATUS_EXCEPTION:
+	case INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID:
+	case INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID:
+	case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+		*success = false;
+		return true;
+	}
+
+	switch (br_val) {
+	case INTEL_BOOTROM_STATUS_NO_KEY_FOUND:
+	case INTEL_BOOTROM_STATUS_RSA_FAILED:
+	case INTEL_BOOTROM_STATUS_PAVPC_FAILED:
+	case INTEL_BOOTROM_STATUS_WOPCM_FAILED:
+	case INTEL_BOOTROM_STATUS_LOADLOC_FAILED:
+	case INTEL_BOOTROM_STATUS_JUMP_FAILED:
+	case INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
+	case INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT:
+	case INTEL_BOOTROM_STATUS_EXCEPTION:
+		*success = false;
+		return true;
+	}
+
+	return false;
 }
 
 static int guc_wait_ucode(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_uncore *uncore = gt->uncore;
+	bool success;
 	u32 status;
 	int ret;
 
 	/*
 	 * Wait for the GuC to start up.
-	 * NB: Docs recommend not using the interrupt for completion.
+	 *
 	 * Measurements indicate this should take no more than 20ms
 	 * (assuming the GT clock is at maximum frequency). So, a
 	 * timeout here indicates that the GuC has failed and is unusable.
@@ -127,28 +160,52 @@ static int guc_wait_ucode(struct intel_guc *guc)
 	 * 200ms. Even at slowest clock, this should be sufficient. And
 	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = wait_for(guc_ready(uncore, &status), 200);
-	if (ret) {
-		guc_info(guc, "load failed: status = 0x%08X\n", status);
-		guc_info(guc, "load failed: status: Reset = %d, "
-			"BootROM = 0x%02X, UKernel = 0x%02X, "
-			"MIA = 0x%02X, Auth = 0x%02X\n",
-			REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			REG_FIELD_GET(GS_MIA_MASK, status),
-			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
+	ret = wait_for(guc_load_done(uncore, &status, &success), 200);
+	if (ret || !success) {
+		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
+		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
+
+		guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", status, ret);
+		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			 bootrom, ukernel,
+			 REG_FIELD_GET(GS_MIA_MASK, status),
+			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		switch (bootrom) {
+		case INTEL_BOOTROM_STATUS_NO_KEY_FOUND:
+			guc_info(guc, "invalid key requested, header = 0x%08X\n",
+				 intel_uncore_read(uncore, GUC_HEADER_INFO));
+			ret = -ENOEXEC;
+			break;
+
+		case INTEL_BOOTROM_STATUS_RSA_FAILED:
 			guc_info(guc, "firmware signature verification failed\n");
 			ret = -ENOEXEC;
+			break;
 		}
 
-		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
+		switch (ukernel) {
+		case INTEL_GUC_LOAD_STATUS_EXCEPTION:
 			guc_info(guc, "firmware exception. EIP: %#x\n",
 				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
+			break;
+
+		case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+			guc_info(guc, "illegal register in save/restore workaround list\n");
+			ret = -EPERM;
+			break;
+
+		case INTEL_GUC_LOAD_STATUS_HWCONFIG_START:
+			guc_info(guc, "still extracting hwconfig table.\n");
+			ret = -ETIMEDOUT;
+			break;
 		}
+
+		/* Uncommon/unexpected error, see earlier status code print for details */
+		if (ret == 0)
+			ret = -ENXIO;
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index 9915de32e894e..3fd7988375020 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -18,8 +18,6 @@
 #define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
 #define   GS_BOOTROM_SHIFT		1
 #define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
-#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
-#define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
 #define   GS_UKERNEL_SHIFT		8
 #define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
 #define   GS_MIA_SHIFT			16
@@ -32,6 +30,8 @@
 #define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
 #define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
 
+#define GUC_HEADER_INFO			_MMIO(0xc014)
+
 #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
 #define SOFT_SCRATCH_COUNT		16
 
-- 
2.39.1

