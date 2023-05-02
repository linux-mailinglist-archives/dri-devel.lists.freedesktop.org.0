Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB166F4DBE
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068E610E15D;
	Tue,  2 May 2023 23:40:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC8410E123;
 Tue,  2 May 2023 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683070798; x=1714606798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMekg71rLN+KakGN4aMLv6G8oTs168Dl+qLKz1+2rtY=;
 b=NECj8sUP30kT1xlipfv1/diQVOvHDhIvVa3gn8Nbi5Odubtk8JShQ+X7
 KlkW8KkiOoVQzJnks6ZL1B3wGVHugwHRcJAk7fvYG/F/ZxkPI4+RW2JqF
 EXUsatbbE8LJ9xIrUB6x7aPVEJwlipYIV4MmhAhXZcd8J7cxs6kI+0PtK
 hdyPnCcaMbzMC+EKviNbcVL2qr7q3G8vJOGJzyYNQ6WGCLh/4Y3eBc8BQ
 JbpFpOYrk036R/oX8RWwlVrLBi2LyjkdY8z76LHZ1Dy6TgOZyFxEKbdMG
 tsjbIIvo5k5Bd0EW8A72/VRbmHGJVj++upav4uZRAL/a1oxsb3TuHgJpP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350601513"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="350601513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 16:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673865819"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="673865819"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 16:39:56 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 4/6] drm/i915/uc: Enhancements to firmware table validation
Date: Tue,  2 May 2023 16:40:05 -0700
Message-Id: <20230502234007.1762014-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
References: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
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

The validation of the firmware table was being done inside the code
for scanning the table for the next available firmware blob. Which is
unnecessary. So pull it out into a separate function that is only
called once per blob type at init time.

Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
It was mentioned that potential issues with backports would not be
caught by regular pre-merge CI as that only occurs on tip not stable
branches. Making the validation unconditional and failing driver load
on detecting of a problem ensures that such backports will also be
validated correctly.

This requires adding a firmware global flag to indicate an issue with
any of the per firmware tables. This is done rather than adding a new
state enum as a new enum value would be a much more invasive change -
lots of places would need updating to support the new error state.

Note also that this change means that a table error will cause the
driver to wedge even on platforms that don't require firmware files.
This is intentional as per the above backport concern - someone doing
backports is not guaranteed to test on every platform that they may
potential affect. So forcing a failure on all platforms ensures that
the problem will be noticed and corrected immediately.

