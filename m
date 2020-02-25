Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638716C2FF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55FE6EACE;
	Tue, 25 Feb 2020 13:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B266EAD3;
 Tue, 25 Feb 2020 13:57:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153028"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:57:50 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [Intel-gfx][PATCH 03/10] drm/i915/display/ddi: Make MISSING_CASE
 backtrace i915 specific
Date: Tue, 25 Feb 2020 19:17:02 +0530
Message-Id: <20200225134709.6153-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_MISSING_CASE macro includes the device information in the
backtrace, so we know what device the warnings originate from.

Covert MISSING_CASE calls with i915 specific i915_MISSING_CASE variant
in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9f7d1d7189ae..e060c5e2fbb1 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -873,7 +873,7 @@ cnl_get_buf_trans_hdmi(struct drm_i915_private *dev_priv, int *n_entries)
 		return cnl_ddi_translations_hdmi_1_05V;
 	} else {
 		*n_entries = 1; /* shut up gcc */
-		MISSING_CASE(voltage);
+		i915_MISSING_CASE(dev_priv, voltage);
 	}
 	return NULL;
 }
@@ -894,7 +894,7 @@ cnl_get_buf_trans_dp(struct drm_i915_private *dev_priv, int *n_entries)
 		return cnl_ddi_translations_dp_1_05V;
 	} else {
 		*n_entries = 1; /* shut up gcc */
-		MISSING_CASE(voltage);
+		i915_MISSING_CASE(dev_priv, voltage);
 	}
 	return NULL;
 }
@@ -916,7 +916,7 @@ cnl_get_buf_trans_edp(struct drm_i915_private *dev_priv, int *n_entries)
 			return cnl_ddi_translations_edp_1_05V;
 		} else {
 			*n_entries = 1; /* shut up gcc */
-			MISSING_CASE(voltage);
+			i915_MISSING_CASE(dev_priv, voltage);
 		}
 		return NULL;
 	} else {
@@ -1360,7 +1360,7 @@ static int hsw_ddi_calc_wrpll_link(struct drm_i915_private *dev_priv,
 		refclk = 2700;
 		break;
 	default:
-		MISSING_CASE(wrpll);
+		i915_MISSING_CASE(dev_priv, wrpll);
 		return 0;
 	}
 
@@ -1500,7 +1500,7 @@ static int icl_calc_tbt_pll_link(struct drm_i915_private *dev_priv,
 	case DDI_CLK_SEL_TBT_810:
 		return 810000;
 	default:
-		MISSING_CASE(val);
+		i915_MISSING_CASE(dev_priv, val);
 		return 0;
 	}
 }
@@ -1553,7 +1553,7 @@ static int icl_calc_mg_pll_link(struct drm_i915_private *dev_priv,
 		div1 = 7;
 		break;
 	default:
-		MISSING_CASE(pll_state->mg_clktop2_hsclkctl);
+		i915_MISSING_CASE(dev_priv, pll_state->mg_clktop2_hsclkctl);
 		return 0;
 	}
 
@@ -1841,7 +1841,7 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 		temp |= DP_MSA_MISC_12_BPC;
 		break;
 	default:
-		MISSING_CASE(crtc_state->pipe_bpp);
+		i915_MISSING_CASE(dev_priv, crtc_state->pipe_bpp);
 		break;
 	}
 
@@ -2156,7 +2156,8 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 
 		switch (tmp & TRANS_DDI_EDP_INPUT_MASK) {
 		default:
-			MISSING_CASE(tmp & TRANS_DDI_EDP_INPUT_MASK);
+			i915_MISSING_CASE(dev_priv,
+					  tmp & TRANS_DDI_EDP_INPUT_MASK);
 			/* fallthrough */
 		case TRANS_DDI_EDP_INPUT_A_ON:
 		case TRANS_DDI_EDP_INPUT_A_ONOFF:
@@ -3334,7 +3335,7 @@ icl_program_mg_dp_mode(struct intel_digital_port *intel_dig_port,
 		}
 		break;
 	default:
-		MISSING_CASE(pin_assignment);
+		i915_MISSING_CASE(dev_priv, pin_assignment);
 	}
 
 	if (INTEL_GEN(dev_priv) >= 12) {
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
