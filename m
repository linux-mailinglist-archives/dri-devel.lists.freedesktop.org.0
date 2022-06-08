Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295C542FBD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4E10FAE0;
	Wed,  8 Jun 2022 12:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03FF10FAE0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h23so32897418lfe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VePBzYxQZCMYmePlwL3wtl0+0lRocvRBaNXocWAt7M4=;
 b=Ihtmv3hVfP8GlQ2ZrJSp5zl353vJCWBqL1/l/4ND1iPexqM6TZN8CHdn0PLPDkZ6Y5
 PpJ0xj6EPXULKS1+y82qB+sVgA8XmiGOGzxiIo17eBnnFmCIP0gNlGzcQA/HROlnsEAu
 kREMad9Hct2zAIW4uDxvSLOJ3hz/TNQUIU+z26NlaI3rAcIwqJQKjUAm5JUSUzDnRbUg
 rS96RWLgSRAYYuJLtKXq1vIReiv8A+cRcLisSWlbJsFgC59xE1DZQ/nRfCMa2IF2e1UE
 uUAmzhLODSrsD+YByd3/M5xAzYsDtDIjOCtBdUu6FcbKc387A8infuIrr46BHNSVJ8Ov
 eBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VePBzYxQZCMYmePlwL3wtl0+0lRocvRBaNXocWAt7M4=;
 b=V13XNsFGj/itfT+7ZdLKZsYaQpKRKMP0GCY77/EMlKjTwfdfl5Gm+u7r+bOBLD21KU
 8BVZZbhbx5d1We3POJqSiJ28V21rsa6Oxwx0AvuSrV7YKFgNYZSLRYEq/IoQ6tqYsyHe
 eLhJCBIy1tCf5kyBryaJj0KHA+BAlD7LqKph0ozzm87dGDGMocAmK5x4S61klbjfvLGH
 V5KjEqUKrAjI645Qy+vb7dqzCvySsFzKjqY3YkOVakZE2oZIAyuQLmFiXmbVoX/gIiC3
 gEkhh8vDF5aGqZyo3fjsX0kfpS+4gQKAQPuFIvapxDWOhNehkv+bBwLqKnhMuEUjZt6c
 CTCQ==
X-Gm-Message-State: AOAM533llhl4ro7MSaj2smmoObtlHwMvHcyDYhwa+huAeAlDbQ3Y4brp
 0WwnjXnFFj+3EaQyZ82I3pXr6w==
X-Google-Smtp-Source: ABdhPJynsH9N/Lo36AZTRYTbNatxhuHKEw2yG+X4/bzegyagfUFhMjpfdgQ63ZCEXTGcBKnpbe5hhA==
X-Received: by 2002:a05:6512:ac9:b0:479:5b66:e9e9 with SMTP id
 n9-20020a0565120ac900b004795b66e9e9mr6684404lfu.581.1654690046115; 
 Wed, 08 Jun 2022 05:07:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 01/12] dt-bindings: display/msm: hdmi: split and convert to
 yaml
Date: Wed,  8 Jun 2022 15:07:12 +0300
Message-Id: <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.

Changes to schema:
HDMI:
 - fixed reg-names numbering to match 0..3 instead 0,1,3,4
 - dropped qcom,tx-ddc-* from example, they were not documented

PHY:
 - moved into phy/ directory
 - split into QMP and non-QMP PHY schemas

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../devicetree/bindings/display/msm/hdmi.yaml | 230 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  83 +++++++
 4 files changed, 416 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
