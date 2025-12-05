Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B0CA6A0F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B9110EA32;
	Fri,  5 Dec 2025 08:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IG7isTnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1666110EA33;
 Fri,  5 Dec 2025 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764922284; x=1796458284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDHB8G6mUKCiYrHrQiHgGWJJDRkKQDqScykCG2xy9J8=;
 b=IG7isTnDVT+I5/NMlGHDOtY8/f8yQ0TUaKQYxapPD0SoBcv5kOPWyCcK
 mnlcYiuR8E4qmEPWJ0medIwzZmBIcc35nLUAB17m9pWB9hYZJwGJiSey2
 h5zFxhRO5caGepKX6OZ6g0EflK+88AxZnWRwOfyQ3o9zN90KhGmatzIj5
 Pbxqo1xBstLYYGqY7sk1AUEKRW6+yrpyyCogJ/k2s07H9/aleplXb4vP9
 dQPF6qO+WUxzP3Pv0khFBCiH6iFJssgoEoeDZn1EH30jOINn+YJ9z7tym
 lQEim90kTMyWPZJmzL/3wVrhaBZQoDfjwowen4D+FMCErCdVeBFjnEmG9 w==;
X-CSE-ConnectionGUID: t8IwNLu3QlCjmeAr0CsX3Q==
X-CSE-MsgGUID: TU8WgN/oQP+ysP9MZYUWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77572010"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="77572010"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:11:24 -0800
X-CSE-ConnectionGUID: RBOWg4nYQ8enUxPWvGdlvw==
X-CSE-MsgGUID: YEwBeUXLSU6PYUGQWKDU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="225890188"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:11:20 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 4/4] drm/xe/xe_hw_error: Add support for PVC SOC errors
Date: Fri,  5 Dec 2025 14:09:36 +0530
Message-ID: <20251205083934.3602030-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251205083934.3602030-6-riana.tauro@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
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

Report the SOC nonfatal/fatal hardware error and update the counters.

Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  24 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 202 +++++++++++++++++++++
 2 files changed, 226 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index b54712e893d5..3280af41f79f 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -40,6 +40,7 @@
 								  DEV_ERR_STAT_NONFATAL))
 
 #define   XE_CSC_ERROR				BIT(17)
+#define   XE_SOC_ERROR				BIT(16)
 #define   XE_GT_ERROR				BIT(0)
 
 #define  ERR_STAT_GT_FATAL_VECTOR_0		0x100260
@@ -61,4 +62,27 @@
 						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
 						 ERR_STAT_GT_FATAL_VECTOR_REG(x))
 
+#define SOC_PVC_BASE				0x282000
+#define SOC_PVC_SLAVE_BASE			0x283000
+
+#define SOC_GCOERRSTS				0x200
+#define SOC_GNFERRSTS				0x210
+#define SOC_GLOBAL_ERR_STAT_REG(base, x)	XE_REG(_PICK_EVEN((x), \
+								  (base) + SOC_GCOERRSTS, \
+								  (base) + SOC_GNFERRSTS))
+#define   SOC_SLAVE_IEH				BIT(1)
+#define   SOC_IEH0_LOCAL_ERR_STATUS		BIT(0)
+#define   SOC_IEH1_LOCAL_ERR_STATUS		BIT(0)
+
+#define SOC_GSYSEVTCTL				0x264
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)	XE_REG(_PICK_EVEN((x), \
+								  (base) + SOC_GSYSEVTCTL, \
+								  slave_base + SOC_GSYSEVTCTL))
+
+#define SOC_LERRUNCSTS				0x280
+#define SOC_LERRCORSTS				0x294
+#define SOC_LOCAL_ERR_STAT_REG(base, x)		XE_REG(x == DRM_XE_RAS_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 77c90f1b06fd..1b7c782dbd98 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -18,6 +18,7 @@
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
 #define XE_RAS_REG_SIZE 32
+#define XE_SOC_NUM_IEH 2
 
 extern struct fault_attr inject_csc_hw_error;
 static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
