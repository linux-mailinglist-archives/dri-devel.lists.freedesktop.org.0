Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6665BD766
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8695E10E1AB;
	Mon, 19 Sep 2022 22:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F58610E194;
 Mon, 19 Sep 2022 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663626790; x=1695162790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a4sycDUWYN4IudWCOuf656+BZ7xPzwkVwZeqK5x8irU=;
 b=ikLFpvFCnOaEx6d5MdvRoy6bEt/8e/G3fNQ+9Dpa6OkQ7zGG6ParQPaC
 w8qQd0tlYm6NAF+gG9m4+zRIxNIbmwYCpg7h28LIRRMYRk38CysiNMypj
 CznRF3dkyLqh3z5+xY1ebxkNgrtiEviM7j1LqQQZBV6iTCc7KLOWeqjve
 wpByfeYQaerpW+Rw9PwBSFkUE7IKI9vUaom8cElgcjQwUr4VTh7DKTL1u
 HgL4ZwWNHzV+mKgC2itCrqRkn08ibf2Bt57sZfglBUSl5qficDpepOfJ9
 uaY2Du8zdOaYbKCW1PaqhvnoI5ij9oWl3y+RZ21pAMYuEJnktMHTvDCco w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286585486"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="286585486"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794030792"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/12] drm/i915/mtl: Add multicast steering for media GT
Date: Mon, 19 Sep 2022 15:32:59 -0700
Message-Id: <20220919223259.263525-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919223259.263525-1-matthew.d.roper@intel.com>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
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

MTL's media GT only has a single type of steering ("OAADDRM") which
selects between media slice 0 and media slice 1.  We'll always steer to
media slice 0 unless it is fused off (which is the case when VD0, VE0,
and SFC0 are all reported as unavailable).

Bspec: 67789
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 19 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 +++++++++++++++++-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 05f41f1cc88d..04f75c1e0f4e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -41,6 +41,7 @@ static const char * const intel_steering_types[] = {
 	"MSLICE",
 	"LNCF",
 	"DSS",
+	"OADDRM",
 	"INSTANCE 0",
 };
 
@@ -119,6 +120,12 @@ static const struct intel_mmio_range mtl3d_dss_steering_table[] = {
 	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
 };
 
+static const struct intel_mmio_range xelpmp_oaddrm_steering_table[] = {
+	{ 0x393200, 0x39323F },
+	{ 0x393400, 0x3934FF },
+};
+
+
 void intel_gt_mcr_init(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -141,8 +148,9 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			drm_warn(&i915->drm, "mslice mask all zero!\n");
 	}
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
-	    gt->type == GT_PRIMARY) {
+	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
+		gt->steering_table[OADDRM] = xelpmp_oaddrm_steering_table;
+	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
 		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
 				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
 
@@ -435,6 +443,13 @@ static void get_nonterminated_steering(struct intel_gt *gt,
 		*group = 0;
 		*instance = 0;
 		break;
+	case OADDRM:
+		if ((VDBOX_MASK(gt) | VEBOX_MASK(gt) | gt->info.sfc_mask) & BIT(0))
+			*group = 0;
+		else
+			*group = 1;
+		*instance = 0;
+		break;
 	default:
 		MISSING_CASE(type);
 		*group = 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 2a0441410ec7..5fa59a66dba2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -60,6 +60,7 @@ enum intel_steering_type {
 	MSLICE,
 	LNCF,
 	DSS,
+	OADDRM,
 
 	/*
 	 * On some platforms there are multiple types of MCR registers that
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 2562ad83966b..9227391fc144 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1585,12 +1585,28 @@ mtl_3d_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	}
 }
 
+static void
+mtl_media_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	/*
+	 * Unlike older platforms, we no longer setup implicit steering here;
+	 * all MCR accesses are explicitly steered.
+	 */
+	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+		struct drm_printer p = drm_debug_printer("MCR Steering:");
+
+		intel_gt_mcr_report_steering(&p, gt, false);
+	}
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
-	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
+	if (IS_METEORLAKE(i915) && gt->type == GT_MEDIA)
+		mtl_media_gt_workarounds_init(gt, wal);
+	else if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
 		mtl_3d_gt_workarounds_init(gt, wal);
 	else if (IS_PONTEVECCHIO(i915))
 		pvc_gt_workarounds_init(gt, wal);
-- 
2.37.3

