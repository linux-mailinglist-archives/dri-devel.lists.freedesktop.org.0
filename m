Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259F801ECF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1136510E14E;
	Sat,  2 Dec 2023 21:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B2010E151
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bf2dfda6fso9540e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553222; x=1702158022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFU7OFJOJ4xHNZ5L09yPSOpNQR7d3JJ0rTrMhB4JJ1g=;
 b=cUaUfUtHQBNk7S7XsD6aa7ykDpD77NYXYyf4Ad/66vFME1sWtMyDTWWDvTlAXXIDCB
 f0krfsPdMZfw9xExvnNnHKYGSZA5k1KjueBxW86ZOeJ031Tl8qhPPJGqLjimjj0jzss9
 8SVloIRKB4/JynZDOT0XJnlQFQ2O6bAR/ZlKb7ZgDAE+zhu0c7nQEuXwi1I6d5COQWpN
 7ATPy7tjQllyy3hc6rBRsn5QPW+8G/vvg7RRLvdgjL/IsDlfwVzHLZDa16ARr01VRDkF
 Tl6b1NF5mLbD1hSsR4kBKgamwB3RLyCKJm1/cjNh11/zuKF/go1vsdHpK1oNzej0HYdl
 PKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553222; x=1702158022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFU7OFJOJ4xHNZ5L09yPSOpNQR7d3JJ0rTrMhB4JJ1g=;
 b=hNXzsv4LWJTo16bHj9fFadYub9J9HtRt4B4wXgTmC+04CVLOWTmzGo67H+nZDdNQoe
 EsI0+FQ8pmTcGXbU1CnU1a+j8Zx8fXTGlZXE6Cb3Xr743xcaZxBwWhSKp6XemprUyfdA
 SSmfWsZBjSF3RNf659WdlHpbGAnGGG03o5tz3XKgTf55oQbO+WvZYnElLcrCtZle6nRM
 nYoOhUAM371qiUGrQaolxqyBZoCeCDvH6+3u4ckQGhCmot+WFbe68zAyOHjg4KgchqLN
 cyqizOI8njHUq+Qfu8a79Rmw+ocPOeDOMjOxYOA3vJUpBuL4G84ZydFKxWp/sovKLnMU
 h98A==
X-Gm-Message-State: AOJu0YyZguLg30bURF+YLxkX/dn1nEiwhxp2w2yRnR9+qJVbtsP258r8
 /+HGPZYPn/M67jdDDULFwtSKWA==
X-Google-Smtp-Source: AGHT+IHkFxU1JXl5KfU8HyxH8INHxhH2dXpnejaQc8DnvHo65WlmT4+VLPwHvYHpCk6d4HR0fZG/pw==
X-Received: by 2002:a05:6512:1054:b0:50b:d764:64cb with SMTP id
 c20-20020a056512105400b0050bd76464cbmr2006390lfb.128.1701553222460; 
 Sat, 02 Dec 2023 13:40:22 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 06/12] drm/msm/dpu: pull format flag definitions to msm_drv.h
Date: Sun,  3 Dec 2023 00:40:10 +0300
Message-Id: <20231202214016.1257621-7-dmitry.baryshkov@linaro.org>
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

In preparation to merger of formats databases, pull format flag
definitions to msm_drv.h header, so that they are visibile to both dpu
and mdp drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 98 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 28 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  8 +-
 drivers/gpu/drm/msm/disp/mdp_format.c       |  6 +-
 drivers/gpu/drm/msm/disp/mdp_kms.h          |  3 +-
 drivers/gpu/drm/msm/msm_drv.h               | 24 +++++
 8 files changed, 91 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 3112d85808c7..25d3451e8260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -44,8 +44,8 @@ bp, flg, fm, np)                                                          \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -63,8 +63,8 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -83,8 +83,8 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_tight = 1,                                                \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -101,8 +101,8 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -120,8 +120,8 @@ flg, fm, np, th)                                                          \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -138,8 +138,8 @@ flg, fm, np, th)                                                          \
 	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -157,8 +157,8 @@ flg, fm, np, th)                                                          \
 	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -177,8 +177,8 @@ flg, fm, np)                                                      \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.base.fetch_mode = fm,                                            \
