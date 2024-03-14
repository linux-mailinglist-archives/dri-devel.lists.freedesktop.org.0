Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB587B593
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB2510E86D;
	Thu, 14 Mar 2024 00:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HjEtaV20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703810E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-512e39226efso456278e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374541; x=1710979341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clvqfuDuLHhOMDUpN28VXezisf/pvnw+VhoyO8COXfI=;
 b=HjEtaV20AY4U9MUFdQz5zn8WlV5Wdcf9z/T9nnsFcNQaGTozN9Ifk6aRnr0UhdME7f
 rcVd1yTjIuPfwpTYvU+8dMzqF/HhhHiOGr03WLaX+8tUzyVkCoG5SFrTbNeZDxAIpv9p
 ZpijCkZU3FP4884oYhp3ovxvGB1x04ynj41FBJSr1s24Y04jh3vj/rnzpKUg9ctVnmH7
 tCEycMLTwbnFyxnc1JGME6BExeoj15yfRCulGe8dwUnMiHhzO85Jh8nIZbWaoSRpE8Dp
 Z5s5TdPPA5bzrdQjcXrbZgJyUXz5MMcevXwfu2GlyGibG4fMa7jokZ4iBi+n1AUA6yE+
 tnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374541; x=1710979341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clvqfuDuLHhOMDUpN28VXezisf/pvnw+VhoyO8COXfI=;
 b=aPx+sj1Fy9OkrmS9yLd8bwmiNM8jgFzQLX3V9ltN7LRo54jjFQp9GMzkeUtDhk3ZFX
 1vblPBc+8ISOGIyFI7TQAKuzvcfxHq6FrhiCiA2OJwqf8uMj4KHhvTkWhgmZfNZc5D1P
 JALPt+8Y1by+sOWZ+IHF8hWDvH5WKhwiAnj7TVWVCRaE4wt0xjlmOv2d6uBPHv03Pt7A
 +DsVVc+XLDThDOdQHblztBGA/5bWW8Uie9evsulbPNNtuGsawTZU8QTEDsKE45RGdxXV
 o1IWJyuPOkMOJbtX83u1pGSTTibd/tuG0haNiVQ9OTa8wY8yM57HGid6wn8B4c+KZeZ3
 zJhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvA/a5xm8H64KaFHg4pT0C4hFK7LTIM3ERxQRGfCg2eo+lKXRqwzGcPQsKkZyt5bAFRki/3vfcI/jjd4mh8o5ALxyREBXMQBtZTgskMrCT
X-Gm-Message-State: AOJu0Yw9kKc3sc2ILg7BdCoU3vC8XtjOR01I7iRBjbw1x1yrard4Ngvw
 vMGZDXCQVJ3RfmJeIeago98LnfdMk9fh/TnxN1Lyx74Mw4DOr5ZehVGoPyjUGvE=
X-Google-Smtp-Source: AGHT+IGDNT6i0DXVmxw8bW/VTemWoJzET4Y18lYpr6RE06EgwiFAMctoBH25D0HuRmKi+lnoQc0Fkg==
X-Received: by 2002:a19:ca51:0:b0:512:bf43:d786 with SMTP id
 h17-20020a19ca51000000b00512bf43d786mr55047lfj.10.1710374541287; 
 Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 04/13] drm/msm/dpu: drop virt_formats from SSPP subblock
 configuration
Date: Thu, 14 Mar 2024 02:02:07 +0200
Message-Id: <20240314000216.392549-5-dmitry.baryshkov@linaro.org>
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

The virt_formats / virt_num_formats are not used by the current driver
and are not going to be used in future since formats for virtual planes
are handled in a different way, by forbidding unsupported combinations
during atomic_check. Drop those fields now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ----
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f2b6eac7601d..a2e4832aa25d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -289,8 +289,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -305,8 +303,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = rot_cfg, \
 	}
 
@@ -316,8 +312,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
@@ -326,8 +320,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340b..addf8e932d12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -372,8 +372,6 @@ struct dpu_caps {
  * @csc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
- * @virt_format_list: Pointer to list of supported formats for virtual planes
- * @virt_num_formats: Number of supported formats for virtual planes
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
@@ -386,8 +384,6 @@ struct dpu_sspp_sub_blks {
 
 	const u32 *format_list;
 	u32 num_formats;
-	const u32 *virt_format_list;
-	u32 virt_num_formats;
 	const struct dpu_rotation_cfg *rotation_cfg;
 };
 
-- 
2.39.2

