Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A1B0DF08
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C43110E6B7;
	Tue, 22 Jul 2025 14:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3710E6B7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:41:44 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id E83FD1C067F;
 Tue, 22 Jul 2025 16:41:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdcb:3c00:ce39:8bff:5db4:1ef8])
 by srv01.abscue.de (Postfix) with ESMTPSA id 1DD811C025E;
 Tue, 22 Jul 2025 16:41:36 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 22 Jul 2025 16:41:03 +0200
Subject: [PATCH v2 01/15] dt-bindings: display: sprd: adapt for UMS9230 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-ums9230-drm-v2-1-054276ec213d@abscue.de>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
In-Reply-To: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

Add the compatible strings for the display controller found in the
UMS9230 SoC and introduce more descriptive names for the clocks.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    | 24 +++++++++++++++-------
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 15 ++++++++++----
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
index 8c52fa0ea5f8ee2149ebf1d4b0d5b052832e3d97..7f34652080b22e7b7072a709fd390a72375110ef 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -16,7 +16,12 @@ description: |
 
 properties:
   compatible:
-    const: sprd,sharkl3-dpu
+    oneOf:
+      - items:
+          - enum:
+              - sprd,ums9230-dpu
+          - const: sprd,sharkl3-dpu
+      - const: sprd,sharkl3-dpu
 
   reg:
     maxItems: 1
@@ -28,9 +33,14 @@ properties:
     maxItems: 2
 
   clock-names:
-    items:
-      - const: clk_src_128m
-      - const: clk_src_384m
+    oneOf:
+      - deprecated: true
+        items:
+          - const: clk_src_128m
+          - const: clk_src_384m
+      - items:
+          - const: core
+          - const: dpi
 
   power-domains:
     maxItems: 1
@@ -64,10 +74,10 @@ examples:
         compatible = "sprd,sharkl3-dpu";
         reg = <0x63000000 0x1000>;
         interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-        clock-names = "clk_src_128m", "clk_src_384m";
 
-        clocks = <&pll CLK_TWPLL_128M>,
-          <&pll CLK_TWPLL_384M>;
+        clocks = <&pll CLK_TWPLL_384M>,
+                 <&pll CLK_TWPLL_128M>;
+        clock-names = "core", "dpi";
 
         dpu_port: port {
             dpu_out: endpoint {
diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
index 300bf2252c3e8e589dc74927520e24aa4a59f81b..71abbc2de8dbb1b674f151a87490c865b187fdd0 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: sprd,sharkl3-dsi-host
+    enum:
+      - sprd,sharkl3-dsi-host
+      - sprd,ums9230-dsi-host
 
   reg:
     maxItems: 1
@@ -23,8 +25,12 @@ properties:
     maxItems: 1
 
   clock-names:
-    items:
-      - const: clk_src_96m
+    oneOf:
+      - deprecated: true
+        items:
+          - const: clk_src_96m
+      - items:
+          - const: pclk
 
   power-domains:
     maxItems: 1
@@ -73,8 +79,9 @@ examples:
         reg = <0x63100000 0x1000>;
         interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
           <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-        clock-names = "clk_src_96m";
         clocks = <&pll CLK_TWPLL_96M>;
+        clock-names = "pclk";
+
         ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.50.0
