Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C726C448
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3C6EA42;
	Wed, 16 Sep 2020 15:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159266EA3C;
 Wed, 16 Sep 2020 15:35:10 +0000 (UTC)
IronPort-SDR: sr++6eKFdxT5hQTYDNpvGnVIcCCF1zNOBCkkBJcMDE9UFo84JMtYTkba2E040VjC7eIVWLQqqW
 RYLGUcgWz4Zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160421623"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="160421623"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:35:07 -0700
IronPort-SDR: Yz/HpcoLSa5VfHNuoL9mjqhQ6u+ILwIKv2Gq5n3WUAmj/4E3uGG/mzHYTcpv7BalAvDAZH1h6a
 0CSHkun5hevg==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307081674"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Sep 2020 08:35:04 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 3/8] drm/i915: Add checks specific to async flips
Date: Wed, 16 Sep 2020 20:38:19 +0530
Message-Id: <20200916150824.15749-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150824.15749-1-karthik.b.s@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
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

v9: -Replace DRM_DEBUG_KMS with drm_dbg_kms(). (Ville)
    -Fix comment formatting. (Ville)
    -Remove gen specific checks. (Ville)
    -Remove irrelevant FB size check. (Ville)
    -Add missing stride check. (Ville)
    -Use drm_rect_equals() instead of individual checks. (Ville)
    -Call intel_atomic_check_async before state dump. (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 137 +++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 627aeaebf94f..0f0bcbb00c7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14882,6 +14882,137 @@ static bool intel_cpu_transcoders_need_modeset(struct intel_atomic_state *state,
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
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
+	struct intel_plane_state *new_plane_state, *old_plane_state;
+	struct intel_crtc *crtc;
+	struct intel_plane *plane;
+	int i;
+
+	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
+					    new_crtc_state, i) {
+		if (needs_modeset(new_crtc_state)) {
+			drm_dbg_kms(&i915->drm, "Modeset Required. Async flip not supported\n");
+			return -EINVAL;
+		}
+
+		if (!new_crtc_state->hw.active) {
+			drm_dbg_kms(&i915->drm, "CRTC inactive\n");
+			return -EINVAL;
+		}
+		if (old_crtc_state->active_planes != new_crtc_state->active_planes) {
+			drm_dbg_kms(&i915->drm,
+				    "Active planes cannot be changed during async flip\n");
+			return -EINVAL;
+		}
+	}
+
+	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
+					     new_plane_state, i) {
+		/*
+		 * TODO: Async flip is only supported through the page flip IOCTL
+		 * as of now. So support currently added for primary plane only.
+		 * Support for other planes on platforms on which supports
+		 * this(vlv/chv and icl+) should be added when async flip is
+		 * enabled in the atomic IOCTL path.
+		 */
+		if (plane->id != PLANE_PRIMARY)
+			return -EINVAL;
+
+		/*
+		 * FIXME: This check is kept generic for all platforms.
+		 * Need to verify this for all gen9 and gen10 platforms to enable
+		 * this selectively if required.
+		 */
+		if (!(new_plane_state->hw.fb->modifier != I915_FORMAT_MOD_X_TILED ||
+		    new_plane_state->hw.fb->modifier != I915_FORMAT_MOD_Y_TILED ||
+		    new_plane_state->hw.fb->modifier != I915_FORMAT_MOD_Yf_TILED)) {
+			drm_dbg_kms(&i915->drm,
+				    "Linear memory/CCS does not support async flips\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->color_plane[0].stride !=
+		    new_plane_state->color_plane[0].stride) {
+			drm_dbg_kms(&i915->drm, "Stride cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.fb->modifier !=
+		    new_plane_state->hw.fb->modifier) {
+			drm_dbg_kms(&i915->drm,
+				    "Framebuffer modifiers cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.fb->format !=
+		    new_plane_state->hw.fb->format) {
+			drm_dbg_kms(&i915->drm,
+				    "Framebuffer format cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.rotation !=
+		    new_plane_state->hw.rotation) {
+			drm_dbg_kms(&i915->drm, "Rotation cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (!drm_rect_equals(&old_plane_state->uapi.src, &new_plane_state->uapi.src) ||
+		    !drm_rect_equals(&old_plane_state->uapi.dst, &new_plane_state->uapi.dst)) {
+			drm_dbg_kms(&i915->drm,
+				    "Plane size/co-ordinates cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.alpha != new_plane_state->hw.alpha) {
+			drm_dbg_kms(&i915->drm, "Alpha value cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.pixel_blend_mode !=
+		    new_plane_state->hw.pixel_blend_mode) {
+			drm_dbg_kms(&i915->drm,
+				    "Pixel blend mode cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.color_encoding != new_plane_state->hw.color_encoding) {
+			drm_dbg_kms(&i915->drm,
+				    "Color encoding cannot be changed in async flip\n");
+			return -EINVAL;
+		}
+
+		if (old_plane_state->hw.color_range != new_plane_state->hw.color_range) {
+			drm_dbg_kms(&i915->drm, "Color range cannot be changed in async flip\n");
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
@@ -15050,6 +15181,12 @@ static int intel_atomic_check(struct drm_device *dev,
 
 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
 					    new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip) {
+			ret = intel_atomic_check_async(state);
+			if (ret)
+				goto fail;
+		}
+
 		if (!needs_modeset(new_crtc_state) &&
 		    !new_crtc_state->update_pipe)
 			continue;
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
