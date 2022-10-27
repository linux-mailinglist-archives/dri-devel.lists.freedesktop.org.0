Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D84610574
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 00:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911D610E71D;
	Thu, 27 Oct 2022 22:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DA910E00E;
 Thu, 27 Oct 2022 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666908802; x=1698444802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dtumg593c/2SWZc2M0tS5AnlCZky9RXNJflRzNqLFbI=;
 b=e1ipAK3R5SY5dqciADiEPouCQj/Z8REN8yk2zQ72RB0HuHSMqGMPlFGq
 wMhTQBhd7hBtilJmhGHJWK0xGElxbdZO2Pvce5lHdzKEwzRj+L0RDsKDU
 QHCMtdCXYoJ+oMzZYh72SPW6sX9LVb/Td2djViM6bd1HhfzOsZJzVHwjm
 /iwWS6dyPT+ALGuGCe6ZiysvKWzS4LP2EFiFt9U7/XOIMM0voi2qLjemb
 F4ApA0cRJ6zT/jfYyUcTBYweKHJpcjJRwZTILFFV+KErE931CaDY4PHl9
 VoNPMyOYa3eQ5fca8liS0ktlJYVaGj5s5uBZt6NeHxAD8nqfOvbB0Kr/c g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295763441"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="295763441"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610528950"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="610528950"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/mtl: pass the GSC CS info to the GuC
Date: Thu, 27 Oct 2022 15:15:51 -0700
Message-Id: <20221027221554.2638087-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to tell the GuC that the GSC CS is there. The GuC interface
swaps COMPUTE and OTHER class, so we also need to handle that.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 11 +++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  7 +++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 34ef4f36e660..63e3d98788bd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -478,6 +478,11 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
 	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], BCS_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
+
+	/* The GSC engine is an instance (6) of OTHER_CLASS */
+	if (gt->engine[GSC0])
+		info_map_write(info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
+			       BIT(gt->engine[GSC0]->instance));
 }
 
 #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
@@ -519,9 +524,6 @@ static int guc_prep_golden_context(struct intel_guc *guc)
 	}
 
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
-		if (engine_class == OTHER_CLASS)
-			continue;
-
 		guc_class = engine_class_to_guc_class(engine_class);
 
 		if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
@@ -599,9 +601,6 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
 
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
-		if (engine_class == OTHER_CLASS)
-			continue;
-
 		guc_class = engine_class_to_guc_class(engine_class);
 		if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
 			continue;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 968ebd79dce7..4ae5fc2f6002 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -47,7 +47,8 @@
 #define GUC_VIDEOENHANCE_CLASS		2
 #define GUC_BLITTER_CLASS		3
 #define GUC_COMPUTE_CLASS		4
-#define GUC_LAST_ENGINE_CLASS		GUC_COMPUTE_CLASS
+#define GUC_GSC_OTHER_CLASS		5
+#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
@@ -169,6 +170,7 @@ static u8 engine_class_guc_class_map[] = {
 	[COPY_ENGINE_CLASS]       = GUC_BLITTER_CLASS,
 	[VIDEO_DECODE_CLASS]      = GUC_VIDEO_CLASS,
 	[VIDEO_ENHANCEMENT_CLASS] = GUC_VIDEOENHANCE_CLASS,
+	[OTHER_CLASS]             = GUC_GSC_OTHER_CLASS,
 	[COMPUTE_CLASS]           = GUC_COMPUTE_CLASS,
 };
 
@@ -178,12 +180,13 @@ static u8 guc_class_engine_class_map[] = {
 	[GUC_VIDEO_CLASS]        = VIDEO_DECODE_CLASS,
 	[GUC_VIDEOENHANCE_CLASS] = VIDEO_ENHANCEMENT_CLASS,
 	[GUC_COMPUTE_CLASS]      = COMPUTE_CLASS,
+	[GUC_GSC_OTHER_CLASS]    = OTHER_CLASS,
 };
 
 static inline u8 engine_class_to_guc_class(u8 class)
 {
 	BUILD_BUG_ON(ARRAY_SIZE(engine_class_guc_class_map) != MAX_ENGINE_CLASS + 1);
-	GEM_BUG_ON(class > MAX_ENGINE_CLASS || class == OTHER_CLASS);
+	GEM_BUG_ON(class > MAX_ENGINE_CLASS);
 
 	return engine_class_guc_class_map[class];
 }
-- 
2.37.3

