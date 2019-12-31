Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488112D8F2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 14:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE01989C1C;
	Tue, 31 Dec 2019 13:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02C96E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 13:21:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 60E4420028;
 Tue, 31 Dec 2019 14:21:27 +0100 (CET)
Date: Tue, 31 Dec 2019 14:21:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v1 1/1] dt-bindings: one binding file for all simple panels
Message-ID: <20191231132126.GA13365@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=voM4FWlXAAAA:8 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=7CQSdrXTAAAA:8 a=e5mUnYsNAAAA:8
 a=gEfo2CItAAAA:8 a=Ikd4Dj_1AAAA:8 a=TIQEEzFWEOJ-DOevGTsA:9
 a=AQjecubTcCjHfhEV:21 a=lMevrfP4_ZKGT_g4:21 a=CjuIK1q_8ugA:10
 a=IC2XNlieTeVoXbcui8wp:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thierry - I would appreciate feedback from you on this approach!

There is an increasing number of new simple panels.
Common for all simple panels are that they have a
mandatory power-supply and some of them have backlight and / or
an enable gpio.

The binding file to describe these panels adds overhead
that really do not add value.
The binding are known and there is nothing gained from a specific
example as they all look alike.

The following patch introduces a single panel-simple.yaml
and converts two ampire bindings over to the new file.

The conversion - if applied will have following effects:

- The maintainer for the individual file will change
    There is no need for many different maintainers for a simple binding.
    We have the same situation with the panel-simple driver in the kernel.

- The license will change to (GPL-2.0-only OR BSD-2-Clause)
    There is usually only a single line copied from the original
    file, a line that is often copied from a datasheet.
    This license change should be acceptable considered what little
    is copied.
    If the license change is not OK we can use a dedicated binding
    file in these cases.

This is a follow-up on Rob's big patch converting a lot of panel bindings
to individual files:

"dt-bindings: display: Convert a bunch of panels to DT schema"
https://patchwork.ozlabs.org/patch/1197683/

The objectives with one file for all the simple panles are:
- Make it simpler to add bindings for simple panels
- Keep the number of bindings file lower and thus easier to find a
  relevant file to copy from when adding new panels.
- Keep the binding documentation for simple panels more consistent
- Make it simpler to add support for new panels

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
 .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 --------------
 .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
 .../bindings/display/panel/panel-simple.yaml  | 56 +++++++++++++++++++
 3 files changed, 56 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
deleted file mode 100644
index c6e33e7f36d0..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
+++ /dev/null
@@ -1,42 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/ampire,am-480272h3tmqw-t01h.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
-
-maintainers:
-  - Yannick Fertre <yannick.fertre@st.com>
-  - Thierry Reding <treding@nvidia.com>
-
-allOf:
-  - $ref: panel-common.yaml#
-
-properties:
-  compatible:
-    const: ampire,am-480272h3tmqw-t01h
-
-  power-supply: true
-  enable-gpios: true
-  backlight: true
-  port: true
-
-required:
-  - compatible
-
-additionalProperties: false
-
-examples:
-  - |
-    panel_rgb: panel {
-      compatible = "ampire,am-480272h3tmqw-t01h";
-      enable-gpios = <&gpioa 8 1>;
-      port {
-        panel_in_rgb: endpoint {
-          remote-endpoint = <&controller_out_rgb>;
-        };
-      };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
deleted file mode 100644
index 83e2cae1cc1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "ampire,am800480r3tmqwa1h"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
new file mode 100644
index 000000000000..711fac0a4d12
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple panels
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the simple (dump) panels that
+  requires only a power-supply.
+  There are optionally a backlight and an enable GPIO.
+  If the panel is more andvanced a dedicated binding file is required. 
+  The panel may use a port binding for the association to the display,
+  or it may be a direct child node of the display.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+    # compatible must be listed in alphabetical order, ordered by compatible.
+    # The description in the comment is mandatory for each compatible.
+
+    # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
+    - ampire,am-480272h3tmqw-t01h
+    # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
+    - ampire,am800480r3tmqwa1h
+
+  backlight: true
+  enable-gpios: true
+  power-supply: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+examples:
+  - |
+    panel_rgb: panel-rgb {
+      compatible = "ampire,am-480272h3tmqw-t01h";
+      port {
+        panel_in_rgb: endpoint {
+          remote-endpoint = <&ltdc_out_rgb>;
+        };
+      };
+    };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
