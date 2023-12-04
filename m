Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB8803430
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C2810E25C;
	Mon,  4 Dec 2023 13:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB36F10E1C2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:14:58 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so2382272e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695697; x=1702300497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVE0MrZ/Z1PMJKWIuIoj0orbQq8vDOJ1IdPtnhEZDN8=;
 b=E6jlpbg8stN9NC2gNBz96sRG8Q30JCF9xEs6Wz4hmeWVxHkbuG0JDeJwqHiEqNiqZ0
 FhJvzHShXChU5N1IQmpy7hKfGojjeYNdg0nEIlVDUunWw5j10sv+F0scbDv7S37RGA7d
 FoGEOSZcf9H5DYnRjSx7QJ3Rak6z2qrEMJg7N4PZAFzRHJDsJtQY3MBoJEW+ulHDnr7V
 Dzj6SWXYD0sCiFMmpDUEr+urTv8Letb8CzWruuU+y35C0csmKJo9RLFRe7bHwjNwZqk9
 7Eap9IOeQyH6aeE90pLmy8S2XacWeftMPlN4YPk1OhDna7z14JLdWICBmI9m1+cQv1Gt
 jIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695697; x=1702300497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVE0MrZ/Z1PMJKWIuIoj0orbQq8vDOJ1IdPtnhEZDN8=;
 b=gy6hE4NVZFq2eGDUL7KLMMnsiBnXO9unvxuyWcO10tXeIFMvP9p+fQLm0F+thyq10A
 XUjKnzRzDANgUhVlueflEUB5p7muYpKb0Js6FEX1jwap92egkV+PRQ4GgCUCCJkZ8MtZ
 3d9poh1ZARgAuDUzMze4rFjgPYHr7oILgNFENBvPJIdu61TQxll8SueVE7C4B2HQthbe
 UD4uZK3X8d+Ssi3qhaZ1fKswkNAdy62QmLvQHw0J5jmO0J8d42ZpZFcf9vHyLygQ+6ow
 arogCMKbTwR3lXUz+7GB6n9NwlJhKigUC51uY9np58j7rvqwb9bdEiXbfv99jmuNaxE6
 UiFA==
X-Gm-Message-State: AOJu0YyuYb44FdMip8P6x7J6NnGdj3BVNImlpiI3JuN2+VUdnY31wk7q
 iT7p0fQV6wrmKyGca1ReGVVV5g==
X-Google-Smtp-Source: AGHT+IFbnzLL5kvbNu3hFZr38ebzR2vOt0bRGr/9qSkFhL4oCDnaglGfVyi8Lm/PwHuhvI/W9spRhQ==
X-Received: by 2002:a05:6512:3a85:b0:50b:bf99:b656 with SMTP id
 q5-20020a0565123a8500b0050bbf99b656mr3690541lfu.14.1701695697068; 
 Mon, 04 Dec 2023 05:14:57 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/7] Revert "drm/atomic: Loosen FB atomic checks"
Date: Mon,  4 Dec 2023 15:13:48 +0200
Message-ID: <20231204131455.19023-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit f1e75da5364e780905d9cd6043f9c74cdcf84073.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        | 21 ++++++++--------
 drivers/gpu/drm/drm_atomic_helper.c | 39 +++++++++++++----------------
 include/drm/drm_atomic_helper.h     |  4 +--
 include/drm/drm_plane.h             | 29 ---------------------
 4 files changed, 29 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index aed0a694c74c..c6f2b86c48ae 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -674,16 +674,17 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 {
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
+	const struct drm_framebuffer *fb = new_plane_state->fb;
 	int ret;
 
-	/* either *both* CRTC and pixel source must be set, or neither */
-	if (crtc && !drm_plane_has_visible_data(new_plane_state)) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no visible data\n",
+	/* either *both* CRTC and FB must be set, or neither */
+	if (crtc && !fb) {
+		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
-	} else if (drm_plane_has_visible_data(new_plane_state) && !crtc) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] Source %d has visible data but no CRTC\n",
-			       plane->base.id, plane->name, new_plane_state->pixel_source);
+	} else if (fb && !crtc) {
+		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
+			       plane->base.id, plane->name);
 		return -EINVAL;
 	}
 
@@ -714,11 +715,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 
-	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
-		ret = drm_atomic_plane_check_fb(new_plane_state);
-		if (ret)
-			return ret;
-	}
+	ret = drm_atomic_plane_check_fb(new_plane_state);
+	if (ret)
+		return ret;
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
 		drm_dbg_atomic(plane->dev,
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index dc048988e3f3..c3f677130def 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -861,6 +861,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					bool can_position,
 					bool can_update_disabled)
 {
+	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect *src = &plane_state->src;
 	struct drm_rect *dst = &plane_state->dst;
 	unsigned int rotation = plane_state->rotation;
@@ -872,7 +873,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!drm_plane_has_visible_data(plane_state)) {
+	if (!fb) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -889,31 +890,25 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	/* Check that selected pixel source is valid */
-	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && plane_state->fb) {
-		struct drm_framebuffer *fb = plane_state->fb;
-		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-		/* Check scaling */
-		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+	/* Check scaling */
+	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
+	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+	if (hscale < 0 || vscale < 0) {
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Invalid scaling of plane\n");
+		drm_rect_debug_print("src: ", &plane_state->src, true);
+		drm_rect_debug_print("dst: ", &plane_state->dst, false);
+		return -ERANGE;
+	}
 
-		if (hscale < 0 || vscale < 0) {
-			drm_dbg_kms(plane_state->plane->dev,
-					"Invalid scaling of plane\n");
-			drm_rect_debug_print("src: ", &plane_state->src, true);
-			drm_rect_debug_print("dst: ", &plane_state->dst, false);
-			return -ERANGE;
-		}
+	if (crtc_state->enable)
+		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
-		if (crtc_state->enable)
-			drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
+	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
 
-		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
-		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
-	} else if (drm_plane_solid_fill_enabled(plane_state)) {
-		plane_state->visible = true;
-	}
+	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
 
 	if (!plane_state->visible)
 		/*
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 6d97f38ac1f6..536a0b0091c3 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -256,8 +256,8 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
 	 * Anything else should be considered a bug in the atomic core, so we
 	 * gently warn about it.
 	 */
-	WARN_ON((new_plane_state->crtc == NULL && drm_plane_has_visible_data(new_plane_state)) ||
-		(new_plane_state->crtc != NULL && !drm_plane_has_visible_data(new_plane_state)));
+	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
+		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
 
 	return old_plane_state->crtc && !new_plane_state->crtc;
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 3b187f3f5466..d14e2f1db234 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1016,35 +1016,6 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
-/**
- * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
- * @state: plane state
- *
- * Returns:
- * Whether the plane has been assigned a solid_fill_blob
- */
-static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
-{
-	if (!state)
-		return false;
-	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && state->solid_fill_blob;
-}
-
-static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
-{
-	switch (state->pixel_source) {
-	case DRM_PLANE_PIXEL_SOURCE_NONE:
-		return false;
-	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
-		return state->solid_fill_blob != NULL;
-	case DRM_PLANE_PIXEL_SOURCE_FB:
-	default:
-		WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
-	}
-
-	return state->fb != NULL;
-}
-
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 
-- 
2.42.0

