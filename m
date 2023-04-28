Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB656F106A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C4310EC38;
	Fri, 28 Apr 2023 02:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850210EC2D;
 Fri, 28 Apr 2023 02:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682649276; x=1714185276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z6DBCXkSLGNfhzPh4kG7M+YXLRT4gPrB7nz6QGPzJPo=;
 b=Yf+ivdFeXrcf8UmmMdpAA4+TvgZ3sNDZqGMBZvvT9kLwQ8NzAV0b690z
 Hc5+v9Lgl+bd98QfmojrpGcwgzQaTp+pCndGoI9Iwvo/yHZXVon2AcdLw
 yF9OoCWR+mrfrhrYeTovIDg002k8W/0VDl+AlAt9cdb42TFWOms+KBpiH
 Lgk6rMXOe/tujU4pGPCbltXm+BRs/ZWRcBcH/NuclgjQOklI6zn/MgbJC
 xqQj8+wi1FQUr8uMeMrAUwUQnZJgXhPyekvn1rev4znn5B1k0Xr2krrJI
 eAcimyd9S/6AcOFbkNcj54q4FtwmsR7V/79+rDo+M8JaTlrOqvkzsTe6c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346386507"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346386507"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="644937230"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="644937230"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/huc: differentiate the 2 steps of the MTL HuC
 auth flow
Date: Thu, 27 Apr 2023 19:34:13 -0700
Message-Id: <20230428023416.4051910-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
References: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before we add the second step of the MTL HuC auth (via GSC), we need to
have the ability to differentiate between them. To do so, the huc
authentication check is duplicated for GuC and GSC auth, with meu
binaries being considered fully authenticated only after the GSC auth
step.

To report the difference between the 2 auth steps, a new case is added
to the HuC getparam. This way, the clear media driver can start
submitting before full auth, as partial auth is enough for those
workloads.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 94 +++++++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h    | 16 +++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  4 +-
 drivers/gpu/drm/i915/i915_reg.h           |  3 +
 include/uapi/drm/i915_drm.h               |  3 +-
 5 files changed, 91 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index c189ede4ef55..cc3c9cb2319c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -10,6 +10,7 @@
 #include "intel_huc.h"
 #include "intel_huc_print.h"
 #include "i915_drv.h"
+#include "i915_reg.h"
 
 #include <linux/device/bus.h>
 #include <linux/mei_aux.h>
@@ -106,7 +107,7 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 {
 	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
 
-	if (!intel_huc_is_authenticated(huc)) {
+	if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
 		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
 			huc_notice(huc, "timed out waiting for MEI GSC\n");
 		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
@@ -124,7 +125,7 @@ static void huc_delayed_load_start(struct intel_huc *huc)
 {
 	ktime_t delay;
 
-	GEM_BUG_ON(intel_huc_is_authenticated(huc));
+	GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
 
 	/*
 	 * On resume we don't have to wait for MEI-GSC to be re-probed, but we
@@ -284,13 +285,23 @@ void intel_huc_init_early(struct intel_huc *huc)
 	}
 
 	if (GRAPHICS_VER(i915) >= 11) {
-		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
-		huc->status.mask = HUC_LOAD_SUCCESSFUL;
-		huc->status.value = HUC_LOAD_SUCCESSFUL;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
 	} else {
-		huc->status.reg = HUC_STATUS2;
-		huc->status.mask = HUC_FW_VERIFIED;
-		huc->status.value = HUC_FW_VERIFIED;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
+	}
+
+	if (IS_DG2(i915)) {
+		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
+	} else {
+		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS5(MTL_GSC_HECI1_BASE);
+		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI_FWSTS5_HUC_AUTH_DONE;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI_FWSTS5_HUC_AUTH_DONE;
 	}
 }
 
@@ -381,28 +392,39 @@ void intel_huc_suspend(struct intel_huc *huc)
 	delayed_huc_load_complete(huc);
 }
 
-int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
+static const char *auth_mode_string(struct intel_huc *huc,
+				    enum intel_huc_authentication_type type)
+{
+	bool partial = !huc->loaded_via_gsc && huc->fw.is_meu_binary &&
+		       type == INTEL_HUC_AUTH_BY_GUC;
+
+	return partial ? "clear media" : "all workloads";
+}
+
+int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
+				     enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
 	int ret;
 
 	ret = __intel_wait_for_register(gt->uncore,
-					huc->status.reg,
-					huc->status.mask,
-					huc->status.value,
+					huc->status[type].reg,
+					huc->status[type].mask,
+					huc->status[type].value,
 					2, 50, NULL);
 
 	/* mark the load process as complete even if the wait failed */
 	delayed_huc_load_complete(huc);
 
 	if (ret) {
-		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
+		huc_err(huc, "firmware not verified for %s: %pe\n",
+			auth_mode_string(huc, type), ERR_PTR(ret));
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 		return ret;
 	}
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
-	huc_info(huc, "authenticated!\n");
+	huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, type));
 	return 0;
 }
 
@@ -442,7 +464,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	}
 
 	/* Check authentication status, it should be done by now */
-	ret = intel_huc_wait_for_auth_complete(huc);
+	ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
 	if (ret)
 		goto fail;
 
@@ -453,16 +475,29 @@ int intel_huc_auth(struct intel_huc *huc)
 	return ret;
 }
 
