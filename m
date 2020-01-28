Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584114BFC0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155836EF41;
	Tue, 28 Jan 2020 18:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375E86EF41;
 Tue, 28 Jan 2020 18:28:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:28:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310820083"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:28:34 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Daniel Drake <drake@endlessm.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [Intel-gfx] [PATCH v5 10/21] drm/i915/display/fbc: Make WARN* drm
 specific where drm_priv ptr is available
Date: Tue, 28 Jan 2020 23:45:52 +0530
Message-Id: <20200128181603.27767-11-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
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

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 2a3f1333c8ff..c27e007d5e04 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -412,7 +412,7 @@ static void intel_fbc_deactivate(struct drm_i915_private *dev_priv,
 {
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
+	drm_WARN_ON(&dev_priv->drm, !mutex_is_locked(&fbc->lock));
 
 	if (fbc->active)
 		intel_fbc_hw_deactivate(dev_priv);
@@ -476,7 +476,8 @@ static int intel_fbc_alloc_cfb(struct drm_i915_private *dev_priv,
 	struct drm_mm_node *uninitialized_var(compressed_llb);
 	int ret;
 
-	WARN_ON(drm_mm_node_allocated(&fbc->compressed_fb));
+	drm_WARN_ON(&dev_priv->drm,
+		    drm_mm_node_allocated(&fbc->compressed_fb));
 
 	ret = find_compression_threshold(dev_priv, &fbc->compressed_fb,
 					 size, fb_cpp);
@@ -562,7 +563,7 @@ static bool stride_is_valid(struct drm_i915_private *dev_priv,
 			    unsigned int stride)
 {
 	/* This should have been caught earlier. */
-	if (WARN_ON_ONCE((stride & (64 - 1)) != 0))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, (stride & (64 - 1)) != 0))
 		return false;
 
 	/* Below are the additional FBC restrictions. */
@@ -670,8 +671,8 @@ static void intel_fbc_update_state_cache(struct intel_crtc *crtc,
 	cache->fb.format = fb->format;
 	cache->fb.stride = fb->pitches[0];
 
-	WARN_ON(plane_state->flags & PLANE_HAS_FENCE &&
-		!plane_state->vma->fence);
+	drm_WARN_ON(&dev_priv->drm, plane_state->flags & PLANE_HAS_FENCE &&
+		    !plane_state->vma->fence);
 
 	if (plane_state->flags & PLANE_HAS_FENCE &&
 	    plane_state->vma->fence)
@@ -937,9 +938,9 @@ static void __intel_fbc_disable(struct drm_i915_private *dev_priv)
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct intel_crtc *crtc = fbc->crtc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
-	WARN_ON(!fbc->crtc);
-	WARN_ON(fbc->active);
+	drm_WARN_ON(&dev_priv->drm, !mutex_is_locked(&fbc->lock));
+	drm_WARN_ON(&dev_priv->drm, !fbc->crtc);
+	drm_WARN_ON(&dev_priv->drm, fbc->active);
 
 	DRM_DEBUG_KMS("Disabling FBC on pipe %c\n", pipe_name(crtc->pipe));
 
@@ -953,7 +954,7 @@ static void __intel_fbc_post_update(struct intel_crtc *crtc)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
+	drm_WARN_ON(&dev_priv->drm, !mutex_is_locked(&fbc->lock));
 
 	if (fbc->crtc != crtc)
 		return;
@@ -1146,7 +1147,7 @@ void intel_fbc_enable(struct intel_atomic_state *state,
 		__intel_fbc_disable(dev_priv);
 	}
 
-	WARN_ON(fbc->active);
+	drm_WARN_ON(&dev_priv->drm, fbc->active);
 
 	intel_fbc_update_state_cache(crtc, crtc_state, plane_state);
 
@@ -1213,7 +1214,7 @@ void intel_fbc_global_disable(struct drm_i915_private *dev_priv)
 
 	mutex_lock(&fbc->lock);
 	if (fbc->crtc) {
-		WARN_ON(fbc->crtc->active);
+		drm_WARN_ON(&dev_priv->drm, fbc->crtc->active);
 		__intel_fbc_disable(dev_priv);
 	}
 	mutex_unlock(&fbc->lock);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
