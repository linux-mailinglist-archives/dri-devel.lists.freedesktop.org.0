Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA079967BFD
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 22:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E8110E1B0;
	Sun,  1 Sep 2024 20:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAntXktN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490A710E1B0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 20:12:01 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-70f657cc420so1539238a34.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 13:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725221520; x=1725826320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK7eqKzfxTCXYjY4yBuvM5uGMWIrx3TALuq0TWoNpjA=;
 b=JAntXktNO+d+3U4UCiyryoDd+/WdCiADaxnWihbI/tssYYbfNRHO/M14MlfmtpQAn5
 zlqb3dRUzIBNt1vhoyc7CdClBJXdvMRsPQUZ9hwxpwkSRU0ceNf3e2DgnF6ekRaYoeJj
 Y6kXp1dYuMSfSbKItjcDVn6DhWWceN16w8zDTgqLto6pjjdUu4FvNsE/a9MWTHUxbwX0
 ZQqYq/qNPdYZhHXR7zbR1rswcF5HbklsxRttMjPl7hx4VguDLwBCxNKEEo09r8UO0gUg
 CjGq+b/c1F6WElfUrjG1GDqBxxgoIx1mAkbySeWANEFikMHMI6hQnlxZf7i3OH7lrXbm
 dzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725221520; x=1725826320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WK7eqKzfxTCXYjY4yBuvM5uGMWIrx3TALuq0TWoNpjA=;
 b=gULYS7aAN1fLMTn7f3X1OoRnjQwh98JumhRxw2PoP4/4pQEbonI3+xTRFFJhFukCho
 /QGQL3mZBD080SjcXTX9HO3fWIgAYG1hzse//n4fkoauD+17HLjUesw6MAmfDY+zY27M
 vW4G8MT3Iqgtj0ctWb+gwQFZhhuPMENVshOW1WO0ZfvPn0bwWSHAkGwcJE28NVk37Dy9
 QIJIjCGCk0HgTkzVZQMimmVKUd6YGFwVLJALn0pWL8RP3vsqV6eb9MOSJTfNvsPdqmFd
 rQysDqRg/oWNKmWtWd7h9yrPhJDwHXnwHcwd7KH3/iIJ49/azKJX7exLrktwHSkcNNyl
 8gRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKi8ydH9bQsVsdLglv/5wPBkMcIUnmYD4gwNtZxcysAeImThyYivFsWGiLBiTAS1Qkg8+GPfn0b6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymHLi1ApgU0pTUIlQcXvVN6NlGaPoDyw3CUxegMkCjGyli+pXJ
 GHaOKeOFW0fOAl1EMQYUgG9O3TKX0JOFPkQ1hann99w4u2ozizno
X-Google-Smtp-Source: AGHT+IEO7V3UByUuTsWsUXgVd2L9NR39/cVWR3S7jRsH5UcHElVvVEfREF9DhFgBb6fbyyO2/ndK9w==
X-Received: by 2002:a05:6830:6d08:b0:70a:988a:b5fd with SMTP id
 46e09a7af769-70f5c406907mr17173440a34.24.1725221520359; 
 Sun, 01 Sep 2024 13:12:00 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c340bfa823sm35926966d6.7.2024.09.01.13.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 13:11:59 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: christophe.jaillet@wanadoo.fr,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Sun,  1 Sep 2024 16:10:49 -0400
Message-ID: <20240901201118.3179206-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901201118.3179206-1-lanzano.alex@gmail.com>
References: <20240901201118.3179206-1-lanzano.alex@gmail.com>
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
2.46.0

