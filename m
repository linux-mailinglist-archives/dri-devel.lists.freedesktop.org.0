Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC37B5E9C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A0410E1DA;
	Tue,  3 Oct 2023 01:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D864710E1DA;
 Tue,  3 Oct 2023 01:21:45 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-65d0da28fa8so2662136d6.0; 
 Mon, 02 Oct 2023 18:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696296105; x=1696900905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYPQkOj9N90I163PTiwiPD4i/SKazhYmIWTB8SLLlI8=;
 b=UTi9gIlO8BnxCZSm+vDHRxyv0+mjSe/MBA1AHpaPPuRtSJacxApa26xsNNx9lSkIWv
 Lqwouck/L+wwQsiClcLOt7/3pXQBNKPTltmXuEdjtfZZ9WwvK2gJZbGYrNCjQ7GaMQs4
 ItIg4MZ9F1SeQAyNTcc++ZN6HYXKoQN9JE2HDX4YlGpI0JPyf1Zhlk2LVOX4kFtQThyN
 pStUANZxl70Po1Ty1IHQVOlaHQKDcEkmlKnc+bNQ7jG8gaYuY0JQaUpM6mTN3vsjCt7u
 2a+TqkZtzi0PxzoIKMOkq/5upT0LEGXh18qSux7NF1eehqOdVCu7lDfvZcuVgOF7boG1
 fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696296105; x=1696900905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYPQkOj9N90I163PTiwiPD4i/SKazhYmIWTB8SLLlI8=;
 b=qqI1I3hQNZEH51at3Ewn89RgbE4+qMWRXeGevDqRsfiSuvnlAd5UN1Y2miJzHPUHFp
 XV3HMC+4iLLkqahTwOgETGmGlJYRXV/ojJxBkHSsqf0qLPba7QNLGAd1NNGqvZ9fYLTS
 Z2d6MM8IPGl8GpeQPwLcXWJ0YHXwKOk9HTy40c0cHsBo/YvQwKU6AhL7WHdOa81puuX0
 vgejgQMrtbnmCrEkdzw/wHVziVMnYIk17z5yCmaSro6qM7MOgGkNxA9hmJE/lefaXWO0
 XQibIInxpuagGr5E9p/4c0JNspf+A5Nz4CWl5iAIY9FHNiapZ40VEoxYr98Ag9D/ykKP
 P0ig==
X-Gm-Message-State: AOJu0YyS820Md8TQ4gQGKbMkGfffaSo0IXrarZjgNSpJw94StANHn6Un
 RhkggdvqfXFxMQKfCWH0GKKpZO5y78c=
X-Google-Smtp-Source: AGHT+IH+Py3z98vPvDA5w7BK6tCkMRxOqHw+Zd0ZgfgkqocEE3iw0DNePjwt7lznmTN66i9LbaZIbg==
X-Received: by 2002:a0c:e44f:0:b0:64f:9470:1306 with SMTP id
 d15-20020a0ce44f000000b0064f94701306mr12359276qvm.44.1696296104836; 
 Mon, 02 Oct 2023 18:21:44 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 q21-20020ae9e415000000b0075ca4cd03d4sm49753qkc.64.2023.10.02.18.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 18:21:44 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: display: msm: Add SDM670 MDSS
Date: Mon,  2 Oct 2023 21:21:24 -0400
Message-ID: <20231003012119.857198-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the SDM670 display subsystem, adapted from the
SDM845 and SM6125 documentation.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../display/msm/qcom,sdm670-mdss.yaml         | 287 ++++++++++++++++++
 1 file changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
new file mode 100644
index 000000000000..9995b018cd9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
@@ -0,0 +1,287 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sdm670-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 Display MDSS
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  SDM670 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sdm670-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,sdm670-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,sdm670-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: qcom,sdm670-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sdm670-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x880 0x8>,
+                 <&apps_smmu 0xc80 0x8>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sdm670-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            power-domains = <&rpmhpd SDM670_CX>;
+            operating-points-v2 = <&mdp_opp_table>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sdm670-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SDM670_CX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,dsi-phy-10nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94a00 0x1e0>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sdm670-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SDM670_CX>;
+
+            phys = <&dsi1_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dsi1_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        mdss_dsi1_phy: phy@ae96400 {
+            compatible = "qcom,dsi-phy-10nm";
+            reg = <0x0ae96400 0x200>,
+                  <0x0ae96600 0x280>,
+                  <0x0ae96a00 0x10e>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+    };
+...
-- 
2.42.0

