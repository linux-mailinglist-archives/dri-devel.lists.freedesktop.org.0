Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEFED0182B
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5448610E30D;
	Thu,  8 Jan 2026 08:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZKDwc4BJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72710E30D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:09:27 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso2192116b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767859767; x=1768464567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cM8S9Nf7P6gRpX7oKCBS4znehPOLHvbNE32ZCa5tCAA=;
 b=ZKDwc4BJXqURtU4JNhfTKo4iz18jGEeuWkfsnwtQMpOoavrBvwXzNgAMAxp6iAlALP
 yTUyXKTM9Gp1vpYqm7arlsn4Nj/PM7M4bJ0/dlFRA6bSn0WSote+3zP5uG/78TGywg1H
 tLYENByIFXhPZxjGt7EHj7VU57usOoPm5Yp0IzYqBMt1MOVC13f9nnbg3Rl2CZ7kUo/M
 hQJUiyOqSX9tLbfNpeAGol0iHPaLAnx6LYiKWLFfsIh0DUL/lwL+VkLmLhxW9soBWs7j
 bm2+cCNYKsP1GWqj2/psHY6NSettIzqO++hb104Niz+TJ/cK5Is2J3PH0cJah4rhZ2A/
 fydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767859767; x=1768464567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cM8S9Nf7P6gRpX7oKCBS4znehPOLHvbNE32ZCa5tCAA=;
 b=gaYe+zjrhAcIQ1ai9SHd9E6L/kTzbm8oOZ8xgzwUHtFUzYc995mgrWM+A8VkzIXgxQ
 rEPO1wOXUpHoiJaIvUrzbGhYGsKSICbkrklUYmICoN04gn/GDigbnNvr/+UVdSbuc61G
 6xmHoXILFl+LcmDNdY7IzuOW4WRLDJ1XXyLfqrQWgmBsiH/Ubw/sP/hh/nejrjZ1hzkd
 OO3j/JBZ5ugOOUbe0bF0I9HGdl2oz0a1BDRKKKicrfou4dBOXXu+sehWmVTOhRe6mZhD
 p8m3qD9Tt5leinjLYPtXeYcqWVrKo/MlIuYW2/bn3FQEN5d39T+3syScd8+yuZxUv9+G
 1ajQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK393vmDxYkiVE6X060Yy6r59ldeSmSAhvvaCWi3TEzzNryiiSArwlEMofafMlJZab4Ab0XhGqN1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz1hLsLgpM7BL8ApUHJfUVqAl3YhbGvsF1E3u9To/2MZBM9pzI
 70KLCtQdomzHjcKxMx3/N1bqlP5lCveGDrBO+dO9kGu+bboFiBomrOlU
X-Gm-Gg: AY/fxX4nQMvQP3qcjyfGBjLMEXXGy8Alkii/sUOAQXtZzz/C4gBKuhemYQJyC677YA6
 /0F+GhJ0ycL0m/918nPUH4lKYvEa57b5tTUKuREwVvoHERCgpbsFSzzXQKtZisFrdsNMeEg2drQ
 wx2ApNVVr7qef+sP1NlciiLRzFOQYUdGrpWNCOzokpOZe1M+AyNghCtc7JdiK68XIW/YKi47DTn
 91IrzGKtPsXtn2aaT5HEouyjT8x119XjUBcd67Gnv6lIqSW5NG7xWo8lGW1ztN8J3If35h23Qro
 g19hxVo4dZXCycvVIqLskqYtK+s55Xe5jGfStXKkU3Yuvnvlqj2aMDWNnSJZ1ovXv5EuSLQcwPn
 E5w/jSZAaAExMlOI8ElgQYLUVdLmiyX/1oAKws4hEwkkViA/1WTkRCo/1ygTT/yb9TWBrIDRays
 lS5ikHSIqHUeJrCz91TbL/y4OjIzRzLj3cEQJSPFVs3XAmZjuGKBlO+oqPLjalhQYLuTuhn9JS+
 eq0uGa2hCiysAAH4rJiSBWVbLXviMRt
X-Google-Smtp-Source: AGHT+IHkLLcdy5t5w8lcYwpa7aN5PM2YSQikFaFZHwIq35VG+97ooL0I8Sxc+NQu2jzK08rf+aGvdA==
X-Received: by 2002:a05:6a00:1f09:b0:781:16de:cc1a with SMTP id
 d2e1a72fcca58-81b806c7544mr4661904b3a.32.1767859766947; 
 Thu, 08 Jan 2026 00:09:26 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:26 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 4/6] dt-bindings: power: supply: google,
 goldfish-battery: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:34 +0000
Message-ID: <20260108080836.3777829-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260108080836.3777829-1-visitorckw@gmail.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to power-supply.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/battery.txt b/Documentation/devicetree/bindings/goldfish/battery.txt
deleted file mode 100644
index 4fb613933214..000000000000
--- a/Documentation/devicetree/bindings/goldfish/battery.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Battery
-
-Android goldfish battery device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-battery" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_battery@9020000 {
-		compatible = "google,goldfish-battery";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
new file mode 100644
index 000000000000..909252d91c16
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Battery
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+description:
+  Android goldfish battery device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-battery
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <0x3>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

