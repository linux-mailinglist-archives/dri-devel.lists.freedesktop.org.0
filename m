Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868889499A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414A610F816;
	Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FtfHOWcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DD110F818
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:51:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so5861155e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026305; x=1712631105; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u51beO54X0b9gZ2OYRcuCm7ajK6+8XO/iEIFNJnKcqQ=;
 b=FtfHOWcL7go98gtv0BlTaBvY88fy2O/JOKuCMf/JCSm+bTNZ5Ued9y6A/YYdz7M/Ze
 LAvm+tTDIY0Jc73tzkagCFCSPY5nDnxmg0Ocxq+SJ7CN0YjTaXhsypiP72hqidSGDjtJ
 qrXxS0GGpgEm/5mwzyZnhgfQjJvm/vhwyzySNv+Pxro5rYCGcb2XwPrKfNl7Vv1K9yOV
 bM+t72VFB+o613HcQ2IzQRqa+PkXKElkUTJ8tlOK8+0IX2Bpo/kGesv4nbpoNRZL4wGX
 4ZURXIBuUsiyl7BCsKNVtaFPU0weGPQIV7579uc0FZylWVoXcTjpTb8UQ0UOl1DScXLJ
 piqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026305; x=1712631105;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u51beO54X0b9gZ2OYRcuCm7ajK6+8XO/iEIFNJnKcqQ=;
 b=rzbLFBtd2OZON5njOYqK9xgAxfT6dHDvhhrzLxICiHYnOTmiHAzYqEIGFV2i4BLX+c
 83UTsnnPfx0f151RTF076ucLlflupbklcFYhXjSiZbpaDzNf1Y5cEvDZed+ct6PRN7N2
 UdiYXxmvMBuz7Xpq2GL9Ff7cwUUN3JYvKBxjifLwrx/GCeKp2L4FOOcLRrlKFP9uNxsV
 ZIKdUO5VGQzPWnFjnkj2tz+1hKopXGyNYEwkIM2BtC8mPjbTXq8JVNa+v6B5Hu8ajyi1
 66WZjSBzvDbRic+HiWc/rcdlgCfPhS0BOqjzyVqChUoAmobTPOrC0I88usXMW52nkP76
 9gqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqSpQIJP6k8WO0OTXk6X8oyuVIqhxmP3oyuavORuVYDjtYSWvlO5qfIrrTlAGBjlzoAkK2aoSNjggg9UNqrnhpKG3Sgv/5cZRr6EcJe68z
X-Gm-Message-State: AOJu0YxRTydNWF8Juqurz3P0jl0GZGP7AHgo5hL7ooJZHIoKT/Mpp6co
 k3cxvh9N1do7CUtCr+3GwfkkzKFhJHAHFw5qvsY4TbvgyJPNEcpGAIL6N/3QllM=
X-Google-Smtp-Source: AGHT+IFlJxD1nqWGkA3INBWqc4UKgZGBwfU7efLJ9fDsv0OO5y9LIXZl7K0eYhbMWxAwA3+bti7n9Q==
X-Received: by 2002:a05:6512:3d0a:b0:516:a978:7b06 with SMTP id
 d10-20020a0565123d0a00b00516a9787b06mr4216248lfv.5.1712026305116; 
 Mon, 01 Apr 2024 19:51:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:51:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: fix several display-related schema warnings
Date: Tue, 02 Apr 2024 05:51:42 +0300
Message-Id: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL5yC2YC/3WMyw7CIBREf6W5a68prxpc+R+mCyzQ3kShAUM0D
 f8u7d7M6sxkzgbZJXIZrt0GyRXKFEMDfupgWkyYHZJtDLznshd8QG/R0wfztLiXwYdmXkujFRM
 K2mdNrq2H7z42Xii/Y/oe+sL29p+pMOxRyouywx4hbk8KJsVzTDOMtdYfk7X/VqsAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y5XQgkEoklAcMcBMPDOFMsdTPOYsPlqbCmGO9xsOB6M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/TA5piUtvLCcIOV/X+jNAFTzxG6/hS3/cQ
 rdlHxmDYE6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1XgoB/9W5jpGsTHB+uKoc2v4f+cudCOlCoyXPZZK+DzId83JSBnqmrKueem1SagMmXXqW3+gS6C
 GfxQYyBtyk9kAX16xj+FVBiCwzNpx38OoQWYLVwRsPLRLb6qdS+5chK1Tqtl5RusRrx5WO2C/fk
 cuqTiC+iCuxMfhBQPJERRL+0XeLr+RsFm7Hx55T3DnUiofWhfN7U4aSNx/97ezgehv+ZDd576W8
 hORcdkAsajwaV0oHSSQsGlgWlyIfDFWs22qOZRPe9GRvJmPbYqa3Dp3PBz3M6DpFV5lowLaJ1uP
 HvsgOI3Alkgx73KPu2jxthfAhktxxHnLr2BDm/y3Lg8xSVbj
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

Fix several warnings produced by the display nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added Fixes tag to the DP change (Abhinav)
- Switched the schema patch to use contains (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: sm8150-mdss: add DP node
      arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes

 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   |  9 +++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                       | 13 +++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240326-fd-fix-schema-b91f94a95135

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

