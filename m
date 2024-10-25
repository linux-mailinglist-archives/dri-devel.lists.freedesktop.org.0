Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D19AF605
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF9110E9BC;
	Fri, 25 Oct 2024 00:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lPKWkt1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B35A10E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so1914485e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815620; x=1730420420; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LakdxDF/9cPRQ3n9hrQ/Z/yNSX8nKO7B7BhK4ZShkSs=;
 b=lPKWkt1cwqfC2HR6c5ThP5qhQ5cwNBrIUOiF2JCV77Y8XPum3+6VJd3V2OX+Ho4WGR
 uUJ2b/4hU7fKRVHlkD2N3Z0azWGmLXGM8379iX40DRsKlivK14Lffuc6a48HbIXmirKC
 KzJ8uEdbsc1PvizAKiQUuR0yM6ie+zVbJ8eeHhZi7qdmW+RoGD01ca8nAcZUcs+ZxC+K
 pcw9fYnbvq3Y2ibJ2aSlp5bl2RREga8zYt9TF/UMt+d6DdzqE+NDChB95zA0JQ1KWaXj
 dPm6+1kZjOgiY39k8FismrK4tevtkfwJMqR5BdeWOi7+xggZz44fVdH5FOw4ZkUPCe5w
 aK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815620; x=1730420420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LakdxDF/9cPRQ3n9hrQ/Z/yNSX8nKO7B7BhK4ZShkSs=;
 b=cYgTBj/i53Got1IZBsJ3cZVTFv4DEGWkAtE69U5syed2atwy/TbBBGnWJAgOXKgaRp
 bqZVcYuHg5u2Iuuny5bRXB4eAnZTjhTg7JM2tzj4dfvBQRzztg+hmy/eRvbiMv3vjC/U
 hCmv8k/lk23X4U1AjVd76WiUSMX48e+rMalqYf4Aj1wfay0dHY/rHT+1HtBZq2AM3Zhg
 ebJ+9f+29+sLEUt4rsj+el6vQ4a/UmJ04/NQWlSqVahOM6p1NgkLPKtI9V6DRKH4zeH4
 COyGGagoXwHzA7vvsucv3vEQL5sXIN1HQYoqwOAEd2hyILyQBfPwxZuLHz0ABaiT7uME
 adKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX50EPGs4WdHc/vFfZ32aEXDFkUK4Yfe1q7WzLTNrpNiLINu1AogZLteQ/+J6AUAzX/hqztMO6Qs7A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWZdIPteS2KV/9bJ8IvPSg49LVr/+AxlzlXR9JPuI7Tw8IS6fW
 KZV3+eCQVf7ZRKkl4EvX12D1XqJztc2JygjRiVACGPvGXXNtMDD05Tbj/PpPqBM=
X-Google-Smtp-Source: AGHT+IHHDGPFm+5LaGcGfwqv0XOoCyurtL60nKuQZ8HiBDCcMvQ+kw9uoSYdjQwWsN9h/nwfrjWhSQ==
X-Received: by 2002:a05:6512:401a:b0:539:f953:2da7 with SMTP id
 2adb3069b0e04-53b1a3a70a5mr4593047e87.50.1729815620241; 
 Thu, 24 Oct 2024 17:20:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:11 +0300
Subject: [PATCH v6 4/9] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-4-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5438;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R4+qo2hxkpeB4OSRUiIWsRuC1ZKiHOHSAdxEdLPwhTE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ6BE//45YOkNrdVtFe+/Zedx36x7cWQcWtt
 TIBXFdinJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOgAKCRCLPIo+Aiko
 1TK5B/98g0apE2NIT7PhToAg5Nxczdewc05BTIKNanzWzFP+vTPAEePxlOfEHZ/y79Z9DbfiJBT
 3+lIFxnjxiImvtNcIsEpvj93z8ckZ8MysxSd01Z+LiW/gil91HTaXMagrXA9BHDAeX/Y09X+6WN
 YR/Zby33tCmt4o7p46N94UcRVItHhf2aHmBlB3oIRz0Gt8NQjMXh3UpSEAjMHC7qvHS35ctGSDK
 vDI9HiLeMYoZguzN+SRUnGMLa86QMxH5qm7VS9HpUarhyHWohqh9Wf6UJQc/f9Pw+RFjEWeJtcG
 1l9PspOjteJE/t4Aih7UY7qoQ7F0ibqQvp0gHox8h1/U6HRd
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

Max upscale / downscale factors are constant between platforms. In
preparation to adding support for virtual planes and allocating SSPP
blocks on demand move max scaling factors out of the HW catalog and
handle them in the dpu_plane directly. If any of the scaling blocks gets
different limitations, this will have to be handled separately, after
the plane refactoring.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bfca993deb70..2cbf41f33cc0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -147,10 +147,6 @@
 #define MAX_HORZ_DECIMATION	4
 #define MAX_VERT_DECIMATION	4
 
-#define MAX_UPSCALE_RATIO	20
-#define MAX_DOWNSCALE_RATIO	4
-#define SSPP_UNITY_SCALE	1
-
 #define STRCAT(X, Y) (X Y)
 
 static const uint32_t plane_formats[] = {
@@ -308,8 +304,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* SSPP common configuration */
 #define _VIG_SBLK(scaler_ver) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -322,8 +316,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -336,8 +328,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_NOSCALE() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
@@ -345,8 +335,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* qseed2 is not supported, so disabled scaling */
 #define _VIG_SBLK_QSEED2() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.scaler_blk = {.name = "scaler", \
 		/* no version for qseed2 */ \
 		.base = 0x200, .len = 0xa0,}, \
@@ -359,8 +347,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _RGB_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.scaler_blk = {.name = "scaler", \
 		.base = 0x200, .len = 0x28,}, \
 	.format_list = plane_formats, \
@@ -369,8 +355,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _DMA_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 78ae3a9f22f9..c701d18c3522 100644
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
index 725c9a5826fd..8a9e8a430da7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -777,12 +777,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
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
-	int i, ret = 0, min_scale;
+	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -813,10 +816,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe_hw_caps = pipe->sspp->cap;
 	sblk = pipe->sspp->cap->sblk;
 
-	min_scale = FRAC_16_16(1, sblk->maxupscale);
+	if (sblk->scaler_blk.len) {
+		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+		max_scale = MAX_DOWNSCALE_RATIO << 16;
+	} else {
+		min_scale = DRM_PLANE_NO_SCALING;
+		max_scale = DRM_PLANE_NO_SCALING;
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
2.39.5

