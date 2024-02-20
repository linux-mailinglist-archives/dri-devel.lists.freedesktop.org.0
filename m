Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF985BE70
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5DF10E451;
	Tue, 20 Feb 2024 14:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RCkBfRlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539E210E451
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:16:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso727366166b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438573; x=1709043373; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jfhJy8/JRE8DqIVKTngBtKbHnuGXe8GwfAek8ToxJJI=;
 b=RCkBfRlwU574G2R56QRQQ8N3z5v7HlP+a+HTJ23yw3+lazlJraSGX8H+UOxfBYh1Vt
 Kmo/LtEQSE5NOsbZjd0rIcJSCvgJ/xdoLHZrDdPISqA7oRtJ8jLjgQ9bEkbFZHfETq1v
 eOzLPtcJzEMKq+IyFxjAJSLdNjgtpzltKzpoCkXA6DpBFBPbaXpPMk+YBXaTxwta2p2r
 ab9q1D/yycQfXhN2kNHu+2GYNjW2S34klWJ3LsLCtqEtNRfva0Yb3IGT3qIPR5klkcT9
 kANjeWcAWLzg9TRJ+Kqxg9gkj5Ar5rhha51qfF04acxJLGQmdb1OHI5fgRBsxQ9OxOFE
 nwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438573; x=1709043373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfhJy8/JRE8DqIVKTngBtKbHnuGXe8GwfAek8ToxJJI=;
 b=N5t3V9GMmLg8VwvXEH5iZUGNZlcDsKDFoPfH2fU70CiKPLeg6yGHPNYpudpkv7K28g
 KFcVmaJx441UWezEIeYn96n/vRxz/0yPwNxJKtMS/zTh7h7iPhEIbXUhqyS5PDZ+/tfm
 EYdDSWpZRlvnqdfZ15KIot8uS9vteejdJXSCRNPwCy1XnVSncp83Eczf4OX/ObrQ0+/O
 Ssen6YQlbkatvz8HMT1qHSxyMzumZD5BLfUsasDcBN3E9vxdtens5EpkM+RZeECgHL9A
 3B6hOaDedWTS7SLHOpmFm+1hox7IVd3/O1ciXcPLzhDMRNbtd3pc3AYhJSk4CzFZ/El6
 nPHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxppl6FHKf1eP3oEAtewBTOgFN6oXR999Q1XvkZh9iD9Rp5fgA0s1bVELGXC7nzjCoMYRhUsfPuWGqxqfGBDdmkkQZNM8b7+bHHzy0KErz
X-Gm-Message-State: AOJu0YxCZvDSVGrZuu9kyqTWoXGV7QZ7+Yy8xF5YiBGG/r38lK8KlBBJ
 wUHLfD+bnWDV2+NoXBYYVk3+bsBrwKXbnfRok1ZKKvTyFEXlzTR0jNVMK4aE0hM=
X-Google-Smtp-Source: AGHT+IHNHQAIvQ62q+Vmzy6wLV4CB/QAF7qEZFsSaRimH1BMmxt4cKHEcFdPMtjiPdsY8mywdd7QiQ==
X-Received: by 2002:a17:906:abc5:b0:a3f:1941:849 with SMTP id
 kq5-20020a170906abc500b00a3f19410849mr484555ejb.65.1708438573482; 
 Tue, 20 Feb 2024 06:16:13 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a3de4c7bf00sm3998534ejj.79.2024.02.20.06.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:16:13 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 16:15:57 +0200
