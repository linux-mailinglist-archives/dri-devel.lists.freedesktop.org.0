Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D36F8B4C
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C710E694;
	Fri,  5 May 2023 21:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020210E692
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:41:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ac785015d7so25915681fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322858; x=1685914858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
 b=weVZ9XSheAWAx86sFBUBaYDmWZDr7XwLsgPb3yY85630NbN7B8LXtIAJRu3F5iM6GL
 0AEoE3Qs3D6S5p8YKFJU6lkE9fIXEdatXjvE5rH8O3PUELYG8aFIsnHfBK/M7FX8GfgG
 7qPZ1ilOLxKeVBim/hcYhMZl+nwYrEzX2bvwBCrBBtt7hcLouotE+AbEbQD2spbGxQNX
 yF9eMD/2i5UTR7QmyYoF2ZOfLq2WicVVIQCK+WJScvGcBX0Kcpu4THOk9NRqy2ledc2N
 9wfU0CaGNNkg1TTB7E58pUl+12MMbjIRzYXlvH9HG+1Gyl+DAqsG/9vjxeCvUnaMxB+M
 2hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322858; x=1685914858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
 b=EdTzSPSV0Y1Tx49DiTwQ+9Xh67cD0EqSIECi175jHKo2KZCdH/yKUKU9efPbOZP9MT
 Vv2pPPslvM52vmb0DyWlX2eaY886n/RD3PS8+ejgVuyDQiiLxAzO6Uoe+Tw+DzYPpxP2
 iTamDcZChRHBpDEoyDPYlm0dQXXHbO9t4vfbFx+aJgTMFqP3MLG8P0QeWwCd4u1+8imA
 CvhcSCfWQp/RCqYt+TKCyaqYbTFPsSKvgU9fX7IQqV7QmukzC7BDw/a3w/F4BINhPXDG
 uPc+Y6Ror2BqelONYI9UE4is+LvlaLdbQkEjrUJDS9t5pa8HjQe8/g+x/K34Cn9xQfKM
 70MA==
X-Gm-Message-State: AC+VfDxjlI5IVcw38cdVkKFV/Ugdw3M3phWc2WutmxPdWsOASIuTCyiU
 VYKd2pJJ1lsPHddhfd1CoY+e9Q==
X-Google-Smtp-Source: ACHHUZ685M+oS4sLNbr0o8CrcgD7T/uhRvfZPsp8jTmgRv/JWy/90Mt1IQ5Ya8hAWscihJimv/qvUw==
X-Received: by 2002:a2e:9290:0:b0:2a9:f94f:d304 with SMTP id
 d16-20020a2e9290000000b002a9f94fd304mr850372ljh.19.1683322858251; 
 Fri, 05 May 2023 14:40:58 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:40:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 May 2023 23:40:35 +0200
Subject: [PATCH v3 09/12] drm/msm: mdss: Add SM6375 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-9-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Nh6zuYJI8gb14gxje6MmS/hbQSaIA3Eeoi75EfztoC0=;
 b=O0R9IBwQx83wZaZ+iCkksyDGMEr66jfhQEuaLMyd93w2BZzeP2bgaTdASpHY1oirCrmn/JcOn
 3G+pjZFuHTiCBujAXjqW5hc8QDl1jLHFkxGYeQ8CzvHk3Ju4aJllTVX
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

Add support for MDSS on SM6375.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..05648c910c68 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -580,6 +580,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.1

