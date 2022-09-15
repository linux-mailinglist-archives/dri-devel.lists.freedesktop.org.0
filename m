Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9085B9C13
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C5A10EB33;
	Thu, 15 Sep 2022 13:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC310EB25
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id s6so19209445lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xLl1+HaFAhir63TdFLmycfKdo0fXS2XkIKvjvSbQ1Nk=;
 b=AmI9nkPQfI3fycH00aC6X1ulpYhwMOVMLnz/r8LFqu6Ab64uXa3w/yaVZsy+cpCbYI
 YWyQFG8oQVRISMVi9Y3PAJfkElFX137nJFJ4Ebm51x6cEuYqst8wOy/EHG9xcj9Uyzcd
 ClDMl9zG9+Hqj3eI9DJGH9TYE9pVLI5kRuVGTtPzpM31l9qrqRPfmYDd9QaJlJB8oiQE
 NdjB1am3KyXmy/aSdw/jRNUnFeIUyalMI2jBQ5wWew8tHTed00lQ7wWmPrHtUbSgRl25
 YKKkpF83AO0N4PyvcS56VgHd4IZONriqxFBj8bETqlBCPfsNyBCgiVpDa2kSbk+9ER1v
 cxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xLl1+HaFAhir63TdFLmycfKdo0fXS2XkIKvjvSbQ1Nk=;
 b=sp2k6bg8BNlAyDSOEQWGshtAk0MPtRf1Xm3L9eHh2uChb7W/60oIJxXgQ8bqRMoTS8
 2IQW00AbdsWHt2KcF4F110sbJjdmPoxIVMB5wUOqvKcyuVcMA0y0dg3TPzVoVd/p6m7M
 2XaEQWl5qzuEjxOMi9e0r3qf8QZeOWz1UqaVFWZd8uMJgMhVF+jzoXSYQ2kSIMLwzjZZ
 CYUBkHSASXYVGWbT6k9zn496e1CrudcSvRs2e/FXwOgtDpsvAxoprjpxCq1arL8KoibX
 4fIx5mlrZQ0x+dqjl+jDNHtbQTHnYGzmaVbEnRClA2+i49fG8mFnr10jvBtZThqoEpoR
 lNCA==
X-Gm-Message-State: ACrzQf0jJjrAShKxrGwR6ngVKlcv7iCY6HjdgF9e80nW1kSBfE4bIIjs
 PdL7ASHkJOgbgHT3ybkk3Sp4og==
X-Google-Smtp-Source: AMsMyM6oz/VxhjmWV4vYgowMjGG3fUQlFnl4zdnkNJvB/P2chbWDhsHl+Sr7SN6/kHXsv7AYmTh//A==
X-Received: by 2002:a05:6512:3b09:b0:49f:3fca:2c87 with SMTP id
 f9-20020a0565123b0900b0049f3fca2c87mr656295lfv.603.1663249071317; 
 Thu, 15 Sep 2022 06:37:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 09/12] dt-bindings: display/msm: split dpu-msm8998 into DPU
 and MDSS parts
Date: Thu, 15 Sep 2022 16:37:39 +0300
Message-Id: <20220915133742.115218-10-dmitry.baryshkov@linaro.org>
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

In order to make the schema more readable, split dpu-msm8998 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 150 ------------------
 .../display/msm/qcom,msm8998-dpu.yaml         |  95 +++++++++++
 .../display/msm/qcom,msm8998-mdss.yaml        |  75 +++++++++
 3 files changed, 170 insertions(+), 150 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
