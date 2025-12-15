Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67CCBFB6D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05E810E4BD;
	Mon, 15 Dec 2025 20:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3zGqBzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD1E10E272;
 Mon, 15 Dec 2025 20:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765829914; x=1797365914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=75sX6hA9sbXqveHOcok3izLFKNkFvjJix2TGY96a5QU=;
 b=B3zGqBzF1Ark+dGOgNn3E2O35jdpKF+wypVf5VC4pq/CUw546/hUaVjb
 DWU1hhlt5Eg/R8rD42b/t7wWVBQXaTRLBk2VpG+GxTpdfBWNvXgwFUyY9
 TbybLax4jt1kCLgwTKUG1Z4zgl3eEBAfKKtGUc5XtmPiq7l3ascspAH/L
 R3pIWJ2lkZ55jPk0LmF91C4uQXtuz0xA25PSz61g8oNz+ax5EfLwpzzI5
 oO1lPJCo4W/EQCg5fLaWINfjfog8R5hUYjMmb+NEHOqkhj4zTdU/o+CAk
 b1qKqL7FZSLKBxnVSjkwAKlMBIwxqs95KceLn+C76y53Q6U7YKBg2xOKl Q==;
X-CSE-ConnectionGUID: 52CBhemKQd+5Ft5nHbMDPw==
X-CSE-MsgGUID: BASuNyLtRQqBKz7dURyQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85154307"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85154307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 12:18:34 -0800
X-CSE-ConnectionGUID: XFZ2RMBOTS6mVQyTdT0dyw==
X-CSE-MsgGUID: dXH59kC2R7uizEIm3r8n8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228895883"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 12:18:32 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
Date: Mon, 15 Dec 2025 21:18:02 +0100
Message-ID: <20251215201806.196514-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215201806.196514-1-michal.wajdeczko@intel.com>
References: <20251215201806.196514-1-michal.wajdeczko@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are already few places in the code where we need to check GuC
firmware version. Wrap existing raw conditions into a named helper
macro to make it clear and avoid explicit call of the MAKE_GUC_VER.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                   | 21 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c               |  4 ++--
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 3174a8dee779..7410e7b93256 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -1026,7 +1026,7 @@ static void action_ring_cleanup(void *arg)
 
 static void pf_gt_migration_check_support(struct xe_gt *gt)
 {
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
+	if (!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 54))
 		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index fdb08658d05a..a169f231cbd8 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,10 +18,16 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define MAKE_GUC_VER_ARGS(ver...) \
+	(BUILD_BUG_ON_ZERO(COUNT_ARGS(ver) < 2 || COUNT_ARGS(ver) > 3) + \
+	 MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
+
 #define GUC_SUBMIT_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
 #define GUC_FIRMWARE_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
+#define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
+	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
 
 struct drm_printer;
 
@@ -96,4 +102,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
 	return &guc_to_xe(guc)->drm;
 }
 
+/**
+ * xe_guc_fw_version_at_least() - Check if GuC is at least of given version.
+ * @guc: the &xe_guc
+ * @ver: the version to check
+ *
+ * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
+ *
+ * Return: true if loaded GuC firmware is at least of given version,
+ *         false otherwise.
+ */
+static inline bool xe_guc_fw_version_at_least(const struct xe_guc *guc, u32 ver)
+{
+	return GUC_FIRMWARE_VER(guc) >= ver;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e06c6aa335bf..5feeb91426ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -347,10 +347,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
 
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_GT_WA(gt, 16026508708))
+	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_GT_WA(gt, 16026007364)) {
+	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
 		u32 data[] = {
 			0x0,
 			0xF,
-- 
2.47.1

