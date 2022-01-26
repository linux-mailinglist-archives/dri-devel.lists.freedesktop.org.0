Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2949D3A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6F410E949;
	Wed, 26 Jan 2022 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDC010E421;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ywn5t+uERBPsNyA7kStV3ap4UDQVPmgaxiuknWHkU7s=;
 b=VPy8Sh/ZkOsEjyy4LOMJDOAFkteY9mQEw/V8qcdS3EDp3Zem1DoZWXSW
 o0pJK5KVYLvigYeZqxDP72fX+IFwtynk4GVV6ovk5ZsFE/D/bLgYptal9
 KadJqPRXIVvAy+mRsra/U+d41zHy8H/5q7lZvtvRZL5OprZ2NJxz6eFLS
 6VGBtsH2kH1YUf2BcKyQ6T34MFCFEhaQdZ9DF582TqwqrKyliiZ81EIYr
 e++2zPDGjjKPjfS1dhxc5VQnhhLlZUCcQ6lMxFSZE64U3o0wih0pU7SD8
 xpSW33470JzhUE+3FLkGCxfINIqLYoKMjAynhps235wguOQRiBgKALrmr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000502"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000502"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221509"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/19] drm/i915/guc: Convert golden context init to dma_buf_map
Date: Wed, 26 Jan 2022 12:36:49 -0800
Message-Id: <20220126203702.1784589-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
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
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
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
index 01d2c1ead680..bcf52ac4fe35 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -473,18 +473,17 @@ static struct intel_engine_cs *find_engine_state(struct intel_gt *gt, u8 engine_
 
 static void guc_init_golden_context(struct intel_guc *guc)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct intel_engine_cs *engine;
 	struct intel_gt *gt = guc_to_gt(guc);
+	struct dma_buf_map golden_context_map;
 	u32 addr_ggtt, offset;
 	u32 total_size = 0, alloc_size, real_size;
 	u8 engine_class, guc_class;
-	u8 *ptr;
 
 	if (!intel_uc_uses_guc_submission(&gt->uc))
 		return;
 
-	GEM_BUG_ON(!blob);
+	GEM_BUG_ON(dma_buf_map_is_null(&guc->ads_map));
 
 	/*
 	 * Go back and fill in the golden context data now that it is
@@ -492,15 +491,15 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	 */
 	offset = guc_ads_golden_ctxt_offset(guc);
 	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
-	ptr = ((u8 *)blob) + offset;
+
+	golden_context_map = DMA_BUF_MAP_INIT_OFFSET(&guc->ads_map, offset);
 
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
+		shmem_read_to_dma_buf_map(engine->default_state, 0,
+					  &golden_context_map, real_size);
+		dma_buf_map_incr(&golden_context_map, alloc_size);
 	}
 
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
-- 
2.35.0

