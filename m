Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC54180C7D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526DC6E909;
	Tue, 10 Mar 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 10 Mar 2020 19:44:45 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28B9689CAC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 19:44:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,538,1574089200"; d="scan'208";a="41516787"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 11 Mar 2020 04:39:40 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC0A940E36FF;
 Wed, 11 Mar 2020 04:39:37 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v8] dt-bindings: display: Add idk-2121wr binding
Date: Tue, 10 Mar 2020 19:39:29 +0000
Message-Id: <1583869169-1006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add binding for the idk-2121wr LVDS panel from Advantech.

Some panel-specific documentation can be found here:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---

Hi All,
This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
all the patches have been accepted from it except this one. I have fixed
Rob's comments in this version of the patch.

[1] https://patchwork.kernel.org/cover/11297589/

V7->8
 * Dropped ref to lvds.yaml, since the panel a dual channel LVDS, as a
   result the root port is called as ports instead of port and the child
   node port@0 and port@1 are used for even and odd pixels, hence binding
   has required property as ports instead of port.

v6->7
 * Added reference to lvds.yaml
 * Changed maintainer to myself
 * Switched to dual license
 * Dropped required properties except for ports as rest are already listed
   in lvds.panel
 * Dropped Reviewed-by tag of Laurent, due to the changes made it might not
   be valid.

v5->v6:
 * No change

v4->v5:
* No change

v3->v4:
* Absorbed patch "dt-bindings: display: Add bindings for LVDS
  bus-timings"
* Big restructuring after Rob's and Laurent's comments

v2->v3:
* New patch

 .../display/panel/advantech,idk-2121wr.yaml        | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
new file mode 100644
index 0000000..6b7fddc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/advantech,idk-2121wr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Advantech IDK-2121WR 21.5" Full-HD dual-LVDS panel
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  The IDK-2121WR from Advantech is a Full-HD dual-LVDS panel.
+  A dual-LVDS interface is a dual-link connection with even pixels traveling
+  on one link, and with odd pixels traveling on the other link.
+
+  The panel expects odd pixels on the first port, and even pixels on the
+  second port, therefore the ports must be marked accordingly (with either
+  dual-lvds-odd-pixels or dual-lvds-even-pixels).
+
+properties:
+  compatible:
+    items:
+      - const: advantech,idk-2121wr
+      - {} # panel-lvds, but not listed here to avoid false select
+
+  width-mm:
+    const: 476
+
+  height-mm:
+    const: 268
+
+  data-mapping:
+    const: vesa-24
+
+  panel-timing: true
+
+  ports:
+    type: object
+    properties:
+      port@0:
+        type: object
+        description: The sink for odd pixels.
+        properties:
+          reg:
+            const: 0
+
+          dual-lvds-odd-pixels: true
+
+        required:
+          - reg
+          - dual-lvds-odd-pixels
+
+      port@1:
+        type: object
+        description: The sink for even pixels.
+        properties:
+          reg:
+            const: 1
+
+          dual-lvds-even-pixels: true
+
+        required:
+          - reg
+          - dual-lvds-even-pixels
+
+additionalProperties: false
+
+required:
+  - compatible
+  - width-mm
+  - height-mm
+  - data-mapping
+  - panel-timing
+  - ports
+
+examples:
+  - |+
+    panel-lvds {
+      compatible = "advantech,idk-2121wr", "panel-lvds";
+
+      width-mm = <476>;
+      height-mm = <268>;
+
+      data-mapping = "vesa-24";
+
+      panel-timing {
+        clock-frequency = <148500000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hsync-len = <44>;
+        hfront-porch = <88>;
+        hback-porch = <148>;
+        vfront-porch = <4>;
+        vback-porch = <36>;
+        vsync-len = <5>;
+      };
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          dual-lvds-odd-pixels;
+          panel_in0: endpoint {
+            remote-endpoint = <&lvds0_out>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          dual-lvds-even-pixels;
+          panel_in1: endpoint {
+            remote-endpoint = <&lvds1_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
