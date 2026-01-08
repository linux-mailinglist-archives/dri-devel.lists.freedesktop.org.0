Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9848D01FA7
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BD010E6D9;
	Thu,  8 Jan 2026 09:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iVh67l16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1254810E6D9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:58:16 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8bc53dae8c2so412257885a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767866295; x=1768471095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jVrer7foxeDXiFbFRi4WTYBqb7mxG96n3TZ489PhHs=;
 b=iVh67l16zQdMow3prHcBAfYBHNPjK5TqarqISjwJW0wP14hwVoNOCDul4sFuGJSoX/
 dAPQqfwmKoaOeruPSm83jHS2NgsKkccK9Na4io0Tn31hxnk1Cwq9ofLPXLIM3zm9ws3o
 n2qA62378NjcisV0R1idsQO+ewCZNanh5kzBbdf/d7CzyfqR6G92kXKbpKNi4LoTfFqF
 DZ5lyFsaveAMrw+23RhIhmDMlWB80/VYMKnOJLmyU7BII1hg4rDHw0vNkTp0O6koePGi
 4JczBL0FFEP+84nyI8zw40VGXTV6UjRUSKPoUd6qFpPkHSLCd9OguN4NZrWgTUyP0vEi
 kK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767866295; x=1768471095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3jVrer7foxeDXiFbFRi4WTYBqb7mxG96n3TZ489PhHs=;
 b=G3q82VOLGnhGBGV+A38V6Gzpugg5KP4Qwv5A8dQAxKMobH5Sx9nM6faHnDqQTAuA3m
 HQl1eWGxcsVmnWUngNsetLnTGAomheJr5APaAg+7Tu/Oq9iR9yQQXJQKOF28FtQ0/Zdu
 U9WkCBwaS3F0MmdeXlc/Qp/ux0RhQ6QZ+6pyc0neAsFKRbFPhKNV2YhjDVtPz0wcjNhP
 bDAcmq8S2JBwNsnHHt3cX1GORFYHVSF1j3N6ohXa0LG2EGzi/NdmEhe0ytZ9JZo5Msee
 zUkVZDFb87qy11MpVoeeuNOkXxUp1Y5PZMYpmPrL2QrkTV9qdS47ZM8dX+iKifttE8xp
 TStg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYesFRFRl1PJwkjfW4V2lCqDDjrbvAcvjg0+B0ySl0r1m3wqOx3ZznprVNItQTzxOWsBSqSjtqlKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPLjy23oWyGcmLR8+oeqUocdEnkcoaVsMBZ6yqhW1+3uM12H1f
 IMOE+x5ifhl8xOXgsfvmhdMSI7I2cnU55GdNVNgUE6qUvIPTGCgNmkbi
X-Gm-Gg: AY/fxX78IGtJmDfqXAeUxioxqVKYSTMeowgeL657yzbQ1WqMPlPZ02FfCGQRpvW9Ogt
 umCouqhSSDrGL7sQur7jAAY0egg3NOxdS+C0x+PVTdA9Y/VkqqNGaRjwVDaEwJoMo3Rn3Q3UjF8
 EyHc5bKgBfG8A+ST85vXqhW2X8PfN/ru0nWwR1DTbkco0a9Cs+GQsPGH9vbRp7fCNfX0c1CsbLq
 vxig5N4+Uyh3f28MFI4WTjWtcT85ai6r+y78mbS6eg2gXEik9flD7IjDMrh/bOPAqFOwUcbKlsL
 gZQDWPiglRJ5Pmtjmo/w4Mi9hbYQyB5EBA66cFq1YyrdtdhDmvkjL1Ktj2PcTXXpV12ao6CP7Wi
 HuKVEYJ1C6UpR6EdlD5o4x9vTiG3mH9RV4dncM6s0OnwqV5TCtopDIVYCVabjItN6A8AxGPukZ2
 I3i730TqBLWN/IiRKfauwMbnj5k86W/JnLmiOf4AD5YdMsJG6Fe6OTIFYrM+tJVvntA2omis8SE
 Si62KgSe8ls59I4JawMPA==
X-Google-Smtp-Source: AGHT+IHrWmrWZovQhYEcCj3OW2qe/OMr35yE9xC18wSEU8hxPlfPFqonbAeAYlH/zyT0y2ccrqO9lw==
X-Received: by 2002:a05:6a00:9085:b0:7e8:4471:8de with SMTP id
 d2e1a72fcca58-81b7fbc91b7mr5136728b3a.63.1767859762235; 
 Thu, 08 Jan 2026 00:09:22 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:21 -0800 (PST)
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
Subject: [PATCH v2 3/6] dt-bindings: input: google,
 goldfish-events-keypad: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:33 +0000
Message-ID: <20260108080836.3777829-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to input.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
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
index 000000000000..4d359c9be600
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,41 @@
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
+allOf:
+  - $ref: input.yaml#
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <0x5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

