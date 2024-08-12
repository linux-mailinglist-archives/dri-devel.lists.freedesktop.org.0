Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100394E7BF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EFD10E119;
	Mon, 12 Aug 2024 07:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JqYTDbhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254F610E088
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 03:00:54 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1ff4fa918afso21969705ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 20:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723431654; x=1724036454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IopTiHG0CBw96zUreHMxRe7sxGZ9Qm/2aKgJL9eEcvc=;
 b=JqYTDbhvpccVLfG3eC6IpGc5Ecohai+MgPyOiozVGPS8Z2+jw7htcwxfhm+KYiUgFg
 K9xgKgQXTsBcbinwbdpOztyEk/E/u5cUHTf7yhE3njMlsbRqCU5Qjf/Z4qL3phiY5Hf1
 2FKhu19mjC4wA7yFYIXgAPoMG3pDBAJ+EIiQ7YqeR4KgGmIaCF0KeqiJugnCLZ7vn+HF
 y3Pl5WxOr4VDtY0g++cHqXcwQ1aSH5+0xMWh7nozu3L9vIAa1E43sVaa/2eQvQmLuG+h
 NcFrVps3DOS6GlvxY+O1hgbDPUYnYFEgnLGr8oMeaq1vV35Yn/hSqwmcEo+23159uvnP
 GA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723431654; x=1724036454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IopTiHG0CBw96zUreHMxRe7sxGZ9Qm/2aKgJL9eEcvc=;
 b=cwRsW4gTTZParyCEDN17toDBIkhLn+mwa/UqNm6Y9G4QEOA3+DaNIZw17DmCNsYHNx
 /Q8wIPrem8oHPxcGBcbpIkLenN9P5LO+rWMF7PdFNUQN5IhjDgM2MP8cWRTmssBm4SaY
 2xAfP4lTeT6YO2yMhLq205TXDE3MSUshNqH3QiGsgMAKHRniagHMcYZuVk90hhIm9Cgm
 Q1CYCJ59EjSE+ZFdG8nRQjgb+Q5S21YF72iY6yUy5io7sMRtwRLYN0kjdRUj/YjyH0OF
 Ze28ZBra6qJJRgBCDSwQF+GHSN9I90ZKLQgRKz7X36U+2VPCiv+DMp5soCaqBPWpXEYf
 BNOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxCMl14uP8CY8V0CSEsEpA7qzQ0jU2s2l3fb6+ipjVdSktak5/UlSc6mpvEKGOnnyVQVGrJIeGGMH7pPn2B4oxB5dyRq7cdVUTDBCuRY3T
X-Gm-Message-State: AOJu0YzMKpfvVfnoEX3zYAn3hKfClblPpXLrgkHcsJsgfDnEvkjHO/+h
 yz1yvgcv7tMfOgBSkQ9mjDpLYCYgI8cLznhQ+1ZzSgAXCT7pUiub
X-Google-Smtp-Source: AGHT+IHJXWDmzGqQsCRWNZAXXOnmTHQ9pzhPsPckKmhtROKYEm/n1QxQPzP20fncSjqFX5lD8dFJDA==
X-Received: by 2002:a17:902:ec91:b0:1fb:7b96:8467 with SMTP id
 d9443c01a7336-200ae624582mr56725935ad.63.1723431653571; 
 Sun, 11 Aug 2024 20:00:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bba00f73sm28047105ad.201.2024.08.11.20.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 20:00:53 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Mon, 12 Aug 2024 03:00:44 +0000
Message-Id: <20240812030045.20831-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812030045.20831-1-hpchen0nvt@gmail.com>
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Aug 2024 07:27:30 +0000
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
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..988c43bc6e99
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
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
+    minItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-mode:
+        const: hw
+
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+      nand-bus-width:
+        const: 8
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
+                nand-ecc-mode = "hw";
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+                nand-bus-width = <8>;
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

