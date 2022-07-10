Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D256CDF4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497DB11BED5;
	Sun, 10 Jul 2022 08:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC4711BE78
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu42so4295322lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RS04L3t2B9fDxy6bqcgfJbhi5mc1B07nUo3XEHnZLI=;
 b=eT0dBRFTsi6+MKJcfryHjQtRpNGIuEQUaOdgTzTP4lSTRfBNsed2GY+0l7K92llRQT
 t70V5Dt8wZI2B4I+yjnOy+HMoHYAp60aySfT49Z3rx4JqutUW2xx3PsIw2hvAvgn5b/L
 sKrsEmc5tFoXgbHdsupyVJuxcdjJi8nuYqGeZ04rsOqMi+xoqqn9E9XrrC0Alq4O6l0L
 /ve16DHUDmC5TTDH8tyWRseIFO0wwH6nWF2bhoQ5v3vqXpLOEYqoovMGEEvmqJbx7sP7
 teQu1ZeiEtprQfnEgyLuvDoZN1BhvA9CDcuQX95OMynxlCE24DXk5uucv/p9bDefTwRh
 4Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RS04L3t2B9fDxy6bqcgfJbhi5mc1B07nUo3XEHnZLI=;
 b=z4T33yJWd5zYllCyI9Bb1hUxXSTSXRPQzAmQVW9XCnYrShExvAZiz61jTXVau2aLYX
 Gu7sYBXiepkPwUAdkPHLNC8TtccpKjS5KSMQnfhpgPk/1Y33Gl6GFi/9vLF5pJzbOXIy
 7PsdItroA28xe6Qs6cxyJaqR+8d3nO9kWVYrPl1jIaUFzU1blNL4Jb7yOmiCHnK05bVP
 2LZGEAsCJd8Ij+Ek//R0zhRTQnu621nDLBtgn6PS5TowR03R5jO3ruPEICENVyQKZWI2
 gDcnIw7w5cb/CK4ntl+I27Of64CzA9+GPQPtAQJWbb5oye7UYUAn5Mip5L80zEwaQTAi
 0eLw==
X-Gm-Message-State: AJIora+nvxv6VkVTRvpmVlmoE/tpgstmyFilFma/+ZqQhIA/BAwsT434
 Nk7uSJemsmsgzQyT5Davmy1c8w==
X-Google-Smtp-Source: AGRyM1t+2cUnkeU4pfWfOR5f6jc/0AReGSLWhak70YmTyaCnmL/bCnDil/M3r1cKsxc4M8oiMsuvNA==
X-Received: by 2002:a05:6512:3995:b0:489:d974:33d3 with SMTP id
 j21-20020a056512399500b00489d97433d3mr1302885lfu.458.1657442496336; 
 Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register block for DP
 controller
Date: Sun, 10 Jul 2022 11:41:25 +0300
Message-Id: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the schema for the DP controller and declare 5 register regions
instead of using a single region for all the registers. Note, this
extends the dts by adding p1 region to the DP node (to be used for DP
MST).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47ce5787ed5b..875808cf0614 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3080,7 +3080,11 @@ mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7180-dp";
 				status = "disabled";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0xc00>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
2.35.1

