Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5BD636D1D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 23:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4990510E646;
	Wed, 23 Nov 2022 22:31:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687B10E649;
 Wed, 23 Nov 2022 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669242686; x=1700778686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lcKk2HeFI9Dg1gtVVdZzkZeaYBno3/DQKrfPpOWyutw=;
 b=KWWHjAKHKZRjf24O1gGsKdtF2cX4Zm8bGHtFTr1m0c7XraI9h0OQM/F9
 kgGA/gib7c2gZvLrcsplmU5TMBP5wIhY9BwteGDAn2xeAG6+26sl6VOBV
 qJoT3OfzFqGbzPfT4JsvWp3fvsDwSexXzphQEJc8sKqIkvW2CO+oVEGd8
 w5d74FMo4qMhh60OIMpJjeFudB5XjOkcQ3ZHWOfPsEZOF5kHbJDwmdjL4
 aSm57dITwpLXnAidljLbDROFVhxL2mRTBH/XOSGfl09aKbAsMiW/rX8RK
 q0ZXtMIc3UkHj3+pFzB3bJAvLyb/bs1rknBdkNfpBkkH7Tgb/XAqIINIz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314204545"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="314204545"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 14:31:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642012962"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="642012962"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 14:31:14 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/3] drm/i915/guc: Use GuC submission API version number
Date: Wed, 23 Nov 2022 14:31:08 -0800
Message-Id: <20221123223108.1696415-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123223108.1696415-1-John.C.Harrison@Intel.com>
References: <20221123223108.1696415-1-John.C.Harrison@Intel.com>
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

The GuC firmware includes an extra version number to specify the
submission API level. So use that rather than the main firmware
version number for submission related checks.

