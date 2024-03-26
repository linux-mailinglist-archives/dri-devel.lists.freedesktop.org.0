Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6C88CDF4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5D710EC17;
	Tue, 26 Mar 2024 20:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JpYxJ6uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DE410EA6B;
 Tue, 26 Mar 2024 20:12:50 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso694683766b.3; 
 Tue, 26 Mar 2024 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711483969; x=1712088769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ONSUYwACRpo+u3/52VLBfGRfEkP/FXhtGDNXZsF2W0=;
 b=JpYxJ6uVf6lvHv1BYpLLx+03N95NU5tXgETb+NcJrX7Btgo8SfLzJ9iqWAI9BSznqG
 X0luJ9UwG67rOO7h9ZlMiYs20yFfcOnO2MXjfxfq7ePsWGTEQgwrBKEogRX6Q4jU3Mop
 FoxzDCTuWsT7C6zD6MRuIwFoLfdqYgg/EXOSbQp1NtOuniXTPfkmheF3g/+DQZY2wlXL
 cxnVQbUFc/z0rxNIVtmfLQLZeyWWwFxtTl247Ri6fru4EuIsP4ZaBCngvazY6e5f06Rx
 InozkVIfvBq68U71Iec+fx/fvFr9AXojD9P9m98Bjor39OoKaMpiu2V9427d+Q525cc6
 jcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483969; x=1712088769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ONSUYwACRpo+u3/52VLBfGRfEkP/FXhtGDNXZsF2W0=;
 b=TJAzCmSO8v5DNPWrWZbIrkdjwzCF7XiuSZod7flZV2tG/5+BMfNjjjuTuwBXrdDRo9
 g0YGM0M+gFqIEW4nIiowdP7bYZiCXtXzAFwT3eefyoWBrvug8bkXwqu3OMiDAV5XZieO
 AqTKBOtKsZS1FGsSU9FDLi2LNKvZCvo1TWhv08bPP9LGPKRAcVnloK63qN+pZZdXV3Ip
 H18VH14olMHSwdlXEmZm4SLmRDMsFgdvoV9KWqcfPE44lZ/rgfoNbf9exeQXC44AhN6+
 Na4N75kfKKmg9Mn1wbkDpSMdfWAgnIGLgyHyp4xD4eyQqFOU1CXohvNiAk1qxFq40AOM
 jsJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4MzxpLH36CpDkdKDbwMflwYGRZc5J6a0yz13dT1ntN3uVj5Omq1DoLDhBoGAZ31GQ9+vvHvDwRzHR9WySOBlgxg9Zprt+vxNe7I3UN5q6UR4tyKNu48neKW1p+OTCVRKIyHmdIzPBqahN23KOc9Z1
X-Gm-Message-State: AOJu0YyStAgYnT2MKiwYwMjIhbvhlaacVvrmZRmmepsrROZrr8+LMcjt
 I+LuinvSGF+cadeOUTsP2BTJ+3+5Cl0yQF+Mn0TE5MfCQG//FKpP
X-Google-Smtp-Source: AGHT+IHCsOf2QDkEpbZ8A0Xwuri3yvi8aRlO7ZjVhY91//QVNnlSsilOXHIQYolx14O2dSRfC62+ag==
X-Received: by 2002:a17:906:c34c:b0:a4a:20e1:33ad with SMTP id
 ci12-20020a170906c34c00b00a4a20e133admr1686658ejb.32.1711483968584; 
 Tue, 26 Mar 2024 13:12:48 -0700 (PDT)
Received: from localhost.localdomain (byv80.neoplus.adsl.tpnet.pl.
 [83.30.41.80]) by smtp.gmail.com with ESMTPSA id
 du1-20020a17090772c100b00a4da28f42f1sm1714257ejc.177.2024.03.26.13.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:12:47 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Adam Skladowski <a39.skl@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] dt-bindings: display/msm: gpu: Split Adreno schemas
 into separate files
