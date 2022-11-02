Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC7616A11
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96D810E531;
	Wed,  2 Nov 2022 17:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680B510E526;
 Wed,  2 Nov 2022 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667408901; x=1698944901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYsnfjlig/yZk4lOQBwFVKVtR+p475Kdti4OrPfc5QU=;
 b=CIoTdAXvX/72Ot7DnnW4QvmyS6ADLGg4owJbk4PT7Q/R+fDRQRxc7QlP
 9rs4+WPwpRIxKz2/CbfvwAwe5OFYRtsIsDqtB16G7/2lk4MyBN1rDMNc4
 6R6lgJoow24ioAuxvdZKCH4cJ2LbM3cTNjEQ6oYgX/Mf1ubZ41iNWkRms
 7kErrIj3bYbSdJNbbmUjgO7yTl9dTT+/+Y3ExzacdP/fw/EnLpEeqp9gY
 SO4fP2e68q+NHiwgqVYSIc7JeSwrmmnpg+WLJdVaFbETAAZ2MviRs/gJ9
 8FnDo1fmPS69uNFN6Bmc0Pws14V7a2hi56T23QAARsc2Uq3OunwYyu1CU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395777119"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="395777119"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="739835300"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="739835300"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/i915/mtl: pass the GSC CS info to the GuC
Date: Wed,  2 Nov 2022 10:10:44 -0700
Message-Id: <20221102171047.2787951-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
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

We need to tell the GuC that the GSC CS is there.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 11 +++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  7 +++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index a419d60166c8..a7f737c4792e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -488,6 +488,11 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
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
@@ -529,9 +534,6 @@ static int guc_prep_golden_context(struct intel_guc *guc)
 	}
 
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
-		if (engine_class == OTHER_CLASS)
-			continue;
-
 		guc_class = engine_class_to_guc_class(engine_class);
 
 		if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
@@ -609,9 +611,6 @@ static void guc_init_golden_context(struct intel_guc *guc)
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

