Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE895956A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E0B10E58F;
	Wed, 21 Aug 2024 07:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KeUO0hJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06CB10E675
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 07:11:43 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3db130a872fso3938224b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 00:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724224303; x=1724829103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGa62lm+NpvJha+MuMU8KQrhYDpQR6aMS0ytEgFfvvk=;
 b=KeUO0hJ/LqJmHnVwRV70utWuSiCvEcU/KieXJ/Y0R11pgfHwpWW2gHGssXfKLYMiC2
 9mUr7sOBwDvuGu7cRsE/M/eENuAQRohPX0oXR11ylmOiuPyOnUbGH8IJIqr3n8WpzqUL
 POfx9m+eNWRJ0mATqP/E3MmKGVEfXYxIskM8uX3UKBuysQPHl5mVokXQcKDvx6xnTn8L
 5ayHQv50Lt2f0aGJydQjWVKuFxSooyFwJuN6gouMBsce8gOaqEko8qOXBj31DUbYlvQ1
 A2ZXS7R681dijK3dN0d82KbtqwPEI2hUzMVnQnTcgTocDiWnqz2POTFkKP6KlNnNkLrR
 fkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224303; x=1724829103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qGa62lm+NpvJha+MuMU8KQrhYDpQR6aMS0ytEgFfvvk=;
 b=ZJ5L4dnrLrAdyx64Z0uBk8vhhoi2rw3s2WMz6ApDnICiurUK4cwCY5EMrnvX0Xc3Cr
 9eYoJc2GH2t0CaJFMc3wvehIvI/7etXY7zHZ0z2JrnKEeVZnu8RlHKIX5w9CUKmedNTn
 69LLweMpkChhoWgcneawBgU9F96toYgp2ngVMWsGXwjoGqNXz3GDVZQaWSCZc4clLxoE
 RSaLI0xfKxIn+XW3Og9Ge7b11NAvVo6p6EIsjS4sDYRQa+9hX+ZIK6t8rTcgORMpjLe5
 sdztBcc1JPmjVyjxbaxLaQW6a7YLQnIPcV+Avo3Hr0nA+UOJZS4MMz1cfGUpZiyr2pgy
 qKvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoJvknDxCk3K/xoOcOpIfnULmcrvvIXMKOFaFkK8YEcWmqSFTdXOYK02NfsqAgMTnh0pO6lBfKGn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOFfaI7dl/JJqDkG1YPCRdQ59YJkvPsIQhPx4vUjkpDsTI4E6s
 VVG0RHMfoVmwoHSCVmzx6XOOZV8LAiXCfUiVVoYavf4Bc7Pv1Dof
X-Google-Smtp-Source: AGHT+IGo/iprfd3p83aO0Byo3qtSiIKa8o6rPt/g/EWYB/UqHNXIFdHP7tmeIc36eJgXrcnmuZxPFA==
X-Received: by 2002:a05:6808:2022:b0:3d5:64be:890c with SMTP id
 5614622812f47-3de194fd581mr1593407b6e.17.1724224302958; 
 Wed, 21 Aug 2024 00:11:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd8b631303sm526667a12.9.2024.08.21.00.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:11:42 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,
 ma35d1-nand: add new bindings
Date: Wed, 21 Aug 2024 07:11:31 +0000
Message-Id: <20240821071132.281018-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821071132.281018-1-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
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
index 000000000000..152784e73263
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
+      - nuvoton,ma35d1-nand
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
+            compatible = "nuvoton,ma35d1-nand";
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

