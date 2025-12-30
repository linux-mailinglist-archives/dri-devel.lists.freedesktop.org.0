Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE9CEA6E9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1343F10E931;
	Tue, 30 Dec 2025 18:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U0Y6Ppbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C310E931
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:00 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34c708702dfso10768328a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767118260; x=1767723060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiqtyI0E+EZ2TXt7IOrDDwvPaZp+SknY+Ea1unU062o=;
 b=U0Y6Ppbs9qidGs9fVIqJGLqRcw4ZloOJNIpUeToWezg2DIkFR/AbyKalkae+kS0sD+
 FNhkumWTTBeFOJPkzw8icoUguvJAwEJh+RPvpHm2LWNcwEnY/xoq9JBbsXgRMdWkpOpX
 fNq3FZ6Q1wdeAiDcnGAi0wzeUCDr/0V5JTCP7s8eI/LDqeoyLmd3WiUVdLNUl0lEAiGX
 iO+ba0CGdrhEtWb3/h9yp1hpyvv9BkoPQVoPcx8IANejENBS0vEvWNDxkJSWnXhTBQ3Y
 vY5HF2DiVktDmibxdjS8S71qw/c74loosHP7jElQXuZMN5qLQOILVEvUe2hnDcvseW3p
 /uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767118260; x=1767723060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wiqtyI0E+EZ2TXt7IOrDDwvPaZp+SknY+Ea1unU062o=;
 b=Sw6pDI31fZLV3/Y+R7v5iHXPOhrLBgYsJ+wTvOeDkWZ+oOodyGwyX0FpE5GBtmSNo5
 MugdaIJY5kPT10FYlNZcvzPkvbpY5RHJWvuNx0F10MobeXv6FGrbgqQVLuXFFTyvFVcQ
 QRobiHGtTyUW9uh2YlZ4O4XZvY4uY7gBQJHBVO0lxn9S/8DmXHSPMP/Mv4sbYyWFrxRO
 LVzsQaXAqgxCmzIRQgfmKjMs+GrtcF3ZT3t+S6Yz5B8A2PlL6WQ9SNbYXGSGaKpKAgi7
 /pBtNsAzb3slZ2LMZqrcE56q4pydTml8eOMOEZgWJRK9TA2xSdbJkW1lU5LRxVmBAc9Z
 6RWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCSL6dMIb13BNahNj98zb3PDQpCdKr4k9rPBDqHQs8Oc73RAMXfGeyERhLSyNDqqlYZq5m7aYX+gg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKczf0WM79brFQETMWebdgVoge+4AqgaqOltMGVG4Vngbgj7Gv
 NNFsoOcNEvz/YYCugMLnpvYXl5IOs90MsELQ6F9cME6GOI2ecaAhoxkv
X-Gm-Gg: AY/fxX5dx9eKlOtHLdKqDPgfQGA4EhPYniQWzn8BvhUyNAVBa56AKrI9lDwq/sU+afh
 RTB8vEO+7eH5Nit2ZZ6Pt5Ax5TkYLVE07puEJAHXOr5/lK74jRPhe+kPhMxWhoeCLoMYiqS72l+
 cD3KbS6vDJx/4LVNB5Ovrmc9vzmKNUSitm7ZzXJzjdJPtcI8tMeul1CNten0gEtzJhEOjDKJ1fh
 ylfVbEMFBUqPUDXUI9A09VK/Sm+odOclFnrj5vIi4BNPL8p9r+4LhGje0arFEpiXQ0ORp1CfXxZ
 DTN8IUhDeXkdZHh8v9h5yGJi63OGKxltC/IWDzbT5lKXiVCNIirdvYngDgJOtOQkRvhlg+yv5hE
 Gtr/T5WI1t6hcUusEDcfMGSjca6LTZBbmXcizbhs7dZ8f/KSSrts29dBbUbYnkmdCkamgs11jfv
 itEbDEiwbJ4+jeNeik9NgaQ/4bp8a38cTexfld0xzjaogebVFxpS+tJtiXyDKiveI+3NsAQWEHF
 ZWsXMb9Gl0mJE1+aNZyvA==
X-Google-Smtp-Source: AGHT+IFysb5O/IJUVTITdM4KylhE1TplZEdTk/XkUcd/+h52MkW7iQODmWt+Z3OinYOcQ+IJmSy8Wg==
X-Received: by 2002:a17:90b:1f86:b0:340:2a16:94be with SMTP id
 98e67ed59e1d1-34e921137c6mr25807297a91.4.1767118259879; 
 Tue, 30 Dec 2025 10:10:59 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:10:59 -0800 (PST)
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
Subject: [PATCH 2/6] dt-bindings: misc: google,
 android-pipe: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:27 +0000
Message-ID: <20251230181031.3191565-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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
index 000000000000..12b0cfc815e4
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
+        interrupts = <0x12>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