Date: Tue, 26 Mar 2024 21:05:58 +0100
Message-Id: <20240326201140.10561-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326201140.10561-1-a39.skl@gmail.com>
References: <20240326201140.10561-1-a39.skl@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split shared schema into per-gen and group adrenos by clocks used.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml  | 317 ++----------------
 .../bindings/display/msm/qcom,adreno-306.yaml | 115 +++++++
 .../bindings/display/msm/qcom,adreno-330.yaml | 111 ++++++
 .../bindings/display/msm/qcom,adreno-405.yaml | 135 ++++++++
 .../bindings/display/msm/qcom,adreno-506.yaml | 184 ++++++++++
 .../bindings/display/msm/qcom,adreno-530.yaml | 161 +++++++++
 .../bindings/display/msm/qcom,adreno-540.yaml | 154 +++++++++
 .../bindings/display/msm/qcom,adreno-6xx.yaml | 160 +++++++++
 .../display/msm/qcom,adreno-common.yaml       | 112 +++++++
 9 files changed, 1157 insertions(+), 292 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-306.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-330.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-405.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-506.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-530.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-540.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-6xx.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 40b5c6bd11f8..be29d85e597c 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Adreno or Snapdragon GPUs
+title: Imageon 200 GPU
 
 maintainers:
   - Rob Clark <robdclark@gmail.com>
@@ -13,18 +13,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - description: |
-          The driver is parsing the compat string for Adreno to
-          figure out the chip-id.
-        items:
-          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
-          - const: qcom,adreno
-      - description: |
-          The driver is parsing the compat string for Adreno to
-          figure out the gpu-id and patch level.
-        items:
-          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]+$'
-          - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
           figure out the gpu-id and patch level.
@@ -32,88 +20,31 @@ properties:
           - pattern: '^amd,imageon-200\.[0-1]$'
           - const: amd,imageon
 
-  clocks: true
+  clocks:
+    items:
+      - description: GPU Core clock
+      - description: GPU Memory Interface clock
 
-  clock-names: true
+  clock-names:
+    items:
+      - const: core_clk
+      - const: mem_iface_clk
 
   reg:
-    minItems: 1
-    maxItems: 3
+    items:
+      - description: base address of GPU device
 
   reg-names:
-    minItems: 1
-    maxItems: 3
+    items:
+      - const: kgsl_3d0_reg_memory
 
   interrupts:
-    maxItems: 1
-
-  interrupt-names:
-    maxItems: 1
-
-  interconnects:
-    minItems: 1
-    maxItems: 2
-
-  interconnect-names:
-    minItems: 1
     items:
-      - const: gfx-mem
-      - const: ocmem
+      - description: interrupt of GPU device
 
-  iommus:
-    minItems: 1
-    maxItems: 64
-
-  sram:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
-    maxItems: 4
+  interrupt-names:
     items:
-      maxItems: 1
-    description: |
-      phandles to one or more reserved on-chip SRAM regions.
-      phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
-      a4xx Snapdragon SoCs. See
-      Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
-
-  operating-points-v2: true
-  opp-table:
-    type: object
-
-  power-domains:
-    maxItems: 1
-
-  zap-shader:
-    type: object
-    additionalProperties: false
-    description: |
-      For a5xx and a6xx devices this node contains a memory-region that
-      points to reserved memory to store the zap shader that can be used to
-      help bring the GPU out of secure mode.
-    properties:
-      memory-region:
-        maxItems: 1
-
-      firmware-name:
-        description: |
-          Default name of the firmware to load to the remote processor.
-
-  "#cooling-cells":
-    const: 2
-
-  nvmem-cell-names:
-    maxItems: 1
-
-  nvmem-cells:
-    description: efuse registers
-    maxItems: 1
-
-  qcom,gmu:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      For GMU attached devices a phandle to the GMU device that will
-      control the power for the GPU.
-
+      - const: kgsl_3d0_irq
 
 required:
   - compatible
@@ -122,222 +53,24 @@ required:
 
 additionalProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]+$'
