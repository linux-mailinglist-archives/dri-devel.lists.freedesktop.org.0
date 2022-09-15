Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708615B9C11
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744B10EB29;
	Thu, 15 Sep 2022 13:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B611710EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w8so30410252lft.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=fh4hW5+CvMD7KpET/WPe9Yso1gB72kVaWKmR9yJAzrI=;
 b=jc4HA4BnbkrkdERbbCv85zJn7YwgWjmDDMJwjaICsj84UJ+P/AoXdkgmJa6QdapO0p
 p/5a8MAHsLl47kdH1emU6SMQnBHaCMWz2/BqSW3+5kqoBdcZtOKBaHkRTcdS9r9POi0y
 /oHcJzhyrky0mEstn5yRtKbsKiGv8yHOhYBytOQFrUCtdJvZ3eegnHuDxZuRtk0KIOlY
 ed/YnfpJYn3vyUrEB5ZniWOJyCiSePAHfvEGPFz9/Y4Saq9r6/6rNlUPjMWP3sgMYsXt
 nS4lrwUIa1CTiX1AvqJ15cC3epikPxmTJr7ip0h1MvTgbFRI69b1HAyhKr5Sv7n0mnIu
 WY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fh4hW5+CvMD7KpET/WPe9Yso1gB72kVaWKmR9yJAzrI=;
 b=Lj1Ym5cQJ3tjZZTjII6XJK9L6eT0OBNHj1M0YONAP2DbEg+IjZpL4+fdWD3ChRq9wj
 A2QI80ymRLIQp1FYY/VGea1BDnN0AuWG6BPQtZKzLIP4xXCWGKI+dyPBgdk4hIcu7SI3
 TicBiRiyvHuFEqAb7oD+DwOYbZPJqDSyCi/lMKQayxvhqp6dujxlX+gSi3VNqPoUnmJm
 a/YmfNgqrqMIS+rFUAfjGD+SRUUzBa4/ilP0BuJ6UVRAQ+S9MIpLldlfzlBZS0AZXnh2
 0xEPpD/y5jDP5rqbtqpdhrZR1gr9Ew0MFz1imal/MzPxOVx8aFyzS/rtnxTgwQ3rzPYw
 0GmA==
X-Gm-Message-State: ACgBeo1+ITGoW5uC7UVH3yx81L64ayPQzV9rJD3KeUsd9xG36fwZPJs2
 GdkW3Bln1ZJJhVYrnMu5bNJ//w==
X-Google-Smtp-Source: AA6agR54ebeyUT+/RR1wmvIGXuNRRK9T1o5x00aZ/LMq5MaKTt1t1pnsKeXiiCYzaEfb9g0K8otsDA==
X-Received: by 2002:a05:6512:b1c:b0:492:8835:1e4c with SMTP id
 w28-20020a0565120b1c00b0049288351e4cmr12777185lfu.442.1663249070205; 
 Thu, 15 Sep 2022 06:37:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 08/12] dt-bindings: display/msm: split dpu-sdm845 into DPU
 and MDSS parts
Date: Thu, 15 Sep 2022 16:37:38 +0300
Message-Id: <20220915133742.115218-9-dmitry.baryshkov@linaro.org>
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

In order to make the schema more readable, split dpu-sdm845 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sdm845.yaml      | 148 ------------------
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 +++++++++++
 .../display/msm/qcom,sdm845-mdss.yaml         |  79 ++++++++++
 3 files changed, 169 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
deleted file mode 100644
index ae649bb6aa81..000000000000
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ /dev/null
@@ -1,148 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display DPU dt properties for SDM845 target
-
-maintainers:
-  - Krishna Manikandan <quic_mkrishn@quicinc.com>
-
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SDM845 target.
-
-$ref: /schemas/display/msm/mdss-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: qcom,sdm845-mdss
-
-  clocks:
-    items:
-      - description: Display AHB clock from gcc
-      - description: Display core clock
-
-  clock-names:
-    items:
-      - const: iface
-      - const: core
-
-  iommus:
-    maxItems: 2
-
-  interconnects:
-    maxItems: 2
-
-  interconnect-names:
-    maxItems: 2
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
-          - const: qcom,sdm845-dpu
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
-          - description: Display GCC bus clock
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: gcc-bus
-          - const: iface
-          - const: bus
-          - const: core
-          - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
-    display-subsystem@ae00000 {
-          #address-cells = <1>;
-          #size-cells = <1>;
-          compatible = "qcom,sdm845-mdss";
-          reg = <0x0ae00000 0x1000>;
-          reg-names = "mdss";
-          power-domains = <&dispcc MDSS_GDSC>;
-
-          clocks = <&gcc GCC_DISP_AHB_CLK>,
-                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
-          clock-names = "iface", "core";
-
-          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-          interrupt-controller;
-          #interrupt-cells = <1>;
-
-          iommus = <&apps_smmu 0x880 0x8>,
-                   <&apps_smmu 0xc80 0x8>;
-          ranges;
-
-          display-controller@ae01000 {
-                    compatible = "qcom,sdm845-dpu";
-                    reg = <0x0ae01000 0x8f000>,
-                          <0x0aeb0000 0x2008>;
-                    reg-names = "mdp", "vbif";
-
-                    clocks = <&gcc GCC_DISP_AXI_CLK>,
-                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
-                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
-
-                    interrupt-parent = <&mdss>;
-                    interrupts = <0>;
-                    power-domains = <&rpmhpd SDM845_CX>;
-                    operating-points-v2 = <&mdp_opp_table>;
-
-                    ports {
-                           #address-cells = <1>;
-                           #size-cells = <0>;
-
-                           port@0 {
-                                   reg = <0>;
-                                   dpu_intf1_out: endpoint {
-                                                  remote-endpoint = <&dsi0_in>;
-                                   };
-                           };
-
-                           port@1 {
-                                   reg = <1>;
-                                   dpu_intf2_out: endpoint {
-                                                  remote-endpoint = <&dsi1_in>;
-                                   };
-                           };
-                    };
-          };
-    };
-...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
new file mode 100644
index 000000000000..5719b45f2860
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sdm845-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SDM845 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-dpu
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
+      - description: Display GCC bus clock
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: gcc-bus
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sdm845-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        power-domains = <&rpmhpd SDM845_CX>;
+        operating-points-v2 = <&mdp_opp_table>;
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
new file mode 100644
index 000000000000..b16622f0d41e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sdm845-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM845 Display MDSS
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SDM845 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-mdss
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
+    properties:
+      compatible:
+        const: qcom,sdm845-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,sdm845-mdss";
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
+        ranges;
+    };
+...
-- 
2.35.1

