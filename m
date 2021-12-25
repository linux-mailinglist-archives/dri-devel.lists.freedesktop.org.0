Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6C47F472
	for <lists+dri-devel@lfdr.de>; Sat, 25 Dec 2021 21:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C3B10E20C;
	Sat, 25 Dec 2021 20:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF8B10E186;
 Sat, 25 Dec 2021 20:54:13 +0000 (UTC)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 500D42243C;
 Sat, 25 Dec 2021 21:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1640465649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=150UHBr6HzAaBdUskEOm6GoTKRc5CVonpyHjfrtUJVo=;
 b=GpsEd06seJGr8ThNPxco1TE8cGwqqioyusv18iGfQrQza222peA8uCV4vxR39gC96V65aP
 hrP/8AWPcittQo8hvrujChvReDls5fMQ6nFst2HgytZpC0xPp9yjwz+bN2nKHFbwkho6wR
 Q91dZMq3xSyWFzbjsRdaqmzgbWkeu3Y=
From: David Heidelberg <david@ixit.cz>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
Subject: [PATCH] Discussion: dt-bindings: display: msm: dsi-controller-main:
 fix the binding
Date: Sat, 25 Dec 2021 21:53:51 +0100
Message-Id: <20211225205352.76827-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Heidelberg <david@ixit.cz>, freedreno@lists.freedesktop.org,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This binding is not much validating the old DSI v2.

Currently we don't differentiate old v2 from new versions,
so we need to figure out how to validate them.

I propose specific compatible depending on mdss version, but I would be
glad, if someone with deeper knowledge proposed the names.

I'm willing to implement it then and back from autodetection.

David
---
 .../display/msm/dsi-controller-main.yaml      | 53 ++++++++++++-------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 35426fde8610..6688ddcd7526 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,22 +27,34 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display escape clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    oneOf:
+      - minItems: 7 # APQ8064
+        maxItems: 7
+      - items:
+          - description: Display byte clock
+          - description: Display byte interface clock
+          - description: Display pixel clock
+          - description: Display escape clock
+          - description: Display AHB clock
+          - description: Display AXI clock
 
   clock-names:
-    items:
-      - const: byte
-      - const: byte_intf
-      - const: pixel
-      - const: core
-      - const: iface
-      - const: bus
+    oneOf:
+      - items: # DSI v2 (APQ8064)
+          - const: iface # from dsi_v2_bus_clk_names
+          - const: bus
+          - const: core_mmss
+          - const: src # from dsi_clk_init_v2
+          - const: byte # from dsi_clk_init
+          - const: pixel
+          - const: core
+      - items:
+          - const: byte
+          - const: byte_intf
+          - const: pixel
+          - const: core
+          - const: iface
+          - const: bus
 
   phys:
     maxItems: 1
@@ -66,15 +78,17 @@ properties:
 
   assigned-clocks:
     minItems: 2
-    maxItems: 2
+    maxItems: 4
     description: |
       Parents of "byte" and "pixel" for the given platform.
+      For older v2, "byte", "esc", "src" and "pixel".
 
   assigned-clock-parents:
     minItems: 2
-    maxItems: 2
+    maxItems: 4
     description: |
       The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
+      For older v2, Byte, Escape, Source and Pixel clock PLL outputs.
 
   power-domains:
     maxItems: 1
@@ -124,6 +138,9 @@ properties:
       - port@0
       - port@1
 
+patternProperties:
+  '^(avdd|vdd|vdda)-supply$': true # FIXME only APQ8064 supplies
+
 required:
   - compatible
   - reg
@@ -135,8 +152,8 @@ required:
   - phy-names
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
-  - operating-points-v2
+  # - power-domains # v2 doesn't seems to need it?
+  # - operating-points-v2 # v2 doesn't have opp implemented yet
   - ports
 
 additionalProperties: false
-- 
2.34.1

