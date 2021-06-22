Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713B03B1064
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 01:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0DE6E087;
	Tue, 22 Jun 2021 23:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFDA6E087
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 23:11:53 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA95AA66;
 Wed, 23 Jun 2021 01:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624403511;
 bh=uZC7sopp+vxOG159NLgXzUDh0pD0kUjE7c7PBO1aBVM=;
 h=From:To:Cc:Subject:Date:From;
 b=Frv+m2psrQ+tK1MZ8xrRj1vJWI35m5nq3IillypB1dETwmc179uNaaUeouJJlHp5i
 O3BKC26iRNyJ6FO3YU/2nwAlw+2DR1NgHfMv2XwbskhyGCJTKsT9ZcC6DA0dEyQIy0
 BRM/B4B9CL52sFqGzxeB25wljAVcOz4qJpNe6XfQ=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] dt-bindings: display: renesas,
 du: Provide bindings for r8a779a0
Date: Wed, 23 Jun 2021 00:11:46 +0100
Message-Id: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Extend the Renesas DU display bindings to support the r8a779a0 V3U.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../bindings/display/renesas,du.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 121596f106da..febbd89a646e 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -39,6 +39,7 @@ properties:
       - renesas,du-r8a77980 # for R-Car V3H compatible DU
       - renesas,du-r8a77990 # for R-Car E3 compatible DU
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
+      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
 
   reg:
     maxItems: 1
@@ -774,6 +775,57 @@ allOf:
         - reset-names
         - renesas,vsps
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a779a0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+
+        clock-names:
+          items:
+            - const: du.0
+            - const: du.1
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DSI 0
+            port@1:
+              description: DSI 1
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+        renesas,vsps:
+          minItems: 2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
 additionalProperties: false
 
 examples:
-- 
2.30.2

