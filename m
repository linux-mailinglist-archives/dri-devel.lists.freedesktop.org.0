Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD09D15450
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3A10E2D2;
	Mon, 12 Jan 2026 20:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zpszlomp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9EC10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:37:57 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7c6dbdaced8so5688056a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768250277; x=1768855077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0PErH3A+TCXfgL5PR8asxXBIGBytLNSMzZeGmnD/jY=;
 b=ZpszlompFhoBzC3gvNTCAp9uAh9w8fSZYMtOnGSuJUzu6kBjMiFi1Sb8EqeOPcSv/c
 4mMEhreRXaogxGD5GVUk8neHv4+2R6tSFyEdLvXvG7opHx4Fdx2o2aF/XIx57O4Zp+2l
 k0qH0aEMMtTvAIHbje1PEn7nN+J2P1tK6wJSGo8L+4/QWWh7qh7a+KpaE+PWpQOBpMBE
 lIMSha7CRDI5JUChboAe1GAXjmtvc0Qr8H4w2zL9m4JBsV2Pypm7smk1VkS/B43SoAwl
 6ahl6sjs7dbShBWn0Ln2EWXyazZm1UeKvHV8BOt4Ra7BW4f+IJ6NXr/M2G6zpTQ3QKpN
 q7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768250277; x=1768855077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A0PErH3A+TCXfgL5PR8asxXBIGBytLNSMzZeGmnD/jY=;
 b=A2AogFvgsIJQiAaud3d713akBA+Y6HtXaQOCHsJUWdO7dppbLjIvMYCsgQOCLapfyV
 YVZxcrjLhGZce6q5h/CNIwu2nakGgKI24pTlMGj9/9P61seVEBPoEJylstMwANjVNs46
 gwOfyzkmMZRrfP+7mT0z3YvP93jXbwh7dkCu/22Gd/5Wnl1QUNnMI6/y/jxhwlLhu4f3
 wW8nI0FqOQb53S48WjmL0+5x6Hya1M+2MWWOF1geWCFAg2QLy8vKViKPWxLAtrft7Mo9
 sB1cgorRc8UhjhOZ5Pnw5nBtfzoZ7VRDBf/5yRlWHK4//vzH3IrZiXZ1TUGPhb4vuajd
 3tDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt7nMmPXG9IPbe3HDu9xMolCZipBhylB4yEEfxM2z7ee5OYdGJBg7lKWZvh8F30qAFW5LqyOHvKxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoyS+Q6JOqMeOBMiamkexCT86I6Ho0bwNQD5r/oDNBLdmHQZbr
 gxM6oMop4nPHu+bKDTlMwRRwRPmjRDkjiLzm7JssdU9w/zOEusjJDnwB
X-Gm-Gg: AY/fxX4PqIP/JewAHvk1Pn0avqM/cmNkoSsEmvADi3w1Iv+kDApr0uRZoyevCthf6JG
 lESlbw4WuqkaD/4wOiP7tkvGU461eQpIi8EPGFlQhDeadrR2/lY93IUCxFn4EgY3t4ruj/m8yf9
 Kx4e8sGnIBVUB2dAzsuN42Zjxi0shKgPK3okJXOXRPBMKJTqJUB64zj+SAg1l+ZhrUAbGEIquiG
 NoazK6KQWgR06thSZ0VmizVA7Wj1QTPoV96wG4a5I4XNB3z9TYyr6lRidvWKnTAJB2f4+wxEWRy
 v2MeiZ4Q4hwcNkF4CXa0skXNBGuwkZI+GVCoom/y59mbbHfRUafwxGQS+0BdOlPDx/jrPClkFDL
 tj4yYuZqWX0yTIA+53vjSsZsYn4kryJIIE4mHgrr7iXJ1AlGKg6bYT3twKl3vxLs6YKiSeuDe+a
 NOlDcfqwnRrKRnxYstla+5o6zQ9QMP47VshUa0iaW9B/MsAMqQtuJIph+PmJseelbuM5XDznP/M
 PctHaxeOi+N6NjYRXr7b+crVG3WBUlh
X-Google-Smtp-Source: AGHT+IGZVQoYbx2iilZrdLG2Ztf307Z50A6C9NTY1Qg4UTlyKWI05nICHsHwet4uo+a7zycAJ/JW+Q==
X-Received: by 2002:a05:6a21:3291:b0:35f:5fc4:d896 with SMTP id
 adf61e73a8af0-3898f906a35mr17214236637.20.1768243921460; 
 Mon, 12 Jan 2026 10:52:01 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:52:01 -0800 (PST)
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
 linux-sound@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 3/6] dt-bindings: input: google,
 goldfish-events-keypad: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:41 +0000
Message-ID: <20260112185044.1865605-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112185044.1865605-1-visitorckw@gmail.com>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/events.txt b/Documentation/devicetree/bindings/goldfish/events.txt
deleted file mode 100644
index 5babf46317a4..000000000000
--- a/Documentation/devicetree/bindings/goldfish/events.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Events Keypad
-
-Android goldfish events keypad device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-events-keypad" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish-events@9040000 {
-		compatible = "google,goldfish-events-keypad";
-		reg = <0x9040000 0x1000>;
-		interrupts = <0x5>;
-	};
diff --git a/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
new file mode 100644
index 000000000000..4e3a010a70c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/google,goldfish-events-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Events Keypad
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: input.yaml#
+
+description:
+  Android goldfish events keypad device generated by android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-events-keypad
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
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

