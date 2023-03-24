Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6996C76F4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 06:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9F10E4C2;
	Fri, 24 Mar 2023 05:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3410E257;
 Fri, 24 Mar 2023 05:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679635190; x=1711171190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z6CgJ7Qc/HOg/2X/sq9T5Wl7v86hR+tkrhq+VlG2pq4=;
 b=ONpNt7gTdRJDWxylW+Ug9OkG4fZqkTkUs9w2DQKH6m0bOgEGsLhnfDXR
 wnwaZpSDSUAPA/r48XBdLVegcpN4iHL4h+gDjNamecaddEDiR5ILAwwrO
 8zF2hSpdbAwtHCsC5rReULxJNuXjJBY1vsRQ5LSQnDakQ71x/owjBMN7x
 4ay3uCdAFbg08nf5nsTFlphnyRLbHVlEoiP0bPxPFtDACfeCY3HefdWKn
 EOhBaMZKan+bTS3+KtMNeJrjiSV/45Sd9SE0z9eAv/hvwvpk0phKxGFGh
 mmhWVfSx10ox/xKK5d9ZmBJiJsuuGxI/DuW7S1CXKwhftE6VNkUOFTzUd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341262585"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="341262585"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806523072"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="806523072"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
Date: Thu, 23 Mar 2023 22:17:54 -0700
Message-Id: <20230324051754.1346390-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230324051754.1346390-1-lucas.demarchi@intel.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Dave Airlie <airlied@redhat.com>, John.C.Harrison@Intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the logic to autoselect GuC/HuC for the platforms with the
following improvements:

- Document what is the firmware file that is expected to be
  loaded and what is checked from blob headers
- When the platform is under force-probe it's desired to enforce
  the full-version requirement so the correct firmware is used
  before widespread adoption and backward-compatibility

  commitments
- Directory from which we expect firmware blobs to be available in
  upstream linux-firmware repository depends on the platform: for
  the ones supported by i915 it uses the i915/ directory, but the ones
  expected to be supported by xe, it's on the xe/ directory. This
  means that for platforms in the intersection, the firmware is
  loaded from a different directory, but that is not much important
  in the firmware repo and it avoids firmware duplication.

- Make the table with the firmware definitions clearly state the
  versions being expected. Now with macros to select the version it's
  possible to choose between full-version/major-version for GuC and
  full-version/no-version for HuC. These are similar to the macros used
  in i915, but implemented in a slightly different way to avoid
  duplicating the macros for each firmware/type and functionality,
  besides adding the support for different directories.

- There is no check added regarding force-probe since xe should
  reuse the same firmware files published for i915 for past
  platforms. This can be improved later with additional
  kunit checking against a hardcoded list of platforms that

  falls in this category.
- As mentioned in the TODO, the major version fallback was not
  implemented before as currently each platform only supports one
  major. That can be easily added later.

- GuC version for MTL and PVC were updated to 70.6.4, using the exact
  full version, while the

