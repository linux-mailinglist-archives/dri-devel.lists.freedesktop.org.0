Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F132235B6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB5A6ED0F;
	Fri, 17 Jul 2020 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBC96E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594917534; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yfps6zJTHRjLHKhT7ej722q1fZZeWk7kGex+GBCz5ic=;
 b=UNQhsv6dbbeFw050Bnzp8j+Cg1NaNTKGKhqN0l0uOpBiZfvzgk09TTft7OictnLlhtKBym
 gDwltSCqIJ6INz4nhYcjTHM2Li8t1snyjqgeuPtJ1ZzOTym8x8zKH0ZPyemExCMUXebAFu
 E5VShWUFjoQ+LAx0W+GQfz35cISFU7s=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 03/12] dt-bindings: display: Add ingenic,ipu.yaml
Date: Thu, 16 Jul 2020 18:38:37 +0200
Message-Id: <20200716163846.174790-3-paul@crapouillou.net>
In-Reply-To: <20200716163846.174790-1-paul@crapouillou.net>
References: <20200716163846.174790-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation of the Device Tree bindings for the Image Processing
Unit (IPU) found in most Ingenic SoCs.

v2: Add missing 'const' in items list
v3: No change

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,ipu.yaml b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
new file mode 100644
index 000000000000..5bfc33eb32c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,ipu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs Image Processing Unit (IPU) devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4725b-ipu
+        - ingenic,jz4760-ipu
+      - items:
+        - const: ingenic,jz4770-ipu
+        - const: ingenic,jz4760-ipu
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
+  clock-names:
+    const: ipu
+
+patternProperties:
+  "^ports?$":
+    description: OF graph bindings (specified in bindings/graph.txt).
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4770-cgu.h>
+    ipu@13080000 {
+      compatible = "ingenic,jz4770-ipu", "ingenic,jz4760-ipu";
+      reg = <0x13080000 0x800>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <29>;
+
+      clocks = <&cgu JZ4770_CLK_IPU>;
+      clock-names = "ipu";
+
+      port {
+        ipu_ep: endpoint {
+          remote-endpoint = <&lcdc_ep>;
+        };
+      };
+    };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
