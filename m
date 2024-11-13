Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB29C77B3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05F210E73D;
	Wed, 13 Nov 2024 15:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sv59IyGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5591F10E748
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso60767635e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512926; x=1732117726; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9QLp1s6RunFlEIPDGsvb0lHzi+DB0IAKSMWyP0xL4Qc=;
 b=Sv59IyGJM6U1+vCrOxiJEgMb51JoISnwWmwt0qTZt5zVvkN36aj/YMkYUsnN1V0FlO
 AbfQztattF968UKj8OZepioit6qMYBF/PvqZ23Hj2sVS2/k331xTZRb23/I0BgP0yBxv
 nmm5OD29CEjsb9Bh4tE6t41x3VmqjMDo2MO4qydxgLxa7eM28cF5asFCiHnftyB9O2IU
 xdkTtlv5Kw6W6zdd1t+BtMeQEsvMJhcI74wggn4AmQN3HtvmP3yBrMarrxWfX6bO5t/n
 YIW7aiozLkKK7u7Kl2+mfgd1psfikfl46k6DUl0R4kvaLY8MFA+3+uN57gb960bgezvr
 L1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512926; x=1732117726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QLp1s6RunFlEIPDGsvb0lHzi+DB0IAKSMWyP0xL4Qc=;
 b=veKXbalnM91uUJSvdwsluacJAsgLuh1ZfX9RqrG/El22t9DA0V23hOF0+znLd40DQO
 u104GF7gbZno8cSPVI6kAQT9aRqNc1Enm1x0ELgnuVczYOkb1klMtRyYmzAeXZocCWQ+
 1T5IuANEFs0+hSwgrj46WoBD0U061nLtCD22bFWzCIvzA35disbMjqEa9wKDMkOgaZgV
 Sy+9ir+QEqueXbjj759VWBJrGvTsA2la8o2p6rgf16D0ohTgNTKMgu0OWfL2EuAW8Ao0
 CluiljTG8wXgJpiASp1GuvWGUw6LGQgWzV1/4ol8nWg9SX2izOFY0wSA7UfbnYyLSZCo
 6n3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlHOvGYAsR6jr+LLZOY01SLxNj/GgaaADY3F8rutWVOzelidH1nNO88UKovylJDLFYE8XF2gCVMZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO8lICa0yY38UI6NSkZmpWuGiD6NbHA0HNciN6VVvgMEdXRsxe
 ItR0sN+WeB9q/WQBnk0mgn3D9Py6ugITPBy6yEoL+mYa2pu/p8d0rGIapijj3gU=
X-Google-Smtp-Source: AGHT+IHhsJ5vHXywCMjF85D0QDjPH1adB7FRz0zTJs0n2OMOmH517AP2qB1RCaElCXb/vLCQ/ACOcQ==
X-Received: by 2002:a05:600c:4f88:b0:431:51c0:c90f with SMTP id
 5b1f17b1804b1-432b7518dcbmr164295975e9.21.1731512925721; 
 Wed, 13 Nov 2024 07:48:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:33 +0100
Subject: [PATCH RFC 7/8] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-7-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xTy0814t50k26n3IdWEnCW6RpXe9FNt3pkGR9JMo8Wo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpTUkjA+wwux/4I7KQrmdXKIWToek9n3/xCqvqa
 drjlifKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUwAKCRB33NvayMhJ0dPpD/
 4tNTq3Jga253HLV0W9pD5OuDlR8t8KvIXXyV17X+2j4V8DHNENp9TR9TdAhfUJuQnj/9y0D2zSyXAP
 gkrIds2ZigtWraGgAGb4eX9X6iegJnW8v4DapwoYwc5FUB6KjZ9jnut+oV3dEFftAr5/Pmwg+aOpsi
 u34PZ/fxNGtvOdIguu0lHD4gesyBfyncZoyIGBIoLP6Slwu2gMwOt92vErrlYtgW9Xw41qoMcr1LiM
 AvwPgzRab2E7N0VMXaViFkojH8vhz7PplQW8WmQ6zlv0pbcIe0NSvGlTQ6njZJTMy0ymCFcqk5XH7f
 2TDhWwpf4imPdYhj5QDu7DWbBIX09OI9YZHLFUp2O/uhLTvPIVIVM8rYwPgj9QrRr3HE733+X4Fw4r
 BAHhTpoNQ5DF+49m9mB/+c/gXPCmfeR/qscl4gsns3FIUF13IRTlyzECehCEFaFLzc/d2qlSjwgRNJ
 XMaeVevwuOfyI7/LcWtzTgexvvUEKjXWygVw3Rh3ARcGjrIfGvhBUbvyHJ+20YHFpV4lcV29WFF8cr
 h3uClG6c2biDO/R/CZKW1jAr0Ru2y/hANIEYphScZeKygVmQQaVcNotxMcB9eNB4S3GBMKVFQY7zIM
 6Zk6cW1OBVMJpRnj8sF2uJxqY5b9+ucb2KhJXFjzQ4XK4g830Z8yzK+p9zVw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f8711e01934e47331b99e3bb73682..808dce3a624197d38222f53fffa280e63088c1c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2113,6 +2113,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2126,41 +2129,49 @@ gpu_opp_table: opp-table {
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6671875>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <6074218>;
 				};
 			};
 		};

-- 
2.34.1

