Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C939A660
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253AB6F4DF;
	Thu,  3 Jun 2021 16:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536D6F4CE;
 Thu,  3 Jun 2021 16:55:06 +0000 (UTC)
IronPort-SDR: AFrHTCdZ7LEO7qFkNCDlO7JSAO7dM1Ph89/w7Ehf9nO9EyowwSQLNNs/RmUyjW7KYkKbjmlB6t
 bw9O7yH2M+Sw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184464198"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184464198"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:52 -0700
IronPort-SDR: 1Cm6ZZNEgcX/uqo6/uIm8PpmYcOe5aDOX27Q7FUah2DZ/3UF/lbDS5l/2CikTLoAxXQN3p7YID
 Qh5z33Mg8s7w==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="400643685"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915: Add remaining conversions to GRAPHICS_VER
Date: Thu,  3 Jun 2021 09:54:27 -0700
Message-Id: <20210603165428.3625495-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603165428.3625495-1-lucas.demarchi@intel.com>
References: <20210603165428.3625495-1-lucas.demarchi@intel.com>
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

For some reason coccinelle misses a few cases in header files with calls to
INTEL_GEN()/IS_GEN(). Do a manual conversion for those.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 37 ++++++++++++++++-----------------
 drivers/gpu/drm/i915/i915_reg.h | 26 +++++++++++------------
 2 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 91fda14f8f6c..38ff2fb89744 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1552,9 +1552,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	(IS_ALDERLAKE_P(__i915) && \
 	 IS_GT_STEP(__i915, since, until))
 
-#define IS_LP(dev_priv)	(INTEL_INFO(dev_priv)->is_lp)
-#define IS_GEN9_LP(dev_priv)	(IS_GEN(dev_priv, 9) && IS_LP(dev_priv))
-#define IS_GEN9_BC(dev_priv)	(IS_GEN(dev_priv, 9) && !IS_LP(dev_priv))
+#define IS_LP(dev_priv)		(INTEL_INFO(dev_priv)->is_lp)
+#define IS_GEN9_LP(dev_priv)	(GRAPHICS_VER(dev_priv) == 9 && IS_LP(dev_priv))
+#define IS_GEN9_BC(dev_priv)	(GRAPHICS_VER(dev_priv) == 9 && !IS_LP(dev_priv))
 
 #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
 #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
@@ -1574,12 +1574,12 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
  * The Gen7 cmdparser copies the scanned buffer to the ggtt for execution
  * All later gens can run the final buffer from the ppgtt
  */
-#define CMDPARSER_USES_GGTT(dev_priv) IS_GEN(dev_priv, 7)
+#define CMDPARSER_USES_GGTT(dev_priv) (GRAPHICS_VER(dev_priv) == 7)
 
 #define HAS_LLC(dev_priv)	(INTEL_INFO(dev_priv)->has_llc)
 #define HAS_SNOOP(dev_priv)	(INTEL_INFO(dev_priv)->has_snoop)
 #define HAS_EDRAM(dev_priv)	((dev_priv)->edram_size_mb)
-#define HAS_SECURE_BATCHES(dev_priv) (INTEL_GEN(dev_priv) < 6)
+#define HAS_SECURE_BATCHES(dev_priv) (GRAPHICS_VER(dev_priv) < 6)
 #define HAS_WT(dev_priv)	HAS_EDRAM(dev_priv)
 
 #define HWS_NEEDS_PHYSICAL(dev_priv)	(INTEL_INFO(dev_priv)->hws_needs_physical)
@@ -1612,7 +1612,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_BROKEN_CS_TLB(dev_priv)	(IS_I830(dev_priv) || IS_I845G(dev_priv))
 
 #define NEEDS_RC6_CTX_CORRUPTION_WA(dev_priv)	\
-	(IS_BROADWELL(dev_priv) || IS_GEN(dev_priv, 9))
+	(IS_BROADWELL(dev_priv) || GRAPHICS_VER(dev_priv) == 9)
 
 /* WaRsDisableCoarsePowerGating:skl,cnl */
 #define NEEDS_WaRsDisableCoarsePowerGating(dev_priv)			\
@@ -1620,23 +1620,22 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	 IS_SKL_GT3(dev_priv) ||					\
 	 IS_SKL_GT4(dev_priv))
 
-#define HAS_GMBUS_IRQ(dev_priv) (INTEL_GEN(dev_priv) >= 4)
-#define HAS_GMBUS_BURST_READ(dev_priv) (INTEL_GEN(dev_priv) >= 10 || \
+#define HAS_GMBUS_IRQ(dev_priv) (GRAPHICS_VER(dev_priv) >= 4)
+#define HAS_GMBUS_BURST_READ(dev_priv) (GRAPHICS_VER(dev_priv) >= 10 || \
 					IS_GEMINILAKE(dev_priv) || \
 					IS_KABYLAKE(dev_priv))
 
 /* With the 945 and later, Y tiling got adjusted so that it was 32 128-byte
  * rows, which changed the alignment requirements and fence programming.
  */
