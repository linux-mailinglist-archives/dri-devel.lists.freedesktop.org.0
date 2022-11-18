Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123362EB7E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 02:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75A410E6DC;
	Fri, 18 Nov 2022 01:59:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AA110E6D9;
 Fri, 18 Nov 2022 01:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736755; x=1700272755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RrzlnsEZMesWvXqM3XDOu9nmY8zCWTmYSu5t/+airg=;
 b=N/1tg9YdBMcVXmZdGreiOjlnQtqTVUYPeB9MJgJudKIQSBPkLpj/sUFl
 bgRsSrp84vRPzQJEwbLlbiWjOtMdTlXscSeYiuvUzBsIrmLCboyPAzbK6
 6jrXCVR+NoJ3DfnTvEuLgXs/4/rI+5t4by+DYN2yiqJD+ZpQ/tnl5QY+8
 IBd+OTkaBp6k2s/cGwVfNRGguRsuuozZSRIFqfPVLcMljlZAafpkpU2XQ
 EW93UJoLu3A4VqQOhI2e+YnC22Yzg4M+DnjD4+myUC55AIrz+IJtQLNbl
 j9CiIgIrfyh5I5k4GTCxL3CaoguW3f6AXrBZ/lhocUZV4hNi6EJlmxz7Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="300565829"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="300565829"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703563417"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="703563417"
Received: from relo-linux-5.jf.intel.com ([10.165.21.143])
 by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2022 17:59:13 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/5] drm/i915/huc: Add HuC specific debug print wrappers
Date: Thu, 17 Nov 2022 17:58:55 -0800
Message-Id: <20221118015858.2548106-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
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

Create a set of HuC printers and start using them.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 31 ++++++++++----------------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h | 23 +++++++++++++++++++
 2 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index be855811d85df..0bbbc7192da63 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -107,11 +107,9 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 
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
 
@@ -174,8 +172,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
 
 	case BUS_NOTIFY_DRIVER_NOT_BOUND: /* mei driver fails to be bound */
 	case BUS_NOTIFY_UNBIND_DRIVER: /* mei driver about to be unbound */
-		drm_info(&huc_to_gt(huc)->i915->drm,
-			 "mei driver not bound, disabling HuC load\n");
+		huc_info(huc, "- mei driver not bound, disabling HuC load\n");
 		gsc_init_error(huc);
 		break;
 	}
@@ -193,8 +190,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
 	huc->delayed_load.nb.notifier_call = gsc_notifier;
 	ret = bus_register_notifier(bus, &huc->delayed_load.nb);
 	if (ret) {
-		drm_err(&huc_to_gt(huc)->i915->drm,
-			"failed to register GSC notifier\n");
+		huc_err(huc, "Failed to register GSC notifier\n");
 		huc->delayed_load.nb.notifier_call = NULL;
 		gsc_init_error(huc);
 	}
@@ -284,8 +280,7 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 			      GSC_LOADS_HUC;
 
 	if (fw_needs_gsc != hw_uses_gsc) {
-		drm_err(&gt->i915->drm,
-			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
+		huc_err(huc, "Mismatch between FW (%s) and HW (%s) load modes\n",
 			HUC_LOAD_MODE_STRING(fw_needs_gsc),
 			HUC_LOAD_MODE_STRING(hw_uses_gsc));
 		return -ENOEXEC;
@@ -294,19 +289,17 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 	/* make sure we can access the GSC via the mei driver if we need it */
 	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
 	    fw_needs_gsc) {
-		drm_info(&gt->i915->drm,
-			 "Can't load HuC due to missing MEI modules\n");
+		huc_info(huc, "Can't load due to missing MEI modules\n");
 		return -EIO;
 	}
 
-	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
+	huc_dbg(huc, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
 
 	return 0;
 }
 
 int intel_huc_init(struct intel_huc *huc)
 {
-	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
 	int err;
 
 	err = check_huc_loading_mode(huc);
@@ -323,7 +316,7 @@ int intel_huc_init(struct intel_huc *huc)
 
 out:
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
-	drm_info(&i915->drm, "HuC init failed with %d\n", err);
+	huc_info(huc, "init failed with %d\n", err);
 	return err;
 }
 
@@ -366,13 +359,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
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
 
@@ -407,7 +400,7 @@ int intel_huc_auth(struct intel_huc *huc)
 
 	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
 	if (ret) {
-		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
+		huc_err(huc, "auth request not acked by GuC: %d\n", ret);
 		goto fail;
 	}
 
@@ -419,7 +412,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	return 0;
 
 fail:
-	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
+	huc_probe_error(huc, "authentication failed %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 52db03620c609..f253c1c19f12f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -16,6 +16,29 @@
 
 struct bus_type;
 
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
+	do { \
+		if (i915_error_injected()) \
+			huc_dbg(_huc, _fmt, ##__VA_ARGS__); \
+		else \
+			huc_err(_huc, _fmt, ##__VA_ARGS__); \
+	} while (0)
+
 enum intel_huc_delayed_load_status {
 	INTEL_HUC_WAITING_ON_GSC = 0,
 	INTEL_HUC_WAITING_ON_PXP,
-- 
2.37.3