Also, while it is guaranteed that GuC version number components are
only 8-bits in size, other firmwares do not have that restriction. So
stop making assumptions about them generically fitting in a u16
individually, or in a u32 as a combined 8.8.8.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 124 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   3 +-
 5 files changed, 137 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 1bb3f98292866..bb4dfe707a7d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -158,6 +158,9 @@ struct intel_guc {
 	bool submission_selected;
 	/** @submission_initialized: tracks whether GuC submission has been initialised */
 	bool submission_initialized;
+	/** @submission_version: Submission API version of the currently loaded firmware */
+	struct intel_uc_fw_ver submission_version;
+
 	/**
 	 * @rc_supported: tracks whether we support GuC rc on the current platform
 	 */
@@ -268,6 +271,14 @@ struct intel_guc {
 #endif
 };
 
+/*
+ * GuC version number components are only 8-bit, so converting to a 32bit 8.8.8
+ * integer works.
+ */
+#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
+#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
+
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
 {
 	return container_of(log, struct intel_guc, log);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0a42f1807f52c..53f7f599cde3a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1890,7 +1890,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	if (guc->submission_initialized)
 		return 0;
 
-	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 0, 0)) {
 		ret = guc_lrc_desc_pool_create_v69(guc);
 		if (ret)
 			return ret;
@@ -2330,7 +2330,7 @@ static int register_context(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
-	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
 		ret = register_context_v70(guc, ce, loop);
 	else
 		ret = register_context_v69(guc, ce, loop);
@@ -2342,7 +2342,7 @@ static int register_context(struct intel_context *ce, bool loop)
 		set_context_registered(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
-		if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
+		if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
 			guc_context_policy_init_v70(ce, loop);
 	}
 
@@ -2956,7 +2956,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
 						 u16 guc_id,
 						 u32 preemption_timeout)
 {
-	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
 		struct context_policy policy;
 
 		__guc_context_policy_start_klv(&policy, guc_id);
@@ -3283,7 +3283,7 @@ static int guc_context_alloc(struct intel_context *ce)
 static void __guc_context_set_prio(struct intel_guc *guc,
 				   struct intel_context *ce)
 {
-	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
 		struct context_policy policy;
 
 		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
@@ -4366,7 +4366,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
-	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 3, 0))
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
 		return 0;
 
 	__guc_scheduling_policy_start_klv(&policy);
@@ -4905,6 +4905,9 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 	if (!sched_engine)
 		return;
 
+	drm_printf(p, "GuC Submission API Version: %d.%d.%d\n",
+		   guc->submission_version.major, guc->submission_version.minor,
+		   guc->submission_version.patch);
 	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
 		   atomic_read(&guc->outstanding_submission_g2h));
 	drm_printf(p, "GuC tasklet count: %u\n",
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 5e2ee1ac89514..7d2349647b593 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -478,6 +478,62 @@ static int check_gsc_manifest(const struct firmware *fw,
 	return 0;
 }
 
+static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
+{
+	/* Get version numbers from the CSS header */
+	ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
+	ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
+	ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
+}
+
+static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *css)
+{
+	struct intel_guc *guc = container_of(uc_fw, struct intel_guc, fw);
+
+	/*
+	 * The GuC firmware includes an extra version number to specify the
+	 * submission API level. This allows submission code to work with
+	 * multiple GuC versions without having to know the absolute firmware
+	 * version number (there are likely to be multiple firmware releases
+	 * which all support the same submission API level).
+	 *
+	 * Note that the spec for the CSS header defines this version number
+	 * as 'vf_version' as it was originally intended for virtualisation.
+	 * However, it is applicable to native submission as well.
+	 *
+	 * Unfortunately, due to an oversight, this version number was only
+	 * exposed in the CSS header from v70.6.0.
+	 */
+	if (uc_fw->file_selected.ver.major >= 70) {
+		if (uc_fw->file_selected.ver.minor >= 6) {
+			/* v70.6.0 adds CSS header support */
+			uc_unpack_css_version(&guc->submission_version, css->vf_version);
+		} else if (uc_fw->file_selected.ver.minor >= 3) {
+			/* v70.3.0 introduced v1.1.0 */
+			guc->submission_version.major = 1;
+			guc->submission_version.minor = 1;
+			guc->submission_version.patch = 0;
+		} else {
+			/* v70.0.0 introduced v1.0.0 */
+			guc->submission_version.major = 1;
+			guc->submission_version.minor = 0;
+			guc->submission_version.patch = 0;
+		}
+	} else if (uc_fw->file_selected.ver.major >= 69) {
+		/* v69.0.0 introduced v0.10.0 */
+		guc->submission_version.major = 0;
+		guc->submission_version.minor = 10;
+		guc->submission_version.patch = 0;
+	} else {
+		/* Prior versions were v0.1.0 */
+		guc->submission_version.major = 0;
+		guc->submission_version.minor = 1;
+		guc->submission_version.patch = 0;
+	}
+
+	uc_fw->private_data_size = css->private_data_size;
+}
+
 static int check_ccs_header(struct intel_gt *gt,
 			    const struct firmware *fw,
 			    struct intel_uc_fw *uc_fw)
@@ -531,20 +587,50 @@ static int check_ccs_header(struct intel_gt *gt,
 		return -E2BIG;
 	}
 
-	/* Get version numbers from the CSS header */
-	uc_fw->file_selected.ver.major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-						   css->sw_version);
-	uc_fw->file_selected.ver.minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
-						   css->sw_version);
-	uc_fw->file_selected.ver.patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
-						   css->sw_version);
+	uc_unpack_css_version(&uc_fw->file_selected.ver, css->sw_version);
 
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
-		uc_fw->private_data_size = css->private_data_size;
+		guc_read_css_info(uc_fw, css);
 
 	return 0;
 }
 
