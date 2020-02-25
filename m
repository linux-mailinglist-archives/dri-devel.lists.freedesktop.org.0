Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7F16C2FC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DF16EAC8;
	Tue, 25 Feb 2020 13:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247376EAC9;
 Tue, 25 Feb 2020 13:57:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153014"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:57:44 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [Intel-gfx][PATCH 02/10] drm/i915/display/cdclk: Make MISSING_CASE
 backtrace i915 specific
Date: Tue, 25 Feb 2020 19:17:01 +0530
Message-Id: <20200225134709.6153-3-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/display/intel_cdclk.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 0741d643455b..50d7415d0c4c 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -545,7 +545,7 @@ static void vlv_set_cdclk(struct drm_i915_private *dev_priv,
 	case 200000:
 		break;
 	default:
-		MISSING_CASE(cdclk);
+		i915_MISSING_CASE(dev_priv, cdclk);
 		return;
 	}
 
@@ -633,7 +633,7 @@ static void chv_set_cdclk(struct drm_i915_private *dev_priv,
 	case 200000:
 		break;
 	default:
-		MISSING_CASE(cdclk);
+		i915_MISSING_CASE(dev_priv, cdclk);
 		return;
 	}
 
@@ -762,7 +762,7 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 
 	switch (cdclk) {
 	default:
-		MISSING_CASE(cdclk);
+		i915_MISSING_CASE(dev_priv, cdclk);
 		/* fall through */
 	case 337500:
 		val |= LCPLL_CLK_FREQ_337_5_BDW;
@@ -868,7 +868,8 @@ static void skl_dpll0_update(struct drm_i915_private *dev_priv,
 		cdclk_config->vco = 8640000;
 		break;
 	default:
-		MISSING_CASE(val & DPLL_CTRL1_LINK_RATE_MASK(SKL_DPLL0));
+		i915_MISSING_CASE(dev_priv,
+				  val & DPLL_CTRL1_LINK_RATE_MASK(SKL_DPLL0));
 		break;
 	}
 }
@@ -902,7 +903,8 @@ static void skl_get_cdclk(struct drm_i915_private *dev_priv,
 			cdclk_config->cdclk = 617143;
 			break;
 		default:
-			MISSING_CASE(cdctl & CDCLK_FREQ_SEL_MASK);
+			i915_MISSING_CASE(dev_priv,
+					  cdctl & CDCLK_FREQ_SEL_MASK);
 			break;
 		}
 	} else {
@@ -920,7 +922,8 @@ static void skl_get_cdclk(struct drm_i915_private *dev_priv,
 			cdclk_config->cdclk = 675000;
 			break;
 		default:
-			MISSING_CASE(cdctl & CDCLK_FREQ_SEL_MASK);
+			i915_MISSING_CASE(dev_priv,
+					  cdctl & CDCLK_FREQ_SEL_MASK);
 			break;
 		}
 	}
@@ -1329,7 +1332,7 @@ static void icl_readout_refclk(struct drm_i915_private *dev_priv,
 
 	switch (dssm) {
 	default:
-		MISSING_CASE(dssm);
+		i915_MISSING_CASE(dev_priv, dssm);
 		/* fall through */
 	case ICL_DSSM_CDCLK_PLL_REFCLK_24MHz:
 		cdclk_config->ref = 24000;
@@ -1419,7 +1422,7 @@ static void bxt_get_cdclk(struct drm_i915_private *dev_priv,
 		div = 8;
 		break;
 	default:
-		MISSING_CASE(divider);
+		i915_MISSING_CASE(dev_priv, divider);
 		return;
 	}
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
