Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A8D186EA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 12:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A2210E2E6;
	Tue, 13 Jan 2026 11:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q/ZH1gLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AE710E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:21:10 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-3f0c93ecf42so4154281fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 03:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768303269; x=1768908069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XLlcSDrZxQliY6Jsns4WsjKtz/A9etiQH4EFHPP5z8=;
 b=Q/ZH1gLSgUn9t6uCS0BVUXNeL8Z0lGNfZQMLIlof9w58JzM8aQT0MzkEbmge88vasN
 pPETKwdRA3ZBL442g5jplKxd2s597v17fL9V6HuLXtB3b0oko4HcdkcVkA4asIH/MKWT
 or/0uEEKDrEfhLeACZxv0o7NQgqBCHMctDYRhmFw3XHd5/u7kw6mOHAV8yoetROnwijV
 cxZbp44/sDFyzH6kSkiDBkWcu0DzTKnyrIs60JtLXwblN0hxC3VSOfwlJcNVeX6d5l5X
 QsAgxv4iNq40Dn5g/rg3Skaz6znvpRUl1CiDhlxBSjvUDkmjQSDt6o/bArVGhLQie4ZW
 iscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768303269; x=1768908069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4XLlcSDrZxQliY6Jsns4WsjKtz/A9etiQH4EFHPP5z8=;
 b=ueDBU1xGTAQjKs2CMl28pFj/eMBAXVCtlF6uJ4AeMnIKH2pkDfFVZyoyq3leJB1NG3
 YjS09uNjcke/j0sCzj9sj+6tesci0aZ9PDpRaWzgTfTiSnqdqYwZS3QxFvbw5oED4yJL
 dLSsqx85FXEuOqbo3pZPAgg5A05OD2AsnZnZiaIPxo/hILaWroANYpw2r78Y02bYcUt0
 HXNCaImhtwUfSlakGz/MyPWNoQoWZ6zkMtev6e8+K+QtTi8was0NlaM0jZ/7uaez9Dzs
 vYrPdIsLjp5JI8mAjsctG7DcqB3xVXyeFlJMLjz3WYs/Wt1qsfDMDk+14TdADMN3N02d
 9Svg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3BtGInfhFUVFI3nW7Ot/Kms68GF4RT6iNTHbCkijsya2WpqxxmK/xDuh/rYwpzEMlY8NPJ5exnOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsTF5ysnNpoXPOqp+KSbHyQrK3PK3DdrVZ04+5nJYFdF9v6xbR
 LMre6Gf1KhcIcaLBK+DsU+W5LWR73kOts/bcgY9dVV9mR5uP42uHuXO2U2o+FQ==
X-Gm-Gg: AY/fxX6+zltJqAnd4IXQl9XL1lISr+Y2zf50f8vyxrpDlTYXiyAcXiOJa/WhOm1TsaC
 J40Bs9ns7WeZwl9MGpNaZBRV1hwNV6ZY28FtKL/HjmKUazyEeNW4IK5dOWRKXN+IFAGhsi+Cq7V
 IpDtU6HuWIU0LLLps6QN/9uMz5nKkhv0Qq9FoS1F9q4GAvcMniitY6lGLO1S9/udr/qNCFJZlt2
 5TY4O7LCwZ4K1MAEW8ikQbodWYfsv8mnyNWOYDplG+IIrmdBfXQRi/IPE0ntrkS4ABLb1rl3eP5
 cAXfLa7sD8r3YXlW2M6eLlhO+bMgAKoGX8BSTvTuksAta0BB/MOhBileG7K9YtLrnsXJskcQPoj
 S4HKHJ/LiTxwjfT7MoZes/2Wiku9Ah4eTGFHODHdVyucWy8O30yXA7HhXojNdU6cp6lWI2fKCmJ
 3Ztrc9tCFptbhTgoTkARfhU8SU8OPn4qBVbelNcKnE5Oh2ThHUttW0S3K9oo8IM05r3aa8yze8+
 RvEM/fT32j5Rrh7YZ9dCg==
X-Google-Smtp-Source: AGHT+IHoetKCTy/pEDc32+prvwD2Q1RnoCrCBHHEv/M6mDpq1Oqnx5ryJch1QdsdD39c7PlRb7aCxQ==
X-Received: by 2002:a05:6a21:c154:10b0:38b:dd94:936a with SMTP id
 adf61e73a8af0-38bdd949736mr1217364637.24.1768296389614; 
 Tue, 13 Jan 2026 01:26:29 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:29 -0800 (PST)
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
Subject: [PATCH v4 2/6] dt-bindings: misc: google,
 android-pipe: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:58 +0000
Message-ID: <20260113092602.3197681-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v4:
- Use decimal format for interrupts in the example.

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
index 000000000000..9e8046fd358d
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
+        interrupts = <18>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

