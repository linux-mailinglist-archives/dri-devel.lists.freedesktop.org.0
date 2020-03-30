Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5ED1983B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596656E486;
	Mon, 30 Mar 2020 18:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC306E484;
 Mon, 30 Mar 2020 18:48:57 +0000 (UTC)
IronPort-SDR: /CJpTGDmV3l11sHgJUAt9clMI5414ypShR2qhvh4HZq1Jdr7cIX2ysdgzAYETKdz61dcv+5CLd
 XTlUEln3WoOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 11:48:57 -0700
IronPort-SDR: 1WNi0kaNe4En8cTseUoznskQIsijQQ53OzNJzhiQJ1b3SuyeaP+T8RiTdps91NxGSrG2885qUA
 BGpeAhrLVERQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="267013240"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2020 11:48:48 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Subject: [PATCH v3 5/5] drm/i915: Enable scaling filter for plane and CRTC
Date: Tue, 31 Mar 2020 00:08:57 +0530
Message-Id: <20200330183857.13270-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
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

GEN >= 10 hardware supports the programmable scaler filter.

Attach scaling filter property for CRTC and plane for GEN >= 10
hardwares and program scaler filter based on the selected filter
type.

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
 .../gpu/drm/i915/display/intel_atomic_plane.c   |  1 +
 drivers/gpu/drm/i915/display/intel_display.c    | 17 +++++++++++++++--
 .../gpu/drm/i915/display/intel_display_types.h  |  2 ++
 drivers/gpu/drm/i915/display/intel_sprite.c     | 15 +++++++++++++--
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 25dfeb3197aa..cfcc8df75656 100644
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
index 85c29a69519f..3fd52aebdc2e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6349,6 +6349,7 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 		int pfit_w, pfit_h, hscale, vscale;
 		unsigned long irqflags;
 		int id;
+		u32 ps_ctrl;
 
 		if (drm_WARN_ON(&dev_priv->drm,
 				crtc_state->scaler_state.scaler_id < 0))
@@ -6365,10 +6366,15 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 
 		id = scaler_state->scaler_id;
 
+		ps_ctrl = skl_scaler_get_filter_select(crtc_state->hw.scaling_filter, 0);
+		ps_ctrl |=  PS_SCALER_EN | scaler_state->scalers[id].mode;
+
 		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 
-		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), PS_SCALER_EN |
-				  PS_FILTER_MEDIUM | scaler_state->scalers[id].mode);
+		skl_scaler_setup_filter(dev_priv, pipe, id, 0,
+					crtc_state->hw.scaling_filter);
+
+		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
 		intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
 				  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_vphase));
 		intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id),
@@ -13318,6 +13324,7 @@ intel_crtc_copy_uapi_to_hw_state(struct intel_crtc_state *crtc_state)
 	crtc_state->hw.active = crtc_state->uapi.active;
 	crtc_state->hw.mode = crtc_state->uapi.mode;
 	crtc_state->hw.adjusted_mode = crtc_state->uapi.adjusted_mode;
+	crtc_state->hw.scaling_filter = crtc_state->uapi.scaling_filter;
 	intel_crtc_copy_uapi_to_hw_state_nomodeset(crtc_state);
 }
 
@@ -13328,6 +13335,7 @@ static void intel_crtc_copy_hw_to_uapi_state(struct intel_crtc_state *crtc_state
 	WARN_ON(drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
 
 	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
+	crtc_state->uapi.scaling_filter = crtc_state->hw.scaling_filter;
 
 	/* copy color blobs to uapi */
 	drm_property_replace_blob(&crtc_state->uapi.degamma_lut,
@@ -16802,6 +16810,11 @@ static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
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
index 7de4249f2292..8b1edd34fbd8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -522,6 +522,7 @@ struct intel_plane_state {
 		unsigned int rotation;
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
+		enum drm_scaling_filter scaling_filter;
 	} hw;
 
 	struct i915_ggtt_view view;
@@ -801,6 +802,7 @@ struct intel_crtc_state {
 		bool active, enable;
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, adjusted_mode;
+		enum drm_scaling_filter scaling_filter;
 	} hw;
 
 	/**
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index deda351719db..c589d5953cd5 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -413,6 +413,7 @@ skl_program_scaler(struct intel_plane *plane,
 	u16 y_hphase, uv_rgb_hphase;
 	u16 y_vphase, uv_rgb_vphase;
 	int hscale, vscale;
+	u32 ps_ctrl;
 
 	hscale = drm_rect_calc_hscale(&plane_state->uapi.src,
 				      &plane_state->uapi.dst,
@@ -439,8 +440,13 @@ skl_program_scaler(struct intel_plane *plane,
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
@@ -3121,6 +3127,11 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 
 	drm_plane_create_zpos_immutable_property(&plane->base, plane_id);
 
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