-
-    then:
-      properties:
-        clocks:
-          minItems: 2
-          maxItems: 7
-
-        clock-names:
-          items:
-            anyOf:
-              - const: core
-                description: GPU Core clock
-              - const: iface
-                description: GPU Interface clock
-              - const: mem
-                description: GPU Memory clock
-              - const: mem_iface
-                description: GPU Memory Interface clock
-              - const: alt_mem_iface
-                description: GPU Alternative Memory Interface clock
-              - const: gfx3d
-                description: GPU 3D engine clock
-              - const: rbbmtimer
-                description: GPU RBBM Timer for Adreno 5xx series
-              - const: rbcpr
-                description: GPU RB Core Power Reduction clock
-          minItems: 2
-          maxItems: 7
-
-      required:
-        - clocks
-        - clock-names
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,adreno-610.0
-              - qcom,adreno-619.1
-    then:
-      properties:
-        clocks:
-          minItems: 6
-          maxItems: 6
-
-        clock-names:
-          items:
-            - const: core
-              description: GPU Core clock
-            - const: iface
-              description: GPU Interface clock
-            - const: mem_iface
-              description: GPU Memory Interface clock
-            - const: alt_mem_iface
-              description: GPU Alternative Memory Interface clock
-            - const: gmu
-              description: CX GMU clock
-            - const: xo
-              description: GPUCC clocksource clock
-
-        reg-names:
-          minItems: 1
-          items:
-            - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
-
-      required:
-        - clocks
-        - clock-names
-    else:
-      if:
-        properties:
-          compatible:
-            contains:
-              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
-
-      then: # Starting with A6xx, the clocks are usually defined in the GMU node
-        properties:
-          clocks: false
-          clock-names: false
-
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
-
 examples:
   - |
 
-    // Example a3xx/4xx:
+    // Example imageon-200:
 
-    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
-    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/imx5-clock.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    gpu: gpu@fdb00000 {
-        compatible = "qcom,adreno-330.2", "qcom,adreno";
+    gpu: gpu@30000000 {
+        compatible = "amd,imageon-200.0", "amd,imageon";
 
-        reg = <0xfdb00000 0x10000>;
+        reg = <0x30000000 0x20000>;
         reg-names = "kgsl_3d0_reg_memory";
 
-        clock-names = "core", "iface", "mem_iface";
-        clocks = <&mmcc OXILI_GFX3D_CLK>,
-                 <&mmcc OXILICX_AHB_CLK>,
-                 <&mmcc OXILICX_AXI_CLK>;
+        clock-names = "core_clk", "mem_iface_clk";
+        clocks = <&clks IMX5_CLK_GPU3D_GATE>,
+                 <&clks IMX5_CLK_GARB_GATE>;
 
-        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <12>;
         interrupt-names = "kgsl_3d0_irq";
-
-        sram = <&gpu_sram>;
-        power-domains = <&mmcc OXILICX_GDSC>;
-        operating-points-v2 = <&gpu_opp_table>;
-        iommus = <&gpu_iommu 0>;
-        #cooling-cells = <2>;
-    };
-
-    ocmem@fdd00000 {
-        compatible = "qcom,msm8974-ocmem";
-
-        reg = <0xfdd00000 0x2000>,
-              <0xfec00000 0x180000>;
-        reg-names = "ctrl", "mem";
-
-        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
-                 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
-        clock-names = "core", "iface";
-
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges = <0 0xfec00000 0x100000>;
-
-        gpu_sram: gpu-sram@0 {
-            reg = <0x0 0x100000>;
-        };
-    };
-  - |
-
-    // Example a6xx (with GMU):
-
-    #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
-    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sdm845.h>
-
-    reserved-memory {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        zap_shader_region: gpu@8f200000 {
-            compatible = "shared-dma-pool";
-            reg = <0x0 0x90b00000 0x0 0xa00000>;
-            no-map;
-        };
-    };
-
-    gpu@5000000 {
-        compatible = "qcom,adreno-630.2", "qcom,adreno";
-
-        reg = <0x5000000 0x40000>, <0x509e000 0x10>;
-        reg-names = "kgsl_3d0_reg_memory", "cx_mem";
-
-        #cooling-cells = <2>;
-
-        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-
-        iommus = <&adreno_smmu 0>;
-
-        operating-points-v2 = <&gpu_opp_table>;
-
-        interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
-        interconnect-names = "gfx-mem";
-
-        qcom,gmu = <&gmu>;
-
-        gpu_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-430000000 {
-                opp-hz = /bits/ 64 <430000000>;
-                opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-                opp-peak-kBps = <5412000>;
-            };
-
-            opp-355000000 {
-                opp-hz = /bits/ 64 <355000000>;
-                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-                opp-peak-kBps = <3072000>;
-            };
-
-            opp-267000000 {
-                opp-hz = /bits/ 64 <267000000>;
-                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-                opp-peak-kBps = <3072000>;
-            };
-
-            opp-180000000 {
-                opp-hz = /bits/ 64 <180000000>;
-                opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-                opp-peak-kBps = <1804000>;
-            };
-        };
-
-        zap-shader {
-            memory-region = <&zap_shader_region>;
-            firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
-        };
     };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-306.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-306.yaml
