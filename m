Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF196FA07
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 19:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D15610E1AA;
	Fri,  6 Sep 2024 17:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buz15/Vl";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1113910E1AA;
 Fri,  6 Sep 2024 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725644440; x=1757180440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LdgDGMPmb4eVJNXxRBsfn42gcT1z+9PBTaltaJNrGWY=;
 b=buz15/Vl5SyJcAOG6IadgByHsLyX/YciKbiT4GRItOD3y8u2fp4suAgC
 FrCcsFzULew38HZRfdchptBIJ39GdJohUTJnXXMAKR199DLyHX9iftMDa
 olxvv1jo2d6OKZBo53cpnPT8tVqIkqW4JWVxQPtHtMMYEecOTsDJRPu07
 0q2cmn6Qnotf1pb2U2etlDwkw/VIRFr+bPdXupNy4YaI6ZkNZi++7KIiC
 zWJmdx+SThy0cTxOPzqvM2XwQtXC6+Pde4+U3ZjpfcGRLs64OVmRxaEP8
 3gmNlsy6NhUQWAUt1QJmTP5mUmirbHs1BsFYuIa2djKxQus4TpZYfJCo0 A==;
X-CSE-ConnectionGUID: OQXtHvSqSOOWdzlGdaC5OQ==
X-CSE-MsgGUID: Zf8YWDmuTpaVU2GawNIicw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24564786"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24564786"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 10:40:39 -0700
X-CSE-ConnectionGUID: w39dE457SiGBVZHWDuOqtg==
X-CSE-MsgGUID: THLCuABWRKu05SjFVwd5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66012040"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2024 10:40:39 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, Juston Li <juston.li@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2] drm/i915/guc: Enable PXP GuC autoteardown flow
Date: Fri,  6 Sep 2024 10:40:38 -0700
Message-ID: <20240906174038.1468026-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Juston Li <juston.li@intel.com>

This feature flag enables GuC autoteardown which allows for a grace
period before session teardown.

Also add a HAS_PXP() helper to share with the other place that wants
to check.

Signed-off-by: Juston Li <juston.li@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 8 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 +
 drivers/gpu/drm/i915/i915_drv.h             | 3 +++
 drivers/gpu/drm/i915/pxp/intel_pxp.c        | 2 +-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 097fc6bd1285e..5949ff0b0161f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -239,8 +239,16 @@ static u32 guc_ctl_debug_flags(struct intel_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
 	u32 flags = 0;
 
+	/*
+	 * Enable PXP GuC autoteardown flow.
+	 * NB: MTL does things differently.
+	 */
+	if (HAS_PXP(gt->i915) && !IS_METEORLAKE(gt->i915))
+		flags |= GUC_CTL_ENABLE_GUC_PXP_CTL;
+
 	if (!intel_guc_submission_is_used(guc))
 		flags |= GUC_CTL_DISABLE_SCHEDULER;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 263c9c3f6a034..4ce6e2332a63f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -105,6 +105,7 @@
 #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
 
 #define GUC_CTL_FEATURE			2
+#define   GUC_CTL_ENABLE_GUC_PXP_CTL	BIT(1)
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 39f6614a0a99a..faeba9732422f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -693,6 +693,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_RPS(i915)	(INTEL_INFO(i915)->has_rps)
 
+#define HAS_PXP(i915) \
+	(IS_ENABLED(CONFIG_DRM_I915_PXP) && INTEL_INFO(i915)->has_pxp)
+
 #define HAS_HECI_PXP(i915) \
 	(INTEL_INFO(i915)->has_heci_pxp)
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 75278e78ca90e..5e0bf776aac0f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -170,7 +170,7 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
 
 static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_private *i915)
 {
-	if (!IS_ENABLED(CONFIG_DRM_I915_PXP) || !INTEL_INFO(i915)->has_pxp)
+	if (!HAS_PXP(i915))
 		return NULL;
 
 	/*
-- 
2.46.0

