Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E76E2E0D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41310EEEC;
	Sat, 15 Apr 2023 00:57:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971AC10EEE1;
 Sat, 15 Apr 2023 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681520241; x=1713056241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JaUTXYfYjpTomyXcU3WOG5uo68bIdmdZqbHAoYfnu7M=;
 b=M+zVkQdKfIz8q/rNZtgCw96uEnOOpI3yczkX40orG75GB5EmzXxGu3EO
 joAnDkM8i0asuwKQohPPnhznYboTrvPO4Xvg0NaH6e6SSUThXF+Uu667n
 qb9/Mlve+cY6/pd9owbbaQlJUtYbrOwzTJLCMR2TwWMJFpwxxM9YkmRtR
 BOJRbyMJ8Ll+zfEWzBQVDaZN1jCDqnb/NQhwcBIoPGYk+nWiAreQzuSsm
 mRIetHfFFeyZGTJfW/JW87MIgsvpqMWmecgre4oEQI8xMMp5INt3P914p
 wflyJjKySLbwQK5GMkHwr2dX7q3tOvKcawaSoYjmMcvaXJJY+cGymxtny w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372471783"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="372471783"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722643210"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="722643210"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 4/5] drm/i915/uc: Split firmware table validation to a
 separate function
Date: Fri, 14 Apr 2023 17:57:05 -0700
Message-Id: <20230415005706.4135485-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
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
unnecessary. Potentially, it should be a selftest. But either way, the
first step is pulling it out into a separate function that can be
called just once rather than once per blob attempt per blob type.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 164 ++++++++++++++---------
 1 file changed, 99 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 6bb45d6b8da5f..c589782467265 100644
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
 
@@ -306,78 +313,103 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		/* Failed to find a match for the last attempt?! */
 		uc_fw->file_selected.path = NULL;
 	}
+}
 
-	/* make sure the list is ordered as expected */
-	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
-		verified[uc_fw->type] = true;
+static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_fw_type type)
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
+		return;
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
+		return;
 
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
 	}
 }
 
+static void validate_fw_table(struct drm_i915_private *i915)
+{
+	enum intel_uc_fw_type type;
+	static bool done;
+
+	if (!IS_ENABLED(CONFIG_DRM_I915_SELFTEST) || done)
+		return;
+	done = true;
+
+	for (type = 0; type < INTEL_UC_FW_NUM_TYPES; type++)
+		validate_fw_table_type(i915, type);
+}
+
 static const char *__override_guc_firmware_path(struct drm_i915_private *i915)
 {
 	if (i915->params.enable_guc & ENABLE_GUC_MASK)
@@ -432,6 +464,8 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 {
 	struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, type)->i915;
 
+	validate_fw_table(i915);
+
 	/*
 	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
 	 * before we're looked at the HW caps to see if we have uc support
-- 
2.39.1

