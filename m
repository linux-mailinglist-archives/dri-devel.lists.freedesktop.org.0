Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB85FD7F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 12:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FF510E7E0;
	Thu, 13 Oct 2022 10:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6579A10E7DF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 10:51:35 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 13 Oct 2022 18:51:35 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 29DApTjX073258;
 Thu, 13 Oct 2022 18:51:29 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 13 Oct 2022 18:51:29 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict output
 bandwidth
Date: Thu, 13 Oct 2022 18:51:13 +0800
Message-ID: <20221013105116.180380-2-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013105116.180380-1-allen.chen@ite.com.tw>
References: <20221013105116.180380-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: C902D7E551BA36576A4CA1E87E219A4A356FAF4AE9A8A8A4F6E008F209DF59172002:8
X-MAIL: mse.ite.com.tw 29DApTjX073258
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
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
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
 .../bindings/display/bridge/ite,it6505.yaml   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index 833d11b2303a7..f2c3d1d10359e 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -52,10 +52,51 @@ properties:
     maxItems: 1
     description: extcon specifier for the Power Delivery
 
+  data-lanes:
+    oneOf:
+      - minItems: 1
+        maxItems: 1
+        uniqueItems: true
+        items:
+          enum:
+            - 0
+            - 1
+        description: For one lane operation.
+
+      - minItems: 2
+        maxItems: 2
+        uniqueItems: true
+        items:
+          enum:
+            - 0
+            - 1
+        description: For two lanes operation.
+
+      - minItems: 4
+        maxItems: 4
+        uniqueItems: true
+        items:
+          enum:
+            - 0
+            - 1
+            - 2
+            - 3
+        description: For four lanes operation.
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: A port node pointing to DPI host port node
 
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
+        properties:
+          link-frequencies:
+            minItems: 1
+            maxItems: 1
+            description: Allowed max link frequencies in Hz.
+
 required:
   - compatible
   - ovdd-supply
@@ -84,10 +125,12 @@ examples:
             pwr18-supply = <&it6505_pp18_reg>;
             reset-gpios = <&pio 179 1>;
             extcon = <&usbc_extcon>;
+            data-lanes = <0 1>;
 
             port {
                 it6505_in: endpoint {
                     remote-endpoint = <&dpi_out>;
+                    link-frequencies = /bits/ 64 <150000000>;
                 };
             };
         };
-- 
2.25.1

