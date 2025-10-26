Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77DC0A751
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 13:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3AE10E2C9;
	Sun, 26 Oct 2025 12:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbgBU5EY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB29310E2C9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 12:39:36 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-26a0a694ea8so26455925ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761482376; x=1762087176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieZihMLOOLBctZi12lxn8LR/iyKa5pG/boJ+0OiRR90=;
 b=gbgBU5EYMeyv1iTP8vdnbQMVZrytfo9hLojhnwwIOI2JSRvpJK+MkWSIXGlhNrGbSP
 BmB8meY0jwh/GyNPp7cXeuOer8MMpN5Z/DN57CvZF/rOHLuyrV7Ai36OIxlhFf0864k+
 NX4cmSfPr9C/zKiKVq/E5+VY9VVsT+4v3emRTWcAVoCqZJ3ooM8EBa2K7LHnjSgYuD5c
 YM4zsofZrMNmcQ86QrL8MeILAIONMnc2pBVu5Q5hgdJXFQN4Fg8o4UCy/kh5gelgYvxF
 ITThTXcFZb9PE1mHfdo5huuKXQmUYQvGa6A5HIagf1VmYI8U2uXHLxbOPK+mwXv1zFcj
 1OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761482376; x=1762087176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieZihMLOOLBctZi12lxn8LR/iyKa5pG/boJ+0OiRR90=;
 b=otXv2pi9Oeo77r9MAoO0tl3ubpEatEr2nUdfURCEmBBaGYkxm/RxfFonROwbkgrx86
 LiLgfj20sNkaWiiOySr68FTn6aBnUW83x2qfnuByD1UuDTtKJd8OhV9Jvr3Qh2zsbcln
 /M2lcpRjEBSYdTkNTXpI3DUR3zEE704d4wBDAN6k8wQiQSDvzf9muU4LIWzE5Ccl1Tu7
 0MIa1sQyhA7A85FAjrSp8NDz8B+P0wqsnWtbmlb7EhpW/Cb9fYoESb/pvhxyQVPVSjdt
 7dHOquGgFkAzGaG00Cmu8I9oAPgAbG7egpqtP4GsDWBbDSxq2fuNYNecVcimzD2mFovk
 fNag==
X-Gm-Message-State: AOJu0Yw4UqM0xeQqDjNLrv4/u4mB+HYKqGQvd0M8t2jPLJ6yTZVWGmlr
 ZyrIK1me+0EyKsCBJ4IfXmTibQql37wnt0fasBFYt9oOC32Sh1Fwt3rP
X-Gm-Gg: ASbGnctfe1SWaWsZfuyi7qgarKAspaafvhxqSQjjWQqkSkNFk0E2sPMbmGJUAqPrrbY
 B7f2nih63OUzHwH0dgUe06AYSl9d4Auw/OOpgVfJiXKJq6tidvr9KFiPto3WIUhPtpW5GtZOVy7
 0RecmBrE44xBBuaWsRQvpE5ggbKsr+IhdkZDdQnjCzU4wnOryWHLYfw/ow32ZOQ0VdWh6IlSD4J
 zijEKK/pjKPqlywKwnFw/FBFfMV1M+Gq42gTfs1Ir1682hjXioq4YserRBbtV3bAzIJlKNMtGvR
 81G5TIFMoNagxyDBbXBTpm5z9aK7Pig/sfWUEfY05FjXyAYRLThTwpoaXYQqusO0XpDuMLnLDts
 C5fZ8HRrVTovH2E5989Lz3qP0GMKnsWRra+k1PpRouR8LtTaSiECOXi0N6ykIyQI2iP8rqlT/Uj
 siamJxGlXN7VUoXc3dhw==
X-Google-Smtp-Source: AGHT+IHGs4DwXfP6nWqnbQ+7R8SWiz+qxqpgqaWLkFf+omIN7sI48ep3gWUkRscpSyoQrMau23dXqg==
X-Received: by 2002:a17:903:19cb:b0:24c:7b94:2f87 with SMTP id
 d9443c01a7336-290c9ca6707mr410391015ad.14.1761482376103; 
 Sun, 26 Oct 2025 05:39:36 -0700 (PDT)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed7d2869sm5119634a91.7.2025.10.26.05.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 05:39:35 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99706 backlight
Date: Sun, 26 Oct 2025 20:39:22 +0800
Message-ID: <20251026123923.1531727-2-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026123923.1531727-1-caojunjie650@gmail.com>
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
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

Add Awinic AW99706 backlight binding documentation.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 .../leds/backlight/awinic,aw99706.yaml        | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
new file mode 100644
index 000000000..640af3891
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/awinic,aw99706.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW99706 6-channel WLED Backlight Driver
+
+maintainers:
+  - Junjie Cao <caojunjie650@gmail.com>
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw99706
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO to use to enable/disable the backlight (HWEN pin).
+    maxItems: 1
+
+  awinic,dim-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select dimming mode of the device.
+        0 = Bypass mode.
+        1 = DC mode.
+        2 = MIX mode.
+        3 = MIX-26k.
+    enum: [0, 1, 2, 3]
+    default: 1
+
+  awinic,sw-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Boost switching frequency in kHz.
+    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500, 1700]
+    default: 750
+
+  awinic,sw-ilmt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Switching current limitation in mA.
+    enum: [1500, 2000, 2500, 3000]
+    default: 3000
+
+  awinic,iled-max:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Maximum LED current setting in uA.
+    minimum: 5000
+    maximum: 50000
+    multipleOf: 500
+    default: 20000
+
+  awinic,uvlo-thres:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: UVLO(Under Voltage Lock Out) in mV.
+    enum: [2200, 5000]
+    default: 2200
+
+  awinic,fade-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fade In/Out Time(per step) in us.
+    enum: [8, 16, 32, 64, 128, 256, 512, 1024]
+    default: 16
+
+  awinic,slope-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Slope time in ms.
+    enum: [8, 24, 48, 96, 200, 300, 400, 500]
+    default: 300
+
+  awinic,ramp-ctl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select ramp control and filter of the device.
+        0 = Fade in/fade out.
+        1 = Light filter.
+        2 = Medium filter.
+        3 = Heavy filter.
+    enum: [0, 1, 2, 3]
+    default: 2
+
+  awinic,brt-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select brightness control of the device.
+        0 = PWM.
+        1 = IIC.
+        2 = IIC x PWM.
+        3 = IIC x PWM(P-ramp).
+    enum: [0, 1, 2, 3]
+    default: 1
+
+  awinic,onoff-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Turn on/off time(per step) in ns.
+    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]
+    default: 2000
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        aw99706@76 {
+            compatible = "awinic,aw99706";
+            reg = <0x76>;
+            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+            awinic,dim-mode = <1>;
+            awinic,sw-ilmt = <3000>;
+            awinic,sw-freq = <750>;
+            awinic,uvlo-thres = <2200>;
+            awinic,iled-max = <23500>;
+            awinic,ramp-ctl = <2>;
+            awinic,slope-time = <96>;
+            awinic,fade-time = <16>;
+            awinic,brt-mode = <1>;
+            awinic,onoff-time = <2000>;
+        };
+    };
+
+...
-- 
2.51.1.dirty

