Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C9A45CF9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A20D10E1D8;
	Wed, 26 Feb 2025 11:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I1qLgYAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A155D10E1D4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:35 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2232b12cd36so7855085ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740569195; x=1741173995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJGZpWbDvkxIZVmJShYLY/mP8QNbEoEXn4nR1fnmnoA=;
 b=I1qLgYAHVL+yq47FTROI0bB+IeLl6mOc0gbtDLAA7vmigLPdQKS7pNBerm8XYVkOfD
 qEkuzp6KlIl7ZIlb4YJsVwNq4/eKqzK+7U29qdYhZkKc61Eh5FFCwaG0GKihx1Px6N9N
 /lN2Y/aJwmu7Vmnhq7NpnbQ9datVjuuYQiIGdJZtxUOjtbR6JHBDOaYXUclcDlQpJv1N
 P5CTH1ZREMP6zKhFBxVJ/RGRxXdfUpSYj2pxxzFdPtLXYvCF3+pkTDMuaohjhOGu3Cyu
 pNFMp2oW6cRRRlrk96Sn6ApoDPVcgOzefJjtpagjRxoNVSujOkEEKBHYVIX5uFp9+kmg
 blNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740569195; x=1741173995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJGZpWbDvkxIZVmJShYLY/mP8QNbEoEXn4nR1fnmnoA=;
 b=QxA9JmKRvgO9pF/OkOrQAoKT/tEV8nAfsYUqst4US1p3nBu24K1sOeyljCYoERJ1sJ
 B1FxDOZo0KP9CNUBy4XawT0BWCOmqLXRH+uezUF3hEtGnP7EsMlRrtQjmjqwswtOyhgX
 53FMHzCDZwPxU9mzgT5zI6rO245hxH7cBm5kmNBVf/SSeQrMigIqPkz5H6dV0NXOuo0z
 Yg/c2Ej1PjpAm6hPaVYJxSr71olsMvmvnYJj/ISP6HYH9/gDipgzVFHJQtTQQ+owylQF
 lLdTWALVWRV8QCBT6M+ojkUym4kMjWVzIpvkPDTJxtd8Qd9ZwFP9d4edqmoMdvzUHEIL
 6gaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX/pj6mM5r9tpyyhhyXzWfr48jIhAwGt1mMULaRLs/I+3Ewiap4pwLURk5xo9zz3d8vxiC10TOHOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCoKdzqO/UTz8RfW4oEgGhrDdjONrd8kDBtyPVu/q8OcUvYp2x
 YatsodileqMsgKPgyQNdVJmQC8sg5Vk3Ad86/nKTGKGBtkyNtMPJ
X-Gm-Gg: ASbGncuWWrBUowpdTHoz7XDRl88AhkSN/Fx/a1s/DOX8dpM5wHyhk3NFdY9xNPp6TfO
 MNefjXhYNnyQj8TD92gd4B5yDP5lo+lIURWKCv3/qMjptXzoQ/AHBY6Fvul2IQzbTPHk4ydbAKw
 drgXS4NWReg98Ktk38sfV2GESvZT9sy+Rq+zG4/EW9wxfQCYXQrp8wCbrLx97cOk/1NqLPsK67O
 XmVKx1fSLW9K/k8fouODzpStglGYBOPvh++gi5eFBWbZhQIUZRY9KrwwPkQdzjcIlzBCasVSiQ4
 13RVIqaQZ6Mo1UeHpUgR4djT47a4Mb8HHefASYgXP0fd9Po6I2quaDkaKX2jnkaelWVtpg==
X-Google-Smtp-Source: AGHT+IG2gWi0nLGOKpj4dDyZrHjJgRgzITPsE63NdiS1YrFkAk4rdwGkFABUwfTdHYGCtVaBNOKAtw==
X-Received: by 2002:a17:902:e887:b0:220:faa2:c917 with SMTP id
 d9443c01a7336-22320208770mr53896785ad.34.1740569195012; 
 Wed, 26 Feb 2025 03:26:35 -0800 (PST)
Received: from localhost.localdomain (221x255x40x66.ap221.ftth.ucom.ne.jp.
 [221.255.40.66]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0009a0sm29800345ad.27.2025.02.26.03.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 03:26:34 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add some generic
 MIPI-DSI/DPI panels
Date: Wed, 26 Feb 2025 20:25:49 +0900
Message-ID: <20250226112552.52494-3-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226112552.52494-1-kikuchan98@gmail.com>
References: <20250226112552.52494-1-kikuchan98@gmail.com>
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

This is a binding for generic MIPI-DSI/DPI panels that require
initialization with a simple command sequence before use.

The initialization of the panel requires a firmware binary which can be
made with the Panel Firmware Generator[1] on the web.

Add 4 new panels, as they are available on the same page[1] as a preset
(excluding already included ones).

Note that the "xx" in the panel name is taken from a product's name,
not a wildcard.

[1]: https://kikuchan.github.io/panel-firmware-generator/

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../bindings/display/panel/panel-mipi.yaml    | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
new file mode 100644
index 00000000000..d70cf0063fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI-DSI/DPI Panels Requiring Initialization
+
+maintainers:
+  - Hironori KIKUCHI <kikuchan98@gmail.com>
+
+description: This is a binding for generic MIPI-DSI/DPI panels that require
+  initialization with a simple command sequence before use.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              # Unknown 3.35" 720x480 24-bit IPS LCD panel
+              # used in Anbernic RG 34XX
+              - anbernic,rg34xx-panel
+              # Unknown 4.00" 640x480 24-bit IPS LCD panel (YLM-LBV0400001X-V1)
+              # used in Anbernic RG40XX series
+              - anbernic,rg40xx-panel
+              # Unknown 3.95" 720x720 24-bit IPS LCD panel (YLM-LBN0395004H-V1)
+              # used in Anbernic RG CubeXX
+              - anbernic,rgcubexx-panel
+          - const: panel-mipi-dpi-spi
+      - items:
+          - enum:
+              # HOTHMI TFT-H028B23VGIST7G40-V1 2.80" 480x640 TFT LCD panel
+              - hothmi,tft-h028b23vgist7g40-v1
+          - const: panel-mipi-dsi
+
+  reg:
+    description: DSI / SPI channel used by that screen
+    maxItems: 1
+
+  power-supply: true
+
+  io-supply:
+    description: I/O system regulator.
+      No need to set if this is the same as polwer-supply.
+
+  dc-gpios:
+    maxItems: 1
+    description: Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
+      Disallowed for DSI.
+
+  port: true
+  reset-gpios: true
+
+  backlight: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - panel-mipi-dpi-spi
+    then:
+      # SPI mode
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - panel-mipi-dsi
+    then:
+      # DSI mode
+      properties:
+        dc-gpios: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "hothmi,tft-h028b23vgist7g40-v1", "panel-mipi-dsi";
+            reg = <0>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "anbernic,rg40xx-panel", "panel-mipi-dpi-spi";
+            reg = <0>;
+
+            spi-max-frequency = <40000000>;
+
+            dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+        };
+    };
-- 
2.48.1

