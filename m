Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF6801EDA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D579110E14B;
	Sat,  2 Dec 2023 21:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCD210E224
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50abb83866bso4611191e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553224; x=1702158024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHatgnJPeA0diZnV0a/BRbKVR8h8NfDCjQRevj5jKG8=;
 b=zrfeo3jPWSSy3Wkg7RbAVwM5FLliAmytwJuC9Q2Wp7d5RQiCQDX7mBIPv1X1D+DK4J
 G/wVf464iB5Pbc2+vwtac/t1XdIWUidSTHZUZ09or1itLngYyVmh8wbcLLhWBBkz/9m9
 DgZlPooewq5M5BPmuQ0MHdDBVGOppDUijzG8RV0msgaCKMnptaF9ydMTMxRno0T2ZbuY
 cT+qZKiw/9KPFAB8FTFp0fdMJb+kPYd+MsFO2JPEN+oeaTVSLX3C7w9k/MI6QWpFS2Jl
 FqPuTcvZBn2XoYKz2jK96njFvjqHGwTN2wqVqcVqV37MHKu/FvG4VV5bJMAfKY6U/q/4
 Kd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553224; x=1702158024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHatgnJPeA0diZnV0a/BRbKVR8h8NfDCjQRevj5jKG8=;
 b=OlQvx+7N9zqvxJxlMvvN9FmiNjuk5iuhwxLqOn0vukFUWTox4iwTACFRf5yJ0PDbjJ
 n0Q6LDJ2fGOFB5+mn+5Nm8EIiOOpLD+V8p2l4qoCDvjiH0VMGFk572Ud3O8MImyL2ifp
 vYXN7p1NDbT9EnEw/iwNQC+2GeJ1fpelnm35KoMeDYKcQbbi06ey3053uhnap0NTuWG3
 3F7hQ0enyVWVPr3Mr1kp4inp32w54Hj6gOozm+S4ZU0+WfaKiXbc/ATCmNmfA86drI0a
 +uJzok1hEe+T6xxxQjbyO69oaJQ0vAJRMMgdQQFUzF6HtS8vSHItn/vd7aygAXUzisEp
 q2dw==
X-Gm-Message-State: AOJu0YxAUhgThf/aTCYdwz+r0eqhEry3MV1Ui+ViC+47450jh47Robh8
 EVYw34qaYU0v3nC4/EfL4PmxXw==
X-Google-Smtp-Source: AGHT+IFVw2ow2whBkXCo1o2l7jBCVayaet3dz0cjxX0Gl0GCiuwslJFgUv7by+smBB7bY8WGUNbOVw==
X-Received: by 2002:a05:6512:214c:b0:50b:e056:8b20 with SMTP id
 s12-20020a056512214c00b0050be0568b20mr636398lfr.168.1701553224157; 
 Sat, 02 Dec 2023 13:40:24 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 08/12] drm/msm: convert msm_format::unpack_tight to the flag
Date: Sun,  3 Dec 2023 00:40:12 +0300
Message-Id: <20231202214016.1257621-9-dmitry.baryshkov@linaro.org>
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

Instead of having a u8 or bool field unpack_tight, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 22 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 +-
 drivers/gpu/drm/msm/disp/mdp_format.c       | 52 ++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h               |  4 +-
 7 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index ea9d5fb01000..419400311837 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -44,11 +44,10 @@ bp, flg, fm, np)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -66,11 +65,10 @@ alpha, bp, flg, fm, np, th)                                               \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -89,11 +87,10 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -110,11 +107,10 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -132,11 +128,10 @@ flg, fm, np, th)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -153,7 +148,6 @@ flg, fm, np, th)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 1,                                            \
