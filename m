Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B36118821
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A036E8D6;
	Tue, 10 Dec 2019 12:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDBB6E8D6;
 Tue, 10 Dec 2019 12:31:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:38 -0800
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="215556771"
Received: from orilivne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.68])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915/uc: convert to drm device based logging
Date: Tue, 10 Dec 2019 14:30:49 +0200
Message-Id: <20191210123050.8799-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer drm_dbg() over DRM_DEV_DEBUG_DRIVER().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c    | 12 ++++++------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++-----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 922a19635d20..72cff3224971 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -379,7 +379,7 @@ int intel_guc_init(struct intel_guc *guc)
 	intel_uc_fw_fini(&guc->fw);
 err_fetch:
 	intel_uc_fw_cleanup_fetch(&guc->fw);
-	DRM_DEV_DEBUG_DRIVER(gt->i915->drm.dev, "failed with %d\n", ret);
+	drm_dbg(&gt->i915->drm, "failed with %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 32a069841c14..7f30d4a048d6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -127,7 +127,7 @@ int intel_huc_init(struct intel_huc *huc)
 	intel_uc_fw_fini(&huc->fw);
 out:
 	intel_uc_fw_cleanup_fetch(&huc->fw);
-	DRM_DEV_DEBUG_DRIVER(i915->drm.dev, "failed with %d\n", err);
+	drm_dbg(&i915->drm, "failed with %d\n", err);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index c6519066a0f6..de4feaa4b7a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -42,12 +42,12 @@ static void __confirm_options(struct intel_uc *uc)
 {
 	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
 
-	DRM_DEV_DEBUG_DRIVER(i915->drm.dev,
-			     "enable_guc=%d (guc:%s submission:%s huc:%s)\n",
-			     i915_modparams.enable_guc,
-			     yesno(intel_uc_uses_guc(uc)),
-			     yesno(intel_uc_uses_guc_submission(uc)),
-			     yesno(intel_uc_uses_huc(uc)));
+	drm_dbg(&i915->drm,
+		"enable_guc=%d (guc:%s submission:%s huc:%s)\n",
+		i915_modparams.enable_guc,
+		yesno(intel_uc_uses_guc(uc)),
+		yesno(intel_uc_uses_guc_submission(uc)),
+		yesno(intel_uc_uses_huc(uc)));
 
 	if (i915_modparams.enable_guc == -1)
 		return;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 66a30ab7044a..a88f4066be41 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -26,11 +26,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 			       enum intel_uc_fw_status status)
 {
 	uc_fw->__status =  status;
-	DRM_DEV_DEBUG_DRIVER(__uc_fw_to_gt(uc_fw)->i915->drm.dev,
-			     "%s firmware -> %s\n",
-			     intel_uc_fw_type_repr(uc_fw->type),
-			     status == INTEL_UC_FIRMWARE_SELECTED ?
-			     uc_fw->path : intel_uc_fw_status_repr(status));
+	drm_dbg(&__uc_fw_to_gt(uc_fw)->i915->drm,
+		"%s firmware -> %s\n",
+		intel_uc_fw_type_repr(uc_fw->type),
+		status == INTEL_UC_FIRMWARE_SELECTED ?
+		uc_fw->path : intel_uc_fw_status_repr(status));
 }
 #endif
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
