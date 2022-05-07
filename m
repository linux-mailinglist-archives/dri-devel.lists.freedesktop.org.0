Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297851E6BE
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 13:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E51112BFB;
	Sat,  7 May 2022 11:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B782B112BE1
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 11:59:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so16594696lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71+fcv8KnRRz4CuqYuY+NOVmoaQwb5cZ/U5LdVWh7tM=;
 b=n+rNKj/VaY5MM0sGyHUQJc3L0k9VjSBfjX3fHluOgmtXWvXdWQXaSX6yLmkUUDHzds
 Wo6aLL/R8X8lv5rDJUWrKwO0nZxgEK+iwo6alutGariALUk9YhkGLfBcoRATi1zGzCgB
 eCjmXwI+HVWdgZ6TqcF9m2LKTLD9z1JtIcJCVXL966+KjbAjisfZO7grad5wgOFwsZ8V
 mMgdSdopZPUphNGTPb9xG1rA9aDSeyLRqkfo/dajP4iNRmxqEsW2TcuRrzPTDoYep2SN
 scqmZfJJQS5r2hRT8lcIEYoMi25Z2n+f1tWqWOhGv7nfkQiVH1thBFTasrLdyG4l0Q+T
 219g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71+fcv8KnRRz4CuqYuY+NOVmoaQwb5cZ/U5LdVWh7tM=;
 b=OlnmxsVUE8W38skXg9Yv0z5UmK8ICXNaUT77NUxb5tBiAFUXpG2fjP0iuYYivil/oR
 N3JLqIIYj/vOcrVGBLupcFqFM/c2C7kcP3NSzsWIUjc6xGsQ1hQ7b4+cUycq9zo5V8yS
 bNBcxeLERi8Go5SSUw6w3Zr6oxH3hm9znTATHWwvQRnntLKIMjwgRkPCjne5c/CWKHWL
 FObTHg6Olxmxo9qWJZFm13Lgig3TD+0tcuatCM7EVt8248XIyeUrX+Wre9Gn/+H2w4mo
 QT1cW+N5CndVDcfeu5iSom0q7NaJwc8wx527bzcD28PDXxstOZLj/+4cV8uIUOmzT97x
 zf7Q==
X-Gm-Message-State: AOAM530c5Tse0l1Uj8ma8Xz0KeTAqEHXnq0REfYxvE9MVmkDlbTWMfyk
 Od5oUcgfTJEBec1N4kVZIsjcxw==
X-Google-Smtp-Source: ABdhPJyONaIbERmZr+B2RapCSr7d8hvEZej6e1O9rIrrCtHkWpZ+eP62baG228pimeIkFEF+zzbdNQ==
X-Received: by 2002:a05:6512:12c9:b0:473:c33e:a65b with SMTP id
 p9-20020a05651212c900b00473c33ea65bmr6301435lfg.285.1651924784990; 
 Sat, 07 May 2022 04:59:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
 by smtp.gmail.com with ESMTPSA id
 f3-20020ac251a3000000b0047255d211b5sm1083738lfk.228.2022.05.07.04.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 04:59:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys
 backends
Date: Sat,  7 May 2022 14:59:41 +0300
Message-Id: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The functions dpu_encoder_phys_foo_init() can not return NULL. Replace
corresponding IS_ERR_OR_NULL() checks with just IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb20cb8..07de0c0506d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2144,10 +2144,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
 		enc = dpu_encoder_phys_vid_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2157,10 +2157,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
 		enc = dpu_encoder_phys_cmd_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2170,10 +2170,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
 		enc = dpu_encoder_phys_wb_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
 					PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
-- 
2.35.1

