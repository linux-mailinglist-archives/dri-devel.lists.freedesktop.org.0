Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51565D1860B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 12:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3C310E125;
	Tue, 13 Jan 2026 11:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hwI+JXFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B38A10E125
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:13:28 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8b2a4b6876fso1147126085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 03:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768302807; x=1768907607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/DtPGFQHFju1IO/Degf1/ys2a0tv707U6qKEmBe4+A8=;
 b=hwI+JXFRINO5CEkUv3u9tMIRfJx3rI5/LKKyC0bf7yXlp1++x+NWIZuJ4Yv7oKkz+v
 SPbJh4fogjqW5q0q63YZWyTRm+6+BsstZDO9v8xHB/9TqwuyO9HWmW36CbhPQTR8nRPA
 cMJJC5IxEr5WsgcD77qdIVRZrE1TnLNljiWxq2+gTgAFQEBM7f74sSpuUgbGxyru5Bav
 t1RjnReXBki2u7S2RJ8Z/xKsKheXWWinhWjIV2g2uFvs2YQOuO0Vhk/MA6QuJQiMWM3y
 JK6b3TIxASAjJTS/TAHl2eyQA+PckMuk5LfaK2cAFBDaD6+XkXlP2ynH6d0H64FxO8KZ
 3poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768302807; x=1768907607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/DtPGFQHFju1IO/Degf1/ys2a0tv707U6qKEmBe4+A8=;
 b=CmdgJ+bwTSmrsrYOVzf28Xtwa1rENRfuOzfdJFvjAaKt7M41nm77Z8mF3HMu0vevIz
 VWFA6ouYfj0FpANoJdKZ1DmU6tOe2P4XSbbmJkrOOd7RwiOkgs8uVTTep8wHUP+HRblz
 VfkQEeZqVUV5KluCYCrPJ/X118cXpux7ByYPAYO9YVXaV7Q5LADPjbyr804G1cNyh4pH
 m+Ui/MhICDfbVlIEb/aMVUh2GFVTGJngC9I36wiqAzwFOEHgHOsAE+RFzr3ijn6MAYRX
 gaw2Qsws0Bma2UWv3n3XlxPebjO/rnJRLgUmbOhYkLwJTeMftBBig2A0ciNnLmjIn5P5
 o6ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi5NAa2XcjLAS3ZynAXhHjdnEILf7PeStVr5RgSwfBbmGOQ6wvJjqE/oMNCnZ/kVnyYsXLDwXrRNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8SK6gO3PrAA4DMFYjDb34ZTsnMGTB6f2VpPp/sOBnGAUWvcyl
 PrTncc4ZR4nYAClJ4sKGWrzcBJ6Fqak6IVM1Qs1tIyyqocKAzkoyerSlNfV4hQ==
X-Gm-Gg: AY/fxX4iFYKyvfvpukKQYkm7SiGfYKx7TXnoQNOIN1/Jme5GJmCa2R7W1w7hQsclfS+
 ovcJ9APt2uHs6TGIqf9nRWYS4owQSze/1pH0a2IJtQ/cxYIAUZElKrPzYXtz2sPRDYmMhXHM9gD
 VhQUnWn6XnR6UWCsaXKikiMUBc1C7rYwv51zfkb+crMrQX4lwfswpPMG2aPOVhpvD1gMt+Q/snX
 ercoLCRqvUiWRA4rduBXOiW2Z3z4RZ4PvOKgxak9QmFxnBbTDJMlpzLwPdCO2X6AbiQlFffz6G9
 4xgBIcS4YcMdS3xinVlSUzqezKNkyvFH7ZF0N9Yg6Jth9csK3dQSG6iFiDBdMuP4ltCDZeEGEgz
 CqCyLYlCTmiDs+YNDO8rKTT7NfnRFfNPdClHjpqhn5/MMKeTc+FFn/b13zpD2+/8P0LhJwqevd6
 4hWrrTtEO17g7y+HfsfoFbRBlT8t0RHy2Z1ILFSNXgixLZWzqHAyhb6qFOoQMhWc47YGGNDkWBX
 2YISBXIGdt2IrJLPYGKPw==
X-Google-Smtp-Source: AGHT+IGN7YtptJAvyBxGsryFp/ZVQ3AtqkPm+d6Uo/gUGIm0zr03kGaJ57Syx71qzIqCdd6goycVuA==
X-Received: by 2002:a17:90b:4b0b:b0:330:6d5e:f174 with SMTP id
 98e67ed59e1d1-34f68d0bc5fmr21176395a91.20.1768296400127; 
 Tue, 13 Jan 2026 01:26:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:39 -0800 (PST)
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
Subject: [PATCH v4 4/6] dt-bindings: power: supply: google,
 goldfish-battery: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:00 +0000
Message-ID: <20260113092602.3197681-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/battery.txt b/Documentation/devicetree/bindings/goldfish/battery.txt
deleted file mode 100644
index 4fb613933214..000000000000
--- a/Documentation/devicetree/bindings/goldfish/battery.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Battery
-
-Android goldfish battery device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-battery" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_battery@9020000 {
-		compatible = "google,goldfish-battery";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
new file mode 100644
index 000000000000..634327c89c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Battery
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+description:
+  Android goldfish battery device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-battery
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
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <3>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

