Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE41675A49
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8455310EABA;
	Fri, 20 Jan 2023 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98810EAAE;
 Fri, 20 Jan 2023 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232887; x=1705768887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9By2Kkjr8OwMyacxSIa7rzNIz+zCrnew3iOrFzetYYk=;
 b=XcqfknXhNqRgfNR3yuYqyMX+nVcieLNkwQ6qfdPcTwkuS/XqzLaBRNHP
 OWTIjYGmIuOg3I8pa8xjweJ6SbbMmQBS4NT0LxQ3zUbzn6ipOgUb7mo/J
 /UYLvUGEt/NrnODp8nBHlHs8ipVtbgph5zz+GumDphNnakcPQ/iVXYeXc
 lOl0HJ2gXtnbVJTyQ5c9os1wd1DraxxLHWvucLcM+YQqpnzKBKSm8a/YB
 0U5BlE1oiEBv9empuHkosPhukwIr9DeT6T8MOGGk2epWxQru1u1h2rFNH
 34yKnk24QSP/veJTTWj6kvwTa9kM+anGls6CvCRGj2Sqq29O4khoBlPSa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323309865"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="323309865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691109993"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="691109993"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 08:41:25 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfd023485; Fri, 20 Jan 2023 16:41:24 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915/guc: Update GuC messages in intel_guc_ads.c
Date: Fri, 20 Jan 2023 17:40:45 +0100
Message-Id: <20230120164050.1765-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
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

