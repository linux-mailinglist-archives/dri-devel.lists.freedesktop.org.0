Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F589D2D3E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699D10E69D;
	Tue, 19 Nov 2024 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Uy7cRnO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4693D10E6A4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:57:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so30755505e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039018; x=1732643818; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gHpOD3kUgP0NZgNkpxEn7+M6CVhgca5HnhadSgnc1wM=;
 b=Uy7cRnO1Q+gtYzeJjmUs46AxTX6bXIhIUKhBhBBUy3Wi6L2xUiGxnW7kgE15SQJkmn
 jtBtvYkSfDtQ5HBnSx69TVDcAsod7VGQQp3TJwHa/7YRggw9OUr6oHkD3AALfXJTpVMq
 nqrbjJwzR0eE4xCUj93jvaFfkOHtB2hrEk8Uuvw3V3eu9LN4a6M26jZ/LFwXW552P6j8
 CvVM+cBYXD26+H8MKBDo4sTG9DJ8AT0I034KVqfiSAUOifzkNMZYYi3jS6NBK9OmWveu
 e17tqBiOxcYEtbJUUFUU66hxeDHYO4rxrUQb3PEwRceVfOOS74CVbHUfNs2x7nZ/oECU
 NjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039018; x=1732643818;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHpOD3kUgP0NZgNkpxEn7+M6CVhgca5HnhadSgnc1wM=;
 b=foPF7EG9ERCr1NNBXmy0SpoDDON3aLbet7+ZijuWhEx3Kq4N50XRfuM9EnCM3xN1Dp
 1756i4/tm0EXfAmlutZq/i+SyC49SvaHeyvoSrutl69ao5mPyooCenqxmoky1isnzk/y
 RRkrwO03GiwYSA8vCOcz+OPNiWTT2NAxgXWll4T0kHps3p3RLRdOYYI1AHQdPCnXDQlh
 N4y1KM3YWUSuxdcXv/nalkwpI3V8RrOXLfNNqgHKqsULtHv/8kjnwr+Emqmm2UU4IkYN
 g6MRzHKYVIsVBdf/W+wnP5J87mh0d5mTQ2wJQCO9RL+A5MYlxA2PsMlTx1NA7SVZS2+Q
 PcmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXvWZ0apTEvSlrqAN2zn/1tscEW2PLZyBZ8R+zFuv2ySvfvOwRzTqoZcQ4N3DsOrefG7HM6Y7XfR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyglP0B7BxVnKWsfFU1GCn8zorNK9kEePEyPcbk7YqC0Q9VOSJL
 3nupL+SS85fSmk86afAINIH/lMN4vtrBd3yxoHYoco4v8jQOp+feQSlV1/35vJ0=
X-Google-Smtp-Source: AGHT+IFPDNX6KLXFLn/SU6zrsFO0OInhb1Q9wiuJ7LRR3o8jd+59g6Yz543jn9+v12PfjDHzMkSYog==
X-Received: by 2002:a05:600c:3111:b0:431:5c7b:e937 with SMTP id
 5b1f17b1804b1-432df74c8bdmr168114705e9.17.1732039018583; 
 Tue, 19 Nov 2024 09:56:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:46 +0100
Subject: [PATCH v2 11/11] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-11-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2636;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kMBG33vo/TOc40mVibFxMI9MiLmVj3cBO8HFx/GtxHk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFbEK25BwtwTu1JMvsqoiBYwcvGuuHxuWkwKltH
 JiltqguJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWwAKCRB33NvayMhJ0SqJD/
 9i9oT1zcWnuyY+2ojc3JgiG8RZ8/za1lypAPHpIoWVyEqom9FIhYIr5FQhaBl8JzvTyLgD5dWllI46
 xxzzMukeW1ktiB/KPRpfA/qz1LbqwExPkNQVl8ruAMbqBYXAUVPHxmlYxEkD0WuUga+D/CX9Xik71k
 EENR+lA4BtGV7oMNCM1bQ1ov1HNA2p3jmOY7Km2JYzI0lzXkuwskSHjiN1B6wDVtQgdBfU2SJK2gTS
 mxXzExfxB9VsQDtMgcy9ejIRVoidE9NeFJUYAbTflhXprqiPS08t6S6FoVv6lIA/l6cQPprydHYCGL
 Jj7gxQv6t1+boECssBZUnNCqepbKsacMzl+b4KJ8RPrOaE9xJMvVMIwvJWlBhyzSqCVCBVEU3dGnzk
 O/bOXlwFhF4bWgUR+Qu/VTw7QvCQ6JGkY66Mn9mp2Vyx646XSu/L/tCYvP5j70I8k7gg2RlPJKjSWq
 4U0AX/V3yGRATzqzGJMvvWraXnglSRW0OVivH9GCNMsGpbdpz5oUWi3KOyHyE+l2p6anawxBOGxx2J
 ZhkTaJCDFFiNapDGgPEpDSsj+j0KXa3TIR/G5IL3zC7ZFigY3hFKs0q4+cvAg9LCE106xwAem7Qvd1
 UsfFkATgF/Hg9N4PH2GzIJYmYirtoOjIshEu/UTgSZhQiBWYSMcV0yqVUm3g==
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
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa62ffb83c5c51878e2823e1982eb67..331c5140c16bf013190d6da136c0920009d2646b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2636,6 +2636,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2649,56 +2652,67 @@ gpu_opp_table: opp-table {
 				opp-231000000 {
 					opp-hz = /bits/ 64 <231000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
 				};
 
 				opp-310000000 {
 					opp-hz = /bits/ 64 <310000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-366000000 {
 					opp-hz = /bits/ 64 <366000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-422000000 {
 					opp-hz = /bits/ 64 <422000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-578000000 {
 					opp-hz = /bits/ 64 <578000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-629000000 {
 					opp-hz = /bits/ 64 <629000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-770000000 {
 					opp-hz = /bits/ 64 <770000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-834000000 {
 					opp-hz = /bits/ 64 <834000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 			};
 		};

-- 
2.34.1

