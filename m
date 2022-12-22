Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76720654865
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF1210E5A5;
	Thu, 22 Dec 2022 22:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463D10E59B;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IsuS07+1T+H8kHRV/nFJPCrImd4PZ+QYaKunQTRsT7s=;
 b=j1bu0PUi/1ZtXUhDBiXeiIgOA2tykA6ojgLYZMPG2a3S/t0qc3NBv0Ij
 J1+U0IJsS4cT0IqZMx3ra2FRrSyXB46knF+MQReS/7x4JjdCimgKU4/Ey
 TQjVdiKkyq8U9pzamBcqaPx3cHX+Jess8lE9BOZUK38Y55yh3B9bwN5VS
 adcZ55M3ZgpEOHXr3hoatemiRc5fpI3HWOuIWcCMSc1PT65p1zADSKrPy
 ydOxZa/7gUumDGaodfCUIT++y28kfx7K6vE2GWjnp648HzEj8xVRna5SI
 2A3+ezEkZ/lu25ujNrOrM9IuJb1J6y2/Zh6h48QJJIUfmmfIXOcvQnajY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472862"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472862"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412325"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412325"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 14/20] drm/i915/display: Remove all uncore mmio accesses
 in favor of intel_de
Date: Thu, 22 Dec 2022 14:21:21 -0800
Message-Id: <20221222222127.34560-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/hsw_ips.c        |  7 ++-
 drivers/gpu/drm/i915/display/intel_bios.c     | 25 ++++++-----
 drivers/gpu/drm/i915/display/intel_bw.c       | 34 +++++++-------
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 45 +++++++++----------
 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 .../drm/i915/display/intel_display_power.c    |  3 +-
 .../i915/display/intel_display_power_well.c   |  7 ++-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  9 ++--
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  9 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  1 -
 drivers/gpu/drm/i915/display/skl_watermark.c  | 23 +++++-----
 11 files changed, 78 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 83aa3800245f..b2253f7cfc00 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -8,7 +8,6 @@
 #include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
