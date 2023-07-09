Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB1474C0E9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 06:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7F10E1CC;
	Sun,  9 Jul 2023 04:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A5210E158
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 04:19:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so5161152e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688876370; x=1691468370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1VJuUGOFBi79tukb+D2NWsxrsW5NBrmRFX2x2Q6rsI=;
 b=FcTwrHF3oJK31WkP63aPguur1Y1cbPLJM9okRzZ8yWVPPdz56SSfccyWKZKBt48Yuw
 zB3uPqvBscgVnO0JZ25xqa983B9Xyv3eL1af2VXI+rLa1AWu/yiFz3D4+f8gEb22CTKC
 /aro+Zpy1VTqVPuVo8DEUfPzRn+I5SIN5bHPrwUu0gHN2ESEbrSO5RBTVsFz237eJP6P
 eg+eTNV2EUvzP/yWHOqPD0/jN+QyukonfTTVRtdrVTsXRZP/l2YW3e28rzeF637Os5Dt
 vWJUkuMEvoDCblnv9v0S+hAq/wzx7RfDmS6dWuwMPsrd+uQbs2dEuflsbTEFsLGkFpKu
 JaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688876370; x=1691468370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1VJuUGOFBi79tukb+D2NWsxrsW5NBrmRFX2x2Q6rsI=;
 b=GMq85rLfluwZJ+DAfQ1gdjc9ICbu3kOMd1AlvUMPHdu0CK2DQjW2rBTjNumKObP9Jr
 Dyjccb/e+/VaFN0IxLyp+qdrRZdxmflcRDCEDKQDy+wSpb0WN4LBt49Js/HYjAPF9xYG
 ReSyk0AT9DxHdvgw0Gfm5mOkNq44X2uv6xnvOhLCigToJ7emL1KUIR4HqVj/w36QjCTf
 uB5U8nryowEe1lU6CRHm5qEONAiNzoVXs/sBaUMoSA6VbaT414uGPgw43H4yQChTAyON
 etnLbYGMU4ifEWNzpuiFgv1p3LcQN4nEznu8P5hHK8qdtkefWw7uJrYbanU4Tk3GVIAd
 D1Ew==
X-Gm-Message-State: ABy/qLZDhSPd+hjoazD1GEnr83H8XIvhJMgukSexIuGnH6+mR2i0U7cj
 bVNAKuNd+Ts7VR+Lqo2Tno9LWw==
X-Google-Smtp-Source: APBJJlEFVhGLnVsbm70RLFGO3ra4g1djfDzatugt+Suo3Tj0ccKUebhfbKx/SlZZOKli2FUoFFs6eQ==
X-Received: by 2002:ac2:4ec5:0:b0:4fb:81f2:422b with SMTP id
 p5-20020ac24ec5000000b004fb81f2422bmr6296100lfr.54.1688876369999; 
 Sat, 08 Jul 2023 21:19:29 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 21:19:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
Date: Sun,  9 Jul 2023 07:19:24 +0300
Message-Id: <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
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

Add the nb7vpq904m, onboard USB-C redriver / retimer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 52 +++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index b6c587ffdf8f..a03f334a3d01 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -610,6 +610,46 @@ lt9611_out: endpoint {
 /* LS-I2C1 */
 &i2c15 {
 	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_s4a_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_usb_con_ss: endpoint {
+					remote-endpoint = <&pm8150b_typec_mux_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_phy_con_ss: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				redriver_usb_con_sbu: endpoint {
+					remote-endpoint = <&pm8150b_typec_sbu_out>;
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
 };
 
 &usb_1_qmpphy_typec_mux_in {
-	remote-endpoint = <&pm8150b_typec_mux_out>;
+	remote-endpoint = <&redriver_phy_con_ss>;
 };
 
 &usb_2 {
@@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
 			port@1 {
 				reg = <1>;
 				pm8150b_typec_mux_out: endpoint {
-					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
+					remote-endpoint = <&redriver_usb_con_ss>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&redriver_usb_con_sbu>;
 				};
 			};
 		};
-- 
2.39.2

