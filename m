Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A55993D46
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 05:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B63210E44C;
	Tue,  8 Oct 2024 03:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fThRNj/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049210E44C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 03:05:01 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7acdd65fbceso407167685a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 20:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728356700; x=1728961500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
 b=fThRNj/4FUbso8zXJMuumTGCFL+GR94JIZUzD4oQhNXOSI/3V6jWaNjjIjClW5kUSI
 efA9NtYp22CPKxFxH3g3T0pSgn1wmHUvyJTYMfTm52ReErEL7URBR4S5fRMrnjdgJGZv
 gFunNnOZwkZ0h+/pR+/vp4PuneCEu+635vB47COHhVU3IH8BicZLAwO4pTC2wZ2EdvX7
 Kho6Ux4Jdwx2Yqqd30Hpm/WKNNekCDSJW/To7pjFvilIRA091Df8/jvHQYNqT63+kwBd
 ov+0iCpNBeGUu3tUlYuTRLU/CWEISiAQDzT+sGm5pFIWfduUPCIJekJnFEjeMLEBtJd3
 cJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728356700; x=1728961500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
 b=MQKkC9OJSZ9/M3YUY6Gcy7qbGtM53G/d/DjZWWTRU2TR3jAbDwH0QTv4Cap2oJlyX9
 lKomODZVFQCE7pNESFW63RIyE8JdTXdO1TF8tEuAEGvXlfLOC47qm2KVXhcEhsWHMV7M
 r63Ygd8M1cx/ZgcDEye7nfE2RMHQAiTPvGzp8RDA1ihvEC0GSoV2WNY5VyKcckuKAxDs
 FAH6fYdSsYMkthfv3+umlogPRKTCgID4durAR4GYYzGDvpYuldDNPYcRBY+mFiuj9+kV
 ItbHL2+43k+gZJGUwcnj+7mKaEj0MUYZXeVx0CQQJfEkY0JGOB8t7rFKytU9VbzC/pKm
 TZbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTqKy0q770vIHAv2w4Ca2JL1T0Da03pB8STh395dI67oWpCZHQz+m+PbfHO1MBbVRjXYlUr+U2+UU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEna7VIVzJjc+EHPSm+2wtSjHfy2Zxet8CI6M/IM6tO0uT2C5B
 DzkKQZ4ixO3OhH9byE/zuOqhlMVsuDBZcOsXTT6o8TcoPMCPbvne
X-Google-Smtp-Source: AGHT+IEyM9oRaeOdZt+2OiZHhPytRrOmaj83NBfEXAPMZk7TN3qW/GnckGmOeBjLGGYr2QMEJTPabw==
X-Received: by 2002:a05:6214:5912:b0:6cb:938d:be2b with SMTP id
 6a1803df08f44-6cb9a4600bamr191619706d6.35.1728356700366; 
 Mon, 07 Oct 2024 20:05:00 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba46f1912sm31107156d6.61.2024.10.07.20.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 20:04:59 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v10 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Mon,  7 Oct 2024 23:03:10 -0400
Message-ID: <20241008030341.329241-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008030341.329241-1-lanzano.alex@gmail.com>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
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

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/sharp,ls010b7dh04.yaml   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml

diff --git a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
new file mode 100644
index 000000000000..8097f091c2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sharp,ls010b7dh04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Memory LCD panels
+
+maintainers:
+  - Alex Lanzano <lanzano.alex@gmail.com>
+
+description:
+  Sharp Memory LCDs are a series of monochrome displays that operate over
+  a SPI bus. The displays require a signal (VCOM) to be generated to prevent
+  DC bias build up resulting in pixels being unable to change. Three modes
+  can be used to provide the VCOM signal ("software", "external", "pwm").
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
+  spi-max-frequency:
+    maximum: 2000000
+
+  sharp,vcom-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      software - This mode relies on a software operation to send a
+      "maintain display" message to the display, toggling the vcom
+      bit on and off with each message
+
+      external - This mode relies on an external clock to generate
+      the signal on the EXTCOMM pin
+
+      pwm - This mode relies on a pwm device to generate the signal
+      on the EXTCOMM pin
+
+    enum: [software, external, pwm]
+
+  enable-gpios: true
+
+  pwms:
+    maxItems: 1
+    description: External VCOM signal
+
+required:
+  - compatible
+  - reg
+  - sharp,vcom-mode
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        sharp,vcom-mode:
+          const: pwm
+    then:
+      required:
+        - pwms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sharp,ls013b7dh03";
+            reg = <0>;
+            spi-cs-high;
+            spi-max-frequency = <1000000>;
+            sharp,vcom-mode = "software";
+        };
+    };
+...
-- 
2.46.2

