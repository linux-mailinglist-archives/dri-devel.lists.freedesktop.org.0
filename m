Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12623FE6D3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B56E42E;
	Thu,  2 Sep 2021 00:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F776E441;
 Thu,  2 Sep 2021 00:52:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="217058124"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="217058124"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030182"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 10/25] drm/i915/guc: Copy whole golden context,
 set engine state size of subset
Date: Wed,  1 Sep 2021 17:50:07 -0700
Message-Id: <20210902005022.711767-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

When the GuC does a media reset, it copies a golden context state back
into the corrupted context's state. The address of the golden context
and the size of the engine state restore are passed in via the GuC ADS.
The i915 had a bug where it passed in the whole size of the golden
context, not the size of the engine state to restore resulting in a
memory corruption.

Also copy the entire golden context on init rather than just the engine
state that is restored.

v2 (Daniele): use defines to avoid duplicated const variables (John).

Fixes: 481d458caede ("drm/i915/guc: Add golden context to GuC ADS")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 6926919bcac6..2c6ea64af7ec 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -349,6 +349,8 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
 	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
 }
 
+#define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
+#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
 static int guc_prep_golden_context(struct intel_guc *guc,
 				   struct __guc_ads_blob *blob)
 {
@@ -396,7 +398,18 @@ static int guc_prep_golden_context(struct intel_guc *guc,
 		if (!blob)
 			continue;
 
-		blob->ads.eng_state_size[guc_class] = real_size;
+		/*
+		 * This interface is slightly confusing. We need to pass the
+		 * base address of the full golden context and the size of just
+		 * the engine state, which is the section of the context image
+		 * that starts after the execlists context. This is required to
+		 * allow the GuC to restore just the engine state when a
+		 * watchdog reset occurs.
+		 * We calculate the engine state size by removing the size of
+		 * what comes before it in the context image (which is identical
+		 * on all engines).
+		 */
+		blob->ads.eng_state_size[guc_class] = real_size - LRC_SKIP_SIZE;
 		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
 		addr_ggtt += alloc_size;
 	}
@@ -436,11 +449,6 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	u8 engine_class, guc_class;
 	u8 *ptr;
 
-	/* Skip execlist and PPGTT registers + HWSP */
-	const u32 lr_hw_context_size = 80 * sizeof(u32);
-	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
-		lr_hw_context_size;
-
 	if (!intel_uc_uses_guc_submission(&gt->uc))
 		return;
 
@@ -476,12 +484,12 @@ static void guc_init_golden_context(struct intel_guc *guc)
 			continue;
 		}
 
-		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
+		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
+			   real_size - LRC_SKIP_SIZE);
 		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
 		addr_ggtt += alloc_size;
 
-		shmem_read(engine->default_state, skip_size, ptr + skip_size,
-			   real_size - skip_size);
+		shmem_read(engine->default_state, 0, ptr, real_size);
 		ptr += alloc_size;
 	}
 
-- 
2.25.1

