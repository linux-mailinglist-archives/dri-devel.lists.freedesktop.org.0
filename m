Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E15A9470
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAF310E6A8;
	Thu,  1 Sep 2022 10:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159FE10E699
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g7so6774241lfe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9D4WLFfe/01foePAxbv2UpOqyUHDT522ukkHqFhUDEw=;
 b=ARlFa2T0sisahfs/afItydXLJVr+jEDW4ak7LqWotATy/CLmB3kH+VpffjS8WjGEa2
 gXCdjWWrUyAY5NuYJ1KxfdcyO5mmZdwE5GUm3GvPQqjrhJ6VWPKNOASvKlFxIHHdkPJx
 N+RaiC+MuhIu+pnLNiIJ9BTenSAtf3SgT1kNmo8oOODXpFEH+HzMVaslZMUiwURtWb6m
 a6KkPwHBKooO6HPzrfm47JAXozgOm7GeahGTLKbPZTqO+1pAP06WGozkrDpL96d6cgp6
 TsQfLaOy56/sQOd9l20afR8y4H/XGJ8jqTD7Da1fZznFd6f3hBU9Ml/ZZ/5sVGgabY1W
 dIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9D4WLFfe/01foePAxbv2UpOqyUHDT522ukkHqFhUDEw=;
 b=JPSEnDmapJzfasM7a2dMh6AvBx4X6jrMnV6i2Axsh6eBCkpmiQ7SSctTFohMQNIGJ6
 qNlelUiWwhM3eUm+BV+PlxnhBuxT2oPMvBPMzHtQyj3k+25D9x/uXMXLJKcFwMc8YBwB
 CmOW40icwHjQJ8fM2VIws5m3Jtr4rIX4OoMxHIopgvTfQfCS20hsayssqN4d+KUql5AX
 itIL3ozSGpZBjml6FpiQyJWVb1IUmgaBChWEQvhNrhIzOLNNd2rUcfWI/pxJlAXN0aOq
 1YoPvd+Y3KGpDJhiTP2dNI7+XQ7P9ebTEEP9+8MupPpftY1ISrQ7CWIi85Y81PFTsTWP
 D2ag==
X-Gm-Message-State: ACgBeo08+8FRA79jTUB2gGl0msDFBmgi6a3thjPwfSZD9CDwfsJPGI6r
 wNyq7LPVeJXz84aipzCvxK0HvQ==
X-Google-Smtp-Source: AA6agR5CvUOL29LZ2QVK2O7Cm68UzJKdIKV1oX/dJeax0yc5mxoiieLb7z7FEzbsxKO95A2CFiQYUA==
X-Received: by 2002:a05:6512:2614:b0:492:befa:cace with SMTP id
 bt20-20020a056512261400b00492befacacemr9960607lfb.444.1662027801062; 
 Thu, 01 Sep 2022 03:23:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 07/12] dt-bindings: display/msm: split dpu-sc7280 into DPU
 and MDSS parts
Date: Thu,  1 Sep 2022 13:23:07 +0300
Message-Id: <20220901102312.2005553-8-dmitry.baryshkov@linaro.org>
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

In order to make the schema more readable, split dpu-sc7280 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7280.yaml      | 194 ++++++------------
 .../bindings/display/msm/mdss-sc7280.yaml     |  86 ++++++++
 2 files changed, 151 insertions(+), 129 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 7dc624a26e2e..ba15f1ade556 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -9,79 +9,42 @@ title: Qualcomm Display DPU dt properties for SC7280
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7280.
+description: Device tree bindings for the SC7280 DPU display controller.
 
 allOf:
-  - $ref: /schemas/display/msm/mdss-common.yaml#
+  - $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sc7280-mdss
+    const: qcom,sc7280-dpu
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
-      - description: Display AHB clock from dispcc
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: bus
+      - const: nrt_bus
       - const: iface
-      - const: ahb
+      - const: lut
       - const: core
