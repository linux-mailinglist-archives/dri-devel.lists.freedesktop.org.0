Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A9A49568
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5589D10EC52;
	Fri, 28 Feb 2025 09:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOpTlDYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261C410EC48;
 Fri, 28 Feb 2025 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735536; x=1772271536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mPEGXqIgfRhmrx2oa3cw+KyE2uSOznRqm6nCenQefUE=;
 b=aOpTlDYx0YXSA4BDFH31QQLIuM2HO1JAIHlDc4hGEU/j/caDs1mHAU+q
 PoNggCGOWtePkYwjhf8XtCVe2qo2xDvn35E4Kk/IqmAnhDTN+toKZ+29r
 njL1H5bvodrPSNKBoIp1lUoc4ykdUvYOxBEIcFwbJke/t8FsHvddBcDSE
 bEkQp95jlAY46fXtqbWFEVUV2nqwIaX4y0qweXD1GGi+QKBmwkOxMzj21
 Lb6CEJq3AVDgKFc45fRh9JLTVhsUfNolGcv8f7tZKbnK5wE9aTrxAdDVp
 8fzSlPKblKJ8N5MH+YPefo+abwZx+u1UEVWzPhvm/U1KeWhWdNNZyrays w==;
X-CSE-ConnectionGUID: V63He9pvR3up9dQBARr6Ow==
X-CSE-MsgGUID: ESOoegqkQA611iBixibKiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293107"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:56 -0800
X-CSE-ConnectionGUID: nrPfzkJMTe+C0UvzLgx9oQ==
X-CSE-MsgGUID: kGiM2knPTKWDdFkx0znHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466618"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:53 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 9/9] drm/i915/fbc: handle dirty rect coords for the first
 frame
Date: Fri, 28 Feb 2025 11:38:02 +0200
Message-ID: <20250228093802.27091-10-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During enabling FBC, for the very first frame, the prepare dirty
rect routine wouldnt have executed as at that time the plane
reference in the fbc_state would be NULL. So this could make
driver program some invalid entries as the damage area. Though
fbc hw ignores the dirty rect values programmed for the first
frame after enabling FBC, driver must ensure that valid dirty
rect coords are programmed. So ensure that for the first frame
correct dirty rect coords are updated to the HW.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |   3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c     | 137 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_fbc.h     |   3 +-
 3 files changed, 99 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bdc25b8153e0..c4b0ec60fded 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7272,7 +7272,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_atomic_prepare_plane_clear_colors(state);
 
-	intel_fbc_prepare_dirty_rect(state);
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+		intel_fbc_prepare_dirty_rect(state, crtc);
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 		intel_atomic_dsb_finish(state, crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5b6a9315fa8f..b6978135e8ad 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1205,18 +1205,39 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 }
 
 static void
-intel_fbc_dirty_rect_update(struct intel_dsb *dsb, struct intel_fbc *fbc)
+intel_fbc_invalidate_dirty_rect(struct intel_fbc *fbc)
+{
+	lockdep_assert_held(&fbc->lock);
+
+	fbc->state.dirty_rect = DRM_RECT_INIT(0, 0, 0, 0);
+}
+
+static void
+intel_fbc_program_dirty_rect(struct intel_dsb *dsb, struct intel_fbc *fbc,
+			     const struct drm_rect *fbc_dirty_rect)
 {
 	struct intel_display *display = fbc->display;
-	const struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
 
-	lockdep_assert_held(&fbc->lock);
+	drm_WARN_ON(display->drm, fbc_dirty_rect->y2 == 0);
 
 	intel_de_write_dsb(display, dsb, XE3_FBC_DIRTY_RECT(fbc->id),
 			   FBC_DIRTY_RECT_START_LINE(fbc_dirty_rect->y1) |
 			   FBC_DIRTY_RECT_END_LINE(fbc_dirty_rect->y2 - 1));
 }
 
+static void
+intel_fbc_dirty_rect_update(struct intel_dsb *dsb, struct intel_fbc *fbc)
+{
+	const struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
+
+	lockdep_assert_held(&fbc->lock);
+
+	if (!drm_rect_visible(fbc_dirty_rect))
+		return;
+
+	intel_fbc_program_dirty_rect(dsb, fbc, fbc_dirty_rect);
+}
+
 void
 intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
 				  struct intel_plane *plane)
@@ -1236,48 +1257,19 @@ intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
 }
 
 static void
