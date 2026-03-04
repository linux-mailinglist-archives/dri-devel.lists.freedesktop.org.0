Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MhmIKjbp2kRkQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC41FB6EE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1D710E617;
	Wed,  4 Mar 2026 07:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpHuNkWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A9B10E617;
 Wed,  4 Mar 2026 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772608421; x=1804144421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yVoc3mJ+Q5b4Wfd6+pE7K5mwGiwxUT7RMHWPzkqq5T0=;
 b=JpHuNkWy/+VrcQwMHNKsVavuc+Ep0LnRxaUEEsGYNIv4HAzGPsSd0o7C
 SiSOwAdm5G7o6yBY234r3wS4GHOprY/ASSRIuSs6fkOYV5BMR+vA0Tuim
 7wktJER6qN2CjgLes/T/DT1wpmrB/jd4+sX7aREjdRpDuu2/AImWe4J/0
 BEigEERdb5256GaU2kqmTVJPAVqWeDHtXAf8GhYArT036tPHYm9FifQ+1
 6KK84jHwzM6kjZhsWzxDTSYDi04sQ89U+H7AbQdeINzvXeUDVTikbXXoG
 n5uexTs8FOLrBwTewHacv6wS6X+tbzqxSUCh9+z2wGFTpR8Er+q1wVkue Q==;
X-CSE-ConnectionGUID: GCgAIfCYSuGnlp7f4SsUxw==
X-CSE-MsgGUID: x828ivLYTi28o0Oqm35oDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61236990"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="61236990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:13:40 -0800
X-CSE-ConnectionGUID: 8LuL6k7MSCSv4X7eSec0TQ==
X-CSE-MsgGUID: VbbnOuZLRh2fxsYxjKTuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="256141249"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:13:36 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v10 5/5] drm/xe/xe_hw_error: Add support for PVC SoC errors
Date: Wed,  4 Mar 2026 13:14:12 +0530
Message-ID: <20260304074412.464435-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260304074412.464435-7-riana.tauro@intel.com>
References: <20260304074412.464435-7-riana.tauro@intel.com>
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
X-Rspamd-Queue-Id: F3DC41FB6EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Report the SoC nonfatal/fatal hardware error and update the counters.

$ sudo ynl --family drm_ras --do get-error-counter \
--json '{"node-id":0, "error-id":2}'
{'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}

Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)

v3: reorder and align arrays
    remove redundant string err
    use REG_BIT
    fix aesthic review comments (Raag)
    use only correctable/uncorrectable error severity (Aravind)

v4: fix comments
    use master as variable name
    add static_assert (Raag)

v5: remove blank lines
    fix alignment
    rename variables of base registers
    move register initialization outside loop (Raag)

v6: add macro for master local reg (Raag)
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  25 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 206 +++++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index cd17d7d7372c..046e1756c698 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -41,6 +41,7 @@
 									  DEV_ERR_STAT_NONFATAL))
 
 #define   XE_CSC_ERROR					17
+#define   XE_SOC_ERROR					16
 #define   XE_GT_ERROR					0
 
 #define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
@@ -60,4 +61,28 @@
 #define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
 							 ERR_STAT_GT_COR_VECTOR_REG(x) : \
 							 ERR_STAT_GT_FATAL_VECTOR_REG(x))
+
+#define SOC_PVC_MASTER_BASE				0x282000
+#define SOC_PVC_SLAVE_BASE				0x283000
+
+#define SOC_GCOERRSTS					0x200
+#define SOC_GNFERRSTS					0x210
+#define SOC_GLOBAL_ERR_STAT_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+									  (base) + SOC_GCOERRSTS, \
+									  (base) + SOC_GNFERRSTS))
+#define   SOC_SLAVE_IEH					REG_BIT(1)
+#define   SOC_IEH0_LOCAL_ERR_STATUS			REG_BIT(0)
+#define   SOC_IEH1_LOCAL_ERR_STATUS			REG_BIT(0)
+
+#define SOC_GSYSEVTCTL					0x264
+#define SOC_GSYSEVTCTL_REG(master, slave, x)		XE_REG(_PICK_EVEN((x), \
+									  (master) + SOC_GSYSEVTCTL, \
+									  (slave) + SOC_GSYSEVTCTL))
+
+#define SOC_LERRUNCSTS					0x280
+#define SOC_LERRCORSTS					0x294
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							       (base) + SOC_LERRCORSTS : \
+							       (base) + SOC_LERRUNCSTS)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8062a6ff98a4..2a31b430570e 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -19,6 +19,7 @@
 #define GT_HW_ERROR_MAX_ERR_BITS		16
 #define HEC_UNCORR_FW_ERR_BITS			4
 #define XE_RAS_REG_SIZE				32
