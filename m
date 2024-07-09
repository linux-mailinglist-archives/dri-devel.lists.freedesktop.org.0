Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9492B5B2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF21B10E4F9;
	Tue,  9 Jul 2024 10:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CmS9FchO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8405910E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:46:00 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a77e7420697so363704666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 03:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720521959; x=1721126759; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OZxsbIBefCYoeKy9Cb25bQD5JKjjQqCGKHe9J4bV87I=;
 b=CmS9FchOElmszfrrFNShwSYvxGXjXkPefvPhrOKW4JyO3f5CFcTOuq192OQ0T5wfO2
 aivxAi+ppKKRy6UZK/eeaf5llB0F1CcHzmuAZ0pipN+pZseuVPID8GH2X0mNZqA9Rypw
 WazDDxcqtidxTtoofQ9nqzzlGrv9hFuRiECehg17ik7l0nQwkVep0UURl1psVK6vO+80
 PTkAIL3R+6B7u2A09R+WHCjPMT0OBm08edZuMosYVDXsq4u6h9AT6m4kRvANhpHrsmQW
 fOIT+1NIcSnxGpMa/FGkdPMjTMCA364B5La1JMBOGtkrgvGQKf1wi7pnbkhI3WrE7wjY
 pnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720521959; x=1721126759;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZxsbIBefCYoeKy9Cb25bQD5JKjjQqCGKHe9J4bV87I=;
 b=MdcweJ5QR6lHZTS3qaIwVvwPTonK/C8FQIJPj9wNRIbDmm4VDuvr5VKvaZXAo4NH5w
 LTVhpNHW+3DXRyhSJrlpHTeKvoikQeyMlyE6/U7nBlOcbx9/itrabfFBKTlM6/zT784y
 NBpzHHSNVRKjEe1wZ9zsPTxmtpXcEf7MEDBLj4+Z/tbdGqNlg4MQAnARhhT7EaABT9nE
 5l1qPHKM9o5T9u1FCKHyzwsgsWJX5LJpPv/zFY/orq22b8dnXcesnP43QL59uVrcRMIK
 mEo6tjBAaMm7AKLM4uovQs08w2ARG4aqcDfrQuGvF7DQ5bYmlZ7AeAMgVi7EkpXOWqmI
 yKLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYdnlv9aQzmHvT/DOVOtxrQcXgKL9HpFUHK3zL5DUx3kCPRCImoByrh91q/9NCUY+WZklpuHMNMmEHcl9NOSecIElNL1y7pSOvWFiskr5b
X-Gm-Message-State: AOJu0YyFrRdHHeAIKMwVtgJdBQMLHKP2dxq4y6O3NRLIPaXcgRt6vQEl
 64eT7jjAhY5BsrVUrk+EMAAxZxlGxM4bu2n+9Nwh4ACrsKiZ4I9XXaPY7b0Y+OE=
X-Google-Smtp-Source: AGHT+IGvYcfPFQV+7DBEYzRD0HAnZlDvmx5BFJoXF/V4cTRfvWKAKQqrkJLnm9w0OQ8iV7jmOHjokw==
X-Received: by 2002:a17:906:c309:b0:a77:e55a:9e91 with SMTP id
 a640c23a62f3a-a780b6b0e59mr135132566b.19.1720521958889; 
 Tue, 09 Jul 2024 03:45:58 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff038sm66295466b.115.2024.07.09.03.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 03:45:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 09 Jul 2024 12:45:33 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-topic-smem_speedbin-v5-5-e2146be0c96f@linaro.org>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
In-Reply-To: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720521930; l=2474;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Il2UvibnuII6pAMEt7ZcsOO48MoDeeFboVabC36fJtY=;
 b=UbAw9OwhyAwE8k7rUjhzv7OltpusBA6x/6YgB89OJWD+ojTrhyLuMSRDX4HAiIBsrrG0jevUW
 UobpDIs2ywfBIgClNuK2w9UxluMiW7//vluUrY7DilgVsJMyXYkgv3/
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4c9820adcf52..c1e3cec1540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2119,48 +2119,67 @@ zap-shader {
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
2.45.2

