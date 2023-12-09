Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA78B80B77E
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976E310E318;
	Sat,  9 Dec 2023 23:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738E110E301
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9f84533beso36651821fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164098; x=1702768898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFNU2Uw0pSijZLO+gDI3Cy6lXyGk9xUoibHaeplshjA=;
 b=ZvQwykjKcYRfyjJgT87nLGFP1aZiTuLcIBS/SmTmkNu5ePL3FX7M8saj2ccgb2IzAj
 WCb8vcAwoXJQ52yVUElcEaZqiTsaKtpc/i8yiIOc2b49/9iyLL3rKAJEtSWAMHr34fSi
 XMJ1XaOLodpwEcv6l9xXTs+HNCJfAKXurtrnlns8JG6Og8k91z2u9rnEV9R+E2gxEfSh
 UNN9l3eOoJnUqCGPqKT5D3BclBX55iHSaUH8II5Icoa/DAXydKnROKT4y106FPK/hklq
 JxJTJacCiIuCtx8Wn2RPXd1NFhDv2NbbdSmLRKeKYvZC0Kn8tHG4s9NGnTLTW2o+Mmc8
 fmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164098; x=1702768898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFNU2Uw0pSijZLO+gDI3Cy6lXyGk9xUoibHaeplshjA=;
 b=oIBBCXekhNyCAfAZQCzVbqnCISRom22StT4kDqxQHMr2TitkukN7W6i9za9JIzGcj2
 qZen76l/IBCDycror911Xd8azq+0vXQQ6X/tiUZ9YE+R0JtKYkwJG/CSm1nHXnVbYevE
 uRUn5OPHyhBXYT1feXl0swd6qHCqgB5ts20N6y7YND+K58IMOtNOde2B8PngVzxsGCWS
 dKCNLF7pYG31X++ZmUa8sEgHLFh85F2LO8gNbD3oCBZexAl5KQHOG1KoPVHqx40m9d5q
 dWplSQo6oly+AAU8NSIdgUBn67GdB3MTbX9MIIjIeqHraYJv/FieXzhgirP+Lh1HCAXl
 ATuQ==
X-Gm-Message-State: AOJu0YyaWt2lptAftGqbM9MKR9BefSVx4Tvldug09EVj7cOCSM6ipEcv
 VHMqzf1zXdKXEoLHCE3mo5FFtg==
X-Google-Smtp-Source: AGHT+IFHcplFcv60XwQPEicmotat4bKqCFXkbEoKpfVySFHQsY0mq3mrzXNQ5TiQAVQ6R8peoAv4Mg==
X-Received: by 2002:a05:651c:1247:b0:2cb:2a2c:55b5 with SMTP id
 h7-20020a05651c124700b002cb2a2c55b5mr464415ljh.10.1702164097820; 
 Sat, 09 Dec 2023 15:21:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/9] arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
Date: Sun, 10 Dec 2023 02:21:28 +0300
Message-Id: <20231209232132.3580045-6-dmitry.baryshkov@linaro.org>
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

The SM8150-HDK uses two different regulators to power up SuperSpeed USB
PHYs. The L5A regulator is used for the second USB host, while the first
(OTG) USB host uses different regulator, L18A. Fix the regulator for the
usb_1 QMPPHY and (to remove possible confusion) drop the
usb_ss_dp_core_1/_2 labels.

Fixes: 0ab1b2d10afe ("arm64: dts: qcom: add sm8150 hdk dts")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6a036f9ba1c9..ea4d75308ac8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -138,8 +138,6 @@ vdda_qrefs_0p875_5:
 		vdda_sp_sensor:
 		vdda_ufs_2ln_core_1:
 		vdda_ufs_2ln_core_2:
-		vdda_usb_ss_dp_core_1:
-		vdda_usb_ss_dp_core_2:
 		vdda_qlink_lv:
 		vdda_qlink_lv_ck:
 		vreg_l5a_0p875: ldo5 {
@@ -221,6 +219,12 @@ vreg_l17a_3p0: ldo17 {
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l18a_0p8: ldo18 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-1 {
@@ -563,13 +567,13 @@ &usb_2_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l18a_0p8>;
 };
 
 &usb_2_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l5a_0p875>;
 };
 
 &usb_1 {
-- 
2.39.2

