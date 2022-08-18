Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318EF5A01E6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DFAC13E0;
	Wed, 24 Aug 2022 19:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7F610E5A5;
 Thu, 18 Aug 2022 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866152; x=1692402152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wtFqfruh26ymcrjilMJsHUob9eeQw8RGEQc5RKnGTA=;
 b=kxNks7dNwZSEATdZsSrO3npE/0iDtRq8Z+nUWuzCyGFhg2kwajyQhbg9
 nFXASvLexFrJIRi3t3a/yF+bU+wZboM6bptttWBVxbfPdpYl6rvYN2dFX
 rcC+H8lvofzD0nXIEDKa2AFbYcDz1kJqdXIP0YTArxzElT64c/++Q39Kk
 aeNfqYmQan7K+aKSscbwcs1RMlMeP+VgoC5i84o4YdBc1VvnaRs1reXHH
 NWEd2kYBAAQJz4E5a3qkaf0L4OPtSoZR3EMeTpURzaWZQQGg7tp5oPUs5
 RZWt44rWveMGIiIP3zsfrwOrol/xufyAbwo3zNxl8bjsggdLGYdoWBAOF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938525"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
 d="scan'208,223";a="275938525"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
 d="scan'208,223";a="783953300"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 15/21] drm/i915/mtl: Obtain SAGV values from MMIO instead
 of GT pcode mailbox
Date: Thu, 18 Aug 2022 16:41:56 -0700
Message-Id: <20220818234202.451742-16-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From Meteorlake, Latency Level, SAGV bloack time are read from
LATENCY_SAGV register instead of the GT driver pcode mailbox. DDR type
and QGV information are also to be read from Mem SS registers.

v2:
 - Simplify MTL_MEM_SS_INFO_QGV_POINT macro(MattR)
 - Nit: Rearrange the bit def's from higher to lower(MattR)
 - Restore platform definition for ADL-P(MattR)
 - Move back intel_qgv_point def to intel_bw.c(Jani)
Bspec: 64636, 64608

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Original Author: Caz Yokoyama
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 42 ++++++++++++++++++++++---
 drivers/gpu/drm/i915/i915_reg.h         | 16 ++++++++++
 drivers/gpu/drm/i915/intel_dram.c       | 41 +++++++++++++++++++++++-
 drivers/gpu/drm/i915/intel_pm.c         |  8 ++++-
 4 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 79269d2c476b..46b63afd536a 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -137,6 +137,42 @@ int icl_pcode_restrict_qgv_points(struct drm_i915_private *dev_priv,
 	return 0;
 }
 
