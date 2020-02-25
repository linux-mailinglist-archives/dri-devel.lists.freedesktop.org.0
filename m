Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75816C301
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6B96EACF;
	Tue, 25 Feb 2020 13:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554636EACA;
 Tue, 25 Feb 2020 13:58:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153056"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:57:57 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [Intel-gfx][PATCH 04/10] drm/i915/display/display: Make MISSING_CASE
 backtrace i915 specific
Date: Tue, 25 Feb 2020 19:17:03 +0530
Message-Id: <20200225134709.6153-5-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c | 29 ++++++++++----------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3031e64ee518..b532e62128e8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1229,7 +1229,7 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 			intel_dp_port_enabled(dev_priv, PCH_DP_D, PORT_D, &panel_pipe);
 			break;
 		default:
-			MISSING_CASE(port_sel);
+			i915_MISSING_CASE(dev_priv, port_sel);
 			break;
 		}
 	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
@@ -2051,12 +2051,12 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 		case 16:
 			return 256;
 		default:
-			MISSING_CASE(cpp);
+			i915_MISSING_CASE(dev_priv, cpp);
 			return cpp;
 		}
 		break;
 	default:
-		MISSING_CASE(fb->modifier);
+		i915_MISSING_CASE(dev_priv, fb->modifier);
 		return cpp;
 	}
 }
@@ -2194,7 +2194,7 @@ static unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
 	default:
-		MISSING_CASE(fb->modifier);
+		i915_MISSING_CASE(dev_priv, fb->modifier);
 		return 0;
 	}
 }
@@ -3433,7 +3433,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 			plane_config->tiling;
 		break;
 	default:
-		MISSING_CASE(plane_config->tiling);
+		i915_MISSING_CASE(i915, plane_config->tiling);
 		goto err_obj;
 	}
 
@@ -4225,7 +4225,7 @@ static u32 i9xx_plane_ctl(const struct intel_crtc_state *crtc_state,
 		dspcntr |= DISPPLANE_RGBX161616;
 		break;
 	default:
-		MISSING_CASE(fb->format->format);
+		i915_MISSING_CASE(dev_priv, fb->format->format);
 		return 0;
 	}
 
@@ -7307,7 +7307,7 @@ intel_aux_power_domain(struct intel_digital_port *dig_port)
 		case AUX_CH_G:
 			return POWER_DOMAIN_AUX_G_TBT;
 		default:
-			MISSING_CASE(dig_port->aux_ch);
+			i915_MISSING_CASE(dev_priv, dig_port->aux_ch);
 			return POWER_DOMAIN_AUX_C_TBT;
 		}
 	}
@@ -7328,7 +7328,7 @@ intel_aux_power_domain(struct intel_digital_port *dig_port)
 	case AUX_CH_G:
 		return POWER_DOMAIN_AUX_G;
 	default:
-		MISSING_CASE(dig_port->aux_ch);
+		i915_MISSING_CASE(dev_priv, dig_port->aux_ch);
 		return POWER_DOMAIN_AUX_A;
 	}
 }
@@ -10109,7 +10109,7 @@ static void bdw_set_pipemisc(const struct intel_crtc_state *crtc_state)
 		val |= PIPEMISC_DITHER_12_BPC;
 		break;
 	default:
-		MISSING_CASE(crtc_state->pipe_bpp);
+		i915_MISSING_CASE(dev_priv, crtc_state->pipe_bpp);
 		break;
 	}
 
@@ -10149,7 +10149,7 @@ int bdw_get_pipemisc_bpp(struct intel_crtc *crtc)
 	case PIPEMISC_DITHER_12_BPC:
 		return 36;
 	default:
-		MISSING_CASE(tmp);
+		i915_MISSING_CASE(dev_priv, tmp);
 		return 0;
 	}
 }
@@ -10519,7 +10519,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 			fb->modifier = I915_FORMAT_MOD_Yf_TILED;
 		break;
 	default:
-		MISSING_CASE(tiling);
+		i915_MISSING_CASE(dev_priv, tiling);
 		goto error;
 	}
 
@@ -10861,7 +10861,7 @@ static void hsw_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 		id = DPLL_ID_LCPLL_2700;
 		break;
 	default:
-		MISSING_CASE(ddi_pll_sel);
+		i915_MISSING_CASE(dev_priv, ddi_pll_sel);
 		/* fall through */
 	case PORT_CLK_SEL_NONE:
 		return;
@@ -11622,7 +11622,8 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
 		cntl |= MCURSOR_MODE_256_ARGB_AX;
 		break;
 	default:
-		MISSING_CASE(drm_rect_width(&plane_state->uapi.dst));
+		i915_MISSING_CASE(dev_priv,
+				  drm_rect_width(&plane_state->uapi.dst));
 		return 0;
 	}
 
@@ -12601,7 +12602,7 @@ static int icl_check_nv12_planes(struct intel_crtc_state *crtc_state)
 			else if (linked->id == PLANE_SPRITE4)
 				plane_state->cus_ctl |= PLANE_CUS_PLANE_6;
 			else
-				MISSING_CASE(linked->id);
+				i915_MISSING_CASE(dev_priv, linked->id);
 		}
 	}
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