+	.base.flags = flg,                                                \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -365,115 +365,115 @@ static const struct dpu_format dpu_format_map[] = {
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
+		true, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, DPU_FORMAT_FLAG_DX,
+		false, 4, MSM_FORMAT_FLAG_DX,
 		MDP_FETCH_LINEAR, 1),
 
 	PSEUDO_YUV_FMT(NV12,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_YUV,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV21,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, DPU_FORMAT_FLAG_YUV,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV16,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
+		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV61,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
+		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_YUV,
+		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(VYUY,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 2),
 
 	PLANAR_YUV_FMT(YUV420,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 3),
 
 	PLANAR_YUV_FMT(YVU420,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
+		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 3),
 };
 
@@ -487,13 +487,13 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, DPU_FORMAT_FLAG_COMPRESSED,
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
@@ -503,37 +503,37 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
@@ -543,22 +543,22 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_YUV |
-				DPU_FORMAT_FLAG_COMPRESSED,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV |
+				MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, DPU_FORMAT_FLAG_DX |
-				DPU_FORMAT_FLAG_YUV |
-				DPU_FORMAT_FLAG_COMPRESSED,
+		CHROMA_420, MSM_FORMAT_FLAG_DX |
+				MSM_FORMAT_FLAG_YUV |
+				MSM_FORMAT_FLAG_COMPRESSED,
 		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index caa0ff2d192f..2139e3dedef3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -36,25 +36,11 @@
 #define DPU_MAX_DE_CURVES		3
 #endif
 
