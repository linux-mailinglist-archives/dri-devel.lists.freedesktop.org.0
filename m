Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E31A3F867
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE8310EA9F;
	Fri, 21 Feb 2025 15:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a7asQx92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DD410EA9B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:05 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5dc191ca8baso450356a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151504; x=1740756304; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cuS5987ZdsbAzrWf4NX4ijDV4g2+JStMbMpBq2iY/b8=;
 b=a7asQx924h8oh9yKnFAN8xLxzkSUfnjw9B8s/ndUsJfQNnw48u3/mw90qRLQwa3mRr
 nqBgTxTJNHDktcpWkpYG5INHJBj3CNa7RGebHkS1/Yn8xn5JNNpHbAB6bLumKRqz1LLy
 ekMMflfE6C9tb5IRy0xvEM4plw42ixCLo5NteCtsQ9F+5TU4BjD5E9KfMzqe7h8YNbb7
 ObAILs6YtIjJyhB1yLL+5tq3ClS0FCeyfxpVicLHOmCzZGKU54NesjSVKhTe/BbJ9tzh
 S49oUsgNgRrQ/J6VxfEfvxoGFBV/8DBdCBOoUFi+SQBMSMj/zPcABOZfKQCXI8o+HWkq
 23+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151504; x=1740756304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuS5987ZdsbAzrWf4NX4ijDV4g2+JStMbMpBq2iY/b8=;
 b=syJWzdBT9u5i0siRYLjPf6ELNxuaa4Ed2D7jvRZHntYl9VZ+Fnd9d8b2MWg7tsPXx2
 BvketPIOgEP1CKLmADPfvhpL2hsgx3DzJwDNvbpBuUNTmX1fAosaUNneOmxPONsuaeMJ
 Jv3QVWV+b6pci6BErF19WrPw/MgiHO1X9DXTM8crHIx+iWvbpbpfEVsjkJwSWylvAKpt
 safd2/0/mkzVt4aiifR52Y07ISylJb1uCX9o40oqhBcJVJmK8Q0bVQ+BNSulEwuvCqOV
 4pGxaG0g/4opLxaP82oW9Kh089LkL5KMpd2qrpumuH8er1TB8UcCeQjfYkkkxEsj8vJG
 R+gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwjoR5Lc1FUrhZ9ETWdvNqqrGajszBY3nXkGxA9sqm/Xyy/eWeoX4ccKSbiCQYURULXxZTQdC/u1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6egc7RuWmXWNIcpljRfZ/k81jQFSyMDURyeYwWWv53M1yUMPO
 hZ8SyO9L080s8f35NNzShyeqZ7x0LejfHyJTf1j078ihQEiHkJbv/e1b8gMRbTY=
X-Gm-Gg: ASbGncs5g+wZ4orZN3Vpkxu9wfHSUmjCVCCgR6P4/JFFC6RDq5yGlTS8KyqwfZBOnSo
 seTZiC7LQs2hZJZSVJO4As6N/M1S6YqNGU23GNrwfZdK4sX3Nmjo5Qp4elL80zvJDFPdPNkmwv4
 Hl1XU1YzlffUCi407cFdam31mxn82KavaPI4B/dchfkoUfQiGL8aRxM7tADBV+Uylac77Qwm8Cy
 G77U+Tvh6D/WAMtRoeOzCP+Q6UX41OF1QsnbpgNBO+uXE2STi9j9Bo/tvrUuXqEnAdFp/yB1VYP
 uyM5UKuTNjBagYYeSPyoGgm1jM6ICpsFEYrj2hW1aosSk/PoRu3Ty+eaC7VxDFthBHoBmXwPwEN
 k
X-Google-Smtp-Source: AGHT+IGA3J3487EIworyl0F5i+16Dhf+9rDnDHHMPYnJyvjtnVv9i8ylcuaxK8N01iWEvvlF/AmJgA==
X-Received: by 2002:a05:6402:50ce:b0:5e0:36c9:7605 with SMTP id
 4fb4d7f45d1cf-5e0b6fdcccemr1184592a12.0.1740151504138; 
 Fri, 21 Feb 2025 07:25:04 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:17 +0100
