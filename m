Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5D7BCD81
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 11:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9510E0DE;
	Sun,  8 Oct 2023 09:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A0810E0D5;
 Sun,  8 Oct 2023 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696757035; x=1728293035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1TS1CcHWU69URe0KGu9VJgQSP2r8y5eoTdMEV5KQEPA=;
 b=lFxWq9AQnYQVnfSGiU5kFK2BFZum4DXJzL6lb/y35Mfsya3iSBrmQto8
 lfJp6JHTbtek/LBpjYYcfWeiHC3w+sR/M2sUM+9J0heisz4q3wYmju2XR
 2EOO0MdWOx3UHzlIUqvFE0eSB0wF1fPVLfWAUN3mGwheGHPZoGpvqRSLp
 ujI8IMkRiajl2BRhfpZIe6HIt2UOjAEsf0t4mbVHy5hOIYDxHWBJkAn0c
 GbYZ8xtufbvWJsWhhqc+geTru9etRHJQevH+UMcuLIIZG4D5ME2thUH44
 nLIpGkZ0iEwrtRi1PXBqf9J5ADZlAXhaJMqN1BQnc7ACptg07pCiL0nIf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364278983"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="364278983"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="1084007100"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="1084007100"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:51 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com
Subject: [RFC v2 3/5] drm/xe/RAS: Expose the error counters
Date: Sun,  8 Oct 2023 14:56:14 +0530
Message-Id: <20231008092616.1457995-4-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
References: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We expose the various error counters supported on a hardware via genl
subsytem through the registered commands to userspace. The
DRM_RAS_CMD_QUERY lists the error names with config id,
DRM_RAD_CMD_READ_ONE returns the counter value for the requested config
id and the DRM_RAS_CMD_READ_ALL lists the counters for all errors along
with their names and config ids.

v2: Rebase

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_netlink.c | 396 +++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h       |  61 +++++
 2 files changed, 455 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
index 81d785455632..a9d70dfe81a8 100644
--- a/drivers/gpu/drm/xe/xe_netlink.c
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -2,16 +2,408 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <drm/xe_drm.h>
+
 #include "xe_device.h"
 
