Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F0679FB2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E5F10E6E8;
	Tue, 24 Jan 2023 17:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F168710E6D4;
 Tue, 24 Jan 2023 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674579992; x=1706115992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P4i1ulhhdRq3MwiP3scXvqlpOdhmBBDy9TbFuXyrI2k=;
 b=nCDdGFByn7Su8AaIvfkjQoi7GATXNPayhgkja+9gOJxqZZSlFYtJHLm1
 fgTfOuQOQbx8lCcF91cd+CBfc9vEvnZ4iiGEE8jdhiRnju++D6fpB43kd
 tEHKD6Y5UiwhjVzR6+uy5duZJJ+4CJ1XRoZJrqKaPb72S/bsA8ORWX4rA
 r0JW6+IDQJwd2K/G0cbJlziDXCcORTLcVlkvmXhKFD8vHIarHh2rhiIrk
 h71Icj05ybcGtTZkxerl/Mtpr2UytdoikL+m0jjSeXdCumOMWHxuBsg+s
 Tw+SVZpdOKAaweuiRZMPpITLZX0eXc3CnhJi0rQfAUL5bEX54N3oEnBQk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306007406"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306007406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 09:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750895787"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750895787"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 09:05:24 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id F06D737E27;
 Tue, 24 Jan 2023 17:05:23 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/i915/guc: Update GuC messages in intel_guc_ads.c
Date: Tue, 24 Jan 2023 18:05:17 +0100
Message-Id: <20230124170522.1808-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230124170522.1808-1-michal.wajdeczko@intel.com>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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