After this the GuC firmware used by PVC changes to pvc_guc_70.5.2.bin
since it's using a file not published yet.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 315 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h |   7 +
 3 files changed, 204 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 174c42873ebb..653bc3584cc5 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -17,6 +17,137 @@
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
+/*
+ * List of required GuC and HuC binaries per-platform. They must be ordered
+ * based on platform, from newer to older.
+ *
+ * Versioning follows the guidelines from
+ * Documentation/driver-api/firmware/firmware-usage-guidelines.rst. There is a
+ * distinction for platforms being officially supported by the driver or not.
+ * Platforms not available publicly or not yet officially supported by the
+ * driver (under force-probe), use the mmp_ver(): the firmware autoselect logic
+ * will select the firmware from disk with filename that matches the full
+ * "mpp version", i.e. major.minor.patch. mmp_ver() should only be used for
+ * this case.
+ *
+ * For platforms officially supported by the driver, the filename always only
+ * ever contains the major version (GuC) or no version at all (HuC).
+ *
+ * After loading the file, the driver parses the versions embedded in the blob.
+ * The major version needs to match a major version supported by the driver (if
+ * any). The minor version is also checked and a notice emitted to the log if
+ * the version found is smaller than the version wanted. This is done only for
+ * informational purposes so users may have a chance to upgrade, but the driver
+ * still loads and use the older firmware.
+ *
+ * Examples:
+ *
+ *	1) Platform officially supported by i915 - using Tigerlake as example.
+ *	   Driver loads the following firmware blobs from disk:
+ *
+ *		- i915/tgl_guc_<major>.bin
+ *		- i915/tgl_huc.bin
+ *
+ *	   <major> number for GuC is checked that it matches the version inside
+ *	   the blob. <minor> version is checked and if smaller than the expected
+ *	   an info message is emitted about that.
+ *
+ *	1) XE_<FUTUREINTELPLATFORM>, still under require_force_probe. Using
+ *	   "wipplat" as a short-name. Driver loads the following firmware blobs
+ *	   from disk:
+ *
+ *		- xe/wipplat_guc_<major>.<minor>.<patch>.bin
+ *		- xe/wipplat_huc_<major>.<minor>.<patch>.bin
+ *
+ *	   <major> and <minor> are checked that they match the version inside
+ *	   the blob. Both of them need to match exactly what the driver is
+ *	   expecting, otherwise it fails.
+ *
+ *	3) Platform officially supported by xe and out of force-probe. Using
+ *	   "plat" as a short-name. Except for the different directory, the
+ *	   behavior is the same as (1). Driver loads the following firmware
+ *	   blobs from disk:
+ *
+ *		- xe/plat_guc_<major>.bin
+ *		- xe/plat_huc.bin
+ *
+ *	   <major> number for GuC is checked that it matches the version inside
+ *	   the blob. <minor> version is checked and if smaller than the expected
+ *	   an info message is emitted about that.
+ *
+ * For the platforms already released with a major version, they should never be
+ * removed from the table. Instead new entries with newer versions may be added
+ * before them, so they take precedence.
+ *
+ * TODO: Currently there's no fallback on major version. That's because xe
+ * driver only supports the one major version of each firmware in the table.
+ * This needs to be fixed when the major version of GuC is updated.
+ */
+
+struct uc_fw_entry {
+	enum xe_platform platform;
+	struct {
+		const char *path;
+		u16 major;
+		u16 minor;
+		bool full_ver_required;
+	};
+};
+
+struct fw_blobs_by_type {
+	const struct uc_fw_entry *entries;
+	u32 count;
+};
+
+#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))	\
+	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
+
+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
+	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
+	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
+
+#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
+	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
+
+#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
+	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ## c))
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)			\
+	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
+#define fw_filename_no_ver(dir_, uc_, shortname_)				\
+	MAKE_FW_PATH(dir_, uc_, shortname_, "")
+
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
+	  a, b, true }
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)			\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),			\
+	  a, b }
+#define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
+	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
+	  0, 0 }
+
+/* All blobs need to be declared via MODULE_FIRMWARE() */
+#define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
+	MODULE_FIRMWARE(fw_filename);
+
+#define XE_UC_FW_ENTRY(platform__, entry__)					\
+	{									\
+		.platform = XE_ ## platform__,					\
+		entry__,							\
+	},
+
+XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,					\
+		     fw_filename_mmp_ver, fw_filename_major_ver)
+XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,					\
+		     fw_filename_mmp_ver, fw_filename_no_ver)
+
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
 {
@@ -37,123 +168,38 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	return gt_to_xe(uc_fw_to_gt(uc_fw));
 }
 
