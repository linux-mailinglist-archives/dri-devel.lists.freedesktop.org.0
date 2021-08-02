Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C43DD133
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 09:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B5C6E48C;
	Mon,  2 Aug 2021 07:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Mon, 02 Aug 2021 06:43:42 UTC
Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC716E18F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 06:43:41 +0000 (UTC)
X-QQ-mid: bizesmtp54t1627886160tiyh9ajq
Received: from localhost.localdomain (unknown [113.89.245.207])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 02 Aug 2021 14:35:57 +0800 (CST)
X-QQ-SSF: 01100000002000208000D00A0000000
X-QQ-FEAT: iw3rh0TbesOHDW05wTegOh0EvpfnJ+psBGCxaUrRKCRFfJ2oBajdPnmVPOfie
 723fjbXxMsjLC6Xv/SIY7+NTYwd+RjnVCvfmvU4HQupQQydPo7M6GQgeYJj8RtKbOwEw/P5
 UclFbgTM5du3rmwDyURmkgP2MZ9SCa/SkA2J+Mnd4U2dlecYYLL+toPXV8zfPFANryidUKT
 MSZmvLkBpcRZV71RtfDUMojRtjJRjDu9CldIucB9R9nQMITLp/hbOaKbn5QjNv/0jdj+W25
 dxNVKB2cqz+4CfRcsvzN6mV8Jdnas+OW9fsLrrS4m2Cc2A1kCsMBFCIx2QM8r8aq4Q0y1ku
 FO7lvmdzJ/smN6AEmhc1JBvC5cpHNRxjn1NVDT7
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@sipeed.com>
Subject: [PATCH 2/4] dt-bindings: display: add binding for simple-dbi panels
Date: Mon,  2 Aug 2021 14:35:36 +0800
Message-Id: <20210802063538.75583-3-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210802063538.75583-1-icenowy@sipeed.com>
References: <20210802063538.75583-1-icenowy@sipeed.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam2
X-Mailman-Approved-At: Mon, 02 Aug 2021 07:32:22 +0000
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

As we're going to introduce a driver for MIPI DBI panels that need only
standard MIPI-DCS commands to initialize (usually because the controller
has some configuration pre-programmed), add a DT binding file for it,
which now includes only one DBI Type C Option 3 panel, ZSX154-B1206.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 .../bindings/display/simple-dbi.yaml          | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/simple-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/simple-dbi.yaml b/Documentation/devicetree/bindings/display/simple-dbi.yaml
new file mode 100644
index 000000000000..f49b0fda0935
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/simple-dbi.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/simple-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI DCS-compatible DBI panels Device Tree Bindings
+
+maintainers:
+  - Icenowy Zheng <icenowy@sipeed.com>
+
+description:
+  This binding is for display panels that utilizes MIPI DBI Type C, follows
+  MIPI DCS and needs no vendor-specific initialization commands.
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Zhishengxin ZSX154-B1206 1.54" 240x240 SPI LCD
+        items:
+          - const: zsx,zsx154-b1206
+
+  spi-max-frequency:
+    maximum: 30000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zsx,zsx154-b1206
+
+    then:
+      required:
+        - dc-gpios
+        - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0 {
+                    compatible = "zsx,zsx154-b1206";
+                    reg = <0>;
+                    spi-max-frequency = <30000000>;
+                    dc-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&r_pio 2 21 GPIO_ACTIVE_HIGH>;
+            };
+    };
+
+...
-- 
2.30.2

