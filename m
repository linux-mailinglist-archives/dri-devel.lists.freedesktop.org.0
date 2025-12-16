Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F10CC5427
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 22:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C09710E9A0;
	Tue, 16 Dec 2025 21:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilnox7Kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535E110E9A3;
 Tue, 16 Dec 2025 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765921763; x=1797457763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xxrKb1+WZ3dK2taRKM+Qp19tPe/czuxss4lFiu/4ur4=;
 b=ilnox7KbljrXVmKqurHWJhR27iM+XV/6Dvb8RmWOUYz4jNle9HGgVRda
 tXCVu3/2JC3T/sthb3IJV5mLT4XCLKwcvZfWp6ieL49dxnnDzw6t9w6x3
 oj61sc3OFvQpZwYza27cPSws9xSo6RDHvn2jqxrhHjGnI+DIwTpk+VZjC
 LztklrZvO7qnL2ZjQ64sTVWNQUve0itnbAbk7JvSQuVUI8D/LXM3G5xvE
 iFghCa1qQnr4KGT0oiCVKK4t8ZijBxS5QnXaxEXjEV/YnvBUWZMgogMTr
 qXEGcUP5joRCox0fA/OTr0KyGtmCqkKcsPANkRmgqmE3SEefFxJr7rLbR Q==;
X-CSE-ConnectionGUID: j6/U3VICSoG7CBjceCipuA==
X-CSE-MsgGUID: GU1uIhKeSLijyDhnhxt7GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67045819"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67045819"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:49:22 -0800
X-CSE-ConnectionGUID: zPGQZPkXSW+7blb27trF/w==
X-CSE-MsgGUID: QzOYjtvRSnGYQ10hE9piuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198615340"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:49:21 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
Date: Tue, 16 Dec 2025 22:48:57 +0100
Message-ID: <20251216214902.1429-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216214902.1429-1-michal.wajdeczko@intel.com>
References: <20251216214902.1429-1-michal.wajdeczko@intel.com>
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
Acked-by: Matthew Brost <matthew.brost@intel.com>
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

