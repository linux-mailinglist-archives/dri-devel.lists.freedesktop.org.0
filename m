Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEA16C304
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD916EAD1;
	Tue, 25 Feb 2020 13:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D586EACC;
 Tue, 25 Feb 2020 13:58:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153072"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:58:03 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>, Imre Deak <imre.deak@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [Intel-gfx][PATCH 05/10] drm/i915/dp: Make MISSING_CASE backtrace
 i915 specific
Date: Tue, 25 Feb 2020 19:17:04 +0530
Message-Id: <20200225134709.6153-6-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a5a9197f8f5..68e4faf5ff96 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1619,7 +1619,7 @@ static i915_reg_t g4x_aux_ctl_reg(struct intel_dp *intel_dp)
 	case AUX_CH_D:
 		return DP_AUX_CH_CTL(aux_ch);
 	default:
-		MISSING_CASE(aux_ch);
+		i915_MISSING_CASE(dev_priv, aux_ch);
 		return DP_AUX_CH_CTL(AUX_CH_B);
 	}
 }
@@ -1636,7 +1636,7 @@ static i915_reg_t g4x_aux_data_reg(struct intel_dp *intel_dp, int index)
 	case AUX_CH_D:
 		return DP_AUX_CH_DATA(aux_ch, index);
 	default:
-		MISSING_CASE(aux_ch);
+		i915_MISSING_CASE(dev_priv, aux_ch);
 		return DP_AUX_CH_DATA(AUX_CH_B, index);
 	}
 }
@@ -1655,7 +1655,7 @@ static i915_reg_t ilk_aux_ctl_reg(struct intel_dp *intel_dp)
 	case AUX_CH_D:
 		return PCH_DP_AUX_CH_CTL(aux_ch);
 	default:
-		MISSING_CASE(aux_ch);
+		i915_MISSING_CASE(dev_priv, aux_ch);
 		return DP_AUX_CH_CTL(AUX_CH_A);
 	}
 }
@@ -1674,7 +1674,7 @@ static i915_reg_t ilk_aux_data_reg(struct intel_dp *intel_dp, int index)
 	case AUX_CH_D:
 		return PCH_DP_AUX_CH_DATA(aux_ch, index);
 	default:
-		MISSING_CASE(aux_ch);
+		i915_MISSING_CASE(dev_priv, aux_ch);
 		return DP_AUX_CH_DATA(AUX_CH_A, index);
 	}
 }
@@ -1695,7 +1695,7 @@ static i915_reg_t skl_aux_ctl_reg(struct intel_dp *intel_dp)
 	case AUX_CH_G:
 		return DP_AUX_CH_CTL(aux_ch);
 	default:
-		MISSING_CASE(aux_ch);
+		i915_MISSING_CASE(dev_priv, aux_ch);
 		return DP_AUX_CH_CTL(AUX_CH_A);
 	}
 }
@@ -1716,7 +1716,7 @@ static i915_reg_t skl_aux_data_reg(struct intel_dp *intel_dp, int index)
 	case AUX_CH_G:
 		return DP_AUX_CH_DATA(aux_ch, index);
 	default:
-		MISSING_CASE(aux_ch);
+		i915_MISSING_CASE(dev_priv, aux_ch);
 		return DP_AUX_CH_DATA(AUX_CH_A, index);
 	}
 }
@@ -5417,7 +5417,7 @@ static bool ibx_digital_port_connected(struct intel_encoder *encoder)
 		bit = SDE_PORTD_HOTPLUG;
 		break;
 	default:
-		MISSING_CASE(encoder->hpd_pin);
+		i915_MISSING_CASE(dev_priv, encoder->hpd_pin);
 		return false;
 	}
 
@@ -5440,7 +5440,7 @@ static bool cpt_digital_port_connected(struct intel_encoder *encoder)
 		bit = SDE_PORTD_HOTPLUG_CPT;
 		break;
 	default:
-		MISSING_CASE(encoder->hpd_pin);
+		i915_MISSING_CASE(dev_priv, encoder->hpd_pin);
 		return false;
 	}
 
@@ -5482,7 +5482,7 @@ static bool g4x_digital_port_connected(struct intel_encoder *encoder)
 		bit = PORTD_HOTPLUG_LIVE_STATUS_G4X;
 		break;
 	default:
-		MISSING_CASE(encoder->hpd_pin);
+		i915_MISSING_CASE(dev_priv, encoder->hpd_pin);
 		return false;
 	}
 
@@ -5505,7 +5505,7 @@ static bool gm45_digital_port_connected(struct intel_encoder *encoder)
 		bit = PORTD_HOTPLUG_LIVE_STATUS_GM45;
 		break;
 	default:
-		MISSING_CASE(encoder->hpd_pin);
+		i915_MISSING_CASE(dev_priv, encoder->hpd_pin);
 		return false;
 	}
 
@@ -5568,7 +5568,7 @@ static bool bxt_digital_port_connected(struct intel_encoder *encoder)
 		bit = BXT_DE_PORT_HP_DDIC;
 		break;
 	default:
-		MISSING_CASE(encoder->hpd_pin);
+		i915_MISSING_CASE(dev_priv, encoder->hpd_pin);
 		return false;
 	}
 
@@ -5595,7 +5595,7 @@ static bool icp_digital_port_connected(struct intel_encoder *encoder)
 	else if (intel_phy_is_tc(dev_priv, phy))
 		return intel_tc_port_connected(dig_port);
 	else
-		MISSING_CASE(encoder->hpd_pin);
+		i915_MISSING_CASE(dev_priv, encoder->hpd_pin);
 
 	return false;
 }
@@ -5637,7 +5637,7 @@ static bool __intel_digital_port_connected(struct intel_encoder *encoder)
 	else if (IS_GEN(dev_priv, 5))
 		return ilk_digital_port_connected(encoder);
 
-	MISSING_CASE(INTEL_GEN(dev_priv));
+	i915_MISSING_CASE(dev_priv, INTEL_GEN(dev_priv));
 	return false;
 }
 
@@ -7090,7 +7090,7 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 			port_sel = PANEL_PORT_SELECT_DPD;
 			break;
 		default:
-			MISSING_CASE(port);
+			i915_MISSING_CASE(dev_priv, port);
 			break;
 		}
 	}
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
