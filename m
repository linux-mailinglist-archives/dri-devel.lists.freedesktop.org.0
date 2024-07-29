Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D693EAA7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 03:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3E010E13F;
	Mon, 29 Jul 2024 01:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R7/Db3z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C44210E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 01:44:15 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7a1d024f775so186590085a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 18:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722217454; x=1722822254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfBdzHirvwzeGzsbgCKAQ58RGrXODzjEORPTNKuV9o4=;
 b=R7/Db3z265pr2UoNoaA3r/81MvR1aoHzflO0w+8XMsoC2rcaxaT6nPwY1l6zamk0O7
 QUUk0oyPsjD5HTl8ksigNQIU6PqS2htlZbFtytqcSupRaimZhlwU0svxwSp2QozYwIyj
 n2/fxQbcciEvR69sN4raUiWGWaQmuTTb85aVXdUozJF1Et9jrqeJnVznDixxwc/S9cLV
 ipHdYABJFA8B3BhhMNp7dZhLxqr20TKWnZkGSpCA6DNOkXoPpc2W5AIw3AEJlVJeeCEe
 veEBKSptlDoGSM7kiubjUoT4uukllw6nZgPQrhPNo+itHXKHtE64IHt54O763oynI4dg
 mKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722217454; x=1722822254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfBdzHirvwzeGzsbgCKAQ58RGrXODzjEORPTNKuV9o4=;
 b=MSjWR8Pd5lzWebsA6ccrtfE2UME8TSG+mzdyPDx/4+upuBCHGDDI/fjuBubl/a/Vf6
 m8ewbYHThly1NTxPaEiKgPfC3yJe54bPH8DnguBM/CLem8UfyTAirHFerr5BbaD2vQ2h
 q40BPXdrirUZ+LepadeTRRacsnhOYt2qEyNyXfcZF2mayX0Qhl5k8m9NKY4kXnH9ZAA5
 oI8AhAVM/st7Bg0tafE+koNue75dk1XMzz4UufBgSZt1xqH2PIoYqQupQ7Soqknkhc8v
 8cQ9m7TpiXoKdRhO6z73hnMRdwMtfF6/Y7wMtgKbZQzjSetid6G0wNbhuZ0Y3dOk75Gu
 a7CQ==
X-Gm-Message-State: AOJu0Ywb8INoZKb0IxfG9Ihh1/x+gdlNO46By4CEIoeJ1xIZ/ucupAqr
 GpoylkpfpgC3CNczciFBzp5xkRuxnZxXjF0IeK+xk9hBKhjU85rr
X-Google-Smtp-Source: AGHT+IHE+YFJJvmf6lPjsaiXU3M+j6OcZqwwlKCjIQ3Ft+bCYjRdz9W1xxCh0VvFj//pquV/o6nekQ==
X-Received: by 2002:a05:620a:4488:b0:79f:498:2a67 with SMTP id
 af79cd13be357-7a1e5247a0fmr926324285a.21.1722217453830; 
 Sun, 28 Jul 2024 18:44:13 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8199a6fsm37191171cf.58.2024.07.28.18.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 18:44:13 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: christophe.jaillet@wanadoo.fr, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Sun, 28 Jul 2024 21:42:41 -0400
Message-ID: <20240729014311.1746371-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729014311.1746371-1-lanzano.alex@gmail.com>
References: <20240729014311.1746371-1-lanzano.alex@gmail.com>
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
2.45.2

