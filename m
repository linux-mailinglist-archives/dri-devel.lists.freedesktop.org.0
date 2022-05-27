Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1E536608
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 18:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFEF10E5C9;
	Fri, 27 May 2022 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFD910E124;
 Fri, 27 May 2022 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653669232; x=1685205232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+u6G6BRIBY6Yb/hXIpXd2UWGo6CE7DhW/1HUL4nUVw=;
 b=OuYQk9qCBaiTiaA+Q99iAqhzrHK6QeaI1NRbENmkXTawUrjuwssLfENd
 e6yzIxwDZEaSKgbjUFohpdmkHiOgibEVgdeVoXt72+ncltdTFguoPXaXT
 ThYgS9EzeBQ7qkEIQbdd9/sPGQ6577zGkSHezxw5/2oVzrholjKqA+iV1
 DyL7hYfioYcPx9X62QI1r9gYMA9FZDX4tiwCX3RavGjT3zaefsX2PXVmp
 DidNu7utDxnh8cjanH//+rU/cWwcV1b+3cLmwAIP5obJpLx+ulXKaTGZD
 5fiu7lAcu62aGnRG1RC6WUWuqkxAdrchYJJQhU3XNspuMiJJUg3Oo7D7z A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="262138721"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; d="scan'208";a="262138721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 09:33:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; d="scan'208";a="550291703"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 09:33:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/pvc: Extract stepping information from PCI revid
Date: Fri, 27 May 2022 09:33:47 -0700
Message-Id: <20220527163348.1936146-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220527163348.1936146-1-matthew.d.roper@intel.com>
References: <20220527163348.1936146-1-matthew.d.roper@intel.com>
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

For PVC, the base die and compute tile have separate stepping values
that we need to track; we'll use the existing graphics_step field to
represent the compute tile stepping and add a new 'basedie_step' field.

Unlike past platforms, steppings for these components are represented by
specific bitfields within the PCI revision ID, and we shouldn't make
assumptions about the non-CT, non-BD bits staying 0.  Let's update our
stepping code accordingly.

Bspec: 44484
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h   | 13 ++++++
 drivers/gpu/drm/i915/intel_step.c | 70 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/intel_step.h |  4 +-
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 74b3caccd839..ec1b3484fdaf 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -943,6 +943,7 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 #define INTEL_DISPLAY_STEP(__i915) (RUNTIME_INFO(__i915)->step.display_step)
 #define INTEL_GRAPHICS_STEP(__i915) (RUNTIME_INFO(__i915)->step.graphics_step)
 #define INTEL_MEDIA_STEP(__i915) (RUNTIME_INFO(__i915)->step.media_step)
