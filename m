Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D037C78B7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 23:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ADB10E567;
	Thu, 12 Oct 2023 21:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379310E555
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697146755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zvrgj9LmWX09P0otLVv1M+TO46oxoY5RjfV1LrD5p/Y=;
 b=Qj/zyzwV9ohdof1Y6DdsCCeYGIgMNYDb0Q+Ui/Fots3y/hUvews1ZhNEbiJUaaxfgtzxLl
 RxoQZ3l5MmZvfKKICS2xfTUSc6oyaiC/Ay68oyyCvP0CwI2dYc+W1Weloi4YTCajyBRIq7
 izX9nZ/9g3nsHY6DDoJ9IvPWkO1veiY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-yjrAqB3nP3auYha_0kTkZA-1; Thu, 12 Oct 2023 17:39:14 -0400
X-MC-Unique: yjrAqB3nP3auYha_0kTkZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4066e59840eso10033435e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 14:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697146753; x=1697751553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zvrgj9LmWX09P0otLVv1M+TO46oxoY5RjfV1LrD5p/Y=;
 b=f+23vk4FvkmBCO9LXSg15sAU6oltisaIt6JABNIGzfHB1yxv2+LaqD1WpKqg+SS5WE
 8TrCZFAsu9fNLUUOlvGluEKoquTTsZyGUfuY/Vebdt9oB+GOcqW8nLtJyKcL3y0r3Qon
 ujlszHdq2KB7yMtYipeUxComlxDuAtSK344jr6caHiKv+XZkYTe0qkeSVeFFrrxwdv27
 sTTkMfNqKOz+W6IeG44QTlYjX5Nx+/obv1J4NThW14GfZ+Gs17+WUUzag6y54ig3IzUR
 4dP3Hp0IVfPR2rRV7Y32keE99QRS0JiCeSlAhNjMry+UzZUucMDLuwZpLTwy5tcmALRX
 uxPA==
X-Gm-Message-State: AOJu0YyfZfcMLO/9BxOJ3X1TVntVg7UWz0k11ifKgG1/nx/UpoTz1oJD
 8SPignIQbI3xHAgnyWM7MFZzy4DlrnRvtWvtEnqeAuPAcBdzNUwzKbsR4tE0lwWow7fFma9tpGU
 0RMPgr9v8f3D6mYfKcXIE4V0XKCYK
X-Received: by 2002:a05:6000:c47:b0:32d:96e0:8048 with SMTP id
 do7-20020a0560000c4700b0032d96e08048mr1285797wrb.9.1697146753375; 
 Thu, 12 Oct 2023 14:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa0OCXnp4TmZg8fDDOv2923o5ApTWRzYFiWzqeGRiluRFdYCqG4XtpAfQeNB8xNHJ97UalbQ==
X-Received: by 2002:a05:6000:c47:b0:32d:96e0:8048 with SMTP id
 do7-20020a0560000c4700b0032d96e08048mr1285788wrb.9.1697146753151; 
 Thu, 12 Oct 2023 14:39:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l16-20020a056000023000b0032d893d8dc8sm4982734wrz.2.2023.10.12.14.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 14:39:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] dt-bindings: display: Split common Solomon properties
 in their own schema
Date: Thu, 12 Oct 2023 23:38:35 +0200
Message-ID: <20231012213843.1151060-6-javierm@redhat.com>
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

There are DT properties that can be shared across different Solomon OLED
Display Controller families. Split them into a separate common schema to
avoid these properties to be duplicated in different DT bindings schemas.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

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
index 46ca5c4affdb..4a3baf970839 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6732,6 +6732,7 @@ DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
-- 
2.41.0

