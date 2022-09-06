Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC85AEA6C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D7E10E687;
	Tue,  6 Sep 2022 13:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA96B10E675
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsvWDg5Qw6FHru4RBeFNSs0datG/wUGFHEHf/M/3yFo=; b=T4ZX30n3HZKZ4nTtNu+Gw1e7io
 xZ54pVXfYL82NXnttqHf6NXUA88EjYXK73fFIpFFO7gZEy6SQOSRGioOqJXpKsJ0j9iwYMSCVv3Cz
 yx5VL+dZ9dNQzisKe75Q4nx+6LB5i0LfOVe3V5URUOvjMb5KSo55OK4R9cCeTZSZYZHqxNzeL+jFr
 C5KW37IO/Z30LSLYGs7f9yzR73FzywsJ6o/I/KJOMq+bexoS6wDAQ6Gpo0BQujBhY8d/mgyKWnjkU
 KqIRH7B4QqRe9yGqVdwNlJil6/rl9eU92jc4eGxBbWo7S+pimyYlvCv5sNN7EBdu8NyvcEEDQ80Jt
 JEXjbBag==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVYdX-008sZV-Cm; Tue, 06 Sep 2022 16:29:07 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Date: Tue,  6 Sep 2022 16:28:18 +0300
Message-Id: <20220906132823.2390953-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Update NVDEC bindings for Tegra234. This new engine version only has
two memory clients, but now requires three clocks, and as a bigger
change the engine loads firmware from a secure carveout configured by
the bootloader.

For the latter, we need to add a phandle to the memory controller
to query the location of this carveout, and several other properties
containing offsets into the firmware inside the carveout. These
properties are intended to be populated through a device tree overlay
configured at flashing time, so that the values correspond to the
flashed NVDEC firmware.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 118 +++++++++++++++---
 1 file changed, 98 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
index 3cf862976448..27128a195b66 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
@@ -24,17 +24,11 @@ properties:
       - nvidia,tegra210-nvdec
       - nvidia,tegra186-nvdec
       - nvidia,tegra194-nvdec
+      - nvidia,tegra234-nvdec
 
   reg:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    items:
-      - const: nvdec
-
   resets:
     maxItems: 1
 
@@ -50,18 +44,6 @@ properties:
 
   dma-coherent: true
 
-  interconnects:
-    items:
-      - description: DMA read memory client
-      - description: DMA read 2 memory client
-      - description: DMA write memory client
-
-  interconnect-names:
-    items:
-      - const: dma-mem
-      - const: read-1
-      - const: write
-
   nvidia,host1x-class:
     description: |
       Host1x class of the engine, used to specify the targeted engine
@@ -79,7 +61,103 @@ required:
   - reset-names
   - power-domains
 
-additionalProperties: false
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra234-nvdec
+    then:
+      properties:
+        clocks:
+          items:
+            - description: NVDEC clock
+            - description: FUSE clock
+            - description: TSEC_PKA clock
+        clock-names:
+          items:
+            - const: nvdec
+            - const: fuse
+            - const: tsec_pka
+        interconnects:
+          items:
+            - description: DMA read memory client
+            - description: DMA write memory client
+        interconnect-names:
+          items:
+            - const: dma-mem
+            - const: write
+        nvidia,memory-controller:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description:
+            phandle to the memory controller for determining carveout information.
+        nvidia,bl-manifest-offset:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Offset to bootloader manifest from beginning of firmware. Typically set as
+            part of a device tree overlay corresponding to flashed firmware.
+        nvidia,bl-code-offset:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Offset to bootloader code section from beginning of firmware. Typically set as
+            part of a device tree overlay corresponding to flashed firmware.
+        nvidia,bl-data-offset:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Offset to bootloader data section from beginning of firmware. Typically set as
+            part of a device tree overlay corresponding to flashed firmware.
+        nvidia,os-manifest-offset:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Offset to operating system manifest from beginning of firmware. Typically set as
+            part of a device tree overlay corresponding to flashed firmware.
+        nvidia,os-code-offset:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Offset to operating system code section from beginning of firmware. Typically set as
+            part of a device tree overlay corresponding to flashed firmware.
+        nvidia,os-data-offset:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Offset to operating system data section from beginning of firmware. Typically set as
+            part of a device tree overlay corresponding to flashed firmware.
+      required:
+        - nvidia,memory-controller
+        - nvidia,bl-manifest-offset
+        - nvidia,bl-code-offset
+        - nvidia,bl-data-offset
+        - nvidia,os-manifest-offset
+        - nvidia,os-code-offset
+        - nvidia,os-data-offset
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-nvdec
+              - nvidia,tegra186-nvdec
+              - nvidia,tegra194-nvdec
+    then:
+      properties:
+        clocks:
+          items:
+            - description: NVDEC clock
+        clock-names:
+          items:
+            - const: nvdec
+        interconnects:
+          items:
+            - description: DMA read memory client
+            - description: DMA read 2 memory client
+            - description: DMA write memory client
+        interconnect-names:
+          items:
+            - const: dma-mem
+            - const: read-1
+            - const: write
 
 examples:
   - |
-- 
2.37.0

