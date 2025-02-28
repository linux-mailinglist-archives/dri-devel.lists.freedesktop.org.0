Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34CA49562
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7452610EC47;
	Fri, 28 Feb 2025 09:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCj9V3y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2064610EC3F;
 Fri, 28 Feb 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735529; x=1772271529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KkXHNSzZCH7QFHtuSw/vKMrxxO0d/dVtEjIUhN7sER4=;
 b=bCj9V3y2wh5SyijHbYxR89ssVEYchJHuSaUZAgXfw9I+SeXL/WZJR2i3
 OeHam0k+vaVG6bQoSVKfvrQgSjA5BftmkQXZZsO+G4tLxnsaIxZ50JzL2
 PX7l9OdsW9kctAB+vi4tHvdpO06JYNKaaaXrsMfuFzBdV1FAREZZ2p6fE
 ssIJnB4Y1bRfanqkb0nanTbYhFOJOhBUz3ptV5QpdJfN8uNhD3e2A9r0V
 yySFNs/+32EUylUWzJ6f60WJYtO0uzICdAKTLtWtTliNOYDpil4+wSeV9
 eyPoQheaGOYik9zTzOuFn8z0Qnqn+UyW+n2sPe94dY8sbkHjamSD2zch/ g==;
X-CSE-ConnectionGUID: KijjK3DCRcezDK/wb7qnsQ==
X-CSE-MsgGUID: jVYKQqhhTZmRxK1iP/rK3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293099"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293099"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:49 -0800
X-CSE-ConnectionGUID: BXCNKJ2HQV+GTo4eftNAQg==
X-CSE-MsgGUID: btuwvgigToOR65jQavopLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466582"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:46 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 7/9] drm/i915/fbc: dirty rect support for FBC
Date: Fri, 28 Feb 2025 11:38:00 +0200
Message-ID: <20250228093802.27091-8-vinod.govindapillai@intel.com>
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

Dirty rectangle feature allows FBC to recompress a subsection
of a frame. When this feature is enabled, display will read
the scan lines between dirty rectangle start line and dirty
rectangle end line in subsequent frames.

Use the merged damage clip stored in the plane state to
configure the FBC dirty rect areas.

v2: - Move dirty rect handling to fbc state (Ville)

v3: - Use intel_fbc_dirty_rect_update_noarm (Ville)
    - Split plane damage collection and dirty rect preparation
    - Handle case where dirty rect fall outside the visible region

v4: - A state variable to check if we need to update dirty rect
    registers in case intel_fbc_can_flip_nuke() (Ville)

v5: - No need to use a separate valid flag, updates to the
      conditions for prepare damage rect (Ville)
    - Usage of locks in fbc dirty rect related functions (Ville)

v6: - updates dirty rect handling (Ville)

v7: - Loop through all planes in atomic state is good enough (Ville)

Bspec: 68881, 71675, 73424
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 84 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_fbc.h      |  4 +
 4 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 1a3db29d4e60..37fb1859f6b8 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -817,6 +817,9 @@ void intel_plane_update_noarm(struct intel_dsb *dsb,
 
 	trace_intel_plane_update_noarm(plane_state, crtc);
 
+	if (plane->fbc)
+		intel_fbc_dirty_rect_update_noarm(dsb, plane);
+
 	if (plane->update_noarm)
 		plane->update_noarm(dsb, plane, crtc_state, plane_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b795de186602..bdc25b8153e0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7272,6 +7272,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_atomic_prepare_plane_clear_colors(state);
 
+	intel_fbc_prepare_dirty_rect(state);
+
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 		intel_atomic_dsb_finish(state, crtc);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index ca44cec73fd2..ee2d75303e41 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -88,6 +88,7 @@ struct intel_fbc_state {
 	u16 override_cfb_stride;
 	u16 interval;
 	s8 fence_id;
+	struct drm_rect dirty_rect;
 };
 
 struct intel_fbc {
@@ -523,6 +524,9 @@ static void ilk_fbc_deactivate(struct intel_fbc *fbc)
 	struct intel_display *display = fbc->display;
 	u32 dpfc_ctl;
 
+	if (HAS_FBC_DIRTY_RECT(display))
+		intel_de_write(display, XE3_FBC_DIRTY_CTL(fbc->id), 0);
+
 	/* Disable compression */
 	dpfc_ctl = intel_de_read(display, ILK_DPFC_CONTROL(fbc->id));
 	if (dpfc_ctl & DPFC_CTL_EN) {
@@ -665,6 +669,10 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	if (DISPLAY_VER(display) >= 20)
 		intel_de_write(display, ILK_DPFC_CONTROL(fbc->id), dpfc_ctl);
 
+	if (HAS_FBC_DIRTY_RECT(display))
+		intel_de_write(display, XE3_FBC_DIRTY_CTL(fbc->id),
+			       FBC_DIRTY_RECT_EN);
+
 	intel_de_write(display, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | dpfc_ctl);
 }
@@ -1196,6 +1204,82 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 		return i8xx_fbc_tiling_valid(plane_state);
 }
 
+static void
+intel_fbc_dirty_rect_update(struct intel_dsb *dsb, struct intel_fbc *fbc)
+{
+	struct intel_display *display = fbc->display;
+	const struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
+
+	lockdep_assert_held(&fbc->lock);
+
+	intel_de_write_dsb(display, dsb, XE3_FBC_DIRTY_RECT(fbc->id),
+			   FBC_DIRTY_RECT_START_LINE(fbc_dirty_rect->y1) |
+			   FBC_DIRTY_RECT_END_LINE(fbc_dirty_rect->y2 - 1));
+}
+
+void
+intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
+				  struct intel_plane *plane)
+{
+	struct intel_display *display = to_intel_display(plane);
+	struct intel_fbc *fbc = plane->fbc;
+
+	if (!HAS_FBC_DIRTY_RECT(display))
+		return;
+
+	mutex_lock(&fbc->lock);
+
+	if (fbc->state.plane == plane)
+		intel_fbc_dirty_rect_update(dsb, fbc);
+
+	mutex_unlock(&fbc->lock);
+}
+
+static void
+__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state)
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
+	if (drm_rect_visible(damage))
+		*fbc_dirty_rect = *damage;
+	else
+		/* dirty rect must cover at least one line */
+		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, 1);
+}
+
+void
+intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state)
+{
+	struct intel_display *display = to_intel_display(state);
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
+		if (!fbc)
+			continue;
+
+		mutex_lock(&fbc->lock);
+
+		if (fbc->state.plane == plane)
+			__intel_fbc_prepare_dirty_rect(plane_state);
+
+		mutex_unlock(&fbc->lock);
+	}
+}
+
 static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index 2e1dd7e8a18f..08743057ff14 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -13,6 +13,7 @@ struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
 struct intel_display;
+struct intel_dsb;
 struct intel_fbc;
 struct intel_plane;
 struct intel_plane_state;
@@ -47,5 +48,8 @@ void intel_fbc_handle_fifo_underrun_irq(struct intel_display *display);
 void intel_fbc_reset_underrun(struct intel_display *display);
 void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc);
 void intel_fbc_debugfs_register(struct intel_display *display);
+void intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state);
+void intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
+				       struct intel_plane *plane);
 
 #endif /* __INTEL_FBC_H__ */
-- 
2.43.0

