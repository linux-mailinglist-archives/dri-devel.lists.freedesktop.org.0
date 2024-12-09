Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938D9E8CC2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5242310E11D;
	Mon,  9 Dec 2024 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R7z7LyzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C647810E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:59:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-216401de828so7501845ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 23:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733731174; x=1734335974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
 b=R7z7LyzDEmSJX0u+xiDBttnQc5OESC7NeTC+/N7763A0bMfAQfD2X9IQHVQfaLVqtN
 9AsVlvJv52VvbzOCvk1XbzkT/kDHxp0VLM9pO81AP/A+VEt+FCmDMBriuVuv9lkUNnEI
 L7e4i2p7cPlF07FYjn/KiIk7PJ49sHeSXLguQKC1qqZRjwQpI2bl3gJvRK1sVLMTN+/H
 LkKHOrsoYLPL5iyeLJG4QpmsQWS39s+cIOsFgTYmmSwcjj76PUhrTA6Rkgy98yviiWR0
 +S4+uAxh/iB6v/X/+ZvxamMQlO1Cz612yd6zmp4Q6NRXzvZ3El1xlEX+05bX/hdWhx2F
 WP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733731174; x=1734335974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
 b=nGcoV5cagy1Mo7vafN2P3yjh3T6B2pxapgpf2g6SL3yN5N8DUNVmVZBzOXa0c4uYt8
 zYMhyNQYwnGuy0GUHpLk2qpIoyihHfYHQOwmO917kOBTdUQUfPsp5OItLchgfqkwdD1J
 y57YoE2Rc7pAX2fyYqIG+k6JWJN46P3ekkAvwio23Luxy0gz4Ymoo80KMbMtAssFnks3
 XAF7+cJnzBb7K9+kDfSuEYbzVBgkxHk5SIj6neBnAoXXcr8MclGh0Xv2ApujP4NUj+IA
 u0nzWczkMFoJHQkDgcf0DE8Kv8lNLHyE+UpdppazSy2cOEfobzuGOpaf2kxKIBa2MuVI
 EEIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUojcqnRqvMWF6opSAIbh2tTKrprKnwW7wi+OmjFScFWkHJshcajO/as4J/EAzNh3gNUKdSLncN8GM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXm97QlHhrWrQcbL5ayCzfLn7f3jd0VifwTEZFxp3mu2XvXul5
 1VnzNHP8VyByvGVnW0r92m/kh7LWPz+t7FD/8D5nU2CC+Wk3kqZb
X-Gm-Gg: ASbGncsPHIoc01fCJtPvgHwJagWl4WI6TnH0cJiQIi5K2nhzk2e/aB/inlW5NsUdDF5
 owHDP4NBSE68q59hPGKx3gTCjLUAQzNeCmDaNS5BPXCTTlP98w5bkYHwQzaVPI4vC49bGe7p9V6
 jW5BaBX544xUD6JMpUbb8qdTpZZ7aPTkNTcvLWGzd1fY1tZ0IwY4Y13rtnX8DJPPFqk/6927Kg+
 6rgrwDnFLPrnbJDsD0hMPgn1yFAB1AXe/e6SiAyc90JM71+tywwc+oI8qhRL7WHag==
X-Google-Smtp-Source: AGHT+IHAz1igIUyVxn7/F31nUUXielqAW/wiAuTMbEeQeNxfmCtQzSeNLB5DvIv4dcsvWo5CidKtsA==
X-Received: by 2002:a17:903:234b:b0:216:4943:e575 with SMTP id
 d9443c01a7336-2164943e7d6mr35625795ad.57.1733731174215; 
 Sun, 08 Dec 2024 23:59:34 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 23:59:33 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nick Chan <towinchenmi@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add bindings for Apple DWI backlight
Date: Mon,  9 Dec 2024 15:58:33 +0800
Message-ID: <20241209075908.140014-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
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

Add the device tree bindings for backlight controllers attached via Apple
DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..9d4aa243f679
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description: |
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0 8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1

