Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BDAFFF2B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B9B10E37D;
	Thu, 10 Jul 2025 10:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TJBUwT7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352010E371
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752143151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUOjdgW24CAx0aqD+3zmRz0D1nbY1TritNaHwReu0ak=;
 b=TJBUwT7nLfFCCeUc4pPfCxFLVd2CIIuXfwy0XrwmyLyv+z6GswuZ2oWjAfF4KG7czuGmSZ
 9E1359urBCviiKh/PM93t6zFPbHtgDNcGoLRbZ5+UakSAdEEeuHHBQZ09e/kAl2z98Gcil
 ieIakVPGNxLvrgTB//iJ9mF2j9VJOhs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-m0qAB-ikN1-fMbEl2Eyrug-1; Thu, 10 Jul 2025 06:25:50 -0400
X-MC-Unique: m0qAB-ikN1-fMbEl2Eyrug-1
X-Mimecast-MFC-AGG-ID: m0qAB-ikN1-fMbEl2Eyrug_1752143149
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4538f375e86so6184675e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 03:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752143149; x=1752747949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nUOjdgW24CAx0aqD+3zmRz0D1nbY1TritNaHwReu0ak=;
 b=m++MxZotO++w4Rs1abPHgK/0OLRIqSUTdsC6KiDvY9RucAu494OSARTPv04i0QfZtX
 RQqO46tPJ+2DBbes5oSmK6gwKV9RDclPrOXnnOOqGuLXTdcaYfnUoqbQmli1O9YiWDlA
 dHkqRkSCS3Jm1mcNwFD3tB/KhmecFzall405dHK5aOczUEXMfpumV4JJLQHZgAJEITA/
 0GvdSwnYfxp0vtLzNKjRQlbZuH0JddyAvc+y/mQDcQrxasHDQtRfmZNRm8cgG+u5rKVt
 o5ix/83BU6SFpMQW75Dfhds5Z+lZzAjH/Y4URxgXO/wiDJFA35kFcZle+OPSi3qJrdKC
 r+PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuM+t0pKYhdU3iU/AAMfN+7CI8swJ6jiW1cWDQuWLglSuZjOlIzmmkXrBOQOPu5r+ppmBSsIpXZU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKabVB7pHG7V2LA3tW1vfKy2QlOxL9ICsBPiraAXIbBKlVv9op
 Ta7Pl4lU22mgVujrnDPT1yK9UG8UW8fnYSd7kufhDu3WFqzaj6Yosy3uUoO/bRWVKd81myKp/0E
 xW5s7pNpVnfG/rB+b7aHWA4Sp3strKCxLwza/sBc/OXFTM9KHjAP4oSFDcT03Cm0FLvRNdg==
X-Gm-Gg: ASbGnctAT4+i/YSdNXut6zqQPyR/SFNpfOGLql6gWlPoGKpjM661Q3TU8Eq/XQ18qGz
 APPnO3UXhLkrTtnLasxbD1qKVAKObB6Mg8czow0tdMY1Uw26W5qTgWcMvh3DiWn9wSrgNzXUPZ8
 6/YPDjf+cBoo+BIhvJn09arc527Klh+E2KWcA6Pk4X4mab5eeFH/zlMJ8WossJIQyjnlJ/YZ/zI
 VNmcEWKVLgBr97dC+xsRThwmu7PwNjDGo+bCVkAUXSk4G1MJs7xCkJncQtMIjLl2IFGVrObUy4v
 PH5iWLU0Z5UrjWk8tW+jkpR6KdwOe8SzkCOHwHqbi1ZoWAY=
X-Received: by 2002:a05:600c:4f11:b0:450:cff7:62f9 with SMTP id
 5b1f17b1804b1-454d53a0109mr54446145e9.22.1752143149118; 
 Thu, 10 Jul 2025 03:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe5pDfF1QGLabNBfFC8xpTYdo6m2Xcdy7HSICzHa9sm5ah3PthWEt+IQ0sKkzkTeFviyoUlg==
X-Received: by 2002:a05:600c:4f11:b0:450:cff7:62f9 with SMTP id
 5b1f17b1804b1-454d53a0109mr54445795e9.22.1752143148641; 
 Thu, 10 Jul 2025 03:25:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d70csm1504884f8f.62.2025.07.10.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 03:25:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: display: Add Sitronix ST7567 LCD Controller
Date: Thu, 10 Jul 2025 12:24:33 +0200
Message-ID: <20250710102453.101078-2-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710102453.101078-1-javierm@redhat.com>
References: <20250710102453.101078-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5UxjGN1GPWbZloHcOPNKwZriS_1u6i7FjGHm0YxFDeA_1752143149
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sitronix ST7567 is a monochrome Dot Matrix LCD Controller.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../bindings/display/sitronix,st7567.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7567.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7567.yaml b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
new file mode 100644
index 000000000000..e8a5b8ad18fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7567.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7567 Display Controller
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+description:
+  Sitronix ST7567 is a driver and controller for monochrome
+  dot matrix LCD panels.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7567
+
+  reg:
+    maxItems: 1
+
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3f {
+            compatible = "sitronix,st7567";
+            reg = <0x3f>;
+            width-mm = <37>;
+            height-mm = <27>;
+
+            panel-timing {
+                hactive = <128>;
+                vactive = <64>;
+                hback-porch = <0>;
+                vback-porch = <0>;
+                clock-frequency = <0>;
+                hfront-porch = <0>;
+                hsync-len = <0>;
+                vfront-porch = <0>;
+                vsync-len = <0>;
+            };
+          };
+     };
diff --git a/MAINTAINERS b/MAINTAINERS
index ee2ef9d9db2a..d97e091b1742 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7835,6 +7835,7 @@ F:	drivers/gpu/drm/sitronix/st7586.c
 DRM DRIVER FOR SITRONIX ST7571 PANELS
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
 
-- 
2.49.0

