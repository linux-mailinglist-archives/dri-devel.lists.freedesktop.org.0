Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A479BD9620
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781C10E5F0;
	Tue, 14 Oct 2025 12:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QjMjOZrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C1510E5F0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:39:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so62702165e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445587; x=1761050387; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JPSmW0Y5fO87JOKU3GosvnqWQZ3LgXUPPNLQhl6IPJA=;
 b=QjMjOZrX5bPSEo2fy8unGoP0XDHuBqWO+iGIHrzuauFSb7QqUYG+ktaA1lAFE1AHek
 nJddG+5Rtwwg0HCSz4vSRz3CfGI1wTsqdWo4peM+WpvUZMpE9G5TjkjJNRv48M3+BaO2
 L1osKCUA2BaqWpoHZ7C5E2dfI0G/ltjuHDsiKhQ9wsAqIWqz8JYFao6auXwBFsTRHYOV
 nztTl2kTdCHO5wDEagm0iBl57r3owM/rwZHp1emZcddnYAFcF3s0Ue+kihN+N7JDJzDv
 6hfPmjLIzcjcSmBYL/akl9GVK6FEitKQnrcEHKypc8kYI7d98dFQxUOf8NSNRT0A4LJX
 SVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445587; x=1761050387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPSmW0Y5fO87JOKU3GosvnqWQZ3LgXUPPNLQhl6IPJA=;
 b=TVzSUw8ZEW3UYiUPwpcJMc/d/UCl/0ia7t0scSOkbt2fHDt+SxXtUrk6bVulEcOYwp
 cdTMekRXYYZhsdSrY+ETGKu0rGBbkP2QLOKve6rj4rDtyDA6WsYofwGbxSTKi7nkQ0A2
 PRzvcAVNu2jpX/NcRZ+MSG0yqZqq/y2oQSVOvQp8WCw9LyvsAX2HkLZuy5/Q0BYXHNGU
 YbI6vW7GrBwTZiLNQFcqzH3PXY6JCYVdhKiLXOLiSyiPAQ0CsSBjOOd1udtmkBuGAtEk
 IbNQdMKSqQbVXWCI5Veuj+j/Xm+FzYRSPE6/9dzz8ny2WPjEf/kvbMLAde7TQf8l4rWC
 5uuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/GGJ+MGPmd69VfeTVSmX/h1yaYC/VxvoL2fLPcgPt7v5L4fFt5jDJijH0KjoHa8mXu/2ChoAAbUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVQbRtLbZPR+DEJqYcwszVM+pprnNPF2LLIsZBBFi3XE2N585w
 kSV4HtVolQkiA/Vz89oXLvl6BG8NN4fxmgZzn1Azus5saiCJ/Fdekg7Lf2U6RIhGMNM=
X-Gm-Gg: ASbGncvSfkRysj6b4o9E/j2v4x+A9QiMY+mv0loWzRDGcjSVVMN7LVGYzp5xiQJ/KOs
 JS++hwZ1e+9qsX7D8fjA38GJAIszT6PvlfJQomPPtypAwpRWNf4cUi7esfZc/oeKRfTmhTzYSuX
 0neLI4TjoyUuL8chHpcCbgryJcThRLdvzfKnx5/B7R4gVkUiUYZFAyfJ8ILRqy5E1A6RpAZhLuC
 hNGBwYXqJK4i7kbg/ktQjQzONkxWQ1WVVrKGkjkYKSzDjfMTBKFteayzjRk5SDMbM0M9sj2y2DU
 56cLyia6LbaaZZBzFGsNCqcA7uS5KPK/5Itt2wkN2Yz3tKAGIKvIh+eN//K6puEmRqg/CUZJ1+F
 JD2v/uAPCDBFBuP/D6HF42MmZ5t+hDFHmh05q1f7Fg/NfJB/Wc3rjSA==
X-Google-Smtp-Source: AGHT+IFhCx9LG/sNyz4QzAZ1teVlLZwSJZtjGv0gfJbr9mE552ZhSbiUgWa1Xour/JQpZ0Bv7eO7og==
X-Received: by 2002:a05:600c:529a:b0:46e:37a3:3ec1 with SMTP id
 5b1f17b1804b1-46fa9af1797mr169030655e9.24.1760445587067; 
 Tue, 14 Oct 2025 05:39:47 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:26 +0300