-#include "intel_pcode.h"
 
 static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 {
@@ -28,8 +27,8 @@ static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 
 	if (IS_BROADWELL(i915)) {
 		drm_WARN_ON(&i915->drm,
-			    snb_pcode_write(&i915->uncore, DISPLAY_IPS_CONTROL,
-					    IPS_ENABLE | IPS_PCODE_CONTROL));
+			    intel_de_pcode_write(i915, DISPLAY_IPS_CONTROL,
+						 IPS_ENABLE | IPS_PCODE_CONTROL));
 		/*
 		 * Quoting Art Runyan: "its not safe to expect any particular
 		 * value in IPS_CTL bit 31 after enabling IPS through the
@@ -62,7 +61,7 @@ bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
 
 	if (IS_BROADWELL(i915)) {
 		drm_WARN_ON(&i915->drm,
-			    snb_pcode_write(&i915->uncore, DISPLAY_IPS_CONTROL, 0));
+			    intel_de_pcode_write(i915, DISPLAY_IPS_CONTROL, 0));
 		/*
 		 * Wait for PCODE to finish disabling IPS. The BSpec specified
 		 * 42ms timeout value leads to occasional timeouts so use 100ms
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 55544d484318..755e56f9db6c 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -29,9 +29,10 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dsc_helper.h>
 
-#include "display/intel_display.h"
-#include "display/intel_display_types.h"
-#include "display/intel_gmbus.h"
+#include "intel_de.h"
+#include "intel_display.h"
+#include "intel_display_types.h"
+#include "intel_gmbus.h"
 
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -3001,16 +3002,16 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 	u16 vbt_size;
 	u32 *vbt;
 
-	static_region = intel_uncore_read(&i915->uncore, SPI_STATIC_REGIONS);
+	static_region = intel_de_read(i915, SPI_STATIC_REGIONS);
 	static_region &= OPTIONROM_SPI_REGIONID_MASK;
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_REGIONID, static_region);
+	intel_de_write(i915, PRIMARY_SPI_REGIONID, static_region);
 
-	oprom_offset = intel_uncore_read(&i915->uncore, OROM_OFFSET);
+	oprom_offset = intel_de_read(i915, OROM_OFFSET);
 	oprom_offset &= OROM_OFFSET_MASK;
 
 	for (count = 0; count < oprom_size; count += 4) {
-		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, oprom_offset + count);
-		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+		intel_de_write(i915, PRIMARY_SPI_ADDRESS, oprom_offset + count);
+		data = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
 
 		if (data == *((const u32 *)"$VBT")) {
 			found = oprom_offset + count;
@@ -3022,9 +3023,9 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	/* Get VBT size and allocate space for the VBT */
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found +
+	intel_de_write(i915, PRIMARY_SPI_ADDRESS, found +
 		   offsetof(struct vbt_header, vbt_size));
-	vbt_size = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+	vbt_size = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
 	vbt_size &= 0xffff;
 
 	vbt = kzalloc(round_up(vbt_size, 4), GFP_KERNEL);
@@ -3032,8 +3033,8 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	for (count = 0; count < vbt_size; count += 4) {
-		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found + count);
-		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+		intel_de_write(i915, PRIMARY_SPI_ADDRESS, found + count);
+		data = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
 		*(vbt + store++) = data;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 1c236f02b380..54e03a3eaa0f 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -11,11 +11,11 @@
 #include "intel_atomic.h"
 #include "intel_bw.h"
 #include "intel_cdclk.h"
+#include "intel_de.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "skl_watermark.h"
 #include "intel_mchbar_regs.h"
-#include "intel_pcode.h"
 
 /* Parameters for Qclk Geyserville (QGV) */
 struct intel_qgv_point {
@@ -44,7 +44,7 @@ static int dg1_mchbar_read_qgv_point_info(struct drm_i915_private *dev_priv,
 	u32 dclk_ratio, dclk_reference;
 	u32 val;
 
-	val = intel_uncore_read(&dev_priv->uncore, SA_PERF_STATUS_0_0_0_MCHBAR_PC);
+	val = intel_de_read(dev_priv, SA_PERF_STATUS_0_0_0_MCHBAR_PC);
 	dclk_ratio = REG_FIELD_GET(DG1_QCLK_RATIO_MASK, val);
 	if (val & DG1_QCLK_REFERENCE)
 		dclk_reference = 6; /* 6 * 16.666 MHz = 100 MHz */
@@ -52,18 +52,18 @@ static int dg1_mchbar_read_qgv_point_info(struct drm_i915_private *dev_priv,
 		dclk_reference = 8; /* 8 * 16.666 MHz = 133 MHz */
 	sp->dclk = DIV_ROUND_UP((16667 * dclk_ratio * dclk_reference) + 500, 1000);
 
-	val = intel_uncore_read(&dev_priv->uncore, SKL_MC_BIOS_DATA_0_0_0_MCHBAR_PCU);
+	val = intel_de_read(dev_priv, SKL_MC_BIOS_DATA_0_0_0_MCHBAR_PCU);
 	if (val & DG1_GEAR_TYPE)
 		sp->dclk *= 2;
 
 	if (sp->dclk == 0)
 		return -EINVAL;
 
-	val = intel_uncore_read(&dev_priv->uncore, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR);
+	val = intel_de_read(dev_priv, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR);
 	sp->t_rp = REG_FIELD_GET(DG1_DRAM_T_RP_MASK, val);
 	sp->t_rdpre = REG_FIELD_GET(DG1_DRAM_T_RDPRE_MASK, val);
 
-	val = intel_uncore_read(&dev_priv->uncore, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR_HIGH);
+	val = intel_de_read(dev_priv, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR_HIGH);
 	sp->t_rcd = REG_FIELD_GET(DG1_DRAM_T_RCD_MASK, val);
 	sp->t_ras = REG_FIELD_GET(DG1_DRAM_T_RAS_MASK, val);
 
@@ -80,9 +80,9 @@ static int icl_pcode_read_qgv_point_info(struct drm_i915_private *dev_priv,
 	u16 dclk;
 	int ret;
 
-	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ICL_PCODE_MEM_SS_READ_QGV_POINT_INFO(point),
-			     &val, &val2);
+	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+				  ICL_PCODE_MEM_SS_READ_QGV_POINT_INFO(point),
+				  &val, &val2);
 	if (ret)
 		return ret;
 
@@ -106,8 +106,8 @@ static int adls_pcode_read_psf_gv_point_info(struct drm_i915_private *dev_priv,
 	int ret;
 	int i;
 
-	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ADL_PCODE_MEM_SS_READ_PSF_GV_INFO, &val, NULL);
+	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+				  ADL_PCODE_MEM_SS_READ_PSF_GV_INFO, &val, NULL);
 	if (ret)
 		return ret;
 
@@ -125,11 +125,11 @@ int icl_pcode_restrict_qgv_points(struct drm_i915_private *dev_priv,
 	int ret;
 
 	/* bspec says to keep retrying for at least 1 ms */
-	ret = skl_pcode_request(&dev_priv->uncore, ICL_PCODE_SAGV_DE_MEM_SS_CONFIG,
-				points_mask,
-				ICL_PCODE_REP_QGV_MASK | ADLS_PCODE_REP_PSF_MASK,
-				ICL_PCODE_REP_QGV_SAFE | ADLS_PCODE_REP_PSF_SAFE,
-				1);
+	ret = intel_de_pcode_request(dev_priv, ICL_PCODE_SAGV_DE_MEM_SS_CONFIG,
+				     points_mask,
+				     ICL_PCODE_REP_QGV_MASK | ADLS_PCODE_REP_PSF_MASK,
+				     ICL_PCODE_REP_QGV_SAFE | ADLS_PCODE_REP_PSF_SAFE,
+				     1);
 
 	if (ret < 0) {
 		drm_err(&dev_priv->drm, "Failed to disable qgv points (%d) points: 0x%x\n", ret, points_mask);
@@ -145,9 +145,9 @@ static int mtl_read_qgv_point_info(struct drm_i915_private *dev_priv,
 	u32 val, val2;
 	u16 dclk;
 
-	val = intel_uncore_read(&dev_priv->uncore,
+	val = intel_de_read(dev_priv,
 				MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
-	val2 = intel_uncore_read(&dev_priv->uncore,
+	val2 = intel_de_read(dev_priv,
 				 MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
 	dclk = REG_FIELD_GET(MTL_DCLK_MASK, val);
 	sp->dclk = DIV_ROUND_UP((16667 * dclk), 1000);
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 0c107a38f9d0..80e2db6b5ea4 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -35,7 +35,6 @@
 #include "intel_display_types.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pci_config.h"
-#include "intel_pcode.h"
 #include "intel_psr.h"
 #include "vlv_sideband.h"
 
@@ -801,7 +800,7 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
-	ret = snb_pcode_write(&dev_priv->uncore, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ, 0x0);
+	ret = intel_de_pcode_write(dev_priv, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ, 0x0);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"failed to inform pcode about cdclk change\n");
@@ -829,8 +828,8 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 			 LCPLL_CD_SOURCE_FCLK_DONE) == 0, 1))
 		drm_err(&dev_priv->drm, "Switching back to LCPLL failed\n");
 
-	snb_pcode_write(&dev_priv->uncore, HSW_PCODE_DE_WRITE_FREQ_REQ,
-			cdclk_config->voltage_level);
+	intel_de_pcode_write(dev_priv, HSW_PCODE_DE_WRITE_FREQ_REQ,
+			     cdclk_config->voltage_level);
 
 	intel_de_write(dev_priv, CDCLK_FREQ,
 		       DIV_ROUND_CLOSEST(cdclk, 1000) - 1);
@@ -1087,10 +1086,10 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	drm_WARN_ON_ONCE(&dev_priv->drm,
 			 IS_SKYLAKE(dev_priv) && vco == 8640000);
 
-	ret = skl_pcode_request(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
-				SKL_CDCLK_PREPARE_FOR_CHANGE,
-				SKL_CDCLK_READY_FOR_CHANGE,
-				SKL_CDCLK_READY_FOR_CHANGE, 3);
+	ret = intel_de_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
+				     SKL_CDCLK_PREPARE_FOR_CHANGE,
+				     SKL_CDCLK_READY_FOR_CHANGE,
+				     SKL_CDCLK_READY_FOR_CHANGE, 3);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Failed to inform PCU about cdclk change (%d)\n", ret);
@@ -1133,8 +1132,8 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	intel_de_posting_read(dev_priv, CDCLK_CTL);
 
 	/* inform PCU of the change */
-	snb_pcode_write(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
-			cdclk_config->voltage_level);
+	intel_de_pcode_write(dev_priv, SKL_PCODE_CDCLK_CONTROL,
+			     cdclk_config->voltage_level);
 
 	intel_update_cdclk(dev_priv);
 }
@@ -1864,18 +1863,18 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 	if (DISPLAY_VER(dev_priv) >= 14)
 		/* NOOP */;
 	else if (DISPLAY_VER(dev_priv) >= 11)
-		ret = skl_pcode_request(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
-					SKL_CDCLK_PREPARE_FOR_CHANGE,
-					SKL_CDCLK_READY_FOR_CHANGE,
-					SKL_CDCLK_READY_FOR_CHANGE, 3);
+		ret = intel_de_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
+					     SKL_CDCLK_PREPARE_FOR_CHANGE,
+					     SKL_CDCLK_READY_FOR_CHANGE,
+					     SKL_CDCLK_READY_FOR_CHANGE, 3);
 	else
 		/*
 		 * BSpec requires us to wait up to 150usec, but that leads to
 		 * timeouts; the 2ms used here is based on experiment.
 		 */
-		ret = snb_pcode_write_timeout(&dev_priv->uncore,
-					      HSW_PCODE_DE_WRITE_FREQ_REQ,
-					      0x80000000, 150, 2);
+		ret = intel_de_pcode_write_timeout(dev_priv,
+						   HSW_PCODE_DE_WRITE_FREQ_REQ,
+						   0x80000000, 150, 2);
 
 	if (ret) {
 		drm_err(&dev_priv->drm,
@@ -1898,8 +1897,8 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 		 * Display versions 14 and beyond
 		 */;
 	else if (DISPLAY_VER(dev_priv) >= 11)
-		ret = snb_pcode_write(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
-				      cdclk_config->voltage_level);
+		ret = intel_de_pcode_write(dev_priv, SKL_PCODE_CDCLK_CONTROL,
+					   cdclk_config->voltage_level);
 	else
 		/*
 		 * The timeout isn't specified, the 2ms used here is based on
@@ -1907,10 +1906,10 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 		 * FIXME: Waiting for the request completion could be delayed
 		 * until the next PCODE request based on BSpec.
 		 */
-		ret = snb_pcode_write_timeout(&dev_priv->uncore,
-					      HSW_PCODE_DE_WRITE_FREQ_REQ,
-					      cdclk_config->voltage_level,
-					      150, 2);
+		ret = intel_de_pcode_write_timeout(dev_priv,
+						   HSW_PCODE_DE_WRITE_FREQ_REQ,
+						   cdclk_config->voltage_level,
+						   150, 2);
 
 	if (ret) {
 		drm_err(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7a6191cad52a..ef9bab4043ee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -105,7 +105,6 @@
 #include "intel_panel.h"
 #include "intel_pch_display.h"
 #include "intel_pch_refclk.h"
-#include "intel_pcode.h"
 #include "intel_pipe_crc.h"
 #include "intel_plane_initial.h"
 #include "intel_pm.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 1a23ecd4623a..fd0fedb65e42 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -18,7 +18,6 @@
 #include "intel_dmc.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pch_refclk.h"
-#include "intel_pcode.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
 #include "vlv_sideband.h"
@@ -1206,7 +1205,7 @@ static u32 hsw_read_dcomp(struct drm_i915_private *dev_priv)
 static void hsw_write_dcomp(struct drm_i915_private *dev_priv, u32 val)
 {
 	if (IS_HASWELL(dev_priv)) {
-		if (snb_pcode_write(&dev_priv->uncore, GEN6_PCODE_WRITE_D_COMP, val))
+		if (intel_de_pcode_write(dev_priv, GEN6_PCODE_WRITE_D_COMP, val))
 			drm_dbg_kms(&dev_priv->drm,
 				    "Failed to write to D_COMP\n");
 	} else {
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 8710dd41ffd4..a1d75956ae97 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -18,7 +18,6 @@
 #include "intel_dpio_phy.h"
 #include "intel_dpll.h"
 #include "intel_hotplug.h"
-#include "intel_pcode.h"
 #include "intel_pps.h"
 #include "intel_tc.h"
 #include "intel_vga.h"
@@ -477,8 +476,8 @@ static void icl_tc_cold_exit(struct drm_i915_private *i915)
 	int ret, tries = 0;
 
 	while (1) {
-		ret = snb_pcode_write_timeout(&i915->uncore, ICL_PCODE_EXIT_TCCOLD, 0,
-					      250, 1);
+		ret = intel_de_pcode_write_timeout(i915, ICL_PCODE_EXIT_TCCOLD, 0,
+						   250, 1);
 		if (ret != -EAGAIN || ++tries == 3)
 			break;
 		msleep(1);
@@ -1740,7 +1739,7 @@ tgl_tc_cold_request(struct drm_i915_private *i915, bool block)
 		 * Spec states that we should timeout the request after 200us
 		 * but the function below will timeout after 500us
 		 */
-		ret = snb_pcode_read(&i915->uncore, TGL_PCODE_TCCOLD, &low_val, &high_val);
+		ret = intel_de_pcode_read(i915, TGL_PCODE_TCCOLD, &low_val, &high_val);
 		if (ret == 0) {
 			if (block &&
 			    (low_val & TGL_PCODE_EXIT_TCCOLD_DATA_L_EXIT_FAILED))
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index 7eb7440b3180..25bea6d2da67 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -401,11 +401,10 @@ static void _bxt_ddi_phy_init(struct drm_i915_private *dev_priv,
 	 * The flag should get set in 100us according to the HW team, but
 	 * use 1ms due to occasional timeouts observed with that.
 	 */
-	if (intel_wait_for_register_fw(&dev_priv->uncore,
-				       BXT_PORT_CL1CM_DW0(phy),
-				       PHY_RESERVED | PHY_POWER_GOOD,
-				       PHY_POWER_GOOD,
-				       1))
+	if (intel_de_wait_for_register_fw(dev_priv,
+					  BXT_PORT_CL1CM_DW0(phy),
+					  PHY_RESERVED | PHY_POWER_GOOD,
+					  PHY_POWER_GOOD, 1))
 		drm_err(&dev_priv->drm, "timeout during PHY%d power on\n",
 			phy);
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 6406fd487ee5..e62f64dd481f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -24,7 +24,6 @@
 #include "intel_display_types.h"
 #include "intel_hdcp.h"
 #include "intel_hdcp_regs.h"
-#include "intel_pcode.h"
 
 #define KEY_LOAD_TRIES	5
 #define HDCP2_LC_RETRY_CNT			3
@@ -321,7 +320,7 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 	 * Mailbox interface.
 	 */
 	if (DISPLAY_VER(dev_priv) == 9 && !IS_BROXTON(dev_priv)) {
-		ret = snb_pcode_write(&dev_priv->uncore, SKL_PCODE_LOAD_HDCP_KEYS, 1);
+		ret = intel_de_pcode_write(dev_priv, SKL_PCODE_LOAD_HDCP_KEYS, 1);
 		if (ret) {
 			drm_err(&dev_priv->drm,
 				"Failed to initiate HDCP key load (%d)\n",
@@ -333,9 +332,9 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 	}
 
 	/* Wait for the keys to load (500us) */
-	ret = __intel_wait_for_register(&dev_priv->uncore, HDCP_KEY_STATUS,
-					HDCP_KEY_LOAD_DONE, HDCP_KEY_LOAD_DONE,
-					10, 1, &val);
+	ret = __intel_de_wait_for_register(dev_priv, HDCP_KEY_STATUS,
+					   HDCP_KEY_LOAD_DONE, HDCP_KEY_LOAD_DONE,
+					   10, 1, &val);
 	if (ret)
 		return ret;
 	else if (!(val & HDCP_KEY_LOAD_STATUS))
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index efa2da080f62..6d097a11f939 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -40,7 +40,6 @@
 #include <drm/drm_edid.h>
 #include <drm/intel_lpe_audio.h>
 
-#include "i915_debugfs.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index ae4e9e680c2e..e254fb21b47f 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -18,7 +18,6 @@
 #include "i915_drv.h"
 #include "i915_fixed.h"
 #include "i915_reg.h"
-#include "intel_pcode.h"
 #include "intel_pm.h"
 
 static void skl_sagv_disable(struct drm_i915_private *i915);
@@ -81,9 +80,9 @@ intel_sagv_block_time(struct drm_i915_private *i915)
 		u32 val = 0;
 		int ret;
 
-		ret = snb_pcode_read(&i915->uncore,
-				     GEN12_PCODE_READ_SAGV_BLOCK_TIME_US,
-				     &val, NULL);
+		ret = intel_de_pcode_read(i915,
+					  GEN12_PCODE_READ_SAGV_BLOCK_TIME_US,
+					  &val, NULL);
 		if (ret) {
 			drm_dbg_kms(&i915->drm, "Couldn't read SAGV block time!\n");
 			return 0;
@@ -150,8 +149,8 @@ static void skl_sagv_enable(struct drm_i915_private *i915)
 		return;
 
 	drm_dbg_kms(&i915->drm, "Enabling SAGV\n");
-	ret = snb_pcode_write(&i915->uncore, GEN9_PCODE_SAGV_CONTROL,
-			      GEN9_SAGV_ENABLE);
+	ret = intel_de_pcode_write(i915, GEN9_PCODE_SAGV_CONTROL,
+				   GEN9_SAGV_ENABLE);
 
 	/* We don't need to wait for SAGV when enabling */
 
@@ -183,10 +182,10 @@ static void skl_sagv_disable(struct drm_i915_private *i915)
 
 	drm_dbg_kms(&i915->drm, "Disabling SAGV\n");
 	/* bspec says to keep retrying for at least 1 ms */
-	ret = skl_pcode_request(&i915->uncore, GEN9_PCODE_SAGV_CONTROL,
-				GEN9_SAGV_DISABLE,
-				GEN9_SAGV_IS_DISABLED, GEN9_SAGV_IS_DISABLED,
-				1);
+	ret = intel_de_pcode_request(i915, GEN9_PCODE_SAGV_CONTROL,
+				     GEN9_SAGV_DISABLE,
+				     GEN9_SAGV_IS_DISABLED, GEN9_SAGV_IS_DISABLED,
+				     1);
 	/*
 	 * Some skl systems, pre-release machines in particular,
 	 * don't actually have SAGV.
@@ -3224,7 +3223,7 @@ static void skl_read_wm_latency(struct drm_i915_private *i915, u16 wm[])
 
 	/* read the first set of memory latencies[0:3] */
 	val = 0; /* data0 to be programmed to 0 for first set */
-	ret = snb_pcode_read(&i915->uncore, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
+	ret = intel_de_pcode_read(i915, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
 	if (ret) {
 		drm_err(&i915->drm, "SKL Mailbox read error = %d\n", ret);
 		return;
@@ -3237,7 +3236,7 @@ static void skl_read_wm_latency(struct drm_i915_private *i915, u16 wm[])
 
 	/* read the second set of memory latencies[4:7] */
 	val = 1; /* data0 to be programmed to 1 for second set */
-	ret = snb_pcode_read(&i915->uncore, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
+	ret = intel_de_pcode_read(i915, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
 	if (ret) {
 		drm_err(&i915->drm, "SKL Mailbox read error = %d\n", ret);
 		return;
-- 
2.37.3

