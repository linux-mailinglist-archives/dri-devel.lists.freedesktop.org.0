Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9F6E2E10
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ACA10EEF2;
	Sat, 15 Apr 2023 00:57:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F0010EEE7;
 Sat, 15 Apr 2023 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681520241; x=1713056241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5S+OBUdx6hkqjnPQijJANB6spEfYQkDs1QOExHrDsNM=;
 b=KQrjuPFj5qpFlAFuqK39ulDaGo2VeqOKFIGSK0QmuYJb8QSiqJoeX336
 vgz/VmsC2sCSs2cjGCMpLAzGynYXch8nAyXwJ9pwnEutdNiN0oPJeiJFs
 70tBCGCEb6kELnYgcw47519k/sLgX75acyAdNQ1j1MzPCsFNLRNTkLncv
 qcqs7/GQiGQ9fvBDKFHZlXg75Ndaultvyg8sC46AO7kMIyMVpP6cPlE3D
 gxRl+4y5nbzLnaolyq8+Ftd/Jgyy3k2NHhESPBSrOkT+fAYi1XqK9sUqU
 oHpGp/IjCY6Hc47w2S6V28JCq/hQ/PpxBTTiAxi3DMwgdWxrZ/viQdi4t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372471782"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="372471782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722643207"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="722643207"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/5] drm/i915/uc: Track patch level versions on reduced
 version firmware files
Date: Fri, 14 Apr 2023 17:57:04 -0700
Message-Id: <20230415005706.4135485-4-John.C.Harrison@Intel.com>
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

When reduced version firmware files were added (matching major
component being the only strict requirement), the minor version was
still tracked and a notification reported if it was older. However,
the patch version should really be tracked as well for the same
reasons. The KMD can work without the change but if the effort has
been taken to release a new firmware with the change then there must
be a valid reason for doing so - important bug fix, security fix, etc.
And in that case it would be good to alert the user if they are
missing out on that new fix.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 41 +++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index a82a53dbbc86d..6bb45d6b8da5f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -80,14 +80,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
 	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
-	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
-	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
+	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 4)) \
+	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 4)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
-	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
+	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5, 4)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
-	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
+	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 4)) \
 	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
@@ -141,7 +141,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	__stringify(patch_) ".bin"
 
 /* Minor for internal driver use, not part of file name */
-#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
+#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_) \
 	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
 
 #define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
@@ -197,9 +197,9 @@ struct __packed uc_fw_blob {
 	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
 	  .legacy = true }
 
-#define GUC_FW_BLOB(prefix_, major_, minor_) \
-	UC_FW_BLOB_NEW(major_, minor_, 0, false, \
-		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
+#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
+	UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
+		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))
 
 #define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
 	UC_FW_BLOB_OLD(major_, minor_, patch_, \
@@ -296,6 +296,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		uc_fw->file_wanted.path = blob->path;
 		uc_fw->file_wanted.ver.major = blob->major;
 		uc_fw->file_wanted.ver.minor = blob->minor;
+		uc_fw->file_wanted.ver.patch = blob->patch;
 		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
 		found = true;
 		break;
@@ -776,6 +777,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && !guc_check_version_range(uc_fw))
 		goto fail;
 
+	gt_info(gt, "%s firmware: wanted = %s / %d.%d.%d, got = %s / %d.%d.%d\n",
+		intel_uc_fw_type_repr(uc_fw->type),
+		uc_fw->file_wanted.path,
+		uc_fw->file_wanted.ver.major,
+		uc_fw->file_wanted.ver.minor,
+		uc_fw->file_wanted.ver.patch,
+		uc_fw->file_selected.path,
+		uc_fw->file_selected.ver.major,
+		uc_fw->file_selected.ver.minor,
+		uc_fw->file_selected.ver.patch);
+
 	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
@@ -790,6 +802,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		} else {
 			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
 				old_ver = true;
+			else if ((uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
+				 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
+				old_ver = true;
 		}
 	}
 
@@ -797,12 +812,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-		gt_notice(gt, "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
+		gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
 			  intel_uc_fw_type_repr(uc_fw->type),
 			  uc_fw->file_wanted.path,
-			  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
+			  uc_fw->file_wanted.ver.major,
+			  uc_fw->file_wanted.ver.minor,
+			  uc_fw->file_wanted.ver.patch,
 			  uc_fw->file_selected.path,
-			  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
+			  uc_fw->file_selected.ver.major,
+			  uc_fw->file_selected.ver.minor,
+			  uc_fw->file_selected.ver.patch);
 		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
 			INTEL_UC_FIRMWARE_URL);
 	}
-- 
2.39.1

