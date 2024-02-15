Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D304856348
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46DD10E1C9;
	Thu, 15 Feb 2024 12:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="RffNoAU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E2810E1C9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:34:58 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id D311C603EE;
 Thu, 15 Feb 2024 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708000498;
 bh=2YQlVtdBShuw6krXfWfGvayyaRZm4Qpf3bbRehj6cqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RffNoAU9/WKvAlvyGMHmGnSafH4cJfShFKD45j3QdIm5sscQuAvhBTYULdo0aAgoP
 5Rvn+3g5ddqHXv/f7xIMTtqqz8TXo06vIHbzjj9yksrHMEwek5DcC1ysT/5JItXR3D
 8HfmxszLAMIKTS9xuSoTOCXZ2s5YVRGNdk/bl50OVnssg1l3cOrZo0eYVveurzbuON
 FiW7Sddj0tDrflnEPHLa2ciNvO+O19SzO0eL2Km6rfxUnJGF25gBrSZHimMhogt4gy
 xP5kEczE8NwKrnfF60Bz+3UopskiCh/KaeiSgvX8oUibtvpq6wYeYSfl18suQpmPbJ
 ftqxtpng28rZQ==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 02/10] dt-bindings: display: bridge: tc358775: Add
 data-lanes
Date: Thu, 15 Feb 2024 14:31:45 +0200
Message-ID: <20240215123222.42609-3-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215123222.42609-1-tony@atomide.com>
References: <20240215123222.42609-1-tony@atomide.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device uses a clock lane, and 1 to 4 DSI data lanes. Let's add the
data-lanes property starting at 1 similar to what the other bridge
bindings are doing.

Let's also drop the data-lanes properties in the example for the DSI host
controller to avoid confusion. The configuration of the DSI host depends
on the controller used and is unrelated to the bridge binding.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../display/bridge/toshiba,tc358775.yaml      | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -46,11 +46,27 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: |
           DSI Input. The remote endpoint phandle should be a
           reference to a valid mipi_dsi_host device node.
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: |
@@ -107,6 +123,7 @@ examples:
                     reg = <0>;
                     d2l_in_test: endpoint {
                         remote-endpoint = <&dsi0_out>;
+                        data-lanes = <1 2 3 4>;
                     };
                 };
 
@@ -131,7 +148,6 @@ examples:
                 reg = <1>;
                 dsi0_out: endpoint {
                     remote-endpoint = <&d2l_in_test>;
-                    data-lanes = <0 1 2 3>;
                 };
              };
          };
@@ -166,6 +182,7 @@ examples:
                     reg = <0>;
                     d2l_in_dual: endpoint {
                         remote-endpoint = <&dsi0_out_dual>;
+                        data-lanes = <1 2 3 4>;
                     };
                 };
 
@@ -197,7 +214,6 @@ examples:
                 reg = <1>;
                 dsi0_out_dual: endpoint {
                     remote-endpoint = <&d2l_in_dual>;
-                    data-lanes = <0 1 2 3>;
                 };
              };
          };
-- 
2.43.1
