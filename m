Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD821D179B2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421DA10E491;
	Tue, 13 Jan 2026 09:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsRo9yXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F6710E492
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:26:50 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-34aa62f9e74so6085948a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768296409; x=1768901209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aq61suyXUukebztJUE3K7EWOiO6kPR6U4DExpN7jb1o=;
 b=bsRo9yXhdmDV83VehSoLBUu0jEfo+KS+MC0gMfPa8kccA+bG1Ro0MYsfrE1+SnH2ao
 HcvWk4bfe3bi1uyZV1cWD+vrLZU0Eiq4d5ZUaJLaZnjr7mpwTvon0v+YZhKGn14Oe/cw
 39Th3bQeKnCOQ9iscnszCl2/0xtpoOyzVa9nRhtBAgllJkIbIfuuULS4Zmn01WTx2F9z
 Lj7+t33KORG7smpKnVnv53rw3rat82lWQi/vZc3KEs8hm4KQ/CsticgZfwjamTYBOuYA
 IEHdjsfwZmQOtAqiOn4xg0tTvpVoMgxuEmHJVAOitP4WMpQowhExJXp2Q/1MVKx95b2u
 l94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768296409; x=1768901209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aq61suyXUukebztJUE3K7EWOiO6kPR6U4DExpN7jb1o=;
 b=JtBW6Yf2KqZdCKJ3SF2cZoqDQkP1sw/rKOwwA/tC6Bn9t/sR7JPYGQrOzM/e2S4fJB
 xTAV1i0EA/kWiP6HN/BYLzk+wSLKQjgY3KGH1D4PfHRi0iDgqPHGNlPTmgOTMUoRulOt
 6gnf0KE5tKjmfWYi0p9rM3BYD8m+lhb4eDF86FFL5ToeX98VdjdiEcXJ1xNjW9zueS8h
 B9QpIzTMuGWgnwxMjyXC2dRV7V8M1Yz8ox9XZPYn1quE1H77rJSUUL1k09jo0e7uzmC1
 ZRkXnBh5jIrZzYTXsi+2EStiFL1c9CY2ukAgykke9ohoh8QXvGA1F9waI0QgQtZ1986N
 8RGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6NaQ+SM6w5whWNO6x7iO9aIyxzsvDzOiqAaA9vC9RY5zdQY/o4CavjPpD9rl2AXV268zUgVwXzi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrA2wf5AFsNtE62C/3ULonfb2an1HEBHSEe4ADT7JARp8v25l2
 dofWUC3jJ+mvKGiWaZdzwm93XswKRd/E9HhvQGbZLr1+ytq8l1ENUy4R
X-Gm-Gg: AY/fxX7xSg83QnSGjerAPjNNYTY/DhyCNEGI47SVpb5DXu36qQrQUGlUZSJ71w5GS4V
 IauInMkAXP7Ja7nRB+Iqvo/ezlG97x0DVQVg35NtAiKLbDzbORXJDAsT58+MTibNZPo9lJt9O1L
 tmrJXQtU8oWjiwMZ7jjlUEAaV+yrY0TfuioX4pMttFlFhNGDdKpSbPNPKJ444y90MDvmMCeARRG
 j3Thhu7UCfzVI9UoacjSTXXGJAxB1qqdoq/tP5vrHKQoPa9Lvmr1dqW9A3bF8QDSEcTBfdgLLKF
 l8tjXdw101FiqkE/cJQ4a4bNoKO97doszRxn1ch4F2vzi63tikK+tjLXLC4sGPFpJxBPmWtPezX
 ooGTvfSUNAANOC9YpmLPYug96zkqd8w43i2LuLa4ItIizoRHa8Hb8en2rEIKiMNVERkuG83TPyY
 ansjK/DPgca24MUtHUIC9W/Yitj+YKnO5erMYOJDFvTqmFi0Gs+phPel8jfkOBsBqIqJ9n6zfsL
 B9tzRFMpHITxUBozbOaHQ==
X-Google-Smtp-Source: AGHT+IFysOWrChXhSoJPQJFZ+6qYg/6GiILncbhIBk3UgY6IvdbI61uVn8gPqLHEqaP0DqKTMcvR7g==
X-Received: by 2002:a17:90b:2647:b0:340:dd2c:a3f5 with SMTP id
 98e67ed59e1d1-34f68c30870mr18506943a91.3.1768296409472; 
 Tue, 13 Jan 2026 01:26:49 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:49 -0800 (PST)
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
Subject: [PATCH v4 6/6] dt-bindings: display: google,
 goldfish-fb: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:02 +0000
Message-ID: <20260113092602.3197681-7-visitorckw@gmail.com>
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
index 000000000000..36ed77cbbcd7
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
+        interrupts = <16>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

