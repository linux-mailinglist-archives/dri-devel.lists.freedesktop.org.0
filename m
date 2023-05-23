Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713870D72A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416E210E40C;
	Tue, 23 May 2023 08:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F3110E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 08:20:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1q1NFB-00042m-Vo; Tue, 23 May 2023 10:19:46 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1q1NFA-002CaT-VV; Tue, 23 May 2023 10:19:44 +0200
Received: from localhost ([::1] helo=dude03.red.stw.pengutronix.de)
 by dude03.red.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1q1NF9-006uEf-PF; Tue, 23 May 2023 10:19:43 +0200
From: Johannes Zink <j.zink@pengutronix.de>
Date: Tue, 23 May 2023 10:19:42 +0200
Subject: [PATCH v2 2/3] dt-bindings: display: simple: support non-default
 data-mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230523-simplepanel_support_nondefault_datamapping-v2-2-87196f0d0b64@pengutronix.de>
References: <20230523-simplepanel_support_nondefault_datamapping-v2-0-87196f0d0b64@pengutronix.de>
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v2-0-87196f0d0b64@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: j.zink@pengutronix.de
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Displays support more than just a single default lvds data mapping,
which can be used to run displays on only 3 LVDS lanes in the jeida-18
data-mapping mode.

Add an optional data-mapping property to allow overriding the default
data mapping. As it does not generally apply to any display and bus: use
it selectively on the innolux,g101ice-l01, which supports changing the
data mapping via a strapping pin.

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

---

Changes:

v1 -> v2: - worked in Rob's review findings (thanks for reviewing my
            work): use extracted common property instead of duplicating
	    the property
	  - refined commit message
	  - add an example dts for automated checking
---
 .../bindings/display/panel/panel-simple.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index ec50dd268314..698301c8c920 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -21,9 +21,9 @@ description: |
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: ../lvds-data-mapping.yaml#
 
 properties:
-
   compatible:
     enum:
     # compatible must be listed in alphabetical order, ordered by compatible.
@@ -353,6 +353,17 @@ properties:
   power-supply: true
   no-hpd: true
   hpd-gpios: true
+  data-mapping: true
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: innolux,g101ice-l01
+then:
+  properties:
+    data-mapping: false
 
 additionalProperties: false
 
@@ -372,3 +383,16 @@ examples:
         };
       };
     };
+  - |
+    panel_lvds: panel-lvds {
+      compatible = "innolux,g101ice-l01";
+      power-supply = <&vcc_lcd_reg>;
+
+      data-mapping = "jeida-24";
+
+      port {
+        panel_in_lvds: endpoint {
+          remote-endpoint = <&ltdc_out_lvds>;
+        };
+      };
+    };

-- 
2.39.2