-	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -175,7 +169,6 @@ flg, fm, np, th)                                                          \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 1,                                            \
-	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -198,11 +191,10 @@ flg, fm, np)                                                      \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
-	.unpack_tight = 1,                                                \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -636,7 +628,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	if (fmt->pixel_format == DRM_FORMAT_NV12 ||
 	    fmt->pixel_format == DRM_FORMAT_P010) {
 		if (MSM_FORMAT_IS_DX(fmt)) {
-			if (fmt->unpack_tight)
+			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT)
 				color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
 			else
 				color_fmt = COLOR_FMT_P010_UBWC;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 46b7b00e6701..f6c772df048b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -262,7 +262,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	unpack = (fmt->element[3] << 24) | (fmt->element[2] << 16) |
 		(fmt->element[1] << 8) | (fmt->element[0] << 0);
 	src_format |= ((fmt->unpack_count - 1) << 12) |
-		(fmt->unpack_tight << 17) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 36dc57465958..12418256326d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -93,7 +93,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->element[0] << 0);
 
 	dst_format |= (fmt->unpack_align_msb << 18) |
-		(fmt->unpack_tight << 17) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		((fmt->unpack_count - 1) << 12) |
 		((fmt->bpp - 1) << 9);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 0bae90d3f21e..ef7e525c3bd2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -325,7 +325,8 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 			MDP4_PIPE_SRC_FORMAT_FETCH_PLANES(format->fetch_type) |
 			MDP4_PIPE_SRC_FORMAT_CHROMA_SAMP(format->chroma_sample) |
 			MDP4_PIPE_SRC_FORMAT_FRAME_FORMAT(frame_type) |
-			COND(format->unpack_tight, MDP4_PIPE_SRC_FORMAT_UNPACK_TIGHT));
+			COND(format->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT,
+			     MDP4_PIPE_SRC_FORMAT_UNPACK_TIGHT));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_UNPACK(pipe),
 			MDP4_PIPE_SRC_UNPACK_ELEM0(format->element[0]) |
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 3b7c3eac8eda..cc0dc451dc2e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -801,7 +801,8 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 			COND(format->alpha_enable, MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
 			MDP5_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP5_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
-			COND(format->unpack_tight, MDP5_PIPE_SRC_FORMAT_UNPACK_TIGHT) |
+			COND(format->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT,
+			     MDP5_PIPE_SRC_FORMAT_UNPACK_TIGHT) |
 			MDP5_PIPE_SRC_FORMAT_FETCH_TYPE(format->fetch_type) |
 			MDP5_PIPE_SRC_FORMAT_CHROMA_SAMP(format->chroma_sample));
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 5fc55f41e74f..b9f0b13d25d5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -62,7 +62,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	},
 };
 
-#define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
+#define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, c, cnt, fp, cs, yuv) { \
 		.pixel_format = DRM_FORMAT_ ## name,             \
 		.bpc_a = BPC ## a ## A,                          \
 		.bpc_r_cr = BPC ## r,                            \
@@ -72,65 +72,65 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 		.fetch_type = fp,                                \
 		.chroma_sample = cs,                             \
 		.alpha_enable = alpha,                           \
-		.unpack_tight = tight,                           \
 		.unpack_count = cnt,                             \
 		.bpp = c,                                        \
