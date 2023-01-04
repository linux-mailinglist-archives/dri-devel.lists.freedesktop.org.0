Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7AD65E106
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 00:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429AF10E485;
	Wed,  4 Jan 2023 23:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31E10E0FA;
 Wed,  4 Jan 2023 23:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1672875662; x=1704411662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a46veAPBj53n6l96o0cX76IuRsKf3Uu2NydZZyGYpVw=;
 b=cVEwC3fhWA9L55cSwG0UWMIK0sksyTS2qMgA3Ve71QJ7NVYVqGHjeghb
 iAKIrgirkYMUQe473kO72lP0jFiGnzawz3r2KwTVtOe4PGW/jdxxeCWef
 SyJdbhZmYugXOEdL0T0j1RNszg37Up1u1aTqtbM1OXpoV30yI19w+lN9+ g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Jan 2023 15:41:01 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:41:01 -0800
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 4 Jan 2023 15:40:59 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v3 2/3] drm: Adjust atomic checks for solid fill color
Date: Wed, 4 Jan 2023 15:40:35 -0800
Message-ID: <20230104234036.636-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104234036.636-1-quic_jesszhan@quicinc.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loosen the requirements for atomic and legacy commit so that, in cases
where solid fill planes is enabled (and FB_ID is NULL), the commit can
still go through.

In addition, add framebuffer NULL checks in other areas to account for
FB being NULL when solid fill is enabled.

Changes in V2:
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Fixed indentation issue (Dmitry)

Changes in V3:
- Created drm_plane_has_visible_data() helper and corrected CRTC and FB
  NULL-check logic (Dmitry)
- Merged `if (fb)` blocks in drm_atomic_plane_check() and abstracted
  them into helper method (Dmitry)
- Inverted `if (solid_fill_enabled) else if (fb)` check order (Dmitry)
- Fixed indentation (Dmitry)

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c        | 136 ++++++++++++++++------------
 drivers/gpu/drm/drm_atomic_helper.c |  34 ++++---
 drivers/gpu/drm/drm_plane.c         |   8 +-
 include/drm/drm_atomic_helper.h     |   5 +-
 include/drm/drm_plane.h             |  19 ++++
 5 files changed, 124 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..63f34b430479 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -580,6 +580,76 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 	return true;
 }
 
+static int drm_atomic_check_fb(const struct drm_plane_state *state)
+{
+	struct drm_plane *plane = state->plane;
+	const struct drm_framebuffer *fb = state->fb;
+	struct drm_mode_rect *clips;
+
+	uint32_t num_clips;
+	unsigned int fb_width, fb_height;
+	int ret;
+
+	/* Check whether this plane supports the fb pixel format. */
+	ret = drm_plane_check_pixel_format(plane, fb->format->format,
+					   fb->modifier);
+
+	if (ret) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
+			       plane->base.id, plane->name,
+			       &fb->format->format, fb->modifier);
+		return ret;
+	}
+
+	fb_width = fb->width << 16;
+	fb_height = fb->height << 16;
+
+	/* Make sure source coordinates are inside the fb. */
+	if (state->src_w > fb_width ||
+	    state->src_x > fb_width - state->src_w ||
+	    state->src_h > fb_height ||
+	    state->src_y > fb_height - state->src_h) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] invalid source coordinates "
+			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+			       plane->base.id, plane->name,
+			       state->src_w >> 16,
+			       ((state->src_w & 0xffff) * 15625) >> 10,
+			       state->src_h >> 16,
+			       ((state->src_h & 0xffff) * 15625) >> 10,
+			       state->src_x >> 16,
+			       ((state->src_x & 0xffff) * 15625) >> 10,
+			       state->src_y >> 16,
+			       ((state->src_y & 0xffff) * 15625) >> 10,
+			       fb->width, fb->height);
+		return -ENOSPC;
+	}
+
+	clips = __drm_plane_get_damage_clips(state);
+	num_clips = drm_plane_get_damage_clips_count(state);
+
+	/* Make sure damage clips are valid and inside the fb. */
+	while (num_clips > 0) {
+		if (clips->x1 >= clips->x2 ||
+		    clips->y1 >= clips->y2 ||
+		    clips->x1 < 0 ||
+		    clips->y1 < 0 ||
+		    clips->x2 > fb_width ||
+		    clips->y2 > fb_height) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
+				       plane->base.id, plane->name, clips->x1,
+				       clips->y1, clips->x2, clips->y2);
+			return -EINVAL;
+		}
+		clips++;
+		num_clips--;
+	}
+
+	return 0;
+}
+
 /**
  * drm_atomic_plane_check - check plane state
  * @old_plane_state: old plane state to check
@@ -596,13 +666,12 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	const struct drm_framebuffer *fb = new_plane_state->fb;
-	unsigned int fb_width, fb_height;
-	struct drm_mode_rect *clips;
-	uint32_t num_clips;
 	int ret;
 
-	/* either *both* CRTC and FB must be set, or neither */
-	if (crtc && !fb) {
+	/* When solid_fill is disabled,
+	 * either *both* CRTC and FB must be set, or neither
+	 */
+	if (crtc && !drm_atomic_has_visible_data(new_plane_state)) {
 		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
@@ -625,17 +694,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -EINVAL;
 	}
 
-	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-	if (ret) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
-			       plane->base.id, plane->name,
-			       &fb->format->format, fb->modifier);
-		return ret;
-	}
-
 	/* Give drivers some help against integer overflows */
 	if (new_plane_state->crtc_w > INT_MAX ||
 	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
@@ -649,49 +707,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -ERANGE;
 	}
 
