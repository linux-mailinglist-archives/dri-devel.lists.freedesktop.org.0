Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083267C78B8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 23:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9551A10E56F;
	Thu, 12 Oct 2023 21:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7410E57D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 21:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697146769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3yRqYZd7hXBCjj0x6r+xRvOZ/+by8OSU47aD3csnLU=;
 b=FZnLhmbU4DG8vzThyvHMxnfTRxmIgHnfc4Ln8f2IH2FFM6AjP0uVvCJUtGvIXkI+YYNE67
 xQGyAHzeoBE0zOQi5lysNeM46g63ut/Csft4nJoLD85ZWU2W9hkF8+/VIyb+pVQZZkcbdY
 wD/8yfvvE0MGnVILT/7mk3pDyyK5wcQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-hKrWm94FPrW4GKsvAsWrnw-1; Thu, 12 Oct 2023 17:39:15 -0400
X-MC-Unique: hKrWm94FPrW4GKsvAsWrnw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso9902405e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 14:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697146754; x=1697751554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o3yRqYZd7hXBCjj0x6r+xRvOZ/+by8OSU47aD3csnLU=;
 b=Y0zBKm5V7nf2PuuidkylJxL5t1QcPKgl4yhZ/299lFB/p75fuweHHOmDmsTrju6wPg
 wV87J66/22hdpgeE6s387Zh7SijK8HQRqPmGjUodp4EXb+3xSs+a7E6bQOMTI9Wz/Aj2
 gvuwBl0pTgPQkt2e89YtW0nsNGWgJBVZmRMJLBW6gP3pbbiQhS1fPuncYpbu4OCnZYlc
 qZ7lgH4wjyokH2BZwM+R9aaQRZ5IRSGqf8a3KYb2GkRuPQxdWfQ7GS1E9D9EjACCFZlq
 Ekbu1vhvHsqZ8p00P8IDQPYZT0pAY89Qrdy8xNHx8fW81DCAuGWZakx/fOxAIlBD6J1h
 iAFQ==
X-Gm-Message-State: AOJu0YzjgmYQ8eMrDsG+++nd0iM1xax4gafFzNpW3jDIqmWqA3XfuW6z
 fpGZeFtn2Yyfys7658nI4bcWrFemDM1qkimL9HaaLgJKMSDLZozSYEMWEjCvXmqt5M+1lGITfmm
 2QquMBO5nrRcQwnZq9K1HfTzoQnDn
X-Received: by 2002:a05:600c:22d5:b0:406:52e4:cd23 with SMTP id
 21-20020a05600c22d500b0040652e4cd23mr21842877wmg.0.1697146754729; 
 Thu, 12 Oct 2023 14:39:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+XVdeKgSPhHzOip6DG8FcebZmLSy2zD26qDPnYqZ7qCmWMDHxCbKD8PAFohtrJ32KHy3KEw==
X-Received: by 2002:a05:600c:22d5:b0:406:52e4:cd23 with SMTP id
 21-20020a05600c22d500b0040652e4cd23mr21842864wmg.0.1697146754547; 
 Thu, 12 Oct 2023 14:39:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c364a00b0040648217f4fsm800706wmq.39.2023.10.12.14.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 14:39:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] dt-bindings: display: Add SSD132x OLED controllers
Date: Thu, 12 Oct 2023 23:38:36 +0200
Message-ID: <20231012213843.1151060-7-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012213843.1151060-1-javierm@redhat.com>
References: <20231012213843.1151060-1-javierm@redhat.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the Solomon
SSD132x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v3:
- Add Rob Herring's Reviewed-by tag to patch #6.

Changes in v2:
- Remove unnecessary 'oneOf' in the SSD132x DT binding schema (Conor Dooley).
- Remove unused DT nodes labels in the binding schema examples (Conor Dooley).
- Split out common Solomon properties into a separate schema (Rob Herring).

 .../bindings/display/solomon,ssd132x.yaml     | 89 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
new file mode 100644
index 000000000000..0aa41bd9ddca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd132x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD132x OLED Display Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+properties:
+  compatible:
+    - enum:
+        - solomon,ssd1322
+        - solomon,ssd1325
+        - solomon,ssd1327
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
+            oled@3c {
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
+            oled@0 {
+                    compatible = "solomon,ssd1327";
+                    reg = <0x0>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4a3baf970839..5257e0074f2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6733,7 +6733,7 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
-F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
 DRM DRIVER FOR ST-ERICSSON MCDE
-- 
2.41.0

