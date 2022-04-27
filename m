Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31331510D2A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 02:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DCA10EC02;
	Wed, 27 Apr 2022 00:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9960E10EC02;
 Wed, 27 Apr 2022 00:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651019195; x=1682555195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tl7C5fsTpAkCkV57vEq86KNAOyDkyN0UQS/yyUV9K7Y=;
 b=Cno9alL4YseS3/My72m0TJVBPKHQ25FfWBVlZDV3aV330ozzSzsIVSvY
 VxpdtyacP+yUnecMHWlQbyJ1KpEmxCN42rGKSaxK9bf4dysN89GxzKdHX
 5VLODO8F0qFfydp1GbYohFErZrXLLl/47yJa+lymfcZRh86bq9fJg4NVA
 m5jft4dxvDlu+Yp73tLCoUb1T/B2Z3YJgtVjM+5so0HpHBgccSkmZguT0
 Lip2lyao6Xy7qK6rT36uDDeRPNvvLXZUqMed6JSy7S2a+sEm6kIrr/NKV
 I5ctgSQ2GRTm5TMhcRaJ+PfRvq23vp9tnyNT8JDcf2apv0zMBiDITR7Ul Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="247695772"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="247695772"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 17:26:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730524676"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 17:26:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/huc: Prepare for GSC-loaded HuC
Date: Tue, 26 Apr 2022 17:26:16 -0700
Message-Id: <20220427002617.1767295-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
References: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HuC loading via GSC is performed via a PXP command sent through the mei
modules, so we need both MEI_GSC and MEI_PXP to be available. Given that
the GSC will do both the transfer and the authentication, the legacy HuC
loading paths can be safely skipped.
Also note that the GSC-loaded HuC survives GT reset.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c     | 76 +++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c  |  5 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c      | 11 +++-
 5 files changed, 88 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index 66027a42cda9e..2516705b9f365 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -96,6 +96,7 @@
 
 #define GUC_SHIM_CONTROL2		_MMIO(0xc068)
 #define   GUC_IS_PRIVILEGED		(1<<29)
+#define   GSC_LOADS_HUC			(1<<30)
 
 #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
 #define   GUC_SEND_TRIGGER		  (1<<0)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 773020e69589a..76a7df7f136fc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 
 #include "gt/intel_gt.h"
+#include "intel_guc_reg.h"
 #include "intel_huc.h"
 #include "i915_drv.h"
 
@@ -17,11 +18,15 @@
  * capabilities by adding HuC specific commands to batch buffers.
  *
  * The kernel driver is only responsible for loading the HuC firmware and
- * triggering its security authentication, which is performed by the GuC. For
- * The GuC to correctly perform the authentication, the HuC binary must be
- * loaded before the GuC one. Loading the HuC is optional; however, not using
- * the HuC might negatively impact power usage and/or performance of media
- * workloads, depending on the use-cases.
+ * triggering its security authentication, which is performed by the GuC on
+ * older platforms and by the GSC on newer ones. For the GuC to correctly
+ * perform the authentication, the HuC binary must be loaded before the GuC one.
+ * Loading the HuC is optional; however, not using the HuC might negatively
+ * impact power usage and/or performance of media workloads, depending on the
+ * use-cases.
+ * HuC must be reloaded on events that cause the WOPCM to lose its contents
+ * (S3/S4, FLR); GuC-authenticated HuC must also be reloaded on GuC/GT reset,
+ * while GSC-managed HuC will survive that.
  *
  * See https://github.com/intel/media-driver for the latest details on HuC
  * functionality.
@@ -54,11 +59,51 @@ void intel_huc_init_early(struct intel_huc *huc)
 	}
 }
 
