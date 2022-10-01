Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D35F1788
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9DE10E49D;
	Sat,  1 Oct 2022 00:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392C210E498;
 Sat,  1 Oct 2022 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585183; x=1696121183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wG9M37JMzdOyGt6f7SIFaWSQwjRiBvFNFXo8NFbhogw=;
 b=V+C1joKzuIyWidBcRFAgoYxhmnx6qkEIUwM/7ti2dKcUGT+GYrMIiini
 IUmSNX9dAzygsJT/3TY+S4UKIgI0gJg5sYrkyfnKKQQcl57CCd0xG0NNL
 9BUyJnU7VWlWrLkGSEFMheFojBBse5wSJE2kofNnO1MwctDKR8ASS/LJz
 ANO1tO2V8VCbQDPM9dAJqnq/m/XCHJJxU2IEsid87htT3lnbi2qEohwxU
 hrdfYbn96GpcDwJjA35uU9yX7To1ThS/geOdEWMN11DwNqGgA0HERAAFy
 BHOw6G7r8+SubOcyoDf+z0+erbIh1Gkgcir0cLK2ntK6Tk6sIpvm6e4U3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388607930"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="388607930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477662"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477662"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/14] drm/i915/mtl: Add multicast steering for media GT
Date: Fri, 30 Sep 2022 17:45:50 -0700
Message-Id: <20221001004550.3031431-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001004550.3031431-1-matthew.d.roper@intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org
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
index a1fa71b47831..a580723bdd04 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -42,6 +42,7 @@ static const char * const intel_steering_types[] = {
 	"LNCF",
 	"GAM",
 	"DSS",
+	"OADDRM",
 	"INSTANCE 0",
 };
 
@@ -129,6 +130,12 @@ static const struct intel_mmio_range mtl3d_dss_steering_table[] = {
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
@@ -151,8 +158,9 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			drm_warn(&i915->drm, "mslice mask all zero!\n");
 	}
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
-	    gt->type == GT_PRIMARY) {
+	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
+		gt->steering_table[OADDRM] = xelpmp_oaddrm_steering_table;
+	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
 		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
 				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
 
@@ -479,6 +487,13 @@ static void get_nonterminated_steering(struct intel_gt *gt,
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
index 77ecbd6be331..5d049e0c66f5 100644
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
index 9be048da7fb3..744d83e5bb1f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1595,12 +1595,28 @@ mtl_3d_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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

