Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFA915094
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D25B10E492;
	Mon, 24 Jun 2024 14:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CibEN0Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CD10E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ce9ba0cedso958196e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240439; x=1719845239; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r1aDr6u3CKZwSplcaxUZ1CNtB7aEvGZWL0nJBmKn1vU=;
 b=CibEN0FiquMW1U0yvJM5qi9ZoREehXi3rmUECTedSPLyg+2jXThEA7AbfoX67SrOGG
 BmqfHbhlsrZuow3WSQ3ssjD2O7Cj27t0eVkrqr0Eu31B5IQC33GQHR6bFGnWajn4BHoG
 HmmID2vYbdZUD1KhK1aKPFpWhVM2O0/7FqwPuaPx6JZUrB17y7lu2fSg/1r4fuNWgD5w
 gmYx8Ev7GHAcvvGEZhn77AaA23OKPejftRecboSyFH4Y+PYFk9q1DWq8a3pEfg4pIMG5
 3I2QH2O0PyB7UH0g7cdYPVVrA9cq9w+j55O64nA24KTGm14YdkJaDRH6i4A26C1656/g
 grCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240439; x=1719845239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1aDr6u3CKZwSplcaxUZ1CNtB7aEvGZWL0nJBmKn1vU=;
 b=J2pYZTy4virslZRqFOB7iJsZF3ykMyUswtTeew7i8K8Ho9KQldsOBV1GxP8hdgcqJp
 ncAsEP+z+8Bj+PoAII7QObuiY5ShzlbYcc1jByeFNlT8MR0F27bt38e2Lbq4Li4/zcft
 GpYLmVRevol9cANepMCASOdYTXISK8R7kYfJTdaNS/HXmZbu5piWleX8/RA1/Bbh9uz7
 MBIXbrV8r+spIs+NM68BgHafZ4zcw1eH2W8fkFkh8nexkDyfRsp3OYS8gLbbsDyif4nS
 qkN6//zvYAcqdzrOtM1cEIUx2kADCY7O2u53735SxBgMhrX5X0+LG8rWrCBqq/W90ZpY
 VEBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDQa01y3omrWKyB2StURSJZqKP+ongQvyZ+LSiRiyO6jtsA4MugwMzNolOijRxQVFlC+UdclM9HWix1bK98QxUq+hGzQuYio55E8dx+7EN
X-Gm-Message-State: AOJu0YxvE7nPy9LYJMemxSuKtBB5wH1j+jg6iL2+2gAB4L/FW0x69SnD
 +gp4Kr7xbclY99LsKXDmCRNwVEBKbVQQOYEa5bIeoXOBd2vXQmuXXepNjsshxEA=
X-Google-Smtp-Source: AGHT+IGFhG+6WbUsy4m0CwawGc/lF5c6/cpPh90H2d8Pmpri/4cvAON0Y0BmFOMxDx40iimqoChUWg==
X-Received: by 2002:ac2:5293:0:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-52ce1835924mr2974353e87.38.1719240439423; 
 Mon, 24 Jun 2024 07:47:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:14 +0300
Subject: [PATCH v4 08/16] drm/msm/dpu: drop msm_format from struct
 dpu_hw_fmt_layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-8-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8016;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Gya5f4ZwULk71hxrRoz5QSdtb64ucMxjJc7p3y8Bcb8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbvUa3G+dgmIzjoA0aVhlyC+LGx7erNQaKBr
 QYhsV2Dm62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1a0aB/9bel8aZo3E5z5ATF6iNEHVV63Y7LCW7v1nN1+aT01IMD+Ddi/0SdqUPcj3RtAQMP7ATqA
 ZEmKj3B4ylE1hy9FqTc4+qeyNuJKgucilGeQqk+mnkjM6n2scNxOtfR2k7o1sGtf01CwfgSykHt
 6FhhGOnttXapAN89r6Luiyol4JUBy+fec5eIRJo5uiuEfDkUpjTgJDkew7aKQR9UvVDWrxTZino
 LTag5J7KlmR81CRwCU0VKOQGkw4jZ6ILLX9x39L24XjPyb1kw3xRLO/vRxsgr1LEhKMMjVc1p85
 Bh/VTDGHu6MLHl8BE84yVch25Z2fbpY3bO0bZt86yky63DQz
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

The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
sizes and pitches. Drop format field from this structure as it's not a
part of the data layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 18 +++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
 5 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 882c717859ce..acbba6d4e68c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -193,12 +193,12 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		hw_wb->ops.setup_roi(hw_wb, wb_cfg);
 
 	if (hw_wb->ops.setup_outformat)
