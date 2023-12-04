Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC265803437
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5710E1CB;
	Mon,  4 Dec 2023 13:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6C510E256
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:15:02 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-50abbb23122so5889533e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695701; x=1702300501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVHaYi0jy/tlT5EMDXsSuRdJ6IgFD0FUO3NRg1JHL1w=;
 b=cbkKZJCkzjmpxdRrPRMTjHwkqJJKGkA6qircKC0nzAeLEaGAFV9viEQxY6xrPSQ0q4
 uMaUEuLEEy15COQV6Vxk95OqNivECwDNptnJwDtG6Qv0Wv9z4a9Q+N2C/Kk5GcUa3Q9R
 6VsR01T9CuMbbttJeIvyq1SsaZl0VpQEcKHvuaL6OhJQOOL29pRgf/ptv03T7ZdJy4nq
 vvj60XquHnL5s0ypSarD1WzxanPBxavz1s55+nlaGvjkdM+WCdJD/ANHdROmmzYtzC0h
 FJ6VRa19q9XpuQe6Do+MkJ282JAgoVn3Z/DYMoM+NUjNSMfC+59+ClyTPY6JxruWad27
 mRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695701; x=1702300501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVHaYi0jy/tlT5EMDXsSuRdJ6IgFD0FUO3NRg1JHL1w=;
 b=tsIo4cylcEtdCs6kySUSkYkKBoGYDU9uF9xQHStLv/UOY62Yt62hBtrgnsDShKQqME
 s5t8sUkZfeb5lt9dCfVZTuYQZDcO8G8PlFA3z5Id3vTSGgom1HdtTimWSEV+aRuTHlkg
 Kib8Vx0mjnroJr6somTe/ZiJ5ZJMrODMIQB0gC7tJL7DzPUl2U1OZjRwg5zUXLt2bkrY
 CtZ1QUWLWuh5XBMp24B40Uw+C4m7JBqFb3Ku/gFexJMkYM0OuJslyaEp/BEtbSrU1/i/
 VCjwnkhM692KwSXxk4jzTSXRzIkzLahaw7fgCB8URsDkQr7G5J2Z9ExEhXc7ArviX3h+
 6RjA==
X-Gm-Message-State: AOJu0YyrCxawjMkJqtqCM50p/thVmtLLjciDkt/+iRfW/DGZUjCUg3pa
 cy0pWOKTzXZGbpC0JYcDJBsbow==
X-Google-Smtp-Source: AGHT+IF65vFqR0p8Yerzz9WouzESWlpxWijcWGiCoHJ0HUJQBJX0wy6dFh0Qfp+Zxx33t8cTxX69vQ==
X-Received: by 2002:ac2:4847:0:b0:50b:e8ef:5561 with SMTP id
 7-20020ac24847000000b0050be8ef5561mr1242889lfy.39.1701695700919; 
 Mon, 04 Dec 2023 05:15:00 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:15:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/7] Revert "drm: Introduce solid fill DRM plane property"
Date: Mon,  4 Dec 2023 15:13:53 +0200
Message-ID: <20231204131455.19023-7-dmitry.baryshkov@linaro.org>
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

This reverts commit 85863a4e16e77079ee14865905ddc3ef9483a640.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 ------
 drivers/gpu/drm/drm_atomic_uapi.c         | 26 ----------------
 drivers/gpu/drm/drm_blend.c               | 30 -------------------
 include/drm/drm_blend.h                   |  1 -
 include/drm/drm_plane.h                   | 36 -----------------------
 include/uapi/drm/drm_mode.h               | 24 ---------------
 6 files changed, 126 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index f6c76cea8be4..311b04edf742 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -254,11 +254,6 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
 	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
 
