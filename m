Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0ED6ACF86
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294EE10E24C;
	Mon,  6 Mar 2023 20:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7910E233;
 Mon,  6 Mar 2023 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678135819; x=1709671819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RcP4f5gSrcy9ihbcqvqaqRvVyE+lcApv0vn/41WsstM=;
 b=AU5K3GjxpejFuOsVhsLPuFzUT8Lau0OYsiCO5QUfl8u3Y0qC+geEWUpg
 wZ/FHOKjRsYfMGPWNW4ZJfBnb1Tzz4rV2lTuSagg8XCVdfg3+5OKatcwB
 p4XVdlNpUgqo3lBHhaVedImMBj9GA1Aa01xuRTHoVkSqLVakxwCvrn0EA
 Cc1KlgKlZaQ9xWJqQC9iEdIWhPlpR5V4E7b6DOdYWMzibldzzT385zSOX
 b6jKM/DIE1kgBvVdrWv/Mv34Kj/hrptr7MJCPpaO3f3lyOr5OLbZb419E
 MoVoWzKSgLZIRU/9X8uRY14AWGu8/qBym1Qs7ClTG3JsAOg7ZofT3NlIw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319499959"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="319499959"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669615308"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="669615308"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:50:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Remove redundant check for DG1
Date: Mon,  6 Mar 2023 12:49:52 -0800
Message-Id: <20230306204954.753739-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
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

dg1_gt_workarounds_init() is only ever called for DG1, so there is no
point checking it again.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 32aa1647721a..eb6cc4867d67 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1472,21 +1472,15 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 static void
 dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	struct drm_i915_private *i915 = gt->i915;
-
 	gen12_gt_workarounds_init(gt, wal);
 
 	/* Wa_1409420604:dg1 */
-	if (IS_DG1(i915))
-		wa_mcr_write_or(wal,
-				SUBSLICE_UNIT_LEVEL_CLKGATE2,
-				CPSSUNIT_CLKGATE_DIS);
+	wa_mcr_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE2,
+			CPSSUNIT_CLKGATE_DIS);
 
 	/* Wa_1408615072:dg1 */
 	/* Empirical testing shows this register is unaffected by engine reset. */
-	if (IS_DG1(i915))
-		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
-			    VSUNIT_CLKGATE_DIS_TGL);
+	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL);
 }
 
 static void
-- 
2.39.0

