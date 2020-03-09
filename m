Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335917F196
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B406E817;
	Tue, 10 Mar 2020 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FC36E40F;
 Mon,  9 Mar 2020 11:18:17 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 0EF123E94B;
 Mon,  9 Mar 2020 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1583752696;
 bh=3QDZGZgiS58VF0JjyLEvpXThSA6/Pvydn+fwYa8zhWk=;
 h=From:To:Cc:Subject:Date:From;
 b=d/CPPE9uBD1E08FiabSDpgtLduLgdQu47yp1Q/DZr9Q+6GV9K5AcFtwvExSutg0so
 SzCenrkWJjQYHyHSHYZ+UisKp34at5vc15UsFaW7fKjS+G7Jqk+G+AmGzTda/MSqyl
 K3G6ZydlLGdCoklOYBuekT6EMrM/JBXaLR/Igwbo=
From: Brian Masney <masneyb@onstation.org>
To: robh+dt@kernel.org,
	robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH] dt-bindings: display: msm: gmu: move sram property to gpu
 bindings
Date: Mon,  9 Mar 2020 07:18:04 -0400
Message-Id: <20200309111804.188162-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sram property was incorrectly added to the GMU binding when it
really belongs with the GPU binding instead. Let's go ahead and
move it.

While changes are being made here, let's update the sram property
description to mention that this property is only valid for a3xx and
a4xx GPUs. The a3xx/a4xx example in the GPU is replaced with what was
in the GMU.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Fixes: 198a72c8f9ee ("dt-bindings: display: msm: gmu: add optional ocmem property")
---
Background thread:
https://lore.kernel.org/lkml/20200303170159.GA13109@jcrouse1-lnx.qualcomm.com/

I started to look at what it would take to convert the GPU bindings to
YAML, however I am unsure of the complete list of "qcom,adreno-XYZ.W"
compatibles that are valid.

 .../devicetree/bindings/display/msm/gmu.txt   | 51 -----------------
 .../devicetree/bindings/display/msm/gpu.txt   | 55 ++++++++++++++-----
 2 files changed, 42 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
index bf9c7a2a495c..90af5b0a56a9 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
@@ -31,10 +31,6 @@ Required properties:
 - iommus: phandle to the adreno iommu
 - operating-points-v2: phandle to the OPP operating points
 
-Optional properties:
-- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
-        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
-
 Example:
 
 / {
@@ -67,50 +63,3 @@ Example:
 		operating-points-v2 = <&gmu_opp_table>;
 	};
 };
-
-a3xx example with OCMEM support:
-
-/ {
-	...
-
-	gpu: adreno@fdb00000 {
-		compatible = "qcom,adreno-330.2",
-		             "qcom,adreno";
-		reg = <0xfdb00000 0x10000>;
-		reg-names = "kgsl_3d0_reg_memory";
-		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "kgsl_3d0_irq";
-		clock-names = "core",
-		              "iface",
-		              "mem_iface";
-		clocks = <&mmcc OXILI_GFX3D_CLK>,
-		         <&mmcc OXILICX_AHB_CLK>,
-		         <&mmcc OXILICX_AXI_CLK>;
-		sram = <&gmu_sram>;
-		power-domains = <&mmcc OXILICX_GDSC>;
-		operating-points-v2 = <&gpu_opp_table>;
-		iommus = <&gpu_iommu 0>;
-	};
-
-	ocmem@fdd00000 {
-		compatible = "qcom,msm8974-ocmem";
-
-		reg = <0xfdd00000 0x2000>,
-		      <0xfec00000 0x180000>;
-		reg-names = "ctrl",
-		             "mem";
-
-		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
-		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
-		clock-names = "core",
-		              "iface";
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		gmu_sram: gmu-sram@0 {
-			reg = <0x0 0x100000>;
-			ranges = <0 0 0xfec00000 0x100000>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 7edc298a15f2..fd779cd6994d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -35,25 +35,54 @@ Required properties:
   bring the GPU out of secure mode.
 - firmware-name: optional property of the 'zap-shader' node, listing the
   relative path of the device specific zap firmware.
+- sram: phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
+        a4xx Snapdragon SoCs. See
+        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
 
-Example 3xx/4xx/a5xx:
+Example 3xx/4xx:
 
 / {
 	...
 
-	gpu: qcom,kgsl-3d0@4300000 {
-		compatible = "qcom,adreno-320.2", "qcom,adreno";
-		reg = <0x04300000 0x20000>;
+	gpu: adreno@fdb00000 {
+		compatible = "qcom,adreno-330.2",
+		             "qcom,adreno";
+		reg = <0xfdb00000 0x10000>;
 		reg-names = "kgsl_3d0_reg_memory";
-		interrupts = <GIC_SPI 80 0>;
-		clock-names =
-		    "core",
-		    "iface",
-		    "mem_iface";
-		clocks =
-		    <&mmcc GFX3D_CLK>,
-		    <&mmcc GFX3D_AHB_CLK>,
-		    <&mmcc MMSS_IMEM_AHB_CLK>;
+		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "kgsl_3d0_irq";
+		clock-names = "core",
+		              "iface",
+		              "mem_iface";
+		clocks = <&mmcc OXILI_GFX3D_CLK>,
+		         <&mmcc OXILICX_AHB_CLK>,
+		         <&mmcc OXILICX_AXI_CLK>;
+		sram = <&gpu_sram>;
+		power-domains = <&mmcc OXILICX_GDSC>;
+		operating-points-v2 = <&gpu_opp_table>;
+		iommus = <&gpu_iommu 0>;
+	};
+
+	gpu_sram: ocmem@fdd00000 {
+		compatible = "qcom,msm8974-ocmem";
+
+		reg = <0xfdd00000 0x2000>,
+		      <0xfec00000 0x180000>;
+		reg-names = "ctrl",
+		            "mem";
+
+		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
+		clock-names = "core",
+		              "iface";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gpu_sram: gpu-sram@0 {
+			reg = <0x0 0x100000>;
+			ranges = <0 0 0xfec00000 0x100000>;
+		};
 	};
 };
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
