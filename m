Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963F23EB12
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 12:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B636E9BC;
	Fri,  7 Aug 2020 10:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292CF6E9BC;
 Fri,  7 Aug 2020 10:01:54 +0000 (UTC)
IronPort-SDR: B7VI0o4tNjK5kmFiPfCVIYBEujjnojtJqo+EQL9yWM8swbgpSAL9NcjZpNwRKk/c4IXJMUEliD
 RNcP5a5r9qjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="132604158"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="132604158"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 03:01:53 -0700
IronPort-SDR: H0gtwNSgG43b9L4hZnNS+NPp5ZELkXr0I7005kkDW9JqyMcIlTi1dSB+GoqyAYxaJBf+sp9nbE
 NTeELsQyO/IQ==
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="468178385"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Aug 2020 03:01:50 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 3/7] drm/i915: Add checks specific to async flips
Date: Fri,  7 Aug 2020 15:05:47 +0530
Message-Id: <20200807093551.10673-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200807093551.10673-1-karthik.b.s@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 113 +++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ce2b0c14a073..9629c751d2af 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14832,6 +14832,110 @@ static bool intel_cpu_transcoders_need_modeset(struct intel_atomic_state *state,
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
+	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
+	struct intel_plane_state *new_plane_state, *old_plane_state;
+	struct intel_crtc *crtc;
+	struct intel_plane *intel_plane;
+	int i;
+
+	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
+					    new_crtc_state, i) {
+		if (needs_modeset(new_crtc_state)) {
+			DRM_DEBUG_KMS("Modeset Required. Async flip not supported\n");
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
+		if (old_plane_state->color_plane[0].x !=
+		    new_plane_state->color_plane[0].x ||
+		    old_plane_state->color_plane[0].y !=
+		    new_plane_state->color_plane[0].y) {
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
+		if (old_plane_state->uapi.pixel_blend_mode !=
+		    new_plane_state->uapi.pixel_blend_mode) {
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
+	}
+
+	return 0;
+}
+
 /**
  * intel_atomic_check - validate state object
  * @dev: drm device
@@ -15011,6 +15115,15 @@ static int intel_atomic_check(struct drm_device *dev,
 				       "[modeset]" : "[fastset]");
 	}
 
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip) {
+			ret = intel_atomic_check_async(state);
+			if (ret)
+				goto fail;
+
+			break;
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
