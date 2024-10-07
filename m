Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617599229C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 03:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14CA10E2D7;
	Mon,  7 Oct 2024 01:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bVJaFajJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B64B10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 01:31:19 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7a9b3cd75e5so414474585a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728264678; x=1728869478; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
 b=bVJaFajJ93az6UPPXuB6aaFvbxDyN3lNFsnZ/1xWUfj4nh3WMtySgklpTn9EDl22WA
 rlly25phxcB0fI6DYCOm6omUNw32td5d5tK36cesanjHYpIBsUUPgOO7Gc1cs42hL9ie
 SMuFbpT8q91VnREvXgvzOdbx7SA/Ti9b1dvplitH3hKjdWiFQiW58JHcSrHUa8CLXNxO
 eQP5UTOU+zWZs01bS0M76HvLQRxGzNPpC2LkKC/FWZfoUcJuM9L9Lq2b7Q8tEXE2musq
 /vQJY3aKYsm94FBOgigqot/xkehCcr/RD5tGfNTG2u/coZETeygXvmuWjGQI+T3JQ7dx
 KaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728264678; x=1728869478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
 b=RtPq/FhjWzcsbmDv3EuUbrIJXD/tFfBP6GeuHwhHPyW6+7VR+2qsGAeLZMLK7QSFX6
 CgTuJiQOI7yQKe3uYnmskkq1+mk3HW74TR4FpMw/+vg+qtEIkZfZTyQraKBPg62rzHpK
 /+zyA5mi+NQ2aVbrRuh28NGm+5qar6+EOqLZ8YMWmZ8ZB0B3v24C86o4xouZ8XRHMN53
 RHpo/H7bKmvqEPGnfiqL3ISTlmYY+JfUnJ34KDOdJk7CyPf+cp8Kf+quXHp8CsAlcHKy
 PYJmqKsbPa+XlkDYY55HZADcrEhUp7z46iaZUzX2VzwNxKCWtInX6ncd9cnteXjcBhWL
 jvhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7/kLL1DL0Tov6lsXJpIWH4VmyFgEchg7W3OTtERJ4/Io0tBKdBya5/5s/73r6y9r5J36g+jlSOiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFUS4uHDQijtDjTGrQoWm6BYI4NBeFiIE2NVFpH40TGcM96iT+
 eMC/XuB/7WRTuJtoYPY/pIcGQLcCDKPfbBBmt4Dnm5ukVemk2IBr
X-Google-Smtp-Source: AGHT+IHfkg0cGT4jshIHtr7s47CTUFILrvkTDKQ6NMGzBzbAdTlKcS6WdQJISVBiQ/o7R1qiaHbtgQ==
X-Received: by 2002:a05:620a:2413:b0:7a9:b605:f823 with SMTP id
 af79cd13be357-7ae6f4547b9mr1781299685a.37.1728264678271; 
 Sun, 06 Oct 2024 18:31:18 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae757627fdsm207326985a.100.2024.10.06.18.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 18:31:17 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Sun,  6 Oct 2024 21:30:05 -0400
Message-ID: <20241007013036.3104877-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007013036.3104877-1-lanzano.alex@gmail.com>
References: <20241007013036.3104877-1-lanzano.alex@gmail.com>
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

