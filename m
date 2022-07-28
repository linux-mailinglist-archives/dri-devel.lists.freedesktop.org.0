Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7D583715
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2510F4CC;
	Thu, 28 Jul 2022 02:42:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A4C10F0A9;
 Thu, 28 Jul 2022 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658976148; x=1690512148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E3zw/8Ewz/98dvMQHULYaunVqKOfKMRyM4xLoBNF/uk=;
 b=UqoSERA9e2zVL9al30NtcEG3atV6RLtHXxPcZ2fjxUz++NIDuFmFSrSI
 gbtWab/V9S7HaC3d9nBQp8F0XlE/rEF8IkoRpNvsrJs2p0fUPUWiGkw/F
 vD//90jFCGnueFpNRHR4Tstl3VJzomohbUE/cNyl3E1UTFiIu19Dkgtnd
 nUXABlWKqLK53QKZgPDUlYZOV/JqaOu9N8lS0VkytQvY8MistHgwNZhXi
 chsfMlS2mVYC1fraYvNwXoq5xpeMzftjfsv686XEuX9ryRDaSGB7oWNVm
 C0PbtCHEMuf+JoOfMR+hMJtBQgGYdvDccMrkxoHPAPSke9uG0CkLvILmC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="271443543"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="271443543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="690096054"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2022 19:42:26 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/6] drm/i915/guc: Support larger contexts on newer hardware
Date: Wed, 27 Jul 2022 19:42:24 -0700
Message-Id: <20220728024225.2363663-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

The GuC needs a copy of a golden context for implementing watchdog
resets (aka media resets). This context is larger on newer platforms.
So adjust the size being allocated/copied accordingly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
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
2.37.1