-enum dpu_format_flags {
-	DPU_FORMAT_FLAG_YUV_BIT,
-	DPU_FORMAT_FLAG_DX_BIT,
-	DPU_FORMAT_FLAG_COMPRESSED_BIT,
-};
-
-#define DPU_FORMAT_FLAG_YUV		BIT(DPU_FORMAT_FLAG_YUV_BIT)
-#define DPU_FORMAT_FLAG_DX		BIT(DPU_FORMAT_FLAG_DX_BIT)
-#define DPU_FORMAT_FLAG_COMPRESSED	BIT(DPU_FORMAT_FLAG_COMPRESSED_BIT)
-
-#define DPU_FORMAT_IS_YUV(X)		((X)->flags & DPU_FORMAT_FLAG_YUV)
-#define DPU_FORMAT_IS_DX(X)		((X)->flags & DPU_FORMAT_FLAG_DX)
-#define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
-#define DPU_FORMAT_IS_TILE(X) \
-	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-	 !((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
-#define DPU_FORMAT_IS_UBWC(X) \
-	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-	 ((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
+#define DPU_FORMAT_IS_YUV(X)		MSM_FORMAT_IS_YUV(&(X)->base)
+#define DPU_FORMAT_IS_DX(X)		MSM_FORMAT_IS_DX(&(X)->base)
+#define DPU_FORMAT_IS_LINEAR(X)		MSM_FORMAT_IS_LINEAR(&(X)->base)
+#define DPU_FORMAT_IS_TILE(X)		MSM_FORMAT_IS_TILE(&(X)->base)
+#define DPU_FORMAT_IS_UBWC(X)		MSM_FORMAT_IS_UBWC(&(X)->base)
 
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
 #define DPU_BLEND_FG_ALPHA_BG_CONST	(1 << 0)
@@ -322,8 +308,6 @@ enum dpu_3d_blend_mode {
  * @bpp: bytes per pixel
  * @alpha_enable: whether the format has an alpha channel
  * @num_planes: number of planes (including meta data planes)
- * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
- * @flags: usage bit flags
  * @tile_width: format tile width
  * @tile_height: format tile height
  */
@@ -339,8 +323,6 @@ struct dpu_format {
 	u8 bpp;
 	u8 alpha_enable;
 	u8 num_planes;
-	enum mdp_fetch_mode fetch_mode;
-	unsigned long flags;
 	u16 tile_width;
 	u16 tile_height;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d6530b11fc82..1363dcc72a6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -266,10 +266,10 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
-	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+	if (!DPU_FORMAT_IS_LINEAR(fmt)) {
 		if (DPU_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
-		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
+		src_format |= (fmt->base.fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			ctx->ubwc->highest_bank_bit << 18);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 17d0b4bcdc89..aa505b1a9f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -295,14 +295,14 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
-			(fmt) ? fmt->fetch_mode : 0,
+			(fmt) ? fmt->base.fetch_mode : 0,
 			cfg.danger_lut,
 			cfg.safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
 		pdpu->pipe - SSPP_VIG0,
 		fmt ? (char *)&fmt->base.pixel_format : NULL,
-		fmt ? fmt->fetch_mode : -1,
+		fmt ? fmt->base.fetch_mode : -1,
 		cfg.danger_lut,
 		cfg.safe_lut);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index aa8342d93393..e40f6d1d5433 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -634,10 +634,10 @@ static uint32_t get_scale_config(const struct mdp_format *format,
 		uint32_t src, uint32_t dst, bool horz)
 {
 	const struct drm_format_info *info = drm_format_info(format->base.pixel_format);
-	bool scaling = format->is_yuv ? true : (src != dst);
+	bool yuv = MDP_FORMAT_IS_YUV(format);
+	bool scaling = yuv ? true : (src != dst);
 	uint32_t sub;
 	uint32_t ya_filter, uv_filter;
-	bool yuv = format->is_yuv;
 
 	if (!scaling)
 		return 0;
@@ -666,7 +666,7 @@ static void calc_pixel_ext(const struct mdp_format *format,
 		int pix_ext_edge1[COMP_MAX], int pix_ext_edge2[COMP_MAX],
 		bool horz)
 {
-	bool scaling = format->is_yuv ? true : (src != dst);
+	bool scaling = MDP_FORMAT_IS_YUV(format) ? true : (src != dst);
 	int i;
 
 	/*
@@ -696,7 +696,7 @@ static void mdp5_write_pixel_ext(struct mdp5_kms *mdp5_kms, enum mdp5_pipe pipe,
 		uint32_t roi_w = src_w;
 		uint32_t roi_h = src_h;
 
-		if (format->is_yuv && i == COMP_1_2) {
+		if (MDP_FORMAT_IS_YUV(format) && i == COMP_1_2) {
 			roi_w /= info->hsub;
 			roi_h /= info->vsub;
 		}
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 69ab5bcff1a9..30919641c813 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -63,7 +63,10 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 };
 
 #define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
-		.base = { .pixel_format = DRM_FORMAT_ ## name }, \
+		.base = {                                        \
+			.pixel_format = DRM_FORMAT_ ## name,     \
+			.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,  \
+		},                                               \
 		.bpc_a = BPC ## a ## A,                          \
 		.bpc_r = BPC ## r,                               \
 		.bpc_g = BPC ## g,                               \
@@ -75,7 +78,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 		.unpack_count = cnt,                             \
 		.fetch_type = fp,                                \
 		.chroma_sample = cs,                             \
-		.is_yuv = yuv,                                   \
 }
 
 #define BPC0A 0
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index d0718c16de3e..ffa71777dada 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -86,10 +86,9 @@ struct mdp_format {
 	uint8_t cpp, unpack_count;
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
-	bool is_yuv;
 };
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
-#define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
+#define MDP_FORMAT_IS_YUV(mdp_format) (MSM_FORMAT_IS_YUV(&(mdp_format)->base))
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 628ef3e663ea..b37546ffb0c3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -33,6 +33,8 @@
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
+#include "disp/mdp_common.xml.h"
+
 #ifdef CONFIG_FAULT_INJECTION
 extern struct fault_attr fail_gem_alloc;
 extern struct fault_attr fail_gem_iova;
@@ -249,10 +251,32 @@ struct msm_drm_private {
 	bool disable_err_irq;
 };
 
+enum msm_format_flags {
+	MSM_FORMAT_FLAG_YUV_BIT,
+	MSM_FORMAT_FLAG_DX_BIT,
+	MSM_FORMAT_FLAG_COMPRESSED_BIT,
+};
+
+#define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
+#define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
+#define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
+
 struct msm_format {
 	uint32_t pixel_format;
+	unsigned long flags;
+	enum mdp_fetch_mode fetch_mode;
 };
 
+#define MSM_FORMAT_IS_YUV(X)		((X)->flags & MSM_FORMAT_FLAG_YUV)
+#define MSM_FORMAT_IS_DX(X)		((X)->flags & MSM_FORMAT_FLAG_DX)
+#define MSM_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
+#define MSM_FORMAT_IS_TILE(X) \
+	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
+	 !((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
+#define MSM_FORMAT_IS_UBWC(X) \
+	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
+	 ((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
+
 struct msm_pending_timer;
 
 int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
-- 
2.39.2

