Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897825DF50
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398BF6EC87;
	Fri,  4 Sep 2020 16:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0D76EC81
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so6558964wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRZciNRwCAQh1px57fJ2mNISje9WPU175M4akPocCGg=;
 b=du5+hjAakIxve/ox+xcXdhX+i7lgzau7Xp45K9YbFYQwcE9p+zLmsnmYQ96Cih9Vuf
 rF/S8mkbXq2XQXu3Zw3ujwGPfq+G1DxUbd7z1NLoa0v5s0TEesDrtT/OT2myK5qe8fN2
 bUcBHg8HHTd6cXYSpWAHYIwJguDghdsArVz04E1ElfIQTevypu7qcgYLqA0EzTxCcOuh
 CTRuansyeb/NUByglg/ljGEVtO/7KHns9Q2tcHfn2UbBShNqqdVq2jhkcHMEyV3DtuyU
 9ixlHZM3D1Cd7sq81kaIOr+j/u8WstRSol0BKubGCeb3gbM8WoSnRDBEuJNbGmQIpLJ0
 DxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRZciNRwCAQh1px57fJ2mNISje9WPU175M4akPocCGg=;
 b=k0EyaY/ciLhkwy93Dp6cn4UY9AfSS/RTVoOfYy/y9OqfTmqhGD/s3Btui+khomPGMg
 ZM0sMTSBCm/gfEDZYY3B+E8cqrz1HsFgharfuC75wO+MB97wqRfAFfyfEjx3C5tuyriy
 WSHleastN1QbM1bWbF9BPaFcqJc3vn9hwVNq12Jwmnx5ytei2cttPBaMWJeU+xc49IBQ
 /J0xvDHe6X/savArw81uA4iexOwgk/FquWThcHcJFWUaVoI30XeEqxYv+Jo356Rbwdtq
 3Q8Zf8VwB8Cf31sZGgqY9MZ+6BLRCoZ0dSe80njYlXJ9fOM6fap2AV/TN7pmx1TJ7zh+
 MeaA==
X-Gm-Message-State: AOAM533vatE9P1XUBzueEmRBY7rQxwtDmjtVMVX8vkNc7+Ho3hLbLN/S
 J7K2xDHciH7UqtBcXMq1Q79Srw==
X-Google-Smtp-Source: ABdhPJwTRStxENimPQ2zVIFYqh4l93+uodbmzEzMy1AVVm3aK8lbEhV3R5KUHYKfWCQ82Cb9KBhhXA==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr8212408wmf.131.1599235634112; 
 Fri, 04 Sep 2020 09:07:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:13 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/11] drm/amd/display: Store tiling_flags in the
 framebuffer.
Date: Fri,  4 Sep 2020 18:07:03 +0200
Message-Id: <20200904160709.123970-6-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This moves the tiling_flags to the framebuffer creation.
This way the time of the "tiling" decision is the same as it
would be with modifiers.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 48 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 73 +++----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 -
 4 files changed, 59 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 68e658998b55..638ce7528d30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -537,6 +537,39 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	return domain;
 }
 
+static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
+				      uint64_t *tiling_flags, bool *tmz_surface)
+{
+	struct amdgpu_bo *rbo;
+	int r;
+
+	if (!amdgpu_fb) {
+		*tiling_flags = 0;
+		*tmz_surface = false;
+		return 0;
+	}
+
+	rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
+	r = amdgpu_bo_reserve(rbo, false);
+
+	if (unlikely(r)) {
+		/* Don't show error message when returning -ERESTARTSYS */
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("Unable to reserve buffer: %d\n", r);
+		return r;
+	}
+
+	if (tiling_flags)
+		amdgpu_bo_get_tiling_flags(rbo, tiling_flags);
+
+	if (tmz_surface)
+		*tmz_surface = amdgpu_bo_encrypted(rbo);
+
+	amdgpu_bo_unreserve(rbo);
+
+	return r;
+}
+
 int amdgpu_display_framebuffer_init(struct drm_device *dev,
 				    struct amdgpu_framebuffer *rfb,
 				    const struct drm_mode_fb_cmd2 *mode_cmd,
@@ -546,11 +579,18 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	rfb->base.obj[0] = obj;
 	drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
 	ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
-	if (ret) {
-		rfb->base.obj[0] = NULL;
-		return ret;
-	}
+	if (ret)
+		goto fail;
+
+	ret = amdgpu_display_get_fb_info(rfb, &rfb->tiling_flags, &rfb->tmz_surface);
+	if (ret)
+		goto fail;
+
 	return 0;
+
+fail:
+	rfb->base.obj[0] = NULL;
+	return ret;
 }
 
 struct drm_framebuffer *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index aa3e22be4f2d..b0d57e3c8c6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -303,6 +303,9 @@ struct amdgpu_display_funcs {
 struct amdgpu_framebuffer {
 	struct drm_framebuffer base;
 
+	uint64_t tiling_flags;
+	bool tmz_surface;
+
 	/* caching for later use */
 	uint64_t address;
 };
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d06acaea16e8..72e16aa03504 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3687,39 +3687,6 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
 	return 0;
 }
 
