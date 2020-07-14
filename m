Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B111F21E55D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3C6E874;
	Tue, 14 Jul 2020 01:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E8F6E873;
 Tue, 14 Jul 2020 01:50:55 +0000 (UTC)
IronPort-SDR: zaaQNxBj3uAMuka4mi0xS3+kH+Nx6V/sGp6d44ycYZYs/9hZbl1FncPoC9xMlCygseYbR08NZB
 ftVCvAVeZ//Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="136245077"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="136245077"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 18:50:54 -0700
IronPort-SDR: wQ2jZzw83e5L1JPM09BLdwZSuLvtCA/bO4+Px/sfU2YIE9FY2Z3Q/7mkL0Uw5Ij0PSRnjXEr8N
 tRohT3bzWiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="307680234"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2020 18:50:52 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/5] drm/i915: Add checks specific to async flips
Date: Tue, 14 Jul 2020 06:57:23 +0530
Message-Id: <20200714012725.18383-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200714012725.18383-1-karthik.b.s@intel.com>
References: <20200714012725.18383-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, Karthik B S <karthik.b.s@intel.com>,
 dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, daniel.vetter@intel.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support added only for async flips on primary plane.
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 103 +++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aa0eebeca7ff..fe06db9cf38e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14825,6 +14825,101 @@ static bool intel_cpu_transcoders_need_modeset(struct intel_atomic_state *state,
 	return false;
 }
 
+static int intel_atomic_check_async(struct intel_atomic_state *state)
+{
+	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
+	struct intel_plane_state *new_plane_state, *old_plane_state;
+	struct intel_crtc *crtc;
+	struct intel_plane *intel_plane;
+	int i, n_planes = 0;
+
+	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
+					    new_crtc_state, i) {
+		if (needs_modeset(new_crtc_state)) {
+			DRM_DEBUG_KMS("Modeset Requried. Async flip not supported\n");
+			return -EINVAL;
+		}
+
+		if (!new_crtc_state->uapi.active) {
+			DRM_DEBUG_KMS("CRTC inactive\n");
+			return -EINVAL;
+		}
+		if (old_crtc_state->active_planes != new_crtc_state->active_planes) {
+			DRM_DEBUG_KMS("Active planes cannot be changed during async flip\n");
+			return -EINVAL;
+		}
+	}
+
+	for_each_oldnew_intel_plane_in_state(state, intel_plane, old_plane_state,
+					     new_plane_state, i) {
+		/*TODO: Async flip is only supported through the page flip IOCTL
+		 * as of now. So support currently added for primary plane only.
+		 * Support for other planes should be added when async flip is
+		 * enabled in the atomic IOCTL path.
+		 */
+		if (intel_plane->id != PLANE_PRIMARY)
+			return -EINVAL;
+
+		if ((old_plane_state->color_plane[0].x !=
+		     new_plane_state->color_plane[0].x) ||
+		    (old_plane_state->color_plane[0].y !=
+		     new_plane_state->color_plane[0].y)) {
+			DRM_DEBUG_KMS("Offsets cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.fb->modifier !=
+		    new_plane_state->uapi.fb->modifier) {
+			DRM_DEBUG_KMS("Framebuffer modifiers cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.fb->format !=
+		    new_plane_state->uapi.fb->format) {
+			DRM_DEBUG_KMS("Framebuffer format cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (intel_wm_need_update(old_plane_state, new_plane_state)) {
+			DRM_DEBUG_KMS("WM update not allowed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.alpha != new_plane_state->uapi.alpha) {
+			DRM_DEBUG_KMS("Alpha value cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.pixel_blend_mode != new_plane_state->uapi.pixel_blend_mode) {
+			DRM_DEBUG_KMS("Pixel blend mode cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.color_encoding != new_plane_state->uapi.color_encoding) {
+			DRM_DEBUG_KMS("Color encoding cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->uapi.color_range != new_plane_state->uapi.color_range) {
+			DRM_DEBUG_KMS("Color range cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		n_planes++;
+	}
+
+	if (n_planes != 1)
+		return -EINVAL;
+
+	/*Scan line registers cannot be trusted for async flip */
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip)
+			crtc->mode_flags |= I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP;
+	}
+
+	return 0;
+}
+
 /**
  * intel_atomic_check - validate state object
  * @dev: drm device
@@ -15004,6 +15099,14 @@ static int intel_atomic_check(struct drm_device *dev,
 				       "[modeset]" : "[fastset]");
 	}
 
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip) {
+			ret = intel_atomic_check_async(state);
+
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