+#define XE_SOC_NUM_IEH				2
 
 #define PVC_ERROR_MASK_SET(hw_err, err_bit)	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
 						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
@@ -37,6 +38,7 @@ static const char * const hec_uncorrected_fw_errors[] = {
 
 static const unsigned long xe_hw_error_map[] = {
 	[XE_GT_ERROR]	= DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,
+	[XE_SOC_ERROR]	= DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
 };
 
 enum gt_vector_regs {
@@ -63,6 +65,101 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(const enum hardware_err
 	return DRM_XE_RAS_ERR_SEV_UNCORRECTABLE;
 }
 
+static const char * const pvc_master_global_err_reg[] = {
+	[0 ... 1]	= "Undefined",
+	[2]		= "HBM SS0: Channel0",
+	[3]		= "HBM SS0: Channel1",
+	[4]		= "HBM SS0: Channel2",
+	[5]		= "HBM SS0: Channel3",
+	[6]		= "HBM SS0: Channel4",
+	[7]		= "HBM SS0: Channel5",
+	[8]		= "HBM SS0: Channel6",
+	[9]		= "HBM SS0: Channel7",
+	[10]		= "HBM SS1: Channel0",
+	[11]		= "HBM SS1: Channel1",
+	[12]		= "HBM SS1: Channel2",
+	[13]		= "HBM SS1: Channel3",
+	[14]		= "HBM SS1: Channel4",
+	[15]		= "HBM SS1: Channel5",
+	[16]		= "HBM SS1: Channel6",
+	[17]		= "HBM SS1: Channel7",
+	[18 ... 31]	= "Undefined",
+};
+static_assert(ARRAY_SIZE(pvc_master_global_err_reg) == XE_RAS_REG_SIZE);
+
+static const char * const pvc_slave_global_err_reg[] = {
+	[0]		= "Undefined",
+	[1]		= "HBM SS2: Channel0",
+	[2]		= "HBM SS2: Channel1",
+	[3]		= "HBM SS2: Channel2",
+	[4]		= "HBM SS2: Channel3",
+	[5]		= "HBM SS2: Channel4",
+	[6]		= "HBM SS2: Channel5",
+	[7]		= "HBM SS2: Channel6",
+	[8]		= "HBM SS2: Channel7",
+	[9]		= "HBM SS3: Channel0",
+	[10]		= "HBM SS3: Channel1",
+	[11]		= "HBM SS3: Channel2",
+	[12]		= "HBM SS3: Channel3",
+	[13]		= "HBM SS3: Channel4",
+	[14]		= "HBM SS3: Channel5",
+	[15]		= "HBM SS3: Channel6",
+	[16]		= "HBM SS3: Channel7",
+	[17]		= "Undefined",
+	[18]		= "ANR MDFI",
+	[19 ... 31]	= "Undefined",
+};
+static_assert(ARRAY_SIZE(pvc_slave_global_err_reg) == XE_RAS_REG_SIZE);
+
+static const char * const pvc_slave_local_fatal_err_reg[] = {
+	[0]		= "Local IEH: Malformed PCIe AER",
+	[1]		= "Local IEH: Malformed PCIe ERR",
+	[2]		= "Local IEH: UR conditions in IEH",
+	[3]		= "Local IEH: From SERR Sources",
+	[4 ... 19]	= "Undefined",
+	[20]		= "Malformed MCA error packet (HBM/Punit)",
+	[21 ... 31]	= "Undefined",
+};
+static_assert(ARRAY_SIZE(pvc_slave_local_fatal_err_reg) == XE_RAS_REG_SIZE);
+
+static const char * const pvc_master_local_fatal_err_reg[] = {
+	[0]		= "Local IEH: Malformed IOSF PCIe AER",
+	[1]		= "Local IEH: Malformed IOSF PCIe ERR",
+	[2]		= "Local IEH: UR RESPONSE",
+	[3]		= "Local IEH: From SERR SPI controller",
+	[4]		= "Base Die MDFI T2T",
+	[5]		= "Undefined",
+	[6]		= "Base Die MDFI T2C",
+	[7]		= "Undefined",
+	[8]		= "Invalid CSC PSF Command Parity",
+	[9]		= "Invalid CSC PSF Unexpected Completion",
+	[10]		= "Invalid CSC PSF Unsupported Request",
+	[11]		= "Invalid PCIe PSF Command Parity",
+	[12]		= "PCIe PSF Unexpected Completion",
+	[13]		= "PCIe PSF Unsupported Request",
+	[14 ... 19]	= "Undefined",
+	[20]		= "Malformed MCA error packet (HBM/Punit)",
+	[21 ... 31]	= "Undefined",
+};
+static_assert(ARRAY_SIZE(pvc_master_local_fatal_err_reg) == XE_RAS_REG_SIZE);
+
+static const char * const pvc_master_local_nonfatal_err_reg[] = {
+	[0 ... 3]	= "Undefined",
+	[4]		= "Base Die MDFI T2T",
+	[5]		= "Undefined",
+	[6]		= "Base Die MDFI T2C",
+	[7]		= "Undefined",
+	[8]		= "Invalid CSC PSF Command Parity",
+	[9]		= "Invalid CSC PSF Unexpected Completion",
+	[10]		= "Invalid PCIe PSF Command Parity",
+	[11 ... 31]	= "Undefined",
+};
+static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
+
+#define PVC_MASTER_LOCAL_REG_INFO(hw_err)	((hw_err == HARDWARE_ERROR_FATAL) ? \
+						 pvc_master_local_fatal_err_reg : \
+						 pvc_master_local_nonfatal_err_reg)
+
 static bool fault_inject_csc_hw_error(void)
 {
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
@@ -141,6 +238,26 @@ static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
 				    name, severity_str, i, err);
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
+	if (strcmp(name, "Undefined")) {
+		if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
+			drm_warn(&xe->drm, "%s SOC %s detected", name, severity_str);
+		else
+			drm_err_ratelimited(&xe->drm, "%s SOC %s detected", name, severity_str);
+		atomic_inc(&info[index].counter);
+	}
+}
+
 static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
 				u32 error_id)
 {
@@ -217,6 +334,92 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	}
 }
 
