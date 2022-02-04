Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C04A9E0B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05C510EF03;
	Fri,  4 Feb 2022 17:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4976710EEE4;
 Fri,  4 Feb 2022 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996711; x=1675532711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EeK5zQnMqXIr0fQkGn4sBtqhR4vuLZogu26UMjYqYJI=;
 b=Y2oHx29O4H2MRUQvzZsaf+01l3nzSQjswfhHIJpZO4cw7vAwlO7VP74a
 CTKdetibrZDRfzTxnRJ7SHYAdesZN1b/dfXdt+OL25roToExQaKFxP5uP
 i0y5fRxDaNte6F3z21Cp8GOZg3tZnAgDEz1ND2mv4uhB+jXpgSi+3RxdB
 MlExfftZlAJ+T36RygPX3KYTn/7b0o7/2k4epNJ1Lid4q+cRNAnWvvZ2G
 BlPJyJaph6kohyDqGyG6FEqq0c1qvIMWaE2x0rgPuFsu5COYjPk6VPw1X
 bh42Hn979ctBFbLZMJOsf36+vdbqIm2dSSpNgTf8ht1vko4R8vXqfFIJZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242183"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242183"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240823"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/19] drm/i915/guc: Convert mapping table to iosys_map
Date: Fri,  4 Feb 2022 09:44:30 -0800
Message-Id: <20220204174436.830121-14-lucas.demarchi@intel.com>
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

Use iosys_map to write the fields system_info.mapping_table[][].
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
index 098a4756e8c5..9e96a44a6bbc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -204,7 +204,7 @@ int intel_guc_global_policies_update(struct intel_guc *guc)
 }
 
 static void guc_mapping_table_init(struct intel_gt *gt,
-				   struct guc_gt_system_info *system_info)
+				   struct iosys_map *info_map)
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
2.35.1

