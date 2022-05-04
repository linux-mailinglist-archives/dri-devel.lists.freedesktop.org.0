Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF283519EEF
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D46910E7A4;
	Wed,  4 May 2022 12:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6A10E504;
 Wed,  4 May 2022 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651666045; x=1683202045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iaezcSeYVIajnw3eytjqvvlic5Jpbz2ugcO6Nhfv8X0=;
 b=XpWddH4RPRtGWlSIVdIlNBZWGO32bP2TfjWCuebaBCzHDsuvUh3L6oIA
 sMXHJINrxacL2Dl74cDWvcn2U/8Pqg/XPhlj8e5Cx5CBgQsz8GbWUc9qD
 3Vimkxzv6CeYvxdAibWJYoKUC20vcDpDcUH6SCryuixYJil2f0UDD9P9z
 A4r09+ld6lyBOcugkK54dTOcFyfhWCjmOAOElD/tkzwa8dwV+vT1eS13A
 BCc5Uj8+wRwySHcEsFYpDPAqGBe4xM+DxrTGR4Kylj42TOBkHQaoaZhzT
 j4ZwEsOKJ9tP70gCKG5CzV1zT1DcKiJZaYGUMERmaoN3E5IMjde/cFvcs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267343595"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="267343595"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:07:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="693884056"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.236.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:07:22 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected
 l3bank/mslice config
Date: Wed,  4 May 2022 13:07:14 +0100
Message-Id: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
to exercise a certain code path, so in case of values coming from MMIO
reads we cannot be sure CI will have all the possible SKUs and parts.

Use drm_warn instead and move logging to init phase while at it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 53307ca0eed0..c474e5c3ea5e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -153,11 +153,14 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 	 * An mslice is unavailable only if both the meml3 for the slice is
 	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
 	 */
-	if (HAS_MSLICES(i915))
+	if (HAS_MSLICES(i915)) {
 		gt->info.mslice_mask =
 			slicemask(gt, GEN_DSS_PER_MSLICE) |
 			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			 GEN12_MEML3_EN_MASK);
+		if (!gt->info.mslice_mask) /* should be impossible! */
+			drm_warn(&i915->drm, "mslice mask all zero!\n");
+	}
 
 	if (IS_DG2(i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
@@ -171,6 +174,8 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 		gt->info.l3bank_mask =
 			~intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			GEN10_L3BANK_MASK;
+		if (!gt->info.l3bank_mask) /* should be impossible! */
+			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
 	} else if (HAS_MSLICES(i915)) {
 		MISSING_CASE(INTEL_INFO(i915)->platform);
 	}
@@ -882,20 +887,14 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
 {
 	switch (type) {
 	case L3BANK:
-		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
-
 		*sliceid = 0;		/* unused */
 		*subsliceid = __ffs(gt->info.l3bank_mask);
 		break;
 	case MSLICE:
-		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
-
 		*sliceid = __ffs(gt->info.mslice_mask);
 		*subsliceid = 0;	/* unused */
 		break;
 	case LNCF:
-		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
-
 		/*
 		 * An LNCF is always present if its mslice is present, so we
 		 * can safely just steer to LNCF 0 in all cases.
-- 
2.32.0

