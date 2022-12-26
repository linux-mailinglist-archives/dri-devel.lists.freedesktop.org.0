Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4316562E7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 14:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FEF10E0D9;
	Mon, 26 Dec 2022 13:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AD810E004
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672062566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mw7xpxVI9Q/Jnt3L05urCEGaaPOXvycGiSQd0FrpIik=;
 b=i196rlyc7OI56QtZz3xEj42T0em7qLN7KoLM7nSXVW13cmc+8jn5h5vaQOwc5mEnvhDe7d
 zbNJ5+c3TKtQEDzBPqBa7m9kyGXJsarLwdRcpB6cl897Rnv1jgEc1aePoqx+z9XheytgBe
 NpPqpodJ+URKJhUfk8bR+lCUOctzigA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-Kmf2HSoiO6yDEKRIZyXnlw-1; Mon, 26 Dec 2022 08:49:25 -0500
X-MC-Unique: Kmf2HSoiO6yDEKRIZyXnlw-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso5112231wmb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 05:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mw7xpxVI9Q/Jnt3L05urCEGaaPOXvycGiSQd0FrpIik=;
 b=AjLAgIkheuRF2rBwLqt18/RFd67wnq850K/gUdTE9LNqluLAthwhjRO9yYbtEM2+RW
 2BEpwfYksLCOmn4s6Yu6zq/+QCiccz3EKqyv9JksYwn6zxfyOdWxnN9KRZl9gZxH8gNx
 u/zSk2Ubs3xQglZf0dg70cMxpWZyhv0dH+44s71f454GU7YiGBet9W9JgnipCaP6omop
 ePkJ7qFoPr33Yo4p5LM9etXh2R3j7hsVzcj6YVxM9Kr0V2Uh6jNCnQddJMRDCBl98pqS
 k6PPMmjW5HFz6l1zuyVYyKscpHHt3XA+NYeLH0IWIw2j9ITQ00BJNA9hfbkrJeW23KBb
 MF5g==
X-Gm-Message-State: AFqh2krX6ec0f4viMcFQFUo9SPbAFaWc5RrDBhJ77cyzWM5Y9g3om0K+
 KmBvZCY/ylFTUYBYcDLXolFKO/Ix6hD8CQFgUvk4IKWc8migUBXPP6ilyrsPNj5ytG73BxM0EyQ
 /zk+eQro1zYqxaA205PdudVZtH8YR
X-Received: by 2002:a05:6000:1246:b0:24f:869a:6c13 with SMTP id
 j6-20020a056000124600b0024f869a6c13mr11747356wrx.2.1672062563914; 
 Mon, 26 Dec 2022 05:49:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUvZdjNR7Fa8fpKiew/GyjwBoEhaZv2N568YBi4HBO08rtzrVuxhbL312QdhdG1u5YjDEtcA==
X-Received: by 2002:a05:6000:1246:b0:24f:869a:6c13 with SMTP id
 j6-20020a056000124600b0024f869a6c13mr11747344wrx.2.1672062563708; 
 Mon, 26 Dec 2022 05:49:23 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a18-20020adfed12000000b0027cfd9463d7sm3340947wro.110.2022.12.26.05.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 05:49:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: display: Add Himax HX8394 panel controller
Date: Mon, 26 Dec 2022 14:49:06 +0100
Message-Id: <20221226134909.2822179-3-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221226134909.2822179-1-javierm@redhat.com>
References: <20221226134909.2822179-1-javierm@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings for panels based on the Himax HX8394 controller,
such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
through a MIPI-DSI video interface.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
- Drop redundant "bindings" in subject (Krzysztof Kozlowski).
- Drop "device tree bindings" in title (Krzysztof Kozlowski).
- Put port next to other "true" properties (Krzysztof Kozlowski).
- Add Krzysztof Kozlowski's Reviewed-by tag.

 .../bindings/display/panel/himax,hx8394.yaml  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
new file mode 100644
index 000000000000..bead3f0b05c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -0,0 +1,65 @@
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
+    enum:
+      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
+      - hannstar,hsd060bhw4
+
+  vcc-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  port: true
+
+  reset-gpios: true
+
+  backlight: true
+
+required:
+  - compatible
+  - vcc-supply
+  - iovcc-supply
+  - port
+  - reset-gpios
+  - backlight
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
+            compatible = "hannstar,hsd060bhw4";
+            reg = <0>;
+            vcc-supply = <&reg_2v8_p>;
+            iovcc-supply = <&reg_1v8_p>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.38.1

