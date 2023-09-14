Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC3579F9CA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B061410E4F7;
	Thu, 14 Sep 2023 05:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C629F10E4F7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-500760b296aso721561e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668029; x=1695272829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We1m3wUU10VLixOFImLvaX38l7vE9+S9QmrxXve61hg=;
 b=oRhq/3a+MmQUe3qRICtwrIPg78a/LK9yteHZNCc3w8pRtgakP7VuyJ5cFdZz02urZA
 kfpXSniXBDajrFj+QAlE9MNBVEjZ0LF0t1gdU/F3+vBS9knhQUYq4A3Z8cteyau3FoAl
 Hdd/D43Fc/UBewKAltQXVpG528Dwb6IN7vxAvKqZLg6+c+svgnkfQgq+nhiouk++cCvr
 +SfiJSMZYZtzMDhqYPgHV3odoiGWKTuphBWwcI9nJzbTG05TbvEk3msGBW6tDiiHniM4
 I+s5wuqBqZfY60zaS7XPRBJSvVPCTCuPcoo1JOxeQE/ueTlu90lBMyhxnGWC07xeI+QF
 wMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668029; x=1695272829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=We1m3wUU10VLixOFImLvaX38l7vE9+S9QmrxXve61hg=;
 b=J3QjGLxOOqceQdz2+1gDDIo5ws9vjUWH5Jhj+jRLFdHl854dNrWOB4OeWpR5rdU+4K
 YkK9n6Y9ijUzoyz7Kx2m46KVN0yFhfW+e/JTwzH9UDivDsHwZnhO3nQSZBEk1Aukgtk2
 u46yUv1jftwB88a2h4bATsYq+aTtJC1qKM5kpSQGHDCST+IAaYa42IZmrzw9imxji6T7
 uPdNTnmDrayRFhp1FM16TgGl9Fryk3QoYxi+gD5S9Bv5YdxlU0wCU/EIUXbdU1h5hs01
 ehZxlU9Qm7IWxOW+vTLONJpaTENnAofM+W9aAwxKEUw9qVtVF5iUZ5J2hie7atJLrOUk
 jTMQ==
X-Gm-Message-State: AOJu0YwPldqiQHGCi9jfDTt0WxgE4HiK7qIJdmi43S7xVh00uHJG6MY2
 Y76GFIKxlO/czOgOuOXjEwDEBw==
X-Google-Smtp-Source: AGHT+IEa1M4cG+xaG0xUzjdZAWHGldg2nkkgxVbX34t/Egf2596WaJJwFzswgga+uNjbvw2RGbcDWw==
X-Received: by 2002:a05:6512:2810:b0:4fe:13c9:2071 with SMTP id
 cf16-20020a056512281000b004fe13c92071mr218670lfb.2.1694668028528; 
 Wed, 13 Sep 2023 22:07:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Date: Thu, 14 Sep 2023 08:06:55 +0300
Message-Id: <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The helper drm_atomic_helper_check_plane_state() runs several checks on
plane src and dst rectangles, including the check whether required
scaling fits into the required margins. The msm driver would benefit
from having a function that does all these checks except the scaling
one. Split them into a new helper called
drm_atomic_helper_check_plane_noscale().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 110 ++++++++++++++++++++++------
 include/drm/drm_atomic_helper.h     |   7 ++
 2 files changed, 96 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 292e38eb6218..2d7dd66181c9 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -825,11 +825,9 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
 
 /**
- * drm_atomic_helper_check_plane_state() - Check plane state for validity
+ * drm_atomic_helper_check_plane_noscale() - Check plane state for validity
  * @plane_state: plane state to check
  * @crtc_state: CRTC state to check
- * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
- * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
  * @can_position: is it legal to position the plane such that it
  *                doesn't cover the entire CRTC?  This will generally
  *                only be false for primary planes.
@@ -845,19 +843,16 @@ EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
  * RETURNS:
  * Zero if update appears valid, error code on failure
  */