Subject: [PATCH v3 07/21] dt-bindings: display/msm: qcom,sm8750-mdss: Add
 SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-7-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16823;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wZEy10XWng36e9N/v0rKhcbuOgkJPVqzkbBcz1ZB2jc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqyjzhmEhiddP+0ejEe5XQu/g+OSk5Z7udKa
 p57fcqF4G+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iasgAKCRDBN2bmhouD
 16+2D/9XhT2MuaxqtHctRbhN9Het1YBdrrKX/4Ax4IcBerZSVYjY5GSBCeNyBswO7I1OH8sTG37
 yFTyA41+3tOUdNbf1cua4oYRHxKC8yL63qvlrbKPdUrGaoauJntoVfIkm5nbwB5tqf2M6f7GTRz
 c6M1MRnTMhM5D7Ue8bzR7gJYZ6wHqui2LbrPxrp/dCprkMJ9zIfJBnJH55jiTB3XN1cbyarjPe5
 uoOVMF+rZakO305SCKSK5BK5lPRujMSiwn/cJcScwTLk0x2zL0txYxuDnbiVih3R4usQzyOH6jE
 pjjN96yH6vXa3sb+E56nq52Tjxng8ik8P0jE/ptXN6t9XCYmTIT4g4F2RRwO09y/t+w9m+CJdNl
 yDg9CV+ybGN1Dkj60GhLtkJmnRJHHR1/qgDcIS6mBztT/bV1snpwtlgvKzwk0KukZMQLVn/uBxy
 3MHYTAjPONVYoTgU7U9g9B+008yskF/x7twyvKX0i56rRZBgHo8jIUa/P2UyhnV9joXAO9TUTET
 VcaT75Vg066msUukSNNCuc141lkUsgbIrDE/gyGejtk7DX4BnsFFPNiGLD10KjINdviumCU34Sw
 ESt3oBKX9PZN1WO3N9L7H6Jq/EraBLblbewS5h4yF4IqoTHrOLHdJue0DZTDAPChMy+txQdR9Ql
 FH0GH0ZC1INJgiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
