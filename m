Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6149A4B8F75
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02DA10E8BE;
	Wed, 16 Feb 2022 17:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62410E86F;
 Wed, 16 Feb 2022 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033260; x=1676569260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rZyPCxxJzB4PNPxHa5HiV/iKsEXp4cGe3YV7TMoR2E=;
 b=TEftNlEQzSkCwYKYhQ++NKGhLCT10lJ0eFO4nv0u0Z1pIT1t2oXvxsIL
 lL8NqqMmrxSULRkkUQ+0d4jdcw/zO6rM2VDIqkX9rFyWM+GT7jZ9xefOT
 ZgM0WthBtdwjuc53num2iEvcOBqPhnuIhgmzYRVaTT7NvxfAIihNByQdn
 ISjIVOD48TACvjS0o3hWwAda+UgxYsp0qmPokaavNwtD+yLBg2w2CkunE
 ONilrKpG/VjJV9OCD/8x5NPO+7vq52dX6ImOeQL7woNBg3hm9MNjKHgH7
 y2lCdZg5FiQykQaSHAEgDzelKE9F5d1GaswsbT72SmrSiZna4bCMb8Toe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641978"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641978"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:41:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226744"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:41:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 14/16] drm/i915/guc: Convert guc_mmio_reg_state_init to
 iosys_map
Date: Wed, 16 Feb 2022 09:41:45 -0800
Message-Id: <20220216174147.3073235-15-lucas.demarchi@intel.com>
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

Now that the regset list is prepared, convert guc_mmio_reg_state_init()
to use iosys_map to copy the array to the final location and
initialize additional fields in ads.reg_state_list.

v2: Just use an offset instead of temporary iosys_map.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 28 ++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index ec0ccdf98dfa..90cbb93a2945 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -383,40 +383,44 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
 	return ret;
 }
 
-static void guc_mmio_reg_state_init(struct intel_guc *guc,
-				    struct __guc_ads_blob *blob)
+static void guc_mmio_reg_state_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
-	struct guc_mmio_reg *ads_registers;
 	enum intel_engine_id id;
 	u32 addr_ggtt, offset;
 
 	offset = guc_ads_regset_offset(guc);
 	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
-	ads_registers = (struct guc_mmio_reg *)(((u8 *)blob) + offset);
 
-	memcpy(ads_registers, guc->ads_regset, guc->ads_regset_size);
+	iosys_map_memcpy_to(&guc->ads_map, offset, guc->ads_regset,
+			    guc->ads_regset_size);
 
 	for_each_engine(engine, gt, id) {
 		u32 count = guc->ads_regset_count[id];
-		struct guc_mmio_reg_set *ads_reg_set;
 		u8 guc_class;
 
 		/* Class index is checked in class converter */
 		GEM_BUG_ON(engine->instance >= GUC_MAX_INSTANCES_PER_CLASS);
 
 		guc_class = engine_class_to_guc_class(engine->class);
-		ads_reg_set = &blob->ads.reg_state_list[guc_class][engine->instance];
 
 		if (!count) {
-			ads_reg_set->address = 0;
-			ads_reg_set->count = 0;
+			ads_blob_write(guc,
+				       ads.reg_state_list[guc_class][engine->instance].address,
+				       0);
+			ads_blob_write(guc,
+				       ads.reg_state_list[guc_class][engine->instance].count,
+				       0);
 			continue;
 		}
 
-		ads_reg_set->address = addr_ggtt;
-		ads_reg_set->count = count;
+		ads_blob_write(guc,
+			       ads.reg_state_list[guc_class][engine->instance].address,
+			       addr_ggtt);
+		ads_blob_write(guc,
+			       ads.reg_state_list[guc_class][engine->instance].count,
+			       count);
 
 		addr_ggtt += count * sizeof(struct guc_mmio_reg);
 	}
@@ -643,7 +647,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
 
 	/* MMIO save/restore list */
-	guc_mmio_reg_state_init(guc, blob);
+	guc_mmio_reg_state_init(guc);
 
 	/* Private Data */
 	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
-- 
2.35.1

