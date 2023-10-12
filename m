Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D07C65F6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838EF10E41E;
	Thu, 12 Oct 2023 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCA310E41B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697093917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDry+FhkIeT/NRPHa1BVdFItba2J4DOxCsv4jEZYJSQ=;
 b=cBDoNC7zR9vuHKD3taGQWkCo1HlN9ysT04MGdVoi0EjxiR7vaouRuV/q5zELhyCLh4dDAz
 bcUyKg4LV3QUFE+1GlyqB7kta+QG6cZB2UmKlGvshEEaMHgXXeeRuMHM7OAa0Oa0CrNTvL
 sBXChxR1yHLb67/rHBCPMj/gF7+FOnA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-rXBHT9mcNCGmsKCpJpNwRQ-1; Thu, 12 Oct 2023 02:58:35 -0400
X-MC-Unique: rXBHT9mcNCGmsKCpJpNwRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40540179bcdso6143195e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697093914; x=1697698714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDry+FhkIeT/NRPHa1BVdFItba2J4DOxCsv4jEZYJSQ=;
 b=H9nRNZp2RNiI3kYwRBF2nxCR6YwDqM8cFkcINKgW2OgHWUGlHrK6kfEDDtVKEf/ZpU
 C2/as59M9hh2ejAtVjId7SwseU07bLr1aPkcYH1/3Z1jJ3rip/kYNuDFX07lH9jlJO3u
 ZngPqWWVa2ibSsp8UbhdvKT/k7UZtrZPepp1toaozggE6GOSjhj/XfeAXhQpQGTHqVrB
 4nbSzVT4bvBG8umBg3+rFrZB27qW8uJQ4+yvPZ2g2A2F/iG/SRBA8w3WBIZMqO6SeCbB
 wMaFpJti9qohohSRktiGiPwwhnfaCz0Urqow3dyOVqwhmsgMS/cnOIyDhdbGBmxIL+of
 yu4g==
X-Gm-Message-State: AOJu0Yx6ONA8A2yCL7hAgzRa7laNknY5Uc22lCjW75R0cVAE7xgrH68x
 9OKikYnwLrBiQU2HdBh7SXrKTO0inhUAqwg4yMkj2+2HBa1FpVxzmWRnled1QGthDKqBzoCeuxd
 RMp9Q88CfbYc1i+trCEZd19uCTpPH
X-Received: by 2002:a05:600c:c8b:b0:401:b2c7:34aa with SMTP id
 fj11-20020a05600c0c8b00b00401b2c734aamr20358187wmb.33.1697093914585; 
 Wed, 11 Oct 2023 23:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJUdJAE+J+1gnbUCfPDDysmAo9MVCsBEBf74Ya+bU1awzyJ/Fc2/4hxnuN0VxAQe5EBOIOFQ==
X-Received: by 2002:a05:600c:c8b:b0:401:b2c7:34aa with SMTP id
 fj11-20020a05600c0c8b00b00401b2c734aamr20358177wmb.33.1697093914403; 
 Wed, 11 Oct 2023 23:58:34 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c22c600b0040303a9965asm21113713wmg.40.2023.10.11.23.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 23:58:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] dt-bindings: display: Add SSD132x OLED controllers
Date: Thu, 12 Oct 2023 08:58:15 +0200
Message-ID: <20231012065822.1007930-7-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012065822.1007930-1-javierm@redhat.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the Solomon
SSD132x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

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

