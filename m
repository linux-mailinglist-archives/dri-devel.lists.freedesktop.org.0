Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57811B0AFC7
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 14:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3782110E201;
	Sat, 19 Jul 2025 12:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BCD10E210
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 12:20:38 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 88C661C00FF;
 Sat, 19 Jul 2025 14:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdf7:4000:ceae:3606:9020:cd4f])
 by srv01.abscue.de (Postfix) with ESMTPSA id E84721C025F;
 Sat, 19 Jul 2025 14:11:27 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 19 Jul 2025 14:09:37 +0200
Subject: [PATCH 01/12] dt-bindings: display: sprd: adapt for UMS9230
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
In-Reply-To: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
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
UMS9230 SoC and bindings for a gate clock. Add IOMMU-related bindings
to the display-subsystem node.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 .../bindings/display/sprd/sprd,display-subsystem.yaml  | 11 +++++++++++
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml        | 18 +++++++++++++-----
 .../bindings/display/sprd/sprd,sharkl3-dsi-host.yaml   | 11 ++++++++---
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
index b3d5e1b96fae2f24ff2afb26c9c3ce0212856be4..d02f79c602f515533f60a993539ed7cd82ce22ec 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
@@ -43,6 +43,17 @@ properties:
   compatible:
     const: sprd,display-subsystem
 
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description:
+      A phandle to the framebuffer region configured by the bootloader. This
+      can be used together with an iommu-addresses property on the reserved
+      memory region to create an initial passthrough mapping for the boot
+      splash framebuffer.
+
   ports:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
index 4ebea60b8c5ba5f177854e3a8d89e93e7304e18b..6fedb6e508b247eb71da17ced589b8ed09085592 100644
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
@@ -25,12 +30,15 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
+    minItems: 1
 
   clock-names:
-    items:
-      - const: clk_src_128m
-      - const: clk_src_384m
+    oneOf:
+      - items:
+        - const: clk_src_128m
+        - const: clk_src_384m
+      - items:
+        - const: enable
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
index bc5594d18643010b91376c92a8f235a522d7dc3d..8438d2da0a4277db03e30b13cb270684c0c360cb 100644
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
@@ -23,8 +25,11 @@ properties:
     minItems: 1
 
   clock-names:
-    items:
-      - const: clk_src_96m
+    oneOf:
+      - items:
+          - const: clk_src_96m
+      - items:
+          - const: enable
 
   power-domains:
     maxItems: 1

-- 
2.50.0
