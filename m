Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F8CEA8CB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 20:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEB589C05;
	Tue, 30 Dec 2025 19:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KnO5I5u1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE7789C05
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 19:47:00 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-93f5910b06cso6217116241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767124019; x=1767728819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eY9DKWu7ggurjBP9bHM5tPTMCGUI+TAaWzZpacbdf+Y=;
 b=KnO5I5u1lVyqg79WzmxtjU7c+H4iaPLJHay+WH3EPEJAgX7BTjhdIG0uX+qUulWAVe
 igAdbPRSXN4vZmj+Z39r3IIBEKjMBMoUnrEZPEBohrr8fxVeSX6hplj59g3PDzHzpJIL
 kME+c6XyUOLBbyLQQjc00dwR2FET8X9BrO/i5BzRoCenQaXHvxM+CKTx/R67DSvoNuBK
 /0LFJ+bGOqIIDMsc/4OJN9g3IL3CDBolBcMhK5IEOoMumTnkgXYfYu7+0+VPqAO7Mp9e
 nf629lvzRWt4inMgfyd2PwH0IOwngpGqnC/ukQxeoqUC3vYHmVhyZc8H/MtOsMvlpa0h
 DixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767124019; x=1767728819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eY9DKWu7ggurjBP9bHM5tPTMCGUI+TAaWzZpacbdf+Y=;
 b=RkRHLxJCVBCsEqBWVXSErIc3/W/uLLFvPmbogzpXZLkTTjeOA0bJezTIGryWx9eJC+
 P7Sp0pIPXhkSifZzyzwAXPhZQnFrZr8yzwtNmjsyWAcShGGtB94Ng1nsiRuIjM4DPx2o
 kYDmoGM4nSq5Xj7h4k7MuBifA2SkKYi/0JlT8JDP7QFeE1lgRFntVHhybMk7tN3V5Pj9
 wQDBH09SF0VJQBsH2OEioXkHL9KaosANgC3UxkqKLrOh+B4Vh2gozx34z+ypEbs4YPF+
 850pZeY7VezadHfncTBljY+ZIS5zOhK9yEjtzBRoZkdDVMkpMGyQoMHVG5VUvY3rQC+c
 /fcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkckfIbfq+z493oOmrnXTlKRlsXKhKYJ8g542eUE7YQ3v4GGygDkLodpSQvtPenP0RXkg9yUvaOII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7V6PRgc3IgrkssOjByS2wnjm3kXM5OkyT0Py4Pw/Cf8FN82vU
 ODkcwuZ99dP2jyPIhK4DwsBlFg4/63n2x/HDTjZ1t1EuBEJfrA6rKcRXH5SWCg==
X-Gm-Gg: AY/fxX50bb01lzL8rScGftKa1E/cpXdDwRBgmTy3zQya6mqfROw5NrRImni6utJBhxh
 CFsnALUA0pAOTlaBvK3fbhEbPNuGU9tM2ZIBd2IU3KO+exZft3bljC8tax39Mr1Ehj7YPnaaiTc
 7OmpD/nHYRiV58suwFlGm7a3Smt2W813TYZsRyAYyDMtmfYhbJF5N0nyAgAKfiY3Gb/NfeuGFxB
 BLV0blZhAYaClefqIWekK0gzzPgBfyU42UM5l9IO1n/zkD2ZzIX0s039aOOMRgP633gFItq2CaR
 gndf64WyqGb5VAvnw/qDScWw3+zbHwUsyfA9dbq8vYX7QaJxLiGLaE3zR2TJPYbOwx7FnvQzxwZ
 0ZoW2lnRiQDMeZ3NkPQv7uVVVlFYwNuZ0UkuFdXfbdLbgKraWnNgVV583AKN7m+THuc4YKaRddr
 olvGlZ15dKKM+aRDdgB1f079/U/4maQZuhrw+54Gh/16xSVwvS6922tVG2C3KFeC8GX9WcmJPTC
 /3uzfttBxRg1OhGj0LNTahJqtLt5/ai
X-Google-Smtp-Source: AGHT+IHNSjL6XO/9GG+VQ4LJ4CyetXEzcsFuGnG9Kdw0+OI361O47497s5aMUrTFKuua6BqPpBWyVQ==
X-Received: by 2002:a05:6a20:549d:b0:35f:84c7:4012 with SMTP id
 adf61e73a8af0-3769f92fca1mr31561858637.29.1767118275492; 
 Tue, 30 Dec 2025 10:11:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:15 -0800 (PST)
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
Subject: [PATCH 5/6] dt-bindings: sound: google,
 goldfish-audio: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:30 +0000
Message-ID: <20251230181031.3191565-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20251230181031.3191565-1-visitorckw@gmail.com>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
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

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/audio.txt b/Documentation/devicetree/bindings/goldfish/audio.txt
deleted file mode 100644
index d043fda433ba..000000000000
--- a/Documentation/devicetree/bindings/goldfish/audio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Audio
-
-Android goldfish audio device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-audio" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_audio@9030000 {
-		compatible = "google,goldfish-audio";
-		reg = <0x9030000 0x100>;
-		interrupts = <0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
new file mode 100644
index 000000000000..e0b26c1f7b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,goldfish-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Audio
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish audio device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-audio
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
+additionalProperties: false
+
+examples:
+  - |
+    sound@9030000 {
+        compatible = "google,goldfish-audio";
+        reg = <0x9030000 0x100>;
+        interrupts = <0x4>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

