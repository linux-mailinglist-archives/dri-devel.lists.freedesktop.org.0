Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E057BE99B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA3610E2BD;
	Mon,  9 Oct 2023 18:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0A10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVKQrPdUbZGc1wU+oO+Twkh3N/BNeBlGHNRWMhTu31k=;
 b=bDwE9lFspSeMI0YEEXuBHwRVsa0QvgNBrF7JQcd9gvLkmRlpXiPhKMQ92lKrrYEjSbI+Sp
 o6M6JuCjRXibEbYOQG9Yb0vLfTY1meFq8dn//JIMxRK5ZYv6HJP/5kCIm3e1Z4rKQw71Gw
 9PicThkCb015h4CXqGlq7UynwUZyVOo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-vniaf8QLPTuk7WHGhnfLNw-1; Mon, 09 Oct 2023 14:36:10 -0400
X-MC-Unique: vniaf8QLPTuk7WHGhnfLNw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-327b5f2235aso3527306f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876569; x=1697481369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVKQrPdUbZGc1wU+oO+Twkh3N/BNeBlGHNRWMhTu31k=;
 b=u6tIvN8F5P/hbNCLhaJUH1yfRDkGL23IWBitcP0SZMxZvkKwELlNWSv8sktPfPirHB
 UR0nX2QxqvIHlVA4Q3czPEUJJv2nZX3jY7cjki/Mag7oqe1CyTNCZ8ElSxWbMiFZDIkA
 r3iiIiuZKrJp+NoOdzD9pm4tisPT+SbCjexeDPggsNZs+rjNuG8Vm5PHcGA34XHsLRxH
 /i7FnhNwvDJI2b99Iwx/jTymR4GdmNLfLYmx3s50XdMJlFHnLevs9SHSCZcmonh9kHxl
 XVwpQmvtOxSnzCvGVMxZBNmOH9JUSeZ7a4Sr6ngaDPqer9eIEmhnqiMMWwUyD7+0CRQ9
 1kmQ==
X-Gm-Message-State: AOJu0YzbNvWE0S4RV8IMrKYh0NJxcBdRvGrpBMEeYE3RsN48RbkGzb/T
 6fJt+LHRKRW+vKvhFcNvfjaviVXZ9ixAZSHzyjOSVAmvzX0W3kMkSqu2UJahadb/ZvaIjGMrJTE
 ywZMY7ou4k1Fms0O7+kq1QIIxjNtE
X-Received: by 2002:a05:6000:1008:b0:31a:ed75:75df with SMTP id
 a8-20020a056000100800b0031aed7575dfmr14391816wrx.15.1696876569530; 
 Mon, 09 Oct 2023 11:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHU9ipeYY5/67yz9rQUzhHMG8K4QZBRRRVgXLPaNfAyAaJFKTL902MD4ZsjPgkqmWa4uorcA==
X-Received: by 2002:a05:6000:1008:b0:31a:ed75:75df with SMTP id
 a8-20020a056000100800b0031aed7575dfmr14391797wrx.15.1696876569304; 
 Mon, 09 Oct 2023 11:36:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b003266ece0fe2sm10221874wrn.98.2023.10.09.11.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] dt-bindings: display: Add SSD132x OLED controllers
Date: Mon,  9 Oct 2023 20:34:22 +0200
Message-ID: <20231009183522.543918-9-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183522.543918-1-javierm@redhat.com>
References: <20231009183522.543918-1-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the Solomon
SSD132x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../bindings/display/solomon,ssd132x.yaml     | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
new file mode 100644
index 000000000000..b64904703a3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd132x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD132x OLED Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - solomon,ssd1322
+          - solomon,ssd1325
+          - solomon,ssd1327
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  # Only required for SPI
+  dc-gpios:
+    description:
+      GPIO connected to the controller's D/C# (Data/Command) pin,
+      that is needed for 4-wire SPI to tell the controller if the
+      data sent is for a command register or the display data RAM
+    maxItems: 1
+
+  solomon,height:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Height in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
+
+  solomon,width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1322
+    then:
+      properties:
+        width:
+          default: 480
+        height:
+          default: 128
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1325
+    then:
+      properties:
+        width:
+          default: 128
+        height:
+          default: 80
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1327
+    then:
+      properties:
+        width:
+          default: 128
+        height:
+          default: 128
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1327_i2c: oled@3c {
+                    compatible = "solomon,ssd1327";
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
+            ssd1327_spi: oled@0 {
+                    compatible = "solomon,ssd1327";
+                    reg = <0x0>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+    };
-- 
2.41.0