v2: Change to unconditionally fail module load on a validation error
(review feedback/discussion with Daniele).
v3: Add a new flag to track table validation errors (review
feedback/discussion with Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c    |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.h    |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 161 +++++++++++++----------
 3 files changed, 99 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 996168312340e..1381943b8973d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -432,6 +432,9 @@ static bool uc_is_wopcm_locked(struct intel_uc *uc)
 
 static int __uc_check_hw(struct intel_uc *uc)
 {
+	if (uc->fw_table_invalid)
+		return -EIO;
+
 	if (!intel_uc_supports_guc(uc))
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 5d0f1bcc381e8..d585524d94deb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -36,6 +36,7 @@ struct intel_uc {
 	struct drm_i915_gem_object *load_err_log;
 
 	bool reset_in_progress;
+	bool fw_table_invalid;
 };
 
 void intel_uc_init_early(struct intel_uc *uc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 55e50bd08d7ff..64e19688788d1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -233,20 +233,22 @@ struct fw_blobs_by_type {
 	u32 count;
 };
 
+static const struct uc_fw_platform_requirement blobs_guc[] = {
+	INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
+};
+
+static const struct uc_fw_platform_requirement blobs_huc[] = {
+	INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
+};
+
+static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
+	[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
+	[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
+};
+
 static void
 __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 {
-	static const struct uc_fw_platform_requirement blobs_guc[] = {
-		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
-	};
-	static const struct uc_fw_platform_requirement blobs_huc[] = {
-		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
-	};
-	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
-		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
-		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
-	};
-	static bool verified[INTEL_UC_FW_NUM_TYPES];
 	const struct uc_fw_platform_requirement *fw_blobs;
 	enum intel_platform p = INTEL_INFO(i915)->platform;
 	u32 fw_count;
@@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 			continue;
 
 		if (uc_fw->file_selected.path) {
+			/*
+			 * Continuing an earlier search after a found blob failed to load.
+			 * Once the previously chosen path has been found, clear it out
+			 * and let the search continue from there.
+			 */
 			if (uc_fw->file_selected.path == blob->path)
 				uc_fw->file_selected.path = NULL;
 
@@ -306,76 +313,91 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		/* Failed to find a match for the last attempt?! */
 		uc_fw->file_selected.path = NULL;
 	}
+}
 
-	/* make sure the list is ordered as expected */
-	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
-		verified[uc_fw->type] = true;
+static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_fw_type type)
+{
+	const struct uc_fw_platform_requirement *fw_blobs;
+	u32 fw_count;
+	int i;
 
-		for (i = 1; i < fw_count; i++) {
-			/* Next platform is good: */
-			if (fw_blobs[i].p < fw_blobs[i - 1].p)
-				continue;
+	if (type >= ARRAY_SIZE(blobs_all)) {
+		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
+		return false;
+	}
 
-			/* Next platform revision is good: */
-			if (fw_blobs[i].p == fw_blobs[i - 1].p &&
-			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
-				continue;
+	fw_blobs = blobs_all[type].blobs;
+	fw_count = blobs_all[type].count;
 
-			/* Platform/revision must be in order: */
-			if (fw_blobs[i].p != fw_blobs[i - 1].p ||
-			    fw_blobs[i].rev != fw_blobs[i - 1].rev)
-				goto bad;
+	if (!fw_count)
+		return true;
 
-			/* Next major version is good: */
-			if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
-				continue;
+	/* make sure the list is ordered as expected */
+	for (i = 1; i < fw_count; i++) {
+		/* Next platform is good: */
+		if (fw_blobs[i].p < fw_blobs[i - 1].p)
+			continue;
 
-			/* New must be before legacy: */
-			if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
-				goto bad;
+		/* Next platform revision is good: */
+		if (fw_blobs[i].p == fw_blobs[i - 1].p &&
+		    fw_blobs[i].rev < fw_blobs[i - 1].rev)
+			continue;
 
-			/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
-			if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
-				if (!fw_blobs[i - 1].blob.major)
-					continue;
+		/* Platform/revision must be in order: */
+		if (fw_blobs[i].p != fw_blobs[i - 1].p ||
+		    fw_blobs[i].rev != fw_blobs[i - 1].rev)
+			goto bad;
 
-				if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
-					continue;
-			}
+		/* Next major version is good: */
+		if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
+			continue;
 
-			/* Major versions must be in order: */
-			if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
-				goto bad;
+		/* New must be before legacy: */
+		if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
+			goto bad;
 
-			/* Next minor version is good: */
-			if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
+		/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
+		if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
+			if (!fw_blobs[i - 1].blob.major)
 				continue;
 
-			/* Minor versions must be in order: */
-			if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
-				goto bad;
-
-			/* Patch versions must be in order: */
-			if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
+			if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
 				continue;
+		}
+
+		/* Major versions must be in order: */
+		if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
+			goto bad;
+
+		/* Next minor version is good: */
+		if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
+			continue;
+
+		/* Minor versions must be in order: */
+		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
+			goto bad;
+
+		/* Patch versions must be in order: */
+		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
+			continue;
 
 bad:
-			drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
-				intel_uc_fw_type_repr(uc_fw->type),
-				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
-				fw_blobs[i - 1].blob.legacy ? "L" : "v",
-				fw_blobs[i - 1].blob.major,
-				fw_blobs[i - 1].blob.minor,
-				fw_blobs[i - 1].blob.patch,
-				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
-				fw_blobs[i].blob.legacy ? "L" : "v",
-				fw_blobs[i].blob.major,
-				fw_blobs[i].blob.minor,
-				fw_blobs[i].blob.patch);
-
-			uc_fw->file_selected.path = NULL;
-		}
+		drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
+			intel_uc_fw_type_repr(type),
+			intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
+			fw_blobs[i - 1].blob.legacy ? "L" : "v",
+			fw_blobs[i - 1].blob.major,
+			fw_blobs[i - 1].blob.minor,
+			fw_blobs[i - 1].blob.patch,
+			intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
+			fw_blobs[i].blob.legacy ? "L" : "v",
+			fw_blobs[i].blob.major,
+			fw_blobs[i].blob.minor,
+			fw_blobs[i].blob.patch);
+		return false;
 	}
+
+	return true;
 }
 
 static const char *__override_guc_firmware_path(struct drm_i915_private *i915)
@@ -430,7 +452,8 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
 void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 			    enum intel_uc_fw_type type)
 {
-	struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, type)->i915;
+	struct intel_gt *gt = ____uc_fw_to_gt(uc_fw, type);
+	struct drm_i915_private *i915 = gt->i915;
 
 	/*
 	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
@@ -443,6 +466,12 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 	uc_fw->type = type;
 
 	if (HAS_GT_UC(i915)) {
+		if (!validate_fw_table_type(i915, type)) {
+			gt->uc.fw_table_invalid = true;
+			intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
+			return;
+		}
+
 		__uc_fw_auto_select(i915, uc_fw);
 		__uc_fw_user_override(i915, uc_fw);
 	}
-- 
2.39.1