@@ -34,6 +35,7 @@ static const char * const hec_uncorrected_fw_errors[] = {
 
 static const unsigned long xe_hw_error_map[] = {
 	ERR_INDEX(XE_GT_ERROR, DRM_XE_RAS_ERROR_CORE_COMPUTE),
+	ERR_INDEX(XE_SOC_ERROR, DRM_XE_RAS_ERROR_SOC_INTERNAL),
 };
 
 enum gt_vector_regs {
@@ -48,6 +50,92 @@ enum gt_vector_regs {
 	ERR_STAT_GT_VECTOR_MAX,
 };
 
+static const char * const pvc_slave_local_fatal_err_reg[] = {
+	[0]		= "Local IEH internal: Malformed PCIe AER",
+	[1]		= "Local IEH internal: Malformed PCIe ERR",
+	[2]		= "Local IEH internal: UR conditions in IEH",
+	[3]		= "Local IEH internal: From SERR Sources",
+	[4 ... 19]	= "Undefined",
+	[20]		= "Malformed MCA error packet (HBM/Punit)",
+	[21 ... 31]	= "Undefined",
+};
+
+static const char * const pvc_slave_global_err_reg[] = {
+	[0]         = "Undefined",
+	[1]         = "HBM SS2: Channel0",
+	[2]         = "HBM SS2: Channel1",
+	[3]         = "HBM SS2: Channel2",
+	[4]         = "HBM SS2: Channel3",
+	[5]         = "HBM SS2: Channel4",
+	[6]         = "HBM SS2: Channel5",
+	[7]         = "HBM SS2: Channel6",
+	[8]         = "HBM SS2: Channel7",
+	[9]         = "HBM SS3: Channel0",
+	[10]        = "HBM SS3: Channel1",
+	[11]        = "HBM SS3: Channel2",
+	[12]        = "HBM SS3: Channel3",
+	[13]        = "HBM SS3: Channel4",
+	[14]        = "HBM SS3: Channel5",
+	[15]        = "HBM SS3: Channel6",
+	[16]        = "HBM SS3: Channel7",
+	[17]        = "Undefined",
+	[18]        = "ANR MDFI",
+	[19 ... 31] = "Undefined",
+};
+
+static const char * const pvc_master_global_err_reg[] = {
+	[0 ... 1]   = "Undefined",
+	[2]         =  "HBM SS0: Channel0",
+	[3]         =  "HBM SS0: Channel1",
+	[4]         =  "HBM SS0: Channel2",
+	[5]         =  "HBM SS0: Channel3",
+	[6]         =  "HBM SS0: Channel4",
+	[7]         =  "HBM SS0: Channel5",
+	[8]         =  "HBM SS0: Channel6",
+	[9]         =  "HBM SS0: Channel7",
+	[10]        =  "HBM SS1: Channel0",
+	[11]        =  "HBM SS1: Channel1",
+	[12]        =  "HBM SS1: Channel2",
+	[13]        =  "HBM SS1: Channel3",
+	[14]        =  "HBM SS1: Channel4",
+	[15]        =  "HBM SS1: Channel5",
+	[16]        =  "HBM SS1: Channel6",
+	[17]        =  "HBM SS1: Channel7",
+	[18 ... 31] = "Undefined",
+};
+
+static const char * const pvc_master_local_fatal_err_reg[] = {
+	[0]         = "Local IEH internal: Malformed IOSF PCIe AER",
+	[1]         = "Local IEH internal: Malformed IOSF PCIe ERR",
+	[2]         = "Local IEH internal: IEH UR RESPONSE",
+	[3]         = "Local IEH internal: From SERR SPI controller",
+	[4]         = "Base Die MDFI T2T",
+	[5]         = "Undefined",
+	[6]         = "Base Die MDFI T2C",
+	[7]         = "Undefined",
+	[8]         = "Invalid CSC PSF Command Parity",
+	[9]         = "Invalid CSC PSF Unexpected Completion",
+	[10]        = "Invalid CSC PSF Unsupported Request",
+	[11]        = "Invalid PCIe PSF Command Parity",
+	[12]        = "PCIe PSF Unexpected Completion",
+	[13]        = "PCIe PSF Unsupported Request",
+	[14 ... 19] = "Undefined",
+	[20]        = "Malformed MCA error packet (HBM/Punit)",
+	[21 ... 31] = "Undefined",
+};
+
+static const char * const pvc_master_local_nonfatal_err_reg[] = {
+	[0 ... 3]   = "Undefined",
+	[4]         = "Base Die MDFI T2T",
+	[5]         = "Undefined",
+	[6]         = "Base Die MDFI T2C",
+	[7]         = "Undefined",
+	[8]         = "Invalid CSC PSF Command Parity",
+	[9]         = "Invalid CSC PSF Unexpected Completion",
+	[10]        = "Invalid PCIe PSF Command Parity",
+	[11 ... 31] = "Undefined",
+};
+
 static bool fault_inject_csc_hw_error(void)
 {
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
@@ -197,6 +285,117 @@ static void gt_handle_errors(struct xe_tile *tile,
 	}
 }
 
+static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
+			  const enum drm_xe_ras_error_severity severity, u32 err_bit, u32 index)
+{
+	const char *severity_str = error_severity[severity];
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[severity];
+	const char *name;
+
+	name = reg_info[err_bit];
+
+	if (strcmp(name, "Undefined") != 0) {
+		if (severity == DRM_XE_RAS_ERROR_FATAL)
+			drm_err_ratelimited(&xe->drm, "%s SOC %s error detected",
+					    name, severity_str);
+		else
+			drm_warn(&xe->drm, "%s SOC %s error detected", name, severity_str);
+		atomic64_inc(&info[index].counter);
+	}
+}
+
+static void soc_hw_error_handler(struct xe_tile *tile,
+				 const enum drm_xe_ras_error_severity severity, u32 error_id)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mmio *mmio = &tile->mmio;
+	unsigned long master_global_errstat, slave_global_errstat;
+	unsigned long master_local_errstat, slave_local_errstat;
+	u32 base, slave_base, regbit;
+	int i;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+
+	/*
+	 * Mask error type in GSYSEVTCTL so that no new errors of the type will be reported
+	 */
+	for (i = 0; i < XE_SOC_NUM_IEH; i++)
+		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(severity));
+
+	if (severity == DRM_XE_RAS_ERROR_CORRECTABLE) {
+		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity), REG_GENMASK(31, 0));
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(base, severity), REG_GENMASK(31, 0));
+		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, severity),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, severity),
+				REG_GENMASK(31, 0));
+		goto unmask_gsysevtctl;
+	}
+
+	/*
+	 * Read the master global IEH error register if
+	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
+	 * global error register is set then process the corresponding
+	 * Local error registers
+	 */
+	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity));
+	if (master_global_errstat & SOC_SLAVE_IEH) {
+		slave_global_errstat = xe_mmio_read32(mmio,
+						      SOC_GLOBAL_ERR_STAT_REG(slave_base, severity));
+		if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
+			slave_local_errstat = xe_mmio_read32(mmio,
+							     SOC_LOCAL_ERR_STAT_REG(slave_base,
+										    severity));
+
+			for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE) {
+				if (severity == DRM_XE_RAS_ERROR_FATAL)
+					log_soc_error(tile, pvc_slave_local_fatal_err_reg, severity,
+						      regbit, error_id);
+			}
+
+			xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, severity),
+					slave_local_errstat);
+		}
+
+		for_each_set_bit(regbit, &slave_global_errstat, XE_RAS_REG_SIZE)
+			log_soc_error(tile, pvc_slave_global_err_reg, severity, regbit, error_id);
+
+		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, severity),
+				slave_global_errstat);
+	}
+
+	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
+		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(base, severity));
+
+		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE) {
+			if (severity == DRM_XE_RAS_ERROR_FATAL)
+				log_soc_error(tile, pvc_master_local_fatal_err_reg, severity,
+					      regbit, error_id);
+			if (severity == DRM_XE_RAS_ERROR_NONFATAL)
+				log_soc_error(tile, pvc_master_local_nonfatal_err_reg, severity,
+					      regbit, error_id);
+		}
+
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(base, severity), master_local_errstat);
+	}
+
+	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
+		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
+
+	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity), master_global_errstat);
+
+unmask_gsysevtctl:
+	for (i = 0; i < XE_SOC_NUM_IEH; i++)
+		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+				(DRM_XE_RAS_ERROR_SEVERITY_MAX << 1) + 1);
+}
+
 static void gt_hw_error_handler(struct xe_tile *tile,
 				const enum drm_xe_ras_error_severity severity, u32 error_id)
 {
@@ -269,6 +468,9 @@ static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_
 		}
 		if (BIT(err_bit) & XE_GT_ERROR)
 			gt_hw_error_handler(tile, severity, error_id);
+
+		if (BIT(err_bit) == XE_SOC_ERROR)
+			soc_hw_error_handler(tile, severity, error_id);
 	}
 
 clear_reg:
-- 
2.47.1

