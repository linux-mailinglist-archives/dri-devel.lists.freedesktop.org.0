Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E864BD18521
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 12:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4881D10E32A;
	Tue, 13 Jan 2026 11:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="epHvlz1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF26D10E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:05:12 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-29f2676bb21so63462685ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 03:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768302312; x=1768907112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4hgjP3w88kDagdzWx8wSWq+XQR1e0+zfKSduukvDaU=;
 b=epHvlz1GABCPbKcnrfyHxiu5K4ePJwFi6hrvyaG2OrtyPYjjGHPniLis//nEpxCxWC
 LeJPifl2/G9LQq3H6xu8Ob7waYDO7PL5xrMih+xe2kyLaAw8oVtPrWmBa9U/8JfIZAN3
 rxkgl9vRe7xACz379xknnQcx3AQuerSDkK38vr36/dZp7LuZPCuZWibQFCbbtnJ6NupF
 5RrGpbXJ9h4eUj6YeGpApHvbTw8BSbT7HX+8fo2XOPWaCOxEEThN71MVgLG5qpFK6LQb
 m6ByuFjfXe6sKfF8RX9n4omRDx3xgBLm02OCAISJ0rWdqXSYtVM+ILAgZme7dnmZmZ58
 ePlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768302312; x=1768907112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d4hgjP3w88kDagdzWx8wSWq+XQR1e0+zfKSduukvDaU=;
 b=t3NfHVfYYup537kZWDzhadLq7VJ59pz9mhxFKSmuqH0VUWnkvHLeguhvqnpUl7nnio
 LHfTXczkBwrqExprAr/33+R9rIkAot6qPfqGLqOrtHB/hCTvqVWV2gMqjBja42Iy+TSe
 ax8OFqXLzYW7AATzB6+OFLtoyf25TIsVKITsk4T7vaNnqk1iNCrBB6s1WJ6YOSbpr+kN
 H8qIWg1isNaVivUZWbWW/C7rVkOZItDJgWd/CiR/uYXYzxxeSI7hmNawegl/aROXg+1V
 oEugCVeWs9prZ/yd3MyXNIinuahaqkBXNjx8etQ0jegVVmKxx6Yx1jRg1lwFB244Gh8m
 zmHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgtwZCZ71Hl4QKh8zrhV7qi8EJGa7f8YkjZNmnJss/2zBH8v3HsUE1vkyirFQDa62uzwYUoCGrEgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzZkCsPx+GxYJfLULsZGFoe5XGXCj9mD7ftGFKwH2nXuaK1Qow
 B6L9nVqnzyPIKi+SO/Wt+mTG+7Xswddksr0+awa7Rj7sSdW+ywFczC9J/fEdmQ==
X-Gm-Gg: AY/fxX5+0ADPE2kkdj5E53cvBesTN4miR+kQIR8j3BmEFOMYKHJ+g6d/PJTjggE05t1
 QcHrdY4+9T9u9K9AV34GbYN0TFggaWTQffTrwyaNOmR7ySmHCbUfUK44+JcT/yxv+Yh+QqujtSQ
 cInqJN73yCtM9oe/C4oA3XiM0T7uHbHcYtXIUaLz65EFPKSHAEysNLxvrJGEI3P5gXYiFWtMD08
 ybyhZ2HX85mJWc7hi1klai4g1UEatiF4vvIRfJg0aqbseEhXDR+36rBVb7nA8z2bhvGMTXv/AEg
 pVhG3KeeWS+CnAzQZbVTAt10vFd/4qRelWjJ0XTvwt22XH0YzSTjxieaKJFBSryrU05dRrQpKLF
 Mg6dCN4mnE7K91K4+NLyIOFcA4IsfOvFRI8TNNfx1pH8l7mXGt9e/zz6ve8XFR2HLNM/kSWS92t
 dbOZHt2V9aK80QhcFMPG7zhpVF1Rttoawgg3YNFo9pTBP6cmFS/EsS7aR9dzyy5cbuzwmY6uabs
 hTY6lR6eJK9FlCxt0y+8g==
X-Google-Smtp-Source: AGHT+IERyXXRObriIfp3G5vGgqAQ938C3mDCOXYLyt4LrW1z/WW3eq0L+wGB0uC11elqp7ivzib0lQ==
X-Received: by 2002:a17:90b:38c4:b0:340:fb6a:cb4c with SMTP id
 98e67ed59e1d1-34f68d231bamr19378825a91.30.1768296384398; 
 Tue, 13 Jan 2026 01:26:24 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:24 -0800 (PST)
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
 linux-sound@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/6] dt-bindings: serial: google,
 goldfish-tty: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:57 +0000
Message-ID: <20260113092602.3197681-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113092602.3197681-1-visitorckw@gmail.com>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v4:
- Use decimal format for interrupts in the example.

 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/tty.txt b/Documentation/devicetree/bindings/goldfish/tty.txt
deleted file mode 100644
index 82648278da77..000000000000
--- a/Documentation/devicetree/bindings/goldfish/tty.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish TTY
-
-Android goldfish tty device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-tty" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_tty@1f004000 {
-		compatible = "google,goldfish-tty";
-		reg = <0x1f004000 0x1000>;
-		interrupts = <0xc>;
-	};
diff --git a/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
new file mode 100644
index 000000000000..0626ce58740c
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/google,goldfish-tty.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Goldfish TTY
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+description:
+  Android goldfish TTY device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-tty
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
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

