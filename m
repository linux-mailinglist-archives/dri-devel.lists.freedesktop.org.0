Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21549199F2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BBD10E9C3;
	Wed, 26 Jun 2024 21:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U7/hFMb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B25110E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:10 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so51219381fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438369; x=1720043169; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DemnpnKqmXRex86PlFrPzeelpU92AqvZJg2FJufXVcc=;
 b=U7/hFMb7FAaUsbU2i4dj/3Iae++gtoo/LcoGtE6nITlKDw42rHuS6EZl25HhapPVOY
 IABirCLofTjFVdszFeBrM4PAlJNpSUyoJfZhoUWXIaHNPr6/YGkStqHguz19M7wNnorz
 mXkRuKKtwA9MUVOrhluziowRUzvVkrOKEvawTwaTF14dHA9Ee2YufUKyo73yfr7ePfr0
 YIcOANIg8UC5QJXS9r1oKYX5GD8edU93Nsd21Emvnnp8gCyKIBu4nPVtUdKXlaGmHAfM
 2GWaiF+kkaf40GJ4c/nKWVvAqjeANlBCT5YP5HUx+8QCAvvkyoylJO7eQV2uNgaV+hlO
 EN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438369; x=1720043169;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DemnpnKqmXRex86PlFrPzeelpU92AqvZJg2FJufXVcc=;
 b=k47Fb7fqA86UbGoheMHypwO/ABaa0XTUslZbGhfyxFDRi447el+rA6MCS1eOZHaMNq
 UHn9kEr/6HQtLGQfvH3TD27/BxvwlEfGIURAonCLMhKkb0dqBmMfu5fA8n8xwNk3iFD1
 Qle5sjoR7yGXYXRnyddRXLXmWQM+PLxLbNernyFKn6obMBSpuYyFCMbX35igDRjbTLeP
 wttyIetPiS2LIi7OXKPlpqWcGkaI9RdYQH7N+rGB35aVgAjuxImwVgTFlF7CQvOvGa8+
 P5OfjpClgyxvmmknWgHYW1pYybao51MjF6xrHu7JGD9BMXaJsJOe5RbRF+FzIWCxcsj/
 ppfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1IpQ2x1/9+reD3Zr7PYNgwOPsEP71qWsOlOTRQWc9EU6gJn5DCzXMd+J49xRgv9MqF28W6cTUV2wZyKbXJP5iFLOphLM+tS9H0b9AOrRP
X-Gm-Message-State: AOJu0YzRUI9aae3QenSspNkIbR7q/0kyz19lxA+E1KWCnw8btliswjWm
 8ywbPjnpeIJIB8HhVc85+AhRyF+38V0VMvWBSje6gYAUXD2P8yZ4tbTBZxcok5A=
X-Google-Smtp-Source: AGHT+IEeHFUP+yywyF+IBaotMAk8zj7gvRjn8PAXMgbVbycBqrHxOKo1ModXZICS6iRWhs1JdVCsEQ==
X-Received: by 2002:a2e:a69e:0:b0:2ee:46ec:60bc with SMTP id
 38308e7fff4ca-2ee46ec6229mr8411781fa.27.1719438368720; 
 Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:01 +0300
Subject: [PATCH v5 07/12] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-7-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4746;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D8PRyCR1WP9UcdKkDxh0WihWqPbf3nR7gzVRwJqdq0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZJZ3Ku7ERpfNmip/4P3ilOZfz6N7np1kNB
 9dApxpeUSeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1SYjB/9A/yhQpxaYlLW3rjxz2DJS6WSK7DQ6utjdOmScQMJZ2zfCEO0eH/e4hgsC2ZnMSTilmPP
 b08rs7EkYiQPty/t/94c6kL+4H6qG3lDcMeV9k+by0yqtym7Y1nQjfVEQiB4/E4Su4DsOYNkZNs
 vVS21ELPf/TmJT723zBqccgjmqE65ny2f14MuD8WERggIcCTjugW1Vv2DQoJM0JyjMKYCDncfsr
 cQIR74CEPbQDrkLFPiQsPAgXaFJU95toW624omXd6JsmQk3qJ6+zjqMP+szui2XwprrE6qrUiAK
 crE30LjA5hZLNSwGhfHs1UfcSAn2idNSrGBvYMFIX90QuUZy
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a3d29c69bda4..e9fd6b36a1c4 100644
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
@@ -274,8 +270,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* SSPP common configuration */
 #define _VIG_SBLK(scaler_ver) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -288,8 +282,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -302,16 +294,12 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_NOSCALE() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3f2646955ae0..bf86d643887d 100644
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
index 325af392e6a2..115c1bd77bdd 100644
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
@@ -821,10 +824,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
2.39.2

