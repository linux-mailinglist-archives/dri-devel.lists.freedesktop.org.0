Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF7818B178
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6626E9ED;
	Thu, 19 Mar 2020 10:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E966E9EB;
 Thu, 19 Mar 2020 10:31:22 +0000 (UTC)
IronPort-SDR: Dk+KQPi2u6T/SACnIaliriMpBYJTQBb0AwfUkBv7mpAzmN6tApN/UtVxXWvoz4NHsVT/rB926+
 fxBtFlHMEXGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 03:31:21 -0700
IronPort-SDR: 2yAgaLiSalpvvuCVrGpew6siNmtzlE5IqF5XykfZlWaW0dWmXrZTn2DEE8PM1bW2PuMZElqFKw
 KFxFk/aK2q7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="263687200"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga002.jf.intel.com with ESMTP; 19 Mar 2020 03:31:15 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: sameer.lattannavar@intel.com, jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 5/5] drm/i915: Enable scaling filter for plane and CRTC
Date: Thu, 19 Mar 2020 15:51:03 +0530
Message-Id: <20200319102103.28895-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c | 32 ++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_sprite.c  | 31 ++++++++++++++++++-
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 791dd908aa89..4b3387ee332e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6309,6 +6309,25 @@ void skl_scaler_setup_nearest_neighbor_filter(struct drm_i915_private *dev_priv,
 	}
 }
 
+static u32
+skl_scaler_crtc_setup_filter(struct drm_i915_private *dev_priv, enum pipe pipe,
+			  int id, int set, enum drm_crtc_scaling_filter filter)
+{
+	u32 scaler_filter_ctl = PS_FILTER_MEDIUM;
+
+	if (filter == DRM_CRTC_SCALING_FILTER_NEAREST_NEIGHBOR) {
+		skl_scaler_setup_nearest_neighbor_filter(dev_priv, pipe, id,
+							 set);
+		scaler_filter_ctl = PS_FILTER_PROGRAMMED |
+				PS_UV_VERT_FILTER_SELECT(set) |
+				PS_UV_HORZ_FILTER_SELECT(set) |
+				PS_Y_VERT_FILTER_SELECT(set) |
+				PS_Y_HORZ_FILTER_SELECT(set);
+
+	}
+	return scaler_filter_ctl;
+}
+
 static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -6316,12 +6335,14 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
+	const struct drm_crtc_state *state = &crtc_state->uapi;
 
 	if (crtc_state->pch_pfit.enabled) {
 		u16 uv_rgb_hphase, uv_rgb_vphase;
 		int pfit_w, pfit_h, hscale, vscale;
 		unsigned long irqflags;
 		int id;
+		int scaler_filter_ctl;
 
 		if (drm_WARN_ON(&dev_priv->drm,
 				crtc_state->scaler_state.scaler_id < 0))
@@ -6340,8 +6361,12 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 
 		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 
-		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), PS_SCALER_EN |
-				  PS_FILTER_MEDIUM | scaler_state->scalers[id].mode);
+		scaler_filter_ctl =
+			skl_scaler_crtc_setup_filter(dev_priv, pipe, id, 0,
+						state->scaling_filter);
+		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id),
+				  PS_SCALER_EN | scaler_filter_ctl |
+				  scaler_state->scalers[id].mode);
 		intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
 				  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_vphase));
 		intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id),
@@ -16777,6 +16802,9 @@ static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 		dev_priv->plane_to_crtc_mapping[i9xx_plane] = crtc;
 	}
 
+	if (INTEL_GEN(dev_priv) >= 10)
+		drm_crtc_enable_scaling_filter(&crtc->base);
+
 	intel_color_init(crtc);
 
 	intel_crtc_crc_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index deda351719db..ac3fd9843ace 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -395,6 +395,26 @@ skl_plane_max_stride(struct intel_plane *plane,
 		return min(8192 * cpp, 32768);
 }
 
+static u32
+skl_scaler_plane_setup_filter(struct drm_i915_private *dev_priv, enum pipe pipe,
+			      int id, int set,
+			      enum drm_plane_scaling_filter filter)
+{
+	u32 scaler_filter_ctl = PS_FILTER_MEDIUM;
+
+	if (filter == DRM_PLANE_SCALING_FILTER_NEAREST_NEIGHBOR) {
+		skl_scaler_setup_nearest_neighbor_filter(dev_priv, pipe, id,
+							 set);
+		scaler_filter_ctl = PS_FILTER_PROGRAMMED |
+				PS_UV_VERT_FILTER_SELECT(set) |
+				PS_UV_HORZ_FILTER_SELECT(set) |
+				PS_Y_VERT_FILTER_SELECT(set) |
+				PS_Y_HORZ_FILTER_SELECT(set);
+
+	}
+	return scaler_filter_ctl;
+}
+
 static void
 skl_program_scaler(struct intel_plane *plane,
 		   const struct intel_crtc_state *crtc_state,
@@ -406,6 +426,7 @@ skl_program_scaler(struct intel_plane *plane,
 	int scaler_id = plane_state->scaler_id;
 	const struct intel_scaler *scaler =
 		&crtc_state->scaler_state.scalers[scaler_id];
+	const struct drm_plane_state *state = &plane_state->uapi;
 	int crtc_x = plane_state->uapi.dst.x1;
 	int crtc_y = plane_state->uapi.dst.y1;
 	u32 crtc_w = drm_rect_width(&plane_state->uapi.dst);
@@ -413,6 +434,7 @@ skl_program_scaler(struct intel_plane *plane,
 	u16 y_hphase, uv_rgb_hphase;
 	u16 y_vphase, uv_rgb_vphase;
 	int hscale, vscale;
+	int scaler_filter_ctl;
 
 	hscale = drm_rect_calc_hscale(&plane_state->uapi.src,
 				      &plane_state->uapi.dst,
@@ -439,8 +461,12 @@ skl_program_scaler(struct intel_plane *plane,
 		uv_rgb_vphase = skl_scaler_calc_phase(1, vscale, false);
 	}
 
+	scaler_filter_ctl =
+		skl_scaler_plane_setup_filter(dev_priv, pipe, scaler_id, 0,
+					      state->scaling_filter);
 	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id),
-			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler->mode);
+			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) |
+			  scaler->mode | scaler_filter_ctl);
 	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, scaler_id),
 			  PS_Y_PHASE(y_vphase) | PS_UV_RGB_PHASE(uv_rgb_vphase));
 	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, scaler_id),
@@ -3121,6 +3147,9 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 
 	drm_plane_create_zpos_immutable_property(&plane->base, plane_id);
 
+	if (INTEL_GEN(dev_priv) >= 10)
+		drm_plane_enable_scaling_filter(&plane->base);
+
 	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
 
 	return plane;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
