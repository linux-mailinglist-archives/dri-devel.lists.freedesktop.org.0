Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216A6C76F3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 06:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5B110E4BD;
	Fri, 24 Mar 2023 05:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECE010E4B5;
 Fri, 24 Mar 2023 05:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679635190; x=1711171190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8xqtzrq3sPtULobavNuYB4vQQRRc/YGl/SDqhhJY/ng=;
 b=PHGM3NLnHR7hYrCFlyis/j6neOzjH7MHdCZprC8RUgBPLeat8HCjQc9N
 Z29KFxjWk+tVcGEPm4CjYwrcI+KUnYWR6tHcSb5GBCa2B8BkMlcndrxSe
 Ug4UXX7MG7w7vfieiu3lxVMy5Jj4qnfSLOk7/093v8Yur8+rIe3++ufKk
 0miDQtAXjSP7tPukBKom2K8DGs0fFAgMB95bYlpuO898dERIjP94+0Jzn
 BMtQ+mZFbpG3DmNmPPdox7ZYqlN7bgiBOvkmgXPyHv62Dhhqw2cfSK1dy
 FsrCkiBKvSla/S8V0vEzlLfP+hKmbJHINeQEpAyH0hqyXNHu5jRoaxtUp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341262579"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="341262579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806523066"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="806523066"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Remove unused revid from firmware name
Date: Thu, 23 Mar 2023 22:17:52 -0700
Message-Id: <20230324051754.1346390-2-lucas.demarchi@intel.com>
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

The rev field is always 0 so it ends up never used. In i915 it was
introduced because of CML: up to rev 5 it reuses the guc and huc
firmware blobs from KBL. After that there is a specific firmware for
that platform.  This can be reintroduced later if ever needed.

With the removal of revid the packed attribute in
uc_fw_platform_requirement, which is there only for reducing the space
these tables take, can also be removed since it has even more limited
usefulness: currently there's only padding of 2 bytes. Remove the
attribute to avoid the unaligned access.

	$ pahole -C uc_fw_platform_requirement build64/drivers/gpu/drm/xe/xe_uc_fw.o
	struct uc_fw_platform_requirement {
		enum xe_platform           p;                    /*     0     4 */
		const struct uc_fw_blob    blob;                 /*     4    10 */

		/* size: 16, cachelines: 1, members: 2 */
		/* padding: 2 */
		/* last cacheline: 16 bytes */
	};

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e9b30e620fd9..e2c982b37e87 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -39,21 +39,21 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 
 /*
  * List of required GuC and HuC binaries per-platform.
- * Must be ordered based on platform + revid, from newer to older.
+ * Must be ordered based on platform, from newer to older.
  */
 #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-	fw_def(METEORLAKE,   0, guc_def(mtl,  70, 5, 2)) \
-	fw_def(ALDERLAKE_P,  0, guc_def(adlp,  70, 5, 2)) \
-	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 5, 2)) \
-	fw_def(PVC,          0, guc_def(pvc,  70, 5, 2)) \
-	fw_def(DG2,          0, guc_def(dg2,  70, 5, 2)) \
-	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
-	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
+	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
+	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
+	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
+	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
+	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
+	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
+	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
-	fw_def(ALDERLAKE_S,  0, huc_def(tgl)) \
-	fw_def(DG1,          0, huc_def(dg1)) \
-	fw_def(TIGERLAKE,    0, huc_def(tgl))
+	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
+	fw_def(DG1,		huc_def(dg1)) \
+	fw_def(TIGERLAKE,	huc_def(tgl))
 
 #define __MAKE_HUC_FW_PATH(prefix_, name_) \
         "i915/" \
@@ -82,7 +82,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
-#define XE_UC_MODULE_FW(platform_, revid_, uc_) \
+#define XE_UC_MODULE_FW(platform_, uc_) \
 	MODULE_FIRMWARE(uc_);
 
 XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
@@ -109,16 +109,14 @@ struct __packed uc_fw_blob {
 	UC_FW_BLOB(major_, minor_, \
 		   MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, bld_num_))
 
-struct __packed uc_fw_platform_requirement {
+struct uc_fw_platform_requirement {
 	enum xe_platform p;
-	u8 rev; /* first platform rev using this FW */
 	const struct uc_fw_blob blob;
 };
 
-#define MAKE_FW_LIST(platform_, revid_, uc_) \
+#define MAKE_FW_LIST(platform_, uc_) \
 { \
 	.p = XE_##platform_, \
-	.rev = revid_, \
 	.blob = uc_, \
 },
 
@@ -143,7 +141,6 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	static const struct uc_fw_platform_requirement *fw_blobs;
 	enum xe_platform p = xe->info.platform;
 	u32 fw_count;
-	u8 rev = xe->info.revid;
 	int i;
 
 	XE_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
@@ -151,7 +148,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	fw_count = blobs_all[uc_fw->type].count;
 
 	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
-		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
+		if (p == fw_blobs[i].p) {
 			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
 
 			uc_fw->path = blob->path;
-- 
2.39.0

