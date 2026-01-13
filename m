Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8979D179AC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4B10E48E;
	Tue, 13 Jan 2026 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cvTU9vXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9D410E48E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:26:45 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b553412a19bso3302215a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768296405; x=1768901205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7EWk7TuRK54To9ZAGQlu+fCN9Q9oadA9Ns4P4AvNGA=;
 b=cvTU9vXXTeReIpQ21TnFTksHx/WIU0fraxeRR03AqYeQbn3g0/6Ui7EC5ophiii/Q6
 waj1eXsGF4bgbbevUgIF07xHxXurJq3FQ0/LiFkZVM9HvYiauLyH6diCJNFhGkBnwYqc
 s3quLsSbsi/xR/HTK6s1/QRP395JZPRJPNnmYWEPa/4+Vic7fg6b/p8uL4LXctoZ1B+C
 KaZsu+mLEtSGGmBjcqORrt9L4Lrw+lk1xXO1tJuS/X+QNsgLJCorQ4BWlmuYvSe8GqKD
 2e8qOnaeamAhQjuuzWVsFa9KdAlwhoRzdpXSgAXl/AZDYfzTifpZQek5x1i3VBVOuXXZ
 b+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768296405; x=1768901205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7EWk7TuRK54To9ZAGQlu+fCN9Q9oadA9Ns4P4AvNGA=;
 b=knqbTRdRzUyhSsyceQqDJF980RFYV5Ztza+djdjpaff3vp3vSrsOHQLYR2cyAKgrqa
 9QWEEmG9V6AW3ivEKj2zT5ReZVoeiuozd52IrUQp9hJ2MhLGcMQ2IEvHVObgHkaOAfXH
 10J69TQlxQaknxtKQJwIwn15ANDY9CF1ZKDznFOppxLR83cLdRCuu+ii9uTC5HRmNGvL
 XG5nBokqKy1Ild3y4+29wmEx/YRP9OWNsP6tcgZssZScgam3Y3j5gdLfjfV8TO7devNE
 nT/R74lRSmSkMBiEN2QfIpic1Vy4o+wrrhHAtCbDLIrh7Uuctp5DD7ATxTz81sEfDvft
 NlGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBDsMG1GjW3mtyG2T2vVPsGO9hbxcrwtFqBIXzfIsjVs5uFeIcoUymAuUJOe7at7YBHBJLYh4QXjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyadk/ERi6I1K6FetlcukrnSZiy05M6h029oSM155+EIITretLG
 sYNtUMYXsQpB4ewDI/oonGjyQbenzS2jAdvqHWnjjsPeUCYxSwLnOIgp
X-Gm-Gg: AY/fxX63TJKth99+Ywe4DzC9Pl8Iy1IT4CIafZABx9JL/j3i5ASWlZwaUugpJw024y6
 aG5Vq7UCkPWNhztpGDpsZgY3I7x9eYCHowFbV9UILlMwsPErauVCV22i1apz5WnGzXm297IAfoX
 nMvnhxCu4vRw0VtsaS3B1/NOl19AKC2lwjGANVcmy+JmI0lg5qq8uWyVZ4TTXtkSLnsUV516Us/
 AUAvc+4Dq3Xmr+V9TcrU2gPl0xaZfdAz0zc28FnnvyTUl0RP6PUZqgN2UMpxg2FfTbLOdVNBW8N
 fioTvZYzCHUZkzr6QVxguit5JvOvvStE4jD7XF4ZMncFRp9JOws5l24F64bA/jUPbxQrlhf8Sy9
 wuSRkB+zetKGAqE0SmrNStxPyMx8W3nBinrqVmUP8j2TCI7aj/UV3qlLbYqs5Y2swXIjZ9pRx5Y
 UDhzilFl2mFoeH56WsmE60seQZZWObymjH7EW/KN3fymtWu63zag94EqbGT+v7me+CuOVSW+N4i
 8ed3V9X+N4GwhBwP9OfLA==
X-Google-Smtp-Source: AGHT+IEUC0KJ50PkwzVSwPCDoxMcw68KkQ+8iOouE/4n+Sa2Bhle44HLNHQWtPdhk/bI7tQ9NQN1XA==
X-Received: by 2002:a17:90b:5823:b0:34e:6b7b:ded4 with SMTP id
 98e67ed59e1d1-34f68ccceb1mr17985068a91.36.1768296404680; 
 Tue, 13 Jan 2026 01:26:44 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:44 -0800 (PST)
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
Subject: [PATCH v4 5/6] dt-bindings: sound: google,
 goldfish-audio: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:01 +0000
Message-ID: <20260113092602.3197681-6-visitorckw@gmail.com>
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

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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
index 000000000000..d395a5cbc945
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
+        interrupts = <4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

