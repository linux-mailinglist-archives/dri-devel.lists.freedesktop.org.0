Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1428AB966
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 06:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0C10F3F2;
	Sat, 20 Apr 2024 04:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VPH71u9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFB010F3BB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51abd580902so1157381e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585678; x=1714190478; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ln93o/geMWJf38lR+lA5Gs3Udt4lMZqHlDCloEuyVkU=;
 b=VPH71u9S7SMKc/9x32CmzFe4nx3oDqOmkK3XVC5d7ljPcjKbkb1Y2Hvr0k1LBJHxfi
 nLKSHOyXrYtE0phrYE531U1prlfB6yVORRlowykuiTmC6JUjhqjOp7NACSL/MG3Nl8CY
 KG1NPibdQ7g9c3MhqzwkGBvswLFx+/QbZ96BswAcs27SPz75eMJHWzpw/ebNRKzQv7b3
 uora4Gyy5/Xw4cPJcuY/JlkPm2BBBIAzUh42+LIjk5QOqBnviIuczMIfyoQu6C4A/GWn
 O7v0GltZkhmmJnU4zbrBbYX8DOCgHSLv15ni8a+hDEuXKUK/q3oKKwNf9csoDJhHGa6p
 7xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585678; x=1714190478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ln93o/geMWJf38lR+lA5Gs3Udt4lMZqHlDCloEuyVkU=;
 b=FnowLIvrmJIxyx/a78kmmevCrdiykECmNY7XmVstWImp6RtocEm0GRtEPAUV6sL5Uv
 nFuThuslkz9T84INcaVIJagAlhcj/Od2BFU1blPuzzPN8wK/WuQ7YfWguwrrA7Lchl05
 bzMuZRIOGhVDyXCT67zNSm3NSZMAamjXaAhyMza+UvLuhkC39pbHIalH6HMoyQivbZ9E
 FoP43FC4mXiwXJ/CqSBMnlXdMWHzs1eGHHG67S26P5mgkl9uMdQVwTjR6mt39wSMLbrS
 Augwg7VvIMNUeCNVk1eJNuMNQr/5xGEeDAFm8kO43uHu+RY6UwTdW2diHENVGY7Ylhh6
 xCRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWztZXmMbjtAo+dVQvJgSBdtsLVUgJHkEX6x3/a8qDgxKCEDixHiTT6z1kRbAinlMHCCFb+iIa7qL8Y/V0QBqcF4DcHS+/xn/0zQ8lCDt7+
X-Gm-Message-State: AOJu0YzBw3SWyp8zr6EJo9Qo/iYwBz5T0qQNRZKDLAsNMcrBJRciQDsZ
 8BYhY41j09/OVS8Y+YqWxj2kEVOfDq5hZYRmpn/9TA10o4xnT+L9495LEp9uXOI=
X-Google-Smtp-Source: AGHT+IG/rZJYsP8q6Yz2NX0nnIWr12yUEZaJEOYQ7tTd+WkIUNMBPXayYocLKP9ifxD8IbwTlU3fkg==
X-Received: by 2002:ac2:5b1d:0:b0:51a:affe:252d with SMTP id
 v29-20020ac25b1d000000b0051aaffe252dmr1322477lfn.10.1713585678518; 
 Fri, 19 Apr 2024 21:01:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:03 +0300
Subject: [PATCH v2 6/9] drm/msm: convert msm_format::unpack_tight to the flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-6-9e93226cbffd@linaro.org>
References: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
In-Reply-To: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17368;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e82UFjruCH+AUnGkKD0IbJ2YS7fnp57NhQEJ+bCvR1U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4J5F1hOiZ4k360j8UlouGjHAgFPuvtcepCP
 01jpgHIaIuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+CQAKCRCLPIo+Aiko
 1T98B/9y1R6BFXCr/y/HE4OjaRpeGi1FbAW5cB33ozcJBL88CvzNs/E8OKbnrr1aUThSWuYMSsl
 Vns8Fparh3w+kdheKMm5uoJXxBoy+HG+kabmbb5DSiSeEjLb+FYNqrcxIYQQFX0I37h7w+N29Rt
 rJaZs57r+2YwnrHet2iZltPJVa3zPnTFm6wdrBd4p4AT9um87YmjrXnvmLdQ6n2zHNbx3SH/sCl
 wE8048YvNnBXYItvpG8JBCcjdRHhQSdu4We37TNnDoW7OH7mLFt74ACaX6fjgPxLcCyLQiRrrdc
 ZDsBVlcRtzbENy2idgMo+mQZGcx1ia8ogJ2aDrzbHwVB/BR0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Instead of having a u8 or bool field unpack_tight, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 22 ++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 +-
 drivers/gpu/drm/msm/disp/mdp_format.c       | 52 ++++++++++++++---------------
 drivers/gpu/drm/msm/disp/mdp_format.h       |  4 +--
 7 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 855f0d29c387..705b91582b0f 100644
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
index fdd77dc51776..d411d70b8cd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -263,7 +263,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	unpack = (fmt->element[3] << 24) | (fmt->element[2] << 16) |
 		(fmt->element[1] << 8) | (fmt->element[0] << 0);
 	src_format |= ((fmt->unpack_count - 1) << 12) |
-		(fmt->unpack_tight << 17) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 2fdf1b703042..19163634855f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -98,7 +98,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
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
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.h b/drivers/gpu/drm/msm/disp/mdp_format.h
index 6443d53954ee..18b2822dd552 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.h
+++ b/drivers/gpu/drm/msm/disp/mdp_format.h
@@ -14,11 +14,13 @@ enum msm_format_flags {
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
@@ -27,7 +29,6 @@ enum msm_format_flags {
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
  * @alpha_enable: whether the format has an alpha channel
- * @unpack_tight: whether to use tight or loose unpack
  * @unpack_align_msb: unpack aligned to LSB or MSB
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
@@ -44,7 +45,6 @@ struct msm_format {
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
 	bool alpha_enable;
-	u8 unpack_tight;
 	u8 unpack_align_msb;
 	u8 unpack_count;
 	u8 bpp;

-- 
2.39.2

