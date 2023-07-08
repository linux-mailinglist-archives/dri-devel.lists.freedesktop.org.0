Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FA74BADC
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7743110E64B;
	Sat,  8 Jul 2023 01:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629B710E1A0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:21 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b701e1c80fso38232301fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778259; x=1691370259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0P9HJbKd5pefh9k+jZU4bdKvFEyzVuBH1X6M1Y88Usw=;
 b=a31oq6OGAcje1AiL5IbM+GG5R4iC6rxEqOnqXyjsbF6PPiNnBUEnsOOgF96cYrrHix
 u3HV085kfkLm8BYOycBBxEDpIKfEzwPZlfAtyx0R//cfFo5G12ZKEq4Kfv3DdaSFzWe0
 BxJCIDSBUMCglZPgPRKRHNBffVsm7pcbBAwan4ojGk161+SKuDs5OSxTiayX+Jlfwwxp
 STYj+hdYQHVQsJo9360vpOFdVR1xV2EaWu7IYSP+x5Osv+jzZJkHTJ55s5N8WnggqfBH
 49GZ4MHVQ08Q3NS9joOBiN7jBo/EmTjn19Xls5JVK5dwwalefcW3k/+u0au+cPl9fS+W
 HwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778259; x=1691370259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0P9HJbKd5pefh9k+jZU4bdKvFEyzVuBH1X6M1Y88Usw=;
 b=UQ9MxzEtv6Gc2/tJjmUDxb+jiHXDVTlqkNFuRHzffj1lfSy2lbkREkCuEYoDO/Df3X
 m4W5ZfxitB9AtQiBUnDV7Ji9il4j2Wls5S58L8lT6Ph1PsAW9tShIg4CM5WNNceqtOm4
 sNYeWhc+2Fh6u/iNIjEt5yiUImLOjqW8bC0xUZ42WsPJgEluzsaDXtdAbReHCLgO9kcX
 4Sn5GvLNdijzSH3NonsU7yl9wuhmnr6gvmi0gggBPsZhDONRCztWpS1CCVqXuhe1RjU3
 GRkYm1F7nx71fp6QlThKM5WcSArU6cYrC05MTdlTJZiMqpFjurtYjIbcZW5j8mLfiIM8
 08LQ==
X-Gm-Message-State: ABy/qLasEDMl6+AIRZPPG2L+JT2+hnZFzT0pl8J/1y7OJN/IzgdBmu8J
 Y/FW4VD9AcfBMhUfuZ5V5JFpzA==
X-Google-Smtp-Source: APBJJlHwrq0JaK65jl1O+8LqBBpBQvsLOv+4sKEHHZsvrO7eK2LShQ3hjSa0JnNcoGRMvVFOcPmZzA==
X-Received: by 2002:a2e:924e:0:b0:2b1:b4e9:4c3 with SMTP id
 v14-20020a2e924e000000b002b1b4e904c3mr5007689ljg.2.1688778259768; 
 Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 16/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
Date: Sat,  8 Jul 2023 04:04:06 +0300
Message-Id: <20230708010407.3871346-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Change struct mdp4_plane allocation to use drmm_plane_alloc(). This
removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 59 ++++++++--------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index b689b618da78..1149e6721534 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -20,12 +20,6 @@ struct mdp4_plane {
 	const char *name;
 
 	enum mdp4_pipe pipe;
-
-	uint32_t caps;
-	uint32_t nformats;
-	uint32_t formats[32];
-
-	bool enabled;
 };
 #define to_mdp4_plane(x) container_of(x, struct mdp4_plane, base)
 
@@ -59,15 +53,6 @@ static struct mdp4_kms *get_kms(struct drm_plane *plane)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_plane_destroy(struct drm_plane *plane)
-{
-	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
-
-	drm_plane_cleanup(plane);
-
-	kfree(mdp4_plane);
-}
-
 /* helper to install properties which are common to planes and crtcs */
 static void mdp4_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
@@ -85,7 +70,6 @@ static int mdp4_plane_set_property(struct drm_plane *plane,
 static const struct drm_plane_funcs mdp4_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = mdp4_plane_destroy,
 		.set_property = mdp4_plane_set_property,
 		.reset = drm_atomic_helper_plane_reset,
 		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
@@ -377,31 +361,34 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 {
 	struct drm_plane *plane = NULL;
 	struct mdp4_plane *mdp4_plane;
-	int ret;
 	enum drm_plane_type type;
+	uint32_t pipe_caps;
+	const uint32_t *formats;
+	size_t nformats;
 
-	mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
-	if (!mdp4_plane) {
-		ret = -ENOMEM;
-		goto fail;
+	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+
+	pipe_caps = mdp4_pipe_caps(pipe_id);
+	if (pipe_supports_yuv(pipe_caps)) {
+		formats = mdp_rgb_yuv_formats;
+		nformats = mdp_rgb_yuv_num_formats;
+	} else {
+		formats = mdp_rgb_formats;
+		nformats = mdp_rgb_num_formats;
 	}
 
+	mdp4_plane = drmm_universal_plane_alloc(dev, struct mdp4_plane, base,
+						0xff, &mdp4_plane_funcs,
+						formats, nformats,
+						supported_format_modifiers,
+						type, NULL);
+	if (IS_ERR(mdp4_plane))
+		return ERR_CAST(mdp4_plane);
+
 	plane = &mdp4_plane->base;
 
 	mdp4_plane->pipe = pipe_id;
 	mdp4_plane->name = pipe_names[pipe_id];
-	mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
-
-	mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
-			ARRAY_SIZE(mdp4_plane->formats),
-			!pipe_supports_yuv(mdp4_plane->caps));
-
-	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
-	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
-				 mdp4_plane->formats, mdp4_plane->nformats,
-				 supported_format_modifiers, type, NULL);
-	if (ret)
-		goto fail;
 
 	drm_plane_helper_add(plane, &mdp4_plane_helper_funcs);
 
@@ -410,10 +397,4 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	drm_plane_enable_fb_damage_clips(plane);
 
 	return plane;
-
-fail:
-	if (plane)
-		mdp4_plane_destroy(plane);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

