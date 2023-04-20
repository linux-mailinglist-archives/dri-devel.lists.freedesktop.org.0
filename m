Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFB6E9EE1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DD210ED08;
	Thu, 20 Apr 2023 22:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD3510ED26
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:36 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec81245ae1so972723e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029895; x=1684621895;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NzW0EyxEnLgGTr4kvlR1jpwpJYgRpLH7LzUuysQn5LU=;
 b=Ma+NvWDMWecNjRhGTfS//RRzl2qjKfBRdeBNrSRoygMzT+qFjy6e5EiGGczTSb5dJQ
 QUpRkTZYWPqvbYclf4czjUwFg8Jc+x1ddtNq2+acsgMYXfHTBp2An6xaef3DGNB47MFA
 RItS3E7jplMvc58KP3pYAAOfwyBvOtLZjWlFqcMuj/Ux2o9WmBOgjiGs7xsE4Ei+Dk6U
 TNCxGR6mx3jphy5h9te+oQcrunggUVSUZJKM2n7ODWlAh8AIAZGwK6dO7T+zaciZ5iMB
 hTgdZvo1iVvmavJ6rfpl0cxgkICr9PYdMBmHUAXnkQY9/os5RPiZxbZIFmxdEN+nwDHz
 QZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029895; x=1684621895;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzW0EyxEnLgGTr4kvlR1jpwpJYgRpLH7LzUuysQn5LU=;
 b=cY7DdZ6pc0zZaFFUDhNE8eu0SGja4zy6p2nUnQsWHySwNoE5uWdtYrWqbceQdgSXHh
 OQmkj8BKMP6fHKaHVnpj6wPI7x66covbr6BKZVQ+Z6QWIMdpqshJGzgiFXhxNiXplTuZ
 PhvULcr76VaIiUlgOUHJHTxCpqE7mWRvRSHLLRZfvNj3DPbctIPiwRP2FKL7y/6s+Bsx
 34MmP7dlA8p7VsSEEbX1CtI0is5GEg407PeZ1+7WKC30ZN4H4Zvl/Ro3AQuSwKQsSttc
 hX1jAZssybJY10mrk7UVmQtJznP49BwEKUBvynw5OWPH3y0LKIXNB75CZcx0Rf+CpPUE
 3Vew==
X-Gm-Message-State: AAQBX9fNAzV7f7jRTHSrdnmqVDFPNds3w9Xz+95ZIL8n1rJ6/TpQe7G3
 jTSN76+wotJ1TneS/9luzN0fEA==
X-Google-Smtp-Source: AKy350YZCctAZ8o+9QesV16tsV96ubVi/ClzN4jAIauRdQ6iFbOb2/iQX4NOlAez5gusI19gaCZ1/A==
X-Received: by 2002:a05:6512:3c9:b0:4ec:857d:9c94 with SMTP id
 w9-20020a05651203c900b004ec857d9c94mr705379lfp.15.1682029894970; 
 Thu, 20 Apr 2023 15:31:34 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:17 +0200
Subject: [PATCH v2 08/13] drm/msm: mdss: Add SM6350 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-8-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1325;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YJnhuotbycPo0Lxuk2IRtdOzqse8Z1bIU0CErB+UTrw=;
 b=d5k6WYZUd1XbcPs5nVQlXqkJtEycVrXqJI6R1+zGm9QHV1JuWYVoLyI0UBWtYcyZeJB+Ge8Enm6E
 pWe8cxtkBAoI/eYMad7nfABBlIGkHpu+c6+M/fst+9zWU45spktu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for MDSS on SM6350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e8c93731aaa1..4e3a5f0c303c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -538,6 +538,14 @@ static const struct msm_mdss_data sdm845_data = {
 	.highest_bank_bit = 2,
 };
 
+static const struct msm_mdss_data sm6350_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 0x1e,
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -571,6 +579,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
+	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.0

