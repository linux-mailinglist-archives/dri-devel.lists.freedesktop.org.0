Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC83B23D8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 01:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8B6E94D;
	Wed, 23 Jun 2021 23:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0EE6E94D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 23:07:35 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id v3so5494290ioq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XW+NgxF8kNr9wz6YBTzC7bfaF/Dak1x1L0/Wc7oykTM=;
 b=U8JktvgjkBRdtbVCKFnYAM/jPM7MVRwLrFTSvz1uF8xYFhy7+R26KlSKfo2G6x7rVz
 cNpQ2B7r6X6t3fa2zj+Zd+3YC/IIJxwB/4vUI501a9b5d6CyFlAAYMjfA/AiGgJh0EjW
 F/GrFMksiet6mIcHk3GpHSn0whnYo3Y6K25Dzoz7YA6PGB6eIOFJqA3nbTToPPk3PBNe
 k5lus4A329g0Nf6Zclp6ZlEEMTw1kuDNWn8uhyvxWfH25+TL3Wo/lx0yKlBcAeX/K5Ea
 IiCyPs2t5S8dFvFWBkP7oVz1w96IJ4CCudw89Y2Dbm1vjtdbAIrgUtK7oMMxmuD/+/1h
 /mNA==
X-Gm-Message-State: AOAM530hjoVCsiXW80WHI3JSBspKHFkBB17gXSAtek+axm1VNPsSiMrp
 HzxvrW07hsAOdZi7um6uyw==
X-Google-Smtp-Source: ABdhPJx1Ku9v+x69nQzxoTAtFuZ9KyhPkvxWqPpYogP6Kq29+zSYN5EJ2x8yr+zO7u/Xp/aaZqMO6Q==
X-Received: by 2002:a02:230d:: with SMTP id u13mr1818338jau.138.1624489654983; 
 Wed, 23 Jun 2021 16:07:34 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id t15sm694356ile.28.2021.06.23.16.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 16:07:33 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/2] dt-bindings: opp: Convert to DT schema
Date: Wed, 23 Jun 2021 17:07:22 -0600
Message-Id: <20210623230722.3545986-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623230722.3545986-1-robh@kernel.org>
References: <20210623230722.3545986-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Georgi Djakov <djakov@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the OPP v1 and v2 bindings to DT schema format. As the OPPv2 binding
can be extended by vendors, we need to split the common part out from the
"operating-points-v2" conforming compatible.

Cc: Yangtao Li <tiny.windzz@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Nishanth Menon <nm@ti.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../allwinner,sun50i-h6-operating-points.yaml |   4 +
 .../devicetree/bindings/opp/opp-v1.yaml       |  51 ++
 .../devicetree/bindings/opp/opp-v2-base.yaml  | 213 ++++++
 .../devicetree/bindings/opp/opp-v2.yaml       | 475 +++++++++++++
 Documentation/devicetree/bindings/opp/opp.txt | 622 ------------------
 5 files changed, 743 insertions(+), 622 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v1.yaml
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v2-base.yaml
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v2.yaml
 delete mode 100644 Documentation/devicetree/bindings/opp/opp.txt

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index aeff2bd774dd..729ae97b63d9 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -18,6 +18,9 @@ description: |
   sun50i-cpufreq-nvmem driver reads the efuse value from the SoC to
   provide the OPP framework with required information.
 
+allOf:
+  - $ref: opp-v2-base.yaml#
+
 properties:
   compatible:
     const: allwinner,sun50i-h6-operating-points
@@ -43,6 +46,7 @@ patternProperties:
 
     properties:
       opp-hz: true
+      clock-latency-ns: true
 
     patternProperties:
       "opp-microvolt-.*": true
diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
new file mode 100644
index 000000000000..d585d536a3fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic OPP (Operating Performance Points) v1 Bindings
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+description: |+
+  Devices work at voltage-current-frequency combinations and some implementations
+  have the liberty of choosing these. These combinations are called Operating
+  Performance Points aka OPPs. This document defines bindings for these OPPs
+  applicable across wide range of devices. For illustration purpose, this document
+  uses CPU as a device.
+
+  This binding only supports voltage-frequency pairs.
+
+select: true
+
+properties:
+  operating-points:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Frequency in kHz
+        - description: Voltage for OPP in uV
+
+
+additionalProperties: true
+examples:
+  - |
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a9";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            operating-points =
+                /* kHz    uV */
+                <792000 1100000>,
+                <396000 950000>,
+                <198000 850000>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
new file mode 100644
index 000000000000..e23d426f870e
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic OPP (Operating Performance Points) Common Binding
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+description: |
+  Devices work at voltage-current-frequency combinations and some implementations
+  have the liberty of choosing these. These combinations are called Operating
+  Performance Points aka OPPs. This document defines bindings for these OPPs
+  applicable across wide range of devices. For illustration purpose, this document
+  uses CPU as a device.
+
+  This describes the OPPs belonging to a device.
+
+select: false
+
+properties:
+  $nodename:
+    pattern: '^opp-table(-[a-z0-9]+)?$'
+
+  opp-shared:
+    description:
+      Indicates that device nodes using this OPP Table Node's phandle switch
+      their DVFS state together, i.e. they share clock/voltage/current lines.
+      Missing property means devices have independent clock/voltage/current
+      lines, but they share OPP tables.
+    type: boolean
+
+patternProperties:
+  '^opp-?[0-9]+$':
+    type: object
+    description:
+      One or more OPP nodes describing voltage-current-frequency combinations.
+      Their name isn't significant but their phandle can be used to reference an
+      OPP. These are mandatory except for the case where the OPP table is
+      present only to indicate dependency between devices using the opp-shared
+      property.
+
+    properties:
+      opp-hz:
+        description:
+          Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
+          required property for all device nodes, unless another "required"
+          property to uniquely identify the OPP nodes exists. Devices like power
+          domains must have another (implementation dependent) property.
+
+      opp-peak-kBps:
+        description:
+          Peak bandwidth in kilobytes per second, expressed as an array of
+          32-bit big-endian integers. Each element of the array represents the
+          peak bandwidth value of each interconnect path. The number of elements
+          should match the number of interconnect paths.
+        minItems: 1
+        maxItems: 32  # Should be enough
+
+      opp-microvolt:
+        description: |
+          Voltage for the OPP
+
+          A single regulator's voltage is specified with an array of size one or three.
+          Single entry is for target voltage and three entries are for <target min max>
+          voltages.
+
+          Entries for multiple regulators shall be provided in the same field separated
+          by angular brackets <>. The OPP binding doesn't provide any provisions to
+          relate the values to their power supplies or the order in which the supplies
+          need to be configured and that is left for the implementation specific
+          binding.
+
+          Entries for all regulators shall be of the same size, i.e. either all use a
+          single value or triplets.
+        minItems: 1
+        maxItems: 8
+        items:
+          minItems: 1
+          maxItems: 3
+
+      opp-microamp:
+        description: |
+          The maximum current drawn by the device in microamperes considering
+          system specific parameters (such as transients, process, aging,
+          maximum operating temperature range etc.) as necessary. This may be
+          used to set the most efficient regulator operating mode.
+
+          Should only be set if opp-microvolt(-name)? is set for the OPP.
+
+          Entries for multiple regulators shall be provided in the same field
+          separated by angular brackets <>. If current values aren't required
+          for a regulator, then it shall be filled with 0. If current values
+          aren't required for any of the regulators, then this field is not
+          required. The OPP binding doesn't provide any provisions to relate the
+          values to their power supplies or the order in which the supplies need
+          to be configured and that is left for the implementation specific
+          binding.
+        minItems: 1
+        maxItems: 8   # Should be enough regulators
+        items:
+          minItems: 1
+          maxItems: 3
+
+      opp-level:
+        description:
+          A value representing the performance level of the device.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      opp-avg-kBps:
+        description:
+          Average bandwidth in kilobytes per second, expressed as an array
+          of 32-bit big-endian integers. Each element of the array represents the
+          average bandwidth value of each interconnect path. The number of elements
+          should match the number of interconnect paths. This property is only
+          meaningful in OPP tables where opp-peak-kBps is present.
+        minItems: 1
+        maxItems: 32  # Should be enough
+
+      clock-latency-ns:
+        description:
+          Specifies the maximum possible transition latency (in nanoseconds) for
+          switching to this OPP from any other OPP.
+
+      turbo-mode:
+        description:
+          Marks the OPP to be used only for turbo modes. Turbo mode is available
+          on some platforms, where the device can run over its operating
+          frequency for a short duration of time limited by the device's power,
+          current and thermal limits.
+        type: boolean
+
+      opp-suspend:
+        description:
+          Marks the OPP to be used during device suspend. If multiple OPPs in
+          the table have this, the OPP with highest opp-hz will be used.
+        type: boolean
+
+      opp-supported-hw:
+        description: |
+          This property allows a platform to enable only a subset of the OPPs
+          from the larger set present in the OPP table, based on the current
+          version of the hardware (already known to the operating system).
+
+          Each block present in the array of blocks in this property, represents
+          a sub-group of hardware versions supported by the OPP. i.e. <sub-group
+          A>, <sub-group B>, etc. The OPP will be enabled if _any_ of these
+          sub-groups match the hardware's version.
+
+          Each sub-group is a platform defined array representing the hierarchy
+          of hardware versions supported by the platform. For a platform with
+          three hierarchical levels of version (X.Y.Z), this field shall look
+          like
+
+          opp-supported-hw = <X1 Y1 Z1>, <X2 Y2 Z2>, <X3 Y3 Z3>.
+
+          Each level (eg. X1) in version hierarchy is represented by a 32 bit
+          value, one bit per version and so there can be maximum 32 versions per
+          level. Logical AND (&) operation is performed for each level with the
+          hardware's level version and a non-zero output for _all_ the levels in
+          a sub-group means the OPP is supported by hardware. A value of
+          0xFFFFFFFF for each level in the sub-group will enable the OPP for all
+          versions for the hardware.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        maxItems: 32
+        items:
+          minItems: 1
+          maxItems: 4
+
+      required-opps:
+        description:
+          This contains phandle to an OPP node in another device's OPP table. It
+          may contain an array of phandles, where each phandle points to an OPP
+          of a different device. It should not contain multiple phandles to the
+          OPP nodes in the same OPP table. This specifies the minimum required
+          OPP of the device(s), whose OPP's phandle is present in this property,
+          for the functioning of the current device at the current OPP (where
+          this property is present).
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+    patternProperties:
+      '^opp-microvolt-':
+        description:
+          Named opp-microvolt property. This is exactly similar to the above
+          opp-microvolt property, but allows multiple voltage ranges to be
+          provided for the same OPP. At runtime, the platform can pick a <name>
+          and matching opp-microvolt-<name> property will be enabled for all
+          OPPs. If the platform doesn't pick a specific <name> or the <name>
+          doesn't match with any opp-microvolt-<name> properties, then
+          opp-microvolt property shall be used, if present.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        minItems: 1
+        maxItems: 8   # Should be enough regulators
+        items:
+          minItems: 1
+          maxItems: 3
+
+      '^opp-microamp-':
+        description:
+          Named opp-microamp property. Similar to opp-microvolt-<name> property,
+          but for microamp instead.
+        items:
+          minItems: 1
+          maxItems: 3
+
+required:
+  - compatible
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/opp/opp-v2.yaml b/Documentation/devicetree/bindings/opp/opp-v2.yaml
new file mode 100644
index 000000000000..609f68db9610
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v2.yaml
@@ -0,0 +1,475 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic OPP (Operating Performance Points) Bindings
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+allOf:
+  - $ref: opp-v2-base.yaml#
+
+properties:
+  compatible:
+    const: operating-points-v2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /*
+     * Example 1: Single cluster Dual-core ARM cortex A9, switch DVFS states
+     * together.
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a9";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cpu0_opp_table0>;
+        };
+
+        cpu@1 {
+            compatible = "arm,cortex-a9";
+            device_type = "cpu";
+            reg = <1>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cpu0_opp_table0>;
+        };
+    };
+
+    cpu0_opp_table0: opp-table {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <975000 970000 985000>;
+            opp-microamp = <70000>;
+            clock-latency-ns = <300000>;
+            opp-suspend;
+        };
+        opp-1100000000 {
+            opp-hz = /bits/ 64 <1100000000>;
+            opp-microvolt = <1000000 980000 1010000>;
+            opp-microamp = <80000>;
+            clock-latency-ns = <310000>;
+        };
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt = <1025000>;
+            clock-latency-ns = <290000>;
+            turbo-mode;
+        };
+    };
+
+  - |
+    /*
+     * Example 2: Single cluster, Quad-core Qualcom-krait, switches DVFS states
+     * independently.
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+
+        cpu@1 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <1>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 1>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply1>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+
+        cpu@2 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <2>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 2>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply2>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+
+        cpu@3 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <3>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 3>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply3>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+    };
+
+    cpu_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        /*
+         * Missing opp-shared property means CPUs switch DVFS states
+         * independently.
+         */
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <975000 970000 985000>;
+            opp-microamp = <70000>;
+            clock-latency-ns = <300000>;
+            opp-suspend;
+        };
+        opp-1100000000 {
+            opp-hz = /bits/ 64 <1100000000>;
+            opp-microvolt = <1000000 980000 1010000>;
+            opp-microamp = <80000>;
+            clock-latency-ns = <310000>;
+        };
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt = <1025000>;
+            opp-microamp = <90000>;
+            lock-latency-ns = <290000>;
+            turbo-mode;
+        };
+    };
+
+  - |
+    /*
+     * Example 3: Dual-cluster, Dual-core per cluster. CPUs within a cluster switch
+     * DVFS state together.
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cluster0_opp>;
+        };
+
+        cpu@1 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <1>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cluster0_opp>;
+        };
+
+        cpu@100 {
+            compatible = "arm,cortex-a15";
+            device_type = "cpu";
+            reg = <100>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 1>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply1>;
+            operating-points-v2 = <&cluster1_opp>;
+        };
+
+        cpu@101 {
+            compatible = "arm,cortex-a15";
+            device_type = "cpu";
+            reg = <101>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 1>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply1>;
+            operating-points-v2 = <&cluster1_opp>;
+        };
+    };
+
+    cluster0_opp: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <975000 970000 985000>;
+            opp-microamp = <70000>;
+            clock-latency-ns = <300000>;
+            opp-suspend;
+        };
+        opp-1100000000 {
+            opp-hz = /bits/ 64 <1100000000>;
+            opp-microvolt = <1000000 980000 1010000>;
+            opp-microamp = <80000>;
+            clock-latency-ns = <310000>;
+        };
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt = <1025000>;
+            opp-microamp = <90000>;
+            clock-latency-ns = <290000>;
+            turbo-mode;
+        };
+    };
+
+    cluster1_opp: opp-table-1 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1300000000 {
+            opp-hz = /bits/ 64 <1300000000>;
+            opp-microvolt = <1050000 1045000 1055000>;
+            opp-microamp = <95000>;
+            clock-latency-ns = <400000>;
+            opp-suspend;
+        };
+        opp-1400000000 {
+            opp-hz = /bits/ 64 <1400000000>;
+            opp-microvolt = <1075000>;
+            opp-microamp = <100000>;
+            clock-latency-ns = <400000>;
+        };
+        opp-1500000000 {
+            opp-hz = /bits/ 64 <1500000000>;
+            opp-microvolt = <1100000 1010000 1110000>;
+            opp-microamp = <95000>;
+            clock-latency-ns = <400000>;
+            turbo-mode;
+        };
+    };
+
+  - |
+    /* Example 4: Handling multiple regulators */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "vendor,cpu-type";
+            device_type = "cpu";
+            reg = <0>;
+
+            vcc0-supply = <&cpu_supply0>;
+            vcc1-supply = <&cpu_supply1>;
+            vcc2-supply = <&cpu_supply2>;
+            operating-points-v2 = <&cpu0_opp_table4>;
+        };
+    };
+
+    cpu0_opp_table4: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <970000>, /* Supply 0 */
+                            <960000>, /* Supply 1 */
+                            <960000>; /* Supply 2 */
+            opp-microamp =  <70000>,  /* Supply 0 */
+                            <70000>,  /* Supply 1 */
+                            <70000>;  /* Supply 2 */
+            clock-latency-ns = <300000>;
+        };
+
+        /* OR */
+
+        opp-1000000001 {
+            opp-hz = /bits/ 64 <1000000001>;
+            opp-microvolt = <975000 970000 985000>, /* Supply 0 */
+                            <965000 960000 975000>, /* Supply 1 */
+                            <965000 960000 975000>; /* Supply 2 */
+            opp-microamp =  <70000>,    /* Supply 0 */
+                <70000>,    /* Supply 1 */
+                <70000>;    /* Supply 2 */
+            clock-latency-ns = <300000>;
+        };
+
+        /* OR */
+
+        opp-1000000002 {
+            opp-hz = /bits/ 64 <1000000002>;
+            opp-microvolt = <975000 970000 985000>, /* Supply 0 */
+                <965000 960000 975000>, /* Supply 1 */
+                <965000 960000 975000>; /* Supply 2 */
+            opp-microamp =  <70000>,    /* Supply 0 */
+                <0>,      /* Supply 1 doesn't need this */
+                <70000>;    /* Supply 2 */
+            clock-latency-ns = <300000>;
+        };
+    };
+
+  - |
+    /*
+     * Example 5: opp-supported-hw
+     * (example: three level hierarchy of versions: cuts, substrate and process)
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <0>;
+            cpu-supply = <&cpu_supply>;
+            operating-points-v2 = <&cpu0_opp_table_slow>;
+        };
+    };
+
+    cpu0_opp_table_slow: opp-table {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-600000000 {
+            /*
+             * Supports all substrate and process versions for 0xF
+             * cuts, i.e. only first four cuts.
+             */
+            opp-supported-hw = <0xF 0xFFFFFFFF 0xFFFFFFFF>;
+            opp-hz = /bits/ 64 <600000000>;
+        };
+
+        opp-800000000 {
+            /*
+             * Supports:
+             * - cuts: only one, 6th cut (represented by 6th bit).
+             * - substrate: supports 16 different substrate versions
+             * - process: supports 9 different process versions
+             */
+            opp-supported-hw = <0x20 0xff0000ff 0x0000f4f0>;
+            opp-hz = /bits/ 64 <800000000>;
+        };
+
+        opp-900000000 {
+            /*
+             * Supports:
+             * - All cuts and substrate where process version is 0x2.
+             * - All cuts and process where substrate version is 0x2.
+             */
+            opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0x02>,
+                               <0xFFFFFFFF 0x01 0xFFFFFFFF>;
+            opp-hz = /bits/ 64 <900000000>;
+        };
+    };
+
+  - |
+    /*
+     * Example 6: opp-microvolt-<name>, opp-microamp-<name>:
+     * (example: device with two possible microvolt ranges: slow and fast)
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <0>;
+            operating-points-v2 = <&cpu0_opp_table6>;
+        };
+    };
+
+    cpu0_opp_table6: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt-slow = <915000 900000 925000>;
+            opp-microvolt-fast = <975000 970000 985000>;
+            opp-microamp-slow =  <70000>;
+            opp-microamp-fast =  <71000>;
+        };
+
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt-slow = <915000 900000 925000>, /* Supply vcc0 */
+                                 <925000 910000 935000>; /* Supply vcc1 */
+            opp-microvolt-fast = <975000 970000 985000>, /* Supply vcc0 */
+                                 <965000 960000 975000>; /* Supply vcc1 */
+            opp-microamp =  <70000>; /* Will be used for both slow/fast */
+        };
+    };
+
+  - |
+    /*
+     * Example 7: Single cluster Quad-core ARM cortex A53, OPP points from firmware,
+     * distinct clock controls but two sets of clock/voltage/current lines.
+     */
+    cpus {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x100>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 0>;
+            operating-points-v2 = <&cpu_opp0_table>;
+        };
+        cpu@1 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x101>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 1>;
+            operating-points-v2 = <&cpu_opp0_table>;
+        };
+        cpu@2 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x102>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 2>;
+            operating-points-v2 = <&cpu_opp1_table>;
+        };
+        cpu@3 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x103>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 3>;
+            operating-points-v2 = <&cpu_opp1_table>;
+        };
+
+    };
+
+    cpu_opp0_table: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+    };
+
+    cpu_opp1_table: opp-table-1 {
+        compatible = "operating-points-v2";
+        opp-shared;
+    };
+...
diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
deleted file mode 100644
index 08b3da4736cf..000000000000
--- a/Documentation/devicetree/bindings/opp/opp.txt
+++ /dev/null
@@ -1,622 +0,0 @@
-Generic OPP (Operating Performance Points) Bindings
-----------------------------------------------------
-
-Devices work at voltage-current-frequency combinations and some implementations
-have the liberty of choosing these. These combinations are called Operating
-Performance Points aka OPPs. This document defines bindings for these OPPs
-applicable across wide range of devices. For illustration purpose, this document
-uses CPU as a device.
-
-This document contain multiple versions of OPP binding and only one of them
-should be used per device.
-
-Binding 1: operating-points
-============================
-
-This binding only supports voltage-frequency pairs.
-
-Properties:
-- operating-points: An array of 2-tuples items, and each item consists
-  of frequency and voltage like <freq-kHz vol-uV>.
-	freq: clock frequency in kHz
-	vol: voltage in microvolt
-
-Examples:
-
-cpu@0 {
-	compatible = "arm,cortex-a9";
-	reg = <0>;
-	next-level-cache = <&L2>;
-	operating-points = <
-		/* kHz    uV */
-		792000  1100000
-		396000  950000
-		198000  850000
-	>;
-};
-
-
-Binding 2: operating-points-v2
-============================
-
-* Property: operating-points-v2
-
-Devices supporting OPPs must set their "operating-points-v2" property with
-phandle to a OPP table in their DT node. The OPP core will use this phandle to
-find the operating points for the device.
-
-This can contain more than one phandle for power domain providers that provide
-multiple power domains. That is, one phandle for each power domain. If only one
-phandle is available, then the same OPP table will be used for all power domains
-provided by the power domain provider.
-
-If required, this can be extended for SoC vendor specific bindings. Such bindings
-should be documented as Documentation/devicetree/bindings/power/<vendor>-opp.txt
-and should have a compatible description like: "operating-points-v2-<vendor>".
-
-* OPP Table Node
-
-This describes the OPPs belonging to a device. This node can have following
-properties:
-
-Required properties:
-- compatible: Allow OPPs to express their compatibility. It should be:
-  "operating-points-v2".
-
-- OPP nodes: One or more OPP nodes describing voltage-current-frequency
-  combinations. Their name isn't significant but their phandle can be used to
-  reference an OPP. These are mandatory except for the case where the OPP table
-  is present only to indicate dependency between devices using the opp-shared
-  property.
-
-Optional properties:
-- opp-shared: Indicates that device nodes using this OPP Table Node's phandle
-  switch their DVFS state together, i.e. they share clock/voltage/current lines.
-  Missing property means devices have independent clock/voltage/current lines,
-  but they share OPP tables.
-
-- status: Marks the OPP table enabled/disabled.
-
-
-* OPP Node
-
-This defines voltage-current-frequency combinations along with other related
-properties.
-
-Required properties:
-- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
-  required property for all device nodes, unless another "required" property to
-  uniquely identify the OPP nodes exists. Devices like power domains must have
-  another (implementation dependent) property.
-
-- opp-peak-kBps: Peak bandwidth in kilobytes per second, expressed as an array
-  of 32-bit big-endian integers. Each element of the array represents the
-  peak bandwidth value of each interconnect path. The number of elements should
-  match the number of interconnect paths.
-
-Optional properties:
-- opp-microvolt: voltage in micro Volts.
-
-  A single regulator's voltage is specified with an array of size one or three.
-  Single entry is for target voltage and three entries are for <target min max>
-  voltages.
-
-  Entries for multiple regulators shall be provided in the same field separated
-  by angular brackets <>. The OPP binding doesn't provide any provisions to
-  relate the values to their power supplies or the order in which the supplies
-  need to be configured and that is left for the implementation specific
-  binding.
-
-  Entries for all regulators shall be of the same size, i.e. either all use a
-  single value or triplets.
-
-- opp-microvolt-<name>: Named opp-microvolt property. This is exactly similar to
-  the above opp-microvolt property, but allows multiple voltage ranges to be
-  provided for the same OPP. At runtime, the platform can pick a <name> and
-  matching opp-microvolt-<name> property will be enabled for all OPPs. If the
-  platform doesn't pick a specific <name> or the <name> doesn't match with any
-  opp-microvolt-<name> properties, then opp-microvolt property shall be used, if
-  present.
-
-- opp-microamp: The maximum current drawn by the device in microamperes
-  considering system specific parameters (such as transients, process, aging,
-  maximum operating temperature range etc.) as necessary. This may be used to
-  set the most efficient regulator operating mode.
-
-  Should only be set if opp-microvolt is set for the OPP.
-
-  Entries for multiple regulators shall be provided in the same field separated
-  by angular brackets <>. If current values aren't required for a regulator,
-  then it shall be filled with 0. If current values aren't required for any of
-  the regulators, then this field is not required. The OPP binding doesn't
-  provide any provisions to relate the values to their power supplies or the
-  order in which the supplies need to be configured and that is left for the
-  implementation specific binding.
-
-- opp-microamp-<name>: Named opp-microamp property. Similar to
-  opp-microvolt-<name> property, but for microamp instead.
-
-- opp-level: A value representing the performance level of the device,
-  expressed as a 32-bit integer.
-
-- opp-avg-kBps: Average bandwidth in kilobytes per second, expressed as an array
-  of 32-bit big-endian integers. Each element of the array represents the
-  average bandwidth value of each interconnect path. The number of elements
-  should match the number of interconnect paths. This property is only
-  meaningful in OPP tables where opp-peak-kBps is present.
-
-- clock-latency-ns: Specifies the maximum possible transition latency (in
-  nanoseconds) for switching to this OPP from any other OPP.
-
-- turbo-mode: Marks the OPP to be used only for turbo modes. Turbo mode is
-  available on some platforms, where the device can run over its operating
-  frequency for a short duration of time limited by the device's power, current
-  and thermal limits.
-
-- opp-suspend: Marks the OPP to be used during device suspend. If multiple OPPs
-  in the table have this, the OPP with highest opp-hz will be used.
-
-- opp-supported-hw: This property allows a platform to enable only a subset of
-  the OPPs from the larger set present in the OPP table, based on the current
-  version of the hardware (already known to the operating system).
-
-  Each block present in the array of blocks in this property, represents a
-  sub-group of hardware versions supported by the OPP. i.e. <sub-group A>,
-  <sub-group B>, etc. The OPP will be enabled if _any_ of these sub-groups match
-  the hardware's version.
-
-  Each sub-group is a platform defined array representing the hierarchy of
-  hardware versions supported by the platform. For a platform with three
-  hierarchical levels of version (X.Y.Z), this field shall look like
-
-  opp-supported-hw = <X1 Y1 Z1>, <X2 Y2 Z2>, <X3 Y3 Z3>.
-
-  Each level (eg. X1) in version hierarchy is represented by a 32 bit value, one
-  bit per version and so there can be maximum 32 versions per level. Logical AND
-  (&) operation is performed for each level with the hardware's level version
-  and a non-zero output for _all_ the levels in a sub-group means the OPP is
-  supported by hardware. A value of 0xFFFFFFFF for each level in the sub-group
-  will enable the OPP for all versions for the hardware.
-
-- status: Marks the node enabled/disabled.
-
-- required-opps: This contains phandle to an OPP node in another device's OPP
-  table. It may contain an array of phandles, where each phandle points to an
-  OPP of a different device. It should not contain multiple phandles to the OPP
-  nodes in the same OPP table. This specifies the minimum required OPP of the
-  device(s), whose OPP's phandle is present in this property, for the
-  functioning of the current device at the current OPP (where this property is
-  present).
-
-Example 1: Single cluster Dual-core ARM cortex A9, switch DVFS states together.
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "arm,cortex-a9";
-			reg = <0>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-
-		cpu@1 {
-			compatible = "arm,cortex-a9";
-			reg = <1>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>;
-			opp-microamp = <70000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1000000 980000 1010000>;
-			opp-microamp = <80000>;
-			clock-latency-ns = <310000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1025000>;
-			clock-latency-ns = <290000>;
-			turbo-mode;
-		};
-	};
-};
-
-Example 2: Single cluster, Quad-core Qualcom-krait, switches DVFS states
-independently.
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "qcom,krait";
-			reg = <0>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-
-		cpu@1 {
-			compatible = "qcom,krait";
-			reg = <1>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 1>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply1>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-
-		cpu@2 {
-			compatible = "qcom,krait";
-			reg = <2>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 2>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply2>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-
-		cpu@3 {
-			compatible = "qcom,krait";
-			reg = <3>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 3>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply3>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-	};
-
-	cpu_opp_table: opp_table {
-		compatible = "operating-points-v2";
-
-		/*
-		 * Missing opp-shared property means CPUs switch DVFS states
-		 * independently.
-		 */
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>;
-			opp-microamp = <70000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1000000 980000 1010000>;
-			opp-microamp = <80000>;
-			clock-latency-ns = <310000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1025000>;
-			opp-microamp = <90000;
-			lock-latency-ns = <290000>;
-			turbo-mode;
-		};
-	};
-};
-
-Example 3: Dual-cluster, Dual-core per cluster. CPUs within a cluster switch
-DVFS state together.
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "arm,cortex-a7";
-			reg = <0>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		cpu@1 {
-			compatible = "arm,cortex-a7";
-			reg = <1>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		cpu@100 {
-			compatible = "arm,cortex-a15";
-			reg = <100>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 1>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply1>;
-			operating-points-v2 = <&cluster1_opp>;
-		};
-
-		cpu@101 {
-			compatible = "arm,cortex-a15";
-			reg = <101>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 1>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply1>;
-			operating-points-v2 = <&cluster1_opp>;
-		};
-	};
-
-	cluster0_opp: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>;
-			opp-microamp = <70000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1000000 980000 1010000>;
-			opp-microamp = <80000>;
-			clock-latency-ns = <310000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1025000>;
-			opp-microamp = <90000>;
-			clock-latency-ns = <290000>;
-			turbo-mode;
-		};
-	};
-
-	cluster1_opp: opp_table1 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1300000000 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1050000 1045000 1055000>;
-			opp-microamp = <95000>;
-			clock-latency-ns = <400000>;
-			opp-suspend;
-		};
-		opp-1400000000 {
-			opp-hz = /bits/ 64 <1400000000>;
-			opp-microvolt = <1075000>;
-			opp-microamp = <100000>;
-			clock-latency-ns = <400000>;
-		};
-		opp-1500000000 {
-			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <1100000 1010000 1110000>;
-			opp-microamp = <95000>;
-			clock-latency-ns = <400000>;
-			turbo-mode;
-		};
-	};
-};
-
-Example 4: Handling multiple regulators
-
-/ {
-	cpus {
-		cpu@0 {
-			compatible = "vendor,cpu-type";
-			...
-
-			vcc0-supply = <&cpu_supply0>;
-			vcc1-supply = <&cpu_supply1>;
-			vcc2-supply = <&cpu_supply2>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <970000>, /* Supply 0 */
-					<960000>, /* Supply 1 */
-					<960000>; /* Supply 2 */
-			opp-microamp =  <70000>,  /* Supply 0 */
-					<70000>,  /* Supply 1 */
-					<70000>;  /* Supply 2 */
-			clock-latency-ns = <300000>;
-		};
-
-		/* OR */
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>, /* Supply 0 */
-					<965000 960000 975000>, /* Supply 1 */
-					<965000 960000 975000>; /* Supply 2 */
-			opp-microamp =  <70000>,		/* Supply 0 */
-					<70000>,		/* Supply 1 */
-					<70000>;		/* Supply 2 */
-			clock-latency-ns = <300000>;
-		};
-
-		/* OR */
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>, /* Supply 0 */
-					<965000 960000 975000>, /* Supply 1 */
-					<965000 960000 975000>; /* Supply 2 */
-			opp-microamp =  <70000>,		/* Supply 0 */
-					<0>,			/* Supply 1 doesn't need this */
-					<70000>;		/* Supply 2 */
-			clock-latency-ns = <300000>;
-		};
-	};
-};
-
-Example 5: opp-supported-hw
-(example: three level hierarchy of versions: cuts, substrate and process)
-
-/ {
-	cpus {
-		cpu@0 {
-			compatible = "arm,cortex-a7";
-			...
-
-			cpu-supply = <&cpu_supply>
-			operating-points-v2 = <&cpu0_opp_table_slow>;
-		};
-	};
-
-	opp_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-600000000 {
-			/*
-			 * Supports all substrate and process versions for 0xF
-			 * cuts, i.e. only first four cuts.
-			 */
-			opp-supported-hw = <0xF 0xFFFFFFFF 0xFFFFFFFF>
-			opp-hz = /bits/ 64 <600000000>;
-			...
-		};
-
-		opp-800000000 {
-			/*
-			 * Supports:
-			 * - cuts: only one, 6th cut (represented by 6th bit).
-			 * - substrate: supports 16 different substrate versions
-			 * - process: supports 9 different process versions
-			 */
-			opp-supported-hw = <0x20 0xff0000ff 0x0000f4f0>
-			opp-hz = /bits/ 64 <800000000>;
-			...
-		};
-
-		opp-900000000 {
-			/*
-			 * Supports:
-			 * - All cuts and substrate where process version is 0x2.
-			 * - All cuts and process where substrate version is 0x2.
-			 */
-			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0x02>, <0xFFFFFFFF 0x01 0xFFFFFFFF>
-			opp-hz = /bits/ 64 <900000000>;
-			...
-		};
-	};
-};
-
-Example 6: opp-microvolt-<name>, opp-microamp-<name>:
-(example: device with two possible microvolt ranges: slow and fast)
-
-/ {
-	cpus {
-		cpu@0 {
-			compatible = "arm,cortex-a7";
-			...
-
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt-slow = <915000 900000 925000>;
-			opp-microvolt-fast = <975000 970000 985000>;
-			opp-microamp-slow =  <70000>;
-			opp-microamp-fast =  <71000>;
-		};
-
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt-slow = <915000 900000 925000>, /* Supply vcc0 */
-					      <925000 910000 935000>; /* Supply vcc1 */
-			opp-microvolt-fast = <975000 970000 985000>, /* Supply vcc0 */
-					     <965000 960000 975000>; /* Supply vcc1 */
-			opp-microamp =  <70000>; /* Will be used for both slow/fast */
-		};
-	};
-};
-
-Example 7: Single cluster Quad-core ARM cortex A53, OPP points from firmware,
-distinct clock controls but two sets of clock/voltage/current lines.
-
-/ {
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x100>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 0>;
-			operating-points-v2 = <&cpu_opp0_table>;
-		};
-		cpu@1 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x101>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 1>;
-			operating-points-v2 = <&cpu_opp0_table>;
-		};
-		cpu@2 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x102>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 2>;
-			operating-points-v2 = <&cpu_opp1_table>;
-		};
-		cpu@3 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x103>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 3>;
-			operating-points-v2 = <&cpu_opp1_table>;
-		};
-
-	};
-
-	cpu_opp0_table: opp0_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-	};
-
-	cpu_opp1_table: opp1_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-	};
-};
-- 
2.27.0

