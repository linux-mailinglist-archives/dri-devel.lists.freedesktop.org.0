Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AD4A9E2C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562F010EEFC;
	Fri,  4 Feb 2022 17:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4860010EEE3;
 Fri,  4 Feb 2022 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996711; x=1675532711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=io7pg30c2mzq5MidQcy5J7T+u6nA14DDKLGuUCWyG5E=;
 b=JuIH8CJ/u8fq/F9H+sJVQduFoowIHvX9rq4Q47lQdF/9UPMowwH9CMqS
 9OlcMSAud2vM2w/pgi4bHNK5nt7/AEOWQ3ePcZIYDJUI+B4ysV1tQ7kKX
 2/zY9HM5bpyPTQgeue8H8/GXz6thdJ/J5wj669vYFNIjFQodmsxrDkW0t
 RYaxiN6g5vFFiizkSMndweq/fTyd8afs/53ZAYVNBD5OcH6M1h0Wwfjj+
 lPbq7pQcUzBZLWOU192QpeIxjLEN6WJVWPFNuEyTIEwzxmGG3i4injiV6
 Zzhuk1mhL1vkLo3mLF3nZLH5OCrdY1ExKYwcl3lAC3KNQBAmfXLCwEH6N g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242180"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242180"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240817"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/19] drm/i915/guc: Convert golden context prep to iosys_map
Date: Fri,  4 Feb 2022 09:44:28 -0800
Message-Id: <20220204174436.830121-12-lucas.demarchi@intel.com>
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

Use the saved ads_map to prepare the golden context. One difference from
the init context is that this function can be called before there is a
gem object (and thus the guc->ads_map) to calculare the size of the
golden context that should be allocated for that object.

So in this case the function needs to be prepared for not having the
system_info with enabled engines filled out. To accomplish that an
info_map is prepared on the side to point either to the gem object
or the local variable on the stack. This allows making
fill_engine_enable_masks() operate always with a iosys_map
argument.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 52 +++++++++++++---------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 973762ce2196..80fbab831536 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -67,6 +67,12 @@ struct __guc_ads_blob {
 	iosys_map_wr_field(&(guc_)->ads_map, struct __guc_ads_blob,	\
 			   field_, val_)
 
+#define info_map_write(map_, field_, val_) \
+	iosys_map_wr_field(map_, struct guc_gt_system_info, field_, val_)
+
+#define info_map_read(map_, field_) \
+	iosys_map_rd_field(map_, struct guc_gt_system_info, field_)
+
 static u32 guc_ads_regset_size(struct intel_guc *guc)
 {
 	GEM_BUG_ON(!guc->ads_regset_size);
@@ -378,24 +384,24 @@ static void guc_mmio_reg_state_init(struct intel_guc *guc,
 }
 
 static void fill_engine_enable_masks(struct intel_gt *gt,
-				     struct guc_gt_system_info *info)
+				     struct iosys_map *info_map)
 {
-	info->engine_enabled_masks[GUC_RENDER_CLASS] = 1;
-	info->engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
-	info->engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
-	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
+	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
+	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
+	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
+	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
 }
 
 #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
 #define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
-static int guc_prep_golden_context(struct intel_guc *guc,
-				   struct __guc_ads_blob *blob)
+static int guc_prep_golden_context(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	u32 addr_ggtt, offset;
 	u32 total_size = 0, alloc_size, real_size;
 	u8 engine_class, guc_class;
-	struct guc_gt_system_info *info, local_info;
+	struct guc_gt_system_info local_info;
+	struct iosys_map info_map;
 
 	/*
 	 * Reserve the memory for the golden contexts and point GuC at it but
@@ -409,14 +415,15 @@ static int guc_prep_golden_context(struct intel_guc *guc,
 	 * GuC will also validate that the LRC base + size fall within the
 	 * allowed GGTT range.
 	 */
-	if (blob) {
+	if (!iosys_map_is_null(&guc->ads_map)) {
 		offset = guc_ads_golden_ctxt_offset(guc);
 		addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
-		info = &blob->system_info;
+		info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
+						 offsetof(struct __guc_ads_blob, system_info));
 	} else {
 		memset(&local_info, 0, sizeof(local_info));
-		info = &local_info;
-		fill_engine_enable_masks(gt, info);
+		iosys_map_set_vaddr(&info_map, &local_info);
+		fill_engine_enable_masks(gt, &info_map);
 	}
 
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
@@ -425,14 +432,14 @@ static int guc_prep_golden_context(struct intel_guc *guc,
 
 		guc_class = engine_class_to_guc_class(engine_class);
 
-		if (!info->engine_enabled_masks[guc_class])
+		if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
 			continue;
 
 		real_size = intel_engine_context_size(gt, engine_class);
 		alloc_size = PAGE_ALIGN(real_size);
 		total_size += alloc_size;
 
-		if (!blob)
+		if (iosys_map_is_null(&guc->ads_map))
 			continue;
 
 		/*
@@ -446,12 +453,15 @@ static int guc_prep_golden_context(struct intel_guc *guc,
 		 * what comes before it in the context image (which is identical
 		 * on all engines).
 		 */
-		blob->ads.eng_state_size[guc_class] = real_size - LRC_SKIP_SIZE;
-		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
+		ads_blob_write(guc, ads.eng_state_size[guc_class],
+			       real_size - LRC_SKIP_SIZE);
+		ads_blob_write(guc, ads.golden_context_lrca[guc_class],
+			       addr_ggtt);
+
 		addr_ggtt += alloc_size;
 	}
 
-	if (!blob)
+	if (iosys_map_is_null(&guc->ads_map))
 		return total_size;
 
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
@@ -559,13 +569,15 @@ static void __guc_ads_init(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
 	struct __guc_ads_blob *blob = guc->ads_blob;
+	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
+			offsetof(struct __guc_ads_blob, system_info));
 	u32 base;
 
 	/* GuC scheduling policies */
 	guc_policies_init(guc);
 
 	/* System info */
-	fill_engine_enable_masks(gt, &blob->system_info);
+	fill_engine_enable_masks(gt, &info_map);
 
 	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
 		hweight8(gt->info.sseu.slice_mask);
@@ -581,7 +593,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	}
 
 	/* Golden contexts for re-initialising after a watchdog reset */
-	guc_prep_golden_context(guc, blob);
+	guc_prep_golden_context(guc);
 
 	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
 
@@ -624,7 +636,7 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	guc->ads_regset_size = ret;
 
 	/* Likewise the golden contexts: */
-	ret = guc_prep_golden_context(guc, NULL);
+	ret = guc_prep_golden_context(guc);
 	if (ret < 0)
 		return ret;
 	guc->ads_golden_ctxt_size = ret;
-- 
2.35.1

