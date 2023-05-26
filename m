Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CA712A82
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F6B10E80F;
	Fri, 26 May 2023 16:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9DF10E805;
 Fri, 26 May 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118067; x=1716654067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UEcvYqc/mdRyAoxXPJYFJ7+T/vuE9amH+mAeMX01qgc=;
 b=EgQg2ueLU00H95bS3uWWyy+Cx3NMoAH/f3AnZbuE4BGQfmien3cZK/jF
 fB12RQF6xYmKM6JgPih1ZKthRn7UruJ+w70hzhEZrC3xX5TmK9e2s428H
 NXYbGu+flro6kfm80PdrIPc3beWpexxTwls+Bt+4anhVRhE4oalJrcoQ3
 W3djRunucp6EfTHGuSuAY52lwb5ZvK8rzLaL6na1F/Ey7TKzCYRomq5Je
 1Gz16aas4B47DoIHbYQp11HFrf3ugTM0kZodhqoTy9skuJ/eS13xKfISk
 V+P6ZZv46jONkiS+K5+0LsA1I5U5DMLdIprMZ/NcDwh8BUcJsTV9bFO+Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343735827"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="343735827"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849620143"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="849620143"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:04 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/5] drm/xe/RAS: Expose the error counters
Date: Fri, 26 May 2023 21:50:14 +0530
Message-Id: <20230526162016.428357-4-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We expose the various error counters supported on a hardware via genl
subsystem through the registered commands to userspace.
The DRM_CMD_QUERY lists the error names with config id, DRM_CMD_READ_ONE
returns the counter value for the requested config id and the
DRM_CMD_READ_ALL list the counters for all errors along with their names
and config ids.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/xe_netlink.c | 439 +++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h       |  64 +++++
 2 files changed, 501 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
index 63ef238ebc27..2a6965f5cde9 100644
--- a/drivers/gpu/drm/xe/xe_netlink.c
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -4,19 +4,451 @@
  */
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "xe_device.h"
 
+#define MAX_ERROR_NAME	50
+
+#define HAS_GT_ERROR_VECTORS(xe)	((xe)->info.has_gt_error_vectors)
+#define HAS_MEM_SPARING_SUPPORT(xe)	((xe)->info.has_mem_sparing)
+
 DEFINE_XARRAY(xe_xarray);
 