-	if (plane_state->solid_fill_blob) {
-		drm_property_blob_put(plane_state->solid_fill_blob);
-		plane_state->solid_fill_blob = NULL;
-	}
-
 	if (plane->color_encoding_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->color_encoding_property,
@@ -355,9 +350,6 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	if (state->fb)
 		drm_framebuffer_get(state->fb);
 
-	if (state->solid_fill_blob)
-		drm_property_blob_get(state->solid_fill_blob);
-
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
@@ -407,7 +399,6 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 		drm_crtc_commit_put(state->commit);
 
 	drm_property_blob_put(state->fb_damage_clips);
-	drm_property_blob_put(state->solid_fill_blob);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d7ae8e2c0265..bd7140531948 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -316,20 +316,6 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
 
-static void drm_atomic_set_solid_fill_prop(struct drm_plane_state *state)
-{
-	struct drm_mode_solid_fill *user_info;
-
-	if (!state->solid_fill_blob)
-		return;
-
-	user_info = (struct drm_mode_solid_fill *)state->solid_fill_blob->data;
-
-	state->solid_fill.r = user_info->r;
-	state->solid_fill.g = user_info->g;
-	state->solid_fill.b = user_info->b;
-}
-
 static void set_out_fence_for_crtc(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc, s32 __user *fence_ptr)
 {
@@ -578,15 +564,6 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_h = val;
 	} else if (property == plane->pixel_source_property) {
 		state->pixel_source = val;
-	} else if (property == plane->solid_fill_property) {
-		ret = drm_atomic_replace_property_blob_from_id(dev,
-				&state->solid_fill_blob,
-				val, sizeof(struct drm_mode_solid_fill),
-				-1, &replaced);
-		if (ret)
-			return ret;
-
-		drm_atomic_set_solid_fill_prop(state);
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -677,9 +654,6 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_h;
 	} else if (property == plane->pixel_source_property) {
 		*val = state->pixel_source;
-	} else if (property == plane->solid_fill_property) {
-		*val = state->solid_fill_blob ?
-			state->solid_fill_blob->base.id : 0;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 665c5d9b056f..fce734cdb85b 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -204,10 +204,6 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
- * solid_fill:
- *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
- *	contains pixel data that drivers can use to fill a plane.
- *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
@@ -713,29 +709,3 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
-
-/**
- * drm_plane_create_solid_fill_property - create a new solid_fill property
- * @plane: drm plane
- *
- * This creates a new property blob that holds pixel data for solid fill planes.
- * The property is exposed to userspace as a property blob called "solid_fill".
- *
- * For information on what the blob contains, see `drm_mode_solid_fill`.
- */
-int drm_plane_create_solid_fill_property(struct drm_plane *plane)
-{
-	struct drm_property *prop;
-
-	prop = drm_property_create(plane->dev,
-			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
-			"solid_fill", 0);
-	if (!prop)
-		return -ENOMEM;
-
-	drm_object_attach_property(&plane->base, prop, 0);
-	plane->solid_fill_property = prop;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index e7158fbee389..122bbfbaae33 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -60,5 +60,4 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
 int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 					   unsigned long extra_sources);
-int drm_plane_create_solid_fill_property(struct drm_plane *plane);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 5bac644d4cc3..bc0176ba25be 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -46,18 +46,6 @@ enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 
-/**
- * struct solid_fill_property - RGB values for solid fill plane
- *
- * TODO: Add solid fill source and corresponding pixel source
- *       that supports RGBA color
- */
-struct drm_solid_fill {
-	uint32_t r;
-	uint32_t g;
-	uint32_t b;
-};
-
 /**
  * struct drm_plane_state - mutable plane state
  *
@@ -146,23 +134,6 @@ struct drm_plane_state {
 	 */
 	enum drm_plane_pixel_source pixel_source;
 
-	/**
-	 * @solid_fill_blob:
-	 *
-	 * Blob containing relevant information for a solid fill plane
-	 * including RGB color values. See
-	 * drm_plane_create_solid_fill_property() for more details.
-	 */
-	struct drm_property_blob *solid_fill_blob;
-
-	/**
-	 * @solid_fill:
-	 *
-	 * Pixel data for solid fill planes. See
-	 * drm_plane_create_solid_fill_property() for more details.
-	 */
-	struct drm_solid_fill solid_fill;
-
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -763,13 +734,6 @@ struct drm_plane {
 	 */
 	struct drm_property *pixel_source_property;
 
-	/**
-	 * @solid_fill_property:
-	 * Optional solid_fill property for this plane. See
-	 * drm_plane_create_solid_fill_property().
-	 */
-	struct drm_property *solid_fill_property;
-
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbd943a8c88b..95630f170110 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -259,30 +259,6 @@ struct drm_mode_modeinfo {
 	char name[DRM_DISPLAY_MODE_LEN];
 };
 
-/**
- * struct drm_mode_solid_fill - User info for solid fill planes
- *
- * This is the userspace API solid fill information structure.
- *
- * Userspace can enable solid fill planes by assigning the plane "solid_fill"
- * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
- * color and setting the pixel source to "SOLID_FILL".
- *
- * For information on the plane property, see drm_plane_create_solid_fill_property()
- *
- * @r: Red color value of single pixel
- * @g: Green color value of single pixel
- * @b: Blue color value of single pixel
- * @pad: padding, must be zero
- */
-struct drm_mode_solid_fill {
-	__u32 r;
-	__u32 g;
-	__u32 b;
-	__u32 pad;
-};
-
-
 struct drm_mode_card_res {
 	__u64 fb_id_ptr;
 	__u64 crtc_id_ptr;
-- 
2.42.0

