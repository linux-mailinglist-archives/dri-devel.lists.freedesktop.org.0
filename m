Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A850A239E62
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 06:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB6389F2E;
	Mon,  3 Aug 2020 04:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2822789F2E;
 Mon,  3 Aug 2020 04:35:43 +0000 (UTC)
IronPort-SDR: W7RpvJEiPZ4xOuIZ2ou94u5PkrYOozh1UTug2+FtSNJIL4l4lQfuL6O9sF4TRgPuWfuFBjrIDm
 NCtNwAwk3bag==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139995514"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="139995514"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 21:35:42 -0700
IronPort-SDR: 4FkSChzdaNMTERxxqv/keqttQVsnSVypzHnhUYJ/fLe9uawuaIFzls8cp/Vm5jXAEtgI9BRu4c
 pe890OtfP+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="314529233"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2020 21:35:35 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 sameer.lattannavar@intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Subject: [PATCH v5 5/5] drm/i915: Enable scaling filter for plane and CRTC
Date: Mon,  3 Aug 2020 09:59:53 +0530
Message-Id: <20200803042953.7626-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEN >= 10 hardware supports the programmable scaler filter.

Attach scaling filter property for CRTC and plane for GEN >= 10
hardwares and program scaler filter based on the selected filter
type.

changes since v3:
* None
changes since v2:
* Use updated functions
* Add ps_ctrl var to contain the full PS_CTRL register value (Ville)
* Duplicate the scaling filter in crtc and plane hw state (Ville)
changes since v1:
* None
Changes since RFC:
* Enable properties for GEN >= 10 platforms (Ville)
* Do not round off the crtc co-ordinate (Danial Stone, Ville)
* Add new functions to handle scaling filter setup (Ville)
* Remove coefficient set 0 hardcoding.

Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c  |  1 +
 drivers/gpu/drm/i915/display/intel_display.c   | 18 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_display_types.h |  2 ++
 drivers/gpu/drm/i915/display/intel_sprite.c    | 15 +++++++++++++--
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 79032701873a..415d41b21915 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -262,6 +262,7 @@ void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 	plane_state->hw.rotation = from_plane_state->uapi.rotation;
 	plane_state->hw.color_encoding = from_plane_state->uapi.color_encoding;
 	plane_state->hw.color_range = from_plane_state->uapi.color_range;
+	plane_state->hw.scaling_filter = from_plane_state->uapi.scaling_filter;
 }
 
 void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 388999404e05..507932099b8d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6352,6 +6352,7 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 	int hscale, vscale;
 	unsigned long irqflags;
 	int id;
+	u32 ps_ctrl;
 
 	if (!crtc_state->pch_pfit.enabled)
 		return;
@@ -6368,10 +6369,16 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 
 	id = scaler_state->scaler_id;
 
+	ps_ctrl = skl_scaler_get_filter_select(crtc_state->hw.scaling_filter, 0);
+	ps_ctrl |=  PS_SCALER_EN | scaler_state->scalers[id].mode;
+
 	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 
-	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), PS_SCALER_EN |
-			  PS_FILTER_MEDIUM | scaler_state->scalers[id].mode);
+	skl_scaler_setup_filter(dev_priv, pipe, id, 0,
+				crtc_state->hw.scaling_filter);
+
+	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
+
 	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
 			  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_vphase));
 	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id),
@@ -13332,6 +13339,7 @@ intel_crtc_copy_uapi_to_hw_state(struct intel_crtc_state *crtc_state)
 	crtc_state->hw.active = crtc_state->uapi.active;
 	crtc_state->hw.mode = crtc_state->uapi.mode;
 	crtc_state->hw.adjusted_mode = crtc_state->uapi.adjusted_mode;
+	crtc_state->hw.scaling_filter = crtc_state->uapi.scaling_filter;
 	intel_crtc_copy_uapi_to_hw_state_nomodeset(crtc_state);
 }
 
@@ -13343,6 +13351,7 @@ static void intel_crtc_copy_hw_to_uapi_state(struct intel_crtc_state *crtc_state
 		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
 
 	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
+	crtc_state->uapi.scaling_filter = crtc_state->hw.scaling_filter;
 
 	/* copy color blobs to uapi */
 	drm_property_replace_blob(&crtc_state->uapi.degamma_lut,
@@ -16810,6 +16819,11 @@ static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 		dev_priv->plane_to_crtc_mapping[i9xx_plane] = crtc;
 	}
 
+	if (INTEL_GEN(dev_priv) >= 10)
+		drm_crtc_create_scaling_filter_property(&crtc->base,
+						BIT(DRM_SCALING_FILTER_DEFAULT) |
+						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
+
 	intel_color_init(crtc);
 
 	intel_crtc_crc_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f581260e8dbf..670ab317134b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -518,6 +518,7 @@ struct intel_plane_state {
 		unsigned int rotation;
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
+		enum drm_scaling_filter scaling_filter;
 	} hw;
 
 	struct i915_ggtt_view view;
@@ -808,6 +809,7 @@ struct intel_crtc_state {
 		bool active, enable;
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, adjusted_mode;
+		enum drm_scaling_filter scaling_filter;
 	} hw;
 
 	/**
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index c26ca029fc0a..8f1a6b6061af 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -429,6 +429,7 @@ skl_program_scaler(struct intel_plane *plane,
 	u16 y_hphase, uv_rgb_hphase;
 	u16 y_vphase, uv_rgb_vphase;
 	int hscale, vscale;
+	u32 ps_ctrl;
 
 	hscale = drm_rect_calc_hscale(&plane_state->uapi.src,
 				      &plane_state->uapi.dst,
@@ -455,8 +456,13 @@ skl_program_scaler(struct intel_plane *plane,
 		uv_rgb_vphase = skl_scaler_calc_phase(1, vscale, false);
 	}
 
-	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id),
-			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler->mode);
+	ps_ctrl = skl_scaler_get_filter_select(plane_state->hw.scaling_filter, 0);
+	ps_ctrl |= PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler->mode;
+
+	skl_scaler_setup_filter(dev_priv, pipe, scaler_id, 0,
+				plane_state->hw.scaling_filter);
+
+	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id), ps_ctrl);
 	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, scaler_id),
 			  PS_Y_PHASE(y_vphase) | PS_UV_RGB_PHASE(uv_rgb_vphase));
 	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, scaler_id),
@@ -3161,6 +3167,11 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	if (INTEL_GEN(dev_priv) >= 12)
 		drm_plane_enable_fb_damage_clips(&plane->base);
 
+	if (INTEL_GEN(dev_priv) >= 10)
+		drm_plane_create_scaling_filter_property(&plane->base,
+						BIT(DRM_SCALING_FILTER_DEFAULT) |
+						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
+
 	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
 
 	return plane;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
