Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E04D5D78
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 09:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49310E525;
	Fri, 11 Mar 2022 08:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE8B10E525
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 08:33:35 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nSaiL-0000ae-AS; Fri, 11 Mar 2022 09:33:33 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nSaiE-0040iF-Sd; Fri, 11 Mar 2022 09:33:26 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 24/24] dt-bindings: display: rockchip: dw-hdmi: fix ports
 description
Date: Fri, 11 Mar 2022 09:33:23 +0100
Message-Id: <20220311083323.887372-25-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220311083323.887372-1-s.hauer@pengutronix.de>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current port description doesn't cover all possible cases. It currently
expects one single port with two endpoints.

When the HDMI connector is described in the device tree there can be two
ports, first one going to the VOP and the second one going to the connector.

Also on SoCs which only have a single VOP there will be only one
endpoint instead of two.

This patch addresses both issues. With this there can either be a single
port ("port") , or two of them ("port@0", "port@1") when the connector
is also in the device tree. Also the first or only port can either have
one endpoint ("endpoint") for single VOP SoCs or two ("endpoint@0",
"endpoint@1") for dual VOP SoCs.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    Changes since v6:
    - Add Reviewed-by: Rob Herring <robh@kernel.org>
    Changes since v5:
    - new patch
    
    Changes since v7:
    - Drop unnecessary hclk
    
    Changes since v5:
    - Drop unnecessary #size-cells/#address-cells from nodes with only single endpoint

 .../display/rockchip/rockchip,dw-hdmi.yaml    | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index ff5cf9fe20904..1f2fd579c510e 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -102,27 +102,21 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+    patternProperties:
+      "^port(@0)?$":
+        $ref: /schemas/graph.yaml#/properties/port
         description: Input of the DWC HDMI TX
-
         properties:
+          endpoint:
+            description: Connection to the VOP
           endpoint@0:
-            $ref: /schemas/graph.yaml#/properties/endpoint
             description: Connection to the VOPB
-
           endpoint@1:
-            $ref: /schemas/graph.yaml#/properties/endpoint
             description: Connection to the VOPL
-
-        required:
-          - endpoint@0
-          - endpoint@1
-
-    required:
-      - port
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the DWC HDMI TX
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.30.2

