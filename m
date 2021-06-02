Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1383994A8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712C26EE6D;
	Wed,  2 Jun 2021 20:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F936EE6C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:37:40 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B5A8E82C9B;
 Wed,  2 Jun 2021 22:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622666258;
 bh=VvBVFBPnwWvLw8jju1scxTT4dsm7ZkjjbxUCqXLJ2PY=;
 h=From:To:Cc:Subject:Date:From;
 b=dJ/P1Ts1Py5kYfTjGly4OWtZnRTTAWQMwX7wn7/+rIT3oCs/519hA4env2V+bY1B2
 kwOm9m6uLW1tTO1D6HrwDf+pBWIuXwjhYnpZud233owXQzxkyZiRHIGC6jIpzLdR9D
 ib3pUdzEoEoAUmqVfMa8HlVP+THrCDZ868FU3VnpIK5FDsTxZu6+lPhe32NytoGci1
 FwKdsN9LtxaYmvaqWJNkrziIrCTxJE2YKyrjS8geOviJIna/sV4wVJWM9Ybm3+Ppkw
 /V/RQTjhMrgidIijJ5/uSrU5Zn6/xmWoEhGr+dB6rVhc8w/gI9O1GU+mw5tqk9o7DH
 hAZGY4vJczxbw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/2] dt-bindings: display: bridge: lvds-codec: Document
 LVDS data mapping select
Date: Wed,  2 Jun 2021 22:37:30 +0200
Message-Id: <20210602203731.419310-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, ch@denx.de,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Decoder input LVDS format is a property of the decoder chip or even
its strapping. Add DT property data-mapping the same way lvds-panel
does, to define the LVDS data mapping.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Use allOf
    - Move the data-mapping to endpoint
---
 .../bindings/display/bridge/lvds-codec.yaml   | 53 ++++++++++++++-----
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index cacafa61e3f52..c493d007785ca 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -68,6 +68,18 @@ properties:
           For LVDS encoders, port 1 is the LVDS output
           For LVDS decoders, port 1 is the parallel output
 
+        properties:
+          endpoint:
+            properties:
+              data-mapping:
+                enum:
+                  - jeida-18
+                  - jeida-24
+                  - vesa-24
+                description: |
+                  The color signals mapping order. See details in
+                  Documentation/devicetree/bindings/display/panel/lvds.yaml
+
     required:
       - port@0
       - port@1
@@ -79,21 +91,38 @@ properties:
 
   power-supply: true
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          const: lvds-encoder
-then:
-  properties:
-    ports:
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: lvds-encoder
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  properties:
+                    pclk-sample: false
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: lvds-decoder
+    then:
       properties:
-        port@0:
+        ports:
           properties:
-            endpoint:
+            port@1:
               properties:
-                pclk-sample: false
+                endpoint:
+                  properties:
+                    data-mapping: false
 
 required:
   - compatible
-- 
2.30.2

