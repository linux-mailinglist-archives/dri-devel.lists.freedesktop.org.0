Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392CB1D311
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D6910E7E8;
	Thu,  7 Aug 2025 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GZMgljha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C9610E28D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:48:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-454f428038eso59048925e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754484504; x=1755089304; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VNB7a4YMrb27z2qd3889RKLzuXK5LQzifxp7nYv4e34=;
 b=GZMgljhaeH2Ldbl4qPnHcAKOiUVUmT7GH5OED5tXi5usIrqnq3zpBPEsVs0nS+tgHT
 AGq2JoEZE1E548q17kG/Da1KkcgqpGMsYflLKvr+/89HBZ2P8Hdwpr4ReWEEmE21U0j7
 +zarm9/tgJA10n1FEDErWyOs3tEej6WkJUhSfuj2d7Oy7EwaViIE6hHX0rC7HuMhfUkn
 LVU8vNLSTadO9MqXMuRno7PhE2xtUiKV7e6nasPHdDgsvgxKkD5GCUnQWApVsEqa9tyn
 tWdbxayIFaj30ndNERcinATlrbDadCVScs6MguuTrgNvI+i50wFZEF7RKoipDGWgVz4D
 TOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754484504; x=1755089304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VNB7a4YMrb27z2qd3889RKLzuXK5LQzifxp7nYv4e34=;
 b=D3kiOMQNBwo9AOQkkW0UzvD4oFbMcZO7crH2haGN2KwB4t1Jf1ZSrTGQpYXFUvheUm
 YrEaAA75hCbrGXXhsv95lKCtEgHgMhoUnWsP5eNdIaYjKvMrVp8fC8e+2Gh6C6/EUQqs
 o9asMZiOaBfjkXuyDRz+fpphD7+2I3fQffeXu6Cd+mGOwfS9vFdbBpRAiaZPDErZDM4u
 j/QMvx2zqIu84ax+oxJ8aso0pVcJTgcIMx+f6C55+vy4z0sVe/1RgxCzhHcZGCTBtBOf
 onfH+4TIauzG3PUP/FBwY0yecPbtj7a8r+PbKYlggcFi8RpWmefDXVS83ueBHG6fSQ0c
 n3VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZeyPNol+wJ0ntBby/yRin+y5aB1GnhT+NBCYsrmUXQpFMkNfiZFy6I0L/1zyecBP6JzwDWvJMXoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrF1cUPksfFFiKQPQbtYR4jeGL+Bt2bCfeuIrUNxjKCboLb7CP
 nxjPPCChLdVRteHbB0FItTNud0Phf3EsAyBvvmzLvxyH8EeWtehC7e2s
X-Gm-Gg: ASbGncv8ynweIZ6av1ZcrxgZ9iJzpPKasmK65h9tQVwJCqsTq1s5uosrm/nxRwq8mgJ
 dEcysZ1i/7/CnArR0tF6yWWPEg7lkmmEjjF6m6kwzL2EA3BqvOF5PqYpjDf+sKZXflKiK/1uuuB
 1ZfTlzzurFaPfrVpPfiAVic4BsmNnSGcOD+hFr0KUh/NBhnNcNg2MS+bAnRQGzrzh7aqFPHoGPi
 GVOWlsi1T79LLw3ZoVmFEW6s7+9S+pjNElzgApllGPhvEUJ5dQU13S2v7eZ3NPU56fEKWwUr6tk
 R1hVn7LK52CPhJqWfvuXzavdC2Xb3GkMzC1bdsULvZGuz6AI1hjPJb7UUJFxUiO/WmRlo3M1ZJu
 wWvQlseL1meruwmK7DFuUMBhhcoW36qxB9ZTOoRf5v5Lp06RGr9RBOAbwkk4VIYYH
X-Google-Smtp-Source: AGHT+IFBN2DPUlyJyt6dAn1vE27EUq0AzZJVPt+v4DrPvA6gwhn0tHlUlYyfF/G2CuE+a+IuY5Mzmw==
X-Received: by 2002:a05:600c:1c95:b0:456:1c4a:82ca with SMTP id
 5b1f17b1804b1-459e70f63b8mr23496805e9.32.1754484503564; 
 Wed, 06 Aug 2025 05:48:23 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([91.116.162.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458be70c5f7sm170110045e9.26.2025.08.06.05.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 05:48:23 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 06 Aug 2025 14:48:10 +0200
Subject: [PATCH 2/3] dt-bindings: display: sitronix,st7920: Add DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-st7920-v1-2-64ab5a34f9a0@gmail.com>
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
In-Reply-To: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

Add binding for Sitronix ST7920 display.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../bindings/display/sitronix,st7920.yaml          | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..caee85f98c6d242dfab73729210f8c34b23a3a99
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7920 LCD Display Controllers
+
+maintainers:
+  - Iker Pedrosa <ikerpedrosam@gmail.com>
+
+description: |
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
+  This binding supports connecting the display via a standard SPI bus.
+
+properties:
+  compatible:
+    const: sitronix,st7920
+
+  reg:
+    description: The chip-select number for the device on the SPI bus.
+    maxItems: 1
+
+  spi-max-frequency:
+    description: Maximum SPI clock frequency in Hz.
+    maximum: 600000
+
+  spi-cs-high:
+    type: boolean
+    description: Indicates the chip select is active high.
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example: ST7920 connected to an SPI bus
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sitronix,st7920";
+            reg = <0>; // Chip select 0
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.50.1

