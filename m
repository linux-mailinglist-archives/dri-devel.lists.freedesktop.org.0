Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CE5636D9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 17:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4CB14A8F1;
	Fri,  1 Jul 2022 15:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2F14A8F1;
 Fri,  1 Jul 2022 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656688961; x=1688224961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HrxbM2+bHrLA5AgledQallaEm/3UO5xWxg9IJSrV1Dw=;
 b=haBrZCCq6LGAV4RZ4r8RrY1C2izq4sRc+nd8sU3vFyVuAUa+RRjevF+T
 86H3NOMvhNOHiDZhQFhDA86foa+0F8zRMcjU6XGBvKgBaYHAhtVGClZaT
 7pFRtw3P3SBvi0fAPGukNeabJSIxEtpnAKGR/C3N1QCw+WRwaTU91RhgI
 YFc8UMbvnWW1nwCAFCky3sFWZobamVViQRgekgWNz7lXA0pOBcPeSrVM8
 ANoJgg8U2DlkuJTX6gNSJbj2hZ70rxRpA7j766A1nJf9KR9nPsnZ8jR04
 ihujEJvEuCM33U8o4GJYBj1RnGh8fEz7wDE+OZMmZ5mTOFcXyBCRiqFyf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="281437798"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="281437798"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 08:22:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="596289672"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 08:22:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] Revert "topic/core-for-CI: Add remaining DG2 and ATS-M
 device IDs"
Date: Fri,  1 Jul 2022 08:22:30 -0700
Message-Id: <20220701152231.529511-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit f7d7dddaab81eeae4508197b5f38f0b974d97b8c.

In reality we'll just rebase this patch out of the topic/core-for-CI
branch after landing the "real" copy in drm-intel.  But to prevent
pre-merge CI from getting confused, we send it as an explicit revert on
the mailing list.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c          |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c |  2 --
 include/drm/i915_pciids.h                | 25 +++---------------------
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 0cdd6513fbb7..5edc8fbf1dff 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1075,6 +1075,7 @@ static const struct intel_device_info dg2_info = {
 	.require_force_probe = 1,
 };
 
+__maybe_unused
 static const struct intel_device_info ats_m_info = {
 	DG2_FEATURES,
 	.display = { 0 },
@@ -1188,7 +1189,6 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_RPLS_IDS(&adl_s_info),
 	INTEL_RPLP_IDS(&adl_p_info),
 	INTEL_DG2_IDS(&dg2_info),
-	INTEL_ATS_M_IDS(&ats_m_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index f0bf23726ed8..7eb893666595 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -189,12 +189,10 @@ static const u16 subplatform_rpl_ids[] = {
 
 static const u16 subplatform_g10_ids[] = {
 	INTEL_DG2_G10_IDS(0),
-	INTEL_ATS_M150_IDS(0),
 };
 
 static const u16 subplatform_g11_ids[] = {
 	INTEL_DG2_G11_IDS(0),
-	INTEL_ATS_M75_IDS(0),
 };
 
 static const u16 subplatform_g12_ids[] = {
diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index 4585fed4e41e..283dadfbb4db 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -696,41 +696,22 @@
 #define INTEL_DG2_G10_IDS(info) \
 	INTEL_VGA_DEVICE(0x5690, info), \
 	INTEL_VGA_DEVICE(0x5691, info), \
-	INTEL_VGA_DEVICE(0x5692, info), \
-	INTEL_VGA_DEVICE(0x56A0, info), \
-	INTEL_VGA_DEVICE(0x56A1, info), \
-	INTEL_VGA_DEVICE(0x56A2, info)
+	INTEL_VGA_DEVICE(0x5692, info)
 
 #define INTEL_DG2_G11_IDS(info) \
 	INTEL_VGA_DEVICE(0x5693, info), \
 	INTEL_VGA_DEVICE(0x5694, info), \
 	INTEL_VGA_DEVICE(0x5695, info), \
-	INTEL_VGA_DEVICE(0x56A5, info), \
-	INTEL_VGA_DEVICE(0x56A6, info), \
-	INTEL_VGA_DEVICE(0x56B0, info), \
-	INTEL_VGA_DEVICE(0x56B1, info)
+	INTEL_VGA_DEVICE(0x56B0, info)
 
 #define INTEL_DG2_G12_IDS(info) \
 	INTEL_VGA_DEVICE(0x5696, info), \
 	INTEL_VGA_DEVICE(0x5697, info), \
-	INTEL_VGA_DEVICE(0x56A3, info), \
-	INTEL_VGA_DEVICE(0x56A4, info), \
-	INTEL_VGA_DEVICE(0x56B2, info), \
-	INTEL_VGA_DEVICE(0x56B3, info)
+	INTEL_VGA_DEVICE(0x56B2, info)
 
 #define INTEL_DG2_IDS(info) \
 	INTEL_DG2_G10_IDS(info), \
 	INTEL_DG2_G11_IDS(info), \
 	INTEL_DG2_G12_IDS(info)
 
-#define INTEL_ATS_M150_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C0, info)
-
-#define INTEL_ATS_M75_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C1, info)
-
-#define INTEL_ATS_M_IDS(info) \
-	INTEL_ATS_M150_IDS(info), \
-	INTEL_ATS_M75_IDS(info)
-
 #endif /* _I915_PCIIDS_H */
-- 
2.36.1

