Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0247B69A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 01:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8710ED48;
	Tue, 21 Dec 2021 00:52:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF9510E2A2;
 Tue, 21 Dec 2021 00:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640047943; x=1671583943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCEIyZ0pl9fQKO/C6gS2HoIRrDYVYq180BPVQRuvj0M=;
 b=IUSGTloTHGIl4ImcjmDA0Jdy/wttLKUMY+h28D+zhRm6cFMUuFHPnJCN
 WfjvXyMlNN9KMBqn57ofYSoWZCA50C8U0dBKgynvd+lomjgCbrDYsh0Zp
 V+KqnSx9QmIIHlIWkpuG/AOeoJFYG2hbHaq0dbCqFUFnR70e1RwCLp0Zd
 dhSjPUoI6lowl6XQatH54hTuHMdPpeXBf6RbhA5O3/ovuCo0wI7qXJ8JL
 B6gEKNDmW6nML6LJ6ZGyebWxeCQuB/A7yO2+J9YUtOapIT75o9oahzD2G
 BeJ+A8uOy5qFP2CyQyeDrb4rawVDJbpR67C37O0uBUYebaEt0ctMNO97D A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264483626"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="264483626"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 16:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="547739323"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 16:52:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915/guc: Improve GuC loading status check/error
 reports
Date: Mon, 20 Dec 2021 16:52:21 -0800
Message-Id: <20211221005221.1090824-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221005221.1090824-1-John.C.Harrison@Intel.com>
References: <20211221005221.1090824-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If the GuC fails to load, it is useful to know what firmware file /
version was attempted. So move the version info report to before the
load attempt rather than only after a successful load.

If the GuC does fail to load, then make the error messages visible
rather than being 'debug' prints that do not appears in dmesg output
by default.

When waiting for the GuC to load, it used to be necessary to check for
two different states - READY and (LAPIC_DONE | MIA_CORE). Apparently
the second signified init complete on RC6 exit. However, in more
recent GuC versions the RC6 exit sequence now finishes with status
READY as well. So the test can be simplified.

Also, add an enum giving all the current status codes that GuC loading
can report as a reference without having to pull and search through
the GuC source files.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   | 23 ++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |  4 ---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 31 ++++++++++---------
 5 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index 488b6061ee89..c20658ee85a5 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -11,4 +11,27 @@ enum intel_guc_response_status {
 	INTEL_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
 };
 
+enum intel_guc_load_status {
+	INTEL_GUC_LOAD_STATUS_DEFAULT                          = 0x00,
+	INTEL_GUC_LOAD_STATUS_START                            = 0x01,
+	INTEL_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
+	INTEL_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
+	INTEL_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
+	INTEL_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
+	INTEL_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
+	INTEL_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
+	INTEL_GUC_LOAD_STATUS_GUCINT_DONE                      = 0x40,
+	INTEL_GUC_LOAD_STATUS_DPC_READY                        = 0x50,
+	INTEL_GUC_LOAD_STATUS_DPC_ERROR                        = 0x60,
+	INTEL_GUC_LOAD_STATUS_EXCEPTION                        = 0x70,
+	INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID                = 0x71,
+	INTEL_GUC_LOAD_STATUS_PXP_TEARDOWN_CTRL_ENABLED        = 0x72,
+	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
+	INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
+	INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
+	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
+
+	INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
+};
+
 #endif /* _ABI_GUC_ERRORS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index c03bde5ec61f..bea86fb2750b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -90,11 +90,10 @@ static int guc_xfer_rsa(struct intel_uc_fw *guc_fw,
 static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
 {
 	u32 val = intel_uncore_read(uncore, GUC_STATUS);
-	u32 uk_val = val & GS_UKERNEL_MASK;
+	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
 
 	*status = val;
-	return (uk_val == GS_UKERNEL_READY) ||
-		((val & GS_MIA_CORE_STATE) && (uk_val == GS_UKERNEL_LAPIC_DONE));
+	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
 }
 
 static int guc_wait_ucode(struct intel_uncore *uncore)
