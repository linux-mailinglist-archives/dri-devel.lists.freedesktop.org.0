Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B275A9E82BF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EE810E319;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LDbS3XzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5617010E231
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 13:04:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-215810fff52so32554085ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 05:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733576696; x=1734181496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
 b=LDbS3XzRFtwr9PDM368EppKgLM3mSv3+Efq5MNANP7D3GqwPRRtfQhmR4VO5vDoUpR
 JQrcv2YmPspeb2mOi0TqW0iRFNJsU5P9aEuansqSe0VLav+G39NkmC7VKUiB4i2Ggbab
 yljUAmKASI8zY9Io5xuhh9DdhahB5efXr84uY3lTXsodC16h7FfSPQSXb8vRsUytwANP
 aDBa6VLecUXw3ImJFhpFXWJXWX8O2dT605Zih6WDKFH1h2ZIJAnjVxyr3oZR2g1pEfE9
 QsRRC6+rMA41xWUG0n5GNCir2beFrIhq103CQWNl6CRPORirlFmF5rmbXd2mUrVBcaJx
 P33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733576696; x=1734181496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
 b=jLZ70br+sQCJGUUe4IlcpoKDtm9Y0L8w9djuvJgIEqgXAA8iUH9eC37S9Dey/CvqoE
 a5kY9Gl1yrDRp1sWGDX8gVJA5yFSS0wAnKbxigqTeRCbyIlwhitzJ2wc5oF0w9dHjWUz
 z7INaynCv+gvEQpuG2Ln/TqtqO3zB+i1ft9XScTXcF8YxDEmseqdhMrKtJBSDoDRbxGu
 EFVvR6U9Fb80F2BebgprKIywIPr34kxTU7hcO5ZsfzS4SN0BqxYEFvAjYPYKx8N3wPAk
 lt2NaJJHJ9S+NgZ7VZcLgTc+WnEw4hkdMweFaOf066cs1BeuWQGW0MOsvbdxu3ViEtwZ
 KDmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLHDtNeC90rS7RkuFaalnKokUsG7UqJ4U+ufSEGlE35e/Jz6fMfbh7yyClO8FxgHx2X0ZIGz4hqi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1nt3sJT6513QFdHPJsdJjA5B+bRMenkGoVCeLBR41AAKvNmSF
 VJ9DpZRTBnLH6Xez9RloFgy8q9GM68OOC8Lji18GAN6Rbi9m1LHv
X-Gm-Gg: ASbGncutdezJKGupshbQxztILSW+VTN7MooleA8QzBWW9F+SA2ZM5jWz5yc0lEpV0hm
 TuELWxPwMCXrzmi7LAQzp31m9EIupe5/TTyS35j5ayFcuxspgN90QjH2j1i60w96GJyICWik33w
 SD8DhxxU7+H1btTioD5i/MmtQKodCNKwcD7CzoEy+iC9ebitD4IfC1RHYPCkkeCFtFx1V91v0Wa
 hDxgd4AITQTwNQ+yaHNjjywDRCRTruZTr3tAQBQRZDdcQefS7ZuJf1fyk+leycgjQ==
X-Google-Smtp-Source: AGHT+IHSBn/pq77OCjYDKU4tqjEmdqZd8B5Zl+VAbPbKPPsQr8JFMXWjlUkJ7t8BCQ5XsnHByPmm6Q==
X-Received: by 2002:a17:902:c40a:b0:211:ce91:63ea with SMTP id
 d9443c01a7336-21614d35675mr103444335ad.15.1733576695885; 
 Sat, 07 Dec 2024 05:04:55 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 05:04:55 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 21:03:14 +0800
Message-ID: <20241207130433.30351-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

