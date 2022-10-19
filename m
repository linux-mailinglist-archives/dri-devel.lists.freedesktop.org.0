Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE8E603F94
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 11:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DDB10E83B;
	Wed, 19 Oct 2022 09:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0610F1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 09:32:40 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 19 Oct 2022 17:32:40 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 29J9WY3O030929;
 Wed, 19 Oct 2022 17:32:34 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Wed, 19 Oct 2022 17:32:33 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v5 1/2] dt-bindings: it6505: add properties to restrict output
 bandwidth
Date: Wed, 19 Oct 2022 17:32:13 +0800
Message-ID: <20221019093215.8204-2-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019093215.8204-1-allen.chen@ite.com.tw>
References: <20221019093215.8204-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 0BA561C71DF04AAC8215271AAC2F2DA9A07B9C33BFD346492EB0738684481BF82002:8
X-MAIL: mse.ite.com.tw 29J9WY3O030929
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-Yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: allen chen <allen.chen@ite.com.tw>

Add properties to restrict dp output data-lanes and clock.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
---
 .../bindings/display/bridge/ite,it6505.yaml   | 89 +++++++++++++++++--
 1 file changed, 83 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index 833d11b2303a7..8e607b6929fc9 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -52,9 +52,70 @@ properties:
     maxItems: 1
     description: extcon specifier for the Power Delivery
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: A port node pointing to DPI host port node
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: A port node pointing to DPI host port node
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              link-frequencies:
+                minItems: 1
+                maxItems: 1
+                description: Allowed max link frequencies in Hz
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for DP output
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                oneOf:
+                  - minItems: 1
+                    maxItems: 1
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                    description: For one lane operation.
+
+                  - minItems: 2
+                    maxItems: 2
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                    description: For two lanes operation.
+
+                  - minItems: 4
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                        - 2
+                        - 3
+                    description: For four lanes operation.
+    required:
+      - port@0
+      - port@1
 
 required:
   - compatible
@@ -63,6 +124,7 @@ required:
   - interrupts
   - reset-gpios
   - extcon
+  - ports
 
 additionalProperties: false
 
@@ -85,9 +147,24 @@ examples:
             reset-gpios = <&pio 179 1>;
             extcon = <&usbc_extcon>;
 
-            port {
-                it6505_in: endpoint {
-                    remote-endpoint = <&dpi_out>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    it6505_in: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                        link-frequencies = /bits/ 64 <150000000>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    it6505_out: endpoint {
+                        remote-endpoint = <&dp_in>;
+                        data-lanes = <0 1>;
+                    };
                 };
             };
         };
-- 
2.25.1

