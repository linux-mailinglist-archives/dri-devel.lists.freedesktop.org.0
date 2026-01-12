Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CFDD154F5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5A10E42B;
	Mon, 12 Jan 2026 20:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ai73JTqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E21F10E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:47:32 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso115759836d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768250851; x=1768855651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IpW9E256hAdb5Kp0Yw/WkAtwWAPi3uXbVhccnFIi6E=;
 b=ai73JTqNvaj+Baj+zYclcIP3wt/AfxsG1cBYwSfc4oCgVQuLhpdbBTAUAx4X2z7JFh
 aT0EggPmQETNR0rphXxWaePWCV4RKA7+DXXBnl2SA0VhL6Q8hRk0ksPBGvGb7iwkJlIe
 Bb35RJUfdJYjIpH1TxrQWPo8GhuvyFLhV9q7u54RIUhpE536Lwhe4BfOwiwSFMXKxNI+
 wrlQHP7NaINpngliru7nS1MfXzEqY9BcH3b+LOZ+YAkciFu6emsd4025XH/x0L+8ytqa
 TwzZMerEGtKcJ/F9bnbQShsA0+fwtlcpz/SAHaZGJMrdqrsfjtRuHvHg5Ff2A8CnpfxF
 +0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768250851; x=1768855651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9IpW9E256hAdb5Kp0Yw/WkAtwWAPi3uXbVhccnFIi6E=;
 b=PLIv+4WNRumkJq95mrfi8pxvdWVpAk3a4ocOfrfb4OQKk4fZGzfgXWbP3f1Rmjw5hx
 CiA0GasMMoJmaFnizZHYlXVjedW6eEnLm3LcucbLARDHS6g2K7JqSr1VCg2F117qS9nx
 GpqAV0aLamEP+K4TtEtJK9n9+Ujje0BZPIzypY6HmGxyj4pGcy1RDrwVvRPpBkE6lTsq
 w5c6x6GmpOgoYaoXkYB5zkDIz11lDOVfEW8jULjWPfOi7v1T8oWoKY+dF+IO6U702tWM
 8A200GJBiojFH5Eo9dLnMNl3UTg3/+thGTVFMuCVpdzyye9LflRJ6Bi7znF4AAPoKsbA
 Wmnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6wTpEQbMB7km7nLe6UPvrc6mG9l/Y/8mRY3dElYjyQmc0aK5a6ACeGNMd2VuXi24doqTcXS4CbqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5o0lciASr7zHWMw2nFdsE5CYDQQdjqGJXKKutJrOKQBpSv8nn
 4qy63xJOt2JTWrxJstcDcuBkAlWGKbuQLul9XJQ3P22iXLG3GBZ/inIR
X-Gm-Gg: AY/fxX5vEUaKn3sznjylSE4//bujUaGMsqzAS0vXwnERrk5Lg2K6VMEE+9AcQKcPL/P
 nvYlrsojy7Dhb02UcyLLovT9yhqf7f3uoCU7FGni0v9lrj4DDTqzWrzl9HtJ/bu3BY2QBoi5Dkx
 /YksjiY3CTSUrFH/rUtdLu3hvZ33EU2Wyiuz/3UbJljgdk2iUju0uX/Wv/0kg3gqwcie6AE3BUM
 lKiMoSJsxjARIaQMH3CY8KXR3XtBQ4/nTVoRw7ihS6GZ2cNKegt+d3MsIWAByhvdO7YGkqd8y3E
 NxHh/6VCCpU56bWdX3fE21eaKskTqVB8B2IC6EVSct3p1+8OuB+ZHzkFBHw5AjIWKicJP5rJE27
 ZPyQgAlPPJ0ugNq4EqlGpr43cQud8UhcMPiwfTAxAdRoRyE+SW1HnCg1LJPXpUmZcZg06lr38Ds
 iPFwvJ/mK9R8KDxEW2N2DQjAE6IiYg7KrFR9Vj6txQ8XU8pJ4oy4/8bhuPBt0pq17fTtu1DrJkC
 svR75E33lcl55haCe0dyA==
X-Google-Smtp-Source: AGHT+IE0iF957v0dhX+oh2JuRctvQjKaodi99ci7bX97j30HxAiXsxhGrr+rNQNYdsy9DMkXs0FDHQ==
X-Received: by 2002:a05:6a20:4322:b0:366:19fd:dbe4 with SMTP id
 adf61e73a8af0-3898f88eb3emr18090615637.4.1768243916723; 
 Mon, 12 Jan 2026 10:51:56 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:51:56 -0800 (PST)
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
Subject: [PATCH v3 2/6] dt-bindings: misc: google,
 android-pipe: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:40 +0000
Message-ID: <20260112185044.1865605-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- None.

 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/pipe.txt b/Documentation/devicetree/bindings/goldfish/pipe.txt
deleted file mode 100644
index 5637ce701788..000000000000
--- a/Documentation/devicetree/bindings/goldfish/pipe.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish QEMU Pipe
-
-Android pipe virtual device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,android-pipe" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	android_pipe@a010000 {
-		compatible = "google,android-pipe";
-		reg = <ff018000 0x2000>;
-		interrupts = <0x12>;
-	};
diff --git a/Documentation/devicetree/bindings/misc/google,android-pipe.yaml b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
new file mode 100644
index 000000000000..12b0cfc815e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,android-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish QEMU Pipe
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android QEMU pipe virtual device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,android-pipe
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
+    pipe@ff018000 {
+        compatible = "google,android-pipe";
+        reg = <0xff018000 0x2000>;
+        interrupts = <0x12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