-static int get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
-		       uint64_t *tiling_flags, bool *tmz_surface)
-{
-	struct amdgpu_bo *rbo;
-	int r;
-
-	if (!amdgpu_fb) {
-		*tiling_flags = 0;
-		*tmz_surface = false;
-		return 0;
-	}
-
-	rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
-	r = amdgpu_bo_reserve(rbo, false);
-
-	if (unlikely(r)) {
-		/* Don't show error message when returning -ERESTARTSYS */
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("Unable to reserve buffer: %d\n", r);
-		return r;
-	}
-
-	if (tiling_flags)
-		amdgpu_bo_get_tiling_flags(rbo, tiling_flags);
-
-	if (tmz_surface)
-		*tmz_surface = amdgpu_bo_encrypted(rbo);
-
-	amdgpu_bo_unreserve(rbo);
-
-	return r;
-}
-
 static inline uint64_t get_dcc_address(uint64_t address, uint64_t tiling_flags)
 {
 	uint32_t offset = AMDGPU_TILING_GET(tiling_flags, DCC_OFFSET_256B);
@@ -4127,7 +4094,7 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 				    struct drm_crtc_state *crtc_state)
 {
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
-	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	struct amdgpu_framebuffer *afb = (struct amdgpu_framebuffer *)plane_state->fb;
 	struct dc_scaling_info scaling_info;
 	struct dc_plane_info plane_info;
 	int ret;
@@ -4144,10 +4111,10 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 
 	force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
 	ret = fill_dc_plane_info_and_addr(adev, plane_state,
-					  dm_plane_state->tiling_flags,
+					  afb->tiling_flags,
 					  &plane_info,
 					  &dc_plane_state->address,
-					  dm_plane_state->tmz_surface,
+					  afb->tmz_surface,
 					  force_disable_dcc);
 	if (ret)
 		return ret;
@@ -5762,10 +5729,6 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		dc_plane_state_retain(dm_plane_state->dc_state);
 	}
 
-	/* Framebuffer hasn't been updated yet, so retain old flags. */
-	dm_plane_state->tiling_flags = old_dm_plane_state->tiling_flags;
-	dm_plane_state->tmz_surface = old_dm_plane_state->tmz_surface;
-
 	return &dm_plane_state->base;
 }
 
@@ -5870,10 +5833,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 
 		fill_plane_buffer_attributes(
 			adev, afb, plane_state->format, plane_state->rotation,
-			dm_plane_state_new->tiling_flags,
+			afb->tiling_flags,
 			&plane_state->tiling_info, &plane_state->plane_size,
 			&plane_state->dcc, &plane_state->address,
-			dm_plane_state_new->tmz_surface, force_disable_dcc);
+			afb->tmz_surface, force_disable_dcc);
 	}
 
 	return 0;
@@ -7131,6 +7094,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct drm_crtc *crtc = new_plane_state->crtc;
 		struct drm_crtc_state *new_crtc_state;
 		struct drm_framebuffer *fb = new_plane_state->fb;
+		struct amdgpu_framebuffer *afb = (struct amdgpu_framebuffer *)fb;
 		bool plane_needs_flip;
 		struct dc_plane_state *dc_plane;
 		struct dm_plane_state *dm_new_plane_state = to_dm_plane_state(new_plane_state);
@@ -7185,10 +7149,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
-			dm_new_plane_state->tiling_flags,
+			afb->tiling_flags,
 			&bundle->plane_infos[planes_count],
 			&bundle->flip_addrs[planes_count].address,
-			dm_new_plane_state->tmz_surface, false);
+			afb->tmz_surface, false);
 
 		DRM_DEBUG_DRIVER("plane: id=%d dcc_en=%d\n",
 				 new_plane_state->plane->index,
@@ -8339,8 +8303,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	 * TODO: Come up with a more elegant solution for this.
 	 */
 	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
-		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
-
+		struct amdgpu_framebuffer *old_afb, *new_afb;
 		if (other->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -8384,12 +8347,11 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (old_other_state->fb->format != new_other_state->fb->format)
 			return true;
 
-		old_dm_plane_state = to_dm_plane_state(old_other_state);
-		new_dm_plane_state = to_dm_plane_state(new_other_state);
+		old_afb = (struct amdgpu_framebuffer *)old_other_state->fb;
+		new_afb = (struct amdgpu_framebuffer *)new_other_state->fb;
 
 		/* Tiling and DCC changes also require bandwidth updates. */
-		if (old_dm_plane_state->tiling_flags !=
-		    new_dm_plane_state->tiling_flags)
+		if (old_afb->tiling_flags != new_afb->tiling_flags)
 			return true;
 	}
 
@@ -8713,17 +8675,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		}
 	}
 
-	/* Prepass for updating tiling flags on new planes. */
-	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
-		struct dm_plane_state *new_dm_plane_state = to_dm_plane_state(new_plane_state);
-		struct amdgpu_framebuffer *new_afb = to_amdgpu_framebuffer(new_plane_state->fb);
-
-		ret = get_fb_info(new_afb, &new_dm_plane_state->tiling_flags,
-				  &new_dm_plane_state->tmz_surface);
-		if (ret)
-			goto fail;
-	}
-
 	/* Remove exiting planes if they are modified */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		ret = dm_update_plane_state(dc, state, plane,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 4da7cd065ba0..16455898972e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -412,8 +412,6 @@ struct dc_plane_state;
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
-	uint64_t tiling_flags;
-	bool tmz_surface;
 };
 
 struct dm_crtc_state {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
