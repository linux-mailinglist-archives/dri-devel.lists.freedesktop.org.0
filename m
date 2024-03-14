Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC987B5AB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9465310F593;
	Thu, 14 Mar 2024 00:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MDHJ50Zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1427210E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d46c99eb07so4806971fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374542; x=1710979342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omhQlSoxtqwZ2DMzUczrlWHRB9OlkJVlUrZG2hp78ts=;
 b=MDHJ50ZdyE5UQ2Uy83wK94nWWA/c29dL0FFRHFxWklkhBRhOuD4ywGoaonloRenLpv
 MWXdt11yHyOXjrJe01bWhIN19ohqqo9bk33MArQhUK/hsgi5I0y7RiF8B+vs1EdYcxwh
 C0nVHsvFWMQtq6aELjdfiYZRlVxcCNS07LhpOvwy4Em4lhSMVC1uzj2OjCJId/DgkTo+
 JCHq7ELw/4AmkSTomE8yflxuIq0HHBA5ZiGCxhzM2kUYjXm8ZQPhU4ZkmpRBVrJMYl9+
 TV9n0lzye5Wq1G9neLpJhzJ4kc46tmMQ3ZXscB80Gkjru48CHdtrFuEfBjGMNuL2Xxq5
 twiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374542; x=1710979342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omhQlSoxtqwZ2DMzUczrlWHRB9OlkJVlUrZG2hp78ts=;
 b=Uz0Zp/4uuUN1S1t4aAgWpS5XRvIpzMBlu5Ch+oY+x+L8wqDo4Ga38TwZRlq0VvrUGy
 rbtEqbHwOqYe/tu6gDqaDUwqMwyITkaD+ECUVMQWdMh3g1g7Cbwbvuaj9zcP7pPvBYys
 kOgaaqE1ShWTDHdgxPA6yEGysfl7b1jALEMvjDip7PaNOWEhl0y+w8Ni936gLVqDq1ui
 XT4kClpj1MMm0iwqos4LM3bANAuhCSf/ZpHUpP909Ijpa9y2nJ0iX9h8zwXj479NU7F1
 eP+A4Vhxdx/07sI8jF5s44MdOTwMvC6Ym5VHMtliVRpvRemfROwfvKCbhBFVshhDjCWk
 tgJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNfXKbUDyfmxe/NpRocRJebRId1Ps4WhOMiSPniQg5ryXtGVAH5VZWyi6t8MQIn8yBM0LPClozdFCu5b453+O60STN5thoGls3LkJXsqvK
X-Gm-Message-State: AOJu0YzzrMyitkshANI7Ue9RDnwdY5M0HzuFSvvNsqqM+oeVFCTsJ0/d
 mKGh6UjuZ5I9fEUjTuoGi02I60NO0vFDY+MbxVsB4lInz+ykQovso6mZXD8kwD8=
X-Google-Smtp-Source: AGHT+IFaWhVXOZSe75zGW3/qdv3Rp6jkv+9SmxpEyBltlIqwlLMBx+Ebzj6Tb8KVpz8Fk69lhkR/0A==
X-Received: by 2002:ac2:5b9a:0:b0:513:c9a6:46ce with SMTP id
 o26-20020ac25b9a000000b00513c9a646cemr51945lfn.9.1710374542109; 
 Wed, 13 Mar 2024 17:02:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
Date: Thu, 14 Mar 2024 02:02:08 +0200
Message-Id: <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Max upscale / downscale factors are constant between platforms. In
preparation to adding support for virtual planes and allocating SSPP
blocks on demand move max scaling factors out of the HW catalog and
handle them in the dpu_plane directly. If any of the scaling blocks gets
different limitations, this will have to be handled separately, after
the plane refactoring.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a2e4832aa25d..47fd8baf53e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -113,10 +113,6 @@
 #define MAX_HORZ_DECIMATION	4
 #define MAX_VERT_DECIMATION	4
 
-#define MAX_UPSCALE_RATIO	20
-#define MAX_DOWNSCALE_RATIO	4
-#define SSPP_UNITY_SCALE	1
-
 #define STRCAT(X, Y) (X Y)
 
 static const uint32_t plane_formats[] = {
@@ -280,8 +276,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* SSPP common configuration */
 #define _VIG_SBLK(scaler_ver) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -294,8 +288,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -308,16 +300,12 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_NOSCALE() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
 	}
 
 #define _DMA_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index addf8e932d12..fc7da6e1feeb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -364,8 +364,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @maxdwnscale: max downscale ratio supported(without DECIMATION)
- * @maxupscale:  maxupscale ratio supported
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -375,8 +373,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 maxdwnscale;
-	u32 maxupscale;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 70d6a8989e1a..6360052523b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	return 0;
 }
 
+#define MAX_UPSCALE_RATIO	20
+#define MAX_DOWNSCALE_RATIO	4
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe_hw_caps = pipe->sspp->cap;
 	sblk = pipe->sspp->cap->sblk;
 
-	min_scale = FRAC_16_16(1, sblk->maxupscale);
+	if (sblk->scaler_blk.len) {
+		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+		max_scale = MAX_DOWNSCALE_RATIO << 16;
+	} else {
+		min_scale = 1 << 16;
+		max_scale = 1 << 16;
+	}
+
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  sblk->maxdwnscale << 16,
+						  max_scale,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
-- 
2.39.2

