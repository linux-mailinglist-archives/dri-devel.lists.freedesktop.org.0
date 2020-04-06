Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301519F4D8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169E86E384;
	Mon,  6 Apr 2020 11:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725946E384;
 Mon,  6 Apr 2020 11:38:50 +0000 (UTC)
IronPort-SDR: RizgfJ3pyHc09XHD2SS6xJ+4wLZ0JL7cJ1CtMZoGH191AfZRra9zpuj6PYeWycO2J0hfXrx8KY
 jCXRUUOBhGkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:50 -0700
IronPort-SDR: K5SgbCjfBnGL8+CqPg6nNTHgXShJheW0XhBE/8n7299tCNm9ONfLOR7uU061UW/67stcPtsjeW
 0AQe1mXzZzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192558"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:46 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 17/18] drm/i915/pm: Prefer drm_WARN_ON over WARN_ON
Date: Mon,  6 Apr 2020 16:57:59 +0530
Message-Id: <20200406112800.23762-18-pankaj.laxminarayan.bharadiya@intel.com>
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

Prefer drm_WARN_ON over WARN_ON.

Conversion is done with below sementic patch:

@@
identifier func, T;
@@
func(...) {
...
struct intel_crtc *T = ...;
<+...
-WARN_ON(
+drm_WARN_ON(T->base.dev,
...)
...+>

}

@@
identifier func, T;
@@
func(struct intel_crtc_state *T,...) {
<+...
-WARN_ON(
+drm_WARN_ON(T->uapi.crtc->dev,
...)
...+>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 57 ++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 8375054ba27d..b2d22fdaf3db 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -1464,8 +1464,8 @@ static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
 			max(optimal->wm.plane[plane_id],
 			    active->wm.plane[plane_id]);
 
-		WARN_ON(intermediate->wm.plane[plane_id] >
-			g4x_plane_fifo_size(plane_id, G4X_WM_LEVEL_NORMAL));
+		drm_WARN_ON(crtc->base.dev, intermediate->wm.plane[plane_id] >
+			    g4x_plane_fifo_size(plane_id, G4X_WM_LEVEL_NORMAL));
 	}
 
 	intermediate->sr.plane = max(optimal->sr.plane,
@@ -1482,21 +1482,25 @@ static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
 	intermediate->hpll.fbc = max(optimal->hpll.fbc,
 				     active->hpll.fbc);
 
-	WARN_ON((intermediate->sr.plane >
-		 g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_SR) ||
-		 intermediate->sr.cursor >
-		 g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_SR)) &&
-		intermediate->cxsr);
-	WARN_ON((intermediate->sr.plane >
-		 g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_HPLL) ||
-		 intermediate->sr.cursor >
-		 g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_HPLL)) &&
-		intermediate->hpll_en);
-
-	WARN_ON(intermediate->sr.fbc > g4x_fbc_fifo_size(1) &&
-		intermediate->fbc_en && intermediate->cxsr);
-	WARN_ON(intermediate->hpll.fbc > g4x_fbc_fifo_size(2) &&
-		intermediate->fbc_en && intermediate->hpll_en);
+	drm_WARN_ON(crtc->base.dev,
+		    (intermediate->sr.plane >
+		     g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_SR) ||
+		     intermediate->sr.cursor >
+		     g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_SR)) &&
+		    intermediate->cxsr);
+	drm_WARN_ON(crtc->base.dev,
+		    (intermediate->sr.plane >
+		     g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_HPLL) ||
+		     intermediate->sr.cursor >
+		     g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_HPLL)) &&
+		    intermediate->hpll_en);
+
+	drm_WARN_ON(crtc->base.dev,
+		    intermediate->sr.fbc > g4x_fbc_fifo_size(1) &&
+		    intermediate->fbc_en && intermediate->cxsr);
+	drm_WARN_ON(crtc->base.dev,
+		    intermediate->hpll.fbc > g4x_fbc_fifo_size(2) &&
+		    intermediate->fbc_en && intermediate->hpll_en);
 
 out:
 	/*
@@ -1748,11 +1752,11 @@ static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 		fifo_left -= plane_extra;
 	}
 
-	WARN_ON(active_planes != 0 && fifo_left != 0);
+	drm_WARN_ON(crtc->base.dev, active_planes != 0 && fifo_left != 0);
 
 	/* give it all to the first plane if none are active */
 	if (active_planes == 0) {
-		WARN_ON(fifo_left != fifo_size);
+		drm_WARN_ON(crtc->base.dev, fifo_left != fifo_size);
 		fifo_state->plane[PLANE_PRIMARY] = fifo_left;
 	}
 
@@ -4154,7 +4158,8 @@ skl_plane_downscale_amount(const struct intel_crtc_state *crtc_state,
 	uint_fixed_16_16_t fp_w_ratio, fp_h_ratio;
 	uint_fixed_16_16_t downscale_h, downscale_w;
 
-	if (WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state)))
+	if (drm_WARN_ON(crtc_state->uapi.crtc->dev,
+			!intel_wm_plane_visible(crtc_state, plane_state)))
 		return u32_to_fixed16(0);
 
 	/*
@@ -4815,7 +4820,7 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 
 	pixel_rate = crtc_state->pixel_rate;
 
-	if (WARN_ON(pixel_rate == 0))
+	if (drm_WARN_ON(crtc_state->uapi.crtc->dev, pixel_rate == 0))
 		return u32_to_fixed16(0);
 
 	crtc_htotal = crtc_state->hw.adjusted_mode.crtc_htotal;
@@ -4832,7 +4837,8 @@ skl_adjusted_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 	uint_fixed_16_16_t downscale_amount;
 
 	/* Shouldn't reach here on disabled planes... */
-	if (WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state)))
+	if (drm_WARN_ON(crtc_state->uapi.crtc->dev,
+			!intel_wm_plane_visible(crtc_state, plane_state)))
 		return 0;
 
 	/*
@@ -5261,9 +5267,10 @@ static int icl_build_plane_wm(struct intel_crtc_state *crtc_state,
 		const struct drm_framebuffer *fb = plane_state->hw.fb;
 		enum plane_id y_plane_id = plane_state->planar_linked_plane->id;
 
-		WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state));
-		WARN_ON(!fb->format->is_yuv ||
-			fb->format->num_planes == 1);
+		drm_WARN_ON(crtc_state->uapi.crtc->dev,
+			    !intel_wm_plane_visible(crtc_state, plane_state));
+		drm_WARN_ON(crtc_state->uapi.crtc->dev, !fb->format->is_yuv ||
+			    fb->format->num_planes == 1);
 
 		ret = skl_build_plane_wm_single(crtc_state, plane_state,
 						y_plane_id, 0);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