new file mode 100644
index 000000000000..2d2b86edaed0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-306.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-306.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 3xx GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 306 GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-306.0
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-306.0
+      - const: qcom,adreno
+  reg:
+    items:
+      - description: base address of GPU device
+
+  reg-names:
+    items:
+      - const: kgsl_3d0_reg_memory
+
+  clocks:
+    items:
+      - description: GPU Core clock
+      - description: GPU Interface clock
+      - description: GPU Memory clock
+      - description: GPU Memory Interface clock
+      - description: GPU Memory Interface clock
+      - description: GPU 3D engine clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: mem
+      - const: mem_iface
+      - const: alt_mem_iface
+      - const: gfx3d
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a306 :
+
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@1c00000 {
+        compatible = "qcom,adreno-306.0", "qcom,adreno";
+
+        reg = <0x01c00000 0x20000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
+                 <&gcc GCC_OXILI_AHB_CLK>,
+                 <&gcc GCC_OXILI_GMEM_CLK>,
+                 <&gcc GCC_BIMC_GFX_CLK>,
+                 <&gcc GCC_BIMC_GPU_CLK>,
+                 <&gcc GFX3D_CLK_SRC>;
+
+        clock-names = "core",
+                      "iface",
+                      "mem",
+                      "mem_iface",
+                      "alt_mem_iface",
+                      "gfx3d";
+
+        power-domains = <&gcc OXILI_GDSC>;
+        iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        #cooling-cells = <2>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-19200000 {
+                opp-hz = /bits/ 64 <19200000>;
+            };
+
+            opp-400000000  {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-330.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-330.yaml
new file mode 100644
index 000000000000..46ad110571cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-330.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-330.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 3xx GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 330 GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-305.18
+          - qcom,adreno-330.1
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-305.18
+          - qcom,adreno-330.1
+      - const: qcom,adreno
+  reg:
+    items:
+      - description: base address of GPU device
+
+  reg-names:
+    items:
+      - const: kgsl_3d0_reg_memory
+
+  clocks:
+    items:
+      - description: GPU Core clock
+      - description: GPU Interface clock
+      - description: GPU Memory Interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: mem_iface
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a306 :
+
+    #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@fdb00000 {
+        compatible = "qcom,adreno-330.1", "qcom,adreno";
+
+        reg = <0xfdb00000 0x10000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "kgsl_3d0_irq";
+
+        clocks = <&mmcc OXILI_GFX3D_CLK>,
+                 <&mmcc OXILICX_AHB_CLK>,
+                 <&mmcc OXILICX_AXI_CLK>;
+
+        clock-names = "core",
+                      "iface",
+                      "mem_iface";
+
+        power-domains = <&mmcc OXILICX_GDSC>;
+        iommus = <&gpu_iommu 0>;
+
+        sram = <&gmu_sram>;
+        operating-points-v2 = <&gpu_opp_table>;
+
+        #cooling-cells = <2>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-27000000 {
+                opp-hz = /bits/ 64 <27000000>;
+            };
+
+            opp-200000000  {
+                opp-hz = /bits/ 64 <200000000>;
+            };
+
+            opp-320000000  {
+                opp-hz = /bits/ 64 <320000000>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-405.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-405.yaml
new file mode 100644
index 000000000000..d3bcf1dafe95
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-405.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-405.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 4xx GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 405 GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-405.0
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-405.0
+      - const: qcom,adreno
+  reg:
+    items:
+      - description: base address of GPU device
+
+  reg-names:
+    items:
+      - const: kgsl_3d0_reg_memory
+
+  clocks:
+    items:
+      - description: GPU Core clock
+      - description: GPU Interface clock
+      - description: GPU Memory clock
+      - description: GPU Memory Interface clock
+      - description: GPU Memory Interface clock
+      - description: GPU 3D engine clock
+      - description: GPU RBBM Timer for Adreno 4xx series
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: mem
+      - const: mem_iface
+      - const: alt_mem_iface
+      - const: gfx3d
+      - const: rbbmtimer
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a405 :
+
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@1c00000 {
+        compatible = "qcom,adreno-405.0", "qcom,adreno";
+
+        reg = <0x01c00000 0x40000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
+                 <&gcc GCC_OXILI_AHB_CLK>,
+                 <&gcc GCC_OXILI_GMEM_CLK>,
+                 <&gcc GCC_BIMC_GFX_CLK>,
+                 <&gcc GCC_BIMC_GPU_CLK>,
+                 <&gcc GFX3D_CLK_SRC>,
+                 <&gcc GCC_OXILI_TIMER_CLK>;
+
+        clock-names = "core",
+                      "iface",
+                      "mem",
+                      "mem_iface",
+                      "alt_mem_iface",
+                      "gfx3d",
+                      "rbbmtimer";
+
+        power-domains = <&gcc OXILI_GDSC>;
+        iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        #cooling-cells = <2>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-19200000 {
+                opp-hz = /bits/ 64 <19200000>;
+            };
+
+            opp-220000000 {
+                opp-hz = /bits/ 64 <220000000>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+            };
+
+            opp-465000000  {
+                opp-hz = /bits/ 64 <465000000>;
+            };
+
+            opp-550000000 {
+                opp-hz = /bits/ 64 <550000000>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-506.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-506.yaml
new file mode 100644
index 000000000000..58e43a3c1c6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-506.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-506.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 506 GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 506 GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-504.0
+          - qcom,adreno-505.0
+          - qcom,adreno-506.0
+          - qcom,adreno-510.0
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-504.0
+          - qcom,adreno-505.0
+          - qcom,adreno-506.0
+          - qcom,adreno-510.0
+      - const: qcom,adreno
+
+  reg:
+    items:
+      - description: base address of GPU device
+
+  reg-names:
+    items:
+      - const: kgsl_3d0_reg_memory
+
+  clocks:
+    items:
+      - description: GPU Always-On clock
+      - description: GPU Core clock
+      - description: GPU Interface clock
+      - description: GPU Memory clock
+      - description: GPU Memory Interface clock
+      - description: GPU RBBM Timer for Adreno 5xx series
+
+  clock-names:
+    items:
+      - const: alwayson
+      - const: core
+      - const: iface
+      - const: mem
+      - const: mem_iface
+      - const: rbbmtimer
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a506 :
+
+    #include <dt-bindings/clock/qcom,gcc-msm8953.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        zap_shader_region: memory@81800000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0x81800000 0x0 0x2000>;
+            no-map;
+        };
+    };
+
+
+    gpu@1c00000 {
+        compatible = "qcom,adreno-506.0", "qcom,adreno";
+
+        reg = <0x01c00000 0x40000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_OXILI_AON_CLK>,
+                 <&gcc GCC_OXILI_GFX3D_CLK>,
+                 <&gcc GCC_OXILI_AHB_CLK>,
+                 <&gcc GCC_BIMC_GFX_CLK>,
+                 <&gcc GCC_BIMC_GPU_CLK>,
+                 <&gcc GCC_OXILI_TIMER_CLK>;
+
+        clock-names = "alwayson",
+                      "core",
+                      "iface",
+                      "mem",
+                      "mem_iface",
+                      "rbbmtimer";
+
+        power-domains = <&gcc OXILI_GX_GDSC>;
+        iommus = <&gpu_iommu 0>;
+
+        nvmem-cells = <&speedbin_efuse>;
+        nvmem-cell-names = "speed_bin";
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        #cooling-cells = <2>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-266670000 {
+                opp-hz = /bits/ 64 <266670000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-320000000 {
+                opp-hz = /bits/ 64 <320000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-400000000  {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-510000000 {
+                opp-hz = /bits/ 64 <510000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-560000000 {
+                opp-hz = /bits/ 64 <560000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-supported-hw = <0x1ff>;
+            };
+
+            opp-650000000 {
+                opp-hz = /bits/ 64 <650000000>;
+                opp-supported-hw = <0x185>;
+            };
+
+            opp-685000000 {
+                opp-hz = /bits/ 64 <685000000>;
+                opp-supported-hw = <0x100>;
+            };
+
+            opp-725000000 {
+                opp-hz = /bits/ 64 <725000000>;
+                opp-supported-hw = <0x100>;
+            };
+        };
+
+        zap-shader {
+            memory-region = <&zap_shader_region>;
+            firmware-name = "a506_zap.mdt";
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-530.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-530.yaml
new file mode 100644
index 000000000000..6d31697782f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-530.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-530.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 530 GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 530 GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-530.2
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-530.2
+      - const: qcom,adreno
+  reg:
+    items:
+      - description: base address of GPU device
+
+  reg-names:
+    items:
+      - const: kgsl_3d0_reg_memory
+
+  clocks:
+    items:
+      - description: GPU Core clock
+      - description: GPU Interface clock
+      - description: GPU RBBM Timer for Adreno 5xx series
+      - description: GPU Memory clock
+      - description: GPU Memory Interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: rbbmtimer
+      - const: mem
+      - const: mem_iface
+
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a530 :
+
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,msm8996.h>
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gpu_mem: memory@90f00000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0x90f00000 0x0 0x100000>;
+            no-map;
+        };
+    };
+
+    gpu@b00000 {
+        compatible = "qcom,adreno-530.2", "qcom,adreno";
+
+        reg = <0x00b00000 0x3f000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&mmcc GPU_GX_GFX3D_CLK>,
+                 <&mmcc GPU_AHB_CLK>,
+                 <&mmcc GPU_GX_RBBMTIMER_CLK>,
+                 <&gcc GCC_BIMC_GFX_CLK>,
+                 <&gcc GCC_MMSS_BIMC_GFX_CLK>;
+
+        clock-names = "core",
+                      "iface",
+                      "rbbmtimer",
+                      "mem",
+                      "mem_iface";
+
+        power-domains = <&mmcc GPU_GX_GDSC>;
+        iommus = <&adreno_smmu 0>;
+
+        nvmem-cells = <&speedbin_efuse>;
+        nvmem-cell-names = "speed_bin";
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        interconnects = <&bimc MASTER_GRAPHICS_3D &bimc SLAVE_EBI_CH0>;
+        interconnect-names = "gfx-mem";
+
+        #cooling-cells = <2>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-624000000 {
+                opp-hz = /bits/ 64 <624000000>;
+                opp-supported-hw = <0x09>;
+            };
+
+           opp-560000000 {
+                opp-hz = /bits/ 64 <560000000>;
+                opp-supported-hw = <0x0d>;
+            };
+
+            opp-510000000 {
+                opp-hz = /bits/ 64 <510000000>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-401800000 {
+                opp-hz = /bits/ 64 <401800000>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-315000000 {
+                opp-hz = /bits/ 64 <315000000>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-214000000 {
+                opp-hz = /bits/ 64 <214000000>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                opp-supported-hw = <0xff>;
+            };
+        };
+
+        zap-shader {
+            memory-region = <&gpu_mem>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-540.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-540.yaml
new file mode 100644
index 000000000000..bb7ccb8ddc28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-540.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-540.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 5xx GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 540 GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno-508.0
+          - qcom,adreno-512.0
+          - qcom,adreno-540.1
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-508.0
+          - qcom,adreno-512.0
+          - qcom,adreno-540.1
+      - const: qcom,adreno
+  reg:
+    items:
+      - description: base address of GPU device
+
+  reg-names:
+    items:
+      - const: kgsl_3d0_reg_memory
+
+  clocks:
+    items:
+      - description: GPU Interface clock
+      - description: GPU RBBM Timer for Adreno 5xx series
+      - description: GPU Memory clock
+      - description: GPU Memory Interface clock
+      - description: GPU RBCPR clock
+      - description: GPU Core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: rbbmtimer
+      - const: mem
+      - const: mem_iface
+      - const: rbcpr
+      - const: core
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a540 :
+
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,gpucc-msm8998.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@5000000 {
+        compatible = "qcom,adreno-540.1", "qcom,adreno";
+
+        reg = <0x05000000 0x40000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+                 <&gpucc RBBMTIMER_CLK>,
+                 <&gcc GCC_BIMC_GFX_CLK>,
+                 <&gcc GCC_GPU_BIMC_GFX_CLK>,
+                 <&gpucc RBCPR_CLK>,
+                 <&gpucc GFX3D_CLK>;
+
+        clock-names = "iface",
+                      "rbbmtimer",
+                      "mem",
+                      "mem_iface",
+                      "rbcpr",
+                      "core";
+
+        power-domains = <&rpmpd MSM8998_VDDMX>;
+        iommus = <&adreno_smmu 0>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        #cooling-cells = <2>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-710000097 {
+                opp-hz = /bits/ 64 <710000097>;
+                opp-level = <RPM_SMD_LEVEL_TURBO>;
+                opp-supported-hw = <0xff>;
+            };
+
+           opp-670000048 {
+                opp-hz = /bits/ 64 <670000048>;
+                opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-596000097 {
+                opp-hz = /bits/ 64 <596000097>;
+                opp-level = <RPM_SMD_LEVEL_NOM>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-515000097 {
+                opp-hz = /bits/ 64 <515000097>;
+                opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-414000000 {
+                opp-hz = /bits/ 64 <414000000>;
+                opp-level = <RPM_SMD_LEVEL_SVS>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-342000000 {
+                opp-hz = /bits/ 64 <342000000>;
+                opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+                opp-supported-hw = <0xff>;
+            };
+
+            opp-257000000 {
+                opp-hz = /bits/ 64 <257000000>;
+                opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+                opp-supported-hw = <0xff>;
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-6xx.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-6xx.yaml
new file mode 100644
index 000000000000..89106ff2215f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-6xx.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-6xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno 6xx GPU
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno 600 series of GPU.
+
+select:
+  properties:
+    compatible:
+      contains:
+        pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
+  required:
+    - compatible
+
+$ref: /schemas/display/msm/qcom,adreno-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
+
+allOf:
+  - $ref: qcom,adreno-common.yaml#
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,adreno-610.0
+                - qcom,adreno-619.1
+            - const: qcom,adreno
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gmu
+              description: CX GMU clock
+            - const: xo
+              description: GPUCC clocksource clock
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+        - power-domains
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+        power-domains: false
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example a6xx (with GMU):
+
+    #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        zap_shader_region: memory@8f200000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0x90b00000 0x0 0xa00000>;
+            no-map;
+        };
+    };
+
+    gpu@5000000 {
+        compatible = "qcom,adreno-630.2", "qcom,adreno";
+
+        reg = <0x5000000 0x40000>, <0x509e000 0x10>;
+        reg-names = "kgsl_3d0_reg_memory", "cx_mem";
+
+        #cooling-cells = <2>;
+
+        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&adreno_smmu 0>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
+        interconnect-names = "gfx-mem";
+
+        qcom,gmu = <&gmu>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-430000000 {
+                opp-hz = /bits/ 64 <430000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+                opp-peak-kBps = <5412000>;
+            };
+
+            opp-355000000 {
+                opp-hz = /bits/ 64 <355000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+                opp-peak-kBps = <3072000>;
+            };
+
+            opp-267000000 {
+                opp-hz = /bits/ 64 <267000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+                opp-peak-kBps = <3072000>;
+            };
+
+            opp-180000000 {
+                opp-hz = /bits/ 64 <180000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+                opp-peak-kBps = <1804000>;
+            };
+        };
+
+        zap-shader {
+            memory-region = <&zap_shader_region>;
+            firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-common.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-common.yaml
new file mode 100644
index 000000000000..592d45de6c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-common.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno common properties
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for Adreno GPUs
+
+select:
+  false
+
+properties:
+  $nodename:
+    pattern: "^gpu@[0-9a-f]+$"
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    maxItems: 3
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 7
+
+  clock-names:
+    minItems: 2
+    maxItems: 7
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  interconnects:
+    minItems: 1
+    maxItems: 2
+
+  interconnect-names:
+    minItems: 1
+    maxItems: 2
+
+  iommus:
+    minItems: 1
+    maxItems: 64
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maxItems: 1
+    description: |
+      phandles to one or more reserved on-chip SRAM regions.
+      phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
+      a4xx Snapdragon SoCs. See
+      Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  zap-shader:
+    type: object
+    additionalProperties: false
+    description: |
+      For a5xx and a6xx devices this node contains a memory-region that
+      points to reserved memory to store the zap shader that can be used to
+      help bring the GPU out of secure mode.
+    properties:
+      memory-region:
+        maxItems: 1
+
+      firmware-name:
+        description: |
+          Default name of the firmware to load to the remote processor.
+
+  "#cooling-cells":
+    const: 2
+
+  nvmem-cell-names:
+    maxItems: 1
+
+  nvmem-cells:
+    description: efuse registers
+    maxItems: 1
+
+  qcom,gmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      For GMU attached devices a phandle to the GMU device that will
+      control the power for the GPU.
+
+required:
+  - reg
+  - reg-names
+  - interrupts
+  - iommus
+
+additionalProperties: true
-- 
2.44.0

