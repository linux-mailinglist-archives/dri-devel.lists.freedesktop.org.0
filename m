Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C793B9EC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 02:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6072B10E7BA;
	Thu, 25 Jul 2024 00:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WcrvSEps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6B10E7D3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 00:48:16 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-79ef8fe0e90so18318785a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721868495; x=1722473295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AcNLYjqyP+dKBUQYZH9o81V8DikvAh6HKnAT525IT4=;
 b=WcrvSEpsP1U/GfiMczVqPSj16WUt8iDiXq3tLAGrVyR31F9Z9wo7EWr/JoB9v2lOYZ
 Iunw2xZZdNJ66os//uiajC+ms9MTtpwWwaTOIOXK1pItG2ljGEwJsNwNEj4qknwioONC
 nhjcTeX/HB/ivzq1XRMti1mWPcOAOYwLj0U5RklzRaMZ9ldyq/MFDcOUOA9hw19OGm14
 YTmtJGWLwHh53TBwIJ8JF69/v5uxzR51Mh1HfSPcHbh3GEvGoy11C69cVCNxrbTXLi8G
 tX8ZUS/AUauRBxDWoNCeDgb/r8dAmiL96tNkqfePDfv9y8SoMvnc5LJCW/Nuc1C+7VMk
 Fv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721868495; x=1722473295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AcNLYjqyP+dKBUQYZH9o81V8DikvAh6HKnAT525IT4=;
 b=RHOSwqgP01haI8Wu+BRjwgnJqrHzf3bIAwxAkqxwXIGxL7lnexeSmJtjFWgHZMA928
 WgYExcq3Qf0NKK76BEVbn/Yunf7TXbRl/Ux4dXsX+n/kytWjaaifK34Bb1RVJcIfnXCr
 Dk/xHh2R6JJphUMHk7565HUyJvI9GWzJdZUUrboCp7ntE10AIsGg3SM2RB2Xo/34ieHl
 Ahz7hVDxMZDZhaOww4Du+sFmVGnRfPbDwQeoLgJiAzEH6oBZSDsFfVZh9VejI3A3au1e
 EDjUFKhDQzIsoYnwYX82wryL5GHquK5zmtzoFqPX5j2eAwALwGN1rMPWBmOHIhtFqNWM
 48tA==
X-Gm-Message-State: AOJu0YxoOj6I7+IWHLTYivSA4mAYdlE6eWCVRAPjHYMi8XtZbYsHrxdS
 Ex5XCVqfTMhMPwOPX6y8Iv2pRzYtEQxdBkZIsgatG8xHawyAdztA
X-Google-Smtp-Source: AGHT+IEjRAGyubNfJqWNroANBDispQ3nRK1qQTjcXY7+9WOlVqFdfZLSX59oQxqjiTjboCT9cxf3iw==
X-Received: by 2002:a05:620a:454b:b0:79d:532a:fcbb with SMTP id
 af79cd13be357-7a1d7e142b9mr33533985a.2.1721868494691; 
 Wed, 24 Jul 2024 17:48:14 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d74353e6sm19339885a.87.2024.07.24.17.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 17:48:14 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: mehdi.djait@bootlin.com, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Wed, 24 Jul 2024 20:47:02 -0400
Message-ID: <20240725004734.644986-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725004734.644986-1-lanzano.alex@gmail.com>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add device tree bindings for the monochrome Sharp Memory LCD

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
 .../bindings/display/sharp,sharp-memory.yaml  | 97 +++++++++++++++++++
 include/dt-bindings/display/sharp-memory.h    |  9 ++
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
 create mode 100644 include/dt-bindings/display/sharp-memory.h

diff --git a/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml b/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
new file mode 100644
index 000000000000..a79edd97c857
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sharp,sharp-memory.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Memory LCD panels
+
+maintainers:
+  - Alex Lanzano <lanzano.alex@gmail.com>
+
+description:
+  This binding is for the Sharp Memory LCD monochrome displays.
+
+properties:
+  compatible:
+    enum:
+      - sharp,ls010b7dh04
+      - sharp,ls011b7dh03
+      - sharp,ls012b7dd01
+      - sharp,ls013b7dh03
+      - sharp,ls013b7dh05
+      - sharp,ls018b7dh02
+      - sharp,ls027b7dh01
+      - sharp,ls027b7dh01a
+      - sharp,ls032b7dd02
+      - sharp,ls044q7dh01
+
+  reg:
+    maxItems: 1
+
+  spi-cs-high: true
+
+  spi-max-frequency:
+    maximum: 2000000
+
+  vcom-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      VCOM is a signal that prevents DC bias from being built up in
+      the panel resulting in pixels being forever stuck in one state.
+      vcom-mode can be set to one of three modes
+
+      SHARP_MEMORY_SOFTWARE_VCOM - This method uses a kthread to periodically send a
+      "maintain display" message to the display, toggling the vcom
+      bit on and off with each message
+
+      SHARP_MEMORY_EXTERNAL_VCOM - This method relies on an external clock to generate
+      the signal on the EXTCOMM pin
+
+      SHARP_MEMORY_PWM_VCOM - This method uses a pwm device to generate the signal
+      on the EXTCOMM pin
+
+    enum: [ 0, 1, 2 ]
+
+  enable-gpios:
+    maxItems: 1
+    description: Enables display
+
+  pwms:
+    maxItems: 1
+    description: External VCOM signal
+
+required:
+  - compatible
+  - reg
+  - spi-cs-high
+  - vcom-mode
+
+if:
+  properties:
+    vcom-mode:
+      # SHARP_MEMORY_PWM_VCOM
+      enum: [2]
+then:
+  required:
+    - pwms
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/display/sharp-memory.h>
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0{
+                    compatible = "sharp,ls013b7dh03";
+                    reg = <0>;
+                    spi-cs-high;
+                    spi-max-frequency = <1000000>;
+                    vcom-mode = <SHARP_MEMORY_SOFTWARE_VCOM>;
+            };
+    };
+...
diff --git a/include/dt-bindings/display/sharp-memory.h b/include/dt-bindings/display/sharp-memory.h
new file mode 100644
index 000000000000..dea14c7bd7ec
--- /dev/null
+++ b/include/dt-bindings/display/sharp-memory.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_SHARP_MEMORY
+#define _DT_BINDINGS_SHARP_MEMORY
+
+#define SHARP_MEMORY_SOFTWARE_VCOM	0
+#define SHARP_MEMORY_EXTERNAL_VCOM	1
+#define SHARP_MEMORY_PWM_VCOM		2
+
+#endif
-- 
2.45.2

