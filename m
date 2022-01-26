Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B04549D3B0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C6010E96A;
	Wed, 26 Jan 2022 20:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605C210E911;
 Wed, 26 Jan 2022 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229388; x=1674765388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EitKDHH9Pk9BnYi2AVNYWFlVpS4Zy78+E5JlLFovTXk=;
 b=bcuu0UJjUBdO/74AR7/DXkVUQc2PAr8UHN82qetoSDhc7SHljDClV+1o
 Kus2Ku1U9dwhF+SMzUcIKZhM3Jmi/RpXp9J99K0ttTu35edSgS+VKR1Ll
 lE+9c8k1JkssD8P7l6TMGkC0JIYa+CGr4q6mFcWsuGWRKhcFGnzTL3YcD
 bALDEhUx9E0lHZUDYpyvfjZtaH2TvHfBcho/yCCsReJIedoHGlmstATP0
 gPmKxxUNb2Yw449HG7OyBsIvbC5Xzp/T0N0egFFK8uG7XjqX9JvxJY7xW
 lNepKiVM2GB0AeoQof5nlQ7c1oCaoG3E42xqA5lx5ACqm4m9LXrIdXCFg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000521"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000521"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221547"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/19] drm/i915/guc: Convert __guc_ads_init to dma_buf_map
Date: Wed, 26 Jan 2022 12:37:01 -0800
Message-Id: <20220126203702.1784589-19-lucas.demarchi@intel.com>
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
index cb0f543b0e86..30edac93afbf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -602,7 +602,6 @@ static void __guc_ads_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct dma_buf_map info_map = DMA_BUF_MAP_INIT_OFFSET(&guc->ads_map,
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base;
@@ -613,17 +612,18 @@ static void __guc_ads_init(struct intel_guc *guc)
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
@@ -637,14 +637,17 @@ static void __guc_ads_init(struct intel_guc *guc)
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
2.35.0

