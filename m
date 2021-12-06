Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7674699CC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 16:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A263E72E96;
	Mon,  6 Dec 2021 15:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6670873526
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 15:00:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.87,291,1631545200"; d="scan'208";a="102563455"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2021 00:00:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.57])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id E463643B6D97;
 Tue,  7 Dec 2021 00:00:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
Date: Mon,  6 Dec 2021 15:00:23 +0000
Message-Id: <20211206150025.15703-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
References: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
add a compatible string for it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Updated minItems for resets as 2
 * Documented optional property reset-names
 * Documented reset-names as required property for RZ/G2L SoC.
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 6f98dd55fb4c..c3b2f4ddd520 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson-g12a-mali
           - mediatek,mt8183-mali
           - realtek,rtd1619-mali
+          - renesas,r9a07g044-mali
           - rockchip,px30-mali
           - rockchip,rk3568-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -27,19 +28,30 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 3
     items:
       - description: Job interrupt
       - description: MMU interrupt
       - description: GPU interrupt
+      - description: EVENT interrupt
 
   interrupt-names:
+    minItems: 3
     items:
       - const: job
       - const: mmu
       - const: gpu
+      - const: event
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: gpu
+      - const: bus
+      - const: bus_ace
 
   mali-supply: true
 
@@ -52,7 +64,14 @@ properties:
     maxItems: 3
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: rst
+      - const: axi_rst
+      - const: ace_rst
 
   "#cooling-cells":
     const: 2
@@ -113,6 +132,22 @@ allOf:
         - sram-supply
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-mali
+    then:
+      properties:
+        interrupt-names:
+          minItems: 4
+        clock-names:
+          minItems: 3
+      required:
+        - clock-names
+        - power-domains
+        - resets
+        - reset-names
     else:
       properties:
         power-domains:
-- 
2.17.1

