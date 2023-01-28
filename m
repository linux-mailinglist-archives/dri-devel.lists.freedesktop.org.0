Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4972267FA9F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 20:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1201210E1F4;
	Sat, 28 Jan 2023 19:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A88810E070;
 Sat, 28 Jan 2023 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935962; x=1706471962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P4i1ulhhdRq3MwiP3scXvqlpOdhmBBDy9TbFuXyrI2k=;
 b=i2MB+K6MS0H64XDX4rE3su9Nc4L4M2bSS9a2bFqHQcjuJBfVjwOfNLsW
 yZ6PWFh2DO/zYN0ob3p9z5rjd+7eQd1qQYiy3Y2dPZtULjDW17xctugEH
 4nNPxDZbxWs7kk3Gcf6XDUG9TuOePb3NWG/x+myQ09kT9CftiY+YfU19V
 Cky+2TOfDV8fZ8/pK41Ka9L/X+h1KYZsy/VZd2S+7lvj2t5gO1J96eWJt
 Q7EWgf3c1M3QMD/JBN2hqEeReHt8uEj5JF1G402UdblfU9tqlZ07XTtxK
 HfpKlpFEB7J3uS7hyCS76drF34btH2pwRJarwly2Fyr4auUPxdcnXyIby A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978117"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978117"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567932"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567932"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:20 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 62AD8333F0;
 Sat, 28 Jan 2023 19:59:19 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/8] drm/i915/guc: Update GuC messages in intel_guc_ads.c
Date: Sat, 28 Jan 2023 20:59:02 +0100
Message-Id: <20230128195907.1837-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230128195907.1837-1-michal.wajdeczko@intel.com>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index a7f737c4792e..69ce06faf8cd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -15,6 +15,7 @@
 #include "intel_guc_ads.h"
 #include "intel_guc_capture.h"
 #include "intel_guc_fwif.h"
+#include "intel_guc_print.h"
 #include "intel_uc.h"
 #include "i915_drv.h"
 
@@ -427,7 +428,7 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
 
 	guc->ads_regset = temp_set.storage;
 
-	drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %zu KB for temporary ADS regset\n",
+	guc_dbg(guc, "Used %zu KB for temporary ADS regset\n",
 		(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
 
 	return total * sizeof(struct guc_mmio_reg);
@@ -621,7 +622,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
 
 		engine = find_engine_state(gt, engine_class);
 		if (!engine) {
-			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
+			guc_err(guc, "No engine state recorded for class %d!\n",
 				engine_class);
 			ads_blob_write(guc, ads.eng_state_size[guc_class], 0);
 			ads_blob_write(guc, ads.golden_context_lrca[guc_class], 0);
@@ -646,7 +647,6 @@ static int
 guc_capture_prep_lists(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
 	struct guc_gt_system_info local_info;
 	struct iosys_map info_map;
@@ -751,7 +751,7 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	}
 
 	if (guc->ads_capture_size && guc->ads_capture_size != PAGE_ALIGN(total_size))
-		drm_warn(&i915->drm, "GuC->ADS->Capture alloc size changed from %d to %d\n",
+		guc_warn(guc, "ADS capture alloc size changed from %d to %d\n",
 			 guc->ads_capture_size, PAGE_ALIGN(total_size));
 
 	return PAGE_ALIGN(total_size);
-- 
2.25.1

