Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA86EB537
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 00:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115410EF21;
	Fri, 21 Apr 2023 22:47:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0E10EF1E;
 Fri, 21 Apr 2023 22:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682117267; x=1713653267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N5Nz96zPTT4S7mlCkKCfzlD42lLGoMbiPHT6/A6l4MA=;
 b=VpaCsIrVds41sU9DkTdbWIpTTBZIOC0w/tff1xdsviSgmG5lAGxPUxb7
 ZyggYeQSaurs19onEnbcGkJNwb1zp4rbTdkHBlo8iKqjzBfOW1hVtNvAz
 eQxp/HMgt5nZz/JxTxPpSooT2+l3SwiiTrq7eIvv0eq4GQjMf1oPS0eTT
 IZFDqKXN+rBNPrVymXDk06QtJIWwru7At9RZpzwopWOZqEqg9qzGaG3il
 X+8hYsarIh0vD9JCDtNBoYtVUjJvM5JSytc7UYWPw0t2It976k/atC1Q3
 jHSfj+R0mJqjY+MIep1bzwQKrDzU9us96d0xg6+8zZCJhqXtprhBhKmhU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="374033672"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="374033672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642669301"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="642669301"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 15:47:46 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Actually return an error if GuC version range
 check fails
Date: Fri, 21 Apr 2023 15:47:42 -0700
Message-Id: <20230421224742.2357198-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dan Carpenter <error27@gmail.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Dan Carpenter pointed out that 'err' was not being set in the case
where the GuC firmware version range check fails. Fix that.

Note that while this is bug fix for a previous patch (see Fixes tag
below). It is an exceedingly low risk bug. The range check is
asserting that the GuC firmware version is within spec. So it should
not be possible to ever have a firmware file that fails this check. If
larger version numbers are required in the future, that would be a
backwards breaking spec change and thus require a major version bump,
in which case an old i915 driver would not load that new version anyway.

Fixes: 9bbba0667f37 ("drm/i915/guc: Use GuC submission API version number")
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index a82a53dbbc86d..6b71b9febd74c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -636,9 +636,10 @@ static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
 	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
 }
 
-static bool guc_check_version_range(struct intel_uc_fw *uc_fw)
+static int guc_check_version_range(struct intel_uc_fw *uc_fw)
 {
 	struct intel_guc *guc = container_of(uc_fw, struct intel_guc, fw);
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 
 	/*
 	 * GuC version number components are defined as being 8-bits.
@@ -647,24 +648,24 @@ static bool guc_check_version_range(struct intel_uc_fw *uc_fw)
 	 */
 
 	if (!is_ver_8bit(&uc_fw->file_selected.ver)) {
-		gt_warn(__uc_fw_to_gt(uc_fw), "%s firmware: invalid file version: 0x%02X:%02X:%02X\n",
+		gt_warn(gt, "%s firmware: invalid file version: 0x%02X:%02X:%02X\n",
 			intel_uc_fw_type_repr(uc_fw->type),
 			uc_fw->file_selected.ver.major,
 			uc_fw->file_selected.ver.minor,
 			uc_fw->file_selected.ver.patch);
-		return false;
+		return -EINVAL;
 	}
 
 	if (!is_ver_8bit(&guc->submission_version)) {
-		gt_warn(__uc_fw_to_gt(uc_fw), "%s firmware: invalid submit version: 0x%02X:%02X:%02X\n",
+		gt_warn(gt, "%s firmware: invalid submit version: 0x%02X:%02X:%02X\n",
 			intel_uc_fw_type_repr(uc_fw->type),
 			guc->submission_version.major,
 			guc->submission_version.minor,
 			guc->submission_version.patch);
-		return false;
+		return -EINVAL;
 	}
 
-	return true;
+	return i915_inject_probe_error(gt->i915, -EINVAL);
 }
 
 static int check_fw_header(struct intel_gt *gt,
@@ -773,8 +774,11 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && !guc_check_version_range(uc_fw))
-		goto fail;
+	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
+		err = guc_check_version_range(uc_fw);
+		if (err)
+			goto fail;
+	}
 
 	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
 		/* Check the file's major version was as it claimed */
-- 
2.39.1