-#define HAS_128_BYTE_Y_TILING(dev_priv) (!IS_GEN(dev_priv, 2) && \
-					 !(IS_I915G(dev_priv) || \
-					 IS_I915GM(dev_priv)))
+#define HAS_128_BYTE_Y_TILING(dev_priv) (GRAPHICS_VER(dev_priv) != 2 && \
+					 !(IS_I915G(dev_priv) || IS_I915GM(dev_priv)))
 #define SUPPORTS_TV(dev_priv)		(INTEL_INFO(dev_priv)->display.supports_tv)
 #define I915_HAS_HOTPLUG(dev_priv)	(INTEL_INFO(dev_priv)->display.has_hotplug)
 
-#define HAS_FW_BLC(dev_priv) 	(INTEL_GEN(dev_priv) > 2)
+#define HAS_FW_BLC(dev_priv)	(GRAPHICS_VER(dev_priv) > 2)
 #define HAS_FBC(dev_priv)	(INTEL_INFO(dev_priv)->display.has_fbc)
-#define HAS_CUR_FBC(dev_priv)	(!HAS_GMCH(dev_priv) && INTEL_GEN(dev_priv) >= 7)
+#define HAS_CUR_FBC(dev_priv)	(!HAS_GMCH(dev_priv) && GRAPHICS_VER(dev_priv) >= 7)
 
 #define HAS_IPS(dev_priv)	(IS_HSW_ULT(dev_priv) || IS_BROADWELL(dev_priv))
 
@@ -1647,7 +1646,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_PSR(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_psr)
 #define HAS_PSR_HW_TRACKING(dev_priv) \
 	(INTEL_INFO(dev_priv)->display.has_psr_hw_tracking)
-#define HAS_PSR2_SEL_FETCH(dev_priv)	 (INTEL_GEN(dev_priv) >= 12)
+#define HAS_PSR2_SEL_FETCH(dev_priv)	 (GRAPHICS_VER(dev_priv) >= 12)
 #define HAS_TRANSCODER(dev_priv, trans)	 ((INTEL_INFO(dev_priv)->cpu_transcoder_mask & BIT(trans)) != 0)
 
 #define HAS_RC6(dev_priv)		 (INTEL_INFO(dev_priv)->has_rc6)
@@ -1658,7 +1657,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_DMC(dev_priv)	(INTEL_INFO(dev_priv)->display.has_dmc)
 
-#define HAS_MSO(i915)		(INTEL_GEN(i915) >= 12)
+#define HAS_MSO(i915)		(GRAPHICS_VER(i915) >= 12)
 
 #define HAS_RUNTIME_PM(dev_priv) (INTEL_INFO(dev_priv)->has_runtime_pm)
 #define HAS_64BIT_RELOC(dev_priv) (INTEL_INFO(dev_priv)->has_64bit_reloc)
@@ -1677,7 +1676,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
 
-#define HAS_LSPCON(dev_priv) (IS_GEN_RANGE(dev_priv, 9, 10))
+#define HAS_LSPCON(dev_priv) (IS_GRAPHICS_VER(dev_priv, 9, 10))
 
 /* DPF == dynamic parity feature */
 #define HAS_L3_DPF(dev_priv) (INTEL_INFO(dev_priv)->has_l3_dpf)
@@ -1691,7 +1690,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_DISPLAY(dev_priv) (INTEL_INFO(dev_priv)->pipe_mask != 0)
 
-#define HAS_VRR(i915)	(INTEL_GEN(i915) >= 12)
+#define HAS_VRR(i915)	(GRAPHICS_VER(i915) >= 12)
 
 /* Only valid when HAS_DISPLAY() is true */
 #define INTEL_DISPLAY_ENABLED(dev_priv) \
@@ -1718,7 +1717,7 @@ static inline bool intel_vtd_active(void)
 
 static inline bool intel_scanout_needs_vtd_wa(struct drm_i915_private *dev_priv)
 {
-	return INTEL_GEN(dev_priv) >= 6 && intel_vtd_active();
+	return GRAPHICS_VER(dev_priv) >= 6 && intel_vtd_active();
 }
 
 static inline bool
