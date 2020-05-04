Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB881C45CA
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D722B6E46B;
	Mon,  4 May 2020 18:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5596E46B;
 Mon,  4 May 2020 18:24:57 +0000 (UTC)
IronPort-SDR: egrn39FvA8sZUOZ0uHYEZckhpCNQN1vhSreSYx3jsDxihMayq0ys1ChWgoePZJTXt2YrpHAbvB
 Ogti3m5OE6Jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:24:57 -0700
IronPort-SDR: 511ftY0Bv7xVGuL8NAtvub1bnJm7qI+AahsX9pg8VpcCAbRAoNqfb8lk4trZ8TYtn9LMbtjVLR
 qDNkgA4q4Xhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="369172243"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2020 11:24:53 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 8/9] drm/i915/pm: Prefer drm_WARN_ON over WARN_ON
Date: Mon,  4 May 2020 23:45:59 +0530
Message-Id: <20200504181600.18503-9-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
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
+struct drm_i915_private *dev_priv = to_i915(T->base.dev);
<+...
-WARN_ON(
+drm_WARN_ON(&dev_priv->drm,
...)
...+>

}

@@
identifier func, T;
@@
func(struct intel_crtc_state *T,...) {
+struct drm_i915_private *dev_priv = to_i915(T->uapi.crtc->dev);
<+...
-WARN_ON(
+drm_WARN_ON(&dev_priv->drm,
...)
...+>

}

changes since v1:
    - Added dev_priv local variable and used it in drm_WARN_ON calls (Jani)

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 63 ++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index bfb180fe8047..7e8da6c5bfb9 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -1436,6 +1436,7 @@ static int g4x_compute_pipe_wm(struct intel_crtc_state *crtc_state)
 static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct g4x_wm_state *intermediate = &new_crtc_state->wm.g4x.intermediate;
 	const struct g4x_wm_state *optimal = &new_crtc_state->wm.g4x.optimal;
 	struct intel_atomic_state *intel_state =
@@ -1464,8 +1465,8 @@ static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
 			max(optimal->wm.plane[plane_id],
 			    active->wm.plane[plane_id]);
 
-		WARN_ON(intermediate->wm.plane[plane_id] >
-			g4x_plane_fifo_size(plane_id, G4X_WM_LEVEL_NORMAL));
+		drm_WARN_ON(&dev_priv->drm, intermediate->wm.plane[plane_id] >
+			    g4x_plane_fifo_size(plane_id, G4X_WM_LEVEL_NORMAL));
 	}
 
 	intermediate->sr.plane = max(optimal->sr.plane,
@@ -1482,21 +1483,25 @@ static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
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
+	drm_WARN_ON(&dev_priv->drm,
+		    (intermediate->sr.plane >
+		     g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_SR) ||
+		     intermediate->sr.cursor >
+		     g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_SR)) &&
+		    intermediate->cxsr);
+	drm_WARN_ON(&dev_priv->drm,
+		    (intermediate->sr.plane >
+		     g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_HPLL) ||
+		     intermediate->sr.cursor >
+		     g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_HPLL)) &&
+		    intermediate->hpll_en);
+
+	drm_WARN_ON(&dev_priv->drm,
+		    intermediate->sr.fbc > g4x_fbc_fifo_size(1) &&
+		    intermediate->fbc_en && intermediate->cxsr);
+	drm_WARN_ON(&dev_priv->drm,
+		    intermediate->hpll.fbc > g4x_fbc_fifo_size(2) &&
+		    intermediate->fbc_en && intermediate->hpll_en);
 
 out:
 	/*
@@ -1680,6 +1685,7 @@ static bool vlv_need_sprite0_fifo_workaround(unsigned int active_planes)
 static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	const struct g4x_pipe_wm *raw =
 		&crtc_state->wm.vlv.raw[VLV_WM_LEVEL_PM2];
 	struct vlv_fifo_state *fifo_state = &crtc_state->wm.vlv.fifo_state;
@@ -1748,11 +1754,11 @@ static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 		fifo_left -= plane_extra;
 	}
 
-	WARN_ON(active_planes != 0 && fifo_left != 0);
+	drm_WARN_ON(&dev_priv->drm, active_planes != 0 && fifo_left != 0);
 
 	/* give it all to the first plane if none are active */
 	if (active_planes == 0) {
-		WARN_ON(fifo_left != fifo_size);
+		drm_WARN_ON(&dev_priv->drm, fifo_left != fifo_size);
 		fifo_state->plane[PLANE_PRIMARY] = fifo_left;
 	}
 
@@ -4180,11 +4186,13 @@ static uint_fixed_16_16_t
 skl_plane_downscale_amount(const struct intel_crtc_state *crtc_state,
 			   const struct intel_plane_state *plane_state)
 {
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	u32 src_w, src_h, dst_w, dst_h;
 	uint_fixed_16_16_t fp_w_ratio, fp_h_ratio;
 	uint_fixed_16_16_t downscale_h, downscale_w;
 
-	if (WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_wm_plane_visible(crtc_state, plane_state)))
 		return u32_to_fixed16(0);
 
 	/*
@@ -4836,6 +4844,7 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
 static uint_fixed_16_16_t
 intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 {
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	u32 pixel_rate;
 	u32 crtc_htotal;
 	uint_fixed_16_16_t linetime_us;
@@ -4845,7 +4854,7 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 
 	pixel_rate = crtc_state->pixel_rate;
 
-	if (WARN_ON(pixel_rate == 0))
+	if (drm_WARN_ON(&dev_priv->drm, pixel_rate == 0))
 		return u32_to_fixed16(0);
 
 	crtc_htotal = crtc_state->hw.adjusted_mode.crtc_htotal;
@@ -4858,11 +4867,13 @@ static u32
 skl_adjusted_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 			      const struct intel_plane_state *plane_state)
 {
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	u64 adjusted_pixel_rate;
 	uint_fixed_16_16_t downscale_amount;
 
 	/* Shouldn't reach here on disabled planes... */
-	if (WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_wm_plane_visible(crtc_state, plane_state)))
 		return 0;
 
 	/*
@@ -5281,6 +5292,7 @@ static int skl_build_plane_wm(struct intel_crtc_state *crtc_state,
 static int icl_build_plane_wm(struct intel_crtc_state *crtc_state,
 			      const struct intel_plane_state *plane_state)
 {
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	enum plane_id plane_id = to_intel_plane(plane_state->uapi.plane)->id;
 	int ret;
 
@@ -5292,9 +5304,10 @@ static int icl_build_plane_wm(struct intel_crtc_state *crtc_state,
 		const struct drm_framebuffer *fb = plane_state->hw.fb;
 		enum plane_id y_plane_id = plane_state->planar_linked_plane->id;
 
-		WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state));
-		WARN_ON(!fb->format->is_yuv ||
-			fb->format->num_planes == 1);
+		drm_WARN_ON(&dev_priv->drm,
+			    !intel_wm_plane_visible(crtc_state, plane_state));
+		drm_WARN_ON(&dev_priv->drm, !fb->format->is_yuv ||
+			    fb->format->num_planes == 1);
 
 		ret = skl_build_plane_wm_single(crtc_state, plane_state,
 						y_plane_id, 0);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
