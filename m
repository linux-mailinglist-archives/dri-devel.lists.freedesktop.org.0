Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C11636A24
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C79D10E60F;
	Wed, 23 Nov 2022 19:51:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5879E10E603;
 Wed, 23 Nov 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669233090; x=1700769090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4B0xGU4xjeKmJ2rZRm6Z3APJgbcrUz3yNd3InUQj6mI=;
 b=Al0WE8KOxr02PV+nDht9Rc8ywQ454t5i6gnItxfFmFCYS1fiI+wB4XXy
 v1Jsh4q/k5IsKQxBzHtu33HlbgV23Bwyatz0oI/TeEqtWd+XIwXqh0Gfh
 4llvebbVjUdX2E+Pxo1mARyLrM5dFIivBBrDdg6SN5sh4zylc+acy47EA
 rFeuOBRolYvqAfDtVxgic2GYNp14eP4rI2p2ZVfV7kA6KSUJ/BEP88CQo
 rAIOtaLixb8t2dG0nkeuvf7jxx4/1Egnjq3F/VBuDEjP/4PKubb7DkNSU
 akcbMz+6WzCILt/b5lcKhjknFjt5olMG3Ubn2PCk5hDDDeqwGybbZ+/3M g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="312846854"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="312846854"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 11:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="816597791"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="816597791"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 11:51:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 2/5] drm/i915/huc: Add HuC specific debug print wrappers
Date: Wed, 23 Nov 2022 11:51:20 -0800
Message-Id: <20221123195123.1525100-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
References: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Create a set of HuC printers and start using them.

v2: Minor tweaks (review feedback from MichalW).
Split definitions into separate header (review feedback from Jani).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c       | 32 ++++++++------------
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h | 30 ++++++++++++++++++
 2 files changed, 43 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index be855811d85df..7656c6c423154 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -8,6 +8,7 @@
 #include "gt/intel_gt.h"
 #include "intel_guc_reg.h"
 #include "intel_huc.h"
+#include "intel_huc_print.h"
 #include "i915_drv.h"
 
 #include <linux/device/bus.h>
@@ -107,11 +108,9 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 
 	if (!intel_huc_is_authenticated(huc)) {
 		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
-			drm_notice(&huc_to_gt(huc)->i915->drm,
-				   "timed out waiting for MEI GSC init to load HuC\n");
+			huc_notice(huc, "Timed out waiting for MEI GSC init to load FW\n");
 		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
-			drm_notice(&huc_to_gt(huc)->i915->drm,
-				   "timed out waiting for MEI PXP init to load HuC\n");
+			huc_notice(huc, "Timed out waiting for MEI PXP init to load FW\n");
 		else
 			MISSING_CASE(huc->delayed_load.status);
 
@@ -174,8 +173,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
 
 	case BUS_NOTIFY_DRIVER_NOT_BOUND: /* mei driver fails to be bound */
 	case BUS_NOTIFY_UNBIND_DRIVER: /* mei driver about to be unbound */
-		drm_info(&huc_to_gt(huc)->i915->drm,
-			 "mei driver not bound, disabling HuC load\n");
+		huc_info(huc, "- mei driver not bound, disabling HuC load\n");
 		gsc_init_error(huc);
 		break;
 	}
@@ -193,8 +191,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
 	huc->delayed_load.nb.notifier_call = gsc_notifier;
 	ret = bus_register_notifier(bus, &huc->delayed_load.nb);
 	if (ret) {
-		drm_err(&huc_to_gt(huc)->i915->drm,
-			"failed to register GSC notifier\n");
+		huc_err(huc, "Failed to register GSC notifier\n");
 		huc->delayed_load.nb.notifier_call = NULL;
 		gsc_init_error(huc);
 	}
@@ -284,8 +281,7 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 			      GSC_LOADS_HUC;
 
 	if (fw_needs_gsc != hw_uses_gsc) {
-		drm_err(&gt->i915->drm,
-			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
+		huc_err(huc, "Mismatch between FW (%s) and HW (%s) load modes\n",
 			HUC_LOAD_MODE_STRING(fw_needs_gsc),
 			HUC_LOAD_MODE_STRING(hw_uses_gsc));
 		return -ENOEXEC;
@@ -294,19 +290,17 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 	/* make sure we can access the GSC via the mei driver if we need it */
 	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
 	    fw_needs_gsc) {
-		drm_info(&gt->i915->drm,
-			 "Can't load HuC due to missing MEI modules\n");
+		huc_info(huc, "Can't load due to missing MEI modules\n");
 		return -EIO;
 	}
 
-	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
+	huc_dbg(huc, "load by GSC: %s\n", str_yes_no(fw_needs_gsc));
 
 	return 0;
 }
 
 int intel_huc_init(struct intel_huc *huc)
 {
-	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
 	int err;
 
 	err = check_huc_loading_mode(huc);
@@ -323,7 +317,7 @@ int intel_huc_init(struct intel_huc *huc)
 
 out:
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
-	drm_info(&i915->drm, "HuC init failed with %d\n", err);
+	huc_info(huc, "init failed with %d\n", err);
 	return err;
 }
 
@@ -366,13 +360,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
 	delayed_huc_load_complete(huc);
 
 	if (ret) {
-		drm_err(&gt->i915->drm, "HuC: Firmware not verified %d\n", ret);
+		huc_err(huc, "firmware not verified %d\n", ret);
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 		return ret;
 	}
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
-	drm_info(&gt->i915->drm, "HuC authenticated\n");
+	huc_info(huc, "authenticated\n");
 	return 0;
 }
 
@@ -407,7 +401,7 @@ int intel_huc_auth(struct intel_huc *huc)
 
 	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
 	if (ret) {
-		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
+		huc_err(huc, "auth request not acked by GuC: %d\n", ret);
 		goto fail;
 	}
 
@@ -419,7 +413,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	return 0;
 
 fail:
-	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
+	huc_probe_error(huc, "authentication failed %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
new file mode 100644
index 0000000000000..de74c66547bf5
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _INTEL_HUC_PRINT_H_
+#define _INTEL_HUC_PRINT_H_
+
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
+
+#define huc_err(_huc, _fmt, ...) \
+	gt_err(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
+
+#define huc_warn(_huc, _fmt, ...) \
+	gt_warn(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
+
+#define huc_notice(_huc, _fmt, ...) \
+	gt_notice(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
+
+#define huc_info(_huc, _fmt, ...) \
+	gt_info(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
+
+#define huc_dbg(_huc, _fmt, ...) \
+	gt_dbg(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
+
+#define huc_probe_error(_huc, _fmt, ...) \
+	gt_probe_error(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
+
+#endif
-- 
2.37.3

