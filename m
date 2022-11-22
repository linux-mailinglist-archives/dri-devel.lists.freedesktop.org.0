Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A77634B1E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB3910E1C0;
	Tue, 22 Nov 2022 23:33:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF1E10E1C0;
 Tue, 22 Nov 2022 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669160017; x=1700696017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H3AKDQBWc9Er+UexkHDePHdFxjPxe2dZNKfmhPa/w8w=;
 b=mDvegfX6cKpCJrKfDMjJyXrqZc2I4mwNRht0SiN+6tuDN3PLLmoGWYZd
 BzGjtUd9hOUBH6NfzxZZYe6OpBOS3fNxybBoO9I0bYEgH93m6d1fEwGXP
 XEe2h6uSCBXALI5rTTuHGyHn/6/u6Fi6J/VHok/kU0VHsaVQhJcJIS1lX
 h67gPwAdeOdNX7VFUWH9D/lUKicyB+jlG4NPR3hEFHi6n585i5VtZjqaI
 zl2fXbUxBtNi8bDXcOi0CFNXHSmEntZc1fBLHbgGiHkj8CKpcEvhGNdSf
 lX2FOHHqKn+ZxAiDuWItlgF3XoXV3X1n0PsFrvK4Lx0MzYAAFwSMO/Zxb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="378194773"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="378194773"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 15:33:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="747550124"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="747550124"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2022 15:33:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/uc: Fix table order verification to check all FW
 types
Date: Tue, 22 Nov 2022 15:33:28 -0800
Message-Id: <20221122233328.854217-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

It was noticed that the table order verification step was only being
run once rather than once per firmware type. Fix that.

Note that the long term plan is to convert this code to be a mock
selftest. It is already only compiled in when selftests are enabled.
And the work involved in the conversion was estimated to be
non-trivial. So that conversion is currently low on the priority list.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 0c80ba51a4bdc..31613c7e0838b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -238,7 +238,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
 		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
 	};
-	static bool verified;
+	static bool verified[INTEL_UC_FW_NUM_TYPES];
 	const struct uc_fw_platform_requirement *fw_blobs;
 	enum intel_platform p = INTEL_INFO(i915)->platform;
 	u32 fw_count;
@@ -291,8 +291,8 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 	}
 
 	/* make sure the list is ordered as expected */
-	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified) {
-		verified = true;
+	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
+		verified[uc_fw->type] = true;
 
 		for (i = 1; i < fw_count; i++) {
 			/* Next platform is good: */
@@ -343,7 +343,8 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 				continue;
 
 bad:
-			drm_err(&i915->drm, "Invalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
+			drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
+				intel_uc_fw_type_repr(uc_fw->type),
 				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
 				fw_blobs[i - 1].blob.legacy ? "L" : "v",
 				fw_blobs[i - 1].blob.major,
-- 
2.37.3

