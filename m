Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB92684C4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 08:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683036E198;
	Mon, 14 Sep 2020 06:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D07E6E194;
 Mon, 14 Sep 2020 06:23:15 +0000 (UTC)
IronPort-SDR: cuiEHKCZTT2A6DS3x/p93g7pbGbQ8jfwCSqtht1vMNnpg1HeGFCI4s+KYxE6ijP6FwkrOwko87
 LWm7zwdzV9FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156426364"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="156426364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:23:14 -0700
IronPort-SDR: e52BHaVAZfxmPGH821Xl1HyFvByugFWBsAaSJPzaWk8vwkMLIrPpZNBLk4vdSgXt+hNYS1zmWN
 dOZkdWjXFW9Q==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="287536646"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 13 Sep 2020 23:23:10 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 3/8] drm/i915: Add checks specific to async flips
Date: Mon, 14 Sep 2020 11:26:28 +0530
Message-Id: <20200914055633.21109-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200914055633.21109-1-karthik.b.s@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If flip is requested on any other plane, reject it.

Make sure there is no change in fbc, offset and framebuffer modifiers
when async flip is requested.

If any of these are modified, reject async flip.

v2: -Replace DRM_ERROR (Paulo)
    -Add check for changes in OFFSET, FBC, RC(Paulo)

v3: -Removed TODO as benchmarking tests have been run now.

v4: -Added more state checks for async flip (Ville)
    -Moved intel_atomic_check_async to the end of intel_atomic_check
     as the plane checks needs to pass before this. (Ville)
    -Removed crtc_state->enable_fbc check. (Ville)
    -Set the I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP flag for async
     flip case as scanline counter is not reliable here.

v5: -Fix typo and other check patch errors seen in CI
     in 'intel_atomic_check_async' function.

v6: -Don't call intel_atomic_check_async multiple times. (Ville)
    -Remove the check for n_planes in intel_atomic_check_async
    -Added documentation for async flips. (Paulo)

v7: -Replace 'intel_plane' with 'plane'. (Ville)
    -Replace all uapi.foo as hw.foo. (Ville)
    -Do not use intel_wm_need_update function. (Ville)
    -Add destination coordinate check. (Ville)
    -Do not allow async flip with linear buffer
     on older hw as it has issues with this. (Ville)
    -Remove break after intel_atomic_check_async. (Ville)

v8: -Rebased.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 143 +++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2902fefd217f..a0c17d94daf3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14876,6 +14876,142 @@ static bool intel_cpu_transcoders_need_modeset(struct intel_atomic_state *state,
 	return false;
 }
 
+/**
+ * DOC: asynchronous flip implementation
+ *
+ * Asynchronous page flip is the implementation for the DRM_MODE_PAGE_FLIP_ASYNC
+ * flag. Currently async flip is only supported via the drmModePageFlip IOCTL.
+ * Correspondingly, support is currently added for primary plane only.
+ *
+ * Async flip can only change the plane surface address, so anything else
+ * changing is rejected from the intel_atomic_check_async() function.
+ * Once this check is cleared, flip done interrupt is enabled using
+ * the skl_enable_flip_done() function.
+ *
+ * As soon as the surface address register is written, flip done interrupt is
+ * generated and the requested events are sent to the usersapce in the interrupt
+ * handler itself. The timestamp and sequence sent during the flip done event
+ * correspond to the last vblank and have no relation to the actual time when
+ * the flip done event was sent.
+ */
+
+static int intel_atomic_check_async(struct intel_atomic_state *state)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
+	struct intel_plane_state *new_plane_state, *old_plane_state;
+	struct intel_crtc *crtc;
+	struct intel_plane *plane;
+	int i;
+
+	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
+					    new_crtc_state, i) {
+		if (needs_modeset(new_crtc_state)) {
+			DRM_DEBUG_KMS("Modeset Required. Async flip not supported\n");
+			return -EINVAL;
+		}
+
+		if (!new_crtc_state->hw.active) {
+			DRM_DEBUG_KMS("CRTC inactive\n");
+			return -EINVAL;
+		}
+		if (old_crtc_state->active_planes != new_crtc_state->active_planes) {
+			DRM_DEBUG_KMS("Active planes cannot be changed during async flip\n");
+			return -EINVAL;
+		}
+	}
+
+	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
+					     new_plane_state, i) {
+		/*TODO: Async flip is only supported through the page flip IOCTL
+		 * as of now. So support currently added for primary plane only.
+		 * Support for other planes should be added when async flip is
+		 * enabled in the atomic IOCTL path.
+		 */
+		if (plane->id != PLANE_PRIMARY)
+			return -EINVAL;
+
+		/*FIXME: This check is kept generic for all gen <= 10 platforms.
+		 * Need to verify this for all gen9 and gen10 platforms to enable
+		 * this selectively if required.
+		 */
+		if (new_plane_state->hw.fb->modifier == DRM_FORMAT_MOD_LINEAR &&
+		    INTEL_GEN(dev_priv) <= 10) {
+			DRM_DEBUG_KMS("Linear memory does not support async flips on gen <= 10\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->color_plane[0].x !=
+		    new_plane_state->color_plane[0].x ||
+		    old_plane_state->color_plane[0].y !=
+		    new_plane_state->color_plane[0].y) {
+			DRM_DEBUG_KMS("Offsets cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.fb->modifier !=
+		    new_plane_state->hw.fb->modifier) {
+			DRM_DEBUG_KMS("Framebuffer modifiers cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.fb->format !=
+		    new_plane_state->hw.fb->format) {
+			DRM_DEBUG_KMS("Framebuffer format cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.rotation !=
+		    new_plane_state->hw.rotation) {
+			DRM_DEBUG_KMS("Rotation cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.fb->width !=
+		    new_plane_state->hw.fb->width ||
+		    old_plane_state->hw.fb->height !=
+		    new_plane_state->hw.fb->height) {
+			DRM_DEBUG_KMS("Framebuffer dimensions cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.src_w != new_plane_state->uapi.src_w ||
+		    old_plane_state->uapi.src_h != new_plane_state->uapi.src_h ||
+		    old_plane_state->uapi.src_x != new_plane_state->uapi.src_x ||
+		    old_plane_state->uapi.src_y != new_plane_state->uapi.src_y ||
+		    old_plane_state->uapi.crtc_w != new_plane_state->uapi.crtc_w ||
+		    old_plane_state->uapi.crtc_h != new_plane_state->uapi.crtc_h ||
+		    old_plane_state->uapi.crtc_x != new_plane_state->uapi.crtc_x ||
+		    old_plane_state->uapi.crtc_y != new_plane_state->uapi.crtc_y) {
+			DRM_DEBUG_KMS("Plane size/co-ordinates cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.alpha != new_plane_state->hw.alpha) {
+			DRM_DEBUG_KMS("Alpha value cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.pixel_blend_mode !=
+		    new_plane_state->hw.pixel_blend_mode) {
+			DRM_DEBUG_KMS("Pixel blend mode cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.color_encoding != new_plane_state->hw.color_encoding) {
+			DRM_DEBUG_KMS("Color encoding cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.color_range != new_plane_state->hw.color_range) {
+			DRM_DEBUG_KMS("Color range cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * intel_atomic_check - validate state object
  * @dev: drm device
@@ -15053,6 +15189,13 @@ static int intel_atomic_check(struct drm_device *dev,
 				       "[modeset]" : "[fastset]");
 	}
 
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip) {
+			ret = intel_atomic_check_async(state);
+			if (ret)
+				goto fail;
+		}
+	}
 	return 0;
 
  fail:
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
