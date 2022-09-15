Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5C5B9C15
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254C10EB32;
	Thu, 15 Sep 2022 13:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380510EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:53 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u18so30416565lfo.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tIjMPrRqwqPSnP1hh31gNUZhQEljaPdxT4w+WxX3VA8=;
 b=SQfUuosmGzXeyUFqIwC6ANcYguxesblctkFZ6e/MwrIU91U0N2f9NyXP5CvkY8i1l+
 U/RXfX5OPSnzCjcRKGEWcCiM86xqQMWisMS/dic8sivuh22QAnhEIvZ+afbqZGF/D188
 39LbriLsR/6pCijBjQihaMEfz3KP07+ZhlG510jq8NdUGEgt52JMbzzEQMXQlM2YUXNy
 CfJ0eqpoh1N6kVc5lIfVJRhmhbByoAwk088WiL3RkPw8Xn8cIaCdF4ynsH8bFQVwPUtQ
 bHCY6ofNNXXrUB3vHuw/4gVNrfjjGvmzGdamEZeJDGb8dzpDNsjVjKla/EGpeFNYAMW+
 FfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tIjMPrRqwqPSnP1hh31gNUZhQEljaPdxT4w+WxX3VA8=;
 b=SPERg0yfxboqfpc3Bfntpfoudb2OVe8fTp5tFHkLSV8ehlR15GnGpkE+VBfTK0wpTj
 Gv/HgPwGKp7rkolil24qHqXBT+qquGD/uq3BZnTZ9QNXLctpNxcM+NTvvx4OARGbz3Yc
 pdET2CNo0OqL9mfKYP15KMOj1Ce7F1MGK0avU9z82HcvkfL6QfE2oB3r63d46YrXEfXK
 bjqZuVPR0Jo0xXfceDCXlHDC5tCU5Yodkj6ejXTKgNOXjwcAZB945kj83e+zkM0SBgqU
 KyigcvSJ65KKPS2oszHmM6wR5SsjlKLC8B1zmJ0a92o8vz9AMDAFo+wGgQ+OmwR/x5z7
 ZaHQ==
X-Gm-Message-State: ACgBeo03TYNv/QjKCtuDOTKidHAQMnUt5lTZ6xlL1QGTJGEaYM5E2xbi
 RNiBPX7ifyqq1kJ+sdeujs8/Mw==
X-Google-Smtp-Source: AA6agR689jknU3F73dahsT8VHWb56ggL1jWoQT5L/J6oD6KUIKiRs3D0yvIcsbbf57bZQ530cJCa+A==
X-Received: by 2002:ac2:5f58:0:b0:497:9ef1:bfeb with SMTP id
 24-20020ac25f58000000b004979ef1bfebmr12963409lfz.25.1663249072069; 
 Thu, 15 Sep 2022 06:37:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 10/12] dt-bindings: display/msm: split dpu-qcm2290 into DPU
 and MDSS parts
Date: Thu, 15 Sep 2022 16:37:40 +0300
Message-Id: <20220915133742.115218-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to make the schema more readable, split dpu-qcm2290 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 148 ------------------
 .../display/msm/qcom,qcm2290-dpu.yaml         |  84 ++++++++++
 .../display/msm/qcom,qcm2290-mdss.yaml        |  85 ++++++++++
 3 files changed, 169 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
deleted file mode 100644
index 42e676bdda4e..000000000000
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ /dev/null
@@ -1,148 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/dpu-qcm2290.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display DPU dt properties for QCM2290 target
-
-maintainers:
-  - Loic Poulain <loic.poulain@linaro.org>
-
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  and DPU are mentioned for QCM2290 target.
-
-$ref: /schemas/display/msm/mdss-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: qcom,qcm2290-mdss
-
-  clocks:
-    items:
-      - description: Display AHB clock from gcc
-      - description: Display AXI clock
-      - description: Display core clock
-
-  clock-names:
-    items:
-      - const: iface
-      - const: bus
-      - const: core
-
-  iommus:
-    maxItems: 2
-
-  interconnects:
-    maxItems: 1
-
-  interconnect-names:
-    maxItems: 1
-
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    $ref: /schemas/display/msm/dpu-common.yaml#
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
-    properties:
-      compatible:
-        items:
-          - const: qcom,qcm2290-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: vbif
-
-      clocks:
-        items:
-          - description: Display AXI clock from gcc
-          - description: Display AHB clock from dispcc
-          - description: Display core clock from dispcc
-          - description: Display lut clock from dispcc
-          - description: Display vsync clock from dispcc
-
-      clock-names:
-        items:
-          - const: bus
-          - const: iface
-          - const: core
-          - const: lut
-          - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
-    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,qcm2290.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
-    mdss: mdss@5e00000 {
-        #address-cells = <1>;
-        #size-cells = <1>;
-        compatible = "qcom,qcm2290-mdss";
-        reg = <0x05e00000 0x1000>;
-        reg-names = "mdss";
-        power-domains = <&dispcc MDSS_GDSC>;
-        clocks = <&gcc GCC_DISP_AHB_CLK>,
-                 <&gcc GCC_DISP_HF_AXI_CLK>,
-                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-        clock-names = "iface", "bus", "core";
-
-        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-controller;
-        #interrupt-cells = <1>;
-
-        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>;
-        interconnect-names = "mdp0-mem";
-
-        iommus = <&apps_smmu 0x420 0x2>,
-                 <&apps_smmu 0x421 0x0>;
-        ranges;
-
-        mdss_mdp: display-controller@5e01000 {
-                compatible = "qcom,qcm2290-dpu";
-                reg = <0x05e01000 0x8f000>,
-                      <0x05eb0000 0x2008>;
-                reg-names = "mdp", "vbif";
-
-                clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                         <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                         <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                         <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                         <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                clock-names = "bus", "iface", "core", "lut", "vsync";
-
-                operating-points-v2 = <&mdp_opp_table>;
-                power-domains = <&rpmpd QCM2290_VDDCX>;
-
-                interrupt-parent = <&mdss>;
-                interrupts = <0>;
-
-                ports {
-                        #address-cells = <1>;
-                        #size-cells = <0>;
-
-                        port@0 {
-                                reg = <0>;
-                                dpu_intf1_out: endpoint {
-                                        remote-endpoint = <&dsi0_in>;
-                                };
-                        };
-                };
-         };
-    };
-...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
new file mode 100644
index 000000000000..a7b382f01b56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for QCM2290 target
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcm2290-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display AXI clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock from dispcc
+      - description: Display lut clock from dispcc
+      - description: Display vsync clock from dispcc
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: core
+      - const: lut
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@5e01000 {
+        compatible = "qcom,qcm2290-dpu";
+        reg = <0x05e01000 0x8f000>,
+              <0x05eb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus", "iface", "core", "lut", "vsync";
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmpd QCM2290_VDDCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
new file mode 100644
index 000000000000..c821220eef55
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM220 Display MDSS
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
+  are mentioned for QCM2290 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcm2290-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    maxItems: 1
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,qcm2290-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss@5e00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,qcm2290-mdss";
+        reg = <0x05e00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>;
+        interconnect-names = "mdp0-mem";
+
+        iommus = <&apps_smmu 0x420 0x2>,
+                 <&apps_smmu 0x421 0x0>;
+        ranges;
+    };
+...
-- 
2.35.1

