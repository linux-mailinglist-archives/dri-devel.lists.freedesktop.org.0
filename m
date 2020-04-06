Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E719F4BC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E306E34B;
	Mon,  6 Apr 2020 11:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A548F6E34B;
 Mon,  6 Apr 2020 11:37:28 +0000 (UTC)
IronPort-SDR: yr7Kd+IWtkHIca3hT10ugKaWj3UdjmS7QBMK12PZfsgVAh8cKG7IWHFOpwSZM9a16WBN5YdheH
 OOd0CGaaUgrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:37:27 -0700
IronPort-SDR: CNEWhd00cGEyScDYsQhXjRYlAEUbOJLc9IqGtdxEbt7/hdfKwYF0zpqC81F0ADx6hGFMIOrz3N
 KNa/b6ITuuPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192318"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:37:23 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 04/18] drm/i915/display/display: Prefer drm_WARN_ON over
 WARN_ON
Date: Mon,  6 Apr 2020 16:57:46 +0530
Message-Id: <20200406112800.23762-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
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

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN_ON over WARN_ON at places where struct drm_device
pointer can be extracted.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 24 ++++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 70ec301fe6e3..71ff6b2dc9df 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1973,16 +1973,16 @@ static bool is_aux_plane(const struct drm_framebuffer *fb, int plane)
 
 static int main_to_ccs_plane(const struct drm_framebuffer *fb, int main_plane)
 {
-	WARN_ON(!is_ccs_modifier(fb->modifier) ||
-		(main_plane && main_plane >= fb->format->num_planes / 2));
+	drm_WARN_ON(fb->dev, !is_ccs_modifier(fb->modifier) ||
+		    (main_plane && main_plane >= fb->format->num_planes / 2));
 
 	return fb->format->num_planes / 2 + main_plane;
 }
 
 static int ccs_to_main_plane(const struct drm_framebuffer *fb, int ccs_plane)
 {
-	WARN_ON(!is_ccs_modifier(fb->modifier) ||
-		ccs_plane < fb->format->num_planes / 2);
+	drm_WARN_ON(fb->dev, !is_ccs_modifier(fb->modifier) ||
+		    ccs_plane < fb->format->num_planes / 2);
 
 	return ccs_plane - fb->format->num_planes / 2;
 }
@@ -2992,7 +2992,7 @@ setup_fb_rotation(int plane, const struct intel_remapped_plane_info *plane_info,
 	    fb->modifier != I915_FORMAT_MOD_Yf_TILED)
 		return 0;
 
-	if (WARN_ON(plane >= ARRAY_SIZE(rot_info->plane)))
+	if (drm_WARN_ON(fb->dev, plane >= ARRAY_SIZE(rot_info->plane)))
 		return 0;
 
 	rot_info->plane[plane] = *plane_info;
@@ -6621,7 +6621,7 @@ intel_connector_primary_encoder(struct intel_connector *connector)
 		return &dp_to_dig_port(connector->mst_port)->base;
 
 	encoder = intel_attached_encoder(connector);
-	WARN_ON(!encoder);
+	drm_WARN_ON(connector->base.dev, !encoder);
 
 	return encoder;
 }
@@ -7946,7 +7946,8 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *pipe_config)
 		if (pipe_h < pfit_h)
 			pipe_h = pfit_h;
 
-		if (WARN_ON(!pfit_w || !pfit_h))
+		if (drm_WARN_ON(pipe_config->uapi.crtc->dev,
+				!pfit_w || !pfit_h))
 			return pixel_rate;
 
 		pixel_rate = div_u64(mul_u32_u32(pixel_rate, pipe_w * pipe_h),
@@ -12426,8 +12427,10 @@ static int icl_add_linked_planes(struct intel_atomic_state *state)
 		if (IS_ERR(linked_plane_state))
 			return PTR_ERR(linked_plane_state);
 
-		WARN_ON(linked_plane_state->planar_linked_plane != plane);
-		WARN_ON(linked_plane_state->planar_slave == plane_state->planar_slave);
+		drm_WARN_ON(state->base.dev,
+			    linked_plane_state->planar_linked_plane != plane);
+		drm_WARN_ON(state->base.dev,
+			    linked_plane_state->planar_slave == plane_state->planar_slave);
 	}
 
 	return 0;
@@ -13150,7 +13153,8 @@ static void intel_crtc_copy_hw_to_uapi_state(struct intel_crtc_state *crtc_state
 {
 	crtc_state->uapi.enable = crtc_state->hw.enable;
 	crtc_state->uapi.active = crtc_state->hw.active;
-	WARN_ON(drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
+	drm_WARN_ON(crtc_state->uapi.crtc->dev,
+		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
 
 	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
