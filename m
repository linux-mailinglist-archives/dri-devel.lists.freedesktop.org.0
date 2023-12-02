Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E4801ED2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A083510E159;
	Sat,  2 Dec 2023 21:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182A10E12F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:22 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bce78f145so3918784e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553221; x=1702158021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpxUb5xms8fDLqquF2ESZjqnZ9nPl+Oy3tudzwyKY9U=;
 b=preAHC1o1u84w7zjmTQFUuw+cSLuAb9/BbLtwktiV6Tz1ryLOl1frtMuUNUpDpO2GY
 dcwHXFZcUiFg4COLyBmgm/L2vj8inxIxfuZFf0+ZupRBKyGoHIxD7ePx78J8EA3imrJ3
 2vhbFFd6vqfetWjjUWOGxG4UPz8dAUxt2BA1G0Wl1nVoDKM9E1ifD1c0/XIaMh4hiJ03
 BSojORskiO/Yb8wm6P45t6lQBVkRZrMIXRgFoglUh+7tlo7G+wBLXPlfb28r1W3fGtMG
 W0Rkgg/kpsqWnLjChOtpSWypIW4cP+pYC03whYJKWY5SnnoCq4nYlJ4RsICa+VBXVLb7
 AAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553221; x=1702158021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpxUb5xms8fDLqquF2ESZjqnZ9nPl+Oy3tudzwyKY9U=;
 b=wNB2CA+W/fbLHZ6bZoGm4Kp7RkQSPo6+vxwfI3N6Ko3q43Y7Eo2h9WVpDt4nkUmY08
 mm0msbsJaAVug6Lh5mWwO9z0uwhmptkuJ1fCdzT9Dpxlple754pR3qCveCgCUmjvW0gf
 sdarYHCHTuEwcq8wKe7vBSuxE0MRImGCArJ7zrShxS8NCzuwf137Xx7pniM5K5y4pbzG
 XT195JjBg/FvB2Ou2TxQYn0H0hvLsSoejhsjEl8PpXQzHJHlDk3tMFfT/hAWnc/xtud3
 YdrAMuazFDm2xrhLnETy0GcInxoKm4rfs3ZLOL30CyjqMvgIqKR+JmFOxIs5Io05MMrj
 Z/0A==
X-Gm-Message-State: AOJu0Yz3Vm0XuJSrA/LpTcUhfPoAWJr2jETkS3fBAaE3dLhMYNtg4o8G
 mYXn38AFr4myzcFbyEcvptLh5A==
X-Google-Smtp-Source: AGHT+IHaa3oRQLnBH/XXw4/9XJeJ4m4RkeUTocjNGP6XoRcOZlD5HxE6dpPpH52LhkbNBVocvgVdBg==
X-Received: by 2002:a05:6512:104f:b0:50b:e20c:2042 with SMTP id
 c15-20020a056512104f00b0050be20c2042mr485199lfb.169.1701553220863; 
 Sat, 02 Dec 2023 13:40:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 04/12] drm/msm: add arrays listing formats supported by
 MDP4/MDP5 hardware
Date: Sun,  3 Dec 2023 00:40:08 +0300
Message-Id: <20231202214016.1257621-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
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

MDP4 and MDP5 drivers enumerate supported formats each time the plane is
created. In preparation to merger of MDP DPU format databases, define
precise formats list, so that changes to the database do not cause the
driver to add unsupported format to the list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 57 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 36 +++++++++++---
 drivers/gpu/drm/msm/disp/mdp_format.c      | 28 -----------
 drivers/gpu/drm/msm/disp/mdp_kms.h         |  1 -
 4 files changed, 80 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index b689b618da78..cebe20c82a54 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -371,6 +371,47 @@ static const uint64_t supported_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+const uint32_t mdp4_rgb_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+};
+
+const uint32_t mdp4_rgb_yuv_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
 /* initialize plane */
 struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 		enum mdp4_pipe pipe_id, bool private_plane)
@@ -379,6 +420,8 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	struct mdp4_plane *mdp4_plane;
 	int ret;
 	enum drm_plane_type type;
+	const uint32_t *formats;
+	unsigned int nformats;
 
 	mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
 	if (!mdp4_plane) {
@@ -392,13 +435,17 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	mdp4_plane->name = pipe_names[pipe_id];
 	mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
 
-	mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
-			ARRAY_SIZE(mdp4_plane->formats),
-			!pipe_supports_yuv(mdp4_plane->caps));
-
 	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+
+	if (pipe_supports_yuv(mdp4_plane->caps)) {
+		formats = mdp4_rgb_yuv_formats;
+		nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
+	} else {
+		formats = mdp4_rgb_formats;
+		nformats = ARRAY_SIZE(mdp4_rgb_formats);
+	}
 	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
-				 mdp4_plane->formats, mdp4_plane->nformats,
+				 formats, nformats,
 				 supported_format_modifiers, type, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 0d5ff03cb091..aa8342d93393 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -17,9 +17,6 @@
 
 struct mdp5_plane {
 	struct drm_plane base;
-
-	uint32_t nformats;
-	uint32_t formats[32];
 };
 #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
 
@@ -1007,6 +1004,32 @@ uint32_t mdp5_plane_get_flush(struct drm_plane *plane)
 	return mask;
 }
 
+const uint32_t mdp5_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
 /* initialize plane */
 struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 				  enum drm_plane_type type)
@@ -1023,12 +1046,9 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 
 	plane = &mdp5_plane->base;
 
-	mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
-		ARRAY_SIZE(mdp5_plane->formats), false);
-
 	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
-			mdp5_plane->formats, mdp5_plane->nformats,
-			NULL, type, NULL);
+				       mdp5_plane_formats, ARRAY_SIZE(mdp5_plane_formats),
+				       NULL, type, NULL);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 025595336f26..69ab5bcff1a9 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -80,10 +80,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 
 #define BPC0A 0
 
-/*
- * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
- * mdp_get_rgb_formats()'s implementation.
- */
 static const struct mdp_format formats[] = {
 	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
 	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   true,  4,  4,
@@ -138,30 +134,6 @@ static const struct mdp_format formats[] = {
 			MDP_PLANE_PLANAR, CHROMA_420, true),
 };
 
-/*
- * Note:
- * @rgb_only must be set to true, when requesting
- * supported formats for RGB pipes.
- */
-uint32_t mdp_get_formats(uint32_t *pixel_formats, uint32_t max_formats,
-		bool rgb_only)
-{
-	uint32_t i;
-	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct mdp_format *f = &formats[i];
-
-		if (i == max_formats)
-			break;
-
-		if (rgb_only && MDP_FORMAT_IS_YUV(f))
-			break;
-
-		pixel_formats[i] = f->base.pixel_format;
-	}
-
-	return i;
-}
-
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 		uint64_t modifier)
 {
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index b0286d5d5130..d0718c16de3e 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -91,7 +91,6 @@ struct mdp_format {
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
 #define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
 
-uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
 /* MDP capabilities */
-- 
2.39.2

