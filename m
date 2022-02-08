Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1014AD5BA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1110E666;
	Tue,  8 Feb 2022 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304210E68A;
 Tue,  8 Feb 2022 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317114; x=1675853114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=415ziTQvNvPH1YtMqXmD2fQAiMm3ZzPJyR0FEFyMSaI=;
 b=HRcekujkIj2G1liPpgaI68X3fwJGORLnzt7rBPANWIZDOZJZ6DKF6btB
 cRZLvU8wBdnC+TxiAGqVteQ/jAYHz2M0MN3YyxXwe4gmL1NfgcLrU9zoR
 QoJdR+ZHeftM0uSjFdTZRzT4cLtekFeiYxA0NPJ8/6PZi5QBoi6HZzQ5F
 AkT9/TsephFkB2eSpP/1aJ/M9LMslcN+0lJc/LEh5X7sP7ddQD/izOtMM
 6UG8Ry1nVjUP4WmkLWX5ifWUXL75VJmWEaqWJuvYFaJDUsjQtmKpIMkzg
 KiKoQCizJh1G+H9neA/8kTtk+qn9rT5u/lWuegD9oDkcf9Rrd5yglVPOi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="246511562"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="246511562"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804159"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/18] drm/i915/guc: Convert __guc_ads_init to iosys_map
Date: Tue,  8 Feb 2022 02:45:23 -0800
Message-Id: <20220208104524.2516209-18-lucas.demarchi@intel.com>
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