with two revisions up of the IP block comparing to SM8650.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Properly described interconnects
2. Use only one compatible and contains for the sub-blocks (Rob)
---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++++
 1 file changed, 470 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..72c70edc1fb01c61f8aad24fdb58bfb4f62a6e34
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -0,0 +1,470 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 Display MDSS
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8750-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm8750-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8750-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8750-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm8750-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+            compatible = "qcom,sm8750-mdss";
+            reg = <0x0ae00000 0x1000>;
+            reg-names = "mdss";
+
+            interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_mdp_clk>;
+
+            interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "mdp0-mem",
+                                 "cpu-cfg";
+
+            resets = <&disp_cc_mdss_core_bcr>;
+
+            power-domains = <&mdss_gdsc>;
+
+            iommus = <&apps_smmu 0x800 0x2>;
+
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            display-controller@ae01000 {
+                compatible = "qcom,sm8750-dpu";
+                reg = <0x0ae01000 0x93000>,
+                      <0x0aeb0000 0x2008>;
+                reg-names = "mdp",
+                            "vbif";
+
+                interrupts-extended = <&mdss 0>;
+
+                clocks = <&gcc_disp_hf_axi_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&disp_cc_mdss_mdp_lut_clk>,
+                         <&disp_cc_mdss_mdp_clk>,
+                         <&disp_cc_mdss_vsync_clk>;
+                clock-names = "nrt_bus",
+                              "iface",
+                              "lut",
+                              "core",
+                              "vsync";
+
+                assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+                assigned-clock-rates = <19200000>;
+
+                operating-points-v2 = <&mdp_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        dpu_intf1_out: endpoint {
+                            remote-endpoint = <&mdss_dsi0_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        dpu_intf2_out: endpoint {
+                            remote-endpoint = <&mdss_dsi1_in>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        dpu_intf0_out: endpoint {
+                            remote-endpoint = <&mdss_dp0_in>;
+                        };
+                    };
+                };
+
+                mdp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-207000000 {
+                        opp-hz = /bits/ 64 <207000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-337000000 {
+                        opp-hz = /bits/ 64 <337000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-417000000 {
+                        opp-hz = /bits/ 64 <417000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-532000000 {
+                        opp-hz = /bits/ 64 <532000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+
+                    opp-575000000 {
+                        opp-hz = /bits/ 64 <575000000>;
+                        required-opps = <&rpmhpd_opp_nom_l1>;
+                    };
+                };
+            };
+
+            dsi@ae94000 {
+                compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+                reg = <0x0ae94000 0x400>;
+                reg-names = "dsi_ctrl";
+
+                interrupts-extended = <&mdss 4>;
+
+                clocks = <&disp_cc_mdss_byte0_clk>,
+                         <&disp_cc_mdss_byte0_intf_clk>,
+                         <&disp_cc_mdss_pclk0_clk>,
+                         <&disp_cc_mdss_esc0_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&gcc_disp_hf_axi_clk>,
+                         <&mdss_dsi0_phy 1>,
+                         <&mdss_dsi0_phy 0>,
+                         <&disp_cc_esync0_clk>,
+                         <&disp_cc_osc_clk>,
+                         <&disp_cc_mdss_byte0_clk_src>,
+                         <&disp_cc_mdss_pclk0_clk_src>;
+                clock-names = "byte",
+                              "byte_intf",
+                              "pixel",
+                              "core",
+                              "iface",
+                              "bus",
+                              "dsi_pll_pixel",
+                              "dsi_pll_byte",
+                              "esync",
+                              "osc",
+                              "byte_src",
+                              "pixel_src";
+
+                operating-points-v2 = <&mdss_dsi_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&mdss_dsi0_phy>;
+                phy-names = "dsi";
+
+                vdda-supply = <&vreg_l3g_1p2>;
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dsi0_in: endpoint {
+                            remote-endpoint = <&dpu_intf1_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dsi0_out: endpoint {
+                            remote-endpoint = <&panel0_in>;
+                            data-lanes = <0 1 2 3>;
+                        };
+                    };
+                };
+
+                mdss_dsi_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-187500000 {
+                        opp-hz = /bits/ 64 <187500000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-358000000 {
+                        opp-hz = /bits/ 64 <358000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+                };
+            };
+
+            mdss_dsi0_phy: phy@ae95000 {
+                compatible = "qcom,sm8750-dsi-phy-3nm";
+                reg = <0x0ae95000 0x200>,
+                      <0x0ae95200 0x280>,
+                      <0x0ae95500 0x400>;
+                reg-names = "dsi_phy",
+                            "dsi_phy_lane",
+                            "dsi_pll";
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&rpmhcc RPMH_CXO_CLK>;
+                clock-names = "iface",
+                              "ref";
+
+                vdds-supply = <&vreg_l3i_0p88>;
+
+                #clock-cells = <1>;
+                #phy-cells = <0>;
+            };
+
+            dsi@ae96000 {
+                compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+                reg = <0x0ae96000 0x400>;
+                reg-names = "dsi_ctrl";
+
+                interrupts-extended = <&mdss 5>;
+
+                clocks = <&disp_cc_mdss_byte1_clk>,
+                         <&disp_cc_mdss_byte1_intf_clk>,
+                         <&disp_cc_mdss_pclk1_clk>,
+                         <&disp_cc_mdss_esc1_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&gcc_disp_hf_axi_clk>,
+                         <&mdss_dsi1_phy 1>,
+                         <&mdss_dsi1_phy 0>,
+                         <&disp_cc_esync1_clk>,
+                         <&disp_cc_osc_clk>,
+                         <&disp_cc_mdss_byte1_clk_src>,
+                         <&disp_cc_mdss_pclk1_clk_src>;
+                clock-names = "byte",
+                              "byte_intf",
+                              "pixel",
+                              "core",
+                              "iface",
+                              "bus",
+                              "dsi_pll_pixel",
+                              "dsi_pll_byte",
+                              "esync",
+                              "osc",
+                              "byte_src",
+                              "pixel_src";
+
+                operating-points-v2 = <&mdss_dsi_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&mdss_dsi1_phy>;
+                phy-names = "dsi";
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dsi1_in: endpoint {
+                            remote-endpoint = <&dpu_intf2_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dsi1_out: endpoint {
+                        };
+                    };
+                };
+            };
+
+            mdss_dsi1_phy: phy@ae97000 {
+                compatible = "qcom,sm8750-dsi-phy-3nm";
+                reg = <0x0ae97000 0x200>,
+                      <0x0ae97200 0x280>,
+                      <0x0ae97500 0x400>;
+                reg-names = "dsi_phy",
+                            "dsi_phy_lane",
+                            "dsi_pll";
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&rpmhcc RPMH_CXO_CLK>;
+                clock-names = "iface",
+                              "ref";
+
+                #clock-cells = <1>;
+                #phy-cells = <0>;
+            };
+
+            displayport-controller@af54000 {
+                compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
+                reg = <0xaf54000 0x104>,
+                      <0xaf54200 0xc0>,
+                      <0xaf55000 0x770>,
+                      <0xaf56000 0x9c>,
+                      <0xaf57000 0x9c>;
+
+                interrupts-extended = <&mdss 12>;
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&disp_cc_mdss_dptx0_aux_clk>,
+                         <&disp_cc_mdss_dptx0_link_clk>,
+                         <&disp_cc_mdss_dptx0_link_intf_clk>,
+                         <&disp_cc_mdss_dptx0_pixel0_clk>;
+                clock-names = "core_iface",
+                              "core_aux",
+                              "ctrl_link",
+                              "ctrl_link_iface",
+                              "stream_pixel";
+
+                assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
+                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
+                assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+                operating-points-v2 = <&dp_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+                phy-names = "dp";
+
+                #sound-dai-cells = <0>;
+
+                dp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-192000000 {
+                        opp-hz = /bits/ 64 <192000000>;
+                        required-opps = <&rpmhpd_opp_low_svs_d1>;
+                    };
+
+                    opp-270000000 {
+                        opp-hz = /bits/ 64 <270000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-540000000 {
+                        opp-hz = /bits/ 64 <540000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-810000000 {
+                        opp-hz = /bits/ 64 <810000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dp0_in: endpoint {
+                            remote-endpoint = <&dpu_intf0_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dp0_out: endpoint {
+                            remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                        };
+                    };
+                };
+            };
+        };

-- 
2.43.0

