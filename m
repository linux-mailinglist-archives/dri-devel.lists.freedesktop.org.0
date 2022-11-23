Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF29636D2F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 23:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0B410E655;
	Wed, 23 Nov 2022 22:31:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1610E646;
 Wed, 23 Nov 2022 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669242686; x=1700778686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbZuQGkbUvrn/OyrfwurrCtXWZ7Ha93CGfd9DvU172A=;
 b=mbl+VFUAovrAFB9WvDmP0wNLVcltTNInmOb+Pshx/I+mwIk9krb1ZhEC
 0K1gL/6cuidWg7GzrmCLihfrQ19RSBmM7P5mQbjeAZiPnbY9jMxQ8zLOv
 1trCejDYBazfnRsZ+EuPqqh/JSl8n96aQT8Z9ehMyb9yFwj7S/8zuMxM4
 JvkhXLVPiQ3So5ffiuVxcAARlKCNI/QAvQzPE61ZcUUgDCd/X4oJyrv6j
 xCKiKJOpoEXS4Z3SKRvmKFs3zB6vyuPFuuqle/LQBaOAkpdiMHqURS0n5
 J2c/i94J1r1+hkaksZ8FtJrhH/lNnkljZ7DTc7WtS+ZxcTBRVMt3t+scC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314204547"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="314204547"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 14:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642012963"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="642012963"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 14:31:14 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/3] drm/i915/uc: More refactoring of UC version numbers
Date: Wed, 23 Nov 2022 14:31:07 -0800
Message-Id: <20221123223108.1696415-3-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

As a precursor to a coming change (for adding a GuC submission API
version), abstract the UC version number into its own private
structure separate to the firmware filename.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c    |  6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 76 +++++++++++-------------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h | 15 +++--
 3 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 1d28286e6f066..e6edad6f8f9dd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -437,9 +437,9 @@ static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
 
 	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
 		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
-		 fw->file_selected.major_ver,
-		 fw->file_selected.minor_ver,
-		 fw->file_selected.patch_ver);
+		 fw->file_selected.ver.major,
+		 fw->file_selected.ver.minor,
+		 fw->file_selected.ver.patch);
 }
 
 static int __uc_init_hw(struct intel_uc *uc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 774c3d84a4243..5e2ee1ac89514 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -278,8 +278,8 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 
 		uc_fw->file_selected.path = blob->path;
 		uc_fw->file_wanted.path = blob->path;
-		uc_fw->file_wanted.major_ver = blob->major;
-		uc_fw->file_wanted.minor_ver = blob->minor;
+		uc_fw->file_wanted.ver.major = blob->major;
+		uc_fw->file_wanted.ver.minor = blob->minor;
 		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
 		found = true;
 		break;
@@ -438,28 +438,28 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
 		uc_fw->user_overridden = user;
 	} else if (i915_inject_probe_error(i915, e)) {
 		/* require next major version */
-		uc_fw->file_wanted.major_ver += 1;
-		uc_fw->file_wanted.minor_ver = 0;
+		uc_fw->file_wanted.ver.major += 1;
+		uc_fw->file_wanted.ver.minor = 0;
 		uc_fw->user_overridden = user;
 	} else if (i915_inject_probe_error(i915, e)) {
 		/* require next minor version */
-		uc_fw->file_wanted.minor_ver += 1;
+		uc_fw->file_wanted.ver.minor += 1;
 		uc_fw->user_overridden = user;
-	} else if (uc_fw->file_wanted.major_ver &&
+	} else if (uc_fw->file_wanted.ver.major &&
 		   i915_inject_probe_error(i915, e)) {
 		/* require prev major version */
-		uc_fw->file_wanted.major_ver -= 1;
-		uc_fw->file_wanted.minor_ver = 0;
+		uc_fw->file_wanted.ver.major -= 1;
+		uc_fw->file_wanted.ver.minor = 0;
 		uc_fw->user_overridden = user;
-	} else if (uc_fw->file_wanted.minor_ver &&
+	} else if (uc_fw->file_wanted.ver.minor &&
 		   i915_inject_probe_error(i915, e)) {
 		/* require prev minor version - hey, this should work! */
-		uc_fw->file_wanted.minor_ver -= 1;
+		uc_fw->file_wanted.ver.minor -= 1;
 		uc_fw->user_overridden = user;
 	} else if (user && i915_inject_probe_error(i915, e)) {
 		/* officially unsupported platform */
-		uc_fw->file_wanted.major_ver = 0;
-		uc_fw->file_wanted.minor_ver = 0;
+		uc_fw->file_wanted.ver.major = 0;
+		uc_fw->file_wanted.ver.minor = 0;
 		uc_fw->user_overridden = true;
 	}
 }
@@ -471,9 +471,9 @@ static int check_gsc_manifest(const struct firmware *fw,
 	u32 version_hi = dw[HUC_GSC_VERSION_HI_DW];
 	u32 version_lo = dw[HUC_GSC_VERSION_LO_DW];
 
-	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
-	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
-	uc_fw->file_selected.patch_ver = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
+	uc_fw->file_selected.ver.major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
+	uc_fw->file_selected.ver.minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
+	uc_fw->file_selected.ver.patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
 
 	return 0;
 }
