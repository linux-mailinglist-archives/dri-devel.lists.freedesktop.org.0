Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E514D18831
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 12:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E8B10E4A9;
	Tue, 13 Jan 2026 11:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qya9+omy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077F10E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:36:17 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4ffc0ddefc4so86007201cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 03:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768304176; x=1768908976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyUyxp8wAgf/XnChDYwKqc2QzM4UH8wRrO9JxGpfnDE=;
 b=Qya9+omyALfNaQ9lj32tOTqbaarr4siIssypcEilNf7zBVqbr6TBl4oYmdD1+7+461
 6gjqB4vyVz3XlsP7NIWhQH6YfcBc8EWT1cYSUmoedAYeOnO5Wz4eNDLuFr2e2kGPzzIZ
 CJlkokGSOceJTHK3QI/nMaxrkJBVUgGlEZvYYsuM0mopKXYe4Re9XEXsxVvLFlBOrpll
 vrSRDSMFeZgLphPoaPWbiMmvUCrIdmX1+DW1L0/O5567pA9F5KkmKeOMdTiFJfvp8dBU
 kQfd7B1Ll0H609EXgJlFWlUY/OQU1f0D9ClclleduhBXecjfwsM8ZsAC83b2EpWNhqBr
 DXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768304176; x=1768908976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zyUyxp8wAgf/XnChDYwKqc2QzM4UH8wRrO9JxGpfnDE=;
 b=qRYVVymcdRvWwSm5Yuv21bx2S6butjreV1YQ84N3osoMm9vOb1VEHPfwW9HTT4UWdD
 YfeYBUQKJ4mdfxPNIsuczq3xzN+REHmZyk2oAwZGVxgRaKJV03gxRj4L/Sww9yto1XyR
 bnZxuGxroKqrKEPrSyZRVM/a+P25DZ2jE7g8vQuO6zol73n27xsLIv6GzBcYGCwaszjY
 XHYsSFIt52oSpQTNejrkK/Z20vFifZn7DKJ16RQ6xvKxEorfRMrthwgFtTjgMP5ek6wO
 sqPRYR3Iry9EAxAnSCOCS7h45iBjcEk6KJfzJURijudmDjDSmRj7bjYV2TEuxtlaJhQD
 RxwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuT762K+QYwfyZnO1Ha8K4Y5+dcZYNB8SkejYsecyeR9o/xPud5w05gCpxv14ZDhMzCjJYBaxJc2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy17PwMIZIC0U293NW7dSN3DEyav1RoBRdoX1MufNpvlaan/HWd
 Or3oQT1O2cC0cJNSOC2KeguLjsnw8+920laq9yu9Cfq5l07uTzFMmhvHOx7wyA==
X-Gm-Gg: AY/fxX6QdU5Q9DXYP0uXFkcGLlh3L6ptMM1dpwmBznHRLp+KV7YL5b3iFagERuWZA+1
 vQv5lU2W2WgbLlBmM6ZScHrDpaWQYCW3D/+mtYgSOPGBrfEYsv79szqGwzCMRv+Hiob1wkZ1+ak
 9H2MnuDvVdV1knHcmWEwrCW9KkFIxK9GCfESJtgmiB1RVs2RmC4uSdCBuQRVxQIiqVFL1hoQFMS
 ZBQLUa9ddBuYsuv8E4DKFELRRXgaQREgpBViA0DAacHRI7gtTIG0LHJk7lFzkrQ+vMlFDBnUMMd
 NEczu2nvXq065v0eYVB54tAyzHujwx9DdOpgN93jhQP7wUWPyfUqojcaKCbs1F6sYQfWShqtLOd
 g/TuyATlXGm7nFbRCkMtjJk4Tdb1emcY6KKvCDV9VOVohAYf1IhTMiR+ZmjTM66kicNpt4R5VDO
 JYxCxU418a94uGo6mYstaMNXdzvABRG/wl2uArdGrNezbRcGiL4lvPQ9VDWi9dllsGtw1q7WMdl
 PVQ7A0jCc2kupAhewsUJw==
X-Google-Smtp-Source: AGHT+IEQYBKDIx5Gyb5nb9QDIlP5wjHoYpr1ATatTX3/LBRfDVJ6GHb1+HOoMcW7bBTYInLSSSdvlw==
X-Received: by 2002:a17:90b:1c07:b0:32e:1b1c:f8b8 with SMTP id
 98e67ed59e1d1-34f68cdda94mr20382740a91.26.1768296395660; 
 Tue, 13 Jan 2026 01:26:35 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:35 -0800 (PST)
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
Subject: [PATCH v4 3/6] dt-bindings: input: google,
 goldfish-events-keypad: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:59 +0000
Message-ID: <20260113092602.3197681-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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

