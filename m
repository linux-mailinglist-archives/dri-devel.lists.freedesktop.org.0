Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE484AD5BB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BC910E707;
	Tue,  8 Feb 2022 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E8910E224;
 Tue,  8 Feb 2022 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317115; x=1675853115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rZyPCxxJzB4PNPxHa5HiV/iKsEXp4cGe3YV7TMoR2E=;
 b=VpmqEaYQitg6xGdyc/bd87uZZzMS9mHxFzHWzPsXJJyIUoPgQB+GjsMu
 kC1Nk8UrX6OyofUM09y6wpaX72yTAqNkFEjPHzU1iBzwc69eohw//rt+j
 hObtzJTAk2DSPQDumyJdZNHK+j6/843y1kPvLyWpMpWx7sTFv70WJi1xz
 BjoGeMxumWgbD4TVcoGSKgbhNvRluGK8hLaDrqz/XYFOGI2p4xDPLAgQD
 h//ElKpa3juh7n2svUJj9RSWM9VuPlY9a6Q4hU3c8D1wxqNV6NWdWmth0
 UI/0flp57o0Z3iV2UIbKnk2TTSl1dXCmPYq12YnnUwB2v3bMroKpGnTb2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249130494"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249130494"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804156"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/18] drm/i915/guc: Convert guc_mmio_reg_state_init to
 iosys_map
Date: Tue,  8 Feb 2022 02:45:22 -0800
Message-Id: <20220208104524.2516209-17-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208104524.2516209-1-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
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

