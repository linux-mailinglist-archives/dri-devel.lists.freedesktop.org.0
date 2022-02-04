Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779B4A9E03
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4960D10EEE4;
	Fri,  4 Feb 2022 17:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D5510E439;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996710; x=1675532710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCcob7Zjf6cIy9JtCNgp0M4d8lIZhpmNdIsNZ2rckb8=;
 b=V4pxKq+fYXUMuieb41WzlI6GfIoBj8YlVSvaysgGpOg6anwscc6i2Ood
 4LIHzVZSINewpbC5rudUlhU5d68zwG1zBO2C5f13C0NoH2gY+pnAAtiXE
 hxYEl4TxrCPItUVLVmh8fyVNp2u0fc789kiE3YULIZzMDLn2E5ulfABgr
 NNgQpWkXAHdpjlX7JcA/+LSgrgn0QiOYqBQ6aIw7yMOCNolyx+YunaExJ
 NzUdUE8eJPxRYo65tz7cs4+5RAXA/8sa9C16OaQD/t7MhBPN3PS3EdWcw
 X10qwMCPU81m9eFVIVstbPryyY8dBXKHHQIBzJH+fIsg5K0dHo82lLgvk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242175"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242175"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240805"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/19] drm/i915/guc: Convert golden context init to iosys_map
Date: Fri,  4 Feb 2022 09:44:24 -0800
Message-Id: <20220204174436.830121-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204174436.830121-1-lucas.demarchi@intel.com>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now the map is saved during creation, so use it to initialize the
golden context, reading from shmem and writing to either system or IO
memory.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 25 +++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 3a0afce7564e..d32b407a2d25 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -473,18 +473,17 @@ static struct intel_engine_cs *find_engine_state(struct intel_gt *gt, u8 engine_
 
 static void guc_init_golden_context(struct intel_guc *guc)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct intel_engine_cs *engine;
 	struct intel_gt *gt = guc_to_gt(guc);
+	struct iosys_map golden_context_map;
 	u32 addr_ggtt, offset;
 	u32 total_size = 0, alloc_size, real_size;
 	u8 engine_class, guc_class;
-	u8 *ptr;
 
 	if (!intel_uc_uses_guc_submission(&gt->uc))
 		return;
 
-	GEM_BUG_ON(!blob);
+	GEM_BUG_ON(iosys_map_is_null(&guc->ads_map));
 
 	/*
 	 * Go back and fill in the golden context data now that it is
@@ -492,15 +491,15 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	 */
 	offset = guc_ads_golden_ctxt_offset(guc);
 	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
-	ptr = ((u8 *)blob) + offset;
+
+	golden_context_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
 
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
 		if (engine_class == OTHER_CLASS)
 			continue;
 
 		guc_class = engine_class_to_guc_class(engine_class);
-
-		if (!blob->system_info.engine_enabled_masks[guc_class])
+		if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
 			continue;
 
 		real_size = intel_engine_context_size(gt, engine_class);
@@ -511,18 +510,20 @@ static void guc_init_golden_context(struct intel_guc *guc)
 		if (!engine) {
 			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
 				engine_class);
-			blob->ads.eng_state_size[guc_class] = 0;
-			blob->ads.golden_context_lrca[guc_class] = 0;
+			ads_blob_write(guc, ads.eng_state_size[guc_class], 0);
+			ads_blob_write(guc, ads.golden_context_lrca[guc_class], 0);
 			continue;
 		}
 
-		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
+		GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
 			   real_size - LRC_SKIP_SIZE);
-		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
+		GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
+
 		addr_ggtt += alloc_size;
 
-		shmem_read(engine->default_state, 0, ptr, real_size);
-		ptr += alloc_size;
+		shmem_read_to_iosys_map(engine->default_state, 0,
+					&golden_context_map, real_size);
+		iosys_map_incr(&golden_context_map, alloc_size);
 	}
 
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
-- 
2.35.1

