Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B7CEA929
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 21:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FFD10E22E;
	Tue, 30 Dec 2025 20:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sgfl8atU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513910E22E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 20:01:14 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8b220ddc189so1438333485a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767124873; x=1767729673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cweyuKIwKmSRdsl/r/hQ+dHMBlDfUCmP+2wWQS89QfI=;
 b=Sgfl8atURKhdBrRPPxF8ABA1qDSkjQGKvg1UN1le//0ZI6q3OykowUG72Gx3TmVGxc
 ivdUr65UZkY2vF29gIPba3wEH98Te8IkdZhJZ8JslFP0RihVn2rCQ71zZjyEJCvHIAAu
 FahtvMvwxI+SJP7EyJxdMaH/bfSwAlUqiE1VjCdF8Oy4FdET2U2zvjhlXTo9iZy97JHv
 n80woUst0vIaYG9PwP4+rvOCTCG7vDS1WccT7SquSIbB+psXku/Shd4V09h0mzmOMXmy
 H67JuReEjPDkmYmpTJsO21FcACe8nUnOYRW/sju7dXVHnXiq+cjfMMc10OdaRKKBjXI3
 uouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767124873; x=1767729673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cweyuKIwKmSRdsl/r/hQ+dHMBlDfUCmP+2wWQS89QfI=;
 b=XJ0HVKiNXh3Xlmsa5MKvPNc9o4oyGkWR73MjsyCg32vYyUfr45G/78is2i8jZFym8r
 HVOajdNrtO+VW2Sm2noHxtw8oJ/z/oaWkctsyQx+AxaU1YVBfswY7J4nAWw8PaWNraal
 Jc++9wemyAEiLcfJfV1dN+rGPEDoKvqz5WaNcj1gUYRw7EypsAqZ3bg1T15alEO31gDR
 inrB/WN9JB78sHVTXVF/SpE6GUvF0q0qgD0SKI+SIrgiBNGn5rN+iZ5caxfvtf5L2O0e
 farpIkZJtvzGcpPK8ibOvu2UYMkKR51zkTQMk0jTPZdNLHGam93tFsjMhsvULGbaXgDm
 SqLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgXU1h/K/CQ2+T2I3G1+YOLVzrygRnDbIrGsDrAeg7PDXPVBrpNNm7Myy1quh13q0WyjM1auNkoJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwloKU23CNV1MaY+1r45+gawBbeyPiV2OAWI3lpPJI7HAkKnVen
 rvmwPPXcQ9aHrRxFdseLJ8nbKYo2wUCSyak7BX15WKOyKfRBEdcKQbS8
X-Gm-Gg: AY/fxX6cJuUo4Y09tMUrfQdHTO5BuOC7VuxjQJINSauKCI2rNcOm2goHJ0tp6eYnv1R
 MEb01V5ieE7xeTVrBLx/WGCl0vpSGzJrMvhRiAOrX1bWrSDyfer7D99EkuX8drgq5mym8MYXGQy
 pm/EzxPdAt5s9hF5oj2q/8j0YwGyrnuVjUzAqTmW/K4Zwv0twvXEKlUSzD0g81Q1cJUzcBD9YlD
 vIueuvuf96XNUQCRSsskkEfvtO32Sy91F6MKaxy4T0w2lg6LYDEQQK7txc0Rz2sMZfe26OV3Ip5
 ualIOYlNW2jPU0vznSNgkbvaIk0AgbbREAOJ9dT2xT2pc/X53u2YG5JyXVXBqxIwmAlusvIKhr/
 0lz6l7ToEUsJNcobjU6YaUT18jw/znki4wv84Z+lRE59gV0m0/f0Z1XVYCs0+bPL55DgSnHfv+v
 lScHJDkpIm61Q3xt3pCTmmGt7iiMlTT6TJNrvhOBvHS7JCJFTg6LpSrJdI2Aa8Xz2qdH7ZJRPNc
 DvwAzdrjrovDq/L7NxjyQ==
X-Google-Smtp-Source: AGHT+IEV2tPzXOwPHApBAgjAbkeJhyeb+ZtfRECHHa+IQaEP0X/+BdIgcNvcf3mgMft3lyGdkE/kaA==
X-Received: by 2002:a17:90b:2584:b0:32e:7c34:70cf with SMTP id
 98e67ed59e1d1-34e9220204dmr25951440a91.36.1767118265942; 
 Tue, 30 Dec 2025 10:11:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:05 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: input: google,
 goldfish-events-keypad: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:28 +0000
Message-ID: <20251230181031.3191565-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/events.txt   | 17 ---------
 .../input/google,goldfish-events-keypad.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
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
index 000000000000..348cf18d3d24
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,38 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <0x5>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