deleted file mode 100644
index 5f90a40da51b..000000000000
--- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-Qualcomm adreno/snapdragon hdmi output
-
-Required properties:
-- compatible: one of the following
-   * "qcom,hdmi-tx-8996"
-   * "qcom,hdmi-tx-8994"
-   * "qcom,hdmi-tx-8084"
-   * "qcom,hdmi-tx-8974"
-   * "qcom,hdmi-tx-8660"
-   * "qcom,hdmi-tx-8960"
-- reg: Physical base address and length of the controller's registers
-- reg-names: "core_physical"
-- interrupts: The interrupt signal from the hdmi block.
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See ../clocks/clock-bindings.txt for details.
-- core-vdda-supply: phandle to supply regulator
-- hdmi-mux-supply: phandle to mux regulator
-- phys: the phandle for the HDMI PHY device
-- phy-names: the name of the corresponding PHY device
-
-Optional properties:
-- hpd-gpios: hpd pin
-- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
-- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
-- qcom,hdmi-tx-mux-lpm-gpios: hdmi mux lpm pin
-- power-domains: reference to the power domain(s), if available.
-- pinctrl-names: the pin control state names; should contain "default"
-- pinctrl-0: the default pinctrl state (active)
-- pinctrl-1: the "sleep" pinctrl state
-
-HDMI PHY:
-Required properties:
-- compatible: Could be the following
-  * "qcom,hdmi-phy-8660"
-  * "qcom,hdmi-phy-8960"
-  * "qcom,hdmi-phy-8974"
-  * "qcom,hdmi-phy-8084"
-  * "qcom,hdmi-phy-8996"
-- #phy-cells: Number of cells in a PHY specifier; Should be 0.
-- reg: Physical base address and length of the registers of the PHY sub blocks.
-- reg-names: The names of register regions. The following regions are required:
-  * "hdmi_phy"
-  * "hdmi_pll"
-  For HDMI PHY on msm8996, these additional register regions are required:
-    * "hdmi_tx_l0"
-    * "hdmi_tx_l1"
-    * "hdmi_tx_l3"
-    * "hdmi_tx_l4"
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- core-vdda-supply: phandle to vdda regulator device node
-
-Example:
-
-/ {
-	...
-
-	hdmi: hdmi@4a00000 {
-		compatible = "qcom,hdmi-tx-8960";
-		reg-names = "core_physical";
-		reg = <0x04a00000 0x2f0>;
-		interrupts = <GIC_SPI 79 0>;
-		power-domains = <&mmcc MDSS_GDSC>;
-		clock-names =
-		    "core",
-		    "master_iface",
-		    "slave_iface";
-		clocks =
-		    <&mmcc HDMI_APP_CLK>,
-		    <&mmcc HDMI_M_AHB_CLK>,
-		    <&mmcc HDMI_S_AHB_CLK>;
-		qcom,hdmi-tx-ddc-clk = <&msmgpio 70 GPIO_ACTIVE_HIGH>;
-		qcom,hdmi-tx-ddc-data = <&msmgpio 71 GPIO_ACTIVE_HIGH>;
-		qcom,hdmi-tx-hpd = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
-		core-vdda-supply = <&pm8921_hdmi_mvs>;
-		hdmi-mux-supply = <&ext_3p3v>;
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
-		pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
-
-		phys = <&hdmi_phy>;
-		phy-names = "hdmi_phy";
-	};
-
-	hdmi_phy: phy@4a00400 {
-		compatible = "qcom,hdmi-phy-8960";
-		reg-names = "hdmi_phy",
-			    "hdmi_pll";
-		reg = <0x4a00400 0x60>,
-		      <0x4a00500 0x100>;
-		#phy-cells = <0>;
-		power-domains = <&mmcc MDSS_GDSC>;
-		clock-names = "slave_iface";
-		clocks = <&mmcc HDMI_S_AHB_CLK>;
-		core-vdda-supply = <&pm8921_hdmi_mvs>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
new file mode 100644
index 000000000000..ef425c649ead
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -0,0 +1,230 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/display/msm/hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno/Snapdragon HDMI output
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,hdmi-tx-8084
+      - qcom,hdmi-tx-8660
+      - qcom,hdmi-tx-8960
+      - qcom,hdmi-tx-8974
+      - qcom,hdmi-tx-8994
+      - qcom,hdmi-tx-8996
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: core_physical
+      - const: qfprom_physical
+      - const: hdcp_physical
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    enum:
+      - hdmi_phy
+      - hdmi-phy
+
+  core-vdda-supply:
+    description: phandle to VDDA supply regulator
+
+  hdmi-mux-supply:
+    description: phandle to mux regulator
+
+  core-vcc-supply:
+    description: phandle to VCC supply regulator
+
+  hpd-gpios:
+    maxItems: 1
+    description: hpd pin
+
+  qcom,hdmi-tx-mux-en-gpios:
+    maxItems: 1
+    description: HDMI mux enable pin
+
+  qcom,hdmi-tx-mux-sel-gpios:
+    maxItems: 1
+    description: HDMI mux select pin
+
+  qcom,hdmi-tx-mux-lpm-gpios:
+    maxItems: 1
+    description: HDMI mux lpm pin
+
+  '#sound-dai-cells':
+    const: 1
+
+  ports:
+    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: |
+          Input endpoints of the controller.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: |
+          Output endpoints of the controller.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - reg-names
+  - interrupts
+  - phys
+  - phy-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8960
+              - qcom,hdmi-tx-8660
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+            - const: master_iface
+            - const: slave_iface
+        core-vcc-supplies: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8974
+              - qcom,hdmi-tx-8084
+              - qcom,hdmi-tx-8994
+              - qcom,hdmi-tx-8996
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: core
+            - const: alt_iface
+            - const: extp
+        hdmi-mux-supplies: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    hdmi: hdmi@4a00000 {
+      compatible = "qcom,hdmi-tx-8960";
+      reg-names = "core_physical";
+      reg = <0x04a00000 0x2f0>;
+      interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+      clock-names = "core",
+                    "master_iface",
+                    "slave_iface";
+      clocks = <&clk 61>,
+               <&clk 72>,
+               <&clk 98>;
+      hpd-gpios = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
+      core-vdda-supply = <&pm8921_hdmi_mvs>;
+      hdmi-mux-supply = <&ext_3p3v>;
+      pinctrl-names = "default", "sleep";
+      pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
+      pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
+
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi_phy";
+    };
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    hdmi@9a0000 {
+      compatible = "qcom,hdmi-tx-8996";
+      reg = <0x009a0000 0x50c>,
+            <0x00070000 0x6158>,
+            <0x009e0000 0xfff>;
+      reg-names = "core_physical",
+                  "qfprom_physical",
+                  "hdcp_physical";
+
+      interrupt-parent = <&mdss>;
+      interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&mmcc MDSS_MDP_CLK>,
+               <&mmcc MDSS_AHB_CLK>,
+               <&mmcc MDSS_HDMI_CLK>,
+               <&mmcc MDSS_HDMI_AHB_CLK>,
+               <&mmcc MDSS_EXTPCLK_CLK>;
+      clock-names = "mdp_core",
+                    "iface",
+                    "core",
+                    "alt_iface",
+                    "extp";
+
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi_phy";
+      #sound-dai-cells = <1>;
+
+      pinctrl-names = "default", "sleep";
+      pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+      pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
+
+      core-vdda-supply = <&vreg_l12a_1p8>;
+      core-vcc-supply = <&vreg_s4a_1p8>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          endpoint {
+            remote-endpoint = <&mdp5_intf3_out>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
new file mode 100644
index 000000000000..3a6128d8f6fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-other.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno/Snapdragon HDMI phy
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,hdmi-phy-8660
+      - qcom,hdmi-phy-8960
+      - qcom,hdmi-phy-8974
+      - qcom,hdmi-phy-8084
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: hdmi_phy
+      - const: hdmi_pll
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  core-vdda-supply:
+    description: phandle to VDDA supply regulator
+  vddio-supply:
+    description: phandle to VDD I/O supply regulator
+
+  '#phy-cells':
+    const: 0
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8660
+              - qcom,hdmi-phy-8960
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: slave_iface
+        vddio-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8084
+              - qcom,hdmi-phy-8974
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: iface
+            - const: alt_iface
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reg-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi_phy: phy@4a00400 {
+      compatible = "qcom,hdmi-phy-8960";
+      reg-names = "hdmi_phy",
+                  "hdmi_pll";
+      reg = <0x4a00400 0x60>,
+            <0x4a00500 0x100>;
+      #phy-cells = <0>;
+      power-domains = <&mmcc 1>;
+      clock-names = "slave_iface";
+      clocks = <&clk 21>;
+      core-vdda-supply = <&pm8921_hdmi_mvs>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
new file mode 100644
index 000000000000..3784e11bf2ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno/Snapdragon QMP HDMI phy
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,hdmi-phy-8996
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: hdmi_pll
+      - const: hdmi_tx_l0
+      - const: hdmi_tx_l1
+      - const: hdmi_tx_l2
+      - const: hdmi_tx_l3
+      - const: hdmi_phy
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  power-domains:
+    maxItems: 1
+
+  vcca-supply: true
+
+  vddio-supply: true
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - reg-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi-phy@9a0600 {
+      compatible = "qcom,hdmi-phy-8996";
+      reg = <0x009a0600 0x1c4>,
+            <0x009a0a00 0x124>,
+            <0x009a0c00 0x124>,
+            <0x009a0e00 0x124>,
+            <0x009a1000 0x124>,
+            <0x009a1200 0x0c8>;
+      reg-names = "hdmi_pll",
+                  "hdmi_tx_l0",
+                  "hdmi_tx_l1",
+                  "hdmi_tx_l2",
+                  "hdmi_tx_l3",
+                  "hdmi_phy";
+
+      clocks = <&mmcc 116>,
+               <&gcc 214>;
+      clock-names = "iface",
+                    "ref";
+      #phy-cells = <0>;
+
+      vddio-supply = <&vreg_l12a_1p8>;
+      vcca-supply = <&vreg_l28a_0p925>;
+    };
-- 
2.35.1