@@ -123,8 +122,8 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 	if (ret) {
 		struct drm_device *drm = &uncore->i915->drm;
 
-		drm_dbg(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_dbg(drm, "GuC load failed: status: Reset = %d, "
+		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
+		drm_info(drm, "GuC load failed: status: Reset = %d, "
 			"BootROM = 0x%02X, UKernel = 0x%02X, "
 			"MIA = 0x%02X, Auth = 0x%02X\n",
 			REG_FIELD_GET(GS_MIA_IN_RESET, status),
@@ -134,13 +133,13 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_dbg(drm, "GuC firmware signature verification failed\n");
+			drm_info(drm, "GuC firmware signature verification failed\n");
 			ret = -ENOEXEC;
 		}
 
-		if ((status & GS_UKERNEL_MASK) == GS_UKERNEL_EXCEPTION) {
-			drm_dbg(drm, "GuC firmware exception. EIP: %#x\n",
-				intel_uncore_read(uncore, SOFT_SCRATCH(13)));
+		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
+			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
+				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index b37fc2ffaef2..e6bd66d6ce5a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -22,10 +22,6 @@
 #define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
 #define   GS_UKERNEL_SHIFT		8
 #define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
-#define   GS_UKERNEL_LAPIC_DONE		  (0x30 << GS_UKERNEL_SHIFT)
-#define   GS_UKERNEL_DPC_ERROR		  (0x60 << GS_UKERNEL_SHIFT)
-#define   GS_UKERNEL_EXCEPTION		  (0x70 << GS_UKERNEL_SHIFT)
-#define   GS_UKERNEL_READY		  (0xF0 << GS_UKERNEL_SHIFT)
 #define   GS_MIA_SHIFT			16
 #define   GS_MIA_MASK			  (0x07 << GS_MIA_SHIFT)
 #define   GS_MIA_CORE_STATE		  (0x01 << GS_MIA_SHIFT)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index d10b227ac4aa..556829de9c17 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -124,6 +124,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	}
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
+	drm_info(&gt->i915->drm, "HuC authenticated\n");
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 8f17005ce85f..ab1372e945f5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -431,6 +431,15 @@ static int __uc_check_hw(struct intel_uc *uc)
 	return 0;
 }
 
+static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
+{
+	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+
+	drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
+		 intel_uc_fw_type_repr(fw->type), fw->path,
+		 fw->major_ver_found, fw->minor_ver_found);
+}
+
 static int __uc_init_hw(struct intel_uc *uc)
 {
 	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
@@ -441,6 +450,11 @@ static int __uc_init_hw(struct intel_uc *uc)
 	GEM_BUG_ON(!intel_uc_supports_guc(uc));
 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
 
+	print_fw_ver(uc, &guc->fw);
+
+	if (intel_uc_uses_huc(uc))
+		print_fw_ver(uc, &huc->fw);
+
 	if (!intel_uc_fw_is_loadable(&guc->fw)) {
 		ret = __uc_check_hw(uc) ||
 		      intel_uc_fw_is_overridden(&guc->fw) ||
@@ -501,24 +515,11 @@ static int __uc_init_hw(struct intel_uc *uc)
 			goto err_submission;
 	}
 
-	drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
-		 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_GUC), guc->fw.path,
-		 guc->fw.major_ver_found, guc->fw.minor_ver_found,
-		 "submission",
+	drm_info(&i915->drm, "GuC submission %s\n",
 		 enableddisabled(intel_uc_uses_guc_submission(uc)));
-
-	drm_info(&i915->drm, "GuC SLPC: %s\n",
+	drm_info(&i915->drm, "GuC SLPC %s\n",
 		 enableddisabled(intel_uc_uses_guc_slpc(uc)));
 
-	if (intel_uc_uses_huc(uc)) {
-		drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
-			 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
-			 huc->fw.path,
-			 huc->fw.major_ver_found, huc->fw.minor_ver_found,
-			 "authenticated",
-			 yesno(intel_huc_is_authenticated(huc)));
-	}
-
 	return 0;
 
 	/*
-- 
2.25.1

