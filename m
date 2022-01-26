Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5949D3A7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1E510E954;
	Wed, 26 Jan 2022 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D991510E802;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229388; x=1674765388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wvaX2JPdSHUYHOOHVGj913/CgerpbT8u5T6WEedTlfM=;
 b=i7kpZvRjLWtARpZ5YVz6vEpA9388dXBfglwJtsFAerV+vahXgP9Wltvt
 KB6/MrV9N5lVgFoeaV4uyWvDgtv3cFGkuD++V6qfcFqZ9N2hGcgcsLRLH
 7qoLBp1o6h5xSqcz83DqUjSQYPul8rFZ8RHNElO0pB3c8xes8f0T8UkWC
 t8TlWEr5nS4pFWjLfgG40Hmu9/I4Gr6rolmSfMODd9ICrSRd4JQ0KT1ys
 qRNqvrLLsltyjvr1/iUfTNteJ+7inJYPqsF6wjMgpLnuAz2Fjw2f+opHg
 i+ZfXzI839y9hb1SODZA484bWDiDU7qybslwaNB0IvjbuliRKyLjHQDZp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000513"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221531"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/19] drm/i915/guc: Convert mapping table to dma_buf_map
Date: Wed, 26 Jan 2022 12:36:56 -0800
Message-Id: <20220126203702.1784589-14-lucas.demarchi@intel.com>
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

Use dma_buf_map to write the fields system_info.mapping_table[][].
Since we already have the info_map around where needed, just use it
instead of going through guc->ads_map.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 8e4768289792..dca7c3db9cdd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -204,7 +204,7 @@ int intel_guc_global_policies_update(struct intel_guc *guc)
 }
 
 static void guc_mapping_table_init(struct intel_gt *gt,
-				   struct guc_gt_system_info *system_info)
+				   struct dma_buf_map *info_map)
 {
 	unsigned int i, j;
 	struct intel_engine_cs *engine;
@@ -213,14 +213,14 @@ static void guc_mapping_table_init(struct intel_gt *gt,
 	/* Table must be set to invalid values for entries not used */
 	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; ++i)
 		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; ++j)
-			system_info->mapping_table[i][j] =
-				GUC_MAX_INSTANCES_PER_CLASS;
+			info_map_write(info_map, mapping_table[i][j],
+				       GUC_MAX_INSTANCES_PER_CLASS);
 
 	for_each_engine(engine, gt, id) {
 		u8 guc_class = engine_class_to_guc_class(engine->class);
 
-		system_info->mapping_table[guc_class][ilog2(engine->logical_mask)] =
-			engine->instance;
+		info_map_write(info_map, mapping_table[guc_class][ilog2(engine->logical_mask)],
+			       engine->instance);
 	}
 }
 
@@ -595,7 +595,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	/* Golden contexts for re-initialising after a watchdog reset */
 	guc_prep_golden_context(guc);
 
-	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
+	guc_mapping_table_init(guc_to_gt(guc), &info_map);
 
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
-- 
2.35.0