-static int xe_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
+static const char * const xe_hw_error_events[] = {
+		[XE_GT_ERROR_CORRECTABLE_L3_SNG] = "correctable-l3-sng",
+		[XE_GT_ERROR_CORRECTABLE_GUC] = "correctable-guc",
+		[XE_GT_ERROR_CORRECTABLE_SAMPLER] = "correctable-sampler",
+		[XE_GT_ERROR_CORRECTABLE_SLM] = "correctable-slm",
+		[XE_GT_ERROR_CORRECTABLE_EU_IC] = "correctable-eu-ic",
+		[XE_GT_ERROR_CORRECTABLE_EU_GRF] = "correctable-eu-grf",
+		[XE_GT_ERROR_FATAL_ARR_BIST] = "fatal-array-bist",
+		[XE_GT_ERROR_FATAL_L3_DOUB] = "fatal-l3-double",
+		[XE_GT_ERROR_FATAL_L3_ECC_CHK] = "fatal-l3-ecc-checker",
+		[XE_GT_ERROR_FATAL_GUC] = "fatal-guc",
+		[XE_GT_ERROR_FATAL_IDI_PAR] = "fatal-idi-parity",
+		[XE_GT_ERROR_FATAL_SQIDI] = "fatal-sqidi",
+		[XE_GT_ERROR_FATAL_SAMPLER] = "fatal-sampler",
+		[XE_GT_ERROR_FATAL_SLM] = "fatal-slm",
+		[XE_GT_ERROR_FATAL_EU_IC] = "fatal-eu-ic",
+		[XE_GT_ERROR_FATAL_EU_GRF] = "fatal-eu-grf",
+		[XE_GT_ERROR_FATAL_FPU] = "fatal-fpu",
+		[XE_GT_ERROR_FATAL_TLB] = "fatal-tlb",
+		[XE_GT_ERROR_FATAL_L3_FABRIC] = "fatal-l3-fabric",
+		[XE_GT_ERROR_CORRECTABLE_SUBSLICE] = "correctable-subslice",
+		[XE_GT_ERROR_CORRECTABLE_L3BANK] = "correctable-l3bank",
+		[XE_GT_ERROR_FATAL_SUBSLICE] = "fatal-subslice",
+		[XE_GT_ERROR_FATAL_L3BANK] = "fatal-l3bank",
+		[XE_SGUNIT_ERROR_CORRECTABLE] = "sgunit-correctable",
+		[XE_SGUNIT_ERROR_NONFATAL] = "sgunit-nonfatal",
+		[XE_SGUNIT_ERROR_FATAL] = "sgunit-fatal",
+		[XE_SOC_ERROR_FATAL_PSF_CSC_0] = "soc-fatal-psf-csc-0",
+		[XE_SOC_ERROR_FATAL_PSF_CSC_1] = "soc-fatal-psf-csc-1",
+		[XE_SOC_ERROR_FATAL_PSF_CSC_2] = "soc-fatal-psf-csc-2",
+		[XE_SOC_ERROR_FATAL_PUNIT] = "soc-fatal-punit",
+		[XE_PVC_SOC_ERROR_FATAL_PSF_0] = "soc-fatal-psf-0",
+		[XE_PVC_SOC_ERROR_FATAL_PSF_1] = "soc-fatal-psf-1",
+		[XE_PVC_SOC_ERROR_FATAL_PSF_2] = "soc-fatal-psf-2",
+		[XE_PVC_SOC_ERROR_FATAL_CD0] = "soc-fatal-cd0",
+		[XE_PVC_SOC_ERROR_FATAL_CD0_MDFI] = "soc-fatal-cd0-mdfi",
+		[XE_PVC_SOC_ERROR_FATAL_MDFI_EAST] = "soc-fatal-mdfi-east",
+		[XE_PVC_SOC_ERROR_FATAL_MDFI_SOUTH] = "soc-fatal-mdfi-south",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 0)] = "soc-fatal-hbm-ss0-0",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 1)] = "soc-fatal-hbm-ss0-1",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 2)] = "soc-fatal-hbm-ss0-2",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 3)] = "soc-fatal-hbm-ss0-3",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 4)] = "soc-fatal-hbm-ss0-4",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 5)] = "soc-fatal-hbm-ss0-5",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 6)] = "soc-fatal-hbm-ss0-6",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 7)] = "soc-fatal-hbm-ss0-7",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 8)] = "soc-fatal-hbm-ss1-0",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 9)] = "soc-fatal-hbm-ss1-1",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 10)] = "soc-fatal-hbm-ss1-2",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 11)] = "soc-fatal-hbm-ss1-3",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 12)] = "soc-fatal-hbm-ss1-4",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 13)] = "soc-fatal-hbm-ss1-5",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 14)] = "soc-fatal-hbm-ss1-6",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(0, 15)] = "soc-fatal-hbm-ss1-7",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 0)] = "soc-fatal-hbm-ss2-0",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 1)] = "soc-fatal-hbm-ss2-1",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 2)] = "soc-fatal-hbm-ss2-2",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 3)] = "soc-fatal-hbm-ss2-3",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 4)] = "soc-fatal-hbm-ss2-4",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 5)] = "soc-fatal-hbm-ss2-5",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 6)] = "soc-fatal-hbm-ss2-6",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 7)] = "soc-fatal-hbm-ss2-7",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 8)] = "soc-fatal-hbm-ss3-0",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 9)] = "soc-fatal-hbm-ss3-1",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 10)] = "soc-fatal-hbm-ss3-2",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 11)] = "soc-fatal-hbm-ss3-3",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 12)] = "soc-fatal-hbm-ss3-4",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 13)] = "soc-fatal-hbm-ss3-5",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 14)] = "soc-fatal-hbm-ss3-6",
+		[XE_PVC_SOC_ERROR_FATAL_HBM(1, 15)] = "soc-fatal-hbm-ss3-7",
+		[XE_GSC_ERROR_CORRECTABLE_SRAM_ECC] = "gsc-correctable-sram-ecc",
+		[XE_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = "gsc-nonfatal-mia-shutdown",
+		[XE_GSC_ERROR_NONFATAL_MIA_INT] = "gsc-nonfatal-mia-int",
+		[XE_GSC_ERROR_NONFATAL_SRAM_ECC] = "gsc-nonfatal-sram-ecc",
+		[XE_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = "gsc-nonfatal-wdg-timeout",
+		[XE_GSC_ERROR_NONFATAL_ROM_PARITY] = "gsc-nonfatal-rom-parity",
+		[XE_GSC_ERROR_NONFATAL_UCODE_PARITY] = "gsc-nonfatal-ucode-parity",
+		[XE_GSC_ERROR_NONFATAL_GLITCH_DET] = "gsc-nonfatal-glitch-det",
+		[XE_GSC_ERROR_NONFATAL_FUSE_PULL] = "gsc-nonfatal-fuse-pull",
+		[XE_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = "gsc-nonfatal-fuse-crc-check",
+		[XE_GSC_ERROR_NONFATAL_FUSE_SELFMBIST] = "gsc-nonfatal-selfmbist",
+		[XE_GSC_ERROR_NONFATAL_AON_PARITY] = "gsc-nonfatal-aon-parity",
+};
+
+static const unsigned long xe_hw_error_map[] = {
+	[XE_GT_ERROR_CORRECTABLE_L3_SNG] = INTEL_GT_HW_ERROR_COR_L3_SNG,
+	[XE_GT_ERROR_CORRECTABLE_GUC] = INTEL_GT_HW_ERROR_COR_GUC,
+	[XE_GT_ERROR_CORRECTABLE_SAMPLER] = INTEL_GT_HW_ERROR_COR_SAMPLER,
+	[XE_GT_ERROR_CORRECTABLE_SLM] = INTEL_GT_HW_ERROR_COR_SLM,
+	[XE_GT_ERROR_CORRECTABLE_EU_IC] = INTEL_GT_HW_ERROR_COR_EU_IC,
+	[XE_GT_ERROR_CORRECTABLE_EU_GRF] = INTEL_GT_HW_ERROR_COR_EU_GRF,
+	[XE_GT_ERROR_FATAL_ARR_BIST] = INTEL_GT_HW_ERROR_FAT_ARR_BIST,
+	[XE_GT_ERROR_FATAL_L3_DOUB] = INTEL_GT_HW_ERROR_FAT_L3_DOUB,
+	[XE_GT_ERROR_FATAL_L3_ECC_CHK] = INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
+	[XE_GT_ERROR_FATAL_GUC] = INTEL_GT_HW_ERROR_FAT_GUC,
+	[XE_GT_ERROR_FATAL_IDI_PAR] = INTEL_GT_HW_ERROR_FAT_IDI_PAR,
+	[XE_GT_ERROR_FATAL_SQIDI] = INTEL_GT_HW_ERROR_FAT_SQIDI,
+	[XE_GT_ERROR_FATAL_SAMPLER] = INTEL_GT_HW_ERROR_FAT_SAMPLER,
+	[XE_GT_ERROR_FATAL_SLM] = INTEL_GT_HW_ERROR_FAT_SLM,
+	[XE_GT_ERROR_FATAL_EU_IC] = INTEL_GT_HW_ERROR_FAT_EU_IC,
+	[XE_GT_ERROR_FATAL_EU_GRF] = INTEL_GT_HW_ERROR_FAT_EU_GRF,
+	[XE_GT_ERROR_FATAL_FPU] = INTEL_GT_HW_ERROR_FAT_FPU,
+	[XE_GT_ERROR_FATAL_TLB] = INTEL_GT_HW_ERROR_FAT_TLB,
+	[XE_GT_ERROR_FATAL_L3_FABRIC] = INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
+	[XE_GT_ERROR_CORRECTABLE_SUBSLICE] = INTEL_GT_HW_ERROR_COR_SUBSLICE,
+	[XE_GT_ERROR_CORRECTABLE_L3BANK] = INTEL_GT_HW_ERROR_COR_L3BANK,
+	[XE_GT_ERROR_FATAL_SUBSLICE] = INTEL_GT_HW_ERROR_FAT_SUBSLICE,
+	[XE_GT_ERROR_FATAL_L3BANK] = INTEL_GT_HW_ERROR_FAT_L3BANK,
+	[XE_SGUNIT_ERROR_CORRECTABLE] = HARDWARE_ERROR_CORRECTABLE,
+	[XE_SGUNIT_ERROR_NONFATAL] = HARDWARE_ERROR_NONFATAL,
+	[XE_SGUNIT_ERROR_FATAL] = HARDWARE_ERROR_FATAL,
+	[XE_SOC_ERROR_FATAL_PSF_CSC_0] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, SOC_PSF_CSC_0),
+	[XE_SOC_ERROR_FATAL_PSF_CSC_1] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, SOC_PSF_CSC_1),
+	[XE_SOC_ERROR_FATAL_PSF_CSC_2] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, SOC_PSF_CSC_2),
+	[XE_SOC_ERROR_FATAL_PUNIT] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_PUNIT),
+	[XE_PVC_SOC_ERROR_FATAL_PSF_0] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_PSF_0),
+	[XE_PVC_SOC_ERROR_FATAL_PSF_1] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_PSF_1),
+	[XE_PVC_SOC_ERROR_FATAL_PSF_2] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_PSF_2),
+	[XE_PVC_SOC_ERROR_FATAL_CD0] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_CD0),
+	[XE_PVC_SOC_ERROR_FATAL_CD0_MDFI] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_CD0_MDFI),
+	[XE_PVC_SOC_ERROR_FATAL_MDFI_EAST] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_MDFI_EAST),
+	[XE_PVC_SOC_ERROR_FATAL_MDFI_SOUTH] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_MDFI_SOUTH),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 0)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_0),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 1)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_1),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 2)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_2),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 3)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_3),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 4)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_4),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 5)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_5),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 6)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_6),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 7)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_7),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 8)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_0),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 9)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_1),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 10)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_2),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 11)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_3),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 12)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_4),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 13)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_5),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 14)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_6),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(0, 15)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_7),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 0)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_0),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 1)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_1),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 2)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_2),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 3)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_3),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 4)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_4),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 5)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_5),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 6)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_6),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 7)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_7),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 8)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_0),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 9)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_1),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 10)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_2),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 11)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_3),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 12)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_4),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 13)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_5),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 14)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_6),
+	[XE_PVC_SOC_ERROR_FATAL_HBM(1, 15)] = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_7),
+	[XE_GSC_ERROR_CORRECTABLE_SRAM_ECC] = INTEL_GSC_HW_ERROR_COR_SRAM_ECC,
+	[XE_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = INTEL_GSC_HW_ERROR_UNCOR_MIA_SHUTDOWN,
+	[XE_GSC_ERROR_NONFATAL_MIA_INT] = INTEL_GSC_HW_ERROR_UNCOR_MIA_INT,
+	[XE_GSC_ERROR_NONFATAL_SRAM_ECC] = INTEL_GSC_HW_ERROR_UNCOR_SRAM_ECC,
+	[XE_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = INTEL_GSC_HW_ERROR_UNCOR_WDG_TIMEOUT,
+	[XE_GSC_ERROR_NONFATAL_ROM_PARITY] = INTEL_GSC_HW_ERROR_UNCOR_ROM_PARITY,
+	[XE_GSC_ERROR_NONFATAL_UCODE_PARITY] = INTEL_GSC_HW_ERROR_UNCOR_UCODE_PARITY,
+	[XE_GSC_ERROR_NONFATAL_GLITCH_DET] = INTEL_GSC_HW_ERROR_UNCOR_GLITCH_DET,
+	[XE_GSC_ERROR_NONFATAL_FUSE_PULL] = INTEL_GSC_HW_ERROR_UNCOR_FUSE_PULL,
+	[XE_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = INTEL_GSC_HW_ERROR_UNCOR_FUSE_CRC_CHECK,
+	[XE_GSC_ERROR_NONFATAL_FUSE_SELFMBIST] = INTEL_GSC_HW_ERROR_UNCOR_SELFMBIST,
+	[XE_GSC_ERROR_NONFATAL_AON_PARITY] = INTEL_GSC_HW_ERROR_UNCOR_AON_PARITY,
+};
+
+static unsigned int config_gt_id(const u64 config)
+{
+	return config >> __XE_GT_SHIFT;
+}
+
+static u64 config_counter(const u64 config)
+{
+	return config & ~(~0ULL << __XE_GT_SHIFT);
+}
+
+static bool is_gt_vector_error(const u64 config)
 {
+	unsigned int error;
+
+	error = config_counter(config);
+	if (error >= XE_GT_ERROR_FATAL_TLB &&
+	    error <= XE_GT_ERROR_FATAL_L3BANK)
+		return true;
+
+	return false;
+}
+
+static bool is_pvc_invalid_gt_errors(const u64 config)
+{
+	switch (config_counter(config)) {
+	case XE_GT_ERROR_CORRECTABLE_L3_SNG:
+	case XE_GT_ERROR_CORRECTABLE_SAMPLER:
+	case XE_GT_ERROR_FATAL_ARR_BIST:
+	case XE_GT_ERROR_FATAL_L3_DOUB:
+	case XE_GT_ERROR_FATAL_L3_ECC_CHK:
+	case XE_GT_ERROR_FATAL_IDI_PAR:
+	case XE_GT_ERROR_FATAL_SQIDI:
+	case XE_GT_ERROR_FATAL_SAMPLER:
+	case XE_GT_ERROR_FATAL_EU_IC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool is_gsc_hw_error(const u64 config)
+{
+	if (config_counter(config) >= XE_GSC_ERROR_CORRECTABLE_SRAM_ECC &&
+	    config_counter(config) <= XE_GSC_ERROR_NONFATAL_AON_PARITY)
+		return true;
+
+	return false;
+}
+
+static bool is_soc_error(const u64 config)
+{
+	if (config_counter(config) >= XE_SOC_ERROR_FATAL_PSF_CSC_0 &&
+	    config_counter(config) <= XE_PVC_SOC_ERROR_FATAL_HBM(1, 15))
+		return true;
+
+	return false;
+}
+
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int gt_id = config_gt_id(config);
+
+	if (!IS_DGFX(xe))
+		return -ENODEV;
+
+	if (xe->gt[gt_id].info.type == XE_GT_TYPE_UNINITIALIZED)
+		return -ENOENT;
+
+	/* GSC HW ERRORS are present on root tile of
+	 * platform supporting MEMORY SPARING only
+	 */
+	if (is_gsc_hw_error(config) && !(HAS_MEM_SPARING_SUPPORT(xe) && gt_id == 0))
+		return -ENODEV;
+
+	/* GT vectors error  are valid on Platforms supporting error vectors only */
+	if (is_gt_vector_error(config) && !HAS_GT_ERROR_VECTORS(xe))
+		return -ENODEV;
+
+	/* Skip gt errors not supported on pvc */
+	if (is_pvc_invalid_gt_errors(config) && (xe->info.platform == XE_PVC))
+		return  -ENODEV;
+
+	/* FATAL FPU error is valid on PVC only */
+	if (config_counter(config) == XE_GT_ERROR_FATAL_FPU &&
+	    !(xe->info.platform == XE_PVC))
+		return -ENODEV;
+
+	if (is_soc_error(config) && !(xe->info.platform == XE_PVC))
+		return -ENODEV;
+
+	return (config_counter(config) >=
+			ARRAY_SIZE(xe_hw_error_map)) ? -ENOENT : 0;
+}
+
+static u64 get_counter_value(struct xe_device *xe, u64 config)
+{
+	const unsigned int gt_id = config_gt_id(config);
+	unsigned int id = config_counter(config);
+
+	if (is_soc_error(config))
+		return xa_to_value(xa_load(&xe->gt[gt_id].errors.soc, xe_hw_error_map[id]));
+	else if (is_gsc_hw_error(config))
+		return xe->gt[gt_id].errors.gsc_hw[xe_hw_error_map[id]];
+	else if (id >= XE_SGUNIT_ERROR_CORRECTABLE &&
+		 id <= XE_SGUNIT_ERROR_FATAL)
+		return xe->gt[gt_id].errors.sgunit[xe_hw_error_map[id]];
+	else
+		return xe->gt[gt_id].errors.hw[xe_hw_error_map[id]];
+
 	return 0;
 }
 
-static int xe_genl_read_error(struct sk_buff *msg, struct genl_info *info)
+static struct xe_device *genl_to_xe(struct genl_info *info)
+{
+	return xa_load(&xe_xarray, info->nlhdr->nlmsg_type);
+}
+
+static int xe_genl_send(struct sk_buff *msg, struct genl_info *info, void *usrhdr)
 {
+	int ret;
+
+	genlmsg_end(msg, usrhdr);
+
+	ret = genlmsg_reply(msg, info);
+	if (ret)
+		nlmsg_free(msg);
+
+	return ret;
+}
+
+static struct sk_buff *
+xe_genl_alloc_msg(struct xe_device *xe,
+		  struct genl_info *info,
+		  size_t msg_size, void **usrhdr)
+{
+	struct sk_buff *new_msg;
+
+	new_msg = genlmsg_new(msg_size, GFP_KERNEL);
+	if (!new_msg)
+		return new_msg;
+
+	*usrhdr = genlmsg_put_reply(new_msg, info, &xe->xe_genl_family, 0, info->genlhdr->cmd);
+	if (!*usrhdr) {
+		nlmsg_free(new_msg);
+		new_msg = NULL;
+	}
+
+	return new_msg;
+}
+
+int fill_error_details(struct genl_info *info, struct sk_buff *new_msg)
+{
+	struct xe_device *xe = genl_to_xe(info);
+	struct nlattr *entry_attr;
+	struct xe_gt *gt;
+	int i, j;
+	bool counter = false;
+
+	if (info->genlhdr->cmd == DRM_CMD_READ_ALL)
+		counter = true;
+
+	entry_attr = nla_nest_start(new_msg, DRM_ATTR_QUERY_REPLY);
+	if (!entry_attr)
+		return -EMSGSIZE;
+
+	for_each_gt(gt, xe, j) {
+		char str[MAX_ERROR_NAME];
+		u64 val;
+
+		for (i = 0; i < ARRAY_SIZE(xe_hw_error_events); i++) {
+			u64 config = XE_HW_ERROR(j, i);
+
+			if (config_status(xe, config))
+				continue;
+
+			/* should this be cleared everytime */
+			snprintf(str, sizeof(str), "error-gt%d-%s", j, xe_hw_error_events[i]);
+
+			if (nla_put_string(new_msg, DRM_ATTR_ERROR_NAME, str))
+				goto err;
+			if (nla_put_u64_64bit(new_msg, DRM_ATTR_ERROR_ID, config, DRM_ATTR_PAD))
+				goto err;
+			if (counter) {
+				val = get_counter_value(xe, config);
+				if (nla_put_u64_64bit(new_msg, DRM_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD))
+					goto err;
+			}
+		}
+	}
+
+	nla_nest_end(new_msg, entry_attr);
+
 	return 0;
+err:
+	drm_dbg_driver(&xe->drm, "msg buff is small\n");
+	nla_nest_cancel(new_msg, entry_attr);
+	nlmsg_free(new_msg);
+
+	return -EMSGSIZE;
+}
+
+static int xe_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
+{
+	struct xe_device *xe = genl_to_xe(info);
+	size_t msg_size = NLMSG_DEFAULT_SIZE;
+	struct sk_buff *new_msg;
+	void *usrhdr;
+	int ret = 0;
+	int retries = 2;
+
+	if (GENL_REQ_ATTR_CHECK(info, DRM_ATTR_REQUEST))
+		return -EINVAL;
+
+	do {
+		new_msg = xe_genl_alloc_msg(xe, info, msg_size, &usrhdr);
+		if (!new_msg)
+			return -ENOMEM;
+
+		ret = fill_error_details(info, new_msg);
+		if (!ret)
+			break;
+
+		msg_size += NLMSG_DEFAULT_SIZE;
+	} while (retries--);
+
+	if (!ret)
+		ret = xe_genl_send(new_msg, info, usrhdr);
+
+	return ret;
+}
+
+static int xe_genl_read_error(struct sk_buff *msg, struct genl_info *info)
+{
+	struct xe_device *xe = genl_to_xe(info);
+	size_t msg_size = NLMSG_DEFAULT_SIZE;
+	struct sk_buff *new_msg;
+	void *usrhdr;
+	int ret = 0;
+	int retries = 2;
+	u64 config, val;
+
+	if (GENL_REQ_ATTR_CHECK(info, DRM_ATTR_ERROR_ID))
+		return -EINVAL;
+
+	config = nla_get_u64(info->attrs[DRM_ATTR_ERROR_ID]);
+	ret = config_status(xe, config);
+	if (ret)
+		return ret;
+	do {
+		new_msg = xe_genl_alloc_msg(xe, info, msg_size, &usrhdr);
+		if (!new_msg)
+			return -ENOMEM;
+
+		val = get_counter_value(xe, config);
+		if (nla_put_u64_64bit(new_msg, DRM_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD)) {
+			msg_size += NLMSG_DEFAULT_SIZE;
+			continue;
+		}
+
+		break;
+	} while (retries--);
+
+	ret = xe_genl_send(new_msg, info, usrhdr);
+
+	return ret;
 }
 
 /* operations definition */
@@ -65,6 +497,9 @@ int xe_genl_register(struct xe_device *xe)
 {
 	int ret;
 
+	BUILD_BUG_ON(ARRAY_SIZE(xe_hw_error_events) !=
+		     ARRAY_SIZE(xe_hw_error_map));
+
 	xe_genl_family_init(xe);
 
 	ret = genl_register_family(&xe->xe_genl_family);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..a2ea238096df 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -801,6 +801,70 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+/*
+ * HW error IDs
+ */
+
+#define __XE_GT_SHIFT	(60)
+
+#define XE_HW_ERROR(gt, id) \
+	((id) | ((__u64)(gt) << __XE_GT_SHIFT))
+
+#define XE_GT_ERROR_CORRECTABLE_L3_SNG		(0)
+#define XE_GT_ERROR_CORRECTABLE_GUC		(1)
+#define XE_GT_ERROR_CORRECTABLE_SAMPLER		(2)
+#define XE_GT_ERROR_CORRECTABLE_SLM		(3)
+#define XE_GT_ERROR_CORRECTABLE_EU_IC		(4)
+#define XE_GT_ERROR_CORRECTABLE_EU_GRF		(5)
+#define XE_GT_ERROR_FATAL_ARR_BIST		(6)
+#define XE_GT_ERROR_FATAL_L3_DOUB		(7)
+#define XE_GT_ERROR_FATAL_L3_ECC_CHK		(8)
+#define XE_GT_ERROR_FATAL_GUC			(9)
+#define XE_GT_ERROR_FATAL_IDI_PAR		(10)
+#define XE_GT_ERROR_FATAL_SQIDI			(11)
+#define XE_GT_ERROR_FATAL_SAMPLER		(12)
+#define XE_GT_ERROR_FATAL_SLM			(13)
+#define XE_GT_ERROR_FATAL_EU_IC			(14)
+#define XE_GT_ERROR_FATAL_EU_GRF		(15)
+#define XE_GT_ERROR_FATAL_FPU			(16)
+#define XE_GT_ERROR_FATAL_TLB			(17)
+#define XE_GT_ERROR_FATAL_L3_FABRIC		(18)
+#define XE_GT_ERROR_CORRECTABLE_SUBSLICE	(19)
+#define XE_GT_ERROR_CORRECTABLE_L3BANK		(20)
+#define XE_GT_ERROR_FATAL_SUBSLICE		(21)
+#define XE_GT_ERROR_FATAL_L3BANK		(22)
+#define XE_SGUNIT_ERROR_CORRECTABLE		(23)
+#define XE_SGUNIT_ERROR_NONFATAL		(24)
+#define XE_SGUNIT_ERROR_FATAL			(25)
+#define XE_SOC_ERROR_FATAL_PSF_CSC_0		(26)
+#define XE_SOC_ERROR_FATAL_PSF_CSC_1		(27)
+#define XE_SOC_ERROR_FATAL_PSF_CSC_2		(28)
+#define XE_SOC_ERROR_FATAL_PUNIT		(29)
+#define XE_PVC_SOC_ERROR_FATAL_PSF_0		(30)
+#define XE_PVC_SOC_ERROR_FATAL_PSF_1		(31)
+#define XE_PVC_SOC_ERROR_FATAL_PSF_2		(32)
+#define XE_PVC_SOC_ERROR_FATAL_CD0		(33)
+#define XE_PVC_SOC_ERROR_FATAL_CD0_MDFI		(34)
+#define XE_PVC_SOC_ERROR_FATAL_MDFI_EAST	(35)
+#define XE_PVC_SOC_ERROR_FATAL_MDFI_SOUTH	(36)
+
+#define XE_PVC_SOC_ERROR_FATAL_HBM(ss, n)\
+		(XE_PVC_SOC_ERROR_FATAL_MDFI_SOUTH + 0x1 + (ss) * 0x10 + (n))
+
+/* 68 is the last ID used by SOC errors */
+#define XE_GSC_ERROR_CORRECTABLE_SRAM_ECC	(69)
+#define XE_GSC_ERROR_NONFATAL_MIA_SHUTDOWN	(70)
+#define XE_GSC_ERROR_NONFATAL_MIA_INT		(71)
+#define XE_GSC_ERROR_NONFATAL_SRAM_ECC		(72)
+#define XE_GSC_ERROR_NONFATAL_WDG_TIMEOUT	(73)
+#define XE_GSC_ERROR_NONFATAL_ROM_PARITY	(74)
+#define XE_GSC_ERROR_NONFATAL_UCODE_PARITY	(75)
+#define XE_GSC_ERROR_NONFATAL_GLITCH_DET	(76)
+#define XE_GSC_ERROR_NONFATAL_FUSE_PULL		(77)
+#define XE_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK	(78)
+#define XE_GSC_ERROR_NONFATAL_FUSE_SELFMBIST	(79)
+#define XE_GSC_ERROR_NONFATAL_AON_PARITY	(80)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