deleted file mode 100644
index 67791dbc3b5d..000000000000
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ /dev/null
@@ -1,150 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/dpu-msm8998.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display DPU dt properties for MSM8998 target
-
-maintainers:
-  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
-
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
-
-$ref: /schemas/display/msm/mdss-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: qcom,msm8998-mdss
-
-  clocks:
-    items:
-      - description: Display AHB clock
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
-          - const: qcom,msm8998-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for regdma register set
-          - description: Address offset and size for vbif register set
-          - description: Address offset and size for non-realtime vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: regdma
-          - const: vbif
-          - const: vbif_nrt
-
-      clocks:
-        items:
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display mem-noc clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: mnoc
-          - const: core
-          - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
-    mdss: display-subsystem@c900000 {
-        compatible = "qcom,msm8998-mdss";
-        reg = <0x0c900000 0x1000>;
-        reg-names = "mdss";
-
-        clocks = <&mmcc MDSS_AHB_CLK>,
-                 <&mmcc MDSS_AXI_CLK>,
-                 <&mmcc MDSS_MDP_CLK>;
-        clock-names = "iface", "bus", "core";
-
-        #address-cells = <1>;
-        #interrupt-cells = <1>;
-        #size-cells = <1>;
-
-        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-controller;
-        iommus = <&mmss_smmu 0>;
-
-        power-domains = <&mmcc MDSS_GDSC>;
-        ranges;
-
-        display-controller@c901000 {
-            compatible = "qcom,msm8998-dpu";
-            reg = <0x0c901000 0x8f000>,
-                  <0x0c9a8e00 0xf0>,
-                  <0x0c9b0000 0x2008>,
-                  <0x0c9b8000 0x1040>;
-            reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
-
-            clocks = <&mmcc MDSS_AHB_CLK>,
-                     <&mmcc MDSS_AXI_CLK>,
-                     <&mmcc MNOC_AHB_CLK>,
-                     <&mmcc MDSS_MDP_CLK>,
-                     <&mmcc MDSS_VSYNC_CLK>;
-            clock-names = "iface", "bus", "mnoc", "core", "vsync";
-
-            interrupt-parent = <&mdss>;
-            interrupts = <0>;
-            operating-points-v2 = <&mdp_opp_table>;
-            power-domains = <&rpmpd MSM8998_VDDMX>;
-
-            ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                port@0 {
-                    reg = <0>;
-                    dpu_intf1_out: endpoint {
-                        remote-endpoint = <&dsi0_in>;
-                    };
-                };
-
-                port@1 {
-                    reg = <1>;
-                    dpu_intf2_out: endpoint {
-                        remote-endpoint = <&dsi1_in>;
-                    };
-                };
-            };
-        };
-    };
-...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
new file mode 100644
index 000000000000..b02adba36e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,msm8998-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for MSM8998 target
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,msm8998-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for regdma register set
+      - description: Address offset and size for vbif register set
+      - description: Address offset and size for non-realtime vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: regdma
+      - const: vbif
+      - const: vbif_nrt
+
+  clocks:
+    items:
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display mem-noc clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: mnoc
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@c901000 {
+        compatible = "qcom,msm8998-dpu";
+        reg = <0x0c901000 0x8f000>,
+              <0x0c9a8e00 0xf0>,
+              <0x0c9b0000 0x2008>,
+              <0x0c9b8000 0x1040>;
+        reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
+
+        clocks = <&mmcc MDSS_AHB_CLK>,
+                 <&mmcc MDSS_AXI_CLK>,
+                 <&mmcc MNOC_AHB_CLK>,
+                 <&mmcc MDSS_MDP_CLK>,
+                 <&mmcc MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "mnoc", "core", "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmpd MSM8998_VDDMX>;
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
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
new file mode 100644
index 000000000000..c2550cfb797e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,msm8998-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8998 Display MDSS
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for MSM8998 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,msm8998-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock
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
+    maxItems: 1
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,msm8998-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@c900000 {
+        compatible = "qcom,msm8998-mdss";
+        reg = <0x0c900000 0x1000>;
+        reg-names = "mdss";
+
+        clocks = <&mmcc MDSS_AHB_CLK>,
+                 <&mmcc MDSS_AXI_CLK>,
+                 <&mmcc MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        #address-cells = <1>;
+        #interrupt-cells = <1>;
+        #size-cells = <1>;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        iommus = <&mmss_smmu 0>;
+
+        power-domains = <&mmcc MDSS_GDSC>;
+        ranges;
+    };
+...
-- 
2.35.1

