Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF38AB964
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 06:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E3710F418;
	Sat, 20 Apr 2024 04:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NKf+sTNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9110F3BB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:22 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so3284853e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585680; x=1714190480; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ASw/DLWtlYrM+kULSPdvRvjRZBUSZfqtz4v/W4YvqE=;
 b=NKf+sTNJI+bqUAQ2ghpit9xLX1ieAeQyzuLeYjUDlQp43/zsRoloJ4prgNBShyd0H1
 rQLQnGRrlCiHrxiDx8NhbqiyJpkKCzhj+HxRizh1KZbnn22hAVDvvdPrXJkZ1Kw1G+OB
 OtzgUSZv5A34xIhcSpiG96bbK5RZBA6djw9P9G+H65cms4X2M6uYt/4UTZF5KjlZvVYC
 +okFCuu737M7xDryZlbrmsZdSPz+OV7TqaS6/zGB5uJqLz3c+r9U7bH6CiIWyi5nlGxD
 mupfxUNcgoHPeSC5jGQLo35kaKcZWvQxaKmdkWxOe6Xl6J9TwaxFJLGY24KG2wWexmzj
 SxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585680; x=1714190480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ASw/DLWtlYrM+kULSPdvRvjRZBUSZfqtz4v/W4YvqE=;
 b=nS1KlLzD3nhaxzIP5iG+Ho8R0hL/e5eH6ibfu3Gu1VSg8eQQhwFCPnwii1dsMuDFxE
 HAP9Jstqzwvh9lQ5/iz4nrLyAVNePUGfMwq+GOAKYPlp46g0NR5hM195nAOtOzjrVjhQ
 LJOAgs6qkDgGGXebRz3a0J0VZa0Z4BovzJyc181/hWiH4JJC5MD4zVeiHS/z/ISUIe0Y
 dolzmGwS16YgL+n5tgKnNE1oKtZe5bpzpOo5zSFmHOCOdILCC064dzZGGOIuXgnTleIn
 7XqnqwsYAqmcw4BVZZ2YMzQIjcbpIyMsC7wwIuOp5IQASzWvzHTAn1FmwkK0rWBuAOGP
 9iVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Jjz1xyEBoR3MGn5vPSb7PR7GCAshCUg71/uhUTmIq7zFc9KkkXw2TJkeMrQhGR7L0ida0zTgBcxViDGRsG2L61D4gstiRL/DKYT2lGRd
X-Gm-Message-State: AOJu0YyAJjxiTj9o8dOivXZ5KzV1et2omOvdgEJo9Y9QTAchwFwKCBON
 s6Ftx01be+B7GOMlt+I5Hpp/DHJ70tk+KSh7riJo8tB4F9rKqFSFAQfwp6asPyk=
X-Google-Smtp-Source: AGHT+IEQOSn0q8vHYXHHpEv0a1sXGsngiNeDzzAotCogw2O3pt3U7FE+G9DVArBQBK6bzPBVsxyvJw==
X-Received: by 2002:a05:6512:1595:b0:516:d692:5e0b with SMTP id
 bp21-20020a056512159500b00516d6925e0bmr2930917lfb.54.1713585680031; 
 Fri, 19 Apr 2024 21:01:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:05 +0300
Subject: [PATCH v2 8/9] drm/msm: merge dpu format database to MDP formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-8-9e93226cbffd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=56966;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Hq6jU+ra8wXbuK6BbNaQXK1704vkZs2xgphluSs0T9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4JyuN7+6bMjZ74/r20dneXdUlsm4Lp2cEVe
 tSikrl/4aOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+CQAKCRCLPIo+Aiko
 1eZqB/wJSxRDusRUzUf4RM7PeEFVCYLW0XMSD2vhLdvqFhy4PIC9bGYB0332aeTwkT53SsPtBgn
 yKzHhSnxEK89RNAwjDcHFn0XRXpd+URlyOUVcG/68uOcnIa71V6rPgCqWiTIQ6h65V3dKZSqkMu
 m+LgE2lw2XOsHDUmY7Odn3UOH21IgsJY9xqqiSfLlSb6yVgVp/htgMOTuuzDfl3i1WS8/RpNPKP
 96JtGO75269jfUclJ7Xrn4uhyB0m5mj2ocLYKcw+g/FwtVIVRvVpphDejJ5sEVJSWV7iyuN/YXl
 qsXWoPllq5XYZumyF53OeKBtBMIOyD5gPwE/JLK6jiwJljBS
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

