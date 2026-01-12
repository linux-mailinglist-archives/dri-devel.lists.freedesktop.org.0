Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37FD1539C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5824310E200;
	Mon, 12 Jan 2026 20:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UxCxk2vg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB91F10E200
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:31:45 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-3ec46e3c65bso5306445fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768249905; x=1768854705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcjtfYLr/hzQ7i+u9m84wCmIOhDfx7TiS5rWTLTDi7o=;
 b=UxCxk2vgqkX/XeqHdYzBP5AggyxNxBEOM3O14ksoq2jYzRENIvmdlkMsa5KzmO0Ju8
 mzl8N/EWtRW3ZEbSJlE0Vqs4raP8Fy9jca1laNREKjwWpYr/UJviSGmhTQmphMoi0yYP
 vRb3YnNHO1fcQV0DWfklfAISsxj9TPvfBWwEpuxEVwsPWtDBFy/T7n1MTXZcRoimlPRU
 4Q36xcnELfjUIotq+lxFrjxx7kkMjqDbLhbRE5wXCvc9RbzW200nPuQrEsvPaDBJWfu6
 DsEmTeUgUUIpJ9r/+vDwmYZWZQQunN5PvC92sRkRbllwmA+dTq40eFUfHU3zcyCL+Mvw
 8PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768249905; x=1768854705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zcjtfYLr/hzQ7i+u9m84wCmIOhDfx7TiS5rWTLTDi7o=;
 b=A8xto70EZw/qMYqk3dJ5/vpeO/wpH/sQOt+J6FAwVnoldI0q8ZEtgZkpQMGDO3ql9p
 nDawkgpEspmiYf+iHrTtFu7JkMziJisfl1nd93OmKRRuV4adztFKqHDzAMR2oKMP48An
 3YdunfpKlZNFHqfY9JIWeVKSG6xxH8tpeMm6ZQCQc2N9hDaKhHIO9A0oqt73E07rBNXz
 EMw7xBc3sDyprSZ1jgZLYKe0d88AXQiOdcqA1dmKRv97aqjUa9NbJMjqX4eD6U9MdZ95
 BrzPlyaMr02GBeE3WM+fpIZ9CWSx4BEbSB6UQj6qJwy8l2mPBm5V7vn08qUE5un9QfS6
 g6Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPH9w2pyv8zZ5FOr7JtMfWJprYORUl+eWegZL/gIBYP7BRTVEQqPcaR1NU7zDYCl46I0GZSpsNNME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygc+ei2ueC2hOJGjOLaQpTdLZOFmP7UcXgsxv9uRZdf69QnHEM
 2TIdcYvSVBwEUA1IGkFpCOT519yXVyce28sSGabHHDun7j3ruU+fUtMfIlzGnQ==
X-Gm-Gg: AY/fxX5cPbnC/3Ej7cm+2RGcsA9aaOnAFAOQzaRKT7dZ7Ee/e1lTqk2/FAglFyiv7Az
 OZHaDWrB/+rg+PvZ6JHUsa8Gxj4J/BeCFNLXZ44Xv/5TWUCi/zSIqmjNDkMoCuFWFdf0yKtQh6o
 IZiMEEA2GuKArEc1tRigfhE1PR4eag0v5sdNoKOBdq4r8KZUplw6pbT9JfeDqzQfonUJoIKQUa6
 p49fpQBSzxtCA9g91qtcQ+E0uOKRiZvFveAlPyNEIMU5HPmYyyF9yaUEhig7gJqL3vJbncQSByr
 MXYSReaEZj/8xzEl+34tCPAq1fgTq/tV20Y5NWWYRMAT4MULpHCSbPdBwa/wVgApYFrQIlWyOAc
 sDYzFZJC68tp0UmdEUSne3F/ZAk9yPMA+hYLdfcNXBcPm6o57xnWBIQklnIhmiyuArrFq3cJhAp
 K+GGxcMJu2wq0CO4mjNADti45MwBEZZgQnlhvetz6qysMJNkYvFPeK13X/B4aDiHGDjLq4zFnPz
 rtx+jRJXJC/c1dt8077oAKTeWZeYYO5
X-Google-Smtp-Source: AGHT+IEhhjkMRhLtfe06HmVUiVLdJt4MdPUnRHhK5mx9O/EoN/yul2X9MrifSFUaAnpKZe76DRHW3A==
X-Received: by 2002:a05:6a20:430f:b0:366:14ac:8c72 with SMTP id
 adf61e73a8af0-3898f9db825mr17301674637.72.1768243931042; 
 Mon, 12 Jan 2026 10:52:11 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:52:10 -0800 (PST)
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
Subject: [PATCH v3 5/6] dt-bindings: sound: google,
 goldfish-audio: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:43 +0000
Message-ID: <20260112185044.1865605-6-visitorckw@gmail.com>
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

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

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
index 000000000000..d395a5cbc945
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
+        interrupts = <4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

