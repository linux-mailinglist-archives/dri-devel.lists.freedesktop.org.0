Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4664B80B777
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485710E30D;
	Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D7210E300
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9f559b82cso36860371fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164096; x=1702768896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgDxAEuhsmBMeANv3N0te/wPGHFbBpN6eVt4De9yE3Y=;
 b=kUGANCd0Q3sHYYXJMfCLWi+iqv77yW535iZ7UGKIPHQo0dLmGWdYe6qCa/fM6fO1ZN
 lb56INDn4mX6zYpFSPZKrEGZI7k+S3ELnX93QGOLWoYNlKXSSrsag/0TEwl+gLGoq5OD
 801WjGkfuNTFoZhNSY01KZyfzKS/7PgsD0RGKM8OCHMeJsXrMNfw3rfaCaGp1VkjF8Zx
 k0xJy0WmqQDBsWMcWxoTTOcPuRfK2Z9O8VoxgjAXDmItKJUaswkstVkq86YLbmBvnHFa
 iZVxXjSDhlnrFIitre7NwyZ/1PxCnEPnXtoJ9z5R+2r+3Aqk2JDh532BeN3XfO3iv/nD
 ZGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164096; x=1702768896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgDxAEuhsmBMeANv3N0te/wPGHFbBpN6eVt4De9yE3Y=;
 b=jQOrkIKiXdvUwREI+bYSwR4wf/Y5EbLdN5O0UvuTC86/JGC6dTrU/jp5nQUJjb6Ydt
 T+7D73HyNgPt/Us0kipg9LtZKQT/MbsX4mtstsJtagsvZZcXiaehkNpwTpOOhXxt4YYm
 Y5pcaT1Wv0WZDkAwXUNdyThhT7Klt/yshBgwUHy/BWLgATsBiHxGDjqTIM796keht6Um
 jZIRksNAa9m46lmprm0wu3BRLEaoB70+5cE9FXUCB4di7c4ohWk+Fm9L1i+R6ORdNhuH
 DHRZdvvOsHDrnRmuVUgOVauurAh45yShk5f1PAwZfLHEMdSaHc8TitkFvTXXPo4ejg9L
 R6Jg==
X-Gm-Message-State: AOJu0YwJbzK+FewAk5gPJEWLJBVET5eJRD47PtUdIMi/oBl9PAvUBMrZ
 uh3qhb6KjeBBKxS1ZtRKm2Ybjw==
X-Google-Smtp-Source: AGHT+IGUzLLBnvyzByTUcEtcoTK0ECG9194KSNjYB+OpKYDRaX+qfDCUoY7QFKr9d9SKUTVhFBsolA==
X-Received: by 2002:a2e:94cd:0:b0:2c9:f4ac:ccc6 with SMTP id
 r13-20020a2e94cd000000b002c9f4acccc6mr704022ljh.46.1702164096346; 
 Sat, 09 Dec 2023 15:21:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/9] arm64: dts: qcom: sm8150: make dispcc cast minimal vote
 on MMCX
Date: Sun, 10 Dec 2023 02:21:26 +0300
Message-Id: <20231209232132.3580045-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
errors when enabling the display.

Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fb41f91cefc6..153c531c1d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3925,6 +3925,7 @@ dispcc: clock-controller@af00000 {
 				      "dp_phy_pll_link_clk",
 				      "dp_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.39.2

