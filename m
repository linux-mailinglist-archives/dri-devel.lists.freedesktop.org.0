Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165E80B784
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B9510E319;
	Sat,  9 Dec 2023 23:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58A410E300
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9f72176cfso39933981fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164097; x=1702768897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
 b=iog8TygZMw0xth45OUVRd0peMRD6KxLFYwuwUTE80WK93UAEMjNjDP8AvJQ4ilR1gF
 Xx3WfBQ952lTllTSTQ4D4ANdF0DCTn8KFGEx8Ft3PuRMWuZmk1N4pFuyCYYoy8NwNp4p
 XAS0lJFH8c/qbfzjs2qcsq15+Br/PISBsu2VKcjK0oed36RO36S2HQgQR+TupY7Erxob
 9EP11SXx23OUk2wqN/JdHGa9bAlwos2/56YoZXWS5fIsRksuQoPt0J/VmBgEVD9uGtvp
 6Y1ghFjdC0nFmc0hex1rU32Cyolf9p9j3ogqOJms1pTtOI4kvaFeMVrFPRXh9geDRo8L
 qVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164097; x=1702768897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
 b=H4OQZTAvZsoSaWmMlpROe+/qP5m2pitaHbAv4SHMZ5Ekx8hggZRtyKy084bbe44UC0
 SVopVvYahXw3Kq7qBA5oOWCnf9KyyEAe17NQge6cPgCvFShxmtgFN2Yb/7Ft3vsKzhA4
 DHTB6P0LnJhUaKA77HY+5SJOKsze6YG2BgzahmocPRKVnyMEwTyHLIhRFFGebgCAGE0n
 Snk5hBIkhmUyTYly+YsW/JDZVR4DqGqudBK+Fpul7nuSrKi0mqLZsqquXw7xBbJrDhH1
 QEwHMhASOFGp3HxaP12mXhcrMXUFMQA5DrmLF0HMEPFK0QVUaBrqSQFq63jpKaP6FRV0
 3MLQ==
X-Gm-Message-State: AOJu0YzyNRrzwNk4PU8Kqiv+GOxsJC2kpj8lTbMzHf6Aire/THHhdLfl
 vczCobFdZEUgpt6RUkQscRbJog==
X-Google-Smtp-Source: AGHT+IEsH7bZJ6NHHzSz3PIsREQmGftXVyk/tvGr+e/b2ZwOpkBLf5rJNw7/z2UcN923vKRyJVZd+g==
X-Received: by 2002:a05:651c:9:b0:2c9:ec10:2e24 with SMTP id
 n9-20020a05651c000900b002c9ec102e24mr372894lja.214.1702164097093; 
 Sat, 09 Dec 2023 15:21:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/9] arm64: dts: qcom: sm8150-hdk: enable HDMI output
Date: Sun, 10 Dec 2023 02:21:27 +0300
Message-Id: <20231209232132.3580045-5-dmitry.baryshkov@linaro.org>
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

Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
bridge, enabling HDMI output on this board. While adding the display
resources, also drop the headless ("amd,imageon") compat string from the
GPU node, since the board now has output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 128 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bb161b536da4..6a036f9ba1c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -54,6 +54,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -359,12 +370,112 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_1p8>;
+		vcc-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p875>;
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l5a_0p875>;
 	status = "okay";
 };
 
@@ -402,6 +513,13 @@ &remoteproc_slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <126 4>;
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio9";
+		function = "gpio";
+		bias-disable;
+	};
+
 };
 
 &uart2 {
-- 
2.39.2

