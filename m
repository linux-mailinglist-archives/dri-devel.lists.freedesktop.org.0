Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D632C97B9C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 11:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4805E10E56F;
	Wed, 18 Sep 2024 09:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wz1r3XSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5C710E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 09:03:17 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20551eeba95so49442275ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726650197; x=1727254997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
 b=Wz1r3XSCTU5SwCjONQp1iEaicTVvD0bvnnHPHCHR13Cb6cxVi2jfenZ05FZ0hF3XeC
 gdx5WpqtY583iwHwrozlVynVr8gEqdRajeYdEYfuyQz9bln+0bAAWzryjfj7dUUtSFVi
 avZDJJk9GSaPHA2ti87eSCvMkIvFqOcrEHEdRgrmOwlnVrEJ+RVxYabTf3Q2jccY1zpk
 zm/l9u1FfgA9ZvKcFQ+T+01SuZA+/4JxzrEQoEYT56bpvt5abQ6ox3r9ThHDSR2BfyLL
 w7XvHIlS3Ot1KoTQpt+mv9aNkJswWQBFOk2Eqb0/lVqHae142iuEULbGNgeuyoTNTBSv
 O16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726650197; x=1727254997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
 b=LZIfX680Rjn3a+n83j9i/qaciNzhbD0KCZpvn2eI8TYXmVnP/U3ZhlCk322Xk15AJT
 6Jza5pbKEeUG1leDDEs0zH5HVUgCqTAZSIo0Uft+H1nMzG3l5C68A1JyWpdspa98Vh8B
 oXqyaMZv+mz6csu98nHJT0TVAvZbYR+TdFMeIUtEPl9WFGHd65bChb7ek8C5V1duLC7W
 navghGaM2tNe2BOC6nkP2ipt39xZ4AXvuDnEsQrsEFQLsntk79UnoocnIUn4sEGa5Agm
 ZqswCFF3+AzM3d33pgpOPG0rHQv9KEM5C60OcgfMFBk6Qbp5GTh8j68QmRQb2b1P9/rd
 60jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVzXmjR9sZnoIDRDBaxGahDJCR6DwbdVcPmhwwtDSY2G2xWz2n0VCdh4V+sCXnqsBgADUMdrFDUBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWiOVreNcvlO7rNbfi+Uqtg2PDLwB5mm1EgCCx8L2KgJv5wfCM
 nxjFpPj+TAC1/Vh0Cjt9p4KXc03ko220zJQbrJnvSy94UEuNtzLS
X-Google-Smtp-Source: AGHT+IEu2ExwD56L0eMxFaxhnTGWr5C0LOkIV1Cbr4483wISjxblVpLqyl0/2mVScIM1AHAa8dS/2Q==
X-Received: by 2002:a17:902:e852:b0:203:a14d:ed0 with SMTP id
 d9443c01a7336-20781b42d61mr326944145ad.11.1726650196885; 
 Wed, 18 Sep 2024 02:03:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946010f9sm61021875ad.84.2024.09.18.02.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:03:16 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: mtd: nuvoton,
 ma35d1-nand: add new bindings
Date: Wed, 18 Sep 2024 09:03:07 +0000
Message-Id: <20240918090308.292617-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918090308.292617-1-hpchen0nvt@gmail.com>
References: <20240918090308.292617-1-hpchen0nvt@gmail.com>
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

Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.

Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..a8a549644c98
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-nand-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+    required:
+      - nand-ecc-step-size
+      - nand-ecc-strength
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        nand-controller@401A0000 {
+            compatible = "nuvoton,ma35d1-nand-controller";
+            reg = <0x0 0x401A0000 0x0 0x1000>;
+            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk NAND_GATE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            nand@0 {
+                reg = <0>;
+
+                nand-on-flash-bbt;
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    uboot@0 {
+                        label = "nand-uboot";
+                        read-only;
+                        reg = <0x0 0x300000>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