-		.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,          \
+		.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |          \
+			(yuv ? MSM_FORMAT_FLAG_YUV : 0),         \
 }
 
 #define BPC0A 0
 
 static const struct msm_format formats[] = {
-	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
-	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   true,  4,  4,
+	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   cpp cnt ... */
+	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(ABGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  true,   true,  4,  4,
+	FMT(ABGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGBA8888, 8, 8, 8, 8,  3, 1, 0, 2,  true,   true,  4,  4,
+	FMT(RGBA8888, 8, 8, 8, 8,  3, 1, 0, 2,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGRA8888, 8, 8, 8, 8,  3, 2, 0, 1,  true,   true,  4,  4,
+	FMT(BGRA8888, 8, 8, 8, 8,  3, 2, 0, 1,  true,   4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(XRGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  false,  true,  4,  4,
+	FMT(XRGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(XBGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  false,   true,  4,  4,
+	FMT(XBGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGBX8888, 8, 8, 8, 8,  3, 1, 0, 2,  false,   true,  4,  4,
+	FMT(RGBX8888, 8, 8, 8, 8,  3, 1, 0, 2,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGRX8888, 8, 8, 8, 8,  3, 2, 0, 1,  false,   true,  4,  4,
+	FMT(BGRX8888, 8, 8, 8, 8,  3, 2, 0, 1,  false,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGB888,   0, 8, 8, 8,  1, 0, 2, 0,  false,  true,  3,  3,
+	FMT(RGB888,   0, 8, 8, 8,  1, 0, 2, 0,  false,  3,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGR888,   0, 8, 8, 8,  2, 0, 1, 0,  false,  true,  3,  3,
+	FMT(BGR888,   0, 8, 8, 8,  2, 0, 1, 0,  false,  3,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGB565,   0, 5, 6, 5,  1, 0, 2, 0,  false,  true,  2,  3,
+	FMT(RGB565,   0, 5, 6, 5,  1, 0, 2, 0,  false,  2,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGR565,   0, 5, 6, 5,  2, 0, 1, 0,  false,  true,  2,  3,
+	FMT(BGR565,   0, 5, 6, 5,  2, 0, 1, 0,  false,  2,  3,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 
 	/* 2 plane YUV */
-	FMT(NV12,     0, 8, 8, 8,  1, 2, 0, 0,  false,  true,  2, 2,
+	FMT(NV12,     0, 8, 8, 8,  1, 2, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_420, true),
-	FMT(NV21,     0, 8, 8, 8,  2, 1, 0, 0,  false,  true,  2, 2,
+	FMT(NV21,     0, 8, 8, 8,  2, 1, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_420, true),
-	FMT(NV16,     0, 8, 8, 8,  1, 2, 0, 0,  false,  true,  2, 2,
+	FMT(NV16,     0, 8, 8, 8,  1, 2, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_H2V1, true),
-	FMT(NV61,     0, 8, 8, 8,  2, 1, 0, 0,  false,  true,  2, 2,
+	FMT(NV61,     0, 8, 8, 8,  2, 1, 0, 0,  false,  2, 2,
 			MDP_PLANE_PSEUDO_PLANAR, CHROMA_H2V1, true),
 	/* 1 plane YUV */
-	FMT(VYUY,     0, 8, 8, 8,  2, 0, 1, 0,  false,  true,  2, 4,
+	FMT(VYUY,     0, 8, 8, 8,  2, 0, 1, 0,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(UYVY,     0, 8, 8, 8,  1, 0, 2, 0,  false,  true,  2, 4,
+	FMT(UYVY,     0, 8, 8, 8,  1, 0, 2, 0,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(YUYV,     0, 8, 8, 8,  0, 1, 0, 2,  false,  true,  2, 4,
+	FMT(YUYV,     0, 8, 8, 8,  0, 1, 0, 2,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(YVYU,     0, 8, 8, 8,  0, 2, 0, 1,  false,  true,  2, 4,
+	FMT(YVYU,     0, 8, 8, 8,  0, 2, 0, 1,  false,  2, 4,
 			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
 	/* 3 plane YUV */
-	FMT(YUV420,   0, 8, 8, 8,  2, 1, 0, 0,  false,  true,  1, 1,
+	FMT(YUV420,   0, 8, 8, 8,  2, 1, 0, 0,  false,  1, 1,
 			MDP_PLANE_PLANAR, CHROMA_420, true),
-	FMT(YVU420,   0, 8, 8, 8,  1, 2, 0, 0,  false,  true,  1, 1,
+	FMT(YVU420,   0, 8, 8, 8,  1, 2, 0, 0,  false,  1, 1,
 			MDP_PLANE_PLANAR, CHROMA_420, true),
 };
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c8c465c36487..61a4587382b5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -255,11 +255,13 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_YUV_BIT,
 	MSM_FORMAT_FLAG_DX_BIT,
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
+	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
 #define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
+#define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -268,7 +270,6 @@ enum msm_format_flags {
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
  * @alpha_enable: whether the format has an alpha channel
- * @unpack_tight: whether to use tight or loose unpack
  * @unpack_align_msb: unpack aligned to LSB or MSB
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
@@ -285,7 +286,6 @@ struct msm_format {
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
 	bool alpha_enable;
-	u8 unpack_tight;
 	u8 unpack_align_msb;
 	u8 unpack_count;
 	u8 bpp;
-- 
2.39.2