+#define HUC_LOAD_MODE_STRING(x) (x ? "GSC" : "legacy")
+static int check_huc_loading_mode(struct intel_huc *huc)
+{
+	struct intel_gt *gt = huc_to_gt(huc);
+	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
+	bool hw_uses_gsc = false;
+
+	/*
+	 * The fuse for HuC load via GSC is only valid on platforms that have
+	 * GuC deprivilege.
+	 */
+	if (HAS_GUC_DEPRIVILEGE(gt->i915))
+		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
+			      GSC_LOADS_HUC;
+
+	if (fw_needs_gsc != hw_uses_gsc) {
+		drm_err(&gt->i915->drm,
+			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
+			HUC_LOAD_MODE_STRING(fw_needs_gsc),
+			HUC_LOAD_MODE_STRING(hw_uses_gsc));
+		return -ENOEXEC;
+	}
+
+	/* make sure we can access the GSC via the mei driver if we need it */
+	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
+	    fw_needs_gsc) {
+		drm_info(&gt->i915->drm,
+			 "Can't load HuC due to missing MEI modules\n");
+		return -EIO;
+	}
+
+	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
+
+	return 0;
+}
+
 int intel_huc_init(struct intel_huc *huc)
 {
 	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
 	int err;
 
+	err = check_huc_loading_mode(huc);
+	if (err)
+		goto out;
+
 	err = intel_uc_fw_init(&huc->fw);
 	if (err)
 		goto out;
@@ -108,17 +153,20 @@ int intel_huc_auth(struct intel_huc *huc)
 	struct intel_guc *guc = &gt->uc.guc;
 	int ret;
 
-	GEM_BUG_ON(huc_is_authenticated(huc));
-
 	if (!intel_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
 
+	/* GSC will do the auth */
+	if (intel_huc_is_loaded_by_gsc(huc))
+		return -ENODEV;
+
 	ret = i915_inject_probe_error(gt->i915, -ENXIO);
 	if (ret)
 		goto fail;
 
-	ret = intel_guc_auth_huc(guc,
-				 intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
+	GEM_BUG_ON(huc_is_authenticated(huc));
+
+	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
 	if (ret) {
 		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
 		goto fail;
@@ -178,6 +226,16 @@ int intel_huc_check_status(struct intel_huc *huc)
 	return huc_is_authenticated(huc);
 }
 
+void intel_huc_update_auth_status(struct intel_huc *huc)
+{
+	if (!intel_uc_fw_is_loadable(&huc->fw))
+		return;
+
+	if (huc_is_authenticated(huc))
+		intel_uc_fw_change_status(&huc->fw,
+					  INTEL_UC_FIRMWARE_RUNNING);
+}
+
 /**
  * intel_huc_load_status - dump information about HuC load status
  * @huc: the HuC
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 77d813840d76c..d7e25b6e879eb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -27,6 +27,7 @@ int intel_huc_init(struct intel_huc *huc);
 void intel_huc_fini(struct intel_huc *huc);
 int intel_huc_auth(struct intel_huc *huc);
 int intel_huc_check_status(struct intel_huc *huc);
+void intel_huc_update_auth_status(struct intel_huc *huc);
 
 static inline int intel_huc_sanitize(struct intel_huc *huc)
 {
@@ -50,6 +51,11 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
 	return intel_uc_fw_is_available(&huc->fw);
 }
 
+static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
+{
+	return huc->fw.loaded_via_gsc;
+}
+
 void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index e5ef509c70e89..9d6ab1e016395 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -8,7 +8,7 @@
 #include "i915_drv.h"
 
 /**
- * intel_huc_fw_upload() - load HuC uCode to device
+ * intel_huc_fw_upload() - load HuC uCode to device via DMA transfer
  * @huc: intel_huc structure
  *
  * Called from intel_uc_init_hw() during driver load, resume from sleep and
@@ -21,6 +21,9 @@
  */
 int intel_huc_fw_upload(struct intel_huc *huc)
 {
+	if (intel_huc_is_loaded_by_gsc(huc))
+		return -ENODEV;
+
 	/* HW doesn't look at destination address for HuC, so set it to 0 */
 	return intel_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 8c9ef690ac9d8..0dce94f896a8c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -509,7 +509,16 @@ static int __uc_init_hw(struct intel_uc *uc)
 	if (ret)
 		goto err_log_capture;
 
-	intel_huc_auth(huc);
+	/*
+	 * GSC-loaded HuC is authenticated by the GSC, so we don't need to
+	 * trigger the auth here. However, given that the HuC loaded this way
+	 * survive GT reset, we still need to update our SW bookkeeping to make
+	 * sure it reflects the correct HW status.
+	 */
+	if (intel_huc_is_loaded_by_gsc(huc))
+		intel_huc_update_auth_status(huc);
+	else
+		intel_huc_auth(huc);
 
 	if (intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_enable(guc);
-- 
2.25.1

