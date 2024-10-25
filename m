Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082C9AF603
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D2110E9C1;
	Fri, 25 Oct 2024 00:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gyrJmGI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C584B10E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:19 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9a0472306cso196768566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815618; x=1730420418; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XZZkDePstTJuwJ96EH3uXNnHMnvpB7WYQKxAsltEhs4=;
 b=gyrJmGI+k2DWwkOChhzxbL79Hi0g2JxQAiyOXZmWr506ufSOZ4AFbxakKdtRD/5pYC
 uflwTz30Su4XiVwWGrKfVGmMvz/a/HkIN7qLHbJehjKsd4QkUhluChdr4c36N+dIa1db
 j/Q5oGNDFeqCHMkjvzEACLw9PrVx7QrhknDj25S1dF53PmRQVmdv9HSWr4yLzmBwMp+E
 wphGtGd6vTEjwTf6yXVm7hUeHuP6AshjIeUfr7qaChS6KyVBzNSHbaV+zUybSgnwdIce
 HXSp5IgFBroiZs3HMYWbqBqybHcdi+lpQk3kpVqy5x5+7Jb7sTNp7ZOvXV71lRm48dJQ
 tW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815618; x=1730420418;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZZkDePstTJuwJ96EH3uXNnHMnvpB7WYQKxAsltEhs4=;
 b=BipvqBqtJFSlx8NSHYTbFoMlHfMuAGI7jul3Rz1pfKwEX02+XJyWlXXkC7Fhr2DXsx
 /xedJFsSzKffKa720SJMdhIFL0xjnnkr4uuMp+NGuHs4VSOUTQzE3I6Z/+WVQNJQH43B
 WG1VhhlNGoCQWEtxhN8GNgyuE4MlG5OdvviFi3RGdpkDxalUjT2DGjL5gO26Ek/c+ABP
 TecAD+drH+o1SRmSeuPsxUk6p0IBj53W1ZLoNBKpTII+/2uyoiO+pDfbghitNc6/w2sW
 aqeIiznZDsM9ySgUttbnX4gNJXPyhxf4aBrTnAfQ9m4d8+reEREeAxTdrgcu6wW1//dn
 45KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaRJarizCZlKVoUzNK7qG1j/6A+ru++EW6OoTbw14AVcClN9m+Joyx8xQYQycu1E6GEUxY0fIslnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEANQNLECleZXm72iy4vQpHlNYpuiH2vjXjvAKVTx+hk/KXVHF
 zo3g1LmAaQ4GicUZwU6bs0TOtEn9Zi3i+LQ/cRUmjDSZX6L3GBlLUJCzXrJ6c4c=
X-Google-Smtp-Source: AGHT+IGfLGuZ11NKLQzcMCjgzAbykSZ7Ywu8iQJoJVAdqvbZpX6tU7NZd2ImvI3L9BmR5RWWNtZC7w==
X-Received: by 2002:a17:907:2d8f:b0:a9a:67aa:31f5 with SMTP id
 a640c23a62f3a-a9abf85d024mr742840366b.10.1729815617704; 
 Thu, 24 Oct 2024 17:20:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:10 +0300
Subject: [PATCH v6 3/9] drm/msm/dpu: drop virt_formats from SSPP subblock
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-3-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3641;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tBM5ZHVDqp/ggxgh+nGqHn0WBtaJgoFLbizrCaVdf4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ61qEp7BtCLTOQeLUBGK8kSLpIQo0o4l99l
 PmUo8S21/mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOgAKCRCLPIo+Aiko
 1ds3CACSlyGTl1xRe0S7eTfpHofuP2JOrZ8lcnlmGSaehi+uJ1XEJ6zfPThYkI2PGfdZrzgIfqj
 Eb+4tE9R4ezwm7AWZlIGkiDd6pBmXrujKbGCXQzPSMi8F1ZVLsPXU8AjewZXfm+CHcR1ww9xrAa
 VVz9duNLmmkjsuEgXIhW76uUwAPhtVxmxvEgIUwjcCLLPShic0iEIwJOLLLK3XRSsFSusFoEg7E
 QgZeNSNLUj1PGYdEeeEsxplvO9SRMQDBZ5LLhEQ4wk4JLHazuf8pXL8NfT08e+NAn45GzCxu6BR
 94Q+5I14leFOpcn6GmDxbKIO+Qpo6AIoSfu5U6hQ7PqOcGMQ
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

The virt_formats / virt_num_formats are not used by the current driver
and are not going to be used in future since formats for virtual planes
are handled in a different way, by forbidding unsupported combinations
during atomic_check. Drop those fields now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f7efeb2b77c4..bfca993deb70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -317,8 +317,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -333,8 +331,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = rot_cfg, \
 	}
 
@@ -344,8 +340,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 /* qseed2 is not supported, so disabled scaling */
@@ -360,8 +354,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x320, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -373,8 +365,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x200, .len = 0x28,}, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
@@ -383,8 +373,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 817e98bc6997..78ae3a9f22f9 100644
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
2.39.5

