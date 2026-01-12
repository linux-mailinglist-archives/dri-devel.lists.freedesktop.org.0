Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD56D153D5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141F310E2D3;
	Mon, 12 Jan 2026 20:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eBv46tUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA95210E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:34:30 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7c76f65feb5so5552304a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768250070; x=1768854870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oL3a/4UaA+a8Zff5y8gdtJeilEUr13wkA6OARJeIofo=;
 b=eBv46tUeDkO1Nm5PGC9IYYAyTLcyQHe3mkHzZSLBAZQIRteYzJd8k+tRSYxrM1kgsP
 p19/XzMwxd8VZs7tmkyDRtHwNLsGiUaV30GnT8iDfcGyr5nuuG9k0u2BircmbmODPCLI
 0nCg0j8ZsWKi4Vo4Oq8qrGzu4BBuXiwP7BKE0HI8EppyZHNok1PF/l6owuN4Mq39MgVU
 Kcwhs2DnTV3VlOwld8YiaOVnk90pJOxinDUXI7G67Kxmlg+CzUJOyqDhCYvfraO9FZsc
 snlxwhS4/f1MzWs2Q4nPwKcaV5wDkgKU2Y03sWD4T3g2sAXlbBXUgxCYvujHJkiHyu30
 4P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768250070; x=1768854870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oL3a/4UaA+a8Zff5y8gdtJeilEUr13wkA6OARJeIofo=;
 b=Ih+I8BoFMZsXMOn5HCvZGSfRcEFZXFf+7IDld2ghsCPPFxH0k9KpuWW9q5vYpO5xM0
 JdvEulpAK9eZd1c2gwA7On7t5hIQ2KYnAOaXCdceth2kOhgqfrVgKLOTjr3aws4Ad9vA
 Lu2RoWRJEcgWhWU6kiyJghKrc8kc8/Oc4fEsRIkrQLehzI+uVvosKUs1Xr9sXDXH54UV
 BPzirQGRWP6/hA9fZ2T5TUaWt7RsAFMzzXPtlEBGDWN70VSVDpwoCH6wD/DK5n6LVWFs
 DkXpe1WL14MD9WHOZjQxLlVde+UEDMMtsgkwNbtK69zpELaNzp9K3vFg7auH5aQ+QMlG
 Fs8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsCvshtV9em+uTxA4z0/maqBOXr8ds4HjCH4SkGPMClpNsYITqbWF+QO4RLFf8wWzDZXR0zJjpMH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz35vPKyac2FJZIRMAwHEWxhgT5pUXgsNKjDclWRRVLIG1DtWHD
 DkV0YxILQW7YMzlDs/ylmJjeYywZodPLZKSdp9GdrOKcKZzvifm7RDal7cKEnQ==
X-Gm-Gg: AY/fxX4PkAN2ffmf4YzJLqsjYgeRvgeC4y5uQqFM/2dTJlyifMUDSXncHeTSsRlsQws
 3y28Av81JkbGdEmTKzQvTEJaAEhAonngoKuohQCOZd7NopjHWb0pA/8VqkCnCZlR6bikBwLkoyG
 mMhxPiIw8lpR8GcXBN34zQciF9wH/VIZZhNhtRquu9+Z744TtNLUkpte51+Yn1aVNqz7yjc3fi4
 qt66L6hHu58JPzomzdlBOTNEUeNuIPfuEqvZ77Kir5S3aBWdcsUZzvGfmBQeq3XWcNT8YJ1uYgH
 aibCOKI9robpeTW1SbiNorKVDVUL9ehkhPxYrQmKTsiz842ssayBPhLnFuX7nkU4q0TAF57yZd1
 Uns2+TOiBubnL1FUYNRVIowuAL+U25x0j+yVMk+pkX4bUZb8E1c3QQBQvOui7vHTWhebWzoUUTf
 rln9urbqg+8nPrv8qJTHHdFOBASjp/V1fSZMadqU3pER30qqTXm7fYOhp4uYPtrCt5tZxvc76kq
 Q9W9jVox+1mXm1JoKFspxKS9Zk7ZNLC
X-Google-Smtp-Source: AGHT+IFAodgf1HCpii8yqntRagZFeymJlZlYuy8XB+cGQHdG7vRM/mtdZt981BYzjdhg5eNahHLaYQ==
X-Received: by 2002:a05:6a21:6d8c:b0:35f:6e12:1862 with SMTP id
 adf61e73a8af0-3898f94c400mr17035763637.19.1768243912001; 
 Mon, 12 Jan 2026 10:51:52 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:51:51 -0800 (PST)
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
Subject: [PATCH v3 1/6] dt-bindings: serial: google,
 goldfish-tty: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:39 +0000
Message-ID: <20260112185044.1865605-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- None.

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

