Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28392D01EFC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6843610E6E1;
	Thu,  8 Jan 2026 09:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TIBu/Jic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F22D10E6E1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:50:56 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-5ed0a9cbb3fso894040137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767865855; x=1768470655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHhAP8tHFGp6R15hZZObJ523oYtuLJJxIs+qZwxX3g0=;
 b=TIBu/JicMw4BUYuCAb3aGQRtRqobtoVkeFVvb/ZTnntniLVs2GeXU7PbgcEvxnvgHT
 mIDuwmA1zlVx7qvU48EwdaH3tcJaFN6pPk6sr7LPUvkmQNJrmOxyLYww1thlCnUr+6N0
 BcbqE8IwK3yUDnHUWErCJv+h0tGOheXidt0uW+jsYa+TRw7O1O0Xd9Oe6YvYlG+vx6dM
 J8Nr/9YnickREjA6oG2XsrNH9W8BFxHDbta40sDz+fEXE2YOMmZ73w0R0yczzE9S1InO
 m3RKPm6lccslw5nlc+8dnG1SP9cP8Vy00ZmCqyAMFaa0AbBSzECDhvmSL3H3VSK3CDDc
 6wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767865855; x=1768470655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kHhAP8tHFGp6R15hZZObJ523oYtuLJJxIs+qZwxX3g0=;
 b=qM9bQcWBF+bibtKFCYqqIc2PWjPI+uuOSs75tHjkKarGU2OnBk0qf6Mvy4k/3xFnpC
 ElOnrZrvp/V+hNo0BKetB1xBnmxJx4HJNxEv7bMVl8n24mS/hWqEuzmSILDqmFZCV8Kw
 /g9ndtfA/t0gj5Bz4jkwZib9SvpKptnhFzcegOVYQitWr4CjazN/O1wpwN/gBGluorDN
 6bondvj+DVNmIyW25yZegpsnVh3Ar4lt4XB+yEh9v1sS4bqigao0P4yuhRWU9ZkCzCdc
 UpOi4wMaWGM+sHw99N+LdFffQYMSNDJwwE2yu7KBhz+pUofBpX0osfHFWkHcBjqrPmEE
 vmzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGJI7eT4sSdDgq+ujwxQ+Y4dgpuQHlRlCxm2EXTnTeMGi3DLKcScNeAqfqxF+54GvYc3vx+0lHw5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5NSoMtK9HKwrPUpDqc5Y8T3gYrf+kqrKsOPuz3dI/lTZtDXXt
 vnt9DUtKf/7DNi5Jmf34f3j3GEMQzSFxrAfdx5W/PX4sum2yCb4FxB7x42TYoA==
X-Gm-Gg: AY/fxX7szf85yjUFA3j50i/jpFCebmELzpPzAIl62H5H7+2hJP/UgyAnJ9akg/VylSS
 Ft80KoP/pZpR1j0dy0cYKrA8qTylMHM2hv3GLbB3rTg1VfZz3f0hJh5U9yc707rseF1uFbF42dO
 IeOIpQd6+Ti5CT6ENaZxYCnYy6HpS6Qwl/k2NdeEI94B2JZipIZC4YOeREdtADguE/fhXkxv0VX
 7gkktODR+yJBn0yBx9Kb9kL9xY61Yw98ump/m2v1a1MhVVcP+4A+41Y/fcd+qjn7gBnlBXH2biM
 7iypOch/LbZcka6Z51TMe32EN6bTcJppQs760PTqTF+QRPnu5JPa/rUbuEGzD14SSF/eWFX/nu8
 1uMl1EnPph6+Hb3PuCQZAL5tSUmS04OZQbWiTNDxuOkrY42A+GmsPzDYhuPdAQ27fajH9cfaaVG
 ZmIdKjd5GZrC+mQfDONtWierzLmjse3QTf/mUFTxNcU1qER5hWz/Yb85cLwPxSmn7sudseHhmx/
 hAYN/HthiRTKrS3p3gaLQ==
X-Google-Smtp-Source: AGHT+IExPvCC8KraIjBsVHGHYTjET3yJHc/BTBjFTEdV/VDXcghpuxPJ+uczZtlqCGmQQNa17ulZcQ==
X-Received: by 2002:a05:6a00:288f:b0:81c:9f57:3090 with SMTP id
 d2e1a72fcca58-81c9f5766a8mr2451909b3a.24.1767859757241; 
 Thu, 08 Jan 2026 00:09:17 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:16 -0800 (PST)
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
Subject: [PATCH v2 2/6] dt-bindings: misc: google,
 android-pipe: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:32 +0000
Message-ID: <20260108080836.3777829-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
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

