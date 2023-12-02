Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C69801ED3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4832B10E0CB;
	Sat,  2 Dec 2023 21:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF3710E0ED
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bc8e37b5fso4740518e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553220; x=1702158020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fLSVQeJPy9RHvzEIAIGg2GSwp9vuyoSPXrOy+9C++e8=;
 b=pcryyjKY6CBLm/B/YDEDMXGoTM1c0Fw+orAeO8YbxXXi+f5A+fbmccYbaeOMhL5dn5
 W/Vonfi/Q9ZxbuT5Uhwp3TwZUF+weMcKSeDXaWIWHZQs8xSUC7q2iIFqNP6Rajdi/CXs
 OzFHaymiyG6UcyJIQQ5MmD58YRht6khXq4O32m/WhzkoBnIscgKkgaxjd4xTKtLIWihU
 kbNGqm5x1hugvbuAgcU3zeRbuR8PddUXp3lQQXNAbJUgm+yHFSACWMYmeQQZhrBGWsXw
 foA1XOXSL2uKP4RdHjGezQqoSU+L1TZjUNL9upq8UeT8NZ/LJrTIFMvrNKMB+oB9LlcC
 mnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553220; x=1702158020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLSVQeJPy9RHvzEIAIGg2GSwp9vuyoSPXrOy+9C++e8=;
 b=WenLTN6DLDA4I8T/sMoDO7mVXjj6f/hEz5rKvc3/mPPaU0pDj/QpiGVDieldD2hnHJ
 AfcrqM8Jb07+p1S4HJ9Zuz4VC711SRnoKyWZ1nisv0BZrlf0YY/ipOwHPm02zkjRh6oe
 hMjvhHoDFCanKfSMu+NtL+oR2tnSZlpMYtk16CkB6hvUtMB4BWEbhBv688Pmf0T4dWX0
 l/w29MJJdKSZXk37Bivz3dEUirO1GregVx07h150K/Nmv+7vbv27x/dtZhIhGtAAS1Qm
 dxwWiTETNffSkMHYs5YuQzVeLMOvrbL5C/CxwHjyNkNQZwqJX6Sv+eWyKLDXlAqyAbML
 zs2w==
X-Gm-Message-State: AOJu0YzO63qVH5vZieYh6k3jvTqQa9SOqy2FfUi2lzGryS3NQSVjYPDk
 9rde+lW2Nsq1Gqx78RLohY7DjA==
X-Google-Smtp-Source: AGHT+IGRMr5u5wWPSGNm/JAcceii5YQ2zc9nADWu0tcWXTMu9kEFYRpjPv71XPomc80+LwAQAILJxA==
X-Received: by 2002:a05:6512:3692:b0:50b:f006:3f92 with SMTP id
 d18-20020a056512369200b0050bf0063f92mr202746lfs.134.1701553219944; 
 Sat, 02 Dec 2023 13:40:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
Date: Sun,  3 Dec 2023 00:40:07 +0300
Message-Id: <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
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

Instead of having DPU-specific defines, switch to the definitions from
the mdp_common.xml.h file. This is the preparation for merged of DPU and
MDP format tables.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 290 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  64 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   4 +-
 6 files changed, 164 insertions(+), 214 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 0b6a761d68b7..4fead04d83a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -640,7 +640,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 	wb_cfg->dest.height = job->fb->height;
 	wb_cfg->dest.num_planes = wb_cfg->dest.format->num_planes;
 
-	if ((wb_cfg->dest.format->fetch_planes == DPU_PLANE_PLANAR) &&
+	if ((wb_cfg->dest.format->fetch_planes == MDP_PLANE_PLANAR) &&
 			(wb_cfg->dest.format->element[0] == C1_B_Cb))
 		swap(wb_cfg->dest.plane_addr[1], wb_cfg->dest.plane_addr[2]);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e366ab134249..05e82f5dd0e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -35,11 +35,11 @@
 bp, flg, fm, np)                                                          \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_INTERLEAVED,                            \
+	.fetch_planes = MDP_PLANE_INTERLEAVED,                            \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bits = { g, b, r, a },                                           \
-	.chroma_sample = DPU_CHROMA_RGB,                                  \
+	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
@@ -54,11 +54,11 @@ bp, flg, fm, np)                                                          \
 alpha, bp, flg, fm, np, th)                                               \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_INTERLEAVED,                            \
