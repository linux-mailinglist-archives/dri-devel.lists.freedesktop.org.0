Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759AF9576D5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 23:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC03810E056;
	Mon, 19 Aug 2024 21:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kR+y5v4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32F010E056
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 21:50:32 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-44ff7cc5432so37397721cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724104231; x=1724709031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TlDE69PdaRI6NEvJJ9HZjIBwXM2vSCyzFfsf9EOO6M=;
 b=kR+y5v4Y4JfFs2IVVdO1BchTyTouFclYWi34YrPUmRgA25gQut1mXW2bTPpxfPPA0j
 ubf+idOdHZxj37jE+0+BkiEvPCqfnCmbi2NztZed5QQJcyJrlPp9/KLWwwX6kNfyfWEp
 pniHujk20V7OYL3CnhK0p8eSvstd0fEqp5+a6t7DA3lzfn/h2l0cR2k2I4iBEwQN3I3T
 +Hm6I6GelhANU0jR0+kwEXXq4SYIcvBP2uT/ltF8noJVMJApUYxx62S2wTDKw6bEwB8G
 g1af4/zj0AoVMWFpxikk96q4E7KplDZ+4H29sgrD7WwlVVu1JfUmgon/gUGY9JqLERnz
 sGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724104231; x=1724709031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TlDE69PdaRI6NEvJJ9HZjIBwXM2vSCyzFfsf9EOO6M=;
 b=rVSDHQpaEUi1JaQHfSO/9XY1vDVxXc8iRJ8iwFuhN/q36il1GGB6Gp8eEsCcbFgVOW
 Ju+XEFKy8a/hb+ijqLfHw0dpmivjT51MmgYVeUD4XzOB3RVug2f9nFPg88bniIFB9SPZ
 lc549+1WRbC4dVshEuxWQWbQWWTtMPfF4JCqXVkw+5P8X6LoJrF+/pUTjyjanHHClsTM
 UL9X2DhJvq2eBjAfeG6c5ymsHFWnQJ6LQAtk3NyzpyOQOaup4S9dwSLDXdS+9B6lc/Yt
 TIE64GZQjLRO1eXlHyXUl+J5ai7jpFjRrsx+xZAaQ1TIOW1sRpxf5q7iayDduadnl1/Y
 aKWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkdBOLQufjU8Xx/c0Aer6BoUTUmoA5tIQ8sINK4WhX0PNR7yZHmH6J4XmSlmrzu+b2UkPOKnv7fhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjg7qJ89uLxH8RK8m45jiwghyK1ujTg2Kubp+UNP8qswqoz3QV
 wl2rNyNfnZWGRLlzAbl+DtFTUHkMtCB/ii2Xv6YahtTxBMZTQogK
X-Google-Smtp-Source: AGHT+IF6hQkzKGEVguizB2ir6vco/5XQNO5iNu2WFO0gqnzobzfo2UQ+E8rKz1lTljZcmKX1+FvUzg==
X-Received: by 2002:a05:622a:2b44:b0:447:ef39:7188 with SMTP id
 d75a77b69052e-45374247650mr159918511cf.15.1724104231325; 
 Mon, 19 Aug 2024 14:50:31 -0700 (PDT)
Received: from localhost.localdomain (23.sub-174-193-28.myvzw.com.
 [174.193.28.23]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454e5b2b0dfsm2432741cf.53.2024.08.19.14.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 14:50:30 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: christophe.jaillet@wanadoo.fr, Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v4 1/2] dt-bindings: display: Add Sharp Memory LCD
 bindings
Date: Mon, 19 Aug 2024 17:49:00 -0400
Message-ID: <20240819214943.1610691-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819214943.1610691-1-lanzano.alex@gmail.com>
References: <20240819214943.1610691-1-lanzano.alex@gmail.com>
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
2.45.2

