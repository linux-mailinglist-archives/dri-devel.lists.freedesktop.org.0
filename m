Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF2vFJvbp2kRkQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:13:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE041FB6E0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF0010E0D8;
	Wed,  4 Mar 2026 07:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rxq0ySwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077EC10E0D8;
 Wed,  4 Mar 2026 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772608407; x=1804144407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xoIUP1jVLvvoxcoJ31IffsEzAR5yPeKVSZRsi5eZxo=;
 b=Rxq0ySwHZRxd/xO6vSc2S6J9ErAkr49KOkK/nCFddZGC2QLXcI3Nl+dK
 pZACb8i4KDhds9gwui2OeVEVTysnPNO2YpM5NHrdV8uVIN4doFQt7Z/ua
 o165ktGNZvS7beu8wvRtxc6bmaQgUXqqAs3twoxk6bI/7EUooB06Av1NE
 /qhz5RN5yHakGjUIuuCKjEvewQwMFegg5rtsgsHo7p+hLvydeNhXayUaP
 TxAwwVHPsgXlotWTCZUI4a09QmGlWHrRDgcGcHyDPcxi6VS0RWl+4w4IK
 IegLq8aA3vZt9/SdZN4PXfZaoFoBoYJjvyecjMgY44WcHIsahi0lbif2A Q==;
X-CSE-ConnectionGUID: KOHFVB32RqyY2xYm7oXIBQ==
X-CSE-MsgGUID: ardbL6/DSh66ImhFq7BUZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61236971"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="61236971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:13:26 -0800
X-CSE-ConnectionGUID: SRnIk0HwT6iQheIFxbSOdQ==
X-CSE-MsgGUID: nzqGxggJTYm2n3BIQ5Czog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="256141195"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:13:22 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v10 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with hardware
 error handling
Date: Wed,  4 Mar 2026 13:14:10 +0530
Message-ID: <20260304074412.464435-10-riana.tauro@intel.com>
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
X-Rspamd-Queue-Id: CFE041FB6E0
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
	RCPT_COUNT_TWELVE(0.00)[16];
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

Initialize DRM RAS in hw error init. Map the UAPI error severities
with the hardware error severities and refactor file.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Fix harware error enum
    add severity_str in csc handler
    simplify hw_error_info_init() function
    use drm_err if initialization fails (Raag)

v3: print error on failure (Raag)

v4: use const (Raag)
---
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  8 ++++
 drivers/gpu/drm/xe/xe_hw_error.c      | 62 +++++++++++++++------------
 2 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 7acc5e7377b2..8d729ad6a264 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -11,6 +11,14 @@
 
 struct drm_ras_node;
 
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL,
+	HARDWARE_ERROR_FATAL,
+	HARDWARE_ERROR_MAX
+};
+
 /**
  * struct xe_drm_ras_counter - XE RAS counter
  *
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..baae050163df 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -10,20 +10,16 @@
 #include "regs/xe_irq_regs.h"
 
 #include "xe_device.h"
+#include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_survivability_mode.h"
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
+
 extern struct fault_attr inject_csc_hw_error;
 
-/* Error categories reported by hardware */
-enum hardware_error {
-	HARDWARE_ERROR_CORRECTABLE = 0,
-	HARDWARE_ERROR_NONFATAL = 1,
-	HARDWARE_ERROR_FATAL = 2,
-	HARDWARE_ERROR_MAX,
-};
+static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
 static const char * const hec_uncorrected_fw_errors[] = {
 	"Fatal",
@@ -32,23 +28,18 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
-static const char *hw_error_to_str(const enum hardware_error hw_err)
+static bool fault_inject_csc_hw_error(void)
 {
-	switch (hw_err) {
-	case HARDWARE_ERROR_CORRECTABLE:
-		return "CORRECTABLE";
-	case HARDWARE_ERROR_NONFATAL:
-		return "NONFATAL";
-	case HARDWARE_ERROR_FATAL:
-		return "FATAL";
-	default:
-		return "UNKNOWN";
-	}
+	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
 }
 
-static bool fault_inject_csc_hw_error(void)
+static enum drm_xe_ras_error_severity hw_err_to_severity(const enum hardware_error hw_err)
 {
-	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
+		return DRM_XE_RAS_ERR_SEV_CORRECTABLE;
+
+	/* Uncorrectable errors comprise of both fatal and non-fatal errors */
+	return DRM_XE_RAS_ERR_SEV_UNCORRECTABLE;
 }
 
 static void csc_hw_error_work(struct work_struct *work)
@@ -64,7 +55,8 @@ static void csc_hw_error_work(struct work_struct *work)
 
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
-	const char *hw_err_str = hw_error_to_str(hw_err);
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
+	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_mmio *mmio = &tile->mmio;
 	u32 base, err_bit, err_src;
@@ -77,8 +69,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	lockdep_assert_held(&xe->irq.lock);
 	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
 	if (!err_src) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
-				    tile->id, hw_err_str);
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s HEC_ERR_STATUS register blank\n",
+				    tile->id, severity_str);
 		return;
 	}
 
@@ -86,8 +78,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
 		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
 			drm_err_ratelimited(&xe->drm, HW_ERR
-					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
-					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
+					    "HEC FW %s %s reported, bit[%d] is set\n",
+					     hec_uncorrected_fw_errors[err_bit], severity_str,
 					     err_bit);
 
 			schedule_work(&tile->csc_hw_error_work);
@@ -99,7 +91,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
-	const char *hw_err_str = hw_error_to_str(hw_err);
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
+	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
 	unsigned long flags;
 	u32 err_src;
@@ -110,8 +103,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	spin_lock_irqsave(&xe->irq.lock, flags);
 	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
 	if (!err_src) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported DEV_ERR_STAT_%s blank!\n",
-				    tile->id, hw_err_str);
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s DEV_ERR_STAT register blank!\n",
+				    tile->id, severity_str);
 		goto unlock;
 	}
 
@@ -146,6 +139,14 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 			hw_error_source_handler(tile, hw_err);
 }
 
+static int hw_error_info_init(struct xe_device *xe)
+{
+	if (xe->info.platform != XE_PVC)
+		return 0;
+
+	return xe_drm_ras_init(xe);
+}
+
 /*
  * Process hardware errors during boot
  */
@@ -172,11 +173,16 @@ static void process_hw_errors(struct xe_device *xe)
 void xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
+	ret = hw_error_info_init(xe);
+	if (ret)
+		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
+
 	process_hw_errors(xe);
 }
-- 
2.47.1

