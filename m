Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F9BA2B23
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D3810E348;
	Fri, 26 Sep 2025 07:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="e00DFmur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7DC10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:58:24 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3ee1317b1f7so626220f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758808703;
 x=1759413503; darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mnVODjwy2deCiwdvb4Z2Vh0/TaoNB+VzQD5lG5PvCPU=;
 b=e00DFmuriYR7e+9UAMwPcSog+ykw5gK1VrnSjnAmcBNhd1W6rLZWzAZSc1FEqr5gfm
 yRUTS2sOr6YlrBmuCSz2d6kp1fUh68gRofuLT9U/rsi1A4A02atVgQYnLz8W7BNGOHPH
 WLC31wMxjpdQmiokBAf6JveTh/haMQeW7K/6+rrRe69n88w3q8GAbLLuuvmFdF3tJqw/
 R5mkBytkkRPM7rXITP5wc+Nd48Gj/i17KqeJ9cIhe4882fVxrmKv7JJBkYrBjl4dQL0r
 0jQn/dXgPgop0pilAOn4Su5RbH+bjyqSr/ei4qvb9/swqvy0c1Z3M6IZy/H65j70Rjpr
 ydTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808703; x=1759413503;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mnVODjwy2deCiwdvb4Z2Vh0/TaoNB+VzQD5lG5PvCPU=;
 b=bf3aSKBuwBg+bKpMs/gluXBYGVNAepJf7IZlH1J8BlZMW2ghZCRXrpiQ/EJAT5QKxP
 ZoVmXyPYPRGwYn6EGjJcTK7w/bGz4Q24sxm0XGWukI8WH5OEg/gkD4upJgYon0KS3YAT
 2/Im1fOymbySUPttB/xMtx18C0Fd0rDjVa70pDjfg5QVrEn9a6DLeu2AodUGUeOHeDJz
 Pp2sE+zm9FSDDRFPTSQQyEHbvilsMfBk2GGHWTp4HRvgUt7qGebaHENSov7j5oYvbpWU
 iqrhQDajR2N1gQ8ZGonrw1UlMTvbObGynQI9AK34+Vc8voFNUlx0iNoHM/xIzIUuE07P
 +UWA==
X-Gm-Message-State: AOJu0Yw9AtO/2Xv+f/E5UbrVatYwJ0cx9/IsW/GIxWdaCvRaW/SFwylv
 f1z4mXc8F3UAUGZPGNlKD7nblBaaRkP4wOfxIOlaAexNNGF69Ll6DXNYYW3Apa2dnjI=
X-Gm-Gg: ASbGncucJmaEDrbgv5VpTpx2bO6M32B+aY+knq9KoP8KaeuWvV0cEpI64ceT+AVYTsF
 +KUnDbyy99g2dlXm3iXQatKIQP0nkWhrLA1tMVWMrtr0ImWNvLsA5nsaNfvt/5l2LE+gWIDAoMM
 WYtpQkyulpeqDLrmVxHJtgfX7tea9uI/MSbXlrN+44gxkl7Uwfx67elcCKeMG1CGh8qTGb82wOa
 83+FieyYdxOCjlTJ2VbnIvVhHj4UgUVJq9nGHSgxdmAiYeTEb2CKtnE33/k2H2vCgJ5IZj4nMai
 QR+WoDJsmI5WThBRYzR0cZ+ZIIuja0h+oyeD1U6PyUdpJLcXB2qDot39W0CwZjbtcJSKZ9U7CNG
 DkGCWoIC3keKppFzWZlYsfT7adpRU9EP+HqOe
X-Google-Smtp-Source: AGHT+IEiZzJwcJ162vj4+aB6VkB7CNh+rB8ry4i+6DBqAlJmINd3CbS8/jzQreIiFEvTB6PQhCdeqA==
X-Received: by 2002:a5d:5d02:0:b0:3ec:1edb:97af with SMTP id
 ffacd0b85a97d-40e4b9455e8mr3471455f8f.34.1758808703141; 
 Thu, 25 Sep 2025 06:58:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:8a3e:8c00:a851:5f0e:8210:7d5d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-410f2007372sm2274749f8f.16.2025.09.25.06.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:58:22 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Date: Thu, 25 Sep 2025 14:57:58 +0100
Subject: [PATCH] dt-bindings: leds: arc,arc2c0608: Convert to DT Schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAGVK1WgC/x3MQQqAIBBA0avIrBPUCqqrRItJp5qNhRMRiHdPW
 r7F/xmEEpPApDIkelj4jBW2UeAPjDtpDtXgjOvNaK3G5G/2WjAGHdAPtCK2oXNQiyvRxu9/m5d
 SPsydUfhdAAAA