+static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
+{
+	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
+}
+
+static bool gyc_check_version_range(struct intel_uc_fw *uc_fw)
+{
+	struct intel_guc *guc = container_of(uc_fw, struct intel_guc, fw);
+
+	/*
+	 * GuC version number components are defined as being 8-bits.
+	 * The submission code relies on this to optimise version comparison
+	 * tests. So enforce the restriction here.
+	 */
+
+	if (!is_ver_8bit(&uc_fw->file_selected.ver)) {
+		drm_warn(&__uc_fw_to_gt(uc_fw)->i915->drm, "%s firmware: invalid file version: 0x%02X:%02X:%02X\n",
+			 intel_uc_fw_type_repr(uc_fw->type),
+			 uc_fw->file_selected.ver.major,
+			 uc_fw->file_selected.ver.minor,
+			 uc_fw->file_selected.ver.patch);
+		return false;
+	}
+
+	if (!is_ver_8bit(&guc->submission_version)) {
+		drm_warn(&__uc_fw_to_gt(uc_fw)->i915->drm, "%s firmware: invalid submit version: 0x%02X:%02X:%02X\n",
+			 intel_uc_fw_type_repr(uc_fw->type),
+			 guc->submission_version.major,
+			 guc->submission_version.minor,
+			 guc->submission_version.patch);
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * intel_uc_fw_fetch - fetch uC firmware
  * @uc_fw: uC firmware
@@ -621,6 +707,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
+	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && !gyc_check_version_range(uc_fw))
+		goto fail;
+
 	if (uc_fw->file_wanted.ver.major) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
@@ -1054,7 +1143,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
  */
 void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
 {
-	u32 ver_sel, ver_want;
+	bool got_wanted;
 
 	drm_printf(p, "%s firmware: %s\n",
 		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path);
@@ -1063,9 +1152,20 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
 			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
 	drm_printf(p, "\tstatus: %s\n",
 		   intel_uc_fw_status_repr(uc_fw->status));
-	ver_sel = MAKE_UC_VER_STRUCT(uc_fw->file_selected.ver);
-	ver_want = MAKE_UC_VER_STRUCT(uc_fw->file_wanted.ver);
-	if (ver_sel < ver_want)
+
+	if (uc_fw->file_selected.ver.major < uc_fw->file_wanted.ver.major)
+		got_wanted = false;
+	else if ((uc_fw->file_selected.ver.major == uc_fw->file_wanted.ver.major) &&
+		 (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor))
+		got_wanted = false;
+	else if ((uc_fw->file_selected.ver.major == uc_fw->file_wanted.ver.major) &&
+		 (uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
+		 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
+		got_wanted = false;
+	else
+		got_wanted = true;
+
+	if (!got_wanted)
 		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
 			   uc_fw->file_wanted.ver.major,
 			   uc_fw->file_wanted.ver.minor,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 6501d6f1fbdff..3ab87c54a3987 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -66,9 +66,9 @@ enum intel_uc_fw_type {
 #define INTEL_UC_FW_NUM_TYPES 2
 
 struct intel_uc_fw_ver {
-	u16 major;
-	u16 minor;
-	u16 patch;
+	u32 major;
+	u32 minor;
+	u32 patch;
 };
 
 /*
@@ -114,10 +114,6 @@ struct intel_uc_fw {
 	bool loaded_via_gsc;
 };
 
-#define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
-#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)
-#define GET_UC_VER(uc)			(MAKE_UC_VER_STRUCT((uc)->fw.file_selected.ver))
-
 /*
  * When we load the uC binaries, we pin them in a reserved section at the top of
  * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs share the GGTT,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
index 7a411178bdbf2..646fa8aa6cf19 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
@@ -74,7 +74,8 @@ struct uc_css_header {
 #define CSS_SW_VERSION_UC_MAJOR		(0xFF << 16)
 #define CSS_SW_VERSION_UC_MINOR		(0xFF << 8)
 #define CSS_SW_VERSION_UC_PATCH		(0xFF << 0)
-	u32 reserved0[13];
+	u32 vf_version;
+	u32 reserved0[12];
 	union {
 		u32 private_data_size; /* only applies to GuC */
 		u32 reserved1;
-- 
2.37.3

