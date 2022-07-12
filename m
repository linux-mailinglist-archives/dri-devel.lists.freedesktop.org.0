Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B7572A03
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A57976D3;
	Tue, 12 Jul 2022 23:31:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73C5976C4;
 Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668698; x=1689204698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DggPn44YSGRWvUcM1n2qdrDcdW1KhV8vx2xjTdu51VI=;
 b=j4UylcGLK0DxbdSuB4LcpsCqhwdznHe4bGcirN2vx+RyXprYYVQTpxyt
 MOQ/gu8ZiP7KA+8zXBkNFD9ygpvz6NnVtiNb9H2KpcOBgMPOyt4mTTfAo
 Bwz8YFtZ+wmf5ERautBGHtMUrNdQkCXhJwV1h5VjZWtv8Ri2KOfjtn9Jk
 o5Zx2bW5zsSARPcCANXgIVyKgwgprkr47Cgehmmb/3bcoFtUrXBHQqzXM
 e43KCzIeCXT0ES4EridXoYj1hNP46n+Ag8OkMlA9j+BNmyjVT6tmGyn0A
 ivykdKyY1iHuSuft3hRtbuo52lx9u0mzJv/CaQr43w0/PCUdKqXDJF69o Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812570"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812570"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137786"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 10/12] drm/i915/guc: Support larger contexts on newer hardware
Date: Tue, 12 Jul 2022 16:31:34 -0700
Message-Id: <20220712233136.1044951-11-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

The GuC needs a copy of a golden context for implementing watchdog
resets (aka media resets). This context is larger on newer platforms.
So adjust the size being allocated/copied accordingly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index ba7541f3ca610..74cbe8eaf5318 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -464,7 +464,11 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
 }
 
 #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
-#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
+#define XEHP_LR_HW_CONTEXT_SIZE (96 * sizeof(u32))
+#define LR_HW_CONTEXT_SZ(i915) (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) ? \
+				    XEHP_LR_HW_CONTEXT_SIZE : \
+				    LR_HW_CONTEXT_SIZE)
+#define LRC_SKIP_SIZE(i915) (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SZ(i915))
 static int guc_prep_golden_context(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -525,7 +529,7 @@ static int guc_prep_golden_context(struct intel_guc *guc)
 		 * on all engines).
 		 */
 		ads_blob_write(guc, ads.eng_state_size[guc_class],
-			       real_size - LRC_SKIP_SIZE);
+			       real_size - LRC_SKIP_SIZE(gt->i915));
 		ads_blob_write(guc, ads.golden_context_lrca[guc_class],
 			       addr_ggtt);
 
@@ -599,7 +603,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
 		}
 
 		GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
-			   real_size - LRC_SKIP_SIZE);
+			   real_size - LRC_SKIP_SIZE(gt->i915));
 		GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
 
 		addr_ggtt += alloc_size;
-- 
2.36.0