Subject: [PATCH v2 1/7] dt-bindings: display: msm: Document the Glymur
 Mobile Display SubSystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-1-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9474; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=61wZACbGiApdxvo/q+Y5/hhZVi0w2Eepq6MN39OrES0=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR4fmqhF8qbZW6hJZzSbltx8m9zF45nhh2Kg
 Pro0gY350uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EeAAKCRAbX0TJAJUV
 VgVnEAC2j0tUBw+EdAg5gI5oEDd8MhEfnDUQGSDoNOHrU4hIf/k+z+uiRgJ9vHbiM4PDBWDlzGe
 LC8RHdaiMGgAtclw9dwuXgCG5EJLjVCN+RTPO8Aeeiqyeq8fCObVxx7guPGH19b7me3bkPjju9Z
 5LAMx/c8a+f/R8NX2JzvWJfDUHrOeUXLGAigj5SbrrfzANaaa+wEaTZs5c17ho5gPtNpU/xeC3O
 wSHG2lIGwXGuuvT/Bn8AY2vBX6XDU8gnJ4ECp9wjc5JOR3x0AdiRy2xWZXGrydlEGftsah1kQDP
 pIPwXMpcq0rnmdiZhDcbnl2VphLtqGaxw1puMwBeci+h1Acl7DcVDCb2ZJ0Rv8TqpqhPEZGbs1v
 evTbcubBuirt5u6MihyaqjCSIaNduVwIAxt+ne65tagwaNehmx91niqlNDOuFWnANx4IElaERid
 5Q8ATu0y8iO+WBag4EHtjqkZZcK8CbyOjaAycXWzEKmrCmZea9T6O+KsEfM2ntPgNnxNpsB4pFd
 D+ZHhNQN3Mo4MLc/InbTIOCUoIrKbdOzvZOWGaiq1dkeVizBedxH/KPVg/xKh6YhGpGPxGeyas/
 nLaUogJSzojhIKvGgZfoK/YOHARfMRRq/8bybFiwNlgjapY0qId3DqbnMDgvpxEvkoZ1w9Z6fT3
 yssWw7YfFl+a2dA==
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

Add MDSS/MDP display subsystem for Qualcomm Glymur SoC, which is
is 2 minor version increase compared to SM8750.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 264 +++++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2329ed96e6cb37bf63a686e966aa81e690fc5dcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
@@ -0,0 +1,264 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,glymur-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Display MDSS
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+description:
+  Glymur MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DP interfaces, etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,glymur-mdss
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
+        const: qcom,glymur-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,glymur-dp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,glymur-dp-phy
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
+    #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+            compatible = "qcom,glymur-mdss";
+            reg = <0x0ae00000 0x1000>;
+            reg-names = "mdss";
+
+            interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+            clocks = <&dispcc_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&dispcc_mdp_clk>;
+            clock-names = "bus", "nrt_bus", "core";
+
+            interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "mdp0-mem",
+                                 "cpu-cfg";
+
+            resets = <&disp_cc_mdss_core_bcr>;
+
+            power-domains = <&mdss_gdsc>;
+
+            iommus = <&apps_smmu 0x1c00 0x2>;
+
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            display-controller@ae01000 {
+                compatible = "qcom,glymur-dpu";
+                reg = <0x0ae01000 0x8f000>,
+                      <0x0aeb0000 0x2008>;
+                reg-names = "mdp", "vbif";
+
+                clocks = <&gcc_axi_clk>,
+                         <&dispcc_ahb_clk>,
+                         <&dispcc_mdp_lut_clk>,
+                         <&dispcc_mdp_clk>,
+                         <&dispcc_mdp_vsync_clk>;
+                clock-names = "nrt_bus",
+                              "iface",
+                              "lut",
+                              "core",
+                              "vsync";
+
+                assigned-clocks = <&dispcc_mdp_vsync_clk>;
+                assigned-clock-rates = <19200000>;
+
+                operating-points-v2 = <&mdp_opp_table>;
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                interrupt-parent = <&mdss>;
+                interrupts = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        dpu_intf1_out: endpoint {
+                            remote-endpoint = <&dsi0_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        dpu_intf2_out: endpoint {
+                            remote-endpoint = <&dsi1_in>;
+                        };
+                    };
+                };
+
+                mdp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-200000000 {
+                        opp-hz = /bits/ 64 <200000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-325000000 {
+                        opp-hz = /bits/ 64 <325000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-375000000 {
+                        opp-hz = /bits/ 64 <375000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-514000000 {
+                        opp-hz = /bits/ 64 <514000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+            };
+
+            displayport-controller@ae90000 {
+                compatible = "qcom,glymur-dp";
+                reg = <0xae90000 0x200>,
+                      <0xae90200 0x200>,
+                      <0xae90400 0x600>,
+                      <0xae91000 0x400>,
+                      <0xae91400 0x400>;
+
+                interrupt-parent = <&mdss>;
+                interrupts = <12>;
+
+                clocks = <&dispcc_mdss_ahb_clk>,
+                         <&dispcc_dptx0_aux_clk>,
+                         <&dispcc_dptx0_link_clk>,
+                         <&dispcc_dptx0_link_intf_clk>,
+                         <&dispcc_dptx0_pixel0_clk>,
+                         <&dispcc_dptx0_pixel1_clk>;
+                clock-names = "core_iface",
+                              "core_aux",
+                              "ctrl_link",
+                              "ctrl_link_iface",
+                              "stream_pixel",
+                              "stream_1_pixel";
+
+                assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
+                                  <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                                  <&dispcc_mdss_dptx0_pixel1_clk_src>;
+                assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+                                         <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+                operating-points-v2 = <&mdss_dp0_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
+                phy-names = "dp";
+
+                #sound-dai-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dp0_in: endpoint {
+                          remote-endpoint = <&mdss_intf0_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dp0_out: endpoint {
+                        };
+                    };
+                };
+
+                mdss_dp0_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-160000000 {
+                        opp-hz = /bits/ 64 <160000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-270000000 {
+                        opp-hz = /bits/ 64 <270000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
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
+            };
+        };
+...

-- 
2.48.1

