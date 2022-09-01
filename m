Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D615A9479
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF610E6AC;
	Thu,  1 Sep 2022 10:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AE710E69D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:25 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z20so17406151ljq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FiKQMeF508IaIpDsyXpQQCdyRUbDPEPp+qPFL4iaJbU=;
 b=uCOJ5kl/VeoBbsc4GLdIkBw+iZKUZ8+uEEWFGMer7bffI+FnsNfLck9CIjuaw1isnW
 7Q9OPbPmqyVTJzKGXLkGcUg9Mf/Fmz+yHnfFJXEhSvZqn8dkipkmM05LVBPZeIrXDlxZ
 GDKRU01xZm0kGmV5dp7TxfQ87j6L8dHkeUlzdPOdiciQft+TJbKNApjH0nfKr+u0THij
 WJx8pBcX6THicLc8iXjJVZxpzkLIH9Ju3+9uM78cNOP69MQ59I2JzCoU0O/KsRgb636Z
 89cs+cj4In9DOdmdSDTVhvEXHFfeMxrRMzjhtY82UNi2fNEzgr07waTMnDGrzqtOOUk3
 qU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FiKQMeF508IaIpDsyXpQQCdyRUbDPEPp+qPFL4iaJbU=;
 b=DhE3F3lm0+lNiXoaMvaefCEdSipaZyJUBjN5kLawwL+IZlEA+EW1s9hYGlsvnC6K2Z
 GRttiL8UdH8Me6ymxLBbU+M+YLsaxpKWrK0QoDHJA5LLCmFeAbRZlEljqz0KgGe/ph2W
 E8wzz2Mzjxm02dDxQaLvlgqBf32NOTCzVupJdK61osvl4taep0r4UIc/N3wHjcCy9K5t
 zzx0MGWOW4toSm/CeA9rS1qckxviZ8kPJvKiUQAKhXwZqPsPY5A9JJ5GkGANG3slyMOn
 5iBrNsEcwWGlsXkXiHWFbQsrJtfmyPK6sn42hTPRte9Sb5uwb9nNcP5mD5xRZgHAxS6A
 2yEw==
X-Gm-Message-State: ACgBeo2saZc2jFG3hBtwWZVzAd+YBxcXDQE5mvnanuPMlApAt/MbDR10
 SvWR26SGIG+5j+qkWSkR2jS7fL3sNbNqyA==
X-Google-Smtp-Source: AA6agR7brZGtoS/coT0pcyS+tcUtPyrZH/dL2ZznAZ5xb3uBryOyvDnKkuXEueb12l8JWE21K33xkg==
X-Received: by 2002:a2e:ba14:0:b0:264:f253:e3f0 with SMTP id
 p20-20020a2eba14000000b00264f253e3f0mr5972048lja.392.1662027803506; 
 Thu, 01 Sep 2022 03:23:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 09/12] dt-bindings: display/msm: split dpu-msm8998 into DPU
 and MDSS parts
Date: Thu,  1 Sep 2022 13:23:09 +0300
Message-Id: <20220901102312.2005553-10-dmitry.baryshkov@linaro.org>
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

In order to make the schema more readable, split dpu-msm8998 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 161 ++++++------------
 .../bindings/display/msm/mdss-msm8998.yaml    |  76 +++++++++
 2 files changed, 129 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 1e6b7e15f1c5..a71c49ba289a 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -9,143 +9,88 @@ title: Qualcomm Display DPU dt properties for MSM8998 target
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
 
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
+description: Device tree bindings for the MSM8998 DPU display controller.
 
 allOf:
-  - $ref: /schemas/display/msm/mdss-common.yaml#
+  - $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
     items:
-      - const: qcom,msm8998-mdss
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
 
   clocks:
     items:
-      - description: Display AHB clock
-      - description: Display AXI clock
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display mem-noc clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
       - const: iface
       - const: bus
+      - const: mnoc
       - const: core
-
-  iommus:
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
+      - const: vsync
 
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss: display-subsystem@c900000 {
-        compatible = "qcom,msm8998-mdss";
-        reg = <0x0c900000 0x1000>;
-        reg-names = "mdss";
+    display-controller@c901000 {
+        compatible = "qcom,msm8998-dpu";
+        reg = <0x0c901000 0x8f000>,
+              <0x0c9a8e00 0xf0>,
+              <0x0c9b0000 0x2008>,
+              <0x0c9b8000 0x1040>;
+        reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
 
         clocks = <&mmcc MDSS_AHB_CLK>,
                  <&mmcc MDSS_AXI_CLK>,
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
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
                 };
+            };
 
-                port@1 {
-                    reg = <1>;
-                    dpu_intf2_out: endpoint {
-                        remote-endpoint = <&dsi1_in>;
-                    };
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&dsi1_in>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
new file mode 100644
index 000000000000..3482468fb2d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-msm8998.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for MSM8998 target
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for MSM8998 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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

