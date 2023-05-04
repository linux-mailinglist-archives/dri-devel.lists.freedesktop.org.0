Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E66F76EF
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394F810E528;
	Thu,  4 May 2023 20:22:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7175A10E51E;
 Thu,  4 May 2023 20:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683231761; x=1714767761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0oEEj/RDfdZp6xsEMcCZ/4bva+6pgotnOG8yZqGne0c=;
 b=jVXom9ViJSC0+TzVuOLnIKGis0ua7Oq7uDbhaBrZeGk6Flbe21JkeG2q
 7D2Q/Ow2nu36O4eUd0dPdoWg59k9hjBZZKFLF0Bi9aGQ9suE2aiZahcQ0
 +l/PHJg5Tdhk1NVh4KPuuaKhtqNsER3f6sRWMJxunWM+QZRifegFLAMyy
 q7ZZRRqH8SwYXpDCR5U9teYL3DPIRhGTOcnQgyYUifUx/xF/W9xc6+h1L
 MuAxDTqtCxtEA553SJnjxFXbY7785YKpv9MpqMUHgLW8s3GDSnQqPpDe+
 GCHcGgAqG2zBqSN5Hlh2/rSs5JifMk6rGGEVxt3BBL+WK5mtDn9S8mFuE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414569991"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="414569991"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808900442"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="808900442"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 13:22:39 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915/uc: Track patch level versions on reduced
 version firmware files
Date: Thu,  4 May 2023 13:22:51 -0700
Message-Id: <20230504202252.1104212-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
References: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
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

v2: Use correct patch version number and drop redunant debug print
(review by Daniele / CI results).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 30 +++++++++++++++---------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 6b71b9febd74c..55e50bd08d7ff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -80,14 +80,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
 	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
-	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
-	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
+	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
+	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
-	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
+	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
-	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
+	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 1)) \
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
@@ -794,6 +795,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		} else {
 			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
 				old_ver = true;
+			else if ((uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
+				 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
+				old_ver = true;
 		}
 	}
 
@@ -801,12 +805,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
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

