Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF1B50F5A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7604210E86D;
	Wed, 10 Sep 2025 07:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fGvxGJRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8315910E263
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:53:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45decc9e83eso11133245e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757436796; x=1758041596; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p94vhBpn6I1H1gadXz17+U2dyfmeO5CYxkWEWa6pquY=;
 b=fGvxGJRbLS5aFTT2Qt3l/elque0own8fHr9xxdEOlwE9NmxpjFakNMsjZ+jE2GS7Un
 WQuX1lihTMSSJ4JGAJbw08MHIuVBlL9xo4e5NQY9/pZhJkk6O/mLV5ODBWglMZrqthzc
 glRqvlDY8lcg+kYC/8JhI6s3dc8CYqevV2Xp9WvzyR7b96/fZz17zIuOCyQ8vV92PtfA
 AGLJJDecH1iVxroAna+lU/AHE/fNAZqh5nhQpFzU6q9P1/YRh6kWhNqnS2rP6OC/Ks9y
 IS1O0ffBft2cAAxdFRbsU4DH1LaSP6AfSdgoiyPiN4iDUjgW8cLZNWNwk3WMGC6XDHbX
 OU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757436796; x=1758041596;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p94vhBpn6I1H1gadXz17+U2dyfmeO5CYxkWEWa6pquY=;
 b=mext+XwWr3LJuifbsL7RECVXdgTkZRQhwU7C9Xrr4wvKHmFb3jJzOyVWG0yw9r7q/Y
 XpKbg+QulpXEjJcnGmhNA7f54k8BNrOGiTDZugE7Za3sSFbuuDvTAOHg2UcXFTZ0yT8c
 m0tbulwEhdoUJMMpX2/3vBPpU5myQCY/5S4PJxxgY5W/QPs2oQzWiYTO4A3aNufE+gLL
 VVGYp6vKaGJdPOLMMNtLYU/TP2+h0XElkNe/Bptu8RicYmHwrrzC94PiOETMpmsGwf30
 1frbb10hO6dxfndu3edd1z3T5qjxoEhFwMQbuUbB2s03uXyE1wlFpzACYM6MaZuny7nU
 FxIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKtN5lAzvcr7wOvKJFE4pGRLP/esegm+kpUBvmRsTkIhK/34jFFAZU4o+0muwO/ueaiyiNTzzfXoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQPO7JbABpLsCzuLYe5brLP9nS+hsEgcZtalFVz4+Rk/tgpZVY
 Lut6xAMo3XrxP4Kvdhd3Xq7cyEAU1OJ8yRSpiAQHm9/5YkgHn/QivpeGqfrEvg==
X-Gm-Gg: ASbGncsYmiqhaOruRGLlnC+JF2SuHahxuTCW9CL2rr1xOS1F2bJ+xqZijCHhfWGF6Rl
 RQi+CPf4UJiLfbF17eD7G59pm4El5ZzstLSrxBmddbcivMYzovFs54svYINN+zQmWippCXJjOke
 9yCE7zNRn5ehLicCW4rcz8MJJt/2cXR/UjcYSjfm0Fd7pnzg3jTmB/J1Y28x92iniFjPS3acgjO
 wYOjo4R+VJhZWOBBDvZtGtTR8T6znjF3kVBfRyNQVvBrorjyRGH9aXS28PJyClb3p3jey28QIFl
 /LYK66K2fxtQmHGObSmGbSMOQKaW1b0VZt6FtP6It2CkjULxVVh0aBIGLt3NuGyN7pe0T//DiGU
 HDBJYyuJGL6e8wD3CGtMI3G04SHWZi3SLOCXeBuMPkZCx+sMMNirbscsJiVrFYh9iyC+EH4rgUU
 w=
X-Google-Smtp-Source: AGHT+IEF+jsF9Ep1sxBSIPUi8j40DLrBGK1qvHYFTtZX1Y9LF80IpzZJEcXp+w18dvnss1B8AiANuw==
X-Received: by 2002:a05:600c:4fcd:b0:45b:8822:d6c4 with SMTP id
 5b1f17b1804b1-45dddee600dmr125529755e9.33.1757436795745; 
 Tue, 09 Sep 2025 09:53:15 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9ab7c7dbsm314379085e9.11.2025.09.09.09.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:53:15 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 09 Sep 2025 18:52:44 +0200
Subject: [PATCH v2 2/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-st7920-v2-2-409f4890fb5f@gmail.com>
References: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
In-Reply-To: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Wed, 10 Sep 2025 07:28:23 +0000
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
 .../bindings/display/sitronix,st7920.yaml          | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f08869c48a634cdb2a9e6fb33a0510cd1a407970
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,52 @@
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
+description:
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
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
+    maximum: 600000
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example: ST7920 connected to an SPI bus
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sitronix,st7920";
+            reg = <0>;
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.51.0

