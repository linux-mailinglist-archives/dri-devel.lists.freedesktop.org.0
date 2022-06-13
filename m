Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E05485E5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29CE10E87C;
	Mon, 13 Jun 2022 14:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0910E879
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:57:29 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id e80so6338969iof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 07:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vf+DFErkUOgrAEhjpjh0uyrSpN6w360tMGoM1ti+yys=;
 b=ZfGQoizJUVlFVgYT2ii61GoN0I5gK+Ev94B8c3RhB/nhZjWC+1OmkXfOsZba40ende
 u7VzKtO2QQ4VNOXle3kyxE8wbxIgXLg57l7l/fqz31uVKZkUUL9GUEev/Qu9vDyYqGDN
 XA6GBWpP04GAUUmstprSYJ9ck25G8dzOraYvkrLF1HTEfK2Yz48uFEy9dinca0jaFbt8
 MfpDfYu4oLZswCaaIEuKytGnV0maCE9AEnfCICRT5HvMZYy5/pCkLWQET/2Gi3iDXp2X
 MLND3ejF6BjVVLxyYf8L6uIzh886jIBDyt62GucY45vZy5p0S9msyWO2GbYIVNBQzWDO
 np0A==
X-Gm-Message-State: AOAM532Ldr9qzLcNITrn/abfYQ2+zJr16DbpWElvt3qbnv3X+78dO7dp
 bvex0zhtZHPyzKP6/mTuzw==
X-Google-Smtp-Source: ABdhPJzNK3lR7+aIWGt4CeK//NM/uOVYLfLtmdaCa2ptBKeLbsW/SJRNSxVYoMpUUqHSdrnJuYru0w==
X-Received: by 2002:a05:6638:3787:b0:331:aaf5:950c with SMTP id
 w7-20020a056638378700b00331aaf5950cmr121036jal.118.1655132248369; 
 Mon, 13 Jun 2022 07:57:28 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
 by smtp.googlemail.com with ESMTPSA id
 r6-20020a924406000000b002cde6e352f8sm4009929ila.66.2022.06.13.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 07:57:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] dt-bindings: display: Add Arm virtual platforms display
Date: Mon, 13 Jun 2022 08:57:09 -0600
Message-Id: <20220613145709.3729053-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'arm,rtsm-display' is a panel for Arm, Ltd. virtual platforms (e.g. FVP).
The binding has been in use for a long time, but was never documented.

Some users and an example have a 'panel-dpi' compatible, but that's not
needed without a 'panel-timing' node which none of the users have since
commit 928faf5e3e8d ("arm64: dts: fvp: Remove panel timings"). The
example does have a 'panel-timing' node, but it should not for the
same reasons the node was removed in the dts files. So update the
example in arm,pl11x.yaml to match the schema.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Make arm,rtsm-display its own schema file instead of using
   panel-simple.
---
 .../bindings/display/arm,pl11x.yaml           | 15 +----------
 .../display/panel/arm,rtsm-display.yaml       | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/arm,rtsm-display.yaml

diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.yaml b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
index b545c6d20325..6cc9045e5c68 100644
--- a/Documentation/devicetree/bindings/display/arm,pl11x.yaml
+++ b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
@@ -159,25 +159,12 @@ examples:
     };
 
     panel {
-        compatible = "arm,rtsm-display", "panel-dpi";
-        power-supply = <&vcc_supply>;
+        compatible = "arm,rtsm-display";
 
         port {
             clcd_panel: endpoint {
                 remote-endpoint = <&clcd_pads>;
             };
         };
-
-        panel-timing {
-            clock-frequency = <25175000>;
-            hactive = <640>;
-            hback-porch = <40>;
-            hfront-porch = <24>;
-            hsync-len = <96>;
-            vactive = <480>;
-            vback-porch = <32>;
-            vfront-porch = <11>;
-            vsync-len = <2>;
-        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/arm,rtsm-display.yaml b/Documentation/devicetree/bindings/display/panel/arm,rtsm-display.yaml
new file mode 100644
index 000000000000..4ad484f09ba3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/arm,rtsm-display.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/arm,rtsm-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm RTSM Virtual Platforms Display
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: arm,rtsm-display
+
+  port: true
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+...
-- 
2.34.1

