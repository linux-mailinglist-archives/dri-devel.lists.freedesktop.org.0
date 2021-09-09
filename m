Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6084A4053A4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9286E863;
	Thu,  9 Sep 2021 12:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AC76E861;
 Thu,  9 Sep 2021 12:52:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="306348406"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="306348406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="694103693"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 05/13] drm/i915/dg2: add DG2+ TRANS_DDI_FUNC_CTL DP 2.0
 128b/132b mode
Date: Thu,  9 Sep 2021 15:51:57 +0300
Message-Id: <260e4da302d47ae50122eb8d517be6ac3ccb15f2.1631191763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631191763.git.jani.nikula@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Unfortunately, the DP 2.0 128b/132b DDI mode selection in the register
conflicts with FDI. Since we have to deal with both meanings in the same
code, for different platforms, clarify the macro name so we don't
forget.

Bspec: 50493
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 6 +++---
 drivers/gpu/drm/i915/i915_reg.h          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 23ef291f7b30..2361f48537b5 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -489,7 +489,7 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 		if (crtc_state->hdmi_high_tmds_clock_ratio)
 			temp |= TRANS_DDI_HIGH_TMDS_CHAR_RATE;
 	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_ANALOG)) {
-		temp |= TRANS_DDI_MODE_SELECT_FDI;
+		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
 		temp |= (crtc_state->fdi_lanes - 1) << 1;
 	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
 		temp |= TRANS_DDI_MODE_SELECT_DP_MST;
@@ -679,7 +679,7 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
 		ret = false;
 		break;
 
-	case TRANS_DDI_MODE_SELECT_FDI:
+	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
 		ret = type == DRM_MODE_CONNECTOR_VGA;
 		break;
 
@@ -3558,7 +3558,7 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		pipe_config->output_types |= BIT(INTEL_OUTPUT_HDMI);
 		pipe_config->lane_count = 4;
 		break;
-	case TRANS_DDI_MODE_SELECT_FDI:
+	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
 		pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
 		break;
 	case TRANS_DDI_MODE_SELECT_DP_SST:
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c2853cc005ee..03a94389c514 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -10202,7 +10202,7 @@ enum skl_power_gate {
 #define  TRANS_DDI_MODE_SELECT_DVI	(1 << 24)
 #define  TRANS_DDI_MODE_SELECT_DP_SST	(2 << 24)
 #define  TRANS_DDI_MODE_SELECT_DP_MST	(3 << 24)
-#define  TRANS_DDI_MODE_SELECT_FDI	(4 << 24)
+#define  TRANS_DDI_MODE_SELECT_FDI_OR_128B132B	(4 << 24)
 #define  TRANS_DDI_BPC_MASK		(7 << 20)
 #define  TRANS_DDI_BPC_8		(0 << 20)
 #define  TRANS_DDI_BPC_10		(1 << 20)
-- 
2.30.2

