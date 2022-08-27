Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90875A3366
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5FB10EADF;
	Sat, 27 Aug 2022 01:17:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8D110E98F;
 Sat, 27 Aug 2022 01:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661563018; x=1693099018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2cZSfeudbcesud8c7kqqALRmHMKEYri3/Nm5/aU1C2s=;
 b=MYYcf8S215n7sD3kNyrMPPVASkIWOdsicfLMCF8U43xEpxiHwjyGLz1F
 Met5j+CMyJZ9KkiG2XbI/1h8qDX4IcdUMDxHBTqqM2eWYPL2v763wShb/
 n0QB4Ani+RLjSmzrDn+sbPKGK1FbpI5kfwvR8s+Et/5f7Np++wkddg6LQ
 1vNmxaTi7V9CrJTpRd6o0BfErqonYAfoYP/JnfyAqw0NaShBo6g8BU1Sp
 gK1iIpPyYI9utAZMPX3p+7qCaS/ojN/MON+VtGTTZgqJnYU8IT9WaMIbA
 dPRu2nrX2aBKKWAck/ANsLO4HM9G9WCZJ3kPa1roPO+3271GCxAxZa+xA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320733975"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="320733975"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="610741936"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 26 Aug 2022 18:16:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 2/3] drm/i915/uc: Add patch level version number support
Date: Fri, 26 Aug 2022 18:17:01 -0700
Message-Id: <20220827011702.3465334-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
References: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
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

With the move to un-versioned filenames, it becomes more difficult to
know exactly what version of a given firmware is being used. So add
the patch level version number to the debugfs output.

Also, support matching by patch level when selecting code paths for
firmware compatibility. While a patch level change cannot be backwards
breaking, it is potentially possible that a new feature only works
from a given patch level onwards (even though it was theoretically
added in an earlier version that bumped the major or minor version).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 36 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  6 ++++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |  8 +++--
 5 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 04393932623c7..64c4e83153f47 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	if (guc->submission_initialized)
 		return 0;
 
-	if (guc->fw.file_selected.major_ver < 70) {
+	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
 		ret = guc_lrc_desc_pool_create_v69(guc);
 		if (ret)
 			return ret;
@@ -2303,7 +2303,7 @@ static int register_context(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
-	if (guc->fw.file_selected.major_ver >= 70)
+	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
 		ret = register_context_v70(guc, ce, loop);
 	else
 		ret = register_context_v69(guc, ce, loop);
@@ -2315,7 +2315,7 @@ static int register_context(struct intel_context *ce, bool loop)
 		set_context_registered(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
-		if (guc->fw.file_selected.major_ver >= 70)
+		if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
 			guc_context_policy_init_v70(ce, loop);
 	}
 
@@ -2921,7 +2921,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
 						 u16 guc_id,
 						 u32 preemption_timeout)
 {
-	if (guc->fw.file_selected.major_ver >= 70) {
+	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
 		struct context_policy policy;
 
 		__guc_context_policy_start_klv(&policy, guc_id);
@@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct intel_context *ce)
 static void __guc_context_set_prio(struct intel_guc *guc,
 				   struct intel_context *ce)
 {
-	if (guc->fw.file_selected.major_ver >= 70) {
+	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
 		struct context_policy policy;
 
 		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index d965ac4832d60..abf4e142596d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -435,9 +435,11 @@ static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
 {
 	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
 
-	drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
+	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
 		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
-		 fw->file_selected.major_ver, fw->file_selected.minor_ver);
+		 fw->file_selected.major_ver,
+		 fw->file_selected.minor_ver,
+		 fw->file_selected.patch_ver);
 }
 
 static int __uc_init_hw(struct intel_uc *uc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 610f36f1b989a..af425916cdf64 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -447,10 +447,12 @@ static int check_gsc_manifest(const struct firmware *fw,
 			      struct intel_uc_fw *uc_fw)
 {
 	u32 *dw = (u32 *)fw->data;
-	u32 version = dw[HUC_GSC_VERSION_DW];
+	u32 version_hi = dw[HUC_GSC_VERSION_HI_DW];
+	u32 version_lo = dw[HUC_GSC_VERSION_LO_DW];
 
-	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
-	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
+	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
+	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
+	uc_fw->file_selected.patch_ver = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
 
 	return 0;
 }
@@ -512,6 +514,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
 						   css->sw_version);
 	uc_fw->file_selected.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 						   css->sw_version);
+	uc_fw->file_selected.patch_ver = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
+						   css->sw_version);
 
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
 		uc_fw->private_data_size = css->private_data_size;
@@ -1000,6 +1004,8 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
  */
 void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
 {
+	u32 ver_sel, ver_want;
+
 	drm_printf(p, "%s firmware: %s\n",
 		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path);
 	if (uc_fw->file_selected.path != uc_fw->file_wanted.path)
@@ -1007,13 +1013,25 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
 			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
 	drm_printf(p, "\tstatus: %s\n",
 		   intel_uc_fw_status_repr(uc_fw->status));
-	if (uc_fw->file_wanted.major_ver)
-		drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
-			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
-			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
+	ver_sel = MAKE_UC_VER(uc_fw->file_selected.major_ver,
+			      uc_fw->file_selected.minor_ver,
+			      uc_fw->file_selected.patch_ver);
+	ver_want = MAKE_UC_VER(uc_fw->file_wanted.major_ver,
+			       uc_fw->file_wanted.minor_ver,
+			       uc_fw->file_wanted.patch_ver);
+	if (ver_sel < ver_want)
+		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
+			   uc_fw->file_wanted.major_ver,
+			   uc_fw->file_wanted.minor_ver,
+			   uc_fw->file_wanted.patch_ver,
+			   uc_fw->file_selected.major_ver,
+			   uc_fw->file_selected.minor_ver,
+			   uc_fw->file_selected.patch_ver);
 	else
-		drm_printf(p, "\tversion: found %u.%u\n",
-			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
+		drm_printf(p, "\tversion: found %u.%u.%u\n",
+			   uc_fw->file_selected.major_ver,
+			   uc_fw->file_selected.minor_ver,
+			   uc_fw->file_selected.patch_ver);
 	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
 	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 344763c942e37..cb586f7df270b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -73,6 +73,7 @@ struct intel_uc_fw_file {
 	const char *path;
 	u16 major_ver;
 	u16 minor_ver;
+	u16 patch_ver;
 };
 
 /*
@@ -108,6 +109,11 @@ struct intel_uc_fw {
 	bool loaded_via_gsc;
 };
 
+#define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
+#define GET_UC_VER(uc)			(MAKE_UC_VER((uc)->fw.file_selected.major_ver, \
+						     (uc)->fw.file_selected.minor_ver, \
+						     (uc)->fw.file_selected.patch_ver))
+
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 			       enum intel_uc_fw_status status);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
index b05e0e35b734c..7a411178bdbf2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
@@ -83,8 +83,10 @@ struct uc_css_header {
 } __packed;
 static_assert(sizeof(struct uc_css_header) == 128);
 
-#define HUC_GSC_VERSION_DW		44
-#define   HUC_GSC_MAJOR_VER_MASK	(0xFF << 0)
-#define   HUC_GSC_MINOR_VER_MASK	(0xFF << 16)
+#define HUC_GSC_VERSION_HI_DW		44
+#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
+#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
+#define HUC_GSC_VERSION_LO_DW		45
+#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
 
 #endif /* _INTEL_UC_FW_ABI_H */
-- 
2.37.2

