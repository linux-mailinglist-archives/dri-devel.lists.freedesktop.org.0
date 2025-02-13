Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B37A34054
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A952F10EAA3;
	Thu, 13 Feb 2025 13:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fL+MidDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3399110EAA3;
 Thu, 13 Feb 2025 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739453207; x=1770989207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xdx0CT07y1wYRHVQedmpi42q4XkY1UU42Uu+Mj0oY3Q=;
 b=fL+MidDZqwuay81RSZu3O5ytP2aWfDm2b6nIff1NO5+whGoxaNQfRJiz
 VyXwAGGdEM85XZbckwavfCl0qKkkU9hdAe3L1JFPTLV5942ecD0/aI6Eu
 7IgvFBs8wLZIPOsYxc6MBPIlEsdXiFw23qhR1SjXpWWZWYoyhZaCRwLs2
 I8xCuB2Sj9nyOvYwEjeBrajKN7xYR72XtPq4i7K4SdqnNs/G2ijt6mmEs
 l/Xp4MbNqRClfX7P7JMJPIp/Wu93LtkJN8KSolPlnnij0KfbAchsRY59K
 gzlk9RillJng0PEJxEioJQxXPqOkE3LlJ6qhvJ62nd9YNWWYWEt2Ca6N4 w==;
X-CSE-ConnectionGUID: VHsNIbFkTdiIKFkS7bqBPA==
X-CSE-MsgGUID: 4Ac9VWbjSgqCXxthGEdPXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40025429"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40025429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:47 -0800
X-CSE-ConnectionGUID: 8RfigxAPQaO4qa8ab7NjnQ==
X-CSE-MsgGUID: a1tg2zP5Ssevm51yrCFe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113014347"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:41 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v8 6/7] drm/i915/fbc: dirty rect support for FBC
Date: Thu, 13 Feb 2025 15:25:57 +0200
Message-ID: <20250213132559.136815-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213132559.136815-1-vinod.govindapillai@intel.com>
References: <20250213132559.136815-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
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

Bspec: 68881, 71675, 73424
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  3 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 85 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_fbc.h      |  5 ++
 4 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 2278412200fd..041e1d9ef621 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -803,6 +803,9 @@ void intel_plane_update_noarm(struct intel_dsb *dsb,
 
 	trace_intel_plane_update_noarm(plane_state, crtc);
 
+	if (plane->fbc)
+		intel_fbc_dirty_rect_update_noarm(dsb, plane);
+
 	if (plane->update_noarm)
 		plane->update_noarm(dsb, plane, crtc_state, plane_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cc51576353fe..dd801b9d9a52 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7783,6 +7783,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_atomic_prepare_plane_clear_colors(state);
 
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+		intel_fbc_prepare_dirty_rect(state, crtc);
+
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 		intel_atomic_dsb_finish(state, crtc);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index d2917e017e7b..66a5ee10a649 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -88,6 +88,7 @@ struct intel_fbc_state {
 	u16 override_cfb_stride;
 	u16 interval;
 	s8 fence_id;
+	struct drm_rect dirty_rect;
 };
 
 struct intel_fbc {
@@ -527,6 +528,9 @@ static void ilk_fbc_deactivate(struct intel_fbc *fbc)
 	struct intel_display *display = fbc->display;
 	u32 dpfc_ctl;
 
+	if (HAS_FBC_DIRTY_RECT(display))
+		intel_de_write(display, XE3_FBC_DIRTY_CTL(fbc->id), 0);
+
 	/* Disable compression */
 	dpfc_ctl = intel_de_read(display, ILK_DPFC_CONTROL(fbc->id));
 	if (dpfc_ctl & DPFC_CTL_EN) {
@@ -670,6 +674,10 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	if (DISPLAY_VER(display) >= 20)
 		intel_de_write(display, ILK_DPFC_CONTROL(fbc->id), dpfc_ctl);
 
+	if (HAS_FBC_DIRTY_RECT(display))
+		intel_de_write(display, XE3_FBC_DIRTY_CTL(fbc->id),
+			       FBC_DIRTY_RECT_EN);
+
 	intel_de_write(display, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | dpfc_ctl);
 }
@@ -1214,6 +1222,83 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 		return i8xx_fbc_tiling_valid(plane_state);
 }
 
+static void
+intel_fbc_dirty_rect_update(struct intel_dsb *dsb, struct intel_fbc *fbc)
+{
+	struct intel_display *display = fbc->display;
+	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
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
+__intel_fbc_prepare_dirty_rect(struct intel_plane *plane,
+			       struct intel_plane_state *plane_state)
+{
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
+intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
+			     struct intel_crtc *crtc)
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
+		if (!fbc || plane->pipe != crtc->pipe)
+			continue;
+
+		mutex_lock(&fbc->lock);
+
+		if (fbc->state.plane == plane)
+			__intel_fbc_prepare_dirty_rect(plane, plane_state);
+
+		mutex_unlock(&fbc->lock);
+	}
+}
+
 static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index ceae55458e14..fe48d0276eec 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -14,6 +14,7 @@ struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
 struct intel_display;
+struct intel_dsb;
 struct intel_fbc;
 struct intel_plane;
 struct intel_plane_state;
@@ -48,5 +49,9 @@ void intel_fbc_handle_fifo_underrun_irq(struct intel_display *display);
 void intel_fbc_reset_underrun(struct intel_display *display);
 void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc);
 void intel_fbc_debugfs_register(struct intel_display *display);
+void intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc);
+void intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
+				       struct intel_plane *plane);
 
 #endif /* __INTEL_FBC_H__ */
-- 
2.43.0