Subject: [PATCH v4 2/4] dt-bindings: display/msm: Document MDSS on X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-x1e80100-display-v4-2-971afd9de861@linaro.org>
References: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
In-Reply-To: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8158; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=nPlC29ZbxpkdPU+n7s8OVjVEs1W/WVcx0QHigtIG7QE=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1LQlM68IG0MOuny2rWWcT+ddEb3/413+JE7JT
 PNBzefXhW6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdS0JQAKCRAbX0TJAJUV
 VjMcD/4hNl9h6VIwl3H1phYQqBWq0MS9H1ZaT5f5wJ0lcbkkv4lBr5PlwdFGCpmf3nzDkTveYtC
 Qud4PcqJni3R1G3P/lRcyQYIftnqDa6jLJVFMz/qVZ3MrCoF9GUuAAmYwi7P2vd+DWpU3zpOJyS
 3hYpH4Rvqi+mbpI0Pyb3Ik2sWnKTz6E88bIDklRNMUUUVBhz0AZOEjUqw4VnnwaxjwqYkK9ZFXs
 aSW0INvcp9GLg2f0EQg7eZCCTX/BjWRiN2ptaEf/KLNxwRRbOwiemmrD+CycXqEj/dqCvKdI7/v
 FWYPKq9JX/AmhUGNglhJGVDmEjeTuzuhJNe0QF5NwGfloQQGjQI4c1M1Wd5h4zWuHrl0ErHbpoq
 AG8D9OU/H2TLqe1zlhsDIZLOgYdhe//tjTzk7fbv2gq8SxgV5TETRwrrVSySDtHRn6GgiSAPzfH
 JK81jqZ4O2hSpm5jOWkTZd28KjSG6tdqEM6gg0EoyQ43g6WP5pRdQKKVkI7JnyQgYpmQwk2hSv8
 HypfyIMvRnCRILBDwgzuvnCfEY7fNYwTQ5y/jZUI8QeBzTsduCiu7gvYlURGBwC0HiAoxc1Xb9r
 AD1gnQV3rrjHFP+iW2CdNpjAv8Zyv+tfj+b5GpJy4Uurc984UJjAbifdn/LL/ZRo3CXb3pqAwmg
 I1Pa4SqapdW8tkQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Document the MDSS hardware found on the Qualcomm X1E80100 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 251 +++++++++++++++++++++
 1 file changed, 251 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
new file mode 100644
index 000000000000..3b01a0e47333
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -0,0 +1,251 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,x1e80100-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 Display MDSS
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+description:
+  X1E80100 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DP interfaces, etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,x1e80100-mdss
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
+    maxItems: 3
+
+  interconnect-names:
+    maxItems: 3
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,x1e80100-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,x1e80100-dp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,x1e80100-dp-phy
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,x1e80100-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
+                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "mdp1-mem", "cpu-cfg";
+
+        resets = <&dispcc_core_bcr>;
+
+        power-domains = <&dispcc_gdsc>;
+
+        clocks = <&dispcc_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&dispcc_mdp_clk>;
+        clock-names = "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,x1e80100-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc_axi_clk>,
+                     <&dispcc_ahb_clk>,
+                     <&dispcc_mdp_lut_clk>,
+                     <&dispcc_mdp_clk>,
+                     <&dispcc_mdp_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc_mdp_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-325000000 {
+                    opp-hz = /bits/ 64 <325000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-514000000 {
+                    opp-hz = /bits/ 64 <514000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        displayport-controller@ae90000 {
+            compatible = "qcom,x1e80100-dp";
+            reg = <0 0xae90000 0 0x200>,
+                  <0 0xae90200 0 0x200>,
+                  <0 0xae90400 0 0x600>,
+                  <0 0xae91000 0 0x400>,
+                  <0 0xae91400 0 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            clocks = <&dispcc_mdss_ahb_clk>,
+               <&dispcc_dptx0_aux_clk>,
+               <&dispcc_dptx0_link_clk>,
+               <&dispcc_dptx0_link_intf_clk>,
+               <&dispcc_dptx0_pixel0_clk>;
+            clock-names = "core_iface", "core_aux",
+                    "ctrl_link",
+                    "ctrl_link_iface",
+                    "stream_pixel";
+
+            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
+                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
+            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            operating-points-v2 = <&mdss_dp0_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                  reg = <0>;
+
+                  mdss_dp0_in: endpoint {
+                    remote-endpoint = <&mdss_intf0_out>;
+                  };
+              };
+
+              port@1 {
+                  reg = <1>;
+
+                  mdss_dp0_out: endpoint {
+                  };
+              };
+            };
+
+            mdss_dp0_opp_table: opp-table {
+              compatible = "operating-points-v2";
+
+              opp-160000000 {
+                 opp-hz = /bits/ 64 <160000000>;
+                 required-opps = <&rpmhpd_opp_low_svs>;
+              };
+
+              opp-270000000 {
+                 opp-hz = /bits/ 64 <270000000>;
+                 required-opps = <&rpmhpd_opp_svs>;
+              };
+
+              opp-540000000 {
+                 opp-hz = /bits/ 64 <540000000>;
+                 required-opps = <&rpmhpd_opp_svs_l1>;
+              };
+
+              opp-810000000 {
+                 opp-hz = /bits/ 64 <810000000>;
+                 required-opps = <&rpmhpd_opp_nom>;
+              };
+            };
+        };
+    };
+...

-- 
2.34.1