-/*
- * List of required GuC and HuC binaries per-platform.
- * Must be ordered based on platform, from newer to older.
- */
-#define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
-	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
-	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
-	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
-	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
-	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
-	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
-
-#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
-	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
-	fw_def(DG1,		huc_def(dg1)) \
-	fw_def(TIGERLAKE,	huc_def(tgl))
-
-#define __MAKE_HUC_FW_PATH(prefix_, name_) \
-        "i915/" \
-        __stringify(prefix_) "_" name_ ".bin"
-
-#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
-	"i915/" \
-	__stringify(prefix_) "_" name_ "_" \
-	__stringify(major_) ".bin"
-
-#define __MAKE_UC_FW_PATH_FULL_VER(prefix_, name_, major_, minor_, patch_) \
-        "i915/" \
-       __stringify(prefix_) "_" name_ "_" \
-       __stringify(major_) "." \
-       __stringify(minor_) "." \
-       __stringify(patch_) ".bin"
-
-#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
-	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
-
-#define MAKE_HUC_FW_PATH(prefix_) \
-	__MAKE_HUC_FW_PATH(prefix_, "huc")
-
-#define MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, patch_) \
-	__MAKE_UC_FW_PATH_FULL_VER(prefix_, "huc", major_, minor_, patch_)
-
-
-/* All blobs need to be declared via MODULE_FIRMWARE() */
-#define XE_UC_MODULE_FW(platform_, uc_) \
-	MODULE_FIRMWARE(uc_);
-
-XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
-XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH, MAKE_HUC_FW_PATH_FULL_VER)
-
-/* The below structs and macros are used to iterate across the list of blobs */
-struct __packed uc_fw_blob {
-	u8 major;
-	u8 minor;
-	const char *path;
-};
-
-#define UC_FW_BLOB(major_, minor_, path_) \
-	{ .major = major_, .minor = minor_, .path = path_ }
-
-#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
-	UC_FW_BLOB(major_, minor_, \
-		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
-
-#define HUC_FW_BLOB(prefix_) \
-	UC_FW_BLOB(0, 0, MAKE_HUC_FW_PATH(prefix_))
-
-#define HUC_FW_VERSION_BLOB(prefix_, major_, minor_, bld_num_) \
-	UC_FW_BLOB(major_, minor_, \
-		   MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, bld_num_))
-
-struct uc_fw_platform_requirement {
-	enum xe_platform p;
-	const struct uc_fw_blob blob;
-};
-
-#define MAKE_FW_LIST(platform_, uc_) \
-{ \
-	.p = XE_##platform_, \
-	.blob = uc_, \
-},
-
-struct fw_blobs_by_type {
-	const struct uc_fw_platform_requirement *blobs;
-	u32 count;
-};
-
 static void
 uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 {
-	static const struct uc_fw_platform_requirement blobs_guc[] = {
-		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
+	static const struct uc_fw_entry entries_guc[] = {
+		XE_GUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
+				     uc_fw_entry_mmp_ver,
+				     uc_fw_entry_major_ver)
 	};
-	static const struct uc_fw_platform_requirement blobs_huc[] = {
-		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_VERSION_BLOB)
+	static const struct uc_fw_entry entries_huc[] = {
+		XE_HUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
+				     uc_fw_entry_mmp_ver,
+				     uc_fw_entry_no_ver)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
-		[XE_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
-		[XE_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
+		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
+		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
 	};
-	static const struct uc_fw_platform_requirement *fw_blobs;
+	static const struct uc_fw_entry *entries;
 	enum xe_platform p = xe->info.platform;
-	u32 fw_count;
+	u32 count;
 	int i;
 
 	XE_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
-	fw_blobs = blobs_all[uc_fw->type].blobs;
-	fw_count = blobs_all[uc_fw->type].count;
-
-	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
-		if (p == fw_blobs[i].p) {
-			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
-
-			uc_fw->path = blob->path;
-			uc_fw->major_ver_wanted = blob->major;
-			uc_fw->minor_ver_wanted = blob->minor;
+	entries = blobs_all[uc_fw->type].entries;
+	count = blobs_all[uc_fw->type].count;
+
+	for (i = 0; i < count && p <= entries[i].platform; i++) {
+		if (p == entries[i].platform) {
+			uc_fw->path = entries[i].path;
+			uc_fw->major_ver_wanted = entries[i].major;
+			uc_fw->minor_ver_wanted = entries[i].minor;
+			uc_fw->full_ver_required = entries[i].full_ver_required;
 			break;
 		}
 	}
@@ -227,6 +273,47 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	uc_fw->private_data_size = css->private_data_size;
 }
 
+static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
+{
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+
+	/* Driver has no requirement on any version, any is good. */
+	if (!uc_fw->major_ver_wanted)
+		return 0;
+
+	/*
+	 * If full version is required, both major and minor should match.
+	 * Otherwise, at least the major version.
+	 */
+	if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
+	    (uc_fw->full_ver_required &&
+	     uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
+		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
+			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
+			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
+		goto fail;
+	}
+
+	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
+		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
+			   xe_uc_fw_type_repr(uc_fw->type),
+			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
+			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
+			   uc_fw->path);
+		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
+			 XE_UC_FIRMWARE_URL);
+	}
+
+	return 0;
+
+fail:
+	if (xe_uc_fw_is_overridden(uc_fw))
+		return 0;
+
+	return -ENOEXEC;
+}
+
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
@@ -308,19 +395,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 					   css->sw_version);
 
-	if (uc_fw->major_ver_wanted) {
-		if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
-		    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
-			drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-				   uc_fw->major_ver_found, uc_fw->minor_ver_found,
-				   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
-			if (!xe_uc_fw_is_overridden(uc_fw)) {
-				err = -ENOEXEC;
-				goto fail;
-			}
-		}
-	}
+	err = uc_fw_check_version_requirements(uc_fw);
+	if (err)
+		goto fail;
 
 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
 		guc_read_css_info(uc_fw, css);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index bf31c3bb0e0f..e16267e71280 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -175,6 +175,6 @@ static inline u32 xe_uc_fw_get_upload_size(struct xe_uc_fw *uc_fw)
 	return __xe_uc_fw_get_upload_size(uc_fw);
 }
 
-#define XE_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915"
+#define XE_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 1cfd30a655df..6c595aaa2399 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -78,6 +78,13 @@ struct xe_uc_fw {
 	const char *path;
 	/** @user_overridden: user provided path to uC firmware via modparam */
 	bool user_overridden;
+	/**
+	 * @full_version_required: driver still under development and not ready
+	 * for backward-compatible firmware. To be used only for **new**
+	 * platforms, i.e. still under require_force_probe protection and not
+	 * supported by i915.
+	 */
+	bool full_ver_required;
 	/** @size: size of uC firmware including css header */
 	size_t size;
 
-- 
2.39.0

