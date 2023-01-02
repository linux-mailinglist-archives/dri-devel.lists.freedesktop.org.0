Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E288365B80D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 00:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5B210E22A;
	Mon,  2 Jan 2023 23:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6CE10E21D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 23:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672700862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obzoow7q7hWkNtg/GehYspcHRTm+nOjVwnTgRK9uS/E=;
 b=AgQA4YwR62rG2qcr/Snh4WeK26y/syweO71nR6op+TyDSKkYj5NMvBzwWyceZwgqB6sSkE
 Rb3idQ7Oxx7dRtNC3s+1e0mWV8oFYlb5yCek1hrvt2aGHxlJaoUfATGNBvYIii8k00d5Kk
 IG2uhR5EUKb9+UQrcRppT4i10qDzY+g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-TbxnIHY_N8msdRVdc0gCqQ-1; Mon, 02 Jan 2023 18:07:40 -0500
X-MC-Unique: TbxnIHY_N8msdRVdc0gCqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so8308387wmq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 15:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obzoow7q7hWkNtg/GehYspcHRTm+nOjVwnTgRK9uS/E=;
 b=TMPpmbJcYlH5xgOdFZC2MeHmQ0sbisq6iwxz0u2v/q+NOuW6Suuh4qqTP2NjELx7Ze
 edIw2TjqzLenNrqY8PJmp7xSSjT5nn5/lB+CGL/aYEAKvHlQc0ERE/QlNp8EeQHX+xsJ
 qdcwAsuB4pi6ULgYydP/AIOkQmM58oNUVAeYDxSKcZE5JQRRonN5TmO0Xl+3BfaO5mnz
 j1R2Rq6Hm9fUnw40Udr3Y+gHCGaxh7IhNSczECwMhaRCQ5mjZMwSeDB6Qn18Cu1cSdor
 cUvD8K2kVINLBf0OpX+LtSavoL/83Jv74OzxnoGEf26WbD7R2P6Z/TsYsZzed8sWmjbq
 H7ZA==
X-Gm-Message-State: AFqh2kphYKKNKG+FtgE6UYs40In1HBlvXcHDHVrG5dD8/jZMqNgTOAWS
 6gx3GAo74Akndg+R+1AJbkgmj55vzpCQPws7g5wwtMSK6CJGKL9UChYGpZKVFsfRw9kyaXGjwVb
 lWC9UYAgWZRWfUDwg+JDvHUBF7mCU
X-Received: by 2002:a5d:4d50:0:b0:242:7fdb:923b with SMTP id
 a16-20020a5d4d50000000b002427fdb923bmr23621919wru.59.1672700859781; 
 Mon, 02 Jan 2023 15:07:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtjNaoQfhNkTsnfslbEr2dpmDZ3226Di9u0vHV4w4FHb+3Vt39i56vGxyttsbxwAAIkBW3Lw==
X-Received: by 2002:a5d:4d50:0:b0:242:7fdb:923b with SMTP id
 a16-20020a5d4d50000000b002427fdb923bmr23621899wru.59.1672700859588; 
 Mon, 02 Jan 2023 15:07:39 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm22746906wrw.117.2023.01.02.15.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 15:07:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: display: Add Himax HX8394 panel controller
Date: Tue,  3 Jan 2023 00:07:31 +0100
Message-Id: <20230102230733.3506624-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230102230733.3506624-1-javierm@redhat.com>
References: <20230102230733.3506624-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings for panels based on the Himax HX8394 controller,
such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
through a MIPI-DSI video interface.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5:
- List Ondrej Jirman as a maintainer in the DT binding schema document.

Changes in v4:
- Add fallback "himax,hx8394" compatible for the panel controller (Jagan Teki).

Changes in v3:
- Fix example snippet for `make dt_binding_check` to pass (Krzysztof Kozlowski).

Changes in v2:
- Drop redundant "bindings" in subject (Krzysztof Kozlowski).
- Drop "device tree bindings" in title (Krzysztof Kozlowski).
- Put port next to other "true" properties (Krzysztof Kozlowski).
- Add Krzysztof Kozlowski's Reviewed-by tag.

 .../bindings/display/panel/himax,hx8394.yaml  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
new file mode 100644
index 000000000000..1b2a1baa26f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx8394.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8394 MIPI-DSI LCD panel controller
+
+maintainers:
+  - Ondrej Jirman <megi@xff.cz>
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+description:
+  Device tree bindings for panels based on the Himax HX8394 controller,
+  such as the HannStar HSD060BHW4 720x1440 TFT LCD panel connected with
+  a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hannstar,hsd060bhw4
+      - const: himax,hx8394
+
+  reg: true
+
+  reset-gpios: true
+
+  backlight: true
+
+  port: true
+
+  vcc-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - backlight
+  - port
+  - vcc-supply
+  - iovcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "hannstar,hsd060bhw4", "himax,hx8394";
+            reg = <0>;
+            vcc-supply = <&reg_2v8_p>;
+            iovcc-supply = <&reg_1v8_p>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.38.1

