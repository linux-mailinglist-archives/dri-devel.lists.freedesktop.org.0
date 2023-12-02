Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5E801EC5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E17510E0ED;
	Sat,  2 Dec 2023 21:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA06F10E22C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bf26b677dso38155e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553227; x=1702158027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEUdpBDlfJF5bEBFkoPoPa0EASGcRjNZPjCcs1U5LqQ=;
 b=o5J0JnMgXfnmapiGZxVpab87h5ybPdWxkQ2lYMMiG2mj2ixgUyV2geIXEopOP7sNAg
 D78Ezl4sPK2KchD7oMbClq5/m7x0QSRipjJc2jMjqTvTAzLTyaC6HkmICURtrUmIT4zK
 5ji55U3UhONW4XRnK6hXrY3LlTnKW82LCgkyWXwSix+ScYLR3rhEDSI1P2wvYnPHQQF3
 KN/zjdh5D2IxYrrtaNmjPYcX8Ab73ym+ggu02dyvCtfgl1PRtG1MGgsMiHfWoQoi3uRy
 U8oW1aas1iTo5O47KdVJK+AT4wmsv2tL8OWJGcCZkrgj2/rXF/IhGt+CyzzmQH3usBoE
 WprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553227; x=1702158027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UEUdpBDlfJF5bEBFkoPoPa0EASGcRjNZPjCcs1U5LqQ=;
 b=szmCP+JuIOenYI3gTsxiUcp7txLdcYTWsfOP3hNcbtS1s4MtXh/935HqkXGktvYrYN
 I37bl6XvRXvga5ps/tPsDQiCocl0YhBkvVARe0MUoOaZacT86vBwCmbVYR7Xiy07+uVU
 dvPiH7jeThETNVTHBvSpalG4w4J3vGE3AIjo1CslyyU09HFmb8nCQfCnSXKpz9uh1jyT
 zGHi4pdYFZ5FXIwFnsQlqwXTwD9RXQeA5QbUC3+P6uByUDhTaTzTEv8HPyK41uD59IOz
 5oyRl2AbbXNq9XvMH0+wF0icJ8jKuCI9Kc2v+uUKiKWrTGaa22C+evrPfuV/sJLNsPIm
 Evzw==
X-Gm-Message-State: AOJu0YxfV9m2+NOs0QsT15nRMwZR1uA38IYO9gWbmM/XAfEjaI9Zz0kf
 PqrJSDhYXA7hxU5Hoealc+XgJg==
X-Google-Smtp-Source: AGHT+IF6ps0GaZvKqh/l64to2wptxOBNWlqgLFrJSHL56cc9TgDVBl9ZClF2djte3jbWO007xNV5fQ==
X-Received: by 2002:ac2:5f43:0:b0:50b:d764:2911 with SMTP id
 3-20020ac25f43000000b0050bd7642911mr1019593lfz.169.1701553227206; 
 Sat, 02 Dec 2023 13:40:27 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 12/12] drm/msm: drop msm_kms_funcs::get_format() callback
Date: Sun,  3 Dec 2023 00:40:16 +0300
Message-Id: <20231202214016.1257621-13-dmitry.baryshkov@linaro.org>
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

Now as all subdrivers were converted to use common database of formats,
drop the get_format() callback and use mdp_get_format() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c              | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c            | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c             | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c             | 1 -
 drivers/gpu/drm/msm/msm_fb.c                         | 2 +-
 drivers/gpu/drm/msm/msm_kms.h                        | 4 ----
 8 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index bd3ab2ab6515..bf7eb70ed2da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -267,7 +267,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
 
-	fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
+	fmt = mdp_get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
 	DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index cef6066c0d3e..c1ec514e73d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -622,7 +622,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base,
+	wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
 					     format->pixel_format, job->fb->modifier);
 	if (!wb_cfg->dest.format) {
 		/* this error should be detected during atomic_check */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index faff3aaf1029..4977269fbe57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -981,7 +981,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
-	.get_format      = mdp_get_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1d7e0068e9c3..a8ede71d84de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -659,7 +659,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * select fill format to match user property expectation,
 	 * h/w only supports RGB variants
 	 */
-	fmt = priv->kms->funcs->get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
+	fmt = mdp_get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
 	/* should not happen ever */
 	if (!fmt)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4ba1cb74ad76..6e4e74f9d63d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -151,7 +151,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
-		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp4_round_pixclk,
 		.destroy         = mdp4_destroy,
 	},
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 48f447f4e183..18670ea40a3a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -267,7 +267,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.prepare_commit  = mdp5_prepare_commit,
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
-		.get_format      = mdp_get_format,
 		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..8326150e5e0c 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -181,7 +181,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 			(char *)&mode_cmd->pixel_format);
 
 	n = info->num_planes;
-	format = kms->funcs->get_format(kms, mode_cmd->pixel_format,
+	format = mdp_get_format(kms, mode_cmd->pixel_format,
 			mode_cmd->modifier[0]);
 	if (!format) {
 		DRM_DEV_ERROR(dev->dev, "unsupported pixel format: %4.4s\n",
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 44aa435d68ce..2b2f3d359709 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,10 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
-	const struct msm_format *(*get_format)(struct msm_kms *kms,
-					const uint32_t format,
-					const uint64_t modifiers);
 	/* do format checking on format modified through fb_cmd2 modifiers */
 	int (*check_modified_format)(const struct msm_kms *kms,
 			const struct msm_format *msm_fmt,
-- 
2.39.2

