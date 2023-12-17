Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D175C817A2F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6A10E2B3;
	Mon, 18 Dec 2023 18:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B389610E363
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702925821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CR/3Io6mktEEwQ1LHj5L/2zpZ/H1ugjG/amm876pBg=;
 b=ci35AluU4xCjNaNcFsssdx+wwHzA+xjfTnIr7hwkx+aNTJMlr6k2UVRCVT/5yDaK9t5IQk
 QRuFfIcvY9osWDQ0UBvgJX7AIK1r+0NxWYNKfsfunIGHtX3c1XCK4qDQ8zRvAqUV4kXTrL
 eOx6a6dHFMeiu1+VfB+iiVSERqKIh+4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-7yygFYOUPXChSa6VQXXmHw-1; Sun, 17 Dec 2023 05:07:48 -0500
X-MC-Unique: 7yygFYOUPXChSa6VQXXmHw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-332ee20a40fso1329599f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 02:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702807667; x=1703412467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CR/3Io6mktEEwQ1LHj5L/2zpZ/H1ugjG/amm876pBg=;
 b=sgzWLBPJPnp3Ru3lW/4vLXkdKhnxQpKbEvB6sW5rpi9CZoHy0NTy8bscT327Q5rB1l
 k+t2iaOR5vjtHdBYdFZy4SU0PfsCCSrG49RrwyTeBqOBC0CKdWYb6aJzE2l4B4lAeOa7
 1S4musGChZRgQFzaaI0WJiaztYOiqRSLNG4fqzYAFrRyYUgaiMuFh918tpyTJOG8zr6a
 ODygKh/EI/ZgrMoQ8EcygXOo6z7nBiiiP2lwATQsYfe0iPrM/mIhOK7Spc3EnYWXzEpW
 4TWv9K3uoeATW6kA/Dow2RM2PRqAFceR8NRY4tByGwCllMT97J59JQV/O4IxhvStkeuG
 AISQ==
X-Gm-Message-State: AOJu0YyEW8ymr1iWYA4IKINl9enfrmQa4dAW242UR9JjL4vgT3NToNdp
 TiugaX6nH3TQUdZcyW45u+KZLow6mwiwnTnvuc/pWdyoiuemo2Wb4Lc2+2VEhRIknsoG/YVhcQ9
 0+4WDEwjQWBrTJegkW/Xi0MLseaiP
X-Received: by 2002:a05:600c:1393:b0:40c:4d80:f51a with SMTP id
 u19-20020a05600c139300b0040c4d80f51amr5305193wmf.96.1702807667278; 
 Sun, 17 Dec 2023 02:07:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE2m3De7Sb1SGXY0KWt6mw+tIKeqFVO7iugFjDU9Je+2Tz6raBuqH1rDzvjUAl9KyCVMPenQ==
X-Received: by 2002:a05:600c:1393:b0:40c:4d80:f51a with SMTP id
 u19-20020a05600c139300b0040c4d80f51amr5305183wmf.96.1702807666944; 
 Sun, 17 Dec 2023 02:07:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b0040c44b4a282sm29099420wmq.43.2023.12.17.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 02:07:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
Date: Sun, 17 Dec 2023 11:07:03 +0100
Message-ID: <20231217100741.1943932-2-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217100741.1943932-1-javierm@redhat.com>
References: <20231217100741.1943932-1-javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the
Solomon SSD133x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../bindings/display/solomon,ssd133x.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
new file mode 100644
index 000000000000..eee8d8c9ca35
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd133x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD133x OLED Display Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1331
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1331
+    then:
+      properties:
+        width:
+          default: 96
+        height:
+          default: 64
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            oled@3c {
+                    compatible = "solomon,ssd1331";
+                    reg = <0x3c>;
+                    reset-gpios = <&gpio2 7>;
+            };
+
+    };
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            oled@0 {
+                    compatible = "solomon,ssd1331";
+                    reg = <0x0>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+    };
-- 
2.43.0

