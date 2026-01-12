Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB9D153C9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0810E2D1;
	Mon, 12 Jan 2026 20:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HItTFaVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D69710E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:33:44 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-65cf597a717so2882783eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768250023; x=1768854823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcdvqbOz52LfBLxCMSffSYUjax3JQUZoLUuen8kKWUc=;
 b=HItTFaVlb7fjHmG04ZghJzkY5g1hOgdJx1cAOGgHMTMJDgTsYGRgOjZnI80Z+mpodB
 dcHYqpw+hW1SpnWJ/wn8iF7ViAVU2I+vMjiucHOxDKSmSNpfx+r7N7jIWtswj/CsN2Fj
 2kHL9EJIvLyJ1rHAuRA2tqQeuYWeXChHS2r5unrARZzXO0a2CFqWhrecqNB4yM1QMNuh
 vyoer9FwKYdKMnfKNvmkdphPbWzQOHWor9W30z1o4yonotgB39MCZZ72WPp9gKKvqhll
 /9uah3Tncir9rhKpri2RNZcxeIvlJDFVGsWYTkvyEkIi9noRHx2fP635Wu+lJ7L1PCuZ
 3l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768250023; x=1768854823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HcdvqbOz52LfBLxCMSffSYUjax3JQUZoLUuen8kKWUc=;
 b=B7RKU3gbaMBcRMxrHT9gW64Fj7cn7DOKu6A2zfofoS4Wa/BEgWJzUaBmGjFIvZJVBu
 No5H9GknpTNQMihnxZydAh/ujSYBPd8l+53mdnBLUF5hSnfadiYyn0EoBj8idW4vFYD+
 qOf3edlNWqXvT4ZEdA4Q4gKNovgLw9JnXs5vd5kjXDt7NV7ykXPH4dP8DvJaIvxCaipu
 78iLb+Zr9Am8iNY+CNIHdYZ/vPrEVFmOsNu5/thMgTZn/PnqmvbLo1OSKg1fUNW+3v7W
 xzM1bAFzLz+OwK1rU9laifg6eQGc46ES74EARH0CZskhKogwKq+lSqcaNLLgrfsZ3g20
 /d9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGgKWFRUsNpqZ2mhXMA6qSw04fceAPt/9SHKHYBxyHTgYa0uT2s8RWY6bwpXMCCEftcEhCTCIfP0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOTZw84Ns2zXcniD78t4jnVmItQipLBCIfKmn2ir0tWSMxsiOz
 rhRLtXkSwtkrfap8GEFqVxRA3M7FMkT4nqSxAirWMowWTyyiq82IvohgGIepMw==
X-Gm-Gg: AY/fxX4rjkGyGMbFFwFjLDuiXWsKK7XSBFSPAGHCUkk4vLwYmax998yBixqy9MB9EQl
 ksEtZcPcPxyodCnJK/ZzpCLxhOf7iqemeQ5bfKaNsm7g5HTvx+Xn1WLbWwwEdZzegCOgzB9Soxd
 WcR00lakKq/AyupwfsdP3kNZQ793sf9zyvTPLhKDdgkHIXrff9Q6T+alcCFRdtWH3LoWNN/58pa
 k4nmfPSGnZELUexKJVeVTzn75URc03gKQ4ICDHsE7xj4qzW91bZhOcdGVGYaI8dKWlU4JrkwwlR
 bCW0pzHjgFBv8tArs+uDnps6QOqrzCi0ULrpmXSoQMwt7XrxKTKDO2kAQoYW0yBRc3KUQDINtUw
 VlFDAURQpYh9WMr1dYN4nh5Jzdm5tx8rimHq0oBnIBy9r60nneevFucc3TzTAwg8QTcfJrsXfHP
 yDXIauCklsOak9CcAFqkFQW2rQ6/LcbrG7Zg1VElLlT9LxUFpCVUpMsGEMOauwiJOH66FWdKKH3
 ONKjFcRZBduvXu7tu1tvSdfk9TJq4eh
X-Google-Smtp-Source: AGHT+IFk1Dr6wslFyNgQa2xGPUDljm9kHZ7BOgUopSMDiNk3ke91/OiF9CCfER+TuAOFwDhwgffkQA==
X-Received: by 2002:a05:6a20:9389:b0:364:13ca:3702 with SMTP id
 adf61e73a8af0-3898f987e4dmr16296668637.42.1768243926226; 
 Mon, 12 Jan 2026 10:52:06 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:52:05 -0800 (PST)
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
Subject: [PATCH v3 4/6] dt-bindings: power: supply: google,
 goldfish-battery: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:42 +0000
Message-ID: <20260112185044.1865605-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112185044.1865605-1-visitorckw@gmail.com>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
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
Changes in v3:
- Use decimal format for interrupts in the example.

 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
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
index 000000000000..634327c89c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,41 @@
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
+allOf:
+  - $ref: power-supply.yaml#
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <3>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