+#define INTEL_BASEDIE_STEP(__i915) (RUNTIME_INFO(__i915)->step.basedie_step)
 
 #define IS_DISPLAY_STEP(__i915, since, until) \
 	(drm_WARN_ON(&(__i915)->drm, INTEL_DISPLAY_STEP(__i915) == STEP_NONE), \
@@ -956,6 +957,10 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 	(drm_WARN_ON(&(__i915)->drm, INTEL_MEDIA_STEP(__i915) == STEP_NONE), \
 	 INTEL_MEDIA_STEP(__i915) >= (since) && INTEL_MEDIA_STEP(__i915) < (until))
 
+#define IS_BASEDIE_STEP(__i915, since, until) \
+	(drm_WARN_ON(&(__i915)->drm, INTEL_BASEDIE_STEP(__i915) == STEP_NONE), \
+	 INTEL_BASEDIE_STEP(__i915) >= (since) && INTEL_BASEDIE_STEP(__i915) < (until))
+
 static __always_inline unsigned int
 __platform_mask_index(const struct intel_runtime_info *info,
 		      enum intel_platform p)
@@ -1208,6 +1213,14 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	(IS_DG2(__i915) && \
 	 IS_DISPLAY_STEP(__i915, since, until))
 
+#define IS_PVC_BD_STEP(__i915, since, until) \
+	(IS_PONTEVECCHIO(__i915) && \
+	 IS_BASEDIE_STEP(__i915, since, until))
+
+#define IS_PVC_CT_STEP(__i915, since, until) \
+	(IS_PONTEVECCHIO(__i915) && \
+	 IS_GRAPHICS_STEP(__i915, since, until))
+
 #define IS_LP(dev_priv)		(INTEL_INFO(dev_priv)->is_lp)
 #define IS_GEN9_LP(dev_priv)	(GRAPHICS_VER(dev_priv) == 9 && IS_LP(dev_priv))
 #define IS_GEN9_BC(dev_priv)	(GRAPHICS_VER(dev_priv) == 9 && !IS_LP(dev_priv))
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 74e8e4680028..42b3133d8387 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -135,6 +135,8 @@ static const struct intel_step_info adlp_n_revids[] = {
 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
 };
 
+static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
+
 void intel_step_init(struct drm_i915_private *i915)
 {
 	const struct intel_step_info *revids = NULL;
@@ -142,7 +144,10 @@ void intel_step_init(struct drm_i915_private *i915)
 	int revid = INTEL_REVID(i915);
 	struct intel_step_info step = {};
 
-	if (IS_DG2_G10(i915)) {
+	if (IS_PONTEVECCHIO(i915)) {
+		pvc_step_init(i915, revid);
+		return;
+	} else if (IS_DG2_G10(i915)) {
 		revids = dg2_g10_revid_step_tbl;
 		size = ARRAY_SIZE(dg2_g10_revid_step_tbl);
 	} else if (IS_DG2_G11(i915)) {
@@ -235,6 +240,69 @@ void intel_step_init(struct drm_i915_private *i915)
 	RUNTIME_INFO(i915)->step = step;
 }
 
+#define PVC_BD_REVID	GENMASK(5, 3)
+#define PVC_CT_REVID	GENMASK(2, 0)
+
+static const int pvc_bd_subids[] = {
+	[0x0] = STEP_A0,
+	[0x3] = STEP_B0,
+	[0x4] = STEP_B1,
+	[0x5] = STEP_B3,
+};
+
+static const int pvc_ct_subids[] = {
+	[0x3] = STEP_A0,
+	[0x5] = STEP_B0,
+	[0x6] = STEP_B1,
+	[0x7] = STEP_C0,
+};
+
+static int
+pvc_step_lookup(struct drm_i915_private *i915, const char *type,
+		const int *table, int size, int subid)
+{
+	if (subid < size && table[subid] != STEP_NONE)
+		return table[subid];
+
+	drm_warn(&i915->drm, "Unknown %s id 0x%02x\n", type, subid);
+
+	/*
+	 * As on other platforms, try to use the next higher ID if we land on a
+	 * gap in the table.
+	 */
+	while (subid < size && table[subid] == STEP_NONE)
+		subid++;
+
+	if (subid < size) {
+		drm_dbg(&i915->drm, "Using steppings for %s id 0x%02x\n",
+			type, subid);
+		return table[subid];
+	}
+
+	drm_dbg(&i915->drm, "Using future steppings\n");
+	return STEP_FUTURE;
+}
+
+/*
+ * PVC needs special handling since we don't lookup the
+ * revid in a table, but rather specific bitfields within
+ * the revid for various components.
+ */
+static void pvc_step_init(struct drm_i915_private *i915, int pci_revid)
+{
+	int ct_subid, bd_subid;
+
+	bd_subid = FIELD_GET(PVC_BD_REVID, pci_revid);
+	ct_subid = FIELD_GET(PVC_CT_REVID, pci_revid);
+
+	RUNTIME_INFO(i915)->step.basedie_step =
+		pvc_step_lookup(i915, "Base Die", pvc_bd_subids,
+				ARRAY_SIZE(pvc_bd_subids), bd_subid);
+	RUNTIME_INFO(i915)->step.graphics_step =
+		pvc_step_lookup(i915, "Compute Tile", pvc_ct_subids,
+				ARRAY_SIZE(pvc_ct_subids), ct_subid);
+}
+
 #define STEP_NAME_CASE(name)	\
 	case STEP_##name:	\
 		return #name;
diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
index d71a99bd5179..a6b12bfa9744 100644
--- a/drivers/gpu/drm/i915/intel_step.h
+++ b/drivers/gpu/drm/i915/intel_step.h
@@ -11,9 +11,10 @@
 struct drm_i915_private;
 
 struct intel_step_info {
-	u8 graphics_step;
+	u8 graphics_step;	/* Represents the compute tile on Xe_HPC */
 	u8 display_step;
 	u8 media_step;
+	u8 basedie_step;
 };
 
 #define STEP_ENUM_VAL(name)  STEP_##name,
@@ -25,6 +26,7 @@ struct intel_step_info {
 	func(B0)			\
 	func(B1)			\
 	func(B2)			\
+	func(B3)			\
 	func(C0)			\
 	func(C1)			\
 	func(D0)			\
-- 
2.35.3

