Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9398CB93
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 05:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED90710E0E0;
	Wed,  2 Oct 2024 03:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ViTEaiVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9056810E0E0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 03:38:44 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6cb2d2a7d48so44114986d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727840323; x=1728445123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
 b=ViTEaiVuzRKEa9sd0LGINF3rLoZL+Jt0d3azKsq2rLC+nrX/qTzefrCexsws4mtayd
 29tnwxQYFpk1GPEYj/+T32JHfh/aoNxhIS7w4CTsUzZSppUF/LHrtOvBbFQqhqjFZmzI
 CBbfZsfHVLI2y/oKyUX2jnJK00brVulqZm7IFG5uBVSUvfasPxQIx7oA0M+SS2R8pQjm
 ZFZKh+yGf0ORnt5xRLhi66hPIxkNH/io8CYmNuJPwg6rsmuIjnIVsWHx0PgbJQjPnBDI
 7HdBsyVoSt6/i3/gLRq2Vzm7inzqyF93wHFyI2JyLV12LpbBBDQyJbEMgp5aCDWCmUNN
 FSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727840323; x=1728445123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
 b=bSysDEgVLyT9rSnkt48NhpHN66rgiTv/Qwnq4LnIeevIqQvQlSZ33aKnn4j3lEATHv
 5oL5BjYJQCNo0j68sbi7UJZvpfjIQNanTjgqo7ICOGx1QWPqEzPBhmMwo/qWyElGrXJ4
 qZCZQ/w1066CwfKaCzdLjfhaz4yo0n1gaKWUndXswdDLj3iOJU+hnUI/8+WOYp9H+0md
 TEk4uL6oM6XLDhB5s1Yn+MLXlG0HO61y+Dn9DvlgY/USsui9DSZeUh3Qc9AMbbN6Da7Y
 bgpDgX9YW0/6tTZNZmuPdT8MakI7y4NmNB3mZ3UpDsV99tx7g+N1TN46t+m4I2FVNMYH
 u7TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiGhse+/8n8n5cPQdIPfsFa/+8rlnB4q4gU6ZvWOqAP91AjGTMPsUmH/h5pKAI0360hXvPspGR4YQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFAQWG3jg80v0SsSLgCDMLmuLGZLpYMc2DfX/A+iLl839SJ0UQ
 KiouoG8i6o0HrwMDXo0A1694E5Bj9EzHlqKRhCwhAkS/kb5xJ1Cp
X-Google-Smtp-Source: AGHT+IF9Jfkt6rq+pRhtFzL8UUBhqRdqj7GBTlabdTV3sqq4yIKtW2BH05YRhH+pw0+XjCs4mPcgDw==
X-Received: by 2002:a05:6214:5547:b0:6cb:2a26:af89 with SMTP id
 6a1803df08f44-6cb81a64ffemr26531116d6.34.1727840323315; 
 Tue, 01 Oct 2024 20:38:43 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b62d9e6sm55640446d6.69.2024.10.01.20.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 20:38:42 -0700 (PDT)
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
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Tue,  1 Oct 2024 23:37:36 -0400
Message-ID: <20241002033807.682177-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002033807.682177-1-lanzano.alex@gmail.com>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
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

