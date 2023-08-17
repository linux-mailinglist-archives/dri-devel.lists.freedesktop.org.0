Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6577FA06
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A92F10E4D9;
	Thu, 17 Aug 2023 14:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C18F10E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:59:45 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-991c786369cso1054988666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692284383; x=1692889183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etL/n3iIerD/3favPB10Vxz8tYmFCIfiw+o1s0E1jRw=;
 b=gLqQwVag4j6WLy7UPvyheHVMlmXCtSkD+1PLKE9qtrB5nVJrSAqp+0kz+xv+VDbJi1
 jKE/hGupX5oK4S0uNwwIUVEfXayuaSdhkC3FIEW8MpTvEYrScK3KVJr6aAGymjtbqLdt
 TVSg1nGsoBAtgNzBzhr4n0HZgyUr560hTiqxSMVmm6L1NEkMtaw3UmPrgiVudGyz8gzp
 UqE7ZbDlJAg82aMe15RHCiqXgHZ8aUlVUELaDmIYlqwKVTK9cg2C6cTBE9oygGXfWDJn
 HRk82p8zUrYzZvbIgSioUmpitrH4acCg5KX1QaMFfEJvYLWIhhemQSmcNuWIQvr/mLIV
 RbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692284383; x=1692889183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etL/n3iIerD/3favPB10Vxz8tYmFCIfiw+o1s0E1jRw=;
 b=IBX54QBxidsziq+BxmiDDnREDKy4IBUhdoKvEPOOXUBjsTYMYNWUAuiq+krOW/uFsS
 AhiEBo+G7vOsfPA3EN0XCHpO3lYpQh1ID0ewVFuT1nAYYuC3KjyX2gD/nZJIv87fJWAW
 ZnicKc3w+6M5bzHqrnvdoA4pYQIU+P4JueBwEFZEFJaQx09WbLH1iaAaqNLK2/uW6d1L
 US0rp9ux2+JFuLJxIWm6cU5os7fG3VdvAHY+iTv90TJsWVQDrFxAQYCFO5BIcYhndQkr
 0XW5aQB6EDwHsvOeCLjzezTHXXbIl9oq2R6tycTUuEYgpmW//+QAtBG/ob7DU8knnkHM
 r6MA==
X-Gm-Message-State: AOJu0YzCwHZMokwW3XXcYRYhJ04/eS3vEabN6yqcSznSRtYWHVysZuO+
 KMo+fqKsfCTG3Dsi45tiNJDj1g==
X-Google-Smtp-Source: AGHT+IHeXDSrhPybt02SUhe5x+g+/A5UCwhRAqPoHSTmVLbvzzDNwTMyaQ0YbS3gHY/Rq9LTt3h+EQ==
X-Received: by 2002:a17:906:7fc8:b0:99b:ca24:ce33 with SMTP id
 r8-20020a1709067fc800b0099bca24ce33mr3638518ejs.31.1692284383645; 
 Thu, 17 Aug 2023 07:59:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 07:59:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add DisplayPort device node
Date: Thu, 17 Aug 2023 17:59:37 +0300
Message-Id: <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
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

Declare the displayport controller present on the Qualcomm SM8250 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index eb00bbd3e1f3..8d705a1713fb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3638,6 +3638,8 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {};
 				};
 			};
 		};
@@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -4432,6 +4442,85 @@ opp-460000000 {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm8250-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&dp_phy 0>,
+							 <&dp_phy 1>;
+
+				phys = <&dp_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8250_MMCX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp_out: endpoint {
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm8250-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
-- 
2.39.2

