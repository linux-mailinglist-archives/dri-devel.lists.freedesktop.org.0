Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B204C523D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 00:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BADE10E22E;
	Fri, 25 Feb 2022 23:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D9710E223;
 Fri, 25 Feb 2022 23:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645832733; x=1677368733;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=033VUkExGcu/EunBfprwDO/BGudC5y7X1UBTW4Db7Sg=;
 b=CThNaU88EfqLoAHlJ/hCacS2UBQpbEu0nzQRLVklqRYgbq8Pc1JJwIvI
 Lu5TWdc1OD1fmrxh5nutAnn/xcrJBlWK21IKBlCdkxXO1DTjYr3iM0Hmc
 CzMOLNOA5OgYxachDzyNJlZwptBOjuoKScGmpP08b9HFEZuVz/P3RauuZ
 EryyEzNuxlhaIZV7xdJoOMes9Nc7yYZQa/ZK3uGxr/U49Af5/FsSq9WWa
 WEF/RkSlwj1ENi9TPtc9kqXlOs4tmGVvsSPLm+dk9DYlhNc7eqqYanwfL
 ygRuop0xbR035aeG5qwppwE0px86qRcatXwz/t25h2qsm+ngQSUbQEDmr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313322600"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313322600"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 15:45:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="544202765"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 15:45:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 2/4] drm/i915: Use str_enable_disable()
Date: Fri, 25 Feb 2022 15:46:29 -0800
Message-Id: <20220225234631.3725943-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225234631.3725943-1-lucas.demarchi@intel.com>
References: <20220225234631.3725943-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the local enabledisable() implementation and adopt the
str_enable_disable() from linux/string_helpers.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c           | 4 +++-
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 +++-
 drivers/gpu/drm/i915/display/intel_dp.c            | 8 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          | 3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          | 4 +++-
 drivers/gpu/drm/i915/i915_utils.h                  | 5 -----
 6 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 1cd394b0585e..3e6d86a54850 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -25,6 +25,8 @@
  *
  */
 
+#include <linux/string_helpers.h>
+
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_scdc_helper.h>
 
@@ -2152,7 +2154,7 @@ static void intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
 			       enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0) <= 0)
 		drm_dbg_kms(&i915->drm,
 			    "Failed to %s MSA_TIMING_PAR_IGNORE in the sink\n",
-			    enabledisable(enable));
+			    str_enable_disable(enable));
 }
 
 static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 9ebae7ac3235..496c0b94ee57 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/string_helpers.h>
+
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "intel_cdclk.h"
@@ -5303,7 +5305,7 @@ static void gen9_dbuf_slice_set(struct drm_i915_private *dev_priv,
 	state = intel_de_read(dev_priv, reg) & DBUF_POWER_STATE;
 	drm_WARN(&dev_priv->drm, enable != state,
 		 "DBuf slice %d power %s timeout!\n",
-		 slice, enabledisable(enable));
+		 slice, str_enable_disable(enable));
 }
 
 void gen9_dbuf_slices_update(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6ffa5b28b976..d6ef33096bb6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1977,7 +1977,7 @@ void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
 	if (ret < 0)
 		drm_dbg_kms(&i915->drm,
 			    "Failed to %s sink decompression state\n",
-			    enabledisable(enable));
+			    str_enable_disable(enable));
 }
 
 static void
@@ -2453,7 +2453,7 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 	if (drm_dp_dpcd_writeb(&intel_dp->aux,
 			       DP_PROTOCOL_CONVERTER_CONTROL_0, tmp) != 1)
 		drm_dbg_kms(&i915->drm, "Failed to %s protocol converter HDMI mode\n",
-			    enabledisable(intel_dp->has_hdmi_sink));
+			    str_enable_disable(intel_dp->has_hdmi_sink));
 
 	tmp = crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR444 &&
 		intel_dp->dfp.ycbcr_444_to_420 ? DP_CONVERSION_TO_YCBCR420_ENABLE : 0;
@@ -2462,7 +2462,7 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 			       DP_PROTOCOL_CONVERTER_CONTROL_1, tmp) != 1)
 		drm_dbg_kms(&i915->drm,
 			    "Failed to %s protocol converter YCbCr 4:2:0 conversion mode\n",
-			    enabledisable(intel_dp->dfp.ycbcr_444_to_420));
+			    str_enable_disable(intel_dp->dfp.ycbcr_444_to_420));
 
 	tmp = 0;
 	if (intel_dp->dfp.rgb_to_ycbcr) {
@@ -2500,7 +2500,7 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 	if (drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp) < 0)
 		drm_dbg_kms(&i915->drm,
 			   "Failed to %s protocol converter RGB->YCbCr conversion mode\n",
-			   enabledisable(tmp));
+			   str_enable_disable(tmp));
 }
 
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 2f7fc87a78e1..ba5c46f61d14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -6,6 +6,7 @@
 #include <linux/circ_buf.h>
 #include <linux/ktime.h>
 #include <linux/time64.h>
+#include <linux/string_helpers.h>
 #include <linux/timekeeping.h>
 
 #include "i915_drv.h"
@@ -170,7 +171,7 @@ static int ct_control_enable(struct intel_guc_ct *ct, bool enable)
 				     GUC_CTB_CONTROL_ENABLE : GUC_CTB_CONTROL_DISABLE);
 	if (unlikely(err))
 		CT_PROBE_ERROR(ct, "Failed to control/%s CTB (%pe)\n",
-			       enabledisable(enable), ERR_PTR(err));
+			       str_enable_disable(enable), ERR_PTR(err));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index fc805d466d99..f8fc90ea71e7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <linux/string_helpers.h>
+
 #include "intel_guc_rc.h"
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
@@ -59,7 +61,7 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
 	ret = guc_action_control_gucrc(guc, enable);
 	if (ret) {
 		drm_err(drm, "Failed to %s GuC RC (%pe)\n",
-			enabledisable(enable), ERR_PTR(ret));
+			str_enable_disable(enable), ERR_PTR(ret));
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index c62b64012369..06aac2be49ee 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -404,11 +404,6 @@ static inline const char *onoff(bool v)
 	return v ? "on" : "off";
 }
 
-static inline const char *enabledisable(bool v)
-{
-	return v ? "enable" : "disable";
-}
-
 static inline const char *enableddisabled(bool v)
 {
 	return v ? "enabled" : "disabled";
-- 
2.35.1