+	.fetch_planes = MDP_PLANE_INTERLEAVED,                            \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bits = { g, b, r, a },                                           \
-	.chroma_sample = DPU_CHROMA_RGB,                                  \
+	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
@@ -74,7 +74,7 @@ alpha, bp, flg, fm, np, th)                                               \
 alpha, chroma, count, bp, flg, fm, np)                                    \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_INTERLEAVED,                            \
+	.fetch_planes = MDP_PLANE_INTERLEAVED,                            \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bits = { g, b, r, a },                                           \
@@ -92,7 +92,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 #define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_PSEUDO_PLANAR,                          \
+	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
 	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bits = { g, b, r, a },                                           \
@@ -111,7 +111,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 flg, fm, np, th)                                                          \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_PSEUDO_PLANAR,                          \
+	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
 	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bits = { g, b, r, a },                                           \
@@ -129,7 +129,7 @@ flg, fm, np, th)                                                          \
 #define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_PSEUDO_PLANAR,                          \
+	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
 	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bits = { g, b, r, a },                                           \
@@ -148,7 +148,7 @@ flg, fm, np, th)                                                          \
 flg, fm, np, th)                                                          \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_PSEUDO_PLANAR,                          \
+	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
 	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bits = { g, b, r, a },                                           \
@@ -168,7 +168,7 @@ flg, fm, np, th)                                                          \
 flg, fm, np)                                                      \
 {                                                                         \
 	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = DPU_PLANE_PLANAR,                                 \
+	.fetch_planes = MDP_PLANE_PLANAR,                                 \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bits = { g, b, r, a },                                           \
@@ -195,286 +195,286 @@ struct dpu_media_color_map {
 
 static const struct dpu_format dpu_format_map[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		true, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ABGR8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XBGR8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBA8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		true, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRA8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		true, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRX8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		false, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XRGB8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		false, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBX8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		false, 4, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGB888,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
 		false, 3, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGR888,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
 		false, 3, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGB565,
-		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
+		0, BPC5, BPC6, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGR565,
-		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
+		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ARGB1555,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ABGR1555,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBA5551,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRA5551,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XRGB1555,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XBGR1555,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBX5551,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRX5551,
-		COLOR_ALPHA_1BIT, COLOR_5BIT, COLOR_5BIT, COLOR_5BIT,
+		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ARGB4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ABGR4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBA4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRA4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		true, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XRGB4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XBGR4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBX4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRX4444,
-		COLOR_ALPHA_4BIT, COLOR_4BIT, COLOR_4BIT, COLOR_4BIT,
+		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		false, 2, 0,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRA1010102,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		true, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		true, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
 		false, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
 		false, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
 		false, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_LINEAR, 1),
+		MDP_FETCH_LINEAR, 1),
 
 	PSEUDO_YUV_FMT(NV12,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		CHROMA_420, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV21,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		CHROMA_420, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV16,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT(NV61,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		DPU_CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		CHROMA_420, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(VYUY,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, DPU_CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(UYVY,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, DPU_CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(YUYV,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, DPU_CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	INTERLEAVED_YUV_FMT(YVYU,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, DPU_CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 2),
+		false, CHROMA_H2V1, 4, 2, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
 
 	PLANAR_YUV_FMT(YUV420,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 3),
+		false, CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 3),
 
 	PLANAR_YUV_FMT(YVU420,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_LINEAR, 3),
+		false, CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 3),
 };
 
 /*
@@ -485,88 +485,88 @@ static const struct dpu_format dpu_format_map[] = {
  */
 static const struct dpu_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
+		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
 		false, 2, DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
 	 * natively.
 	 */
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
 	* natively.
 	*/
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV |
+		CHROMA_420, DPU_FORMAT_FLAG_YUV |
 				DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
+		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_DX |
+		CHROMA_420, DPU_FORMAT_FLAG_DX |
 				DPU_FORMAT_FLAG_YUV |
 				DPU_FORMAT_FLAG_COMPRESSED,
-		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
+		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
 };
 
 /* _dpu_get_v_h_subsample_rate - Get subsample rates for all formats we support
  *   Note: Not using the drm_format_*_subsampling since we have formats
  */
 static void _dpu_get_v_h_subsample_rate(
-	enum dpu_chroma_samp_type chroma_sample,
+	enum mdp_chroma_samp_type chroma_sample,
 	uint32_t *v_sample,
 	uint32_t *h_sample)
 {
@@ -574,15 +574,15 @@ static void _dpu_get_v_h_subsample_rate(
 		return;
 
 	switch (chroma_sample) {
-	case DPU_CHROMA_H2V1:
+	case CHROMA_H2V1:
 		*v_sample = 1;
 		*h_sample = 2;
 		break;
-	case DPU_CHROMA_H1V2:
+	case CHROMA_H1V2:
 		*v_sample = 2;
 		*h_sample = 1;
 		break;
-	case DPU_CHROMA_420:
+	case CHROMA_420:
 		*v_sample = 2;
 		*h_sample = 2;
 		break;
@@ -724,7 +724,7 @@ static int _dpu_format_get_plane_sizes_linear(
 	layout->num_planes = fmt->num_planes;
 
 	/* Due to memset above, only need to set planes of interest */
-	if (fmt->fetch_planes == DPU_PLANE_INTERLEAVED) {
+	if (fmt->fetch_planes == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
 		layout->plane_size[0] = width * height * layout->format->bpp;
 		layout->plane_pitch[0] = width * layout->format->bpp;
@@ -751,7 +751,7 @@ static int _dpu_format_get_plane_sizes_linear(
 		layout->plane_size[1] = layout->plane_pitch[1] *
 				(height / v_subsample);
 
-		if (fmt->fetch_planes == DPU_PLANE_PSEUDO_PLANAR) {
+		if (fmt->fetch_planes == MDP_PLANE_PSEUDO_PLANAR) {
 			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index e8b8908d3e12..06c6001b0626 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -204,9 +204,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 				(0x21 << 8));
 	else
 		/* Interface treats all the pixel data in RGB888 format */
-		panel_format = (COLOR_8BIT |
-				(COLOR_8BIT << 2) |
-				(COLOR_8BIT << 4) |
+		panel_format = (BPC8 |
+				(BPC8 << 2) |
+				(BPC8 << 4) |
 				(0x21 << 8));
 
 	DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index d85157acfbf8..ebb3f9f493c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 
 #include "msm_drv.h"
+#include "disp/mdp_common.xml.h"
 
 #define DPU_DBG_NAME			"dpu"
 
@@ -49,12 +50,12 @@ enum dpu_format_flags {
 	(test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
 #define DPU_FORMAT_IS_DX(X)		\
 	(test_bit(DPU_FORMAT_FLAG_DX_BIT, (X)->flag))
-#define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == DPU_FETCH_LINEAR)
+#define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
 #define DPU_FORMAT_IS_TILE(X) \
-	(((X)->fetch_mode == DPU_FETCH_UBWC) && \
+	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
 			!test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
 #define DPU_FORMAT_IS_UBWC(X) \
-	(((X)->fetch_mode == DPU_FETCH_UBWC) && \
+	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
 			test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
 
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
@@ -291,57 +292,6 @@ enum {
 	C3_ALPHA = 3
 };
 
-/**
- * enum dpu_plane_type - defines how the color component pixel packing
- * @DPU_PLANE_INTERLEAVED   : Color components in single plane
- * @DPU_PLANE_PLANAR        : Color component in separate planes
- * @DPU_PLANE_PSEUDO_PLANAR : Chroma components interleaved in separate plane
- */
-enum dpu_plane_type {
-	DPU_PLANE_INTERLEAVED,
-	DPU_PLANE_PLANAR,
-	DPU_PLANE_PSEUDO_PLANAR,
-};
-
-/**
- * enum dpu_chroma_samp_type - chroma sub-samplng type
- * @DPU_CHROMA_RGB   : No chroma subsampling
- * @DPU_CHROMA_H2V1  : Chroma pixels are horizontally subsampled
- * @DPU_CHROMA_H1V2  : Chroma pixels are vertically subsampled
- * @DPU_CHROMA_420   : 420 subsampling
- */
-enum dpu_chroma_samp_type {
-	DPU_CHROMA_RGB,
-	DPU_CHROMA_H2V1,
-	DPU_CHROMA_H1V2,
-	DPU_CHROMA_420
-};
-
-/**
- * dpu_fetch_type - Defines How DPU HW fetches data
- * @DPU_FETCH_LINEAR   : fetch is line by line
- * @DPU_FETCH_TILE     : fetches data in Z order from a tile
- * @DPU_FETCH_UBWC     : fetch and decompress data
- */
-enum dpu_fetch_type {
-	DPU_FETCH_LINEAR,
-	DPU_FETCH_TILE,
-	DPU_FETCH_UBWC
-};
-
-/**
- * Value of enum chosen to fit the number of bits
- * expected by the HW programming.
- */
-enum {
-	COLOR_ALPHA_1BIT = 0,
-	COLOR_ALPHA_4BIT = 1,
-	COLOR_4BIT = 0,
-	COLOR_5BIT = 1, /* No 5-bit Alpha */
-	COLOR_6BIT = 2, /* 6-Bit Alpha also = 2 */
-	COLOR_8BIT = 3, /* 8-Bit Alpha also = 3 */
-};
-
 /**
  * enum dpu_3d_blend_mode
  * Desribes how the 3d data is blended
@@ -381,17 +331,17 @@ enum dpu_3d_blend_mode {
  */
 struct dpu_format {
 	struct msm_format base;
-	enum dpu_plane_type fetch_planes;
+	enum mdp_fetch_type fetch_planes;
 	u8 element[DPU_MAX_PLANES];
 	u8 bits[DPU_MAX_PLANES];
-	enum dpu_chroma_samp_type chroma_sample;
+	enum mdp_chroma_samp_type chroma_sample;
 	u8 unpack_align_msb;
 	u8 unpack_tight;
 	u8 unpack_count;
 	u8 bpp;
 	u8 alpha_enable;
 	u8 num_planes;
-	enum dpu_fetch_type fetch_mode;
+	enum mdp_fetch_mode fetch_mode;
 	DECLARE_BITMAP(flag, DPU_FORMAT_FLAG_BIT_MAX);
 	u16 tile_width;
 	u16 tile_height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 8e3c65989c49..d6530b11fc82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -240,10 +240,10 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	chroma_samp = fmt->chroma_sample;
 	if (flags & DPU_SSPP_SOURCE_ROTATED_90) {
-		if (chroma_samp == DPU_CHROMA_H2V1)
-			chroma_samp = DPU_CHROMA_H1V2;
-		else if (chroma_samp == DPU_CHROMA_H1V2)
-			chroma_samp = DPU_CHROMA_H2V1;
+		if (chroma_samp == CHROMA_H2V1)
+			chroma_samp = CHROMA_H1V2;
+		else if (chroma_samp == CHROMA_H1V2)
+			chroma_samp = CHROMA_H2V1;
 	}
 
 	src_format = (chroma_samp << 23) | (fmt->fetch_planes << 19) |
@@ -253,7 +253,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	if (flags & DPU_SSPP_ROT_90)
 		src_format |= BIT(11); /* ROT90 */
 
-	if (fmt->alpha_enable && fmt->fetch_planes == DPU_PLANE_INTERLEAVED)
+	if (fmt->alpha_enable && fmt->fetch_planes == MDP_PLANE_INTERLEAVED)
 		src_format |= BIT(8); /* SRCC3_EN */
 
 	if (flags & DPU_SSPP_SOLID_FILL)
@@ -266,7 +266,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
-	if (fmt->fetch_mode != DPU_FETCH_LINEAR) {
+	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		if (DPU_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1e0da38c6f2a..17d0b4bcdc89 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -215,8 +215,8 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 
 	/* FIXME: in multirect case account for the src_width of all the planes */
 
-	if (fmt->fetch_planes == DPU_PLANE_PSEUDO_PLANAR) {
-		if (fmt->chroma_sample == DPU_CHROMA_420) {
+	if (fmt->fetch_planes == MDP_PLANE_PSEUDO_PLANAR) {
+		if (fmt->chroma_sample == CHROMA_420) {
 			/* NV12 */
 			total_fl = (fixed_buff_size / 2) /
 				((src_width + 32) * fmt->bpp);
-- 
2.39.2

