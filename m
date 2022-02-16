Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303174B8F77
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6610E8B1;
	Wed, 16 Feb 2022 17:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFB310E891;
 Wed, 16 Feb 2022 17:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033261; x=1676569261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=415ziTQvNvPH1YtMqXmD2fQAiMm3ZzPJyR0FEFyMSaI=;
 b=EwF48zPR12ju5/SUq7nOgFTjLA7LJM2drgfqZWma2gPaK1Q4ANYaSvaj
 QoQuvEFk/YeoL/pkJDyZWbux2/VPX1QYflTMulsTgdO8r33EUnqQYEhMm
 3FWxkYyuIWVwzrfA3L7JI5nhGeIMC0JF6F5V4iL55c7aGpNvIInBqkxQl
 HGYrbbkv7gMxYymw5GFxn9dMShHxDeegR6D5npB4huwC0rL8ETfBQ7eSx
 IxmJV9++fifDAkuOZA9+zzDHdw/qAjX6c4+zN45xc5//PkZnOgtpAYD94
 Pbm3iMRjZWIFFVRtIGr2eBJvlh52wu7VHwV093/g+jSb8/JXyON93L8hb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641981"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641981"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:41:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226756"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:41:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 15/16] drm/i915/guc: Convert __guc_ads_init to iosys_map
Date: Wed, 16 Feb 2022 09:41:46 -0800
Message-Id: <20220216174147.3073235-16-lucas.demarchi@intel.com>
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

Now that all the called functions from __guc_ads_init() are converted to
use ads_map, stop using ads_blob in __guc_ads_init().

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 25 ++++++++++++----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 90cbb93a2945..d0593063c0dc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -608,7 +608,6 @@ static void __guc_ads_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base;
@@ -619,17 +618,18 @@ static void __guc_ads_init(struct intel_guc *guc)
 	/* System info */
 	fill_engine_enable_masks(gt, &info_map);
 
-	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
-		hweight8(gt->info.sseu.slice_mask);
-	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_VDBOX_SFC_SUPPORT_MASK] =
-		gt->info.vdbox_sfc_access;
+	ads_blob_write(guc, system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED],
+		       hweight8(gt->info.sseu.slice_mask));
+	ads_blob_write(guc, system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_VDBOX_SFC_SUPPORT_MASK],
+		       gt->info.vdbox_sfc_access);
 
 	if (GRAPHICS_VER(i915) >= 12 && !IS_DGFX(i915)) {
 		u32 distdbreg = intel_uncore_read(gt->uncore,
 						  GEN12_DIST_DBS_POPULATED);
-		blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI] =
-			((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT) &
-			 GEN12_DOORBELLS_PER_SQIDI) + 1;
+		ads_blob_write(guc,
+			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
+			       ((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT)
+				& GEN12_DOORBELLS_PER_SQIDI) + 1);
 	}
 
 	/* Golden contexts for re-initialising after a watchdog reset */
@@ -643,14 +643,17 @@ static void __guc_ads_init(struct intel_guc *guc)
 	guc_capture_list_init(guc);
 
 	/* ADS */
-	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
-	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
+	ads_blob_write(guc, ads.scheduler_policies, base +
+		       offsetof(struct __guc_ads_blob, policies));
+	ads_blob_write(guc, ads.gt_system_info, base +
+		       offsetof(struct __guc_ads_blob, system_info));
 
 	/* MMIO save/restore list */
 	guc_mmio_reg_state_init(guc);
 
 	/* Private Data */
-	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
+	ads_blob_write(guc, ads.private_data, base +
+		       guc_ads_private_data_offset(guc));
 
 	i915_gem_object_flush_map(guc->ads_vma->obj);
 }
-- 
2.35.1

