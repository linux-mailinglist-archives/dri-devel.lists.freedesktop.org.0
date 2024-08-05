Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA49485B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 00:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172710E2DA;
	Mon,  5 Aug 2024 22:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W8XKW+eA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64BC10E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 22:59:13 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-492a76c0cfbso3111980137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 15:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722898752; x=1723503552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TlDE69PdaRI6NEvJJ9HZjIBwXM2vSCyzFfsf9EOO6M=;
 b=W8XKW+eAd15RXHc6hKvSijTclptPyrcQPrkLR+RRwq1zX/OyNtbe9eRGRVR7vOJ2UO
 k9i0bdFXbmQetXfuzGJBIDnsmHc7h8ci52rLxveg+yKGi3txgVeZqSFtpUG40hmZNSBu
 /w+2pKMt8uJEiC/BuA+9s1WRKXyyAymHHRQh+tQZ8pYim2vTn5V9BHwm1PEinfcL5PZW
 Xf2n5HSD7C2ZRqStpDiUc6pukNyRHz9kvb/Ge4MXwOt0n2nNjoUER0tjfKYqp7KwOczg
 PsSYaTM3b9SY4UFDm/BHoR0ZvKBsM79U/b8JM1MIR769ZTiqHFk+1Z6n5A3TaGxq7kbG
 X/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722898752; x=1723503552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TlDE69PdaRI6NEvJJ9HZjIBwXM2vSCyzFfsf9EOO6M=;
 b=sCXeZInm93jGB6nRB6+SVz7OdzDTlPK5V1G0hvf0T8vXbUcalVB2MAf3Grh9mN7KLK
 ihWa67xNUZWTPqbsPQOis4fI1ZKT+Tat9FRbJVNH18tzqPqNyYhWVlTce/U9QUADMJfl
 ZmERw3eDHyR0AKfD/3AoKMg2Ljl+dTXwPA8TaEE3plN9Ieg5LKO06j3qxlA0n7dGSykc
 sAD0nX7ZIzn8MvnjgsQc2wBZ15cxilsumtnTb/IfUqWwFoWaxxPLCQjPcvUZwoNDlSB9
 EYB24YVlTWLBZynbYox4DhXgUgmgS6+K/Bhce/3wVB0VBGeV1LJ/s/tvPquDOTBqjCrj
 1YbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEngeSgdLxdE9U9+tfXr+5J9fBff8hf052XTsG4bb7ffDhH+LqYJL6WhBOnbYBLeo/PW1PvfOOJqfOv5s6Pe65W3KqUYnQyDzValKuYPdp
X-Gm-Message-State: AOJu0YyvzMXEDyFXirw3o2+18iD4t9WgrRpjgio9rNPyXRYDmBda/zus
 jUn83jlan2DAtnIVLkOizPrMY1/7MhFUTst8lFHFoQIJuD0eI9vJ
X-Google-Smtp-Source: AGHT+IHuERLfmRU7rMI8BL/GbgSv3C62jjEP5fbGFQYAwBahNGlVXSPsRdJeVCp6pp1tl9h+Bkso+Q==
X-Received: by 2002:a05:6102:e0e:b0:492:9c32:5344 with SMTP id
 ada2fe7eead31-4945be19768mr17714227137.18.1722898752357; 
 Mon, 05 Aug 2024 15:59:12 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c78ad54sm40028016d6.31.2024.08.05.15.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 15:59:11 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: christophe.jaillet@wanadoo.fr, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Mon,  5 Aug 2024 18:57:50 -0400
Message-ID: <20240805225820.13798-3-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805225820.13798-2-lanzano.alex@gmail.com>
References: <20240805225820.13798-2-lanzano.alex@gmail.com>
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