X-Change-ID: 20250911-arctic-sand-dac8ebaa3d42
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Dodge <bdodge@arcticsand.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758808702; l=5417;
 i=hcarter@thegoodpenguin.co.uk; s=20250904; h=from:subject:message-id;
 bh=GAZZENDznB+GquG1q9LwWecqHTx3QpoDJbBYfosmceU=;
 b=oZCM47CC6gnSLN2v+Rabs689Vz6eGpmlSKE5B6fKMR+keJNY6FqbyCrledpStrF9MxyxbNQrw
 IMYRul3m8u2Cj+ws8BRCsGqLGsNnKQ1U23CHn2omO+jVMVwhcJdYE2C
X-Developer-Key: i=hcarter@thegoodpenguin.co.uk; a=ed25519;
 pk=xn5ghTMMWQniDtZih4xwKCTAaBHDozflTmqNKtaKo6s=
X-Mailman-Approved-At: Fri, 26 Sep 2025 07:24:26 +0000
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

Convert the ArcticSand arc2c0608 LED driver to the dt-schema.

Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
---
Maintainer set to the author of the arcxcnn_bl.c file
---
 .../bindings/leds/backlight/arc,arc2c0608.yaml     | 108 +++++++++++++++++++++
 .../bindings/leds/backlight/arcxcnn_bl.txt         |  33 -------
 2 files changed, 108 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/arc,arc2c0608.yaml b/Documentation/devicetree/bindings/leds/backlight/arc,arc2c0608.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..786beced5590bb38b9c864111f7b66302d4c63ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/arc,arc2c0608.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/arc,arc2c0608.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ArcticSand arc2c0608 LED driver
+
+description: |
+  The ArcticSand arc2c0608 LED driver provides ultra
+  efficient notebook backlighting. Optional properties not
+  specified will default to values in IC EPROM.
+
+  Datasheet:
+  https://www.murata.com/-/media/webrenewal/products/power/power-semiconductor/overview/lineup/led-boost/arc2/arc2c0608.ashx.
+
+maintainers:
+  - Brian Dodge <bdodge@arcticsand.com>
+
+allOf:
+  - $ref: /schemas/leds/common.yaml
+
+properties:
+  compatible:
+    const: arc,arc2c0608
+
+  reg:
+    maxItems: 1
+
+  default-brightness:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 4095
+
+  led-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: List of enabled channels
+    items:
+      enum: [0, 1, 2, 3, 4, 5]
+    minItems: 1
+    uniqueItems: true
+
+  arc,led-config-0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fading speed (period between intensity
+      steps)
+
+  arc,led-config-1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: If set, sets ILED_CONFIG register. Used for
+      fine tuning the maximum LED current.
+
+  arc,dim-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: PWM mode frequency setting (bits [3:0] used)
+
+  arc,comp-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Setting for register CONFIG_COMP which
+      controls internal resitances, feed forward freqs,
+      and initial VOUT at startup. Consult the datasheet.
+
+  arc,filter-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RC and PWM Filter settings.
+      Bit Assignment
+      7654 3    2    1    0
+      xxxx RCF1 RCF0 PWM1 PWM0
+      RCF statuses        PWM Filter Statues
+      00 = OFF (default)  00 = OFF (default)
+      01 = LOW            01 = 2 STEPS
+      10 - MEDIUM         10 = 4 STEPS
+      11 = HIGH           11 = 8 STEPS
+
+  arc,trim-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Sets percentage increase of Maximum LED
+      Current.
+      0x00 = 0% increase.
+      0x20 = 20.2%.
+      0x3F = 41.5%
+
+  label: true
+
+  linux,default-trigger: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@30 {
+            compatible = "arc,arc2c0608";
+            reg = <0x30>;
+            default-brightness = <500>;
+            label = "lcd-backlight";
+            linux,default-trigger = "backlight";
+            led-sources = <0 1 2 5>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
deleted file mode 100644
index 230abdefd6e7be20b470c3790e74c4d26d084ee8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Binding for ArcticSand arc2c0608 LED driver
-
-Required properties:
-- compatible:		should be "arc,arc2c0608"
-- reg:			slave address
-
-Optional properties:
-- default-brightness:	brightness value on boot, value from: 0-4095
-- label:		The name of the backlight device
-			See Documentation/devicetree/bindings/leds/common.txt
-- led-sources:		List of enabled channels from 0 to 5.
-			See Documentation/devicetree/bindings/leds/common.txt
-
-- arc,led-config-0:	setting for register ILED_CONFIG_0
-- arc,led-config-1:	setting for register ILED_CONFIG_1
-- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
-- arc,comp-config:	setting for register CONFIG_COMP
-- arc,filter-config:	setting for register FILTER_CONFIG
-- arc,trim-config:	setting for register IMAXTUNE
-
-Note: Optional properties not specified will default to values in IC EPROM
-
-Example:
-
-arc2c0608@30 {
-	compatible = "arc,arc2c0608";
-	reg = <0x30>;
-	default-brightness = <500>;
-	label = "lcd-backlight";
-	linux,default-trigger = "backlight";
-	led-sources = <0 1 2 5>;
-};
-

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250911-arctic-sand-dac8ebaa3d42

Best regards,
-- 
Harrison Carter <hcarter@thegoodpenguin.co.uk>

