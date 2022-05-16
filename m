Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D5528139
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A7610E7F0;
	Mon, 16 May 2022 10:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BA210E7C2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K6UXL4UsLa1v8rXgrch6vkZbmkdDyz5XZet88hhfmp8=; b=GtzQvmOkIxgGpNQbForScR8FQz
 z1fe/m1d7z3HE81ITIPABU+5ivMJ8Q8CauYZNFC62Do6BI31NSnco8cVwpqtfU97NwVNJWlhlkOut
 eiVfog7n5nFiwEN2EJa7ZhgYAxLz6jwG5IVLGLXsD+76I0k9ga6tyJk7+FLizMygWnprOCCLIKmpf
 zASS3+l3t/6ldjBfuMHYsi3N3aebW9rWAhYK/0HX4ik/PiXihfl9liNdKgC8HR0Rw9VvrbovHAUNL
 Suozdqwqc0A1O+PPv9getTzd4tkLsTzzo7CrfbJfSTwwHgugSqxZyCm89/oBagV66Z/+kOvO2Pwmq
 j6cL9glg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYe-0005yU-Lt; Mon, 16 May 2022 13:02:32 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 01/13] dt-bindings: Add bindings for Tegra234 Host1x and VIC
Date: Mon, 16 May 2022 13:02:01 +0300
Message-Id: <20220516100213.1536571-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Update VIC and Host1x bindings for changes in Tegra234.

Namely,
- New compatible strings
- Sharded syncpoint interrupts
- Optional reset.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 108 +++++++++++++++---
 2 files changed, 95 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
index 37bb5ddc1963..7200095ef19e 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
@@ -21,6 +21,7 @@ properties:
           - nvidia,tegra210-vic
           - nvidia,tegra186-vic
           - nvidia,tegra194-vic
+          - nvidia,tegra234-vic
 
       - items:
           - const: nvidia,tegra132-vic
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 0adeb03b9e3a..83c58b7dae98 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -24,6 +24,7 @@ properties:
           - nvidia,tegra210-host1x
           - nvidia,tegra186-host1x
           - nvidia,tegra194-host1x
+          - nvidia,tegra234-host1x
 
       - items:
           - const: nvidia,tegra132-host1x
@@ -31,23 +32,19 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   reg-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   interrupts:
-    items:
-      - description: host1x syncpoint interrupt
-      - description: host1x general interrupt
     minItems: 1
+    maxItems: 9
 
   interrupt-names:
-    items:
-      - const: syncpt
-      - const: host1x
     minItems: 1
+    maxItems: 9
 
   '#address-cells':
     description: The number of cells used to represent physical base addresses
@@ -110,13 +107,32 @@ required:
   - reg
   - clocks
   - clock-names
-  - resets
-  - reset-names
 
 additionalProperties:
   type: object
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-host1x
+              - nvidia,tegra30-host1x
+              - nvidia,tegra114-host1x
+              - nvidia,tegra124-host1x
+              - nvidia,tegra210-host1x
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: host1x syncpoint interrupt
+            - description: host1x general interrupt
+
+        interrupt-names:
+          items:
+            - const: syncpt
+            - const: host1x
   - if:
       properties:
         compatible:
@@ -133,10 +149,10 @@ allOf:
 
         reg:
           items:
-            - description: physical base address and length of the register
-                region assigned to the VM
             - description: physical base address and length of the register
                 region used by the hypervisor
+            - description: physical base address and length of the register
+                region assigned to the VM
 
         resets:
           maxItems: 1
@@ -144,6 +160,70 @@ allOf:
         reset-names:
           maxItems: 1
 
+        interrupts:
+          items:
+            - description: host1x syncpoint interrupt
+            - description: host1x general interrupt
+
+        interrupt-names:
+          items:
+            - const: syncpt
+            - const: host1x
+
+        iommu-map:
+          description: Specification of stream IDs available for memory context device
+            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
+            usable stream IDs.
+
+      required:
+        - reg-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra234-host1x
+    then:
+      properties:
+        reg-names:
+          items:
+            - const: common
+            - const: hypervisor
+            - const: vm
+
+        reg:
+          items:
+            - description: physical base address and length of the register
+                region used by host1x server
+            - description: physical base address and length of the register
+                region used by the hypervisor
+            - description: physical base address and length of the register
+                region assigned to the VM
+
+        interrupts:
+          items:
+            - description: host1x syncpoint interrupt 0
+            - description: host1x syncpoint interrupt 1
+            - description: host1x syncpoint interrupt 2
+            - description: host1x syncpoint interrupt 3
+            - description: host1x syncpoint interrupt 4
+            - description: host1x syncpoint interrupt 5
+            - description: host1x syncpoint interrupt 6
+            - description: host1x syncpoint interrupt 7
+            - description: host1x general interrupt
+
+        interrupt-names:
+          items:
+            - const: syncpt0
+            - const: syncpt1
+            - const: syncpt2
+            - const: syncpt3
+            - const: syncpt4
+            - const: syncpt5
+            - const: syncpt6
+            - const: syncpt7
+            - const: host1x
+
         iommu-map:
           description: Specification of stream IDs available for memory context device
             use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
@@ -160,8 +240,8 @@ examples:
     host1x@50000000 {
         compatible = "nvidia,tegra20-host1x";
         reg = <0x50000000 0x00024000>;
-        interrupts = <0 65 0x04   /* mpcore syncpt */
-                      0 67 0x04>; /* mpcore general */
+        interrupts = <0 65 0x04>, /* mpcore syncpt */
+                     <0 67 0x04>; /* mpcore general */
         interrupt-names = "syncpt", "host1x";
         clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
         clock-names = "host1x";
-- 
2.36.1

