Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED54A9E28
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C4B10EF1B;
	Fri,  4 Feb 2022 17:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132D10EEEA;
 Fri,  4 Feb 2022 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996711; x=1675532711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwKpK+QWMv4aa1iZ4+++E713WBV59p0VhyhaTo+mxXA=;
 b=kNrwSV7BrdTBspJ2D4UNiD7byognGBpUJYxey2axZRspIeD2wn+Has/h
 MQfmfRFRSISsHZ8ci+TyyNg99HjjxGsdrv5uzMAZniC+3vtl6ksTxVezW
 ZYFaJSzTZqaqowRgvsInCx3aXyXMQyzvT/3yfm8C3VQajCDGPkPGIT35Y
 19PIHD0e0MH1h4lWpIc405/LXG7gBgwghrf24rwZ/qV2gCaQ/rhxRH/xG
 wfhKa9ouJPHqJXOdWtZQ+GFfeshLXaUKyOm1U+gSZZAskpqtzDqrRjjIm
 dJcJ0PFrnNxa6l5n0fIpVcTiJ5UKa9PM0eB++QUyDj3m70ndz7WBi/fxV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242187"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240835"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/19] drm/i915/guc: Convert guc_mmio_reg_state_init to
 iosys_map
Date: Fri,  4 Feb 2022 09:44:34 -0800
Message-Id: <20220204174436.830121-18-lucas.demarchi@intel.com>
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

Now that the regset list is prepared, convert guc_mmio_reg_state_init()
to use iosys_map to copy the array to the final location and
initialize additional fields in ads.reg_state_list.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 30 +++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index c040d8d8d7a4..cf6fafa1024c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -383,40 +383,46 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
 	return ret;
 }
 
-static void guc_mmio_reg_state_init(struct intel_guc *guc,
-				    struct __guc_ads_blob *blob)
+static void guc_mmio_reg_state_init(struct intel_guc *guc)
 {
+	struct iosys_map ads_regset_map;
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
-	struct guc_mmio_reg *ads_registers;
 	enum intel_engine_id id;
 	u32 addr_ggtt, offset;
 
 	offset = guc_ads_regset_offset(guc);
 	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
-	ads_registers = (struct guc_mmio_reg *)(((u8 *)blob) + offset);
+	ads_regset_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
 
-	memcpy(ads_registers, guc->ads_regset, guc->ads_regset_size);
+	iosys_map_memcpy_to(&ads_regset_map, 0, guc->ads_regset,
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
@@ -646,7 +652,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
 
 	/* MMIO save/restore list */
-	guc_mmio_reg_state_init(guc, blob);
+	guc_mmio_reg_state_init(guc);
 
 	/* Private Data */
 	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
-- 
2.35.1