+static void soc_slave_ieh_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 error_id)
+{
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
+	unsigned long slave_global_errstat, slave_local_errstat;
+	struct xe_mmio *mmio = &tile->mmio;
+	u32 regbit, slave;
+
+	slave = SOC_PVC_SLAVE_BASE;
+	slave_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave, hw_err));
+
+	if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
+		slave_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(slave, hw_err));
+
+		if (hw_err == HARDWARE_ERROR_FATAL) {
+			for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE)
+				log_soc_error(tile, pvc_slave_local_fatal_err_reg, severity,
+					      regbit, error_id);
+		}
+
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave, hw_err),
+				slave_local_errstat);
+	}
+
+	for_each_set_bit(regbit, &slave_global_errstat, XE_RAS_REG_SIZE)
+		log_soc_error(tile, pvc_slave_global_err_reg, severity, regbit, error_id);
+
+	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave, hw_err), slave_global_errstat);
+}
+
+static void soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
+				 u32 error_id)
+{
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mmio *mmio = &tile->mmio;
+	unsigned long master_global_errstat, master_local_errstat;
+	u32 master, slave, regbit;
+	int i;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	master = SOC_PVC_MASTER_BASE;
+	slave = SOC_PVC_SLAVE_BASE;
+
+	/* Mask error type in GSYSEVTCTL so that no new errors of the type will be reported */
+	for (i = 0; i < XE_SOC_NUM_IEH; i++)
+		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master, slave, i), ~REG_BIT(hw_err));
+
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err), REG_GENMASK(31, 0));
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err), REG_GENMASK(31, 0));
+		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave, hw_err), REG_GENMASK(31, 0));
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave, hw_err), REG_GENMASK(31, 0));
+		goto unmask_gsysevtctl;
+	}
+
+	/*
+	 * Read the master global IEH error register, if BIT(1) is set then process
+	 * the slave IEH first. If BIT(0) in global error register is set then process
+	 * the corresponding local error registers.
+	 */
+	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err));
+	if (master_global_errstat & SOC_SLAVE_IEH)
+		soc_slave_ieh_handler(tile, hw_err, error_id);
+
+	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
+		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err));
+
+		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE)
+			log_soc_error(tile, PVC_MASTER_LOCAL_REG_INFO(hw_err), severity, regbit, error_id);
+
+		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err), master_local_errstat);
+	}
+
+	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
+		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
+
+	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err), master_global_errstat);
+
+unmask_gsysevtctl:
+	for (i = 0; i < XE_SOC_NUM_IEH; i++)
+		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master, slave, i),
+				(HARDWARE_ERROR_MAX << 1) + 1);
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
@@ -279,8 +482,11 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 					    "TILE%d reported %s %s, bit[%d] is set\n",
 					    tile->id, name, severity_str, err_bit);
 		}
+
 		if (err_bit == XE_GT_ERROR)
 			gt_hw_error_handler(tile, hw_err, error_id);
+		if (err_bit == XE_SOC_ERROR)
+			soc_hw_error_handler(tile, hw_err, error_id);
 	}
 
 clear_reg:
-- 
2.47.1

