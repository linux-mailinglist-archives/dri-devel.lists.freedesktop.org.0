Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456606597B1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 12:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CA710E1DE;
	Fri, 30 Dec 2022 11:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4710E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672399941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c32qrgWmsjRJO1IBGWxTMshwA3bwdd46Bo/ATwGKrQ0=;
 b=g83sIyOr5aEE80sIS6MjXIv1l5lQWMKBPtvnyBOEIBYGw1Hlktbnhy2eQ0EPG6byFHqZPs
 EAlUWwH4bcEarbKeSMJfiQ3wd3LjhxYY13EEIlE/WmHy5jatjmcLQELVPpyLXxl8B2vXUA
 KA1cxjwPxyrYJu8RnM58jcUnIcywAvQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-DEhsvGcUOhGb1E0sPYvQVQ-1; Fri, 30 Dec 2022 06:32:20 -0500
X-MC-Unique: DEhsvGcUOhGb1E0sPYvQVQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso4634591wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 03:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c32qrgWmsjRJO1IBGWxTMshwA3bwdd46Bo/ATwGKrQ0=;
 b=Im1tkKOlirCOn0EG9J85zkrVCAfKiJeDa0JaNW5TvYMutkLZ7WsJ+j/7dbc6h4rMEd
 20djMnuCr2vQMgngbApp8XP6NzmRSNFBe91L95fbggJJeMZM+Rf7Flx+WHI+KRTjj2ef
 JpuW8d5D4dliq5kEPOo0Wj8YsYMwb4lbqShloeis1MZWd5c3Ai/lAYHTBjAx2g9qfCo7
 teGqoE4ThyrK06LD7R5xGsVT6ijmb3q0OZb/tolXWiNDEP99E5nYMdagDUXYzPRekTX7
 l/MVfS5lwz4GwxygYFXu9EC9QYrA0o6kky8rs8Xhk6ZuLivw+lGRhJq2lsSYYmUrvUSp
 eAWg==
X-Gm-Message-State: AFqh2kpnslH3Xa3tHXrDOa0CHxeof4LSy+98Luoko2x8Oalz7ndmfQp/
 OjoI/Woh6gILa8YdZ7x1NakDHfoHcffCUML6f/oOmnyjmc2omxKitZhNiHEvms/B29u7hw4NkXE
 1SSaz4dql/9N6xwMw778A2PrHMrV0
X-Received: by 2002:a05:600c:214a:b0:3cf:6910:51d4 with SMTP id
 v10-20020a05600c214a00b003cf691051d4mr22097928wml.29.1672399939000; 
 Fri, 30 Dec 2022 03:32:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuyvNz4H4CAUhlF4mxnZIIIX/2FxJMl1v41S8jUhr1TFV0zd/ZnoTK01haVO0OFBOoUnJaEbQ==
X-Received: by 2002:a05:600c:214a:b0:3cf:6910:51d4 with SMTP id
 v10-20020a05600c214a00b003cf691051d4mr22097907wml.29.1672399938744; 
 Fri, 30 Dec 2022 03:32:18 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003d01b84e9b2sm27638432wma.27.2022.12.30.03.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 03:32:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: display: Add Himax HX8394 panel controller
Date: Fri, 30 Dec 2022 12:31:51 +0100
Message-Id: <20221230113155.3430142-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113155.3430142-1-javierm@redhat.com>
References: <20221230113155.3430142-1-javierm@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, devicetree@vger.kernel.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings for panels based on the Himax HX8394 controller,
such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
through a MIPI-DSI video interface.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v4:
- Add fallback "himax,hx8394" compatible for the panel controller (Jagan Teki).

Changes in v3:
- Fix example snippet for `make dt_binding_check` to pass (Krzysztof Kozlowski).

Changes in v2:
- Drop redundant "bindings" in subject (Krzysztof Kozlowski).
- Drop "device tree bindings" in title (Krzysztof Kozlowski).
- Put port next to other "true" properties (Krzysztof Kozlowski).
- Add Krzysztof Kozlowski's Reviewed-by tag.

 .../bindings/display/panel/himax,hx8394.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
new file mode 100644
index 000000000000..058b4eae68a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx8394.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8394 MIPI-DSI LCD panel controller
+
+maintainers:
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

