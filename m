Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF95A946B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19F010E69D;
	Thu,  1 Sep 2022 10:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07B510E699
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:24 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id w8so14664381lft.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VCHByrOYNjoljIXiWmVNhiJmxVzb7hkZVyfcBKahWtw=;
 b=eCgq7zgwyDbpdhR1kNqXytySUjYsC993fmy+jKFS4LcA9cODuhfx3IycEu5h8E4hjo
 Vbf9BQtA1wXXcwBxlnFyx+bL+2YTsLDKbrWLDzb/i42Ii0Tm6Ht/8SLOF/Vr+zSY/nui
 4bQGAHH3tZbPXsl0nVW2hudl7AviLHVYXT/PIIlOWXz9HNeUsgxhjknY1kOrcMQ+hjsa
 +2j6H98AXCC/PcP2QlyIv1wGdTdIOZP7+XsMdfMZur/NeyNTS44v3wGjhNjipC1SdPOl
 7pWo6nxHt7e2v9TRJzbNGB9ypivRlt72xDibeTSb3M2sPe9gFA1tN+S46ZG6N4QAOeWj
 ZRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VCHByrOYNjoljIXiWmVNhiJmxVzb7hkZVyfcBKahWtw=;
 b=1uagWyQsznHuQcljI4B8u0/ip2bqr+VO3r6EekXT24Fuy9qArdLK7r+ZA1cf3HYxZr
 FcdID6LV645mflqh55ggnMuAzGGCkVIhVBnzcESfj/BptEnoBocq8CB5f9ssXub8aQTn
 YGSUc0367fJpkhjWcOE1diZQ+dni34SkX8O4UQZkVagBt3BNtXnwgDCivDVby3t3mQ3m
 EKITRvjQUIwZHDrctzJYON5FHhPBL1NkGq4LqLnavyGxip/GssoyY9hP9pmC8QTJbMt2
 pzSicEsIqvJJ3frVoPrwCs6juyHlrgSFMZCJLbQeC6iIPuxL2AZZJFOcfKDJznxLD83Z
 859A==
X-Gm-Message-State: ACgBeo2qCT1mOkawHS8RZkBB7C2eQ35Fs2qr5hLzrmydTtzcja4yffoi
 e8DNdD/nOMZcMT3zlIThV2AAyw==
X-Google-Smtp-Source: AA6agR4Hbh14NtqRh0CSNCKtpUSe6Ggp3fys63DeUAVmXYuZSRw6MjJnlf4LlxTN/cPVj9iy7/6s4g==
X-Received: by 2002:a05:6512:4017:b0:492:d92c:a156 with SMTP id
 br23-20020a056512401700b00492d92ca156mr11869357lfb.519.1662027804330; 
 Thu, 01 Sep 2022 03:23:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 10/12] dt-bindings: display/msm: split dpu-qcm2290 into DPU
 and MDSS parts
Date: Thu,  1 Sep 2022 13:23:10 +0300
Message-Id: <20220901102312.2005553-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to make the schema more readable, split dpu-qcm2290 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 166 ++++++------------
 .../bindings/display/msm/mdss-qcm2290.yaml    |  86 +++++++++
 2 files changed, 137 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 1c6dd7969a61..93b4318e8fe3 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -9,79 +9,41 @@ title: Qualcomm Display DPU dt properties for QCM2290 target
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
 
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  and DPU are mentioned for QCM2290 target.
+description: Device tree bindings for the QCM2290 DPU display controller.
 
 allOf:
-  - $ref: /schemas/display/msm/mdss-common.yaml#
+  - $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
     items:
-      - const: qcom,qcm2290-mdss
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
 
   clocks:
     items:
-      - description: Display AHB clock from gcc
-      - description: Display AXI clock
-      - description: Display core clock
+      - description: Display AXI clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock from dispcc
+      - description: Display lut clock from dispcc
+      - description: Display vsync clock from dispcc
 
   clock-names:
     items:
-      - const: iface
       - const: bus
+      - const: iface
       - const: core
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
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
-    allOf:
-      - $ref: /schemas/display/msm/dpu-common.yaml#
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
+      - const: lut
+      - const: vsync
 
 unevaluatedProperties: false
 
@@ -89,63 +51,37 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,qcm2290.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
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
+    display-controller@5e01000 {
+            compatible = "qcom,qcm2290-dpu";
+            reg = <0x05e01000 0x8f000>,
+                  <0x05eb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus", "iface", "core", "lut", "vsync";
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmpd QCM2290_VDDCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                            reg = <0>;
+                            dpu_intf1_out: endpoint {
+                                    remote-endpoint = <&dsi0_in>;
+                            };
+                    };
+            };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
new file mode 100644
index 000000000000..7a6c3178f02c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-qcm2290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for QCM2290 target
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
+  are mentioned for QCM2290 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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
+    mdss: mdss@5e00000 {
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