-int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
-					const struct drm_crtc_state *crtc_state,
-					int min_scale,
-					int max_scale,
-					bool can_position,
-					bool can_update_disabled)
+int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
+					  const struct drm_crtc_state *crtc_state,
+					  bool can_position,
+					  bool can_update_disabled)
 {
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect *src = &plane_state->src;
 	struct drm_rect *dst = &plane_state->dst;
 	unsigned int rotation = plane_state->rotation;
 	struct drm_rect clip = {};
-	int hscale, vscale;
 
 	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
 
@@ -883,17 +878,6 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 
 	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-	/* Check scaling */
-	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
-	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->plane->dev,
-			    "Invalid scaling of plane\n");
-		drm_rect_debug_print("src: ", &plane_state->src, true);
-		drm_rect_debug_print("dst: ", &plane_state->dst, false);
-		return -ERANGE;
-	}
-
 	if (crtc_state->enable)
 		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
@@ -921,6 +905,90 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_atomic_helper_check_plane_noscale);
+
+/**
+ * drm_atomic_helper_check_plane_scale() - Check whether plane can be scaled
+ * @plane_state: plane state to check
+ * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
+ * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
+ *
+ * Checks that a desired plane scale fits into the min_scale..max_scale
+ * boundaries.
+ * Drivers that provide their own plane handling rather than helper-provided
+ * implementations may still wish to call this function to avoid duplication of
+ * error checking code.
+ *
+ * RETURNS:
+ * Zero if update appears valid, error code on failure
+ */
+int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
+					int min_scale,
+					int max_scale)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_rect src;
+	struct drm_rect dst;
+	int hscale, vscale;
+
+	if (!plane_state->visible)
+		return 0;
+
+	src = drm_plane_state_src(plane_state);
+	dst = drm_plane_state_dest(plane_state);
+
+	drm_rect_rotate(&src, fb->width << 16, fb->height << 16, plane_state->rotation);
+
+	hscale = drm_rect_calc_hscale(&src, &dst, min_scale, max_scale);
+	vscale = drm_rect_calc_vscale(&src, &dst, min_scale, max_scale);
+	if (hscale < 0 || vscale < 0) {
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Invalid scaling of plane\n");
+		drm_rect_debug_print("src: ", &plane_state->src, true);
+		drm_rect_debug_print("dst: ", &plane_state->dst, false);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_plane_scale);
+
+/**
+ * drm_atomic_helper_check_plane_state() - Check plane state for validity
+ * @plane_state: plane state to check
+ * @crtc_state: CRTC state to check
+ * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
+ * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
+ * @can_position: is it legal to position the plane such that it
+ *                doesn't cover the entire CRTC?  This will generally
+ *                only be false for primary planes.
+ * @can_update_disabled: can the plane be updated while the CRTC
+ *                       is disabled?
+ *
+ * Checks that a desired plane update is valid, and updates various
+ * bits of derived state (clipped coordinates etc.). Drivers that provide
+ * their own plane handling rather than helper-provided implementations may
+ * still wish to call this function to avoid duplication of error checking
+ * code.
+ *
+ * RETURNS:
+ * Zero if update appears valid, error code on failure
+ */
+int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
+					const struct drm_crtc_state *crtc_state,
+					int min_scale,
+					int max_scale,
+					bool can_position,
+					bool can_update_disabled)
+{
+	int ret;
+
+	ret = drm_atomic_helper_check_plane_noscale(plane_state, crtc_state, can_position, can_update_disabled);
+	if (ret < 0)
+		return ret;
+
+	return drm_atomic_helper_check_plane_scale(plane_state, min_scale, max_scale);
+}
 EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
 
 /**
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..32ac55aea94e 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -52,6 +52,13 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
 int
 drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 					 struct drm_connector_state *conn_state);
+int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
+					  const struct drm_crtc_state *crtc_state,
+					  bool can_position,
+					  bool can_update_disabled);
+int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
+					int min_scale,
+					int max_scale);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2

