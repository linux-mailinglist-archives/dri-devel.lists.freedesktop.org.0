Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482A917CD7B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750E76E134;
	Sat,  7 Mar 2020 10:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FCB6ECE5;
 Fri,  6 Mar 2020 11:37:07 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Mar 2020 17:06:24 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Mar 2020 17:06:05 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id B94304495; Fri,  6 Mar 2020 17:06:03 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] dt-bindings: msm: disp: add yaml schemas for DPU and DSI bindings
Date: Fri,  6 Mar 2020 17:06:00 +0530
Message-Id: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM Mobile Display Subsytem(MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema
for the device tree bindings for the same.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 .../bindings/display/msm/dpu-sc7180.yaml           | 269 +++++++++++++++
 .../bindings/display/msm/dpu-sdm845.yaml           | 265 +++++++++++++++
 .../bindings/display/msm/dsi-sc7180.yaml           | 369 +++++++++++++++++++++
 .../bindings/display/msm/dsi-sdm845.yaml           | 369 +++++++++++++++++++++
 4 files changed, 1272 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
new file mode 100644
index 0000000..3d1d9b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -0,0 +1,269 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display Dpu dt properties.
+
+maintainers:
+ - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+ Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
+ sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+ bindings of MDSS and DPU are mentioned for SC7180 target.
+
+properties:
+ "mdss":
+  type: object
+  description: |
+   Node containing MDSS that encapsulated sub-blocks like DPU, DSI and DP
+   interfaces.
+
+  properties:
+   compatible:
+    items:
+     - const: qcom,sc7180-mdss
+   reg:
+    description: |
+     Physical base address and length of controller's registers.
+
+   reg-names:
+    description: |
+     Names for different register regions defined above. The required region
+     is mentioned below.
+    items:
+     - const: mdss
+
+   power-domains:
+    description: |
+     A power domain consumer specifier according to
+     Documentation/devicetree/bindings/power/power_domain.txt.
+
+   clocks:
+    description: |
+     List of clock specifiers for clocks needed by the device.
+
+   clock-names:
+    description: |
+     Device clock names in the same order as mentioned in clocks property.
+     The required clocks are mentioned below.
+    items:
+     - const: iface
+     - const: bus
+     - const: ahb
+     - const: core
+
+   interrupts:
+    description: |
+     Interrupt signal from MDSS.
+
+   interrupt-controller:
+    description: |
+     Identifies the node as an interrupt controller.
+
+   "#interrupt-cells":
+    description: |
+     Specifies the number of cells needed to encode an interrupt source.
+    const: 1
+
+   iommus:
+    description: |
+     Phandle of iommu device node.
+
+   "#address-cells":
+    description: |
+     Indicate how many cells (32 bits values) are needed to form the base
+     address part in the reg property.
+
+   "#size-cells":
+    description: |
+     Indicate how many cells (32 bits values) are needed to specify the size
+     part in the reg property.
+
+   ranges:
+    description: |
+     Parent bus address space is the same as the child bus address space.
+
+   interconnects :
+    description: |
+     Interconnect path specifier for MDSS according to
+     Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
+     2 paths corresponding to 2 AXI ports.
+
+   interconnect-names:
+    description: |
+     MDSS will have 2 port names to differentiate between the
+     2 interconnect paths defined with interconnect specifier.
+
+   properties:
+    description: |
+     Optional properties for MDSS.
+
+     assigned-clocks:
+      description: |
+       List of clock specifiers for clocks needing rate assignment.
+
+     assigned-clock-rates:
+      description: |
+       List of clock frequencies sorted in the same order as the assigned-clocks
+       property.
+
+   "mdp":
+    type: object
+    description: |
+     Node containing the properties of DPU.
+    properties:
+     compatible:
+      items:
+       - const: qcom,sc7180-dpu
+
+     reg:
+      description: |
+       Physical base address and length of controller's registers.
+
+     reg-names:
+      description: |
+       Register region names. The following regions are required.
+      items:
+        - const: mdp
+        - const: vbif
+
+     clocks:
+      description: |
+       List of clock specifiers for clocks needed by the device.
+
+     clock-names:
+      description: |
+       Device clock names, must be in same order as clocks property.
+       The following clocks are required. "bus" is an optional property
+       in sc7180 due to architecture change.
+      items:
+        - const: iface
+        - const: core
+        - const: vsync
+
+     interrupts:
+      description: |
+       Interrupt line from DPU to MDSS.
+
+     ports:
+      type: object
+      description: |
+       Contains the list of output ports from DPU device. These ports connect
+       to interfaces that are external to the DPU hardware, such as DSI, DP etc.
+       Each output port contains an endpoint that describes how it is connected
+       to an external interface. These are described by the standard properties
+       documented in files mentioned below.
+
+       Documentation/devicetree/bindings/graph.txt
+       Documentation/devicetree/bindings/media/video-interfaces.txt
+
+      properties:
+       port0:
+        type: object
+        description: |
+         DPU_INTF1 (DSI1)
+       port1:
+        type: object
+        description: |
+         DPU_INTF2 (DSI2)
+
+     properties:
+      description: |
+       Optional properties for DPU.
+
+       assigned-clocks:
+        description: |
+         List of clock specifiers for clocks needing rate assignment.
+
+       assigned-clock-rates:
+        description: |
+         List of clock frequencies sorted in the same order as the
+         assigned-clocks property.
+
+       clock-names:
+        description: |
+         Optional device clocks, needed for accessing LUT blocks.
+        items:
+         - const: rot
+         - const: lut
+
+required:
+ - compatible
+ - reg
+ - reg-names
+ - power-domains
+ - clocks
+ - clock-names
+ - interrupts
+ - interrupt-controller
+ - iommus
+ - ports
+
+examples:
+- |
+    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+    mdss: mdss@ae00000 {
+         compatible = "qcom,sc7180-mdss";
+         reg = <0xae00000 0x1000>;
+         reg-names = "mdss";
+         power-domains = <&clock_dispcc 0>;
+         clocks = <&gcc GCC_DISP_AHB_CLK>,
+                  <&gcc GCC_DISP_HF_AXI_CLK>,
+                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
+         clock-names = "iface", "gcc_bus", "core";
+         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+         assigned-clock-rates = <300000000>;
+
+         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+         interrupt-controller;
+         #interrupt-cells = <1>;
+
+         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+
+         interconnect-names = "mdp0-mem";
+
+         iommus = <&apps_smmu 0x800 0x2>;
+
+         #address-cells = <2>;
+         #size-cells = <2>;
+
+         mdss_mdp: mdp@ae01000 {
+                   compatible = "qcom,sc7180-dpu";
+                   reg = <0 0x0ae01000 0 0x8f000>,
+                         <0 0x0aeb0000 0 0x2008>,
+                         <0 0x0af03000 0 0x16>;
+                   reg-names = "mdp", "vbif", "disp_cc";
+
+                   clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                   clock-names = "iface", "rot", "lut", "core",
+                                                "vsync";
+                   assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                   assigned-clock-rates = <300000000>, <19200000>;
+                   interrupt-parent = <&mdss>;
+                   interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+                   ports {
+                           #address-cells = <1>;
+                           #size-cells = <0>;
+
+                           port@0 {
+                                   reg = <0>;
+                                   dpu_intf1_out: endpoint {
+                                                  remote-endpoint = <&dsi0_in>;
+                                   };
+                           };
+                   };
+         };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
new file mode 100644
index 0000000..2353604
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -0,0 +1,265 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display Dpu dt properties.
+
+maintainers:
+ - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+ Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
+ sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+ bindings of MDSS and DPU are mentioned for SDM845 target.
+
+properties:
+ "mdss":
+  type: object
+  description: |
+   Node containing MDSS that encapsulated sub-blocks like DPU, DSI and DP
+   interfaces
+  properties:
+   compatible:
+    items:
+     - const: qcom,sdm845-mdss
+   reg:
+    description: |
+     Physical base address and length of controller's registers.
+
+   reg-names:
+    description: |
+     Names for different register regions defined above. The required region
+     is mentioned below.
+    items:
+     - const: mdss
+
+   power-domains:
+    description: |
+     A power domain consumer specifier according to
+     Documentation/devicetree/bindings/power/power_domain.txt.
+
+   clocks:
+    description: |
+     List of clock specifiers for clocks needed by the device.
+
+   clock-names:
+    description: |
+     Device clock names in the same order as mentioned in clocks property.
+     The required clocks are mentioned below.
+    items:
+     - const: iface
+     - const: bus
+     - const: core
+
+   interrupts:
+    description: |
+     Interrupt signal from MDSS.
+
+   interrupt-controller:
+    description: |
+     Identifies the node as an interrupt controller.
+
+   "#interrupt-cells":
+    description: |
+     Specifies the number of cells needed to encode an interrupt source.
+    const: 1
+
+   iommus:
+    description: |
+     Phandle of iommu device node.
+
+   "#address-cells":
+    description: |
+     Indicate how many cells (32 bits values) are needed to form the base
+     address part in the reg property.
+
+   "#size-cells":
+    description: |
+     Indicate how many cells (32 bits values) are needed to specify the size
+     part in the reg property.
+
+   ranges:
+    description: |
+     Parent bus address space is the same as the child bus address space.
+
+   interconnects :
+    description: |
+     Interconnect path specifier for MDSS according to
+     Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
+     2 paths corresponding to 2 AXI ports.
+
+   interconnect-names:
+    description: |
+     MDSS will have 2 port names to differentiate between the
+     2 interconnect paths defined with interconnect specifier.
+
+   properties:
+    description: |
+     Optional properties for MDSS.
+
+     assigned-clocks:
+      description: |
+       List of clock specifiers for clocks needing rate assignment.
+
+     assigned-clock-rates:
+      description: |
+       List of clock frequencies sorted in the same order as the assigned-clocks
+       property.
+
+   "mdp":
+    type: object
+    description: |
+     Node containing the properties of DPU.
+    properties:
+     compatible:
+      items:
+       - const: qcom,sdm845-dpu
+
+     reg:
+      description: |
+       Physical base address and length of controller's registers.
+
+     reg-names:
+      description: |
+       Register region names. The following regions are required.
+      items:
+        - const: mdp
+        - const: vbif
+
+     clocks:
+      description: |
+       List of clock specifiers for clocks needed by the device.
+
+     clock-names:
+      description: |
+       Device clock names, must be in same order as clocks property.
+       The following clocks are required.
+      items:
+        - const: bus
+        - const: iface
+        - const: core
+        - const: vsync
+
+     interrupts:
+      description: |
+       Interrupt line from DPU to MDSS.
+
+     ports:
+      type: object
+      description: |
+       Contains the list of output ports from DPU device. These ports connect
+       to interfaces that are external to the DPU hardware, such as DSI, DP etc.
+       Each output port contains an endpoint that describes how it is connected
+       to an external interface. These are described by the standard properties
+       documented in files mentioned below.
+
+       Documentation/devicetree/bindings/graph.txt
+       Documentation/devicetree/bindings/media/video-interfaces.txt
+
+      properties:
+       port0:
+        type: object
+        description: |
+         DPU_INTF1 (DSI1)
+       port1:
+        type: object
+        description: |
+         DPU_INTF2 (DSI2)
+
+     properties:
+      description: |
+       Optional properties for DPU.
+
+       assigned-clocks:
+        description: |
+         List of clock specifiers for clocks needing rate assignment.
+
+       assigned-clock-rates:
+        description: |
+         List of clock frequencies sorted in the same order as the
+         assigned-clocks property.
+
+required:
+ - compatible
+ - reg
+ - reg-names
+ - power-domains
+ - clocks
+ - clock-names
+ - interrupts
+ - interrupt-controller
+ - iommus
+ - ports
+
+examples:
+- |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdss: mdss@ae00000 {
+          compatible = "qcom,sdm845-mdss";
+          reg = <0 0x0ae00000 0 0x1000>;
+          reg-names = "mdss";
+          power-domains = <&dispcc MDSS_GDSC>;
+
+          clocks = <&gcc GCC_DISP_AHB_CLK>,
+                   <&gcc GCC_DISP_AXI_CLK>,
+                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
+          clock-names = "iface", "bus", "core";
+
+          assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+          assigned-clock-rates = <300000000>;
+
+          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          iommus = <&apps_smmu 0x880 0x8>,
+                   <&apps_smmu 0xc80 0x8>;
+
+          #address-cells = <2>;
+          #size-cells = <2>;
+
+          mdss_mdp: mdp@ae01000 {
+                    compatible = "qcom,sdm845-dpu";
+                    reg = <0 0x0ae01000 0 0x8f000>,
+                          <0 0x0aeb0000 0 0x2008>;
+                    reg-names = "mdp", "vbif";
+
+                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                    clock-names = "iface", "bus", "core", "vsync";
+
+                    assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                                      <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                    assigned-clock-rates = <300000000>,
+                                           <19200000>;
+
+                    interrupt-parent = <&mdss>;
+                    interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+                    ports {
+                           #address-cells = <1>;
+                           #size-cells = <0>;
+
+                           port@0 {
+                                   reg = <0>;
+                                   dpu_intf1_out: endpoint {
+                                                  remote-endpoint = <&dsi0_in>;
+                                   };
+                           };
+
+                           port@1 {
+                                   reg = <1>;
+                                   dpu_intf2_out: endpoint {
+                                                  remote-endpoint = <&dsi1_in>;
+                                   };
+                           };
+                    };
+          };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml
new file mode 100644
index 0000000..5cc7452
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml
@@ -0,0 +1,369 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI interface dt properties.
+
+maintainers:
+ - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+ Device tree bindings for DSI controller and DSI PHY for SC7180 target.
+
+properties:
+ "dsi-controller":
+  type: object
+  description: |
+   Node containing the properties of dsi controller.
+  properties:
+   compatible:
+    items:
+     - const: qcom,mdss-dsi-ctrl
+   reg:
+    description: |
+     Physical base address and length of registers of controller.
+
+   reg-names:
+    description: |
+     Names for different register regions defined above. The required region
+     is mentioned below.
+    items:
+     - const: dsi_ctrl
+
+   clocks:
+    description: |
+     Phandles to device clocks.
+
+   clock-names:
+    description: |
+     Device clock names in the same order as mentioned in clocks property.
+     The required clocks are mentioned below. For DSIv2, we need an
+     additional clock "src" and for DSI6G v2.0 onwards we need
+     "byte_intf" clock.
+    items:
+     - const: iface
+     - const: bus
+     - const: byte
+     - const: pixel
+     - const: core
+
+   assigned-clocks:
+    description: |
+     Parents of "byte" and "pixel" for the given platform.
+
+   assigned-clock-parents:
+    description: |
+     The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
+     Details on clock bindings are mentioned in
+     Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+   vdd-supply:
+    description: |
+     Phandle to vdd regulator device node
+
+   vddio-supply:
+    description: |
+     Phandle to vdd-io regulator device node
+
+   vdda-supply:
+    description: |
+     Phandle to vdda regulator device node
+
+   phys:
+    description: |
+     Phandle to DSI PHY device node
+
+   phy-names:
+    description: |
+     Name of the corresponding PHY device
+
+   syscon-sfpb:
+    description: |
+     A phandle to mmss_sfpb syscon node (only for DSIv2)
+
+   ports:
+    description: |
+     Contains 2 DSI controller ports as child nodes. Each port contains
+     an endpoint subnode as defined in
+     Documentation/devicetree/bindings/graph.txt and
+     Documentation/devicetree/bindings/media/video-interfaces.txt
+
+   properties:
+    description: |
+     These are the Optional properties for DSI controller.
+
+     panel@0:
+      description: |
+       Node of panel connected to this DSI controller.
+       See files in Documentation/devicetree/bindings/display/panel/
+       for each supported panel.
+
+     qcom,dual-dsi-mode:
+      description: |
+       Boolean value indicating if the DSI controller is
+       driving a panel which needs 2 DSI links.
+
+     qcom,master-dsi:
+      description: |
+       Boolean value indicating if the DSI controller is driving
+       the master link of the 2-DSI panel.
+
+     qcom,sync-dual-dsi:
+      description: |
+       Boolean value indicating if the DSI controller is
+       driving a 2-DSI panel whose 2 links need receive command simultaneously.
+
+     pinctrl-names:
+      description: The pin control state names; should contain "default"
+
+     pinctrl-0:
+      description: The default pinctrl state (active)
+
+     pinctrl-n:
+      description: The "sleep" pinctrl state
+
+     ports:
+      description: |
+       Contains DSI controller input and output ports as children, each
+       containing one endpoint subnode.
+
+     properties:
+      description: DSI Endpoint properties
+
+      remote-endpoint:
+       description: |
+        For port@0, set to phandle of the connected panel/bridge's
+        input endpoint. For port@1, set to the MDP interface output.
+        See Documentation/devicetree/bindings/graph.txt for
+        device graph info.
+
+      data-lanes:
+       description: |
+        This describes how the physical DSI data lanes are mapped
+        to the logical lanes on the given platform. The value contained in
+        index n describes what physical lane is mapped to the logical lane n
+        (DATAn, where n lies between 0 and 3). The clock lane position is fixed
+        and can't be changed. Hence, they aren't a part of the DT bindings. See
+        Documentation/devicetree/bindings/media/video-interfaces.txt for
+        more info on the data-lanes property.
+
+        For example:
+
+        data-lanes = <3 0 1 2>;
+
+        The above mapping describes that the logical data lane DATA0 is mapped
+        to the physical data lane DATA3, logical DATA1 to physical DATA0,
+        logic DATA2 to phys DATA1 and logic DATA3 to phys DATA2. There are
+        only a limited number of physical to logical mappings possible.
+       oneOf:
+        - const: <0 1 2 3>
+        - const: <1 2 3 0>
+        - const: <2 3 0 1>
+        - const: <3 0 1 2>
+        - const: <0 3 2 1>
+        - const: <1 0 3 2>
+        - const: <2 1 0 3>
+        - const: <3 2 1 0>
+
+     qcom,mdss-mdp-transfer-time-us:
+      description: |
+       Specifies the dsi transfer time for command mode
+       panels in microseconds. Driver uses this number to adjust
+       the clock rate according to the expected transfer time.
+       Increasing this value would slow down the mdp processing
+       and can result in slower performance.
+       Decreasing this value can speed up the mdp processing,
+       but this can also impact power consumption.
+       As a rule this time should not be higher than the time
+       that would be expected with the processing at the
+       dsi link rate since anyways this would be the maximum
+       transfer time that could be achieved.
+       If ping pong split is enabled, this time should not be higher
+       than two times the dsi link rate time.
+       If the property is not specified, then the default value is 14000 us.
+       This is an optional property.
+
+ "dsi_phy":
+  type: object
+  description: Node containing the properties of DSI PHY
+  properties:
+   compatible:
+    oneOf:
+     - const: qcom,dsi-phy-28nm-hpm
+     - const: qcom,dsi-phy-28nm-lp
+     - const: qcom,dsi-phy-20nm
+     - const: qcom,dsi-phy-28nm-8960
+     - const: qcom,dsi-phy-14nm
+     - const: qcom,dsi-phy-10nm
+     - const: qcom,dsi-phy-10nm-8998
+
+   reg:
+    description: |
+     Physical base address and length of the registers of PLL, PHY. Some
+     revisions require the PHY regulator base address, whereas others
+     require the PHY lane base address. See below for each PHY revision.
+
+   reg-names:
+    description: Name of register regions.
+    oneOf:
+     - description: |
+        Following regions are required for DSI 28nm HPM/LP/8960 PHYs and
+        20nm PHY.
+       items:
+        - const: dsi_pll
+        - const: dsi_phy
+        - const: dsi_phy_regulator
+
+     - description: |
+         Following regions are required for DSI 14nm and 10nm PHYs:
+       items:
+        - const: dsi_pll
+        - const: dsi_phy
+        - const: dsi_phy_lane
+
+   clock-cells:
+    description: |
+     The DSI PHY block acts as a clock provider, creating
+     2 clocks: A byte clock (index 0), and a pixel clock (index 1).
+    const: 1
+
+   power-domains:
+    description: Should be <&mmcc MDSS_GDSC>.
+
+   clocks:
+    description: |
+     Phandles to device clocks. See
+     Documentation/devicetree/bindings/clock/clock-bindings.txt
+     for details on clock bindings.
+
+   clock-names:
+    description: |
+     The following clocks are required.
+     "iface"
+     "ref" (only required for new DTS files/entries)
+
+   vddio-supply:
+    description: |
+     Phandle to vdd-io regulator device node. Required for 28nm HPM/LP,
+     28nm 8960 PHYs and 20nm PHY.
+
+   vcca-supply:
+    description: |
+     Phandle to vcca regulator device node. Required for 20nm PHY and
+     10nm PHY.
+
+   vdds-supply:
+    description: |
+     Phandle to vdds regulator device node. Required for 10nm PHY.
+
+   properties:
+    description: |
+     These are the optional properties for DSI PHY.
+
+     qcom,dsi-phy-regulator-ldo-mode:
+      description: |
+       Boolean value indicating if the LDO mode PHY regulator is wanted.
+
+examples:
+- |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+
+     dsi0: dsi@fd922800 {
+           compatible = "qcom,mdss-dsi-ctrl";
+           qcom,dsi-host-index = <0>;
+           interrupt-parent = <&mdp>;
+           interrupts = <4 0>;
+           reg-names = "dsi_ctrl";
+           reg = <0xfd922800 0x200>;
+           power-domains = <&mmcc MDSS_GDSC>;
+
+           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    <&gcc GCC_DISP_HF_AXI_CLK>;
+           clock-names = "byte",
+                         "byte_intf",
+                         "pixel",
+                         "core",
+                         "iface",
+                         "bus";
+           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                             <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+           assigned-clock-parents = <&dsi_phy0 0>,
+                                    <&dsi_phy0 1>;
+
+           vdda-supply = <&pma8084_l2>;
+           vdd-supply = <&pma8084_l22>;
+           vddio-supply = <&pma8084_l12>;
+
+           phys = <&dsi_phy0>;
+           phy-names ="dsi-phy";
+
+           qcom,dual-dsi-mode;
+           qcom,master-dsi;
+           qcom,sync-dual-dsi;
+
+           qcom,mdss-mdp-transfer-time-us = <12000>;
+
+           pinctrl-names = "default", "sleep";
+           pinctrl-0 = <&dsi_active>;
+           pinctrl-1 = <&dsi_suspend>;
+
+           ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               port@0 {
+                      reg = <0>;
+                      dsi0_in: endpoint {
+                               remote-endpoint = <&mdp_intf1_out>;
+                      };
+               };
+
+               port@1 {
+                      reg = <1>;
+                      dsi0_out: endpoint {
+                                remote-endpoint = <&panel_in>;
+                                data-lanes = <0 1 2 3>;
+                      };
+               };
+           };
+
+           panel: panel@0 {
+                  compatible = "sharp,lq101r1sx01";
+                  link2 = <&secondary>;
+
+                  port {
+                       panel_in: endpoint {
+                                 remote-endpoint = <&dsi0_out>;
+                       };
+                  };
+           };
+     };
+
+     dsi_phy0: dsi-phy@fd922a00 {
+               compatible = "qcom,dsi-phy-28nm-hpm";
+               qcom,dsi-phy-index = <0>;
+               reg-names =
+                        "dsi_pll",
+                        "dsi_phy",
+                        "dsi_phy_regulator";
+               reg =   <0xfd922a00 0xd4>,
+                       <0xfd922b00 0x2b0>,
+                       <0xfd922d80 0x7b>;
+               clock-names = "iface";
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+               vddio-supply = <&pma8084_l12>;
+
+               qcom,dsi-phy-regulator-ldo-mode;
+     };
+...
+
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml
new file mode 100644
index 0000000..e8a0ba9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml
@@ -0,0 +1,369 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI interface dt properties.
+
+maintainers:
+ - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+ Device tree bindings for DSI controller and DSI PHY for SDM845 target.
+
+properties:
+ "dsi-controller":
+  type: object
+  description: |
+   Node containing the properties of dsi controller.
+  properties:
+   compatible:
+    items:
+     - const: qcom,mdss-dsi-ctrl
+   reg:
+    description: |
+     Physical base address and length of registers of controller.
+
+   reg-names:
+    description: |
+     Names for different register regions defined above. The required region
+     is mentioned below.
+    items:
+     - const: dsi_ctrl
+
+   clocks:
+    description: |
+     Phandles to device clocks.
+
+   clock-names:
+    description: |
+     Device clock names in the same order as mentioned in clocks property.
+     The required clocks are mentioned below. For DSIv2, we need an
+     additional clock "src" and for DSI6G v2.0 onwards we need
+     "byte_intf" clock.
+    items:
+     - const: iface
+     - const: bus
+     - const: byte
+     - const: pixel
+     - const: core
+
+   assigned-clocks:
+    description: |
+     Parents of "byte" and "pixel" for the given platform.
+
+   assigned-clock-parents:
+    description: |
+     The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
+     Details on clock bindings are mentioned in
+     Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+   vdd-supply:
+    description: |
+     Phandle to vdd regulator device node
+
+   vddio-supply:
+    description: |
+     Phandle to vdd-io regulator device node
+
+   vdda-supply:
+    description: |
+     Phandle to vdda regulator device node
+
+   phys:
+    description: |
+     Phandle to DSI PHY device node
+
+   phy-names:
+    description: |
+     Name of the corresponding PHY device
+
+   syscon-sfpb:
+    description: |
+     A phandle to mmss_sfpb syscon node (only for DSIv2)
+
+   ports:
+    description: |
+     Contains 2 DSI controller ports as child nodes. Each port contains
+     an endpoint subnode as defined in
+     Documentation/devicetree/bindings/graph.txt and
+     Documentation/devicetree/bindings/media/video-interfaces.txt
+
+   properties:
+    description: |
+     These are the Optional properties for DSI controller.
+
+     panel@0:
+      description: |
+       Node of panel connected to this DSI controller.
+       See files in Documentation/devicetree/bindings/display/panel/
+       for each supported panel.
+
+     qcom,dual-dsi-mode:
+      description: |
+       Boolean value indicating if the DSI controller is
+       driving a panel which needs 2 DSI links.
+
+     qcom,master-dsi:
+      description: |
+       Boolean value indicating if the DSI controller is driving
+       the master link of the 2-DSI panel.
+
+     qcom,sync-dual-dsi:
+      description: |
+       Boolean value indicating if the DSI controller is
+       driving a 2-DSI panel whose 2 links need receive command simultaneously.
+
+     pinctrl-names:
+      description: The pin control state names; should contain "default"
+
+     pinctrl-0:
+      description: The default pinctrl state (active)
+
+     pinctrl-n:
+      description: The "sleep" pinctrl state
+
+     ports:
+      description: |
+       Contains DSI controller input and output ports as children, each
+       containing one endpoint subnode.
+
+     properties:
+      description: DSI Endpoint properties
+
+      remote-endpoint:
+       description: |
+        For port@0, set to phandle of the connected panel/bridge's
+        input endpoint. For port@1, set to the MDP interface output.
+        See Documentation/devicetree/bindings/graph.txt for
+        device graph info.
+
+      data-lanes:
+       description: |
+        This describes how the physical DSI data lanes are mapped
+        to the logical lanes on the given platform. The value contained in
+        index n describes what physical lane is mapped to the logical lane n
+        (DATAn, where n lies between 0 and 3). The clock lane position is fixed
+        and can't be changed. Hence, they aren't a part of the DT bindings. See
+        Documentation/devicetree/bindings/media/video-interfaces.txt for
+        more info on the data-lanes property.
+
+        For example:
+
+        data-lanes = <3 0 1 2>;
+
+        The above mapping describes that the logical data lane DATA0 is mapped
+        to the physical data lane DATA3, logical DATA1 to physical DATA0,
+        logic DATA2 to phys DATA1 and logic DATA3 to phys DATA2. There are
+        only a limited number of physical to logical mappings possible.
+       oneOf:
+        - const: <0 1 2 3>
+        - const: <1 2 3 0>
+        - const: <2 3 0 1>
+        - const: <3 0 1 2>
+        - const: <0 3 2 1>
+        - const: <1 0 3 2>
+        - const: <2 1 0 3>
+        - const: <3 2 1 0>
+
+     qcom,mdss-mdp-transfer-time-us:
+      description: |
+       Specifies the dsi transfer time for command mode
+       panels in microseconds. Driver uses this number to adjust
+       the clock rate according to the expected transfer time.
+       Increasing this value would slow down the mdp processing
+       and can result in slower performance.
+       Decreasing this value can speed up the mdp processing,
+       but this can also impact power consumption.
+       As a rule this time should not be higher than the time
+       that would be expected with the processing at the
+       dsi link rate since anyways this would be the maximum
+       transfer time that could be achieved.
+       If ping pong split is enabled, this time should not be higher
+       than two times the dsi link rate time.
+       If the property is not specified, then the default value is 14000 us.
+       This is an optional property.
+
+ "dsi_phy":
+  type: object
+  description: Node containing the properties of DSI PHY
+  properties:
+   compatible:
+    oneOf:
+     - const: qcom,dsi-phy-28nm-hpm
+     - const: qcom,dsi-phy-28nm-lp
+     - const: qcom,dsi-phy-20nm
+     - const: qcom,dsi-phy-28nm-8960
+     - const: qcom,dsi-phy-14nm
+     - const: qcom,dsi-phy-10nm
+     - const: qcom,dsi-phy-10nm-8998
+
+   reg:
+    description: |
+     Physical base address and length of the registers of PLL, PHY. Some
+     revisions require the PHY regulator base address, whereas others
+     require the PHY lane base address. See below for each PHY revision.
+
+   reg-names:
+    description: Name of register regions.
+    oneOf:
+     - description: |
+        Following regions are required for DSI 28nm HPM/LP/8960 PHYs and
+        20nm PHY.
+       items:
+        - const: dsi_pll
+        - const: dsi_phy
+        - const: dsi_phy_regulator
+
+     - description: |
+         Following regions are required for DSI 14nm and 10nm PHYs:
+       items:
+        - const: dsi_pll
+        - const: dsi_phy
+        - const: dsi_phy_lane
+
+   clock-cells:
+    description: |
+     The DSI PHY block acts as a clock provider, creating
+     2 clocks: A byte clock (index 0), and a pixel clock (index 1).
+    const: 1
+
+   power-domains:
+    description: Should be <&mmcc MDSS_GDSC>.
+
+   clocks:
+    description: |
+     Phandles to device clocks. See
+     Documentation/devicetree/bindings/clock/clock-bindings.txt
+     for details on clock bindings.
+
+   clock-names:
+    description: |
+     The following clocks are required.
+     "iface"
+     "ref" (only required for new DTS files/entries)
+
+   vddio-supply:
+    description: |
+     Phandle to vdd-io regulator device node. Required for 28nm HPM/LP,
+     28nm 8960 PHYs and 20nm PHY.
+
+   vcca-supply:
+    description: |
+     Phandle to vcca regulator device node. Required for 20nm PHY and
+     10nm PHY.
+
+   vdds-supply:
+    description: |
+     Phandle to vdds regulator device node. Required for 10nm PHY.
+
+   properties:
+    description: |
+     These are the optional properties for DSI PHY.
+
+     qcom,dsi-phy-regulator-ldo-mode:
+      description: |
+       Boolean value indicating if the LDO mode PHY regulator is wanted.
+
+examples:
+- |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+
+     dsi0: dsi@fd922800 {
+           compatible = "qcom,mdss-dsi-ctrl";
+           qcom,dsi-host-index = <0>;
+           interrupt-parent = <&mdp>;
+           interrupts = <4 0>;
+           reg-names = "dsi_ctrl";
+           reg = <0xfd922800 0x200>;
+           power-domains = <&mmcc MDSS_GDSC>;
+
+           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
+           clock-names = "byte",
+                         "byte_intf",
+                         "pixel",
+                         "core",
+                         "iface",
+                         "bus";
+           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                             <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+           assigned-clock-parents = <&dsi_phy0 0>,
+                                    <&dsi_phy0 1>;
+
+           vdda-supply = <&pma8084_l2>;
+           vdd-supply = <&pma8084_l22>;
+           vddio-supply = <&pma8084_l12>;
+
+           phys = <&dsi_phy0>;
+           phy-names ="dsi-phy";
+
+           qcom,dual-dsi-mode;
+           qcom,master-dsi;
+           qcom,sync-dual-dsi;
+
+           qcom,mdss-mdp-transfer-time-us = <12000>;
+
+           pinctrl-names = "default", "sleep";
+           pinctrl-0 = <&dsi_active>;
+           pinctrl-1 = <&dsi_suspend>;
+
+           ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               port@0 {
+                      reg = <0>;
+                      dsi0_in: endpoint {
+                               remote-endpoint = <&mdp_intf1_out>;
+                      };
+               };
+
+               port@1 {
+                      reg = <1>;
+                      dsi0_out: endpoint {
+                                remote-endpoint = <&panel_in>;
+                                data-lanes = <0 1 2 3>;
+                      };
+               };
+           };
+
+           panel: panel@0 {
+                  compatible = "sharp,lq101r1sx01";
+                  link2 = <&secondary>;
+
+                  port {
+                       panel_in: endpoint {
+                                 remote-endpoint = <&dsi0_out>;
+                       };
+                  };
+           };
+     };
+
+     dsi_phy0: dsi-phy@fd922a00 {
+               compatible = "qcom,dsi-phy-28nm-hpm";
+               qcom,dsi-phy-index = <0>;
+               reg-names =
+                        "dsi_pll",
+                        "dsi_phy",
+                        "dsi_phy_regulator";
+               reg =   <0xfd922a00 0xd4>,
+                       <0xfd922b00 0x2b0>,
+                       <0xfd922d80 0x7b>;
+               clock-names = "iface";
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+               vddio-supply = <&pma8084_l12>;
+
+               qcom,dsi-phy-regulator-ldo-mode;
+     };
+...
+
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
