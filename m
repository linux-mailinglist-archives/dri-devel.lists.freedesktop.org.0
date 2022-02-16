Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E34B8F79
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A9110E8D3;
	Wed, 16 Feb 2022 17:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFEF10E866;
 Wed, 16 Feb 2022 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033259; x=1676569259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7YCuwR1akX47yfYGLozqJrE8WX1UXKPT7c1kUJWm2DQ=;
 b=hw36MTUmdPs9rTP/2fEWDpbeMmlRnSUqXj3XRZmHXdrqjcLCBw0wIChr
 QuerWVGt590bgnxqN2g42dKT8yzOgSLAp0PpGUbJrUmoKX5WMSF+W+Eu7
 CiS7oHwt7uvMPYTYDOlDt2oh2DrF9gDoSMWK+t38DwpbsNJlbL2LMRJfO
 EaTrk6MakvT/cSSgpT7EmsRXh+232o+O1PZVSRJtQBTbd/488Y8dyvTzl
 +yxo7PxSF2NAxX6N2wLUlJzsjDkQAhPPMbje7gszLso6OKEK+ZTQo2xhG
 WjvVy9KEuq0tOU19U4O8Zz8clpYUB6nxeLTSrn+5hkYvvVH2c4qDvng+A g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641969"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641969"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226720"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/16] drm/i915/guc: Convert mapping table to iosys_map
Date: Wed, 16 Feb 2022 09:41:43 -0800
Message-Id: <20220216174147.3073235-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>,
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
index b739781bd133..c3c31b679e79 100644
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
 
@@ -631,7 +631,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	/* Golden contexts for re-initialising after a watchdog reset */
 	guc_prep_golden_context(guc);
 
-	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
+	guc_mapping_table_init(guc_to_gt(guc), &info_map);
 
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
-- 
2.35.1

