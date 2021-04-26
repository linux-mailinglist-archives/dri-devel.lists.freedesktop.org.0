Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25636ABF5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 08:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3C389FDE;
	Mon, 26 Apr 2021 05:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C51C89FC8;
 Mon, 26 Apr 2021 05:59:54 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Apr 2021 22:59:54 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Apr 2021 22:59:52 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 26 Apr 2021 11:29:24 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 6C5B4212BD; Mon, 26 Apr 2021 11:29:23 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Date: Mon, 26 Apr 2021 11:29:15 +0530
Message-Id: <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: mkrishn@codeaurora.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for DisplayPort aux backlight driver.

Changes in v2:
- New

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
new file mode 100644
index 00000000..0fa8bf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DisplayPort aux backlight driver bindings
+
+maintainers:
+  - Rajeev Nandan <rajeevny@codeaurora.org>
+
+description:
+  Backlight driver to control the brightness over DisplayPort aux channel.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: dp-aux-backlight
+
+  ddc-i2c-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the system I2C controller connected to the DDC bus used
+      for the DisplayPort AUX channel.
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for backlight enable pin.
+
+  max-brightness: true
+
+required:
+  - compatible
+  - ddc-i2c-bus
+
+additionalProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "dp-aux-backlight";
+        ddc-i2c-bus = <&sn65dsi86_bridge>;
+        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+        max-brightness = <2047>;
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
