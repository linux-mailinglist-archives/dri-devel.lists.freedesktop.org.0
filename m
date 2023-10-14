Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E57C931E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 09:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF2910E08A;
	Sat, 14 Oct 2023 07:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01510E081
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697267737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L40KmVEphI0s36UXbc+Nqi/6EpaBRCldyiUbNkbVIGc=;
 b=Gy2qChA9bIv+eAbMEMnIgfdNr785q8Y6UqMqRrCcuBUI36ttn4mnHEyYb9L0MLFSDdcq/w
 jE1IFMCp5YWYTc6gxPv/XkrO8XOqtIE+cgGt7DMfbgYslw6LM+7EU1j9/NxspFQE1on9tv
 AJWOVhVr2/XsF87FViiaMx1BIQ0yDcA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-LhM1g1fVPeKIZmAiPBt4HA-1; Sat, 14 Oct 2023 03:15:34 -0400
X-MC-Unique: LhM1g1fVPeKIZmAiPBt4HA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5079fd97838so625418e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 00:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697267732; x=1697872532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L40KmVEphI0s36UXbc+Nqi/6EpaBRCldyiUbNkbVIGc=;
 b=BLMmgo0gcO7cuLwD8b2QfJlrhdE1fzRb5+Lr9Lj3xkY62bUKMuMhVdzkms1GtciGVn
 0+YkfvCIcL3QYSqfSMzD5eKqX8CX6Qzn9i7YaLh/amTCSHUPY/5gt4yMVqoganx/WcHZ
 OpqilvCZvfAMxHZiipBMP4N89F5pqviilQRKo9/aqFXfUY3v+RSTlXpzcGek7ajwC5uQ
 cv1cCwVUbT5iuPvKv3QtqKXDwZZk5FyaIyF+dduP6tCc0ktyf2JeFSAA0nRN0d1GpC1V
 mtrqipaUxRcWgd2sCjQz7LiAS4AAxPucmpYoPtD4XtlzOMFf2CxL/QvWX8PcWOPJmj4r
 Pf7A==
X-Gm-Message-State: AOJu0YyVFk4PDs4utty9xJMfkd7Zajq4iZ7yZXeOdFRqcpX+OewDlI8/
 d1fUNRWlDtBmN9wFNl35cmFQUrYszsGFCc2LHlUxRF7CcEQUti2qIedGYOUhXZa/U5p28qK+eTc
 G3CDebj7/9GITsoagxUc4TZCMe6By
X-Received: by 2002:a05:6512:3a83:b0:503:2deb:bbc1 with SMTP id
 q3-20020a0565123a8300b005032debbbc1mr28600319lfu.22.1697267732532; 
 Sat, 14 Oct 2023 00:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEacEunJ2/vtjj/hMo9XgpbKpPFdZ+wm3KP0SVdHibnjcsC4EB/kyupw46K5iKtSYP274RS7g==
X-Received: by 2002:a05:6512:3a83:b0:503:2deb:bbc1 with SMTP id
 q3-20020a0565123a8300b005032debbbc1mr28600300lfu.22.1697267732165; 
 Sat, 14 Oct 2023 00:15:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b003fee53feab5sm1154353wmq.10.2023.10.14.00.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 00:15:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] dt-bindings: display: Split common Solomon properties
 in their own schema
Date: Sat, 14 Oct 2023 09:15:07 +0200
Message-ID: <20231014071520.1342189-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231014071520.1342189-1-javierm@redhat.com>
References: <20231014071520.1342189-1-javierm@redhat.com>
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

There are DT properties that can be shared across different Solomon OLED
Display Controller families. Split them into a separate common schema to
avoid these properties to be duplicated in different DT bindings schemas.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v3)

Changes in v3:
- Fix "No newline at end of file" in solomon,ssd-common.yaml (Rob Herring).
- Add Rob Herring's Reviewed-by tag to patch #5.

 .../bindings/display/solomon,ssd-common.yaml  | 42 +++++++++++++++++++
 .../bindings/display/solomon,ssd1307fb.yaml   | 28 +------------
 MAINTAINERS                                   |  1 +
 3 files changed, 44 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml b/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
new file mode 100644
index 000000000000..3e6998481a75
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for Solomon OLED Display Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+properties:
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
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 20e2bd15d4d2..3afbb52d1b7f 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -27,38 +27,12 @@ properties:
           - solomon,ssd1307
           - solomon,ssd1309
 
-  reg:
-    maxItems: 1
-
   pwms:
     maxItems: 1
 
-  reset-gpios:
-    maxItems: 1
-
-  # Only required for SPI
-  dc-gpios:
-    description:
-      GPIO connected to the controller's D/C# (Data/Command) pin,
-      that is needed for 4-wire SPI to tell the controller if the
-      data sent is for a command register or the display data RAM
-    maxItems: 1
-
   vbat-supply:
     description: The supply for VBAT
 
-  solomon,height:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Height in pixel of the screen driven by the controller.
-      The default value is controller-dependent.
-
-  solomon,width:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Width in pixel of the screen driven by the controller.
-      The default value is controller-dependent.
-
   solomon,page-offset:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 1
@@ -148,7 +122,7 @@ required:
   - reg
 
 allOf:
-  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: solomon,ssd-common.yaml#
 
   - if:
       properties:
diff --git a/MAINTAINERS b/MAINTAINERS
index 987152e3be02..c63649e9ba58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6765,6 +6765,7 @@ DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
-- 
2.41.0