-	fb_width = fb->width << 16;
-	fb_height = fb->height << 16;
 
-	/* Make sure source coordinates are inside the fb. */
-	if (new_plane_state->src_w > fb_width ||
-	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
-	    new_plane_state->src_h > fb_height ||
-	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid source coordinates "
-			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-			       plane->base.id, plane->name,
-			       new_plane_state->src_w >> 16,
-			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_h >> 16,
-			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_x >> 16,
-			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_y >> 16,
-			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
-			       fb->width, fb->height);
-		return -ENOSPC;
-	}
-
-	clips = __drm_plane_get_damage_clips(new_plane_state);
-	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
-
-	/* Make sure damage clips are valid and inside the fb. */
-	while (num_clips > 0) {
-		if (clips->x1 >= clips->x2 ||
-		    clips->y1 >= clips->y2 ||
-		    clips->x1 < 0 ||
-		    clips->y1 < 0 ||
-		    clips->x2 > fb_width ||
-		    clips->y2 > fb_height) {
-			drm_dbg_atomic(plane->dev,
-				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
-				       plane->base.id, plane->name, clips->x1,
-				       clips->y1, clips->x2, clips->y2);
-			return -EINVAL;
-		}
-		clips++;
-		num_clips--;
+	if (fb) {
+		ret = drm_atomic_check_fb(new_plane_state);
+		if (ret)
+			return ret;
 	}
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 1a586b3c454b..804ae107ae59 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!fb) {
+	if (!fb && !drm_plane_solid_fill_enabled(plane_state)) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	if (fb) {
+		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-	/* Check scaling */
-	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
-	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->plane->dev,
-			    "Invalid scaling of plane\n");
-		drm_rect_debug_print("src: ", &plane_state->src, true);
-		drm_rect_debug_print("dst: ", &plane_state->dst, false);
-		return -ERANGE;
+		/* Check scaling */
+		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
+		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+
+		if (hscale < 0 || vscale < 0) {
+			drm_dbg_kms(plane_state->plane->dev,
+					"Invalid scaling of plane\n");
+			drm_rect_debug_print("src: ", &plane_state->src, true);
+			drm_rect_debug_print("dst: ", &plane_state->dst, false);
+			return -ERANGE;
+		}
 	}
 
 	if (crtc_state->enable)
 		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
-	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
-
-	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	if (fb) {
+		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
+		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	} else if (drm_plane_solid_fill_enabled(plane_state)) {
+		plane_state->visible = true;
+	}
 
 	if (!plane_state->visible)
 		/*
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 33357629a7f5..bdce2acbef6a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -856,8 +856,8 @@ static int __setplane_internal(struct drm_plane *plane,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb) {
+	/* No fb and no color fill means shut it down */
+	if (!fb && !drm_plane_solid_fill_enabled(plane->state)) {
 		plane->old_fb = plane->fb;
 		ret = plane->funcs->disable_plane(plane, ctx);
 		if (!ret) {
@@ -908,8 +908,8 @@ static int __setplane_atomic(struct drm_plane *plane,
 
 	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb)
+	/* No fb and no color fill means shut it down */
+	if (!fb && !drm_plane_solid_fill_enabled(plane->state))
 		return plane->funcs->disable_plane(plane, ctx);
 
 	/*
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 33f982cd1a27..a87997b3e0b5 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -230,8 +230,9 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
 	 * Anything else should be considered a bug in the atomic core, so we
 	 * gently warn about it.
 	 */
-	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
-		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
+	WARN_ON(((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
+		(new_plane_state->crtc != NULL &&
+		 !drm_atomic_has_visible_data(new_plane_state))));
 
 	return old_plane_state->crtc && !new_plane_state->crtc;
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 3b9da06f358b..3bc6b8d73e8a 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -977,6 +977,25 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
+/**
+ * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
+ * @state: plane state
+ *
+ * Returns:
+ * Whether the plane has been assigned a solid_fill_blob
+ */
+static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
+{
+	return state && state->solid_fill_blob;
+}
+
+static inline bool
+drm_atomic_has_visible_data(const struct drm_plane_state *state)
+{
+	return state->fb || state->solid_fill_blob;
+}
+
+
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 
-- 
2.38.1

