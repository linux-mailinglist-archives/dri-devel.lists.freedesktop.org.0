Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46517956AC0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 14:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FD510E258;
	Mon, 19 Aug 2024 12:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="liB0SFzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DF710E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:20:46 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2d3b5f2f621so2786254a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724059245; x=1724664045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AaBJp5+G6SXtcyzXFl/UAnZKiPS+vvZQ0BE0rakJE8I=;
 b=liB0SFzENKd8UXCtRt0SzM5JCbTlIntyEYCpvYyHOkd2DAOBEakMcFTG5rnr9vWgcD
 iaKzzZNTxFVTRBT4OCwbojHNFcSIMf1hUT/RBnth3iFwIRngPOD9asLcbiD2LBjwF3iF
 yy81q5r0p+yPZaRsLWPsZA73dAxLEh7u6NMFBzqHJ73VDG+eVnLLFrFPLLsasZg/255O
 5KHhr+PPNwIAS+dENxtbsiFo9Tz4mtDU57pPTDiH1uuH6z5SzDjUdnFo03d4tEfSqVBr
 GOASbbWxl/ms+AgC49zld8PuaQq8N5o+J44/rD28ho/j6VzfZNhd2gjnB1kxuzEKG6kU
 LyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724059245; x=1724664045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AaBJp5+G6SXtcyzXFl/UAnZKiPS+vvZQ0BE0rakJE8I=;
 b=M5qd8lXfYmImjBA3ZU/A/hawG0ST8OGzenL1gOngeItI+w6RgtvGNxxLSbjztmlSYN
 kgk2z3qyTqTfFNGZ8nIPzZIVhwoMtB0zZFkVB35icJesGtHE087P44CClShcnpCEXAHW
 sbZrNp1oT8xJ4c/xgNUFmneNRrLY0dy2hD2CSJ+igT1ylq/QRcn5hFkPzRamKk3eaFyU
 HMc1fgca9TqWAApupJq5uTf/5gQyuLIoeEJZmTGJ9QuRlGY0BVWGER3flLgRf4UmIZcg
 rZpngza48GwXGf/wS41YDDuK+Zot94An4oxmcXMxrHV33/SN95eC1xUtloBkPO9Bm8UT
 s1uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT5MHUeccu4PdTz6jiTdrO/gJjN6qJ9ObJ+xjwUnTbHrbkAwofEr2bb+B/4B5CzJIdwEeZhx1BmXE+RUuZx6dJ/yZaisJCJsTfKwwfgKez
X-Gm-Message-State: AOJu0YycJm9bw6AshBKcqt+MB2JUeVRzsGV2ioF6bfsUSOjR5kCdlpdc
 /J5xlSMj9HywGrD5YkqydZE9mRz33/JTckvuLUP55fz0Gt7+r8AA
X-Google-Smtp-Source: AGHT+IHESEJRgz5RoQr1+r21WRfRS+k4DQCryYbOXrq0aw27QQIg2rn+BwxFAbdSNek3DCdLjPOUiQ==
X-Received: by 2002:a17:90a:9a92:b0:2c9:3370:56e3 with SMTP id
 98e67ed59e1d1-2d3e00f10dcmr9119583a91.34.1724059245460; 
 Mon, 19 Aug 2024 02:20:45 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e3d97f2asm6750538a91.53.2024.08.19.02.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 02:20:45 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mtd: nuvoton,
 ma35d1-nand: add new bindings
Date: Mon, 19 Aug 2024 09:20:36 +0000
Message-Id: <20240819092037.110260-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092037.110260-1-hpchen0nvt@gmail.com>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Aug 2024 12:25:04 +0000
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

