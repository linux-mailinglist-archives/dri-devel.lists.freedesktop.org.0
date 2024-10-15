Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4499D99FC0C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 01:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF67610E61C;
	Tue, 15 Oct 2024 23:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZB7Bb81G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7A810E61C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 23:06:44 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4603aced3a5so46089741cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 16:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729033604; x=1729638404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTpekSolQ0QOAMmLRMno5XrkJiMfliV9lomxb+U4KBw=;
 b=ZB7Bb81GUGtn09Zl0rI9cZZxqTGwY80oobdWK0h/H091rcyL+r6XZuQebBP0ukh5bd
 9R12PST3EedZuSj0Ow2VMVfEzVkesl1g45Kv+drGz46f2VuBsJBk/3cD/Entk4qAa7Ta
 zyWewmwfAqSjUR2V6hJ4R+P0kdmrH6dsOiGu0NP0Df1exXQm12zH3GJBULcz7yWIQWRo
 2ft+buERUJ8nEO6whH/N3gU01YYpnIfbIOh32DxF09UYJkJdt1MKfsaevum9BXjtfY8+
 UYcC1kcATo7Jxqa1vl3uJ3sEh7JZYcn0dHW52yHFRdbk6u3t+qDVSjeWOwRF1Y5w0edu
 +B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729033604; x=1729638404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTpekSolQ0QOAMmLRMno5XrkJiMfliV9lomxb+U4KBw=;
 b=wwIUR6QqFieEw+b2r7mOMAQqrQjxKxjR8NHVlO6d/un6hllDcRV8sSFUXYgn84TPxJ
 Nxx3gX3Pxr/rRnivopKKI3HtVIP6bc+mU6JQEqrBd4QKLU0PpAXkl5JzEQav0jBc+/w6
 /M2LRWG6I+Mdx75NaFvDQk0h4W2wCPjIQlCeIhI6FPD5i0v9LWfvT7lKxwnzf/H8/QLX
 m86XxPVhwr+eGWp3Tr0m1sh7KFpvjdjX0JKdEQmrF2qrki/DJnTBufv0Ij3VRnltiHfT
 4N4pNr8TnyvRtrxFABHIK4qP5v9MgH+Hp8sVPDP33cqZIeBF4h2j9WsKKowsuzbEYnDp
 u1OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbC9FpKu9LDeNVhKXeF2DbiWXaV0nTyzlpzSVNaJ7CWa3GZxbAmz9keuIqMYI/5lzd2GWKzc28574=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ/N4+2nW9QdkbrGh//OaoGNB49SJ1URyhU1B79dNUNiuDz/Me
 3g3GkZdCEBn7lLMIUAzFaBApr7+IKREOKy5CaTymEh3rrpA/lda9
X-Google-Smtp-Source: AGHT+IHPzYqu5XwFBi/nu3ChGqeZPQygQizItBlhpnbbYQNvBTfKgOhOL+OuWmTFzGpiU6LMHw68uw==
X-Received: by 2002:ac8:7d06:0:b0:45e:ff4c:6387 with SMTP id
 d75a77b69052e-4604bb94e9dmr204722401cf.12.1729033603675; 
 Tue, 15 Oct 2024 16:06:43 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4607b0e407esm11224641cf.27.2024.10.15.16.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 16:06:42 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Lechner <david@lechnology.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v11 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Tue, 15 Oct 2024 19:05:43 -0400
Message-ID: <20241015230617.3020230-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015230617.3020230-1-lanzano.alex@gmail.com>
References: <20241015230617.3020230-1-lanzano.alex@gmail.com>
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
2.47.0

