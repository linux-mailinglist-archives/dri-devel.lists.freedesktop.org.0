Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B734053B1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073C36E87A;
	Thu,  9 Sep 2021 12:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463C6E879;
 Thu,  9 Sep 2021 12:53:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200979668"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="200979668"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:53:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="466479214"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:53:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 11/13] drm/i915/dg2: use 128b/132b transcoder DDI mode
Date: Thu,  9 Sep 2021 15:52:03 +0300
Message-Id: <279bfbd979e0256fae13a5231e07e2f4fb665c07.1631191763.git.jani.nikula@intel.com>
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

128b/132b has a separate transcoder DDI mode, which also requires the
MST transport select to be set. Note that we'll use DP MST also for
single-stream 128b/132b.

Having the FDI and 128b/132b modes share the register mode value
complicates things a bit.

v2:
- Use HAS_DP20 abstraction for 128b/132b mode (Ville)
- Use intel_dp_is_uhbr() helper

Bspec: 50493
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 27 ++++++++++++++++++------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a7b7e4fafcb3..d2b96b2efdfe 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -506,7 +506,10 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
 		temp |= (crtc_state->fdi_lanes - 1) << 1;
 	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
-		temp |= TRANS_DDI_MODE_SELECT_DP_MST;
+		if (intel_dp_is_uhbr(crtc_state))
+			temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
+		else
+			temp |= TRANS_DDI_MODE_SELECT_DP_MST;
 		temp |= DDI_PORT_WIDTH(crtc_state->lane_count);
 
 		if (DISPLAY_VER(dev_priv) >= 12) {
@@ -694,7 +697,12 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
 		break;
 
 	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
-		ret = type == DRM_MODE_CONNECTOR_VGA;
+		if (HAS_DP20(dev_priv))
+			/* 128b/132b */
+			ret = false;
+		else
+			/* FDI */
+			ret = type == DRM_MODE_CONNECTOR_VGA;
 		break;
 
 	default:
@@ -781,8 +789,9 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 		if ((tmp & port_mask) != ddi_select)
 			continue;
 
-		if ((tmp & TRANS_DDI_MODE_SELECT_MASK) ==
-		    TRANS_DDI_MODE_SELECT_DP_MST)
+		if ((tmp & TRANS_DDI_MODE_SELECT_MASK) == TRANS_DDI_MODE_SELECT_DP_MST ||
+		    (HAS_DP20(dev_priv) &&
+		     (tmp & TRANS_DDI_MODE_SELECT_MASK) == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B))
 			mst_pipe_mask |= BIT(p);
 
 		*pipe_mask |= BIT(p);
@@ -3573,9 +3582,6 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		pipe_config->output_types |= BIT(INTEL_OUTPUT_HDMI);
 		pipe_config->lane_count = 4;
 		break;
-	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
-		pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
-		break;
 	case TRANS_DDI_MODE_SELECT_DP_SST:
 		if (encoder->type == INTEL_OUTPUT_EDP)
 			pipe_config->output_types |= BIT(INTEL_OUTPUT_EDP);
@@ -3604,6 +3610,13 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 			pipe_config->infoframes.enable |=
 				intel_hdmi_infoframes_enabled(encoder, pipe_config);
 		break;
+	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
+		if (!HAS_DP20(dev_priv)) {
+			/* FDI */
+			pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
+			break;
+		}
+		fallthrough; /* 128b/132b */
 	case TRANS_DDI_MODE_SELECT_DP_MST:
 		pipe_config->output_types |= BIT(INTEL_OUTPUT_DP_MST);
 		pipe_config->lane_count =
-- 
2.30.2

