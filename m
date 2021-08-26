Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C03F811B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55086E4E8;
	Thu, 26 Aug 2021 03:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1959B6E4CD;
 Thu, 26 Aug 2021 03:28:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811070"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811070"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738550"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 11/27] drm/i915/guc: Copy whole golden context,
 set engine state size of subset
Date: Wed, 25 Aug 2021 20:23:11 -0700
Message-Id: <20210826032327.18078-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
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

When the GuC does a media reset, it copies a golden context state back
into the corrupted context's state. The address of the golden context
and the size of the engine state restore are passed in via the GuC ADS.
The i915 had a bug where it passed in the whole size of the golden
context, not the size of the engine state to restore resulting in a
memory corruption.

Also copy the entire golden context on init rather than just the engine
state that is restored.

Fixes: 481d458caede ("drm/i915/guc: Add golden context to GuC ADS")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 6926919bcac6..df2734bfe078 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -358,6 +358,11 @@ static int guc_prep_golden_context(struct intel_guc *guc,
 	u8 engine_class, guc_class;
 	struct guc_gt_system_info *info, local_info;
 
+	/* Skip execlist and PPGTT registers + HWSP */
+	const u32 lr_hw_context_size = 80 * sizeof(u32);
+	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
+		lr_hw_context_size;
+
 	/*
 	 * Reserve the memory for the golden contexts and point GuC at it but
 	 * leave it empty for now. The context data will be filled in later
@@ -396,7 +401,18 @@ static int guc_prep_golden_context(struct intel_guc *guc,
 		if (!blob)
 			continue;
 
-		blob->ads.eng_state_size[guc_class] = real_size;
+		/*
+		 * This interface is slightly confusing. We need to pass the
+		 * base address of the golden context and the engine state size
+		 * which is not the size of the whole golden context, it is a
+		 * subset that the GuC uses when doing a watchdog reset. The
+		 * engine state size must match the size of the golden context
+		 * minus the first part of the golden context that the GuC does
+		 * not retore during reset. Currently no real way to verify this
+		 * other than reading the GuC spec / code and ensuring the
+		 * 'skip_size' below matches the value used in the GuC code.
+		 */
+		blob->ads.eng_state_size[guc_class] = real_size - skip_size;
 		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
 		addr_ggtt += alloc_size;
 	}
@@ -437,8 +453,8 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	u8 *ptr;
 
 	/* Skip execlist and PPGTT registers + HWSP */
-	const u32 lr_hw_context_size = 80 * sizeof(u32);
-	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
+	__maybe_unused const u32 lr_hw_context_size = 80 * sizeof(u32);
+	__maybe_unused const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
 		lr_hw_context_size;
 
 	if (!intel_uc_uses_guc_submission(&gt->uc))
@@ -476,12 +492,12 @@ static void guc_init_golden_context(struct intel_guc *guc)
 			continue;
 		}
 
-		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
+		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
+			   real_size - skip_size);
 		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
 		addr_ggtt += alloc_size;
 
-		shmem_read(engine->default_state, skip_size, ptr + skip_size,
-			   real_size - skip_size);
+		shmem_read(engine->default_state, 0, ptr, real_size);
 		ptr += alloc_size;
 	}
 
-- 
2.32.0

