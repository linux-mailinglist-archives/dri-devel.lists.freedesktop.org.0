Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCB2E6A16
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 19:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1E7894C0;
	Mon, 28 Dec 2020 18:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A3A894C0;
 Mon, 28 Dec 2020 18:51:23 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j22so15293434eja.13;
 Mon, 28 Dec 2020 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mc229IissoQmaen66X8qdODmja7SwcQzxdxjY13TL+4=;
 b=QuWQlYbniWilFYw3kEBza3FYUou70Z0e3ozDzussLs2Wbr5/fR7LybQwTVQWQHGYjk
 cMdB05yQ9CPI02W/vWFgCYyAXUJjSY33qzLsl9vZD9vCcoXH/mAAlSaoAJVXTDx02/pW
 Qmkr0UluD7Q2ILix9XylzGMUGl66gSg4hZYBGWcxOEHX2R/b7xmL+NhmHLp3mxRgDh0H
 XH8U26Y6xX6j+7TefogqIcQItEjMZfoEL/AMXzLxQGxU5q04jLjdRe++23EJkYMEWPOb
 /4L6mnTMAduieAQj9XGxdkPIRqgKiwZOsQHnmPFZHu7nsEj7MJlexCKr95ki0/gt/wfh
 Z5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mc229IissoQmaen66X8qdODmja7SwcQzxdxjY13TL+4=;
 b=bkxiGQ8vFldJU09j0N6+BD5nHs5xhv2vzqqadgfD47xMTXz/Fa7SPvxYjLdmSa2WUK
 c7oruvSkD7hVOjKbOsiMdVVrc7enyCp0hOJhQIk5aM6S429c5je2eu8tsmOODb1mg0Ae
 7oKnsSHR/f6OeYc7fVXDkqO6MLgF9Wrg41eKy+bnNNbDcTkquBuy3fw/GicWAkA+mAb9
 4HtrzO2cFcEMrjVMfP664tShxPK3HZ3PfJcGSiMp8Kt1yoZC3s72RyyeEUa8Gz9c2GKx
 ocwhj9b+0pcblKRTg8I6ehKo1YI2jtZqNNsb6JRw7Bhlt2UGRzSI5v8OPkHEZ2owdu8E
 We9Q==
X-Gm-Message-State: AOAM532YUrFIKJmdtZo9gDFRmUqBHfgMIKuvDFJTUXCYF523UJxKW1r4
 6PlY8K857ldzp2G+w5Yhb+OVADLF9jQ=
X-Google-Smtp-Source: ABdhPJxVDSHF+KLvcX5A+hnpxkGhOgvlxDzmDqutq1WlYaN7Y+32DqI85s/JkGXZKPijn5RJcKTqtw==
X-Received: by 2002:a17:906:5fc9:: with SMTP id
 k9mr41599492ejv.70.1609181481866; 
 Mon, 28 Dec 2020 10:51:21 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8030-6e00-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:8030:6e00:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id x4sm37031432edr.40.2020.12.28.10.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 10:51:21 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: Check plane scaling against format
 specific hw plane caps.
Date: Mon, 28 Dec 2020 19:50:58 +0100
Message-Id: <20201228185059.3949-2-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This takes hw constraints specific to pixel formats into account,
e.g., the inability of older hw to scale fp16 format framebuffers.

It should now allow safely to enable fp16 formats also on DCE-8,
DCE-10, DCE-11.0

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 81 +++++++++++++++++--
 1 file changed, 73 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2c4dbdeec46a..a3745cd8a459 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3759,10 +3759,53 @@ static const struct drm_encoder_funcs amdgpu_dm_encoder_funcs = {
 };
 
 
