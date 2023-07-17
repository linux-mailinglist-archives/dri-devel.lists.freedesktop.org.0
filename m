Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366387570A8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 01:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645DB10E028;
	Mon, 17 Jul 2023 23:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8473410E00D;
 Mon, 17 Jul 2023 23:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689637758; x=1721173758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uYG1LLb+JivMm5Dlq/SKhXP70yp1cKkqg/XKXMOgZLs=;
 b=Qrz+gmSu5GZqgigG3HxMPr/BRN7hQVaQoV2BbOQfGlA46F5Jns5fSMxn
 euw4aoY1001z4Yhtmud2/8aZ0PgEsEwS58plofgEcbxN2wCVowc1v9OLi
 ChoTYYCPfXDmSOy9FORNL2mO5cn+Gv4DN28eJtBzbmQQ9fW2SQXm9TZYS
 3ewRhq4SoerOM4WY5pP926Fdo1ylz4s1VHmYULNLIM/vISFnu40MJaASB
 yGX7LotVZocq2sdY+MYLzXwlQLlGeM+g5zm0w1MVs9BhFVmom2a4qiP3R
 scJSJrmvoWDgnOPAJggvpeUUa+FUzf8InjFFD+CLXS6zrUquHGUkfBgX+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368708136"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="368708136"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 16:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="866873264"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 16:49:17 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/huc: check HuC and GuC version compatibility on
 MTL
Date: Mon, 17 Jul 2023 16:49:05 -0700
Message-ID: <20230717234905.117114-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a change in the auth flow on MTL, GuC 70.7.0 and newer will only
be able to authenticate HuC 8.5.1 and newer. The plan is to update the 2
binaries synchronously in linux-firmware so that the fw repo always has
a matching pair that works; still, it's better to check in the kernel so
we can print an error message and abort HuC loading if the binaries are
out of sync instead of failing the authentication.

v2: Add clarification comment, fix typo in commit msg, clean up variable
declaration (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> #v1
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 08e16017584b..7aadad5639c3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -803,11 +803,57 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
 	return 0;
 }
 
+static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
+					   struct intel_uc_fw_file *huc_selected)
+{
+	struct intel_uc_fw_file *guc_selected = &gt->uc.guc.fw.file_selected;
+	struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
+	struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
+	bool new_huc, new_guc;
+
+	/* we can only do this check after having fetched both GuC and HuC */
+	GEM_BUG_ON(!huc_selected->path || !guc_selected->path);
+
+	/*
+	 * Due to changes in the authentication flow for MTL, HuC 8.5.1 or newer
+	 * requires GuC 70.7.0 or newer. Older HuC binaries will instead require
+	 * GuC < 70.7.0.
+	 */
+	new_huc = huc_ver->major > 8 ||
+		  (huc_ver->major == 8 && huc_ver->minor > 5) ||
+		  (huc_ver->major == 8 && huc_ver->minor == 5 && huc_ver->patch >= 1);
+
+	new_guc = guc_ver->major > 70 ||
+		  (guc_ver->major == 70 && guc_ver->minor >= 7);
+
+	if (new_huc != new_guc) {
+		UNEXPECTED(gt, "HuC %u.%u.%u is incompatible with GuC %u.%u.%u\n",
+			   huc_ver->major, huc_ver->minor, huc_ver->patch,
+			   guc_ver->major, guc_ver->minor, guc_ver->patch);
+		gt_info(gt, "MTL GuC 70.7.0+ and HuC 8.5.1+ don't work with older releases\n");
+		return -ENOEXEC;
+	}
+
+	return 0;
+}
+
 int intel_uc_check_file_version(struct intel_uc_fw *uc_fw, bool *old_ver)
 {
 	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 	struct intel_uc_fw_file *wanted = &uc_fw->file_wanted;
 	struct intel_uc_fw_file *selected = &uc_fw->file_selected;
+	int ret;
+
+	/*
+	 * MTL has some compatibility issues with early GuC/HuC binaries
+	 * not working with newer ones. This is specific to MTL and we
+	 * don't expect it to extend to other platforms.
+	 */
+	if (IS_METEORLAKE(gt->i915) && uc_fw->type == INTEL_UC_FW_TYPE_HUC) {
+		ret = check_mtl_huc_guc_compatibility(gt, selected);
+		if (ret)
+			return ret;
+	}
 
 	if (!wanted->ver.major || !selected->ver.major)
 		return 0;
-- 
2.41.0

