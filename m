Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8586BD681
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0096910EDD7;
	Thu, 16 Mar 2023 16:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ADE897F0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y20so3196649lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3gZrcHEgMaoVLg/Qn82uZJfC8UCV4DXP2rS4CdikJk=;
 b=eZYjvcsmwgpJisazAQpuuFRpCTxMKcOC/UkxZQWpbai8k+D63EmQZl4meUv8BaRaDT
 p6uCyRzyQ+oj1ZfyMzWgZUyxVXD7jW8+CgGP+ARGqPlixuh9HkJMossqjMqD5FOYpN9b
 eCMPj82awkvv8bMbH6tcXhk3TGvJAe5UiNRSUc9mkF2E44Lo0cQBGKF4Y9myhzmrGDAM
 ijgRNvtcEG0Vjb8MPZqUM+57fxsfJwMgffKkxzU1ivtERwpF2Ksfg0fhl+SiEsI6lhyP
 oTS/D9agNsoikKrbikpMbGy3tl0ufrkc5mGigQBkqKm01nxM5OIevHuseTUP8W5nxchi
 uifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3gZrcHEgMaoVLg/Qn82uZJfC8UCV4DXP2rS4CdikJk=;
 b=RNJPiUkECrl0NeUiyQepISjc39l9i16/zWF167IsQjtnQKW/D8ALNLvS32Byp51bUI
 hR0lE7cADwkkotPe18Xz7QZem2avIGnDR4ZXORFwpo/fowClwGXfMA9cV04XtFXQmXkI
 fH361iNHqiAX2+wR5Il/1tEuGwm6443xUquniE/Z6MmFdO5wg8bUvAeL7PyPEPpjSuZU
 xLSWYmAXrAua3/Adc2jCml+IoQe8zzK+806tbjuCMTADc1RTBkyjauQARB1qpf55GSJW
 KUhaRhN+YNtDtJfpyTYInvp4OVnaJuxme8mdCyDWWcQuNeCDM0LzO+15T5H9P6yhXtT3
 6uTQ==
X-Gm-Message-State: AO0yUKUoiR3UoF/FDgkuzFjt4JUCPr0Y5uy0yQ3HqYuwiRL85BCMp5Yx
 pkpIsUwr3tEcrT5jDIkbB+cGMg==
X-Google-Smtp-Source: AK7set9wocUvslxEG/2S6Vkez1MBLiHc7PdGkWVpRcGwytltHXLHj7ev3RqMp+ShMOs+RT3ajDimHw==
X-Received: by 2002:a05:6512:2303:b0:4db:787:e43b with SMTP id
 o3-20020a056512230300b004db0787e43bmr32690lfu.8.1678985751795; 
 Thu, 16 Mar 2023 09:55:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v1 09/12] drm/msm/dpu: add list of supported formats to
 the DPU caps
Date: Thu, 16 Mar 2023 19:55:39 +0300
Message-Id: <20230316165542.4109764-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
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

As we are going to add virtual planes, add the list of supported formats
to the hw catalog entry. It will be used to setup universal planes, with
later selecting a pipe depending on whether the YUV format is used for
the framebuffer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 212d546b6c5d..2d6944a9679a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
@@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sdm845_dpu_caps = {
@@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm6115_dpu_caps = {
@@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc8180x_dpu_caps = {
@@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
@@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 900,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8350_dpu_caps = {
@@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8450_dpu_caps = {
@@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8550_dpu_caps = {
@@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 89b372cdca92..4847aae78db2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @format_list: Pointer to list of supported formats
+ * @num_formats: Number of supported formats
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -419,6 +421,8 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	const u32 *format_list;
+	u32 num_formats;
 };
 
 /**
-- 
2.30.2