@@ -532,11 +532,11 @@ static int check_ccs_header(struct intel_gt *gt,
 	}
 
 	/* Get version numbers from the CSS header */
-	uc_fw->file_selected.major_ver = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
+	uc_fw->file_selected.ver.major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
 						   css->sw_version);
-	uc_fw->file_selected.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
+	uc_fw->file_selected.ver.minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 						   css->sw_version);
-	uc_fw->file_selected.patch_ver = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
+	uc_fw->file_selected.ver.patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
 						   css->sw_version);
 
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
@@ -621,19 +621,19 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	if (uc_fw->file_wanted.major_ver) {
+	if (uc_fw->file_wanted.ver.major) {
 		/* Check the file's major version was as it claimed */
-		if (uc_fw->file_selected.major_ver != uc_fw->file_wanted.major_ver) {
+		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
 			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
 				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver,
-				   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
+				   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
+				   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
 			if (!intel_uc_fw_is_overridden(uc_fw)) {
 				err = -ENOEXEC;
 				goto fail;
 			}
 		} else {
-			if (uc_fw->file_selected.minor_ver < uc_fw->file_wanted.minor_ver)
+			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
 				old_ver = true;
 		}
 	}
@@ -646,9 +646,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 			   "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
 			   intel_uc_fw_type_repr(uc_fw->type),
 			   uc_fw->file_wanted.path,
-			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
+			   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
 			   uc_fw->file_selected.path,
-			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
+			   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
 		drm_info(&i915->drm,
 			 "Consider updating your linux-firmware pkg or downloading from %s\n",
 			 INTEL_UC_FIRMWARE_URL);
@@ -1063,25 +1063,21 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
 			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
 	drm_printf(p, "\tstatus: %s\n",
 		   intel_uc_fw_status_repr(uc_fw->status));
-	ver_sel = MAKE_UC_VER(uc_fw->file_selected.major_ver,
-			      uc_fw->file_selected.minor_ver,
-			      uc_fw->file_selected.patch_ver);
-	ver_want = MAKE_UC_VER(uc_fw->file_wanted.major_ver,
-			       uc_fw->file_wanted.minor_ver,
-			       uc_fw->file_wanted.patch_ver);
+	ver_sel = MAKE_UC_VER_STRUCT(uc_fw->file_selected.ver);
+	ver_want = MAKE_UC_VER_STRUCT(uc_fw->file_wanted.ver);
 	if (ver_sel < ver_want)
 		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
-			   uc_fw->file_wanted.major_ver,
-			   uc_fw->file_wanted.minor_ver,
-			   uc_fw->file_wanted.patch_ver,
-			   uc_fw->file_selected.major_ver,
-			   uc_fw->file_selected.minor_ver,
-			   uc_fw->file_selected.patch_ver);
+			   uc_fw->file_wanted.ver.major,
+			   uc_fw->file_wanted.ver.minor,
+			   uc_fw->file_wanted.ver.patch,
+			   uc_fw->file_selected.ver.major,
+			   uc_fw->file_selected.ver.minor,
+			   uc_fw->file_selected.ver.patch);
 	else
 		drm_printf(p, "\tversion: found %u.%u.%u\n",
-			   uc_fw->file_selected.major_ver,
-			   uc_fw->file_selected.minor_ver,
-			   uc_fw->file_selected.patch_ver);
+			   uc_fw->file_selected.ver.major,
+			   uc_fw->file_selected.ver.minor,
+			   uc_fw->file_selected.ver.patch);
 	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
 	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index bc898ba5355dc..6501d6f1fbdff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -65,6 +65,12 @@ enum intel_uc_fw_type {
 };
 #define INTEL_UC_FW_NUM_TYPES 2
 
+struct intel_uc_fw_ver {
+	u16 major;
+	u16 minor;
+	u16 patch;
+};
+
 /*
  * The firmware build process will generate a version header file with major and
  * minor version defined. The versions are built into CSS header of firmware.
@@ -72,9 +78,7 @@ enum intel_uc_fw_type {
  */
 struct intel_uc_fw_file {
 	const char *path;
-	u16 major_ver;
-	u16 minor_ver;
-	u16 patch_ver;
+	struct intel_uc_fw_ver ver;
 };
 
 /*
@@ -111,9 +115,8 @@ struct intel_uc_fw {
 };
 
 #define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
-#define GET_UC_VER(uc)			(MAKE_UC_VER((uc)->fw.file_selected.major_ver, \
-						     (uc)->fw.file_selected.minor_ver, \
-						     (uc)->fw.file_selected.patch_ver))
+#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)
+#define GET_UC_VER(uc)			(MAKE_UC_VER_STRUCT((uc)->fw.file_selected.ver))
 
 /*
  * When we load the uC binaries, we pin them in a reserved section at the top of
-- 
2.37.3

