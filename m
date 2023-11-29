Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585F7FDA1B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E62710E5FB;
	Wed, 29 Nov 2023 14:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11710E5F8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc59115c2so931985e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269065; x=1701873865; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wo1sJJZHw7KBTaKmEN30ScvrIwX30d4f2jOhkPUqxBM=;
 b=xmG9Iz0rGVMcD6G79O7b/RljWiscFdl2ygl6xMAv4rMTzN439xX+C/aJOB4vlORj8O
 BH/5+oQquqV5LKjeToDop1U/upqx573QORx9WlCPVEkIWyl5GQ1R3Y9LJAohmJdm06HB
 gjZ+Y4ComlA0hp7gcZgNUONQaj5TXML6niP7BKJ06RlKW9Lfl9XCxEwu4uDbKEHtpHwC
 rejq+2kZa5NnYNrC4uA4KuH0Mmd1PMDG/lZ0IeYna9z2/Ss5Oq/uI0Tu8+Nq9PmAjORJ
 wc+VmjZC+Z9kTg4pYBRxRyZhWXgoMKkYsV6AcdOO2DMMFoY2lj9wEC5KMo3vCkBEkuDj
 3kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269065; x=1701873865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wo1sJJZHw7KBTaKmEN30ScvrIwX30d4f2jOhkPUqxBM=;
 b=j7ENH12/NPmeF1qYDSdK6n4G0x5pRzKmohWRsJTF15Mduf9GHR+0Dgu1tRUu160AyC
 LiKEZD7v1hNy68jwT0Og+5g69QRTtJz6VG318QDgBOFphhSLcxf3Oo/Tkcx7kdq3R6b0
 fOwsjcqVIAlqTXJEXkzGgvIElOhR7nocdXK+4EKVedUuI5AncCEZklfTztlKQzuOEMB/
 +QotCObSqzKmAfB8S1xwkVlmhM1naAVVWcM78sSGr/r3n0y0DpdawNL6pBvktBVNDD9c
 zrG8jOwiizUneL32wD5aYOItgXcMHUoawLQ2+ue8bgM2Z4JuewgmKZ1bLtJEai2Z2qhL
 4DwA==
X-Gm-Message-State: AOJu0Yy8pp8qvlgoLcc41Ti3C3RT1ko1URLD2ro9eB4Z8xtK+VPeLP5i
 9bPZ6ZiMVn07Zv3XnM09vWA5sA==
X-Google-Smtp-Source: AGHT+IHIFF7EvttkvKqxTdo7EUCkiD1rO8UjhJ/NykBDp9vXAQKIDUWYvgiQY1lP0nrgP7lsgpW8vw==
X-Received: by 2002:a05:6512:3d94:b0:507:9a66:3577 with SMTP id
 k20-20020a0565123d9400b005079a663577mr11819960lfv.5.1701269064766; 
 Wed, 29 Nov 2023 06:44:24 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:24 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:44:02 +0100
Subject: [PATCH v3 05/12] iommu/arm-smmu-qcom: Add QCM2290 MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-5-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=938;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZKnU1eVaZSjTBiyHSPh2Tjy7o0Kv51jXq1kQ7e4q0JU=;
 b=0+UJnE/UFmA357lPZt/AVpOt+TH32uQu3LcDEhl3VCvws5BJst6hotge8OV/5/cQmoLRQIEVm
 h3sFcW4Ar/GDlhsMpOlDPsgg2azmr+u1A/lG/dy/MwcPNnwfEdJT2bg
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

Add the QCM2290 MDSS compatible to clients compatible list, as it also
needs the workarounds.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

