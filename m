Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B716CEA8C8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 20:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421A410E947;
	Tue, 30 Dec 2025 19:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KbvTUs85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8835710E106
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 19:45:06 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-65b3d3ac972so5357153eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767123905; x=1767728705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83p8xxawIJkmopSMpAdalPGsHw+uQLv1ciZtoS9EH+c=;
 b=KbvTUs85bWEUqQToTMlEnIl723XgGnlBxBqJ8I3892yQRw4E+4fNTauui9DKRX7jfB
 5M3u2oWqxOeuVG7IYuMhkhgykCB5DQw3Lwy08NLWTU+dhIbl2oxXftdYoKh+FamLXeeA
 FU64m/VPE9Dk0uFKJrIfJxVJsCbmnUZDagtSwtSqAi28cHLUF9t6mlIc6lBFSd8aIX0b
 s4ru+VPm+2ppDpLE65hItGGRk/3jmzxdMbxWpWB2sADhUSydoDS74HPQTUeTPaCw0Fc5
 KNXkzcSWF5tC0JKWs78s7uPcv9fPeiZA9v19QypZ5F/VEXlet3T5YnIM33AJ8tbVOLX+
 SSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767123905; x=1767728705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=83p8xxawIJkmopSMpAdalPGsHw+uQLv1ciZtoS9EH+c=;
 b=Mh580z0//A46a66MrwLk03WFJ+oDgPw8VnfHvlfyGyU+Q4VqeFsd+yJsLZ2rHyiE8D
 7QApD/arxAt6857WKu9s5x5QkCTVtSLpktRj4ujsqFAmFaMEBKpcjyJHlN3ZB/Ibnks1
 r7wSWi/3oRcnw5RnRHyWHDeK2cDN5DGTHTVpr1OlCwKrX8ZYCVgEDfRN8zlsCleBqAGH
 B3UTdEeMZfneiHo3YJQueVfmFwFLhBA8RcQFhF9PrHCx+bXNr2GJ/a+EQMYvIk776Jwi
 2vM1KQCvU1ZGPir5p+Su0MAWitXpxvKxaTxvi+RG5Uz/j1TR1N5wgDLDuvmVG+94kGDY
 yrRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8XEFsE0XR167eQD7XXVPt4SAUOx5dK+2TAajEAxIr2XyGlScTilIV+gOHpg9c/1CJezyZdp+SahM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIX5/1Pj/0JmMsrJOqqXwEOvze6dDmyImhEffMTtttXQR0eI6U
 7ZHIWOorKo+C5+GZWXoJb2lpYVbQnYfYbXAFqHL/J/Mc/HEGxhixMI6sLFbb0g==
X-Gm-Gg: AY/fxX5s2rQf5BgI8HirJrVmJWi+Oym/0PE2NPtovKQaHGCGvBzdg4tmnZFbV6plW+C
 BYMEK0a2+s8adqhZdv7tgOk7gjhB+5KmxoS00sIl4yvl3JoNDkBGr1C/a7MqAzAIGh7vQRiNRGA
 GnGhRQ2Z/Y0COp/s1jc7R4CCvNMQpSf5APwuZa/u8oriHXVVRz/GWKHnQ4jFB9NSTEt3JdMUk0c
 hIz6xRtRuZ7qDFu66T4BmJoLjbvqqAOcq9kjgKdlOJa5eIxClAcjnAEl/jhAzHQBXW1y/u1rbdd
 m3X+4+q3S0Q8yj1zfJXwsKCrua8tBJOQm1rEEBmxskfrGMG1DkELpiGWI5sHzOS1fSVKBtoeJ5q
 WVFQRH6jumG7u4+KjnmDZI+zcpLMVO2j8qeFwAhYljJbsWXoOnj2Qge+b8cyvDgOHYvbR03/xGi
 EIghRlmcVxABDyAyLfeG8fm2Nk2BK27HYn94435VBu0ZWwehkA0etvvfjVhjVIxS9tDaUZeKywu
 WZE6UycFgsNonU9Vx4d/A==
X-Google-Smtp-Source: AGHT+IFIRsb1yFLdQjiEzch59E2/VO7Id1WJQzqg0S6DL4+slVXOXOweBZRKfGEK/PtM3/p1UkcWag==
X-Received: by 2002:a17:90b:3f08:b0:341:8601:d77a with SMTP id
 98e67ed59e1d1-34e921ccb3bmr30732436a91.29.1767118270582; 
 Tue, 30 Dec 2025 10:11:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:10 -0800 (PST)
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
Subject: [PATCH 4/6] dt-bindings: power: supply: google,
 goldfish-battery: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:29 +0000
Message-ID: <20251230181031.3191565-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/battery.txt  | 17 ---------
 .../power/supply/google,goldfish-battery.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
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
index 000000000000..a7c98ef56201
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,38 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <0x3>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

