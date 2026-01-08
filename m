Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC5D01E10
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A809810E6C9;
	Thu,  8 Jan 2026 09:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fUqj+6yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BB010E6C9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:41:24 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-563198aea21so1326611e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767865284; x=1768470084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0UMQNQize8y0H61kPqmNx/nuhGzGL/JdEumTcbx0Oc=;
 b=fUqj+6yq2NAfjCLzQruYqx0iBcZk7CZSrMO6FQ+Rgzx8nPgMuyQiOC0oD2WbN0iP2D
 P/2RzNVe3VWdqSgec+E7U+kjF/kIUrnd3iAcMTmbIzvzmVc/hhxO6nolZtl/PQQySbio
 SELza+oAwWTg90y1W+6AjVfJO5C6rDaxPojfxQXvvRxuFU3pitf95Ws/icv0rqimEhZh
 0wGfoLaRbPdlXBLh5bLaCFxPCmYW9QHqO2iQ4dG6wPBbUAuhkoEZkmZaLkYfsyvAwnw2
 K1O03SfXaBCgHL/K4q61xQS1QdBcC8sCQhSlUYKBQF6MuFtdVKThte9Zjl/ce55+Kbwb
 nwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767865284; x=1768470084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l0UMQNQize8y0H61kPqmNx/nuhGzGL/JdEumTcbx0Oc=;
 b=jPvSJXJGuPlKqHWX+z5egJVnclhYnGN3zttfKu8yd9hB2O4fdHPTrvh9HcS4tn05BV
 ZAeHEYrl6JKiEIDjcz77X/qXmu871sOHQYu104GO209Vi2c0KOPAO+YKDtXN/Vr2dmSW
 HSLwUefm8tHxI5t9epMcjpxUz+p/No7VbxYcZhFQiwhoYWhKWNnFTB78W4nMgUlFkFPU
 z2GMyY/QNSlMV1iC683QHWLFEZrXjTmHTKnNOmk3OAGozeY+xiBmtejZ44G/WBkD3DLo
 SVlba+iySEtQIx+G54nr78gNH4OLchJaffVqAVzqkfDHqK9nD/Q09nLH1UZzqFzav3tm
 AOPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFA1YR/1gJeRHPpnrTfJ6aje97gWo4TQaWFdm37stC+pEc88TBEQsPzo8TiDVzCXr2HXijcMS/m58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbxnbW2PThb7twuygcox5HWIuRi+s+/XwIcDYfZaGqNV7xh4ej
 gNk7macP3Pu+aERCTA3nZV648ZuIOn0ooSuZumeTN7FVFZPSncBGKaFy9oe/lg==
X-Gm-Gg: AY/fxX4LysGQNHXzeMIn80qh3SeXfklKEjJM2fNZpK75G0GPijy7Xg7YCOizXti3lVh
 J5bJn7VO8oeTjpCjNct2kSajHsdFIIhjgVE3FTYa4LDgE39rMHw9PNIrlVFUdQEIcj/mEOSArIG
 hBgXKl7VsIaaGR+vzKR8pi7uzVTN35JOmmVoaZWKWTfDySAAKIN7okqX0zoysb+hUeZDkPO/Ge5
 kLYDVJZOmyPsgyuZmx/En7PlLlj/GA9lADI2rX/ntX/uQ0B7bPtwLYEv7Ey0eJlCGpv9fIAp5c6
 QhXedX1bM53QHrrPlRhsG12UgNc7eFqsvJTOQw7xIt0lFoE0eeUd1kjtYudWieTvdrYvPcdOB+m
 3O5P+ljSsnFwNfQvmvDG7bARfN43T/g35wpqOoefIWnX+dp3QJaUbM8xyISy0+dQ+4azgmMaV+1
 sfUoROU7wag/MfTjg4ZQ/qR0hhLnSyqSngyeZfJB15zgfl8NUnQzgTHVfHUFfr5xtnkQCGBA1+Q
 V2xbvl2kNoUYJTpjDnlKg==
X-Google-Smtp-Source: AGHT+IHZ2UUjx42RRlWVNMw3b1W04C9piTrC4WnPU6SDQCVTlKuzNskyckz41dtty4xhtSX8347Scw==
X-Received: by 2002:a17:90b:53d0:b0:34a:c671:50df with SMTP id
 98e67ed59e1d1-34f5f95c745mr7519717a91.17.1767859772019; 
 Thu, 08 Jan 2026 00:09:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:31 -0800 (PST)
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
Subject: [PATCH v2 5/6] dt-bindings: sound: google,
 goldfish-audio: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:35 +0000
Message-ID: <20260108080836.3777829-6-visitorckw@gmail.com>
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

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- None.

 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/audio.txt b/Documentation/devicetree/bindings/goldfish/audio.txt
deleted file mode 100644
index d043fda433ba..000000000000
--- a/Documentation/devicetree/bindings/goldfish/audio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Audio
-
-Android goldfish audio device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-audio" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_audio@9030000 {
-		compatible = "google,goldfish-audio";
-		reg = <0x9030000 0x100>;
-		interrupts = <0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
new file mode 100644
index 000000000000..e0b26c1f7b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,goldfish-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Audio
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish audio device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-audio
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
+    sound@9030000 {
+        compatible = "google,goldfish-audio";
+        reg = <0x9030000 0x100>;
+        interrupts = <0x4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

