Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4CB03C21
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D710E44E;
	Mon, 14 Jul 2025 10:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TTDaxXXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1234310E451
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752489889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXL9y7xBlAhc4AXFCXGCZMpy7EHZFtBhXWeACly5wqo=;
 b=TTDaxXXkP0mpussXnx82w1JzvLs64FcF8hWX7NS39ZDQrOpb+c0lVUm3j6oR5Us0w/y/2+
 etHkqqhV7aEGMHHIOMKR7xnpe466cDqLqbMR9lQDS7QkfmFXUdW2l3vF4TVnK5kxcn2qVa
 DU2J28AHQmwOcrvPZEk6ULXwhTbMKe8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-D_NbcMVkMSy6Ft9fMnFoAg-1; Mon, 14 Jul 2025 06:44:47 -0400
X-MC-Unique: D_NbcMVkMSy6Ft9fMnFoAg-1
X-Mimecast-MFC-AGG-ID: D_NbcMVkMSy6Ft9fMnFoAg_1752489886
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4e713e05bso1826028f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489886; x=1753094686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UXL9y7xBlAhc4AXFCXGCZMpy7EHZFtBhXWeACly5wqo=;
 b=XRxqrr1D2croH7cZDVz8PCk6/JcMOMRQwqgVKN9apKUbYgPBEJfsOqibzN26LXCk+p
 lXGBbcrvF+qMhRg4IgBzLlURcOV1VJvugzQIRhHlPo4xUi9UMrEW2do0lkXsG2kxATI6
 wzGhKjS7DxJAsbpu9kg1pFt5j+W12tVTQGIxlc7yqBV14mxCaOULPwsriVv+BVYnn7iS
 h3ZZECZ6UyqIZXejRGDs2SnQxxSaMSmPHfSsYIMXbkJgc0DdiiF1N8Rugo9qoHhjpZP3
 3FHFoyP7IEHRrn4ctGnfZrWWkB4wTb01iFMAtbs9i4o+9oENtsnJ8N9+B76jM4O+9XyJ
 unlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMQXqlMKnxtkjYVpRY4UYmdoDnij3Fw8Xy3Lcy2YOrPNUAg/3FXf1T0AAS1njAMPOK43e7B/u70Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD+/xkfmKpkVghpEMp7gRAkXG9oluA2f7uQKT5yPA0VNPdukIu
 RXr5eJnlXCww9yiS/GtEEETrvfh2KeK5p3trgEgQ7ane+AioSf9tc+7++5bFM6INhzk6OD8z2cJ
 7msw+spZuEckGLdOLm3C8+UTNHvAYeDroN96Y/5zRjAtAduN1cv5PkVg0ZZe4FbIIMpI65g==
X-Gm-Gg: ASbGnctNG98O88yNZ2xu7T4d/uk2PIEomBYePZHN5dI4DOMPAKfPSi8u/UktjBH4oKe
 wnD0RyE8n7r1IYn+6KEHvdHt6brMBoRH4Wcm8cWTIxyXhbBteDAWEh/fg5WapwroHZ0mtaUd0fa
 EkAYKvyMrU9BLDgkrYakE5/dyDiBNwhqNLLKElU+TX0PYKICLINmr9hqhKMgwuAKiBnz3PCeUsm
 4bnMuHhBsVm1ekJwwHN3jZfRwD8lWjBh7w3il+/SOEhTn90akUQQSGkfTw4nhp2UzCXXUyYKSEe
 0ihOqlF0vUKYDeH8K6qcqDhL327dsRCx
X-Received: by 2002:a5d:64ec:0:b0:3a4:f6ba:51da with SMTP id
 ffacd0b85a97d-3b5f2dc2868mr9964321f8f.15.1752489886411; 
 Mon, 14 Jul 2025 03:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgeEBunGgrYdyyx1Q7dxCaPxvUeX/pPehKrFaYxcQS3TFsh9G8Baoie8ftqyWxl1dIxeb+qQ==
X-Received: by 2002:a5d:64ec:0:b0:3a4:f6ba:51da with SMTP id
 ffacd0b85a97d-3b5f2dc2868mr9964292f8f.15.1752489885942; 
 Mon, 14 Jul 2025 03:44:45 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1792sm12294623f8f.13.2025.07.14.03.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:44:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] dt-bindings: display: Add Sitronix ST7567 LCD
 Controller
Date: Mon, 14 Jul 2025 12:44:03 +0200
Message-ID: <20250714104421.323753-5-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714104421.323753-1-javierm@redhat.com>
References: <20250714104421.323753-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wE62Tv54s9T6qkh59GZkdBEWqrpE3Uysr1O_EEfayK0_1752489886
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

(no changes since v1)

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