-__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state)
-{
-	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct intel_fbc *fbc = plane->fbc;
-	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
-	int width = drm_rect_width(&plane_state->uapi.src) >> 16;
-	const struct drm_rect *damage = &plane_state->damage;
-	int y_offset = plane_state->view.color_plane[0].y;
-
-	lockdep_assert_held(&fbc->lock);
-
-	if (drm_rect_visible(damage))
-		*fbc_dirty_rect = *damage;
-	else
-		/* dirty rect must cover at least one line */
-		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, 1);
-}
-
-void
-intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state)
+intel_fbc_hw_intialize_dirty_rect(struct intel_fbc *fbc,
+				  const struct intel_plane_state *plane_state)
 {
-	struct intel_display *display = to_intel_display(state);
-	struct intel_plane_state *plane_state;
-	struct intel_plane *plane;
-	int i;
-
-	if (!HAS_FBC_DIRTY_RECT(display))
-		return;
-
-	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
-		struct intel_fbc *fbc = plane->fbc;
+	struct drm_rect src;
 
-		if (!fbc)
-			continue;
-
-		mutex_lock(&fbc->lock);
-
-		if (fbc->state.plane == plane)
-			__intel_fbc_prepare_dirty_rect(plane_state);
+	/*
+	 * Initializing the FBC HW with the whole plane area as the dirty rect.
+	 * This is to ensure that we have valid coords be written to the
+	 * HW as dirty rect.
+	 */
+	drm_rect_fp_to_int(&src, &plane_state->uapi.src);
 
-		mutex_unlock(&fbc->lock);
-	}
+	intel_fbc_program_dirty_rect(NULL, fbc, &src);
 }
 
 static void intel_fbc_update_state(struct intel_atomic_state *state,
@@ -1353,6 +1345,62 @@ static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
 		intel_fbc_is_cfb_ok(plane_state);
 }
 
+static void
+__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
+			       const struct intel_crtc_state *crtc_state)
+{
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct intel_fbc *fbc = plane->fbc;
+	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
+	int width = drm_rect_width(&plane_state->uapi.src) >> 16;
+	const struct drm_rect *damage = &plane_state->damage;
+	int y_offset = plane_state->view.color_plane[0].y;
+
+	lockdep_assert_held(&fbc->lock);
+
+	if (intel_crtc_needs_modeset(crtc_state) ||
+	    !intel_fbc_is_ok(plane_state)) {
+		intel_fbc_invalidate_dirty_rect(fbc);
+		return;
+	}
+
+	if (drm_rect_visible(damage))
+		*fbc_dirty_rect = *damage;
+	else
+		/* dirty rect must cover at least one line */
+		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, 1);
+}
+
+void
+intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
+			     struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	struct intel_plane_state *plane_state;
+	struct intel_plane *plane;
+	int i;
+
+	if (!HAS_FBC_DIRTY_RECT(display))
+		return;
+
+	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
+		struct intel_fbc *fbc = plane->fbc;
+
+		if (!fbc || plane->pipe != crtc->pipe)
+			continue;
+
+		mutex_lock(&fbc->lock);
+
+		if (fbc->state.plane == plane)
+			__intel_fbc_prepare_dirty_rect(plane_state,
+						       crtc_state);
+
+		mutex_unlock(&fbc->lock);
+	}
+}
+
 static int intel_fbc_check_plane(struct intel_atomic_state *state,
 				 struct intel_plane *plane)
 {
@@ -1629,6 +1677,8 @@ static void __intel_fbc_disable(struct intel_fbc *fbc)
 	drm_dbg_kms(display->drm, "Disabling FBC on [PLANE:%d:%s]\n",
 		    plane->base.base.id, plane->base.name);
 
+	intel_fbc_invalidate_dirty_rect(fbc);
+
 	__intel_fbc_cleanup_cfb(fbc);
 
 	fbc->state.plane = NULL;
@@ -1814,6 +1864,9 @@ static void __intel_fbc_enable(struct intel_atomic_state *state,
 
 	intel_fbc_update_state(state, crtc, plane);
 
+	if (HAS_FBC_DIRTY_RECT(display))
+		intel_fbc_hw_intialize_dirty_rect(fbc, plane_state);
+
 	intel_fbc_program_workarounds(fbc);
 	intel_fbc_program_cfb(fbc);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index 08743057ff14..0e715cb6b4e6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -48,7 +48,8 @@ void intel_fbc_handle_fifo_underrun_irq(struct intel_display *display);
 void intel_fbc_reset_underrun(struct intel_display *display);
 void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc);
 void intel_fbc_debugfs_register(struct intel_display *display);
-void intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state);
+void intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc);
 void intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
 				       struct intel_plane *plane);
 
-- 
2.43.0

