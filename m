Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8AFCEA926
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 21:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5F810E23C;
	Tue, 30 Dec 2025 20:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DvNlCD4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824BC10E22E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 20:00:43 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-4511f736011so6612032b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767124843; x=1767729643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQ2qeV8/CMzii4Cc7pVXwWXbCg7/CDjibpfP3lPkew8=;
 b=DvNlCD4QyTbdMXMgOj6jeokxTbMI0PGSCC2eY/vJsNF/ndI4qcxfaLwUVMFT3BggQ/
 G8bWGVq8u2wpKn8L5Pp9393M9Jw3p7FQdj5uF/F5AhjdQDUtHPnZiF/FpCvpeW9TkxmL
 javgeY5lq18oyy+KMLkRibwRfMGtt2+BJC8aMR3sBJrfHImnlPMASYAL4FUJC+3MFppI
 7tnVqPjoAxib1qoBTlrbPBrh0ndz1U8iGvUrlXwLylq5lV5qcYPo/1Jrgvn27k6210oG
 SPK/hDPJpjeZFTsCoeznWjBTCLmMGQ4/361F2i11l8N3YZOlsolbzVdtgiXef2X1zDme
 7yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767124843; x=1767729643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SQ2qeV8/CMzii4Cc7pVXwWXbCg7/CDjibpfP3lPkew8=;
 b=bDI8Q8N6GfE8GY/yOtcH+xHnrsmYqt1KW8eTuiHu9v2qxD3AETbQwy7/6GslCvbq65
 MbRaegZpqWUDI6XxWKsHutF2vX/BrlLoubk5TOQsx4srs9cg2RCy8zDwWNixrKpO/6XD
 BTRzo9tWh4BpcgvZupXC7wP6g3pMm+oqzL5VMD1ZHA/JhhQofUrClekpEXdj50r4xuKU
 NybdXnA3al65IKY8EZRYCl4wNVhB41/zDGI+fEwj2CM0j1OzNYac3PkYFunqENeBsG2T
 6zkBZvaRbZ7oBU4400bADVXO3jvyGb/OqezZWs4XHCmq9f4krBKQOzWCL6Jj6fB20s+9
 vziw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlv4XIO3eHCSPDgCyetD/6Gq8NXi4mF977Vh+LWrIPVtDrkVI2e7qWYsUsXZ2pKZr53wlTHMd0fuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq20+N8fRp7+lUPQ/JLjCRk+2I8iGd/MaYaw5LjBIqSq0wenE+
 aRuupLoc3sK7HesRoNH7tzW3HDAkeMGXwOq9u3y8dhFYNzcDve19R0Ot7QCBcg==
X-Gm-Gg: AY/fxX6YIECB11nVa+cladaQrltF6MM3iO4PNLzAP61inq6ncbH8fBifyGRjHXRaJ7C
 N5TSC4p/czjsSj+/qIOwZ9GWU7/PWI/qw87inuYIsSHxtmqUjHjy6D0hMOjASqm17/y+uFvqePB
 kKp7xHodQHqOyyYlIQSnVw/FvbLwxsS0zqY0VxzCyiwCB3XRKr66Rb+MHj724fNMB1wJZ6oVZq3
 CJ18/U4eR1jCj6ydzC/wR+LeIfLOJkLfyHMzvdbA/tG1l3E9TLC5qDPSKetoYPVgRNQHyl2oIqG
 OuL11WeKNcZjz6wBSPBgxD+YAgeOCkkixDIl+sksnNQSo793zJ2VS/NuxUgkEMcEBbH4OIzaudR
 wMMNWAtCWXe3tQbtLYVTCLqnhptA8OfPrB21NnqxzqANkO3D8TzA+39rdk2T4eB6+mTeygTggaI
 ScINPs8roMVzDfMsRdKgcKEuN2as4fEQj7qGjxd67mg0PK8FyBAUwO9+2fijTbVyMRFRmfdBCQg
 UbLIFUaV4aCwP1KiffLzg==
X-Google-Smtp-Source: AGHT+IESyaAQ5T3YAYk5oG3HpiGG3dgsPGYC0NsIxOY31vJ9VG1hZq4KkWvGFlOWl7CULDPAileC8w==
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id
 98e67ed59e1d1-34e90d6a42cmr29651001a91.6.1767118281443; 
 Tue, 30 Dec 2025 10:11:21 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:21 -0800 (PST)
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
Subject: [PATCH 6/6] dt-bindings: display: google,
 goldfish-fb: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:31 +0000
Message-ID: <20251230181031.3191565-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../bindings/display/google,goldfish-fb.txt   | 17 ---------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml

diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
deleted file mode 100644
index 751fa9f51e5d..000000000000
--- a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish framebuffer
-
-Android Goldfish framebuffer device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-fb"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	display-controller@1f008000 {
-		compatible = "google,goldfish-fb";
-		interrupts = <0x10>;
-		reg = <0x1f008000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
new file mode 100644
index 000000000000..48b9c056d9ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/google,goldfish-fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Framebuffer
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android Goldfish framebuffer device used by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-fb
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
+    display@1f008000 {
+        compatible = "google,goldfish-fb";
+        reg = <0x1f008000 0x100>;
+        interrupts = <0x10>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

