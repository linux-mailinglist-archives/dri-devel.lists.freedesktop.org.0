Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF081D42EB
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 03:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95C26E3D6;
	Fri, 15 May 2020 01:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCF66E3D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:24:51 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 163D026A;
 Fri, 15 May 2020 03:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589505888;
 bh=yADpxC+NjGSODCuJTjgao5k6O97OyQttu5XtDu4Oq2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wz3bhyl5xyhq5QNPV4qH2niNanrygWHLPDHAXTCFZj8rPmd4QVwxPG1xsTfIvwh65
 WMGHnYeFcHjk8+UEH/FpmGJHaD0V744C2N9r4ckZfQlPUFVQYGu4tiImlND8N/428B
 e9fNz0TLjmbj65V2FiexxypuM1LnhQkJzp4qed2c=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] dt-bindings: media: renesas, vsp1: Convert binding to YAML
Date: Fri, 15 May 2020 04:24:31 +0300
Message-Id: <20200515012432.31326-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Renesas R-Car VSP1 text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/media/renesas,vsp1.txt           | 30 -------
 .../bindings/media/renesas,vsp1.yaml          | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.txt b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
deleted file mode 100644
index cd5a955b2ea0..000000000000
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Renesas VSP Video Processing Engine
-
-The VSP is a video processing engine that supports up-/down-scaling, alpha
-blending, color space conversion and various other image processing features.
-It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G2 SoCs.
-
-Required properties:
-
-  - compatible: Must contain one of the following values
-    - "renesas,vsp1" for the R-Car Gen2 and RZ/G1 VSP1
-    - "renesas,vsp2" for the R-Car Gen3 and RZ/G2 VSP2
-
-  - reg: Base address and length of the registers block for the VSP.
-  - interrupts: VSP interrupt specifier.
-  - clocks: A phandle + clock-specifier pair for the VSP functional clock.
-
-Optional properties:
-
-  - renesas,fcp: A phandle referencing the FCP that handles memory accesses
-                 for the VSP. Not needed on Gen2, mandatory on Gen3.
-
-
-Example: R8A7790 (R-Car H2) VSP1-S node
-
-	vsp@fe928000 {
-		compatible = "renesas,vsp1";
-		reg = <0 0xfe928000 0 0x8000>;
-		interrupts = <0 267 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp1_clks R8A7790_CLK_VSP1_S>;
-	};
diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
new file mode 100644
index 000000000000..54b130de3ae2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,vsp1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas VSP Video Processing Engine
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description:
+  The VSP is a video processing engine that supports up-/down-scaling, alpha
+  blending, color space conversion and various other image processing features.
+  It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G2 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,vsp1 # for the R-Car Gen2 and RZ/G1 VSP1
+      - renesas,vsp2 # for the R-Car Gen3 and RZ/G2 VSP2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  renesas,fcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle referencing the FCP that handles memory accesses for the VSP.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      items:
+        - const: renesas,vsp1
+then:
+  properties:
+    renesas,fcp: false
+else:
+  required:
+    - renesas,fcp
+
+examples:
+  # R8A7790 (R-Car H2) VSP1-S
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vsp@fe928000 {
+        compatible = "renesas,vsp1";
+        reg = <0xfe928000 0x8000>;
+        interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 131>;
+    };
+
+  # R8A77951 (R-Car H3) VSP2-BC
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vsp@fe920000 {
+        compatible = "renesas,vsp2";
+        reg = <0xfe920000 0x8000>;
+        interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 624>;
+
+        renesas,fcp = <&fcpvb1>;
+    };
+...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
