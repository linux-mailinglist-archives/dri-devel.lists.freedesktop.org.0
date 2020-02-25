Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B961316C306
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E636EAD4;
	Tue, 25 Feb 2020 13:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995A76EAD2;
 Tue, 25 Feb 2020 13:58:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153087"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:58:09 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [Intel-gfx][PATCH 06/10] drm/i915/display/hdmi: Make MISSING_CASE
 backtrace i915 specific
Date: Tue, 25 Feb 2020 19:17:05 +0530
Message-Id: <20200225134709.6153-7-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/display/intel_hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index bdbb5ce3fa81..59148134a97b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -188,7 +188,7 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
 	case HDMI_INFOFRAME_TYPE_DRM:
 		return GLK_TVIDEO_DIP_DRM_DATA(cpu_transcoder, i);
 	default:
-		MISSING_CASE(type);
+		i915_MISSING_CASE(dev_priv, type);
 		return INVALID_MMIO_REG;
 	}
 }
@@ -2952,7 +2952,7 @@ static u8 chv_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 		ddc_pin = GMBUS_PIN_DPD_CHV;
 		break;
 	default:
-		MISSING_CASE(port);
+		i915_MISSING_CASE(dev_priv, port);
 		ddc_pin = GMBUS_PIN_DPB;
 		break;
 	}
@@ -2971,7 +2971,7 @@ static u8 bxt_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 		ddc_pin = GMBUS_PIN_2_BXT;
 		break;
 	default:
-		MISSING_CASE(port);
+		i915_MISSING_CASE(dev_priv, port);
 		ddc_pin = GMBUS_PIN_1_BXT;
 		break;
 	}
@@ -2997,7 +2997,7 @@ static u8 cnp_port_to_ddc_pin(struct drm_i915_private *dev_priv,
 		ddc_pin = GMBUS_PIN_3_BXT;
 		break;
 	default:
-		MISSING_CASE(port);
+		i915_MISSING_CASE(dev_priv, port);
 		ddc_pin = GMBUS_PIN_1_BXT;
 		break;
 	}
@@ -3033,7 +3033,7 @@ static u8 mcc_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 		ddc_pin = GMBUS_PIN_9_TC1_ICP;
 		break;
 	default:
-		MISSING_CASE(phy);
+		i915_MISSING_CASE(dev_priv, phy);
 		ddc_pin = GMBUS_PIN_1_BXT;
 		break;
 	}
@@ -3056,7 +3056,7 @@ static u8 g4x_port_to_ddc_pin(struct drm_i915_private *dev_priv,
 		ddc_pin = GMBUS_PIN_DPD;
 		break;
 	default:
-		MISSING_CASE(port);
+		i915_MISSING_CASE(dev_priv, port);
 		ddc_pin = GMBUS_PIN_DPB;
 		break;
 	}
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
