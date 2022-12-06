Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10315643A99
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 02:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CDF10E2EB;
	Tue,  6 Dec 2022 01:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA5C10E0E1;
 Tue,  6 Dec 2022 01:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670289322; x=1701825322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+I4cPEzjB6CCLdYA8r8MSYneRzVYVvZv8u6k3MH025g=;
 b=bv1AZdfg/x5YFXMHakj7RtVwJuk5FNczRQveHZbp8y1Vu+wJltcFMCtr
 ueYPU5BeOtsTw6wbgUnkaZyJpG/9q+bDli9FhA13tHEGQKvUofZ46Ffst
 YO1byXnitRRI5vxgIrz31UxW5YErIW5i+MF6mmBdlilfYs83NlX0MUr/f
 MI7ywJ/btSXOOlUXEFVpN4v+BdLA1rMPrWNGB51LNBqO/2DO9heGZua01
 oFcvo0iDctbXbcAHki7T8ixqCIRl3bBB6M7uOcUmQWcsrYgyhVfoL72cA
 ZDycASKjiiavrL7bp0cSvQOUAQqVPI+PkAI5k1QFitS8XDvbsMnFNI+/7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317650465"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="317650465"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="974890706"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="974890706"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:21 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/i915/gsc: Skip the version check when fetching the
 GSC FW
Date: Mon,  5 Dec 2022 17:19:04 -0800
Message-Id: <20221206011908.2745508-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
References: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current exectation from the FW side is that the driver will query
the GSC FW version after the FW is loaded, similarly to what the mei
driver does on DG2. However, we're discussing with the FW team if there
is a way to extract the version from the bin file before loading, so we
can keep the code the same as for older FWs.

Since the GSC FW version is not currently required for functionality and
is only needed for debug purposes, we can skip the FW version for now at
fetch time and add it later on when we've agreed on the approach.

v2: rebased on uc_fw version struct changes.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v1
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 29 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 1d6249d4b8ef..78ab60c07a2b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -655,6 +655,26 @@ static bool guc_check_version_range(struct intel_uc_fw *uc_fw)
 	return true;
 }
 
+static int check_fw_header(struct intel_gt *gt,
+			   const struct firmware *fw,
+			   struct intel_uc_fw *uc_fw)
+{
+	int err = 0;
+
+	/* GSC FW version is queried after the FW is loaded */
+	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
+		return 0;
+
+	if (uc_fw->loaded_via_gsc)
+		err = check_gsc_manifest(fw, uc_fw);
+	else
+		err = check_ccs_header(gt, fw, uc_fw);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 /**
  * intel_uc_fw_fetch - fetch uC firmware
  * @uc_fw: uC firmware
@@ -724,17 +744,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	if (uc_fw->loaded_via_gsc)
-		err = check_gsc_manifest(fw, uc_fw);
-	else
-		err = check_ccs_header(gt, fw, uc_fw);
+	err = check_fw_header(gt, fw, uc_fw);
 	if (err)
 		goto fail;
 
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && !guc_check_version_range(uc_fw))
 		goto fail;
 
-	if (uc_fw->file_wanted.ver.major) {
+	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
 			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
@@ -751,7 +768,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		}
 	}
 
-	if (old_ver) {
+	if (old_ver && uc_fw->file_selected.ver.major) {
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-- 
2.37.3

