Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MbuB65AgGlJ5QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:14:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C145FC88F5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1212510E265;
	Mon,  2 Feb 2026 06:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vbc7HUv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32D310E25C;
 Mon,  2 Feb 2026 06:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770012842; x=1801548842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BB+YPUjdUv4XDXlc5PYMEA6jV485XRescbdlYFA+f/I=;
 b=Vbc7HUv2pj8mWUK1gpzG95jlYutfIvUiyq6LVa6P5Td1TQeWb1wzULc4
 ECdch8qBSDUCbotrigSTYL4CMj433GhFU4m470/BpvvlfvG+GbuHOm9iO
 1/eDd7uys8q21WbKwisi07pDKu4z7vU/13tusqEuA8pU8lqVydJEV8sAx
 WiV26aS+7aIUtjLcyvPbIpeqt229vQylv6cINJs/NNIw1T/7SPHq2sQnr
 9f5ucyuRW3mKKjJigYmciVnG1fOfmCIDjA1blP75jXASmNrqryBpyeTyX
 ZeKBOPPnXuokoCvE5U9LXYUBorUQrArxJrd4MGw45nkye7As2jCEWbd6m g==;
X-CSE-ConnectionGUID: 57Nu1xnbQIOxUXciGkJscQ==
X-CSE-MsgGUID: WJccdxBCRruBnwX2mnLmDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71250447"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71250447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:14:01 -0800
X-CSE-ConnectionGUID: 9Yt2LcVtSVuiW93xwAVj/g==
X-CSE-MsgGUID: JQzc8siPT6ebxMq41wUqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209720011"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:13:58 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v5 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with hardware
 error handling
Date: Mon,  2 Feb 2026 12:13:59 +0530
Message-ID: <20260202064356.286243-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260202064356.286243-7-riana.tauro@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: C145FC88F5
X-Rspamd-Action: no action

Initialize DRM RAS in hw error init. Map the UAPI error severities
with the hardware error severities and refactor file.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  8 ++++
 drivers/gpu/drm/xe/xe_hw_error.c      | 68 ++++++++++++++++-----------
 2 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 0ac4ae324f37..beed48811d6a 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -11,6 +11,14 @@
 
 struct drm_ras_node;
 
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
 /**
  * struct xe_drm_ras_counter - XE RAS counter
  *
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..2019aaaa1ebe 100644
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
+static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_err)
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
+					    "HEC FW %s error reported, bit[%d] is set\n",
+					     hec_uncorrected_fw_errors[err_bit],
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
 
@@ -146,6 +139,20 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 			hw_error_source_handler(tile, hw_err);
 }
 
+static int hw_error_info_init(struct xe_device *xe)
+{
+	int ret;
+
+	if (xe->info.platform != XE_PVC)
+		return 0;
+
+	ret = xe_drm_ras_allocate_nodes(xe);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Process hardware errors during boot
  */
@@ -172,11 +179,16 @@ static void process_hw_errors(struct xe_device *xe)
 void xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
+	ret = hw_error_info_init(xe);
+	if (ret)
+		drm_warn(&xe->drm, "Failed to allocate DRM RAS nodes\n");
+
 	process_hw_errors(xe);
 }
-- 
2.47.1