-		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
+		hw_wb->ops.setup_outformat(hw_wb, wb_cfg, msm_framebuffer_format(fb));
 
 	if (hw_wb->ops.setup_cdp) {
 		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
 
-		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
+		hw_wb->ops.setup_cdp(hw_wb, msm_framebuffer_format(fb),
 				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
 	}
 
@@ -584,14 +584,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
-					     format->pixel_format, job->fb->modifier);
-	if (!wb_cfg->dest.format) {
-		/* this error should be detected during atomic_check */
-		DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
-		return;
-	}
-
 	ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
 	if (ret) {
 		DPU_DEBUG("failed to populate layout %d\n", ret);
@@ -600,10 +592,10 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
-	wb_cfg->dest.num_planes = wb_cfg->dest.format->num_planes;
+	wb_cfg->dest.num_planes = format->num_planes;
 
-	if ((wb_cfg->dest.format->fetch_type == MDP_PLANE_PLANAR) &&
-			(wb_cfg->dest.format->element[0] == C1_B_Cb))
+	if ((format->fetch_type == MDP_PLANE_PLANAR) &&
+	    (format->element[0] == C1_B_Cb))
 		swap(wb_cfg->dest.plane_addr[1], wb_cfg->dest.plane_addr[2]);
 
 	DPU_DEBUG("[fb_offset:%8.8x,%8.8x,%8.8x,%8.8x]\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 8c2dc5b59bb0..46237a1ca6a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -104,7 +104,6 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->format = fmt;
 	layout->width = width;
 	layout->height = height;
 	layout->num_planes = fmt->num_planes;
@@ -116,7 +115,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 		return -EINVAL;
 	}
 
-	if (MSM_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(fmt)) {
 		uint32_t y_sclines, uv_sclines;
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
@@ -182,7 +181,6 @@ static int _dpu_format_get_plane_sizes_linear(
 	int i;
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->format = fmt;
 	layout->width = width;
 	layout->height = height;
 	layout->num_planes = fmt->num_planes;
@@ -190,8 +188,8 @@ static int _dpu_format_get_plane_sizes_linear(
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
-		layout->plane_size[0] = width * height * layout->format->bpp;
-		layout->plane_pitch[0] = width * layout->format->bpp;
+		layout->plane_size[0] = width * height * fmt->bpp;
+		layout->plane_pitch[0] = width * fmt->bpp;
 	} else {
 		uint32_t v_subsample, h_subsample;
 		uint32_t chroma_samp;
@@ -272,6 +270,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
+	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
@@ -286,10 +285,11 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EFAULT;
 	}
 
-	meta = MSM_FORMAT_IS_UBWC(layout->format);
+	fmt = msm_framebuffer_format(fb);
+	meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	/* Per-format logic for verifying active planes */
-	if (MSM_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(fmt)) {
 		/************************************************/
 		/*      UBWC            **                      */
 		/*      buffer          **      DPU PLANE       */
@@ -390,6 +390,7 @@ int dpu_format_populate_layout(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
+	const struct msm_format *fmt;
 	int ret;
 
 	if (!fb || !layout) {
@@ -403,17 +404,17 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = msm_framebuffer_format(fb);
+	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
+	ret = dpu_format_get_plane_sizes(fmt, fb->width, fb->height,
 			layout, fb->pitches);
 	if (ret)
 		return ret;
 
 	/* Populate the addresses given the fb */
-	if (MSM_FORMAT_IS_UBWC(layout->format) ||
-			MSM_FORMAT_IS_TILE(layout->format))
+	if (MSM_FORMAT_IS_UBWC(fmt) ||
+			MSM_FORMAT_IS_TILE(fmt))
 		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a2eff36a2224..f8806a4d317b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -293,7 +293,6 @@ enum dpu_3d_blend_mode {
 
 /**
  * struct dpu_hw_fmt_layout - format information of the source pixel data
- * @format: pixel format parameters
  * @num_planes: number of planes (including meta data planes)
  * @width: image width
  * @height: image height
@@ -303,7 +302,6 @@ enum dpu_3d_blend_mode {
  * @plane_pitch: pitch of each plane
  */
 struct dpu_hw_fmt_layout {
-	const struct msm_format *format;
 	uint32_t num_planes;
 	uint32_t width;
 	uint32_t height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 93ff01c889b5..f39db534697d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -64,10 +64,10 @@ static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
 }
 
 static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
-		struct dpu_hw_wb_cfg *data)
+				   struct dpu_hw_wb_cfg *data,
+				   const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	const struct msm_format *fmt = data->dest.format;
 	u32 dst_format, pattern, ystride0, ystride1, outsize, chroma_samp;
 	u32 write_config = 0;
 	u32 opmode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 37497473e16c..b240a4f7b33a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -37,7 +37,8 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_cfg *wb);
 
 	void (*setup_outformat)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_wb_cfg *wb);
+			struct dpu_hw_wb_cfg *wb,
+			const struct msm_format *fmt);
 
 	void (*setup_roi)(struct dpu_hw_wb *ctx,
 			struct dpu_hw_wb_cfg *wb);

-- 
2.39.2