+static int mtl_read_qgv_point_info(struct drm_i915_private *dev_priv,
+				   struct intel_qgv_point *sp, int point)
+{
+	u32 val, val2;
+	u16 dclk;
+
+	val = intel_uncore_read(&dev_priv->uncore,
+				MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
+	val2 = intel_uncore_read(&dev_priv->uncore,
+				 MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
+	dclk = REG_FIELD_GET(MTL_DCLK_MASK, val);
+	sp->dclk = DIV_ROUND_UP((16667 * dclk), 1000);
+	sp->t_rp = REG_FIELD_GET(MTL_TRP_MASK, val);
+	sp->t_rcd = REG_FIELD_GET(MTL_TRCD_MASK, val);
+
+	sp->t_rdpre = REG_FIELD_GET(MTL_TRDPRE_MASK, val2);
+	sp->t_ras = REG_FIELD_GET(MTL_TRAS_MASK, val2);
+
+	sp->t_rc = sp->t_rp + sp->t_ras;
+
+	return 0;
+}
+
+static int
+intel_read_qgv_point_info(struct drm_i915_private *dev_priv,
+			  struct intel_qgv_point *sp,
+			  int point)
+{
+	if (DISPLAY_VER(dev_priv) >= 14)
+		return mtl_read_qgv_point_info(dev_priv, sp, point);
+	else if (IS_DG1(dev_priv))
+		return dg1_mchbar_read_qgv_point_info(dev_priv, sp, point);
+	else
+		return icl_pcode_read_qgv_point_info(dev_priv, sp, point);
+}
+
 static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 			      struct intel_qgv_info *qi,
 			      bool is_y_tile)
@@ -193,11 +229,7 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 	for (i = 0; i < qi->num_points; i++) {
 		struct intel_qgv_point *sp = &qi->points[i];
 
-		if (IS_DG1(dev_priv))
-			ret = dg1_mchbar_read_qgv_point_info(dev_priv, sp, i);
-		else
-			ret = icl_pcode_read_qgv_point_info(dev_priv, sp, i);
-
+		ret = intel_read_qgv_point_info(dev_priv, sp, i);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index b2d5e1230c25..5245af8d0ea8 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8397,4 +8397,20 @@ enum skl_power_gate {
 #define  MTL_LATENCY_LEVEL0_2_4_MASK	REG_GENMASK(12, 0)
 #define  MTL_LATENCY_LEVEL1_3_5_MASK	REG_GENMASK(28, 16)
 
+#define MTL_LATENCY_SAGV		_MMIO(0x4578c)
+#define  MTL_LATENCY_QCLK_SAGV		REG_GENMASK(12, 0)
+
+#define MTL_MEM_SS_INFO_GLOBAL			_MMIO(0x45700)
+#define  MTL_DDR_TYPE_MASK			REG_GENMASK(3, 0)
+#define  MTL_N_OF_POPULATED_CH_MASK		REG_GENMASK(7, 4)
+#define  MTL_N_OF_ENABLED_QGV_POINTS_MASK	REG_GENMASK(11, 8)
+
+#define MTL_MEM_SS_INFO_QGV_POINT_LOW(point)	 _MMIO(0x45710 + (point) * 2)
+#define MTL_MEM_SS_INFO_QGV_POINT_HIGH(point)	 _MMIO(0x45714 + (point) * 2)
+#define  MTL_TRCD_MASK			REG_GENMASK(31, 24)
+#define  MTL_TRP_MASK			REG_GENMASK(23, 16)
+#define  MTL_TRAS_MASK			REG_GENMASK(16, 8)
+#define  MTL_DCLK_MASK			REG_GENMASK(15, 0)
+#define  MTL_TRDPRE_MASK		REG_GENMASK(7, 0)
+
 #endif /* _I915_REG_H_ */
diff --git a/drivers/gpu/drm/i915/intel_dram.c b/drivers/gpu/drm/i915/intel_dram.c
index 437447119770..2403ccd52c74 100644
--- a/drivers/gpu/drm/i915/intel_dram.c
+++ b/drivers/gpu/drm/i915/intel_dram.c
@@ -466,6 +466,43 @@ static int gen12_get_dram_info(struct drm_i915_private *i915)
 	return icl_pcode_read_mem_global_info(i915);
 }
 
+static int xelpdp_get_dram_info(struct drm_i915_private *i915)
+{
+	u32 val = intel_uncore_read(&i915->uncore, MTL_MEM_SS_INFO_GLOBAL);
+	struct dram_info *dram_info = &i915->dram_info;
+
+	val = REG_FIELD_GET(MTL_DDR_TYPE_MASK, val);
+	switch (val) {
+	case 0:
+		dram_info->type = INTEL_DRAM_DDR4;
+		break;
+	case 1:
+		dram_info->type = INTEL_DRAM_DDR5;
+		break;
+	case 2:
+		dram_info->type = INTEL_DRAM_LPDDR5;
+		break;
+	case 3:
+		dram_info->type = INTEL_DRAM_LPDDR4;
+		break;
+	case 4:
+		dram_info->type = INTEL_DRAM_DDR3;
+		break;
+	case 5:
+		dram_info->type = INTEL_DRAM_LPDDR3;
+		break;
+	default:
+		MISSING_CASE(val);
+		return -EINVAL;
+	}
+
+	dram_info->num_channels = REG_FIELD_GET(MTL_N_OF_POPULATED_CH_MASK, val);
+	dram_info->num_qgv_points = REG_FIELD_GET(MTL_N_OF_ENABLED_QGV_POINTS_MASK, val);
+	/* PSF GV points not supported in D14+ */
+
+	return 0;
+}
+
 void intel_dram_detect(struct drm_i915_private *i915)
 {
 	struct dram_info *dram_info = &i915->dram_info;
@@ -480,7 +517,9 @@ void intel_dram_detect(struct drm_i915_private *i915)
 	 */
 	dram_info->wm_lv_0_adjust_needed = !IS_GEN9_LP(i915);
 
-	if (GRAPHICS_VER(i915) >= 12)
+	if (DISPLAY_VER(i915) >= 14)
+		ret = xelpdp_get_dram_info(i915);
+	else if (GRAPHICS_VER(i915) >= 12)
 		ret = gen12_get_dram_info(i915);
 	else if (GRAPHICS_VER(i915) >= 11)
 		ret = gen11_get_dram_info(i915);
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index fac565d23d57..f71b3b8b590c 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -3698,7 +3698,13 @@ intel_has_sagv(struct drm_i915_private *dev_priv)
 static u32
 intel_sagv_block_time(struct drm_i915_private *dev_priv)
 {
-	if (DISPLAY_VER(dev_priv) >= 12) {
+	if (DISPLAY_VER(dev_priv) >= 14) {
+		u32 val;
+
+		val = intel_uncore_read(&dev_priv->uncore, MTL_LATENCY_SAGV);
+
+		return REG_FIELD_GET(MTL_LATENCY_QCLK_SAGV, val);
+	} else if (DISPLAY_VER(dev_priv) >= 12) {
 		u32 val = 0;
 		int ret;
 
-- 
2.25.1

