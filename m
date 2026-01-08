Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46CD01E31
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39C10E6CB;
	Thu,  8 Jan 2026 09:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OMkj4Ckn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1B410E6CB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:43:13 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-8804f1bd6a7so26426156d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767865392; x=1768470192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNDmxXp+I2DQQMGpjKHJPmnR6bZXLNX2CabD4SmBa4E=;
 b=OMkj4CknVlXtqUuD9gqDxknODn46bPlCAuYn+Oo2TnMejGf6xfxiGl3KsHN8HX+MZB
 XjuxzqVDVaF+X1ez0X+evZBBlE1yIH/7gjF2qbvgCcIHXg5FCzcjR8WOYcB8njyfKpdg
 9OFZESauV7eViW+dCDcRpP72kHlqp9aEdywxh+6i7XI7dw6c83eFCCJXrqqHcHg5j8L/
 1BJE7g/1E/XslnFlAPs6iD/42YbdquJQ41h49r8EF/hiiLBcOOl3R4U0BXN1d/X7vNwA
 R/x2XfuZ8cQ8SbQ1lJgPEfTAYTIuKom7DpJn1VIkpsE9Hl5C8/ahmv4CKzIevX5RUcGw
 IsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767865392; x=1768470192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KNDmxXp+I2DQQMGpjKHJPmnR6bZXLNX2CabD4SmBa4E=;
 b=YyxFqSCiIAv+L4xJnrBlXNpCFrX6ZAj5YGRTuDa3DPiXrUks05VRGZECEhjeCP7A4y
 aiAsgoeXgFBpxA5huslS2NUEbxFj0ZgifPISsmcQgpGLnjxT8h2E2eFkLtnr7fCo9TkR
 kdMK0gbtmy3DeJQ2dy6ikOPCgPfakTu23s8g7LoU1fHesLGAwDZqi5vuU2Qa9GdW7A5p
 22JALwp6e7Iut7oKOGfrpI7uT/D4KnVIlrIEqYdWiFdZmT6cOXm2CE179DH12iHtziVj
 jFGUL62fI0JjwDN7k5WFzqxhb+eHBdjDF33m/yL0KsDelPi9rcBQNzayS6Djy9ZUq03S
 FyFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl4dvthbZj9YHyCAB4tu5cPLMjHbV6ps+njUytXLefOPrnD9AX0h7pPonqOty1+pj/KLr92+AhHPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmVY4bRhPN6QduX5R3ZQB4IcbgpjVJiCJJJ55DLik5T9bg49WH
 Bcj22hz0y2oEAL/XGFy1558xMJBUQaL6k8hIb2PLtfslGE5TmR9Y09ci3R3s3A==
X-Gm-Gg: AY/fxX4i35bWjXNoR/DqRJWX1dvmC72IasNijpvxlBtSHLgiu36+7btDeB+//Cxsz3m
 2wJFCfZhTmOfuzlpj+XU3cO7Df8oAoEdbdpZ3Egv0fMGVXVBmcj6jLdwXyTOtB2aALr3ya6O/3n
 5fubn9RQMW6ppP7VhId9vVaw3mmuPLNniNmofgQEM2cnayLbFWAVutxElyg5zM59H3/JZYYfTHw
 vvoSKvPOj6XlYmvu/STsnUXa+XQw7nEL8RToLZV7WOCN+CqNnVL04yn1/1YoxLk/5JvVtSnVGmC
 PLOsvkmQG9zGDHRrcDGfRxSW8CFQsUwvxYUohT1b84Ctoz18yOIyiD6byIEOmpvsxZF1jc9Rg+K
 r3UvPpysanO/qjVQnIO9kIZNRs4aNmsrynz6v9P7QlES3pl4C9lR9Y7gyiNqX9XnXpMZfozmpy2
 4Q79EiJ3qRWfuo6TetXvpIk2uQqmMlPXcEWGrUEAQV5R4/11biEKK4fl8NhWXc1bRFeqNR7Ov4Z
 Hi477WX0JIQpJXKgf0A8Q==
X-Google-Smtp-Source: AGHT+IEtkI6q/xm4mTDrq1zwIoRGWeEmLimQWTPdv0cxMzV+X4wwZ1AH39dUZF1XLibUlHDhrrF/7Q==
X-Received: by 2002:a17:90b:1d01:b0:34c:a35d:de1b with SMTP id
 98e67ed59e1d1-34f68c48346mr5296424a91.37.1767859752118; 
 Thu, 08 Jan 2026 00:09:12 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:11 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: serial: google,
 goldfish-tty: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:31 +0000
Message-ID: <20260108080836.3777829-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to serial.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

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
index 000000000000..0b702c8657c2
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
+        interrupts = <0xc>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

