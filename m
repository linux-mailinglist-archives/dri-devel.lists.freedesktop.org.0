Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDF51BD9C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE1210F766;
	Thu,  5 May 2022 11:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4939F10F708;
 Thu,  5 May 2022 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651748416; x=1683284416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8SDRkQqiQDEV/GlOGolM6AiyFj8aZhAGppfNzVID1Vo=;
 b=R7xWcIjuQC9ToFMCNU6Zn8p8JByWs0kZjDDMa6Fh5Bu3eoq8/OBYf4Wc
 uXLJ/tIgeS5E7+HXgLsHqhu/Q36dWK80GYctkPOQw5FKYxk+bkqfhFbJJ
 0RkNJFZ+dK/8gXc/YZ1Sh/+dlSknMymXBdHtFhPhCfreSwcXtMJHJCu7/
 b4F0OfRbMLavh/eHf/IqtPL20Xw+M1r107Lznh/HjJArM43eB0UnNJvxv
 H3kDiKjjFIkzGlZF4cHKvua+hIkW6enBJJvuFzJdFxT1rt9L7mEd4Tl6o
 47w/3+RZjnpf6IPNchDqCBIa6Y/h4wwEF/RnyXMwMBOErFk6dbDiG3Lm3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268224321"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="268224321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:00:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="563189036"
Received: from mrbroom-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.206.41])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:00:13 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI 1/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected
 l3bank/mslice config
Date: Thu,  5 May 2022 12:00:06 +0100
Message-Id: <20220505110007.943449-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
to exercise a certain code path, so in case of values coming from MMIO
reads we cannot be sure CI will have all the possible SKUs and parts.

Use drm_warn instead and move logging to init phase while at it.

v2:
 * GEM_WARN_ON in intel_gt_get_valid_steering.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 53307ca0eed0..034182f85501 100644
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
@@ -882,24 +887,20 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
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
+		GEM_WARN_ON(!HAS_MSLICES(gt->i915));
 		*sliceid = __ffs(gt->info.mslice_mask);
 		*subsliceid = 0;	/* unused */
 		break;
 	case LNCF:
-		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
-
 		/*
 		 * An LNCF is always present if its mslice is present, so we
 		 * can safely just steer to LNCF 0 in all cases.
 		 */
+		GEM_WARN_ON(!HAS_MSLICES(gt->i915));
 		*sliceid = __ffs(gt->info.mslice_mask) << 1;
 		*subsliceid = 0;	/* unused */
 		break;
-- 
2.32.0

