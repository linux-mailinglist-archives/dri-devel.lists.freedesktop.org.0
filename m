Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D593574F917
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 22:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F37F10E42D;
	Tue, 11 Jul 2023 20:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7C10E42C;
 Tue, 11 Jul 2023 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689107521; x=1720643521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MquciJ6QKsOAYAFsVwDCxdfeWAquYL/aDPRdcCPxUKs=;
 b=R3k1pMw8vvZXcQ8BF7T2zB5hqyAPeK+B5IZx00AvChggVymjmgyD4He6
 gN9NJQi/TiHbIKR+RHjKEuiL0ypBp1MbTFPn7TZYC9bQzM1bAmS5Z4t6R
 mlvsnzEwpeY90pfbb+bgJMBsmoC21Y0/fuCAdwdHpOg0jR7tBb99F2sDK
 TyvGLZ+ju8nrZN89FzU32y2U7efjUDV7HjCUw69beHc9LJQuB9IVaRXhr
 GD+MY4cQ5KiKfSRP0beusPlazVy2rFhHAXuUp1xCKWgQGvo6Nuk6oEfzH
 F2arr/rgrcwiHBG0C7okH6DKaRr8EVlR12BR6jyMzGGKBaP9EpPsNxkhf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451090331"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="451090331"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 13:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715313364"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="715313364"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 13:31:58 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: check HuC and GuC version compatibility on MTL
Date: Tue, 11 Jul 2023 13:31:50 -0700
Message-ID: <20230711203150.4140313-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a change in the auth flow on MTL, GuC 70.7.0 and newer will only
be able to authenticate HuC 8.5.1 and newer. The plan is to update the 2
binaries sinchronously in linux-firmware so that the fw repo always has
a matching pair that works; still, it's better to check in the kernel so
we can print an error message and abort HuC loading if the binaries are
out of sync instead of failing the authentication.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 08e16017584b..f0cc5bb47fa0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -803,11 +803,53 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
 	return 0;
 }
 
+static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
+					   struct intel_uc_fw_file *huc_selected)
+{
+	struct intel_uc_fw_file *guc_selected = &gt->uc.guc.fw.file_selected;
+	struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
+	struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
+	bool new_huc;
+	bool new_guc;
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
+	if (IS_METEORLAKE(gt->i915) && uc_fw->type == INTEL_UC_FW_TYPE_HUC) {
+		ret = check_mtl_huc_guc_compatibility(gt, selected);
+		if (ret)
+			return ret;
+	}
 
 	if (!wanted->ver.major || !selected->ver.major)
 		return 0;
-- 
2.41.0

