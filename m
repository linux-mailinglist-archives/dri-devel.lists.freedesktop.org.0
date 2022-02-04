Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9A4A9E2A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1B110EEE2;
	Fri,  4 Feb 2022 17:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EB010E8EC;
 Fri,  4 Feb 2022 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996711; x=1675532711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wLXr7ktzod/XdjJ30etU9eXJKtCaRDvZG2vO4UNksAw=;
 b=gjKrN/AD0vwfGFJXa098uv0ta7oCxAI+wyAGo7Y+50+eyfyyprcS4OI9
 dW+xrwr4ygnHGbAYqnFb2IvqwKGc60KO3RmYX3dxXDaq2WESp5QF0+9eu
 Izp1dayqOD2WiN7PCoIOc/oNtNT+MubbapGlzI97HisnZgyOLRKN7Vb6h
 7l8Zzhsbjgu6agM9xzez1UvYBtcyH7uLk1ZoARXLrqCzRkTECgKTu97LR
 agwYvc5O1/f8PzfkpO14aOWAWBhsQcKRrctOW5LxMJuJPCJ40vM5ZBcQE
 P6LgLrx1GnFbD1r6DOdStGTiiiIKK1/c92X9jFNu8qq2lcAdArQM+Yl/I A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242188"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242188"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240838"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/19] drm/i915/guc: Convert __guc_ads_init to iosys_map
Date: Fri,  4 Feb 2022 09:44:35 -0800
Message-Id: <20220204174436.830121-19-lucas.demarchi@intel.com>
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
index cf6fafa1024c..6262fd4e0d4a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -613,7 +613,6 @@ static void __guc_ads_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base;
@@ -624,17 +623,18 @@ static void __guc_ads_init(struct intel_guc *guc)
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
@@ -648,14 +648,17 @@ static void __guc_ads_init(struct intel_guc *guc)
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

