Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1808A8C8A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 22:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E531137C3;
	Wed, 17 Apr 2024 20:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZyA/Hmb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978801137C3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 20:03:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-518a3e0d2ecso53083e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713384197; x=1713988997; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eYI4k5JR+67InOGrmasq4k+IdEUXSCsAg3S/O+/c6wo=;
 b=ZyA/Hmb8f+CnV6dCoAqEA14DYQB+KSzRvYIPl5Ap6QchHeOuFhMDP82koPbNjTRfqr
 mK8RoCqmGsC/JJbwVyA4vIstW3FesN8RPhLjN6M4iKxWbuEwzAK+QVJFdrYHC5yZjyUi
 o19NwXp1cVmALL9o4umMGwB1C30u/S1i+T3T+cQqTE13z1PEGJ05kQyJitz40ugNrncs
 qHulMbguxLi2xarzVDp0VLWPB+3aAgiFcxPs17LxxieAlZRKS37sOzDEiBwcMcIkiFZP
 F6pPqetwfy34ABZqtJc4MqZujBAtNNKJ66vM+A1j+JnrgytbjeUbInrGh721Yc0W2IIc
 OmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713384197; x=1713988997;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYI4k5JR+67InOGrmasq4k+IdEUXSCsAg3S/O+/c6wo=;
 b=ggSh5J0ShzSeve8tq1LSylVd8IAKkW4xRXkTEtTkJZoJ88rg/GfS90X/PyaO+iDUsR
 5KW3fXpI1/AqlMmlUOBIcb8I4EfUZbj1/ssLiN2+FPeihbFfOAdUgTZsd1YPKBwZ/mKO
 5+aBsRLWnylVq50KXqD+Ea9zACfpMOg78muLczEujaqEQhRZIDXq6+0zDv9CtDhDbhjK
 zOCRWad7NuOXboAXiPnWn8Abwzew/c1AEvBzlTO0gKWAuF7ouYQfJD9l6p7CukNWO8vC
 oZnx7iCJT3p2KxHCGeZc+q5Nz6hZoLS9wDPvkXbPPKCsyrEVaIxcvy4gWkXTaYTGvChj
 V/tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ4wToxaDz2A88DD7rpOBz4/Y3Z2r+4Qb3fo+lvqELhiU9674NxMF9nYasYLDkUBRpo/UfaBmxk+Xg1OKNKFB+o3zwFJuxCVYBOnJ8ADHr
X-Gm-Message-State: AOJu0YxySqVveEDMoWtsrLPli4PHjLhlMJZn9v4QcakApRfwxoIbd+gr
 Qn0AILiPXDG6CeKP+1+U121f6aaI40Z8XBEMtHxzGlLO+bar/k/y/f0+umuSDGM=
X-Google-Smtp-Source: AGHT+IEveCP0Ef7EGrGrqGh7PzeSM8OltYJtYtq+rF4s+Usgg81dUYwCdW8Fjgw8tn+MFYo18gTAKg==
X-Received: by 2002:ac2:4852:0:b0:518:bd37:606e with SMTP id
 18-20020ac24852000000b00518bd37606emr206953lfy.13.1713384197719; 
 Wed, 17 Apr 2024 13:03:17 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 13:03:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:59 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-7-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=2413;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N9C7J/UXFBbxcLZJ0Wle4it14ExoZJn/aRTDf20iB8I=;
 b=MHA+uQvVZajZO7HB9yQ9w98lwwxIsrifK11MFrFba+JTdm7p6ywc7iaAOHKu6/NKHBghvMv0k
 DShJ2TmzIFCDxFEiwF2L/6pAbYWdc5a/F5PivT/SpWn3M5H58jc7ga8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 5cae8d773cec..2f6842f6a5b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2087,48 +2087,67 @@ zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
-			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-719000000 {
+					opp-hz = /bits/ 64 <719000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x1>;
+				};
+
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-124800000 {
+					opp-hz = /bits/ 64 <124800000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};

-- 
2.44.0

