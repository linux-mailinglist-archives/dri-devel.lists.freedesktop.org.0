Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37268AB59BA
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3F10E1AA;
	Tue, 13 May 2025 16:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="Kwycc4Hv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC58C10E1AA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=2LurGoPkc6Eg3ZIhwGtbJARXq0QoaSbCX/2p8hC7Mh4=; b=Kwycc4HvYwfW25ZlZaLRjNIj07
 MrX5/qkDmTwo0FTrnj1sgOu/+s8mhaKH/33RMER9ZSw/wgkBoRr2J01wfylJZt79Fg7F4m3QeA9Do
 LQX7C+c+OtUvlMLTZO6kHDyFqAd0yxHAiA3ZaT0DBW/hiFIg7x3sVs+vZu6NB9EB6tMw=;
Received: from [70.80.174.168] (port=43212 helo=pettiford.lan)
 by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uEsPH-000211-BD; Tue, 13 May 2025 12:23:04 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: hugo@hugovil.com, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Tue, 13 May 2025 12:23:00 -0400
Message-Id: <20250513162300.532693-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.2
Subject: [PATCH] dt-bindings: display: bridge: renesas,
 dsi: allow properties from dsi-controller
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Allow to inherit valid properties from the dsi-controller. This fixes the
following warning when adding a panel property:

rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
    match any of the regexes: 'pinctrl-[0-9]+'
    from schema $id:
        http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#

Also add a panel property to the example.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index e08c24633926b..e0906a46fb118 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -128,14 +128,17 @@ required:
   - power-domains
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/clock/r9a07g044-cpg.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     dsi0: dsi@10850000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
         compatible = "renesas,r9a07g044-mipi-dsi", "renesas,rzg2l-mipi-dsi";
         reg = <0x10850000 0x20000>;
         interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
@@ -160,6 +163,20 @@ examples:
         reset-names = "rst", "arst", "prst";
         power-domains = <&cpg>;
 
+        panel@0 {
+            compatible = "rocktech,jh057n00900";
+            reg = <0>;
+            vcc-supply = <&reg_2v8_p>;
+            iovcc-supply = <&reg_1v8_p>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -175,7 +192,7 @@ examples:
                 reg = <1>;
                 dsi0_out: endpoint {
                     data-lanes = <1 2 3 4>;
-                    remote-endpoint = <&adv7535_in>;
+                    remote-endpoint = <&panel_in>;
                 };
             };
         };

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
-- 
2.39.5

