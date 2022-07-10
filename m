Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD056CDF2
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C517E11BEA0;
	Sun, 10 Jul 2022 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF93511BE88
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu42so4295376lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kCksQy9hyBEb/dg/WClV26pEAyqH6K/Nlp6/fq7zx8=;
 b=elgtiyv/9hE7IpbOInVZGopuJata+DVamrZaV4WwV5m/3OMI4591SMBpZl0melXv7p
 uJArSfXi3yBJHRfX1oH2Cki5ExfLQWFgV3UfA9vrA9d130TxWxPz8TzU2gAebjQQUAO2
 mHY0U9BuPuIBD6Br/qgSoJuqlJRVIJdFUv/dX7WvvXze0uCpA4VmjWexVnWTsHkAXI4t
 3mUjGLS1qoIz8zlTFMjdVOAOnwst25td71oN9hlDmBdCpli4kVGp4DxqyzJo0eeJQVL3
 t8W8EDuHV5uRGPJEfNzuu20a+QwJ2MjOvq8zSyJZxnDOr9WuSy0sktkZ5SEE/j7XODeQ
 6iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kCksQy9hyBEb/dg/WClV26pEAyqH6K/Nlp6/fq7zx8=;
 b=KbzEpc1Y/7qoquIqUFJlIZwfGD5Il1U4kcMS4x7vV70TC/b5j1zT3QyUJXel7eo6VR
 PKnE8QD+X7F2TCdYk1abdHsOeb8O46iEOyftplthnyr/3MUY0bZbzais2UWqWd5a30qt
 FF1o5hi+5nPxNmI5YoHKTBLzCl3TbYOjpzJrmScEbFeuy0Fwj2BwygnPoaYX9mz+JDxo
 72pXBSntSp4YVefL0pwKc/zHlREsrL7JL1gu2xTcw0hnnp573nyTasKqqAhx2oVxysl9
 0nHHVcUmYOJUfvtKSkCkJ5JrlsZDGjJrDmlLqcDLOWgGck8PL3pLdhDUMy/ZB2rcfMQ8
 OthQ==
X-Gm-Message-State: AJIora/tRDjSm5kZpraQhDP6b8PCx8xuh6VO53LsyPTjbVGY7qJGnMEi
 qkJnsPDivL+x3lH3+X/zmCaUyw==
X-Google-Smtp-Source: AGRyM1vU2rzSmqfURkkjagDekzoolslMTCa8n25I0AuNnvrIxF3WNQ+iDXwESlEy+d8b7rttpHxTEQ==
X-Received: by 2002:a05:6512:3408:b0:481:7a4:1919 with SMTP id
 i8-20020a056512340800b0048107a41919mr8513714lfr.296.1657442498318; 
 Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register block for DP
 controller
Date: Sun, 10 Jul 2022 11:41:27 +0300
Message-Id: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a3def1022ea2..e54c2000b098 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3810,7 +3810,11 @@ mdss_edp_phy: phy@aec2a00 {
 			mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7280-dp";
 
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