+static void get_min_max_dc_plane_scaling(struct drm_device *dev,
+					 struct drm_framebuffer *fb,
+					 int *min_downscale, int *max_upscale)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dc *dc = adev->dm.dc;
+	/* Caps for all supported planes are the same on DCE and DCN 1 - 3 */
+	struct dc_plane_cap *plane_cap = &dc->caps.planes[0];
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		*max_upscale = plane_cap->max_upscale_factor.nv12;
+		*min_downscale = plane_cap->max_downscale_factor.nv12;
+		break;
+
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_ARGB16161616F:
+	case DRM_FORMAT_XBGR16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+		*max_upscale = plane_cap->max_upscale_factor.fp16;
+		*min_downscale = plane_cap->max_downscale_factor.fp16;
+		break;
+
+	default:
+		*max_upscale = plane_cap->max_upscale_factor.argb8888;
+		*min_downscale = plane_cap->max_downscale_factor.argb8888;
+		break;
+	}
+
+	/*
+	 * A factor of 1 in the plane_cap means to not allow scaling, ie. use a
+	 * scaling factor of 1.0 == 1000 units.
+	 */
+	if (*max_upscale == 1)
+		*max_upscale = 1000;
+
+	if (*min_downscale == 1)
+		*min_downscale = 1000;
+}
+
+
 static int fill_dc_scaling_info(const struct drm_plane_state *state,
 				struct dc_scaling_info *scaling_info)
 {
-	int scale_w, scale_h;
+	int scale_w, scale_h, min_downscale, max_upscale;
 
 	memset(scaling_info, 0, sizeof(*scaling_info));
 
@@ -3794,17 +3837,25 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
 	/* DRM doesn't specify clipping on destination output. */
 	scaling_info->clip_rect = scaling_info->dst_rect;
 
-	/* TODO: Validate scaling per-format with DC plane caps */
+	/* Validate scaling per-format with DC plane caps */
+	if (state->plane && state->plane->dev && state->fb) {
+		get_min_max_dc_plane_scaling(state->plane->dev, state->fb,
+					     &min_downscale, &max_upscale);
+	} else {
+		min_downscale = 250;
+		max_upscale = 16000;
+	}
+
 	scale_w = scaling_info->dst_rect.width * 1000 /
 		  scaling_info->src_rect.width;
 
-	if (scale_w < 250 || scale_w > 16000)
+	if (scale_w < min_downscale || scale_w > max_upscale)
 		return -EINVAL;
 
 	scale_h = scaling_info->dst_rect.height * 1000 /
 		  scaling_info->src_rect.height;
 
-	if (scale_h < 250 || scale_h > 16000)
+	if (scale_h < min_downscale || scale_h > max_upscale)
 		return -EINVAL;
 
 	/*
@@ -6424,12 +6475,26 @@ static void dm_plane_helper_cleanup_fb(struct drm_plane *plane,
 static int dm_plane_helper_check_state(struct drm_plane_state *state,
 				       struct drm_crtc_state *new_crtc_state)
 {
-	int max_downscale = 0;
-	int max_upscale = INT_MAX;
+	struct drm_framebuffer *fb = state->fb;
+	int min_downscale, max_upscale;
+	int min_scale = 0;
+	int max_scale = INT_MAX;
+
+	/* Plane enabled? Get min/max allowed scaling factors from plane caps. */
+	if (fb && state->crtc) {
+		get_min_max_dc_plane_scaling(state->crtc->dev, fb,
+					     &min_downscale, &max_upscale);
+		/*
+		 * Convert to drm convention: 16.16 fixed point, instead of dc's
+		 * 1.0 == 1000. Also drm scaling is src/dst instead of dc's
+		 * dst/src, so min_scale = 1.0 / max_upscale, etc.
+		 */
+		min_scale = (1000 << 16) / max_upscale;
+		max_scale = (1000 << 16) / min_downscale;
+	}
 
-	/* TODO: These should be checked against DC plane caps */
 	return drm_atomic_helper_check_plane_state(
-		state, new_crtc_state, max_downscale, max_upscale, true, true);
+		state, new_crtc_state, min_scale, max_scale, true, true);
 }
 
 static int dm_plane_atomic_check(struct drm_plane *plane,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