-
-  iommus:
-    maxItems: 1
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
-        const: qcom,sc7280-dpu
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
-          - description: Display hf axi clock
-          - description: Display sf axi clock
-          - description: Display ahb clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: nrt_bus
-          - const: iface
-          - const: lut
-          - const: core
-          - const: vsync
+      - const: vsync
 
 unevaluatedProperties: false
 
@@ -89,77 +52,50 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
     #include <dt-bindings/clock/qcom,gcc-sc7280.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sc7280.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    display-subsystem@ae00000 {
-         #address-cells = <1>;
-         #size-cells = <1>;
-         compatible = "qcom,sc7280-mdss";
-         reg = <0xae00000 0x1000>;
-         reg-names = "mdss";
-         power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
-         clocks = <&gcc GCC_DISP_AHB_CLK>,
-                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
-         clock-names = "iface",
-                       "ahb",
-                       "core";
-
-         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-         interrupt-controller;
-         #interrupt-cells = <1>;
-
-         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
-         interconnect-names = "mdp0-mem";
-
-         iommus = <&apps_smmu 0x900 0x402>;
-         ranges;
-
-         display-controller@ae01000 {
-                   compatible = "qcom,sc7280-dpu";
-                   reg = <0x0ae01000 0x8f000>,
-                         <0x0aeb0000 0x2008>;
-
-                   reg-names = "mdp", "vbif";
-
-                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                            <&gcc GCC_DISP_SF_AXI_CLK>,
-                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                   clock-names = "bus",
-                                 "nrt_bus",
-                                 "iface",
-                                 "lut",
-                                 "core",
-                                 "vsync";
-
-                   interrupt-parent = <&mdss>;
-                   interrupts = <0>;
-                   power-domains = <&rpmhpd SC7280_CX>;
-                   operating-points-v2 = <&mdp_opp_table>;
-
-                   ports {
-                           #address-cells = <1>;
-                           #size-cells = <0>;
-
-                           port@0 {
-                                   reg = <0>;
-                                   dpu_intf1_out: endpoint {
-                                           remote-endpoint = <&dsi0_in>;
-                                   };
-                           };
-
-                           port@1 {
-                                   reg = <1>;
-                                   dpu_intf5_out: endpoint {
-                                           remote-endpoint = <&edp_in>;
-                                   };
-                           };
-                   };
-         };
+    display-controller@ae01000 {
+               compatible = "qcom,sc7280-dpu";
+               reg = <0x0ae01000 0x8f000>,
+                     <0x0aeb0000 0x2008>;
+
+               reg-names = "mdp", "vbif";
+
+               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                        <&gcc GCC_DISP_SF_AXI_CLK>,
+                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+               clock-names = "bus",
+                             "nrt_bus",
+                             "iface",
+                             "lut",
+                             "core",
+                             "vsync";
+
+               interrupt-parent = <&mdss>;
+               interrupts = <0>;
+               power-domains = <&rpmhpd SC7280_CX>;
+               operating-points-v2 = <&mdp_opp_table>;
+
+               ports {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+
+                       port@0 {
+                               reg = <0>;
+                               dpu_intf1_out: endpoint {
+                                       remote-endpoint = <&dsi0_in>;
+                               };
+                       };
+
+                       port@1 {
+                               reg = <1>;
+                               dpu_intf5_out: endpoint {
+                                       remote-endpoint = <&edp_in>;
+                               };
+                       };
+               };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
new file mode 100644
index 000000000000..db843412abf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-sc7280.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for SC7280
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SC7280.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc7280-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+  iommus:
+    maxItems: 1
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
+        const: qcom,sc7280-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc7280.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+         #address-cells = <1>;
+         #size-cells = <1>;
+         compatible = "qcom,sc7280-mdss";
+         reg = <0xae00000 0x1000>;
+         reg-names = "mdss";
+         power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+         clocks = <&gcc GCC_DISP_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
+         clock-names = "iface",
+                       "ahb",
+                       "core";
+
+         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+         interrupt-controller;
+         #interrupt-cells = <1>;
+
+         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+         interconnect-names = "mdp0-mem";
+
+         iommus = <&apps_smmu 0x900 0x402>;
+         ranges;
+    };
+...
-- 
2.35.1

