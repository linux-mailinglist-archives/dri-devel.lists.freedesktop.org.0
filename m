Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0907F8B70
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 15:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AB610E32C;
	Sat, 25 Nov 2023 14:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2010E2BE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 14:18:03 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54af4f2838dso2011733a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921882; x=1701526682; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fzHhRUdqYzC89phn7gbVveYcCLwhSTvqnPb56NAvVOE=;
 b=iUZMzNGZxoEMpI4QthueY6a9oNluDw2C1Nx9wGCf1LQ7NaSHETu4QIB5iW6HdLA935
 WXbc9yMG72IBv0i31N91K/Yq28ecxnI7wnE64UHrp2xQ2cHSip2yThIykpcVpxgt2tkH
 wmQjQxDNVXPoHW1dOLrc69bsFjUGTudAi66j+koo1kyWpVGZ1p8yGqigzp78gHyqIySE
 /UkuvXQkbFmQ0BQA++qVb8hTqXc6YwhVyQ5vpRoeHy0fZtRE2J6VsvRrvr9V6eJd7n0/
 VQenbGnwAw5759C6sKAYKIctW+Q53wvHRKd4A2LyJJ3XJv9qNbQS0e4uXCwLBvonqZOl
 3bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921882; x=1701526682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzHhRUdqYzC89phn7gbVveYcCLwhSTvqnPb56NAvVOE=;
 b=bNqcERwLo6nhaCzZFRz9jAByJ8eyMijyFXofjhTLuzjDqZdNeUYDA/LP7YgMKctqtU
 5pCLGF8lW+juYUczr2txSQhOgBGX7Djx1UK+fM7KMP/eehAQ4LCo1/hpJcIDoCj2vgb1
 qoVLe1PJYOdr4zHfudjuA4FUE1GcDcBtMGh1li0YiOKFsE+237FmNOF8UBu0spJfDvo6
 Cs6PxJFf1Qpj8MA3SpXaoN7JmANBw+k4vigGV7XxF0u0aAKQXZnH7WYVWVnYgnWBejDf
 w/XcLMz+sLdoM7UrvwbuuKuAxCHtCwMRh0pE8c+AOac7v1SvF5PUcNtTbKGYgJ726+hB
 B9JQ==
X-Gm-Message-State: AOJu0YyO0g5DzexcMQY7C1JQLJj/xytB9bmlUrcvpNJX58FIHaxV0MOp
 ORavRi5GG6Ak+y4KWa7QAoJX1A==
X-Google-Smtp-Source: AGHT+IHXbZJnn2kOU8oXhY8kFLv+tE8yUR0pfflIMAwddWoIAfdAVmz/M0agvUGtae4E5qmsjnU5iw==
X-Received: by 2002:a17:906:2492:b0:9be:30c2:b8fd with SMTP id
 e18-20020a170906249200b009be30c2b8fdmr4666298ejb.66.1700921882378; 
 Sat, 25 Nov 2023 06:18:02 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:18:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:35 +0100
Subject: [PATCH 07/12] iommu/arm-smmu-qcom: Add QCM2290 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-7-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
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
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=876;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=G/TOscakzMl5L7lLg+f1aIz+xjyCycciuqgvdkeUR9s=;
 b=ENgDCU5tCX4v9CkymJG/T7LJb4knR81cFyT/XGNKMDSPge5mWTB461TNnqV2zeQTm7ByPYw3U
 DyVZSXIxFr+D79fGF41S3jBKCH0oWSysSTWmlLWRPUZHnV063SCSZUJ
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

