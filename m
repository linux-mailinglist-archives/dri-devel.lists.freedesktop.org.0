Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD175FF693
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3B510E173;
	Fri, 14 Oct 2022 23:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FB610E14B;
 Fri, 14 Oct 2022 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788585; x=1697324585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ojhGefCBWKgraiPsza53LL8lmh8xKnD2xnX5HsGjb/I=;
 b=U4/CDuGfGo0Y0dnTbZ6VNrYyTdcKWt/jRJ++mQs/brLAOk5AHsr/qQCl
 rBHmasKdVvidackA7OaMDmXHjQ+BX2ykZpBIgTr9ZMECX0YJeTFgpgPb9
 Axf1X3opS0GgieVzsMZ5dNnEwj1wXoJYQjMQCfsIOWpEks5ge6J6MFhzL
 KeFJvvhHMm7WvnQ8rnmWDHUl9fj2o9XtiZ5hGruHMnxLszcC/5XLDI5qM
 WPoPTFh7PnuboPjUl+lEqVFL/d93PrLxx6yaAXtoATrISGCgqg9K9Z7r7
 lBnrB6d9hpdnWNnc1Lr/T3eR4CLwna552ILPxd0/CARMxaSIk55f+yAAp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216977"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216977"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471730"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471730"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 14/14] drm/i915/xelpmp: Add multicast steering for media GT
Date: Fri, 14 Oct 2022 16:02:39 -0700
Message-Id: <20221014230239.1023689-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014230239.1023689-1-matthew.d.roper@intel.com>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
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

MTL's media IP (Xe_LPM+) only has a single type of steering ("OAADDRM")
which selects between media slice 0 and media slice 1.  We'll always
steer to media slice 0 unless it is fused off (which is the case when
VD0, VE0, and SFC0 are all reported as unavailable).

Bspec: 67789
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 18 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 17 +++++++++++++++--
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 23a1ef9659bf..0d2811724b00 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -42,6 +42,7 @@ static const char * const intel_steering_types[] = {
 	"LNCF",
 	"GAM",
 	"DSS",
+	"OADDRM",
 	"INSTANCE 0",
 };
 
@@ -129,6 +130,11 @@ static const struct intel_mmio_range xelpg_dss_steering_table[] = {
 	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
 };
 
+static const struct intel_mmio_range xelpmp_oaddrm_steering_table[] = {
+	{ 0x393200, 0x39323F },
+	{ 0x393400, 0x3934FF },
+};
+
 void intel_gt_mcr_init(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -151,8 +157,9 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			drm_warn(&i915->drm, "mslice mask all zero!\n");
 	}
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
-	    gt->type == GT_PRIMARY) {
+	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
+		gt->steering_table[OADDRM] = xelpmp_oaddrm_steering_table;
+	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
 		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
 				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
 
@@ -514,6 +521,13 @@ static void get_nonterminated_steering(struct intel_gt *gt,
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
index 0bb73d110a84..64aa2ba624fc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -61,6 +61,7 @@ enum intel_steering_type {
 	LNCF,
 	GAM,
 	DSS,
+	OADDRM,
 
 	/*
 	 * On some platforms there are multiple types of MCR registers that
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 711a31935857..bae960486872 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1598,14 +1598,27 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	debug_dump_steering(gt);
 }
 
+static void
+xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	/* FIXME: Actual workarounds will be added in future patch(es) */
+
+	debug_dump_steering(gt);
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
-	/* FIXME: Media GT handling will be added in an upcoming patch */
-	if (gt->type == GT_MEDIA)
+	if (gt->type == GT_MEDIA) {
+		if (MEDIA_VER(i915) >= 13)
+			xelpmp_gt_workarounds_init(gt, wal);
+		else
+			MISSING_CASE(MEDIA_VER(i915));
+
 		return;
+	}
 
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
 		xelpg_gt_workarounds_init(gt, wal);
-- 
2.37.3

