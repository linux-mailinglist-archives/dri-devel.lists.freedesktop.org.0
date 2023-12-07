Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E406808D9F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAF110E93F;
	Thu,  7 Dec 2023 16:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160F010E934
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:37:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c25973988so12533105e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701967050; x=1702571850; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=irqia8R6fGw+gVdCZPObqSm/BhoAsGfI688KkfIakSE=;
 b=W7znqarVF8a4aNv7ymJak/gcYIh5smSAdcRpI728T9x+mAhm1tVY0k8bPD3/btCiu7
 mPhqZoyg4d61UoGCE4KMvmUF+qrX5ZTYEjuAJtpjRFPys2b84+21fT2X+6i4vfas8j/k
 xQcLbBR53NZYarM/2s1ALg96n67P0bp85qpFbm31pYx7uy9FcdWv0ftGyaqqGyaHwXlp
 88ufNMPoyu70qVjV3XNpVE2dSiPM8xDMhcxu4cv+nvFrdFgZpNhp4Pz/38uENrAl6m5x
 ZIz8fn/j54CAytf/seapR/oCscyIn+BzD1EHWPP94KnNIFcec5a0enBD9KFhPhVcFYi7
 euLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701967050; x=1702571850;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irqia8R6fGw+gVdCZPObqSm/BhoAsGfI688KkfIakSE=;
 b=XhjYvNi/mu3VTwDNSUcvP0mH8xZ+M1okZNRXN57fY2gj/1QVFSmyeYbjlMogsQ5BjR
 +0+7GuG91uV37HJDEKzbsYSisN+N503nCdes7sKLF24AfxYHxPeRjc20TbztSsynftYW
 f10pf4ScQu5d3YSSkEPIWPQKk5CoHt2r7nKLw+BickqDGz9qnh2LJU/KXOQntAqPrcng
 ihK97w9dFHbB1YlD3Hw36pWUqr+VwjElDOmgqXZm5JHLXi+7MMSMgRFFd8rCd8ZlUGTQ
 BSOsUw2CctIO2IVuzzsu4YwrhAYKfTTFFB9DJeZBsni5IFdX/KRoIFqmgz6SbfX75022
 ymEw==
X-Gm-Message-State: AOJu0Yyh/LnA1+GV/aU1nNgItNwOEI3PtrHU/OUTQbHAOW84Zstmbbti
 cKhgmmf2aVHfBMu2Blkp/v6WlA==
X-Google-Smtp-Source: AGHT+IHMS/gd/XK1hnTjye0u6FJVczbf/wcZbbi+0BQsKGN+SRrXd9ba1C8zxyC14ryCDBNMElvbMA==
X-Received: by 2002:a05:600c:1686:b0:40c:258d:2f01 with SMTP id
 k6-20020a05600c168600b0040c258d2f01mr1274196wmn.105.1701967050473; 
 Thu, 07 Dec 2023 08:37:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b004080f0376a0sm175424wmq.42.2023.12.07.08.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 08:37:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 17:37:18 +0100
Subject: [PATCH 2/3] drm/msm/dp: Add DisplayPort controller for SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pN1DcwJDKt86C9TW3cEpaDhQ15k1t6TN12ykZTFzySY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcfTGbloDh694L9Md9HCAYNQJZjwBRUQhOoTt+iAP
 0zEYWiGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXH0xgAKCRB33NvayMhJ0fYLEA
 CbsGLaMiwD1kcwOST8v4C5TMqPU9pPOI+dae+FGp34VtT1Ga+UMXEDs5zNpZl9E5BFudRGsrOjTi/l
 yoygODhsUN8cCR8aJdrVC3MqnyPL8wF+GNbNLtNlO9ONfnbq2Rt6NEWSujGJH2t4t+ewJFT3KoBQTN
 U3+TGwtxrfgjvRj0mHxvCbugSg/wZTc/aoNRLHWK/P4LCcfy6AHXzqzVllW5Dzx2Zo8cWCAzqAX+/J
 fo75TfqW1BaDzpZGR7QFGB7Ovk78gBZkXTm3nfQhzpjomDIkLE9/BoSA9NtBd4sKCnQ+ERRqd43/nW
 d9JuIs7UM0Y5KoZclVi+plusRPprD49neLDk1PG735Qcbm7dhxUxlFdhfr3uuUVarB8GFMlfUFPswe
 18TF1P/3qxt5YJb8caSK9+Jm4IKXknvPsTpYO2LsHBmRFBmUwh7oneZ+gHlpTcJJt+zZxzSFnk2tDM
 R6xxTv7Bvohw1e8HcSA3celeOcEndHbbWOfNRpchoyGvJr3NQS/+EvwhfKHcMd20HZbZrdZm3jD3Hq
 dAppg8+2HZEJYBbHvl6zjCONoavtRs07X2OhP/X7tz5jI4QCttG636AdmsvMzQaChwhvkZ/e9csB1Z
 C6yWedHpThENBtF9oobuWrGoFcdkSc23gENibredkt2w/S3yYHPC8SF1HISg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SM8650 platform comes with a DisplayPort controller
with a different base offset than the previous SM8550 SoC,
add support for this in the DisplayPort driver.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b57ff6c3215d..923517046ab6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -168,6 +168,11 @@ static const struct msm_dp_desc sm8350_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc sm8650_dp_descs[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	{}
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -178,6 +183,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
+	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
 	{}
 };
 

-- 
2.34.1

