Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C4CEA950
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 21:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8F10E603;
	Tue, 30 Dec 2025 20:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RjnvZF8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD7710E603
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 20:07:01 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-94130b88642so6890446241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767125221; x=1767730021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqq42GMedrB/T6d7mRybr+4FEurk5kHOMzPka2Yicmo=;
 b=RjnvZF8DIF2EFDiNOd5CAXl+De8IEMlYA63WraHZrFDTgvcdBgyxMMXE1RFv+HtZKX
 d470bvlfh4UHdbBwKA7mJwZXZvpfl4KB18HmYBYvoMHMWZITDyuESG2me6dOSQIbjqZM
 JqV0PubtS+4LlM7agBjLUa8rwhbUm5W22WYhalyFERoipTeyce6dLFgqnkn1/os1e0vw
 lKhhWQyvnjIT02m6YHPtrF6JJQxVGPip+QoHPN24z/cbEcmXYj9XM8+627va/IVBV2/Y
 jDvygAUaYRkZ90hgT+XegptmSWaednA8dbsYih0jWWpmRW7ULjZ6uQVE+rT7q4ctXwfp
 HWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767125221; x=1767730021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vqq42GMedrB/T6d7mRybr+4FEurk5kHOMzPka2Yicmo=;
 b=lnN3YtPgUXpUFIYXZ5tjVKvBpX8exvV21uo2s/JDDZV0lsXcbkjXiux+WThJ6m+zod
 vCq3YLPQPYRb0I+5Feic9sXpiQinSZFBVzWDZmqe41g2VpsfQW0PR7/HNEvbUnAbPDZY
 Yt5zGiYQTNnWCwe9xdBC2FyCuaF1GdVfyk8rpBhrasVopUHSo9g+4bV/UvfPPdzqoMMY
 k7ErTbuiihKZJhqA0fHy70g3W+uIoYaxYjTs63FGBI7ZEkMNMi3vCkJh8oM8Ty5bQXG1
 sGvhMWmpJravSJjcqBDWkNl5mnzdN/JKndn+zKraXv6P2Qc4HOxkQ6vm3gJb0JzWp+vd
 79+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0RGrKa1K6RYUg1ETgq61uNAkbYHrQ2N9asCqzSpE/QMw9Zz0fzEDxUhLEDyZ7En6gYnSZzD3tWIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpTsd1e0pvMG7y4RFmgWbq3R5tH1HIv4KuZ5RGehbAx72ngv1M
 1IyeJS+YI8RFNe3Y76RfbNpiOCv9vqW3HB+x3ZdE/KgA+23vBT4FflxRvCE11A==
X-Gm-Gg: AY/fxX541VZ0x9zvQGPNHLlgmYLnxWxex5KOkUft2phhTa8PMTvy/Y7KIa36xj8SNz9
 y0SZgQBaQF0npqsg+FXoN7l5w+mk7FCa6S6IO19EDYHxsGu690TKTSX9Q3DKSuyYjQXCJ0G00iV
 U5J/K0tAEZboTAhYwICC+qZBYG1aP4RcGAwCMfcsnP2VwxRa6YSwVs1amGqCGckoHgc2lsujwZo
 kY3PsIIIkC7AjZTNTwaNRDP1Z96h1wDZU6tTvC90mJg5cTHOrMZfYerrHG41zPPoD886mGsk4GW
 FhYILrMK+I+w+Bd5N5lX9wJihg+MBzMl6G2Fg/qZRmTL/iWl9LHfl5flkFGNYE/BVvoBSDtPOoI
 jkvSeKFHmrJbgOvfwlfgzBpTk0W/9g66ucOKULKn4NXtFzH7272qlWsq7vqFWn5pJhlGKRSMkDX
 kNJ81mQEVrqgpt95wRqK+4Xnt0pbjZNyrtO8+ffzxH+UWnr2vNE6CDnPOgdDLEieg4kow7D5aBS
 fcYPQn/Ey5ixttESxbOqw==
X-Google-Smtp-Source: AGHT+IGG4IvGkIealWBZgvBLq7nxU8BQLyVFrfwWxsNjASkIojjiGo3aO9o10cXPbEY9owzzFvEfpg==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id
 d9443c01a7336-2a2f2732287mr344445935ad.30.1767118253801; 
 Tue, 30 Dec 2025 10:10:53 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:10:53 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: serial: google,
 goldfish-tty: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:26 +0000
Message-ID: <20251230181031.3191565-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/tty.txt      | 17 ---------
 .../bindings/serial/google,goldfish-tty.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
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
index 000000000000..08fa12449a01
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,38 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