-static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
+#define MAX_ERROR_NAME	50
+
+static const char * const xe_hw_error_events[] = {
+		[XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG] = "correctable-l3-sng",
+		[XE_GENL_GT_ERROR_CORRECTABLE_GUC] = "correctable-guc",
+		[XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER] = "correctable-sampler",
+		[XE_GENL_GT_ERROR_CORRECTABLE_SLM] = "correctable-slm",
+		[XE_GENL_GT_ERROR_CORRECTABLE_EU_IC] = "correctable-eu-ic",
+		[XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF] = "correctable-eu-grf",
+		[XE_GENL_GT_ERROR_FATAL_ARR_BIST] = "fatal-array-bist",
+		[XE_GENL_GT_ERROR_FATAL_L3_DOUB] = "fatal-l3-double",
+		[XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK] = "fatal-l3-ecc-checker",
+		[XE_GENL_GT_ERROR_FATAL_GUC] = "fatal-guc",
+		[XE_GENL_GT_ERROR_FATAL_IDI_PAR] = "fatal-idi-parity",
+		[XE_GENL_GT_ERROR_FATAL_SQIDI] = "fatal-sqidi",
+		[XE_GENL_GT_ERROR_FATAL_SAMPLER] = "fatal-sampler",
+		[XE_GENL_GT_ERROR_FATAL_SLM] = "fatal-slm",
+		[XE_GENL_GT_ERROR_FATAL_EU_IC] = "fatal-eu-ic",
+		[XE_GENL_GT_ERROR_FATAL_EU_GRF] = "fatal-eu-grf",
+		[XE_GENL_GT_ERROR_FATAL_FPU] = "fatal-fpu",
+		[XE_GENL_GT_ERROR_FATAL_TLB] = "fatal-tlb",
+		[XE_GENL_GT_ERROR_FATAL_L3_FABRIC] = "fatal-l3-fabric",
+		[XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE] = "correctable-subslice",
+		[XE_GENL_GT_ERROR_CORRECTABLE_L3BANK] = "correctable-l3bank",
+		[XE_GENL_GT_ERROR_FATAL_SUBSLICE] = "fatal-subslice",
+		[XE_GENL_GT_ERROR_FATAL_L3BANK] = "fatal-l3bank",
+		[XE_GENL_SGUNIT_ERROR_CORRECTABLE] = "sgunit-correctable",
+		[XE_GENL_SGUNIT_ERROR_NONFATAL] = "sgunit-nonfatal",
+		[XE_GENL_SGUNIT_ERROR_FATAL] = "sgunit-fatal",
+		[XE_GENL_SOC_ERROR_FATAL_PSF_CSC_0] = "soc-fatal-psf-csc-0",
+		[XE_GENL_SOC_ERROR_FATAL_PSF_CSC_1] = "soc-fatal-psf-csc-1",
+		[XE_GENL_SOC_ERROR_FATAL_PSF_CSC_2] = "soc-fatal-psf-csc-2",
+		[XE_GENL_SOC_ERROR_FATAL_PUNIT] = "soc-fatal-punit",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_PSF_0] = "soc-fatal-psf-0",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_PSF_1] = "soc-fatal-psf-1",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_PSF_2] = "soc-fatal-psf-2",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_CD0_MDFI] = "soc-fatal-cd0-mdfi",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_EAST] = "soc-fatal-mdfi-east",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_SOUTH] = "soc-fatal-mdfi-south",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 0)] = "soc-fatal-hbm-ss0-0",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 1)] = "soc-fatal-hbm-ss0-1",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 2)] = "soc-fatal-hbm-ss0-2",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 3)] = "soc-fatal-hbm-ss0-3",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 4)] = "soc-fatal-hbm-ss0-4",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 5)] = "soc-fatal-hbm-ss0-5",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 6)] = "soc-fatal-hbm-ss0-6",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 7)] = "soc-fatal-hbm-ss0-7",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 8)] = "soc-fatal-hbm-ss1-0",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 9)] = "soc-fatal-hbm-ss1-1",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 10)] = "soc-fatal-hbm-ss1-2",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 11)] = "soc-fatal-hbm-ss1-3",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 12)] = "soc-fatal-hbm-ss1-4",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 13)] = "soc-fatal-hbm-ss1-5",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 14)] = "soc-fatal-hbm-ss1-6",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 15)] = "soc-fatal-hbm-ss1-7",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 0)] = "soc-fatal-hbm-ss2-0",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 1)] = "soc-fatal-hbm-ss2-1",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 2)] = "soc-fatal-hbm-ss2-2",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 3)] = "soc-fatal-hbm-ss2-3",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 4)] = "soc-fatal-hbm-ss2-4",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 5)] = "soc-fatal-hbm-ss2-5",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 6)] = "soc-fatal-hbm-ss2-6",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 7)] = "soc-fatal-hbm-ss2-7",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 8)] = "soc-fatal-hbm-ss3-0",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 9)] = "soc-fatal-hbm-ss3-1",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 10)] = "soc-fatal-hbm-ss3-2",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 11)] = "soc-fatal-hbm-ss3-3",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 12)] = "soc-fatal-hbm-ss3-4",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 13)] = "soc-fatal-hbm-ss3-5",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 14)] = "soc-fatal-hbm-ss3-6",
+		[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 15)] = "soc-fatal-hbm-ss3-7",
+		[XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC] = "gsc-correctable-sram-ecc",
+		[XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = "gsc-nonfatal-mia-shutdown",
+		[XE_GENL_GSC_ERROR_NONFATAL_MIA_INT] = "gsc-nonfatal-mia-int",
+		[XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC] = "gsc-nonfatal-sram-ecc",
+		[XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = "gsc-nonfatal-wdg-timeout",
+		[XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY] = "gsc-nonfatal-rom-parity",
+		[XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY] = "gsc-nonfatal-ucode-parity",
+		[XE_GENL_GSC_ERROR_NONFATAL_GLITCH_DET] = "gsc-nonfatal-glitch-det",
+		[XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL] = "gsc-nonfatal-fuse-pull",
+		[XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = "gsc-nonfatal-fuse-crc-check",
+		[XE_GENL_GSC_ERROR_NONFATAL_FUSE_SELFMBIST] = "gsc-nonfatal-selfmbist",
+		[XE_GENL_GSC_ERROR_NONFATAL_AON_PARITY] = "gsc-nonfatal-aon-parity",
+};
+
+static const unsigned long xe_hw_error_map[] = {
+	[XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG] = XE_GT_HW_ERR_L3_SNG_CORR,
+	[XE_GENL_GT_ERROR_CORRECTABLE_GUC] = XE_GT_HW_ERR_GUC_CORR,
+	[XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER] = XE_GT_HW_ERR_SAMPLER_CORR,
+	[XE_GENL_GT_ERROR_CORRECTABLE_SLM] = XE_GT_HW_ERR_SLM_CORR,
+	[XE_GENL_GT_ERROR_CORRECTABLE_EU_IC] = XE_GT_HW_ERR_EU_IC_CORR,
+	[XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF] = XE_GT_HW_ERR_EU_GRF_CORR,
+	[XE_GENL_GT_ERROR_FATAL_ARR_BIST] = XE_GT_HW_ERR_ARR_BIST_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_L3_DOUB] = XE_GT_HW_ERR_L3_DOUB_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK] = XE_GT_HW_ERR_L3_ECC_CHK_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_GUC] = XE_GT_HW_ERR_GUC_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_IDI_PAR] = XE_GT_HW_ERR_IDI_PAR_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_SQIDI] = XE_GT_HW_ERR_SQIDI_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_SAMPLER] = XE_GT_HW_ERR_SAMPLER_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_SLM] = XE_GT_HW_ERR_SLM_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_EU_IC] = XE_GT_HW_ERR_EU_IC_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_EU_GRF] = XE_GT_HW_ERR_EU_GRF_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_FPU] = XE_GT_HW_ERR_FPU_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_TLB] = XE_GT_HW_ERR_TLB_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_L3_FABRIC] = XE_GT_HW_ERR_L3_FABRIC_FATAL,
+	[XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE] = XE_GT_HW_ERR_SUBSLICE_CORR,
+	[XE_GENL_GT_ERROR_CORRECTABLE_L3BANK] = XE_GT_HW_ERR_L3BANK_CORR,
+	[XE_GENL_GT_ERROR_FATAL_SUBSLICE] = XE_GT_HW_ERR_SUBSLICE_FATAL,
+	[XE_GENL_GT_ERROR_FATAL_L3BANK] = XE_GT_HW_ERR_L3BANK_FATAL,
+	[XE_GENL_SGUNIT_ERROR_CORRECTABLE] = XE_TILE_HW_ERR_SGUNIT_CORR,
+	[XE_GENL_SGUNIT_ERROR_NONFATAL] = XE_TILE_HW_ERR_SGUNIT_NONFATAL,
+	[XE_GENL_SGUNIT_ERROR_FATAL] = XE_TILE_HW_ERR_SGUNIT_FATAL,
+	[XE_GENL_SOC_ERROR_FATAL_PSF_CSC_0] = XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
+	[XE_GENL_SOC_ERROR_FATAL_PSF_CSC_1] = XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
+	[XE_GENL_SOC_ERROR_FATAL_PSF_CSC_2] = XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
+	[XE_GENL_SOC_ERROR_FATAL_PUNIT] = XE_SOC_HW_ERR_PUNIT_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_PSF_0] = XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_PSF_1] = XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_PSF_2] = XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_CD0_MDFI] = XE_SOC_HW_ERR_ANR_MDFI_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_EAST] = XE_SOC_HW_ERR_MDFI_T2T_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_SOUTH] = XE_SOC_HW_ERR_MDFI_T2C_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 0)] = XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 1)] = XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 2)] = XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 3)] = XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 4)] = XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 5)] = XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 6)] = XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 7)] = XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 8)] = XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 9)] = XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 10)] = XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 11)] = XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 12)] = XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 13)] = XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 14)] = XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(0, 15)] = XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 0)] = XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 1)] = XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 2)] = XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 3)] = XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 4)] = XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 5)] = XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 6)] = XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 7)] = XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 8)] = XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 9)] = XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 10)] = XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 11)] = XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 12)] = XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 13)] = XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 14)] = XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
+	[XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 15)] = XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
+	[XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC] = XE_GSC_HW_ERR_SRAM_CORR,
+	[XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = XE_GSC_HW_ERR_MIA_SHUTDOWN_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_MIA_INT] = XE_GSC_HW_ERR_MIA_INTERNAL_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC] = XE_GSC_HW_ERR_SRAM_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = XE_GSC_HW_ERR_WDG_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY] = XE_GSC_HW_ERR_ROM_PARITY_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY] = XE_GSC_HW_ERR_UCODE_PARITY_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_GLITCH_DET] = XE_GSC_HW_ERR_VLT_GLITCH_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL] = XE_GSC_HW_ERR_FUSE_PULL_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = XE_GSC_HW_ERR_FUSE_CRC_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_FUSE_SELFMBIST] = XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
+	[XE_GENL_GSC_ERROR_NONFATAL_AON_PARITY] = XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
+};
+
+static unsigned int config_gt_id(const u64 config)
+{
+	return config >> __XE_PMU_GT_SHIFT;
+}
+
+static u64 config_counter(const u64 config)
+{
+	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
+}
+
+static bool is_gt_error(const u64 config)
+{
+	unsigned int error;
+
+	error = config_counter(config);
+	if (error <= XE_GENL_GT_ERROR_FATAL_FPU)
+		return true;
+
+	return false;
+}
+
+static bool is_gt_vector_error(const u64 config)
+{
+	unsigned int error;
+
+	error = config_counter(config);
+	if (error >= XE_GENL_GT_ERROR_FATAL_TLB &&
+	    error <= XE_GENL_GT_ERROR_FATAL_L3BANK)
+		return true;
+
+	return false;
+}
+
+static bool is_pvc_invalid_gt_errors(const u64 config)
+{
+	switch (config_counter(config)) {
+	case XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG:
+	case XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER:
+	case XE_GENL_GT_ERROR_FATAL_ARR_BIST:
+	case XE_GENL_GT_ERROR_FATAL_L3_DOUB:
+	case XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK:
+	case XE_GENL_GT_ERROR_FATAL_IDI_PAR:
+	case XE_GENL_GT_ERROR_FATAL_SQIDI:
+	case XE_GENL_GT_ERROR_FATAL_SAMPLER:
+	case XE_GENL_GT_ERROR_FATAL_EU_IC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool is_gsc_hw_error(const u64 config)
+{
+	if (config_counter(config) >= XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC &&
+	    config_counter(config) <= XE_GENL_GSC_ERROR_NONFATAL_AON_PARITY)
+		return true;
+
+	return false;
+}
+
+static bool is_soc_error(const u64 config)
+{
+	if (config_counter(config) >= XE_GENL_SOC_ERROR_FATAL_PSF_CSC_0 &&
+	    config_counter(config) <= XE_GENL_PVC_SOC_ERROR_FATAL_HBM(1, 15))
+		return true;
+
+	return false;
+}
+
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+
+	if (!IS_DGFX(xe))
+		return -ENODEV;
+
+	if (gt->info.type == XE_GT_TYPE_UNINITIALIZED)
+		return -ENOENT;
+
+	/* GSC HW ERRORS are present on root tile of
+	 * platform supporting MEMORY SPARING only
+	 */
+	if (is_gsc_hw_error(config) && !(xe->info.platform == XE_PVC && !gt_id))
+		return -ENODEV;
+
+	/* GT vectors error  are valid on Platforms supporting error vectors only */
+	if (is_gt_vector_error(config) && xe->info.platform != XE_PVC)
+		return -ENODEV;
+
+	/* Skip gt errors not supported on pvc */
+	if (is_pvc_invalid_gt_errors(config) && xe->info.platform == XE_PVC)
+		return  -ENODEV;
+
+	/* FATAL FPU error is valid on PVC only */
+	if (config_counter(config) == XE_GENL_GT_ERROR_FATAL_FPU &&
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
 {
+	const unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	unsigned int id = config_counter(config);
+
+	if (is_gt_error(config) || is_gt_vector_error(config))
+		return gt->errors.count[xe_hw_error_map[id]];
+
+	return gt->tile->errors.count[xe_hw_error_map[id]];
+}
+
+int fill_error_details(struct xe_device *xe, struct genl_info *info, struct sk_buff *new_msg)
+{
+	struct nlattr *entry_attr;
+	bool counter = false;
+	struct xe_gt *gt;
+	int i, j;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_hw_error_events) !=
+		     ARRAY_SIZE(xe_hw_error_map));
+
+	if (info->genlhdr->cmd == DRM_RAS_CMD_READ_ALL)
+		counter = true;
+
+	entry_attr = nla_nest_start(new_msg, DRM_RAS_ATTR_QUERY_REPLY);
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
+			if (nla_put_string(new_msg, DRM_RAS_ATTR_ERROR_NAME, str))
+				goto err;
+			if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_ID, config, DRM_ATTR_PAD))
+				goto err;
+			if (counter) {
+				val = get_counter_value(xe, config);
+				if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD))
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
+static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
+{
+	struct xe_device *xe = to_xe_device(drm);
+	size_t msg_size = NLMSG_DEFAULT_SIZE;
+	struct sk_buff *new_msg;
+	int retries = 2;
+	void *usrhdr;
+	int ret = 0;
+
+	do {
+		new_msg = drm_genl_alloc_msg(drm, info, msg_size, &usrhdr);
+		if (!new_msg)
+			return -ENOMEM;
+
+		ret = fill_error_details(xe, info, new_msg);
+		if (!ret)
+			break;
+
+		msg_size += NLMSG_DEFAULT_SIZE;
+	} while (retries--);
+
+	if (!ret)
+		ret = drm_genl_send(new_msg, info, usrhdr);
+
+	return ret;
 }
 
 static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
 {
-	return 0;
+	struct xe_device *xe = to_xe_device(drm);
+	size_t msg_size = NLMSG_DEFAULT_SIZE;
+	struct sk_buff *new_msg;
+	void *usrhdr;
+	int ret = 0;
+	int retries = 2;
+	u64 config, val;
+
+	config = nla_get_u64(info->attrs[DRM_RAS_ATTR_ERROR_ID]);
+	ret = config_status(xe, config);
+	if (ret)
+		return ret;
+	do {
+		new_msg = drm_genl_alloc_msg(drm, info, msg_size, &usrhdr);
+		if (!new_msg)
+			return -ENOMEM;
+
+		val = get_counter_value(xe, config);
+		if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD)) {
+			msg_size += NLMSG_DEFAULT_SIZE;
+			continue;
+		}
+
+		break;
+	} while (retries--);
+
+	ret = drm_genl_send(new_msg, info, usrhdr);
+
+	return ret;
 }
 
 /* driver callbacks to DRM netlink commands*/
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c45833defcc7..d9d45adde27c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1102,6 +1102,67 @@ struct drm_xe_vm_madvise {
 #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
 #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
 
+/**
+ * DOC: XE GENL netlink event IDs
+ *
+ */
+#define XE_HW_ERROR(gt, id) \
+	((id) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+
+#define XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG		(0)
+#define XE_GENL_GT_ERROR_CORRECTABLE_GUC		(1)
+#define XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER		(2)
+#define XE_GENL_GT_ERROR_CORRECTABLE_SLM		(3)
+#define XE_GENL_GT_ERROR_CORRECTABLE_EU_IC		(4)
+#define XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF		(5)
+#define XE_GENL_GT_ERROR_FATAL_ARR_BIST			(6)
+#define XE_GENL_GT_ERROR_FATAL_L3_DOUB			(7)
+#define XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK		(8)
+#define XE_GENL_GT_ERROR_FATAL_GUC			(9)
+#define XE_GENL_GT_ERROR_FATAL_IDI_PAR			(10)
+#define XE_GENL_GT_ERROR_FATAL_SQIDI			(11)
+#define XE_GENL_GT_ERROR_FATAL_SAMPLER			(12)
+#define XE_GENL_GT_ERROR_FATAL_SLM			(13)
+#define XE_GENL_GT_ERROR_FATAL_EU_IC			(14)
+#define XE_GENL_GT_ERROR_FATAL_EU_GRF			(15)
+#define XE_GENL_GT_ERROR_FATAL_FPU			(16)
+#define XE_GENL_GT_ERROR_FATAL_TLB			(17)
+#define XE_GENL_GT_ERROR_FATAL_L3_FABRIC		(18)
+#define XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE		(19)
+#define XE_GENL_GT_ERROR_CORRECTABLE_L3BANK		(20)
+#define XE_GENL_GT_ERROR_FATAL_SUBSLICE			(21)
+#define XE_GENL_GT_ERROR_FATAL_L3BANK			(22)
+#define XE_GENL_SGUNIT_ERROR_CORRECTABLE		(23)
+#define XE_GENL_SGUNIT_ERROR_NONFATAL			(24)
+#define XE_GENL_SGUNIT_ERROR_FATAL			(25)
+#define XE_GENL_SOC_ERROR_FATAL_PSF_CSC_0		(26)
+#define XE_GENL_SOC_ERROR_FATAL_PSF_CSC_1		(27)
+#define XE_GENL_SOC_ERROR_FATAL_PSF_CSC_2		(28)
+#define XE_GENL_SOC_ERROR_FATAL_PUNIT			(29)
+#define XE_GENL_PVC_SOC_ERROR_FATAL_PSF_0		(30)
+#define XE_GENL_PVC_SOC_ERROR_FATAL_PSF_1		(31)
+#define XE_GENL_PVC_SOC_ERROR_FATAL_PSF_2		(32)
+#define XE_GENL_PVC_SOC_ERROR_FATAL_CD0_MDFI		(33)
+#define XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_EAST		(34)
+#define XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_SOUTH		(35)
+
+#define XE_GENL_PVC_SOC_ERROR_FATAL_HBM(ss, n)\
+		(XE_GENL_PVC_SOC_ERROR_FATAL_MDFI_SOUTH + 0x1 + (ss) * 0x10 + (n))
+
+/* 67 is the last ID used by SOC errors */
+#define XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC		(68)
+#define XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN		(69)
+#define XE_GENL_GSC_ERROR_NONFATAL_MIA_INT		(70)
+#define XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC		(71)
+#define XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT		(72)
+#define XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY		(73)
+#define XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY		(74)
+#define XE_GENL_GSC_ERROR_NONFATAL_GLITCH_DET		(75)
+#define XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL		(76)
+#define XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK	(77)
+#define XE_GENL_GSC_ERROR_NONFATAL_FUSE_SELFMBIST	(78)
+#define XE_GENL_GSC_ERROR_NONFATAL_AON_PARITY		(79)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

