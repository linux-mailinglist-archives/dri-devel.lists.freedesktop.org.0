Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168EC7FA482
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99510E2DB;
	Mon, 27 Nov 2023 15:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DE110E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:29:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50aaaf6e58fso6628522e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098947; x=1701703747; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fzHhRUdqYzC89phn7gbVveYcCLwhSTvqnPb56NAvVOE=;
 b=XqVh66uRMk1y+JiB+QRO6VDxSgY6vJVZRQYgOa+vdkkRoD/d0YKy2Lmd3QBMrc2xwc
 VchvaVhW1EOOd9OrTNex8J58FE/rJpA0uJ3SbQMZPpt0AB8kTrMKLwrw9LY5EqoXHp2b
 MJrvgzQ5/qeie+otwuy7Cmg0wCDpJ2J5ibiB2UqG3Gii1wZvlUdoGQ06LfadkSIetSt4
 wM12FmOgFXPqDpxwIwakX8QOiz1VrjnQGAYc+B1/C612xVoLPn1siCGXWZTqPL4vJ07Y
 /d5kV/fIivFr2/qGaRkHjX0Yh+Rqtd2AGFuECE8yVs5rPzP7Xpl5H6liQdAKHGvDeSny
 xLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098947; x=1701703747;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzHhRUdqYzC89phn7gbVveYcCLwhSTvqnPb56NAvVOE=;
 b=Bif1EmOuwGbNP3I+PN1l3xSONZd7+TIQ33QV54mzHFydwkoetmg6e5figWhNE6f+tx
 rVQz0hQk7R10EF7TE6+vzD/0cdI7Li2+k0mE/VCgF8VoX6VsY/lc+Lfj/9BmBCWZdkSG
 qSMzvBWckrk02ZlkIMhh2mfCPrQ3DA9yo8F7soL6h+NeIpg94vIqbtjvh2LjoVEmp33O
 Oohx5WWziN28+ZwRzsp+4nmLI7IdivTYoCi0MaxXkeJ5ofFDe3ytUO36GNn7FQ3uwzhx
 hA3JUZB24tDEP5araiVuaRB4Ntod+ujRiNYJ4uKXix3aiuXunL1TbTk1/dvaJgi2IuKq
 biDg==
X-Gm-Message-State: AOJu0YwKQBmni2f+ZwbFNeDij2KyoaGkPbMgB2D+uRj55qK4L+zT2NQJ
 cS3Us2B6RwOd+9IMuvX1gDnI/A==
X-Google-Smtp-Source: AGHT+IHfuCB/u5iuBzcXxxczmnBsCFIJiK0WEL6nD72DL5ef/WUsiecbpfHVhsXn1JxOeqjD5DGehA==
X-Received: by 2002:ac2:43cb:0:b0:50b:ad16:bca0 with SMTP id
 u11-20020ac243cb000000b0050bad16bca0mr3545964lfl.40.1701098947808; 
 Mon, 27 Nov 2023 07:29:07 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:29:07 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:45 +0100
Subject: [PATCH v2 05/12] iommu/arm-smmu-qcom: Add QCM2290 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-5-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=876;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=G/TOscakzMl5L7lLg+f1aIz+xjyCycciuqgvdkeUR9s=;
 b=VIz+Y9084yjDi3/47tMxdkTC2e177oM5XcQ6dTdEpAKxC7RNhwq2iZQcKfXPJV4yp7X01NvAb
 VckWTM1fxXjDzEfWhm9T0ZWjcXcDhTcG2S1DXVj6948Sceq8Wj0LnzX
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the QCM2290 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 549ae4dba3a6..aea5e85b20ff 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -245,6 +245,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
+	{ .compatible = "qcom,qcm2290-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.43.0