@@ -1940,7 +1939,7 @@ int remap_io_sg(struct vm_area_struct *vma,
 
 static inline int intel_hws_csb_write_index(struct drm_i915_private *i915)
 {
-	if (INTEL_GEN(i915) >= 10)
+	if (GRAPHICS_VER(i915) >= 10)
 		return CNL_HWS_CSB_WRITE_INDEX;
 	else
 		return I915_HWS_CSB_WRITE_INDEX;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 24307c49085f..eb13c601d680 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9908,7 +9908,7 @@ enum skl_power_gate {
 #define TRANS_HDCP_CONF(trans)		_MMIO_TRANS(trans, _TRANSA_HDCP_CONF, \
 						    _TRANSB_HDCP_CONF)
 #define HDCP_CONF(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_CONF(trans) : \
 					 PORT_HDCP_CONF(port))
 
@@ -9921,7 +9921,7 @@ enum skl_power_gate {
 						    _TRANSA_HDCP_ANINIT, \
 						    _TRANSB_HDCP_ANINIT)
 #define HDCP_ANINIT(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_ANINIT(trans) : \
 					 PORT_HDCP_ANINIT(port))
 
@@ -9931,7 +9931,7 @@ enum skl_power_gate {
 #define TRANS_HDCP_ANLO(trans)		_MMIO_TRANS(trans, _TRANSA_HDCP_ANLO, \
 						    _TRANSB_HDCP_ANLO)
 #define HDCP_ANLO(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_ANLO(trans) : \
 					 PORT_HDCP_ANLO(port))
 
@@ -9941,7 +9941,7 @@ enum skl_power_gate {
 #define TRANS_HDCP_ANHI(trans)		_MMIO_TRANS(trans, _TRANSA_HDCP_ANHI, \
 						    _TRANSB_HDCP_ANHI)
 #define HDCP_ANHI(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_ANHI(trans) : \
 					 PORT_HDCP_ANHI(port))
 
@@ -9952,7 +9952,7 @@ enum skl_power_gate {
 						    _TRANSA_HDCP_BKSVLO, \
 						    _TRANSB_HDCP_BKSVLO)
 #define HDCP_BKSVLO(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_BKSVLO(trans) : \
 					 PORT_HDCP_BKSVLO(port))
 
@@ -9963,7 +9963,7 @@ enum skl_power_gate {
 						    _TRANSA_HDCP_BKSVHI, \
 						    _TRANSB_HDCP_BKSVHI)
 #define HDCP_BKSVHI(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_BKSVHI(trans) : \
 					 PORT_HDCP_BKSVHI(port))
 
@@ -9974,7 +9974,7 @@ enum skl_power_gate {
 						    _TRANSA_HDCP_RPRIME, \
 						    _TRANSB_HDCP_RPRIME)
 #define HDCP_RPRIME(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_RPRIME(trans) : \
 					 PORT_HDCP_RPRIME(port))
 
@@ -9985,7 +9985,7 @@ enum skl_power_gate {
 						    _TRANSA_HDCP_STATUS, \
 						    _TRANSB_HDCP_STATUS)
 #define HDCP_STATUS(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP_STATUS(trans) : \
 					 PORT_HDCP_STATUS(port))
 
@@ -10026,7 +10026,7 @@ enum skl_power_gate {
 #define   AUTH_FORCE_CLR_INPUTCTR	BIT(19)
 #define   AUTH_CLR_KEYS			BIT(18)
 #define HDCP2_AUTH(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP2_AUTH(trans) : \
 					 PORT_HDCP2_AUTH(port))
 
@@ -10037,7 +10037,7 @@ enum skl_power_gate {
 						    _TRANSB_HDCP2_CTL)
 #define   CTL_LINK_ENCRYPTION_REQ	BIT(31)
 #define HDCP2_CTL(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP2_CTL(trans) : \
 					 PORT_HDCP2_CTL(port))
 
@@ -10051,7 +10051,7 @@ enum skl_power_gate {
 #define   LINK_AUTH_STATUS		BIT(21)
 #define   LINK_ENCRYPTION_STATUS	BIT(20)
 #define HDCP2_STATUS(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP2_STATUS(trans) : \
 					 PORT_HDCP2_STATUS(port))
 
@@ -10073,7 +10073,7 @@ enum skl_power_gate {
 #define   STREAM_ENCRYPTION_STATUS	BIT(31)
 #define   STREAM_TYPE_STATUS		BIT(30)
 #define HDCP2_STREAM_STATUS(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP2_STREAM_STATUS(trans) : \
 					 PIPE_HDCP2_STREAM_STATUS(pipe))
 
@@ -10089,7 +10089,7 @@ enum skl_power_gate {
 						    _TRANSB_HDCP2_AUTH_STREAM)
 #define   AUTH_STREAM_TYPE		BIT(31)
 #define HDCP2_AUTH_STREAM(dev_priv, trans, port) \
-					(INTEL_GEN(dev_priv) >= 12 ? \
+					(GRAPHICS_VER(dev_priv) >= 12 ? \
 					 TRANS_HDCP2_AUTH_STREAM(trans) : \
 					 PORT_HDCP2_AUTH_STREAM(port))
 
-- 
2.31.1