-bool intel_huc_is_authenticated(struct intel_huc *huc)
+bool intel_huc_is_authenticated(struct intel_huc *huc,
+				enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
 	intel_wakeref_t wakeref;
 	u32 status = 0;
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		status = intel_uncore_read(gt->uncore, huc->status.reg);
+		status = intel_uncore_read(gt->uncore, huc->status[type].reg);
 
-	return (status & huc->status.mask) == huc->status.value;
+	return (status & huc->status[type].mask) == huc->status[type].value;
+}
+
+static bool huc_is_fully_authenticated(struct intel_huc *huc)
+{
+	struct intel_uc_fw *huc_fw = &huc->fw;
+
+	if (!huc_fw->is_meu_binary)
+		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
+	else if (intel_uc_fw_is_supported(&huc_to_gt(huc)->uc.gsc.fw))
+		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
+	else
+		return false;
 }
 
 /**
@@ -477,7 +512,9 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
  */
 int intel_huc_check_status(struct intel_huc *huc)
 {
-	switch (__intel_uc_fw_status(&huc->fw)) {
+	struct intel_uc_fw *huc_fw = &huc->fw;
+
+	switch (__intel_uc_fw_status(huc_fw)) {
 	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
 		return -ENODEV;
 	case INTEL_UC_FIRMWARE_DISABLED:
@@ -494,7 +531,17 @@ int intel_huc_check_status(struct intel_huc *huc)
 		break;
 	}
 
-	return intel_huc_is_authenticated(huc);
+	/*
+	 * meu binaries loaded by GuC are first partially authenticated by GuC
+	 * and then fully authenticated by GSC
+	 */
+	if (huc_is_fully_authenticated(huc))
+		return 1; /* full auth */
+	else if (huc_fw->is_meu_binary && !huc->loaded_via_gsc &&
+		 intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
+		return 2; /* clear media only */
+	else
+		return 0;
 }
 
 static bool huc_has_delayed_load(struct intel_huc *huc)
@@ -508,7 +555,10 @@ void intel_huc_update_auth_status(struct intel_huc *huc)
 	if (!intel_uc_fw_is_loadable(&huc->fw))
 		return;
 
-	if (intel_huc_is_authenticated(huc))
+	if (!huc->fw.is_meu_binary)
+		return;
+
+	if (huc_is_fully_authenticated(huc))
 		intel_uc_fw_change_status(&huc->fw,
 					  INTEL_UC_FIRMWARE_RUNNING);
 	else if (huc_has_delayed_load(huc))
@@ -541,5 +591,5 @@ void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p)
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
 		drm_printf(p, "HuC status: 0x%08x\n",
-			   intel_uncore_read(gt->uncore, huc->status.reg));
+			   intel_uncore_read(gt->uncore, huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 345e1b9aa062..adb063cd27a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
 	INTEL_HUC_DELAYED_LOAD_ERROR,
 };
 
+enum intel_huc_authentication_type {
+	INTEL_HUC_AUTH_BY_GUC = 0,
+	INTEL_HUC_AUTH_BY_GSC,
+	INTEL_HUC_AUTH_MAX_MODES
+};
+
 struct intel_huc {
 	/* Generic uC firmware management */
 	struct intel_uc_fw fw;
@@ -31,7 +37,7 @@ struct intel_huc {
 		i915_reg_t reg;
 		u32 mask;
 		u32 value;
-	} status;
+	} status[INTEL_HUC_AUTH_MAX_MODES];
 
 	struct {
 		struct i915_sw_fence fence;
@@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
 void intel_huc_fini(struct intel_huc *huc);
 void intel_huc_suspend(struct intel_huc *huc);
 int intel_huc_auth(struct intel_huc *huc);
-int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
+int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
+				     enum intel_huc_authentication_type type);
+bool intel_huc_is_authenticated(struct intel_huc *huc,
+				enum intel_huc_authentication_type type);
 int intel_huc_check_status(struct intel_huc *huc);
 void intel_huc_update_auth_status(struct intel_huc *huc);
-bool intel_huc_is_authenticated(struct intel_huc *huc);
 
 void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
 void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
@@ -81,7 +89,7 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
 static inline bool intel_huc_wait_required(struct intel_huc *huc)
 {
 	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
-	       !intel_huc_is_authenticated(huc);
+	       !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
 }
 
 void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 88ad2c322c4a..3b8edaba97d2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -141,7 +141,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 	 * component gets re-bound and this function called again. If so, just
 	 * mark the HuC as loaded.
 	 */
-	if (intel_huc_is_authenticated(huc)) {
+	if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
 		return 0;
 	}
@@ -154,7 +154,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
-	return intel_huc_wait_for_auth_complete(huc);
+	return intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GSC);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index dde6e91055bd..1a62e73c3d9c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -941,6 +941,9 @@
 #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
 
+#define HECI_FWSTS5(base)		_MMIO(base + 0xc68)
+#define   HECI_FWSTS5_HUC_AUTH_DONE	(1 << 19)
+
 #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
 #define   GTT_CACHE_EN_ALL	0xF0007FFF
 #define GEN7_WR_WATERMARK	_MMIO(0x4028)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index dba7c5a5b25e..43b8de42a94e 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -659,7 +659,8 @@ typedef struct drm_i915_irq_wait {
  * If the IOCTL is successful, the returned parameter will be set to one of the
  * following values:
  *  * 0 if HuC firmware load is not complete,
- *  * 1 if HuC firmware is authenticated and running.
+ *  * 1 if HuC firmware is loaded and fully authenticated,
+ *  * 2 if HuC firmware is loaded and authenticated for clear media only
  */
 #define I915_PARAM_HUC_STATUS		 42
 
-- 
2.40.0