Finally remove duplication between DPU and generic MDP code by merging
DPU format lists to the MDP format database.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 602 --------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  23 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  10 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp_format.c              | 614 ++++++++++++++++++---
 drivers/gpu/drm/msm/disp/mdp_format.h              |  10 +
 drivers/gpu/drm/msm/disp/mdp_kms.h                 |   2 -
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 11 files changed, 571 insertions(+), 708 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index deb2f6b446d3..b966c44ec835 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -274,7 +274,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
 
-	fmt = dpu_get_dpu_format(fmt_fourcc);
+	fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
 	DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
 
 	if (phys_enc->hw_cdm)
@@ -414,7 +414,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	ctl = phys_enc->hw_ctl;
 	fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
-	fmt = dpu_get_dpu_format(fmt_fourcc);
+	fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 8b5a4a1c239e..de17bcbb8492 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -326,7 +326,8 @@ static void dpu_encoder_phys_wb_setup(
 
 	wb_job = wb_enc->wb_job;
 	format = msm_framebuffer_format(wb_enc->wb_job->fb);
-	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
+	dpu_fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base,
+							    format->pixel_format, wb_job->fb->modifier);
 
 	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
 			hw_wb->idx - WB_0, mode.name,
@@ -576,8 +577,8 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = dpu_get_dpu_format_ext(
-			format->pixel_format, job->fb->modifier);
+	wb_cfg->dest.format = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base,
+					     format->pixel_format, job->fb->modifier);
 	if (!wb_cfg->dest.format) {
 		/* this error should be detected during atomic_check */
 		DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 2bb1584920c6..6b1e9a617da3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -11,186 +11,11 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#define DPU_UBWC_META_MACRO_W_H		16
-#define DPU_UBWC_META_BLOCK_SIZE	256
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
-#define DPU_TILE_HEIGHT_DEFAULT	1
-#define DPU_TILE_HEIGHT_TILED	4
-#define DPU_TILE_HEIGHT_UBWC	4
-#define DPU_TILE_HEIGHT_NV12	8
-
 #define DPU_MAX_IMG_WIDTH		0x3FFF
 #define DPU_MAX_IMG_HEIGHT		0x3FFF
 
-/*
- * DPU supported format packing, bpp, and other format
- * information.
- * DPU currently only supports interleaved RGB formats
- * UBWC support for a pixel format is indicated by the flag,
- * there is additional meta data plane for such formats
- */
-
-#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg, fm, np)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
-	.element = { (e0), (e1), (e2), (e3) },                            \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
-	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
-}
-
-#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg, fm, np, th)                                               \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
-	.element = { (e0), (e1), (e2), (e3) },                            \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
-	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
-
-#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
-alpha, chroma, count, bp, flg, fm, np)                                    \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
-	.element = { (e0), (e1), (e2), (e3)},                             \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = count,                                            \
-	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
-}
-
-#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
-}
-
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
-#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
-}
-
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
-
-#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
-flg, fm, np)                                                      \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
-	.element = { (e0), (e1), (e2), 0 },                               \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 1,                                                \
-	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
-}
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
@@ -201,375 +26,6 @@ struct dpu_media_color_map {
 	uint32_t color;
 };
 
