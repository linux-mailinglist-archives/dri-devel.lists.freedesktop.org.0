Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909E819198
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 21:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7C10E21E;
	Tue, 19 Dec 2023 20:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7481810E21E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703018094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBP5+4pQK3uFRN8UqYAB+LK0Vg09XZtHg8dKysI62eg=;
 b=QLn1Q/yb3XXADe3VUYxpztzxH6wbL/aMvnBvGIpXVRytYCpshaWMUIRCy8WDzWGMyLaim4
 z5tyAanND7x0yYEukc/2UTqfCD1awZu2c/11DzbbI9coEKkLOdNLAkprjSUqw1HqBtzIOJ
 oBZg3+Z8nCXUXghU9+sqYqeYBouDNa0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-DoC0nZqpMjSCZww9HXW3TQ-1; Tue, 19 Dec 2023 15:34:52 -0500
X-MC-Unique: DoC0nZqpMjSCZww9HXW3TQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c469953a8so33079835e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703018091; x=1703622891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBP5+4pQK3uFRN8UqYAB+LK0Vg09XZtHg8dKysI62eg=;
 b=qSLe4MhVJtQkqVnc8xed3CGwo5e+2BDA1mFaLRB5M5zOrzXD64BjaE3fnGx60MnKl4
 X/IrrelNr4C02O34Izn0FRVqFI/foBv4t3RO3DAJhqvdp3R2jHspolPW6zT1oio0GdpU
 Ui0T3sI1Ab0fj9G6PxUjYMKyJmCBd2aHfPcb1OOgbfQ8jhERi7VxC61X1QyPpMA830fO
 fWAs/+id72IgZsKSnDEI/Y8xtOnmo8HfOzjaF+WOVKlCpe23lteX4JfK1PsRspovmsm6
 9l/YfZmjrcgmYXecgkLwc8hM+MfP/guOftV4aOeTdHxRodB6xwgtzK+uGLWeNqbvRblL
 Md2Q==
X-Gm-Message-State: AOJu0Ywh95U0yE2z0xOTfxtI+RYEAHqgpC60RM7mLA5uugFHRXvQYZ5K
 Gk7AXG3yHwSA3EoBdLUsOmZ6ZVxPKOSnptd+9C/1Y9ZxdbF4ujz+P3mko9BzWXvbmrexBvMkK5m
 37VN1WZT0i9wPPuprUmAKDAgt2xk+
X-Received: by 2002:a05:600c:458d:b0:40b:33c0:a22 with SMTP id
 r13-20020a05600c458d00b0040b33c00a22mr11268572wmo.28.1703018090940; 
 Tue, 19 Dec 2023 12:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsXT5JFxqoigwef/u1QlfVGRPMXewmQtLqix/INqsVLkJ2tdFjoRjRtz0EBStx4PVCPvpwYg==
X-Received: by 2002:a05:600c:458d:b0:40b:33c0:a22 with SMTP id
 r13-20020a05600c458d00b0040b33c00a22mr11268569wmo.28.1703018090722; 
 Tue, 19 Dec 2023 12:34:50 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b0040c411da99csm4464496wmq.48.2023.12.19.12.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 12:34:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: display: Add SSD133x OLED controllers
Date: Tue, 19 Dec 2023 21:34:08 +0100
Message-ID: <20231219203416.2299702-4-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219203416.2299702-1-javierm@redhat.com>
References: <20231219203416.2299702-1-javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the
Solomon SSD133x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Move solomon,ssd-common.yaml ref before the properties section and
  width/height constraints after the other properties (Conor Dooley).

Changes in v2:
- Unconditionally set the width and height constraints (Conor Dooley).
- Fix indentation in the DTS examples (Krzysztof Kozlowski).

 .../bindings/display/solomon,ssd133x.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
new file mode 100644
index 000000000000..e93879b3da5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
@@ -0,0 +1,57 @@
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
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1331
+
+  solomon,width:
+    default: 96
+
+  solomon,height:
+    default: 64
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@3c {
+            compatible = "solomon,ssd1331";
+            reg = <0x3c>;
+            reset-gpios = <&gpio2 7>;
+        };
+
+    };
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1331";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7>;
+            dc-gpios = <&gpio2 8>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.43.0

