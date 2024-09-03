Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D389691E0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C988A10E3CB;
	Tue,  3 Sep 2024 03:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rQwNBQA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429C610E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f401b2347dso42412321fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333778; x=1725938578; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2hRpaQcKbcknGZEeL9srQpxHfed15gqaeAj5JZ2LHug=;
 b=rQwNBQA7s8X7iibVVmN5LFU0+CX1t4drkihpSN5JCZfKaAFD/lWz/zHpReDLSI1wLj
 Y5cFdrjxBvrOKq0GIrhp3Th3B+wOEeIeEg2XUpCFLrJlGiyRDh9UawS21tPMkfqlr/Y/
 ROvlY05wS7ojhxDrfFA4tsDVG5ldQohjiv4uXrZw5k1MCx0KQc3t/TsH2ye85wAZCMAD
 SMfClCIgO6TK5ZqqlcyLT0qqKm6E7K49zZJWxzWhF7W4XSq0a03zUlhZOAa7BT5i8ycd
 zKZOV/YVi/H+H/apsOwG/9RFVWRUxkD1hP3ONgjSfOhEbCOm3HxaMbukn80S1iqUNvfK
 YI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333778; x=1725938578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hRpaQcKbcknGZEeL9srQpxHfed15gqaeAj5JZ2LHug=;
 b=oAsgj2XUOb7NrXAVwFZFEi9absHovVjtBTrrGaRugnp0Ag4FpEE0D+wrI39chOHQt7
 WdmC8cQBrmBijb00pWgafTP/D4b0AFW41ZYqsDUKC04Ug3VNXeu3+f0GJYGxaf8codfs
 XFPEw4nkNTy46Tl4L1y4oqf3+R7GvFA2CVVK/UrlCPuSALxmH8mHTqD8lsFevOVyKIAC
 GPotF1jBbXwwbvX1sdrQBWf7PCCFbf+L+GaqCds/4rbW0pOCu6jzeokuLuqDfp2+jIBd
 uiJ85IFYGZu2Yf70Dso10U0pEgdkgN4RZ03+hCrPcV8yhS06+pd+SQFwyHuWMcgKqKqs
 wNlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd1Wxc5u5wP+NePHWS+kFE4xrjusLndgNPgZYdGwp+TPEV7PASCncgKGHLY538FCpLkU74oI+0fLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0vhd62BlkxxFdc3wxLFiU/GwaEM1vwx7Xtccj48elwPXzX7/2
 LgGCqMbkU90fkg2zN1iueO8K0MwpDFQV3pR3TuwmGZMTFWRrWUyXIlUCevJIftc=
X-Google-Smtp-Source: AGHT+IG+0zz+F/I5gdve7BbU7pYrQzJfUax/TpvgfPnOk0kGVd7L+w4J0DmnhVPzvJy9ImS+D94meg==
X-Received: by 2002:a2e:be04:0:b0:2ef:2d83:c136 with SMTP id
 38308e7fff4ca-2f61e040567mr41237911fa.1.1725333777313; 
 Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:48 +0300
Subject: [PATCH v6 05/15] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-5-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdPcTdFQXJWLycgTMv1JoAmmJsZnOpdWMBcY+eFCp4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELcjShU39W1AK9lOtdHTGbQfPNL/PcZ7qO8
 DJUzYi4G7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1WLVCACiO2BHrEeD/3IA/R/EsXDKTz4D64NcmnqS/hoaECZjsGd4HJ2xW6zzJRCsB7NV877UtEb
 iexjHOYIqcvGAvszibYsn//u/0fPag7+Tp35jia3tFfUePyGiRAr5bhADH2iCnuPR7q7MkxzyJ1
 mR5fZXtCCIgDrFpyaI7fZvigmT7DuUPulyMRDKrCpk4m5rPZcJoWTuL+3LDgKmRhJ4/wf5U/72b
 4//iOptAbpDfiZ8q1vFgkE1LriM86RoQxNyad6fUyeE4hj6dFkHe17MylwTuOkI5WOxQTVGKP80
 cCeKDbIakwnLStasbmv0pN7V9TA+4ZSaFe8lNTmcSsS7/V8G
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

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 29298e066163..93ac5afb623c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -648,7 +648,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -678,7 +677,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		if (pstate->aspace)
@@ -1115,17 +1115,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1140,12 +1129,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

