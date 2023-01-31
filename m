Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2A683956
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 23:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE67D10E39B;
	Tue, 31 Jan 2023 22:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2410E396;
 Tue, 31 Jan 2023 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675204127; x=1706740127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lrak0xBccXTCpTCSt2RcPVBAxGd6Nu1VYPiiR1uyXWU=;
 b=B58Ky5IWysAM/oOZ9DcTXAiZ8iASMqxdW8hw9XyBzeiH/5DDZJz93E6r
 77aPcRemRZEwqkEZGwSAL0xEqWFDllrmEZh0+Vmz3R/ENOCfOUBzWq2Zk
 BvmeOQRhlZeObqJqsm+gJ0SGbdZ9r38/ALWXLWdlEQxsPOTIUh7zKQTap
 JR4d1SLSBRcQnZXT/R+vYiClgebHMY4L8lRnaJCAY2Q0SF0tb3OSWUJVe
 i85XrRvUwWnnEnK9KZ7xWqQiUpqNXL/mN/aje+HpyYxJWRnj0QWcPAPNx
 ryhcQG8y5MXxnclX7QRpNP9Ux5LiM9/d2ByZESV9bGxgZWkiIgeUurPKi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="307634384"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="307634384"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 14:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910073537"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="910073537"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 14:28:45 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.150.146])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 04EBC333E5;
 Tue, 31 Jan 2023 22:28:43 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: Add and use HuC oriented print macros
Date: Tue, 31 Jan 2023 23:28:37 +0100
Message-Id: <20230131222837.1921-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like we did it for GuC, introduce some helper print macros for
HuC to have unified format of messages that also include GT#.

While around improve some messages and use %pe if possible.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 44 ++++++++++++++------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 410905da8e97..834e3b5b8f4b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "intel_guc_reg.h"
 #include "intel_huc.h"
 #include "i915_drv.h"
@@ -13,6 +14,15 @@
 #include <linux/device/bus.h>
 #include <linux/mei_aux.h>
 
+#define huc_printk(_huc, _level, _fmt, ...) \
+	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
+#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
+#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
+#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
+#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
+#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
+#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
+
 /**
  * DOC: HuC
  *
@@ -107,11 +117,9 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 
 	if (!intel_huc_is_authenticated(huc)) {
 		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
-			drm_notice(&huc_to_gt(huc)->i915->drm,
-				   "timed out waiting for MEI GSC init to load HuC\n");
+			huc_notice(huc, "load timed out waiting for MEI GSC\n");
 		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
-			drm_notice(&huc_to_gt(huc)->i915->drm,
-				   "timed out waiting for MEI PXP init to load HuC\n");
+			huc_notice(huc, "load timed out waiting for MEI PXP\n");
 		else
 			MISSING_CASE(huc->delayed_load.status);
 
@@ -174,8 +182,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
 
 	case BUS_NOTIFY_DRIVER_NOT_BOUND: /* mei driver fails to be bound */
 	case BUS_NOTIFY_UNBIND_DRIVER: /* mei driver about to be unbound */
-		drm_info(&huc_to_gt(huc)->i915->drm,
-			 "mei driver not bound, disabling HuC load\n");
+		huc_info(huc, "MEI driver not bound, disabling load\n");
 		gsc_init_error(huc);
 		break;
 	}
@@ -193,8 +200,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
 	huc->delayed_load.nb.notifier_call = gsc_notifier;
 	ret = bus_register_notifier(bus, &huc->delayed_load.nb);
 	if (ret) {
-		drm_err(&huc_to_gt(huc)->i915->drm,
-			"failed to register GSC notifier\n");
+		huc_err(huc, "failed to register GSC notifier %pe\n", ERR_PTR(ret));
 		huc->delayed_load.nb.notifier_call = NULL;
 		gsc_init_error(huc);
 	}
@@ -306,29 +312,25 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 			      GSC_LOADS_HUC;
 
 	if (fw_needs_gsc != hw_uses_gsc) {
-		drm_err(&gt->i915->drm,
-			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
-			HUC_LOAD_MODE_STRING(fw_needs_gsc),
-			HUC_LOAD_MODE_STRING(hw_uses_gsc));
+		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
+			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
 		return -ENOEXEC;
 	}
 
 	/* make sure we can access the GSC via the mei driver if we need it */
 	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
 	    fw_needs_gsc) {
-		drm_info(&gt->i915->drm,
-			 "Can't load HuC due to missing MEI modules\n");
+		huc_info(huc, "can't load due to missing MEI modules\n");
 		return -EIO;
 	}
 
-	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
+	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
 
 	return 0;
 }
 
 int intel_huc_init(struct intel_huc *huc)
 {
-	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
 	int err;
 
 	err = check_huc_loading_mode(huc);
@@ -345,7 +347,7 @@ int intel_huc_init(struct intel_huc *huc)
 
 out:
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
-	drm_info(&i915->drm, "HuC init failed with %d\n", err);
+	huc_info(huc, "initialization failed %pe\n", ERR_PTR(err));
 	return err;
 }
 
@@ -389,13 +391,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
 	delayed_huc_load_complete(huc);
 
 	if (ret) {
-		drm_err(&gt->i915->drm, "HuC: Firmware not verified %d\n", ret);
+		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 		return ret;
 	}
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
-	drm_info(&gt->i915->drm, "HuC authenticated\n");
+	huc_info(huc, "authenticated!\n");
 	return 0;
 }
 
@@ -430,7 +432,7 @@ int intel_huc_auth(struct intel_huc *huc)
 
 	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
 	if (ret) {
-		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
+		huc_err(huc, "authentication by GuC failed %pe\n", ERR_PTR(ret));
 		goto fail;
 	}
 
@@ -442,7 +444,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	return 0;
 
 fail:
-	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
+	huc_probe_error(huc, "authentication failed %pe\n", ERR_PTR(ret));
 	return ret;
 }
 
-- 
2.25.1

