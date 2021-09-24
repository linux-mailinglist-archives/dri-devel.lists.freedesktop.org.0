Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD1418051
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765C6E3C6;
	Sat, 25 Sep 2021 08:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62DD6EE84
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:45:05 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id n23so7191037pfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gFs+xx2qBOTJUs4a6bSmi6bDzVEq4nz1xAMrovAUtoE=;
 b=Mg9Bxa76EEKyFK6smxpytkPNqX1zOloVPCNYTPB+ewz8nni7T0chkGlsHthrKQBHRH
 AkYCGLypsd1QFl16fL14fMXdfRPotaj6F53OdxRVgy6aaBH+fkAzMteSriYqU8SmV1/u
 2LxFhXGtJVE0AA3o1Wa86oCfef97pnqJ4p+dRgCVaIe9EfiZAjThlxBQ4hQoOnFPpk1c
 UACo3RM/+tqE7l3LT1JinN41+OotSw5UhjF7YfzO0OrfRt6D25prucmo5AfaUKXOapXy
 s8ng3fkvgJkFT9ytXzZucyqagdO0/jR9a9QU3C//wZ0XttcZNn7vC98crqf2wAzIwuON
 MRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gFs+xx2qBOTJUs4a6bSmi6bDzVEq4nz1xAMrovAUtoE=;
 b=Z/TqJJbfQ+WcrMa+qgKKD5t/E5bNR6xRN6ZIwsOlqd4MgKz6cyagVyI3g4CJE93EmH
 r5mwpIIiOO6JabybVkcKFs+UmV1oRAs6L1N7gaMhjoxLN9g9FulZq3U+NlPr5UdGV9Js
 7j5P+DIpS9iuzFugUlCrmT3FbxkUN0G1z9hNr5E55TMQ+JXdIoN7L/cuyNBPqfeyTe5y
 F3E+2nOEZKW/0IvzxZ/FnhDby6ANtfKteGR05sxrzy+FZfo2gpXwpLke8Ie/bCXUWrbd
 FlerxHEpNeCLPzLPt+h+VQVGgCKFeubyzjVjm83Y4+yaLHdBwO47z+m9CJK+I+aX6sKE
 2QvQ==
X-Gm-Message-State: AOAM531lTuyutt6QMc8VOcupVltXZKmaVi8B1iByUUtobohM1KHB2dUS
 TSSqVbtUl36PqAsMg4qUflk=
X-Google-Smtp-Source: ABdhPJzI7wVCm7EJ7b/pazQsMAKQyZzjxKf3+EJXPlBB22bv9G7FimypjJ0FhwNg17XfS1Gsxhb2Vg==
X-Received: by 2002:a63:3504:: with SMTP id c4mr5389911pga.203.1632519905278; 
 Fri, 24 Sep 2021 14:45:05 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n66sm9842029pfn.142.2021.09.24.14.45.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:45:04 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Justin Chen <justinpopo6@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK),
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH net-next 1/5] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Date: Fri, 24 Sep 2021 14:44:47 -0700
Message-Id: <1632519891-26510-2-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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

From: Florian Fainelli <f.fainelli@gmail.com>

Add a binding document for the Broadcom ASP 2.0 Ethernet controller.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
---
 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
new file mode 100644
index 0000000..bab31d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Broadcom ASP 2.0 Ethernet controller
+
+maintainers:
+  - Justin Chen <justinpopo6@gmail.com>
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: Broadcom Ethernet controller first introduced with 72165
+
+properties:
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 1
+
+  compatible:
+    enum:
+      - brcm,bcm72165-asp-v2.0
+      - brcm,asp-v2.0
+
+  reg:
+    maxItems: 1
+    description: ASP registers
+
+  ranges: true
+
+  interrupts:
+    minItems: 1
+    maxItems: 3
+    items:
+      - description: RX/TX interrupt
+      - description: Port 0 Wake-on-LAN
+      - description: Port 1 Wake-on-LAN
+
+  clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to clock controller
+
+  clock-names:
+    const: sw_asp
+
+  brcm,reserved-net-filters-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: bitmap of reserved network filters that the driver will not use.
+
+  mdio:
+    type: object
+    $ref: brcm,unimac-mdio.yaml#
+
+  ethernet-ports:
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-9]+$":
+        type: object
+
+        $ref: ethernet-controller.yaml#
+
+        properties:
+          reg:
+            maxItems: 1
+            description: Port number
+
+          channel:
+            maxItems: 1
+            description: ASP channel number
+
+        required:
+         - reg
+         - channel
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    asp@9c00000 {
+        compatible = "brcm,asp-v2.0";
+        reg = <0x9c00000 0x1fff14>;
+        interrupts = <0x0 0x33 0x4>;
+        ranges;
+        clocks = <&scmi 14>;
+        clock-names = "sw_asp";
+        brcm,reserved-net-filters-mask = <0xff>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mdio@c614 {
+            compatible = "brcm,asp-v2.0-mdio";
+            reg = <0xc614 0x8>;
+            reg-names = "mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy0: ethernet-phy@1 {
+                reg = <1>;
+            };
+       };
+
+        mdio@ce14 {
+            compatible = "brcm,asp-v2.0-mdio";
+            reg = <0xce14 0x8>;
+            reg-names = "mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                channel = <8>;
+                phy-mode = "rgmii";
+                phy-handle = <&phy0>;
+            };
+
+            port@1 {
+                reg = <1>;
+                channel = <9>;
+                phy-mode = "rgmii";
+                phy-handle = <&phy1>;
+            };
+        };
+    };
-- 
2.7.4

