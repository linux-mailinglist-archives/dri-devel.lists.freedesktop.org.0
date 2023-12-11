Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7380CFF5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2510E4A6;
	Mon, 11 Dec 2023 15:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C41010E496
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50be9e6427dso4780085e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309491; x=1702914291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNYp3d1ic8j7Eae+I7H4QEOmaR7sG5mmr/TaRL+G3z8=;
 b=AHeX6RKY75z0+UDRX1b1BoYSjH2ceq1Z+6Gt9aD1LsuG7kEoUuu7PORGfQrkQDbe1M
 xpPUc/Gq0jlECkMDItCw1JVUo9zf/H4dmsB5l98W5BNMIKF9pvjRrNaWlUaYmsNQhEaZ
 Fgiwhmu6J57KIGOSzACi7ZNRBPnKn0mYiihlxjvEd6cdh3IdrWSsKKnARBv/RLowhSka
 uwL1SRi1FNba1qfvXu4tQy8/uUID9RBNUiL9i7h6bkXt61Zj87A5+35AqHmMK2D5vCYv
 ezM1qF/avyKzQ4bbS421KpMZAKV2bLD447JHPol9qrhiW0xWek6uOTFcst6eKZJ3v1e6
 /iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309491; x=1702914291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNYp3d1ic8j7Eae+I7H4QEOmaR7sG5mmr/TaRL+G3z8=;
 b=YeOeiYJGvuw1jW6Owx5kDv7vft5zTSwJLo/EhiA3rA8AnsI20LLbHI7SG+ZFp6Aujq
 2icA3K8/AVJxA2SQJonG4hD6rSu29KbjwG8QzZHwyUbJGVCV9CiXQoRn5DrxWCjkz8WP
 T6iNQBl3FgKhdWF8XBCxpBN9GZJg+sCWdKNe5rNGHJS7zu3U65fFV/l2+mauJozm0t/4
 tCMkTpo8aZDn9cQVnGkl7+hJ8p84n4ij7U0ZA415BgCoIOzZedpQxhR3F9rZCCXCbwBI
 els/MLgsUBTN3jJE/kXZ1p64CVIgMZzT5HkAG7ZRNNc0noQMIIlctFtWabBd2lvqNpA4
 DwqA==
X-Gm-Message-State: AOJu0YylJI5IvnWtUssjAPoNeM/MR2ReE6CUmWpyaSySy1bqpdbdf7E4
 pi5OloPMmNpo1UeFcdo8qoe0Ag==
X-Google-Smtp-Source: AGHT+IEPhjRdxX0vWq+O/5MYm7iFvVBoRYb1DWpclK2rqE2+cX1sDsaLSrwyBXh97IRC8C9TGc+J6g==
X-Received: by 2002:a05:6512:4025:b0:50d:f85c:49f0 with SMTP id
 br37-20020a056512402500b0050df85c49f0mr1561785lfb.130.1702309491494; 
 Mon, 11 Dec 2023 07:44:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: sm8150: add DisplayPort controller
Date: Mon, 11 Dec 2023 18:44:42 +0300
Message-Id: <20231211154445.3666732-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree node for the DisplayPort controller and link it to the
display controller interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 87 ++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 153c531c1d41..ea7c92c0e405 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3712,6 +3712,13 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -3739,6 +3746,86 @@ opp-460000000 {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm8150-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0x0ae90a00 0 0x600>,
+				      <0 0x0ae91000 0 0x600>;
+
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
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
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
 				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
-- 
2.39.2

