Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BE1B9859
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2AF6E0CE;
	Mon, 27 Apr 2020 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC96989E98
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587927545; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBcEz9by+T4cFgShyhpvICcXahPKT+AnlbYY5I/mqIw=;
 b=J1r27QurD8bfCdUW3P9HroiZx+syuKqbnQSd/IWk+JgNKDWJR0SOW1X8vB4tlS9N2tyUhv
 aeM+vnFie2Dn4iM9Jtof2wCw+iD2IIIvIVxFmwe1z7ybRBK9tFm1m7MORfUlbCTEWjrHno
 y7xVX+v/OlgVxM/pCrPxA/JiSrWcnk0=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
Date: Sun, 26 Apr 2020 20:58:50 +0200
Message-Id: <20200426185856.38826-2-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.

Some compatible strings now require a fallback, as the controller
generally works the same across the SoCs families.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../interrupt-controller/ingenic,intc.txt     | 28 ---------
 .../interrupt-controller/ingenic,intc.yaml    | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
deleted file mode 100644
index d4373d0f7121..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Ingenic SoC Interrupt Controller
-
-Required properties:
-
-- compatible : should be "ingenic,<socname>-intc". Valid strings are:
-    ingenic,jz4740-intc
-    ingenic,jz4725b-intc
-    ingenic,jz4770-intc
-    ingenic,jz4775-intc
-    ingenic,jz4780-intc
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-- interrupts : Specifies the CPU interrupt the controller is connected to.
-
-Example:
-
-intc: interrupt-controller@10001000 {
-	compatible = "ingenic,jz4740-intc";
-	reg = <0x10001000 0x14>;
-
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-	interrupt-parent = <&cpuintc>;
-	interrupts = <2>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
new file mode 100644
index 000000000000..28b27e1a6e9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs interrupt controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^interrupt-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-intc
+        - ingenic,jz4760-intc
+        - ingenic,jz4780-intc
+      - items:
+        - enum:
+          - ingenic,jz4775-intc
+          - ingenic,jz4770-intc
+        - const: ingenic,jz4760-intc
+      - items:
+        - const: ingenic,x1000-intc
+        - const: ingenic,jz4780-intc
+      - items:
+        - const: ingenic,jz4725b-intc
+        - const: ingenic,jz4740-intc
+
+  "#interrupt-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+
+examples:
+  - |
+    intc: interrupt-controller@10001000 {
+      compatible = "ingenic,jz4770-intc", "ingenic,jz4760-intc";
+      reg = <0x10001000 0x40>;
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <2>;
+    };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
