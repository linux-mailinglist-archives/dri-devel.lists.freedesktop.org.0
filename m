Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129AB3B3206
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F346EC22;
	Thu, 24 Jun 2021 14:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778076EC1C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:47 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f30so10854353lfj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hmb0jihXrsSfm2KPoeMapsdmcYPV0pPUcD3ESHARdqw=;
 b=rHuGSl844pk/QqnGzRZrZK+k71V36+KyFil84pNNTH3+HtbnqBlufSvNiLwiFIoUYK
 giLP76/h7Go4LUYuQ1NR6JE27wQfg3ufsZyBGLJq53+9kXzd87gLy4XdsYpkyuUCXBOU
 H/OzCvKUxpOi7HA43y0DuMgf6iwx1Ci3+MY2H11u9vfCQeb2W75oyal8Iajub0Q6DtFJ
 lhGwUp5J+LQoWc5kmDX+V8OCVa/gGL4OYlWP++vykhcuokxUiXBtlwbGq/CqOxqsaygm
 VWg+KkxaZbVPO/QptZ12ZRtuYvHPScghBZAGGmDsmFwl0Gm1vdIM0Pn868Q0fiKdY3Mk
 xo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hmb0jihXrsSfm2KPoeMapsdmcYPV0pPUcD3ESHARdqw=;
 b=Kh5ngcepMj4gwcewYBpP68sUkSF82dIH0BnnCReM3WaRWEq3cWkaRFVYcy7Icfr4Du
 EypZgF4ihQzn2RrI2KcdupCcC4LFRiD0TdhO+CDLH1h4gKGJtTEDFLAhUeBvum0O2wyh
 eDG8K/3LCvnKRonZGzcTT44ETAObv1ha9upGbwu2WBthLLAXX53u2/PNN8Vp8JZILsYS
 wvD+zplxE8BoqnDsEzPVC0Uwy58LxyicmYJpGrDtp4gZ+XkWwW0OnrwB4TtkavJ40DcS
 2Dj1pmtoTA9g6ks+5udZCoR6wp1OWfy/NXd8D3+X6KJ7InHXoUMiBYP90R3UEqAG63L9
 yXUQ==
X-Gm-Message-State: AOAM533rdI9/6E8M6mV2jIBq10HFfjsib4/gw/2lB9xk6DmY8tb5BaV6
 Qy6o1OgKNfPw+t14lv7yshz/jQ==
X-Google-Smtp-Source: ABdhPJxqxfumnHsX2OYSLjMZfGaaN9SBou4/Ftq9kLB8xJgPMDErG2JWZPiUVHnxSaaT9u8a47JicQ==
X-Received: by 2002:a05:6512:2283:: with SMTP id
 f3mr4092203lfu.632.1624546665920; 
 Thu, 24 Jun 2021 07:57:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 10/17] drm/msm/dpu: simplify colorspace conversion setup
Date: Thu, 24 Jun 2021 17:57:26 +0300
Message-Id: <20210624145733.2561992-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify code surrounding CSC table setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 84 +++++++++++----------
 5 files changed, 48 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index cbafb61404d0..103d4bd7585b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -537,7 +537,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
 }
 
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
-		struct dpu_csc_cfg *data)
+		const struct dpu_csc_cfg *data)
 {
 	u32 idx;
 	bool csc10 = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 27263bc1a1ef..e8939d7387cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -262,7 +262,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @data: Pointer to config structure
 	 */
-	void (*setup_csc)(struct dpu_hw_pipe *ctx, struct dpu_csc_cfg *data);
+	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg *data);
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index f94584c982cd..aad85116b0a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -374,7 +374,7 @@ u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
-		struct dpu_csc_cfg *data, bool csc10)
+		const struct dpu_csc_cfg *data, bool csc10)
 {
 	static const u32 matrix_shift = 7;
 	u32 clamp_shift = csc10 ? 16 : 8;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index ff3cffde84cd..bc2fdb2b8f5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -321,6 +321,6 @@ u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
-		struct dpu_csc_cfg *data, bool csc10);
+		const struct dpu_csc_cfg *data, bool csc10);
 
 #endif /* _DPU_HW_UTIL_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 991697150f0d..c4a76dd6dbd5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -107,7 +107,7 @@ struct dpu_plane {
 	bool is_rt_pipe;
 	struct dpu_mdss_cfg *catalog;
 
-	struct dpu_csc_cfg *csc_ptr;
+	const struct dpu_csc_cfg *csc_ptr;
 };
 
 static const uint64_t supported_format_modifiers[] = {
@@ -578,51 +578,58 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 	scale_cfg->enable = 1;
 }
 
-static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
-{
-	static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
-		{
-			/* S15.16 format */
-			0x00012A00, 0x00000000, 0x00019880,
-			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-			0x00012A00, 0x00020480, 0x00000000,
+static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xfff0, 0xff80, 0xff80,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
+	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
+};
+static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
 		},
-		/* signed bias */
-		{ 0xfff0, 0xff80, 0xff80,},
-		{ 0x0, 0x0, 0x0,},
-		/* unsigned clamp */
-		{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
-		{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
-	};
-	static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
-		{
-			/* S15.16 format */
-			0x00012A00, 0x00000000, 0x00019880,
-			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-			0x00012A00, 0x00020480, 0x00000000,
-			},
-		/* signed bias */
-		{ 0xffc0, 0xfe00, 0xfe00,},
-		{ 0x0, 0x0, 0x0,},
-		/* unsigned clamp */
-		{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
-		{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
-	};
+	/* signed bias */
+	{ 0xffc0, 0xfe00, 0xfe00,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
+	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
+};
+
+static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
+{
+	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
 		DPU_ERROR("invalid plane\n");
-		return;
+		return NULL;
 	}
 
+	if (!DPU_FORMAT_IS_YUV(fmt))
+		return NULL;
+
 	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
-		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc10_YUV2RGB_601L;
+		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
-		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc_YUV2RGB_601L;
+		csc_ptr = &dpu_csc_YUV2RGB_601L;
 
 	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
-			pdpu->csc_ptr->csc_mv[0],
-			pdpu->csc_ptr->csc_mv[1],
-			pdpu->csc_ptr->csc_mv[2]);
+			csc_ptr->csc_mv[0],
+			csc_ptr->csc_mv[1],
+			csc_ptr->csc_mv[2]);
+
+	return csc_ptr;
 }
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
@@ -1160,10 +1167,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 
 		/* update csc */
-		if (DPU_FORMAT_IS_YUV(fmt))
-			_dpu_plane_setup_csc(pdpu);
-		else
-			pdpu->csc_ptr = 0;
+		pdpu->csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
 	}
 
 	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
-- 
2.30.2

