Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734B9403E2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 03:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE7210E1E8;
	Tue, 30 Jul 2024 01:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TheCgzJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F0810E1E1;
 Tue, 30 Jul 2024 01:38:56 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a1d42da3e9so267709485a.1; 
 Mon, 29 Jul 2024 18:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722303535; x=1722908335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcPic30IlsrLE2E2uuJZidSze/wY36p/6jtRB0AARfc=;
 b=TheCgzJqWW5meHfAiR44EDVNZeJ5OCzWmLlKt+aF1+DazFw7bo28Ui/xvJZjBVpkDt
 DRWcGFsaHy/LOvNAxkEDrWP7su/WOeYAAtba7mL2YXYBgqyV1DgnuOroi2dcNmlKbdUL
 VB3AZ4kb/Q0i3g39z7w/K5ndhMeonJ+rhm8iBqXLPx/Pn6a7vSgdisagWpltK5TDjTRT
 q33fuw3aBu/rQGBJ8M0TqvH+rOHOYkhSY2EF4z/ErdU08wPY6tXbG/+9hfsDmbl4VUzI
 ZSRnrLk7QKgysm3K3jemaJAHzwaIzfg0L3vPrJNxsmGAA3r44zfesJh3BEOtcOJ7e4Qj
 Kqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722303535; x=1722908335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcPic30IlsrLE2E2uuJZidSze/wY36p/6jtRB0AARfc=;
 b=qyxGzUw6UtH3Y7gI/BcZWu3iuwEk1u2BU95Tmw549/9fjCVkHT6fqTA8cKhvK0KKIK
 OPKPAm0svzgU3XpY6EIfoHEE9X9/m5vbolYHT28ggMwixA6q+yrcEP/xjpW6b2ihDNY1
 d5XjboCHfTBJGrGRnD+NH0EKH2EJ94EFu9IJagguzXDOl7h2JalgRcAjTtnywNxJ0zSB
 AA/G+utBWZtwqqjn3nomReIgmZ+C+BtdiYHDb8lQ20d8orQwHnylNdm9OJrUkrUcXAGS
 V09clHy+QfvEQTvbZexCaQ69fJVcRDXZ631CJTaalrqd6v9vWFO5oWWIko6pHPq0jWv3
 pUkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8WQvLcK5zd4vwvkAlrlaQ87Vao78gJx1r+EhGZ4gBhjyAjUdkKPBudUpWnnp2qfn3RBSuAUpwax3GbRH2Rpv3QOet8IZl2I4tyKQwu0RcWbPCfA4fn9lPeySEQIzD4h59wJeQbof6jBSvk6/2Jh70
X-Gm-Message-State: AOJu0YyPaw5UXpYe9Q5Ss8iLI6wFCKxLLAkR0DfPckUMc3pt/dwP4AU4
 NDnb/Gqnpijif8kFiquFCZ0/zMHC/Qe+3spBhBrIIle0GVvlMNt7
X-Google-Smtp-Source: AGHT+IFCiFGgyaYg+aZRBFVpktZmuPSn3v58JTMaWyd9thWeo5Q1KPiZ8Awxc3/nQmDtBeNY+wkxgg==
X-Received: by 2002:a05:620a:45a3:b0:7a1:d335:f7a8 with SMTP id
 af79cd13be357-7a1e524a293mr1406329485a.15.1722303535020; 
 Mon, 29 Jul 2024 18:38:55 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1f0fb33c6sm217759285a.104.2024.07.29.18.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 18:38:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/4] arm64: dts: qcom: sdm670: add gpu
Date: Mon, 29 Jul 2024 21:38:48 -0400
Message-ID: <20240730013844.41951-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Snapdragon 670 has the Adreno A615 GPU. Add it along with its device
tree dependencies.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..467006ab2bcb 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+#include <dt-bindings/clock/qcom,gpucc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -617,6 +618,11 @@ qfprom: qfprom@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			gpu_speed_bin: gpu_speed_bin@1a2 {
+				reg = <0x1a2 0x2>;
+				bits = <5 8>;
+			};
+
 			qusb2_hstx_trim: hstx-trim@1eb {
 				reg = <0x1eb 0x1>;
 				bits = <1 4>;
@@ -1299,6 +1305,168 @@ rclk-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-615.0", "qcom,adreno";
+
+			reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x10>;
+			reg-names = "kgsl_3d0_reg_memory", "cx_mem";
+
+			/*
+			 * Look ma, no clocks! The GPU clocks and power are
+			 * controlled entirely by the GMU
+			 */
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D 0 &mem_noc SLAVE_EBI_CH0 0>;
+			interconnect-names = "gfx-mem";
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-780000000 {
+					opp-hz = /bits/ 64 <780000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0x8>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xc>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xc>;
+				};
+
+				opp-565000000 {
+					opp-hz = /bits/ 64 <565000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xe>;
+				};
+
+				opp-430000000 {
+					opp-hz = /bits/ 64 <430000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-355000000 {
+					opp-hz = /bits/ 64 <355000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6220000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-267000000 {
+					opp-hz = /bits/ 64 <267000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <4068000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-180000000 {
+					opp-hz = /bits/ 64 <180000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					opp-peak-kBps = <1804000>;
+					opp-supported-hw = <0xf>;
+				};
+			};
+		};
+
+		adreno_smmu: iommu@5040000 {
+			compatible = "qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
+			reg = <0 0x05040000 0 0x10000>;
+			#iommu-cells = <1>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_CFG_AHB_CLK>;
+			clock-names = "bus", "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-gmu-615.0", "qcom,adreno-gmu";
+
+			reg = <0 0x0506a000 0 0x30000>,
+			      <0 0x0b280000 0 0x10000>,
+			      <0 0x0b480000 0 0x10000>;
+			reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+			clock-names = "gmu", "cxo", "axi", "memnoc";
+
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx", "gx";
+
+			iommus = <&adreno_smmu 5>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			status = "disabled";
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,sdm845-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sdm670-qusb2-phy", "qcom,qusb2-v2-phy";
 			reg = <0 0x088e2000 0 0x400>;
-- 
2.45.2