-static const struct msm_format dpu_format_map[] = {
-	INTERLEAVED_RGB_FMT(ARGB8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ABGR8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XBGR8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBA8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRA8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRX8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XRGB8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBX8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGB888,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGR888,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGB565,
-		0, BPC5, BPC6, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ARGB1555,
-		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ABGR1555,
-		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBA5551,
-		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRA5551,
-		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XRGB1555,
-		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XBGR1555,
-		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBX5551,
-		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRX5551,
-		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ARGB4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ABGR4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBA4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRA4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XRGB4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XBGR4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBX4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRX4444,
-		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRA1010102,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBA1010102,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ABGR2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(ARGB2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XRGB2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(BGRX1010102,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(XBGR2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	INTERLEAVED_RGB_FMT(RGBX1010102,
-		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
-
-	PSEUDO_YUV_FMT(NV12,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	PSEUDO_YUV_FMT(NV21,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	PSEUDO_YUV_FMT(NV16,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	PSEUDO_YUV_FMT(NV61,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	PSEUDO_YUV_FMT_LOOSE(P010,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	INTERLEAVED_YUV_FMT(VYUY,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	INTERLEAVED_YUV_FMT(UYVY,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	INTERLEAVED_YUV_FMT(YUYV,
-		0, BPC8, BPC8, BPC8,
-		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	INTERLEAVED_YUV_FMT(YVYU,
-		0, BPC8, BPC8, BPC8,
-		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
-
-	PLANAR_YUV_FMT(YUV420,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
-
-	PLANAR_YUV_FMT(YVU420,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
-};
-
-/*
- * UBWC formats table:
- * This table holds the UBWC formats supported.
- * If a compression ratio needs to be used for this or any other format,
- * the data will be passed by user-space.
- */
-static const struct msm_format dpu_format_map_ubwc[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	/* ARGB8888 and ABGR8888 purposely have the same color
-	 * ordering.  The hardware only supports ABGR8888 UBWC
-	 * natively.
-	 */
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	/* XRGB2101010 and ARGB2101010 purposely have the same color
-	* ordering.  The hardware only supports ARGB2101010 UBWC
-	* natively.
-	*/
-	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
-		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
-
-	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
-
-	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
-};
-
 /* _dpu_get_v_h_subsample_rate - Get subsample rates for all formats we support
  *   Note: Not using the drm_format_*_subsampling since we have formats
  */
@@ -1010,61 +466,3 @@ int dpu_format_check_modified_format(
 
 	return 0;
 }
-
-const struct msm_format *dpu_get_dpu_format_ext(
-		const uint32_t format,
-		const uint64_t modifier)
-{
-	uint32_t i = 0;
-	const struct msm_format *fmt = NULL;
-	const struct msm_format *map = NULL;
-	ssize_t map_size = 0;
-
-	/*
-	 * Currently only support exactly zero or one modifier.
-	 * All planes use the same modifier.
-	 */
-	DRM_DEBUG_ATOMIC("plane format modifier 0x%llX\n", modifier);
-
-	switch (modifier) {
-	case 0:
-		map = dpu_format_map;
-		map_size = ARRAY_SIZE(dpu_format_map);
-		break;
-	case DRM_FORMAT_MOD_QCOM_COMPRESSED:
-		map = dpu_format_map_ubwc;
-		map_size = ARRAY_SIZE(dpu_format_map_ubwc);
-		DRM_DEBUG_ATOMIC("found fmt: %4.4s  DRM_FORMAT_MOD_QCOM_COMPRESSED\n",
-				(char *)&format);
-		break;
-	default:
-		DPU_ERROR("unsupported format modifier %llX\n", modifier);
-		return NULL;
-	}
-
-	for (i = 0; i < map_size; i++) {
-		if (format == map[i].pixel_format) {
-			fmt = &map[i];
-			break;
-		}
-	}
-
-	if (fmt == NULL)
-		DPU_ERROR("unsupported fmt: %4.4s modifier 0x%llX\n",
-			(char *)&format, modifier);
-	else
-		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %ld\n",
-				(char *)&format, modifier,
-				MSM_FORMAT_IS_UBWC(fmt),
-				MSM_FORMAT_IS_YUV(fmt));
-
-	return fmt;
-}
-
-const struct msm_format *dpu_get_msm_format(
-		struct msm_kms *kms,
-		const uint32_t format,
-		const uint64_t modifiers)
-{
-	return dpu_get_dpu_format_ext(format, modifiers);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 78b585dca195..72ffd48fa6de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -9,17 +9,6 @@
 #include "msm_gem.h"
 #include "dpu_hw_mdss.h"
 
-/**
- * dpu_get_dpu_format_ext() - Returns dpu format structure pointer.
- * @format:          DRM FourCC Code
- * @modifiers:       format modifier array from client, one per plane
- */
-const struct msm_format *dpu_get_dpu_format_ext(
-		const uint32_t format,
-		const uint64_t modifier);
-
-#define dpu_get_dpu_format(f) dpu_get_dpu_format_ext(f, 0)
-
 /**
  * dpu_find_format - validate if the pixel format is supported
  * @format:		dpu format
@@ -42,18 +31,6 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-/**
- * dpu_get_msm_format - get an msm_format by its msm_format base
- *                     callback function registers with the msm_kms layer
- * @kms:             kms driver
- * @format:          DRM FourCC Code
- * @modifiers:       data layout modifier
- */
-const struct msm_format *dpu_get_msm_format(
-		struct msm_kms *kms,
-		const uint32_t format,
-		const uint64_t modifiers);
-
 /**
  * dpu_format_check_modified_format - validate format and buffers for
  *                   dpu non-standard, i.e. modified format
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index d40572b251b1..66759623fc42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -270,16 +270,6 @@ enum dpu_vbif {
 	VBIF_MAX,
 };
 
-/**
- * DPU HW,Component order color map
- */
-enum {
-	C0_G_Y = 0,
-	C1_B_Cb = 1,
-	C2_R_Cr = 2,
-	C3_ALPHA = 3
-};
-
 /**
  * enum dpu_3d_blend_mode
  * Desribes how the 3d data is blended
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9a1fe6868979..cb30137443e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -982,7 +982,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
-	.get_format      = dpu_get_msm_format,
+	.get_format      = mdp_get_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4de5c37d6e92..b92a13cc9b36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -617,6 +617,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 {
 	const struct msm_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
+	struct msm_drm_private *priv = plane->dev->dev_private;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
 
@@ -626,7 +627,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * select fill format to match user property expectation,
 	 * h/w only supports RGB variants
 	 */
-	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
+	fmt = priv->kms->funcs->get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
 	/* should not happen ever */
 	if (!fmt)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index b9f0b13d25d5..426782d50cb4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -62,87 +62,573 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	},
 };
 
-#define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, c, cnt, fp, cs, yuv) { \
-		.pixel_format = DRM_FORMAT_ ## name,             \
-		.bpc_a = BPC ## a ## A,                          \
-		.bpc_r_cr = BPC ## r,                            \
-		.bpc_g_y = BPC ## g,                             \
-		.bpc_b_cb = BPC ## b,                            \
-		.element = { e0, e1, e2, e3 },                   \
-		.fetch_type = fp,                                \
-		.chroma_sample = cs,                             \
-		.alpha_enable = alpha,                           \
-		.unpack_count = cnt,                             \
-		.bpp = c,                                        \
-		.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |          \
-			(yuv ? MSM_FORMAT_FLAG_YUV : 0),         \
+#define MDP_TILE_HEIGHT_DEFAULT	1
+#define MDP_TILE_HEIGHT_UBWC	4
+#define MDP_TILE_HEIGHT_NV12	8
+
+#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
+bp, flg, fm, np)                                                          \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = alpha,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = uc,                                               \
+	.bpp = bp,                                                        \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.num_planes = np,                                                 \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
+alpha, bp, flg, fm, np, th)                                               \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = alpha,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = uc,                                               \
+	.bpp = bp,                                                        \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.num_planes = np,                                                 \
+	.tile_height = th                                                 \
+}
+
+#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
+alpha, chroma, count, bp, flg, fm, np)                                    \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = alpha,                                            \
+	.element = { (e0), (e1), (e2), (e3)},                             \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = chroma,                                          \
+	.unpack_count = count,                                            \
+	.bpp = bp,                                                        \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.num_planes = np,                                                 \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
+	.element = { (e0), (e1), 0, 0 },                                  \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = chroma,                                          \
+	.unpack_count = 2,                                                \
+	.bpp = 2,                                                         \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.num_planes = np,                                                 \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
+flg, fm, np, th)                                                          \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
+	.element = { (e0), (e1), 0, 0 },                                  \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = chroma,                                          \
+	.unpack_count = 2,                                                \
+	.bpp = 2,                                                         \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.num_planes = np,                                                 \
+	.tile_height = th                                                 \
+}
+
+#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
+	.element = { (e0), (e1), 0, 0 },                                  \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = chroma,                                          \
+	.unpack_count = 2,                                                \
+	.bpp = 2,                                                         \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
+	.num_planes = np,                                                 \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define BPC0A 0
-
-static const struct msm_format formats[] = {
-	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   cpp cnt ... */
-	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(ABGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  true,   4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGBA8888, 8, 8, 8, 8,  3, 1, 0, 2,  true,   4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGRA8888, 8, 8, 8, 8,  3, 2, 0, 1,  true,   4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(XRGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  false,  4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(XBGR8888, 8, 8, 8, 8,  2, 0, 1, 3,  false,  4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGBX8888, 8, 8, 8, 8,  3, 1, 0, 2,  false,  4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGRX8888, 8, 8, 8, 8,  3, 2, 0, 1,  false,  4,  4,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGB888,   0, 8, 8, 8,  1, 0, 2, 0,  false,  3,  3,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGR888,   0, 8, 8, 8,  2, 0, 1, 0,  false,  3,  3,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(RGB565,   0, 5, 6, 5,  1, 0, 2, 0,  false,  2,  3,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
-	FMT(BGR565,   0, 5, 6, 5,  2, 0, 1, 0,  false,  2,  3,
-			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
+#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
+flg, fm, np, th)                                                          \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
+	.element = { (e0), (e1), 0, 0 },                                  \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = chroma,                                          \
+	.unpack_count = 2,                                                \
+	.bpp = 2,                                                         \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
+	.num_planes = np,                                                 \
+	.tile_height = th                                                 \
+}
+
+#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
+flg, fm, np)                                                      \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PLANAR,                                   \
+	.alpha_enable = alpha,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = chroma,                                          \
+	.unpack_count = 1,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = fm,                                                 \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.num_planes = np,                                                 \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+static const struct msm_format mdp_formats[] = {
+	INTERLEAVED_RGB_FMT(ARGB8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		true, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ABGR8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XBGR8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBA8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		true, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRA8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		true, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRX8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		false, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XRGB8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		false, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBX8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		false, 4, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGB888,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
+		false, 3, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGR888,
+		0, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
+		false, 3, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGB565,
+		0, BPC5, BPC6, BPC5,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGR565,
+		0, BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ARGB1555,
+		BPC1A, BPC5, BPC5, BPC5,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ABGR1555,
+		BPC1A, BPC5, BPC5, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBA5551,
+		BPC1A, BPC5, BPC5, BPC5,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRA5551,
+		BPC1A, BPC5, BPC5, BPC5,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XRGB1555,
+		BPC1A, BPC5, BPC5, BPC5,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XBGR1555,
+		BPC1A, BPC5, BPC5, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBX5551,
+		BPC1A, BPC5, BPC5, BPC5,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRX5551,
+		BPC1A, BPC5, BPC5, BPC5,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ARGB4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ABGR4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBA4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRA4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		true, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XRGB4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XBGR4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBX4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRX4444,
+		BPC4A, BPC4, BPC4, BPC4,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		false, 2, 0,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRA1010102,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		true, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBA1010102,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		true, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ABGR2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(ARGB2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XRGB2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
+		false, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(BGRX1010102,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
+		false, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(XBGR2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
+
+	INTERLEAVED_RGB_FMT(RGBX1010102,
+		BPC8A, BPC8, BPC8, BPC8,
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
+		false, 4, MSM_FORMAT_FLAG_DX,
+		MDP_FETCH_LINEAR, 1),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 
 	/* 2 plane YUV */
-	FMT(NV12,     0, 8, 8, 8,  1, 2, 0, 0,  false,  2, 2,
-			MDP_PLANE_PSEUDO_PLANAR, CHROMA_420, true),
-	FMT(NV21,     0, 8, 8, 8,  2, 1, 0, 0,  false,  2, 2,
-			MDP_PLANE_PSEUDO_PLANAR, CHROMA_420, true),
-	FMT(NV16,     0, 8, 8, 8,  1, 2, 0, 0,  false,  2, 2,
-			MDP_PLANE_PSEUDO_PLANAR, CHROMA_H2V1, true),
-	FMT(NV61,     0, 8, 8, 8,  2, 1, 0, 0,  false,  2, 2,
-			MDP_PLANE_PSEUDO_PLANAR, CHROMA_H2V1, true),
+	PSEUDO_YUV_FMT(NV12,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	PSEUDO_YUV_FMT(NV21,
+		0, BPC8, BPC8, BPC8,
+		C2_R_Cr, C1_B_Cb,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	PSEUDO_YUV_FMT(NV16,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr,
+		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	PSEUDO_YUV_FMT(NV61,
+		0, BPC8, BPC8, BPC8,
+		C2_R_Cr, C1_B_Cb,
+		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	PSEUDO_YUV_FMT_LOOSE(P010,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr,
+		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
 	/* 1 plane YUV */
-	FMT(VYUY,     0, 8, 8, 8,  2, 0, 1, 0,  false,  2, 4,
-			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(UYVY,     0, 8, 8, 8,  1, 0, 2, 0,  false,  2, 4,
-			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(YUYV,     0, 8, 8, 8,  0, 1, 0, 2,  false,  2, 4,
-			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
-	FMT(YVYU,     0, 8, 8, 8,  0, 2, 0, 1,  false,  2, 4,
-			MDP_PLANE_INTERLEAVED, CHROMA_H2V1, true),
+	INTERLEAVED_YUV_FMT(VYUY,
+		0, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	INTERLEAVED_YUV_FMT(UYVY,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	INTERLEAVED_YUV_FMT(YUYV,
+		0, BPC8, BPC8, BPC8,
+		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
+	INTERLEAVED_YUV_FMT(YVYU,
+		0, BPC8, BPC8, BPC8,
+		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
+		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 2),
+
 	/* 3 plane YUV */
-	FMT(YUV420,   0, 8, 8, 8,  2, 1, 0, 0,  false,  1, 1,
-			MDP_PLANE_PLANAR, CHROMA_420, true),
-	FMT(YVU420,   0, 8, 8, 8,  1, 2, 0, 0,  false,  1, 1,
-			MDP_PLANE_PLANAR, CHROMA_420, true),
+	PLANAR_YUV_FMT(YUV420,
+		0, BPC8, BPC8, BPC8,
+		C2_R_Cr, C1_B_Cb, C0_G_Y,
+		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YVU420,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr, C0_G_Y,
+		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 3),
+};
+
+/*
+ * UBWC formats table:
+ * This table holds the UBWC formats supported.
+ * If a compression ratio needs to be used for this or any other format,
+ * the data will be passed by user-space.
+ */
+static const struct msm_format mdp_formats_ubwc[] = {
+	INTERLEAVED_RGB_FMT_TILED(BGR565,
+		0, BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	/* ARGB8888 and ABGR8888 purposely have the same color
+	 * ordering.  The hardware only supports ABGR8888 UBWC
+	 * natively.
+	 */
+	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	/* XRGB2101010 and ARGB2101010 purposely have the same color
+	* ordering.  The hardware only supports ARGB2101010 UBWC
+	* natively.
+	*/
+	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+		BPC8A, BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+
+	PSEUDO_YUV_FMT_TILED(NV12,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr,
+		CHROMA_420, MSM_FORMAT_FLAG_YUV |
+				MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+
+	PSEUDO_YUV_FMT_TILED(P010,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr,
+		CHROMA_420, MSM_FORMAT_FLAG_DX |
+				MSM_FORMAT_FLAG_YUV |
+				MSM_FORMAT_FLAG_COMPRESSED,
+		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 		uint64_t modifier)
 {
+	const struct msm_format *map = NULL;
+	ssize_t map_size;
 	int i;
-	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct msm_format *f = &formats[i];
+
+	switch (modifier) {
+	case 0:
+		map = mdp_formats;
+		map_size = ARRAY_SIZE(mdp_formats);
+		break;
+	case DRM_FORMAT_MOD_QCOM_COMPRESSED:
+		map = mdp_formats_ubwc;
+		map_size = ARRAY_SIZE(mdp_formats_ubwc);
+		break;
+	default:
+		drm_err(kms->dev, "unsupported format modifier %llX\n", modifier);
+		return NULL;
+	}
+
+	for (i = 0; i < map_size; i++) {
+		const struct msm_format *f = &map[i];
+
 		if (f->pixel_format == format)
 			return f;
 	}
+
+	drm_err(kms->dev, "unsupported fmt: %p4cc modifier 0x%llX\n",
+		&format, modifier);
+
 	return NULL;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.h b/drivers/gpu/drm/msm/disp/mdp_format.h
index d17f63c045a7..a00d646ff4d4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.h
+++ b/drivers/gpu/drm/msm/disp/mdp_format.h
@@ -24,6 +24,16 @@ enum msm_format_flags {
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
 
+/**
+ * DPU HW,Component order color map
+ */
+enum {
+	C0_G_Y = 0,
+	C1_B_Cb = 1,
+	C2_R_Cr = 2,
+	C3_ALPHA = 3
+};
+
 /**
  * struct msm_format: defines the format configuration
  * @pixel_format: format fourcc
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index a2d5af5c65e5..068fbeac6edb 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -78,8 +78,6 @@ void mdp_irq_update(struct mdp_kms *mdp_kms);
  * pixel format helpers:
  */
 
-const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
-
 /* MDP capabilities */
 #define MDP_CAP_SMP		BIT(0)	/* Shared Memory Pool                 */
 #define MDP_CAP_DSC		BIT(1)	/* VESA Display Stream Compression    */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f66faff17a60..d9c1bce567d7 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -239,6 +239,8 @@ struct msm_drm_private {
 	bool disable_err_irq;
 };
 
+const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
+
 struct msm_pending_timer;
 
 int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,

-- 
2.39.2

