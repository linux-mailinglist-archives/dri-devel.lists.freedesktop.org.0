Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BDAD15340
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BA610E2C1;
	Mon, 12 Jan 2026 20:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bt5MnR+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3A10E2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:24:59 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4eda6a8cc12so78858431cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768249498; x=1768854298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MnJl4mjA928H7c6+CxPcUynMWnjGzO8z//ft5AvFLSQ=;
 b=bt5MnR+xcbdBJwHDTcmGnGy1SU2y28I8aR7WXscNLv2X/Jwt6GRd5RtT1LPCutY53M
 65MonTEWxeRfz/8qtkKa8XCaQ1zew53H2pKFl5BxI7QBSZSTLdSDUlAdJNncVsF5BGMs
 J0lqnEJg2btxC3DM+LBi+DdTMBemKzxRtsaQQQpcr9/1tPYuDqiP/vvBEF5wYteCjipm
 4gJDI5Wnws95wCT6CXw6ZZyl29NtHrrGeQJnMwzs3HlJu1h/HqsRdiQt/aV3U8ResSns
 bIIrl+P5vH5COzMxlxYGtV6Fga7RWqI3DOiJpdQm/ewXKjXP0yOkHy2GTu3K4L6JGYMn
 gXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768249498; x=1768854298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MnJl4mjA928H7c6+CxPcUynMWnjGzO8z//ft5AvFLSQ=;
 b=K86VKvzgpfupbgTX+TLGWIwC2YlmV+KvWa53yexLIvIG5eK3qqE7/7xBl2I4zGugUA
 5q0jI6Dvgr4RgbwNOJRBrbcnKjepA7VjgIsPhKUlna+A7Y4IOzVf46W1TQgoFcf1Bfs/
 f/4tlQDhURmt58lB786KxDhbimhp+orufjiHqEFnfYM8n5Q8eCyKCgUubkb8dQPsUVSA
 Xo7TQ2AlPw2TZQI6EErBMT9WN919nIfaszW6YI61LiYADGfUevsCP4HXZ8YD2ixr6g7A
 +R103q8vYHh7dEASoXPob++aMKu199F81tKHfGtyfp3Ilck3PgUFQSrqyl1t445bNikO
 6qQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOQ2n+F9qBQokvfwYlYuwE6RSPoxb6A9BFKzKYFkx+HCo5M2cubU+pCWN0pTFgmX/Mq8fstmIN3UE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCdQDRwyszFPlYcABeQw3KT6EiN3uFf1QsQpqzoIEeIm+48SrY
 Nflc4YyEwHPSPgi8R+o3SkGHail9ZokwcWEf5bHtyQBCY36KolFVgd9F6sJKvA==
X-Gm-Gg: AY/fxX6ohh3wNfuDHTJUDlSAFEKBPeEgjFj00AS4x6PiDC5kOzVZQ2GDOaXSkACwm/Y
 sSS7lArL0xRat17FtD6fxsQwi/ZdVoriHu4Z9RbYssDBOKFz4qISQEXlvuk4h6+SsrCac7CPVS2
 eq3dVQOZ6GR3zJonWskzk5rrLpWraiOeqxhzvUSIq/8CDju8WJ8IxENF/otk6ZEoPYMY+wuIP1V
 YSbS9dW/qz46DMOuPono8nMAjQXbvfiWLOskBqCt9i1yH1Ar41zxYZRFib/anhOHp0c3IRU4XLD
 6QezdTrVS0vWL23kNoIB2wpGZgk/MsZc1kZkLJkLrKdaGFaoBiKGOnPk9RbM52lt92F76cLvTFr
 lTjD3NC/SeBBqhyMVYC3+GABrScZKyDDOHoqUe58xf7nwgxZbQfjYSoSmydELoNmtIjkWmUJkQi
 Xfv3QdELZbJ0OEvDsqHc8RLbH5mAtVR/pGL62H+DQ8CJqXd6jpoX9A2BNuR+LD93r/N0X1A9e7g
 NwXoY115AygWlt4FsCxHg==
X-Google-Smtp-Source: AGHT+IFEOJtKiZOekw3QKky7cg+SUdsdDlCfIy6gQ1Y92OIF6fv5PXYBPdHBg9wlGXMZd4H/lsyNmg==
X-Received: by 2002:a05:6a20:3952:b0:366:584c:62fa with SMTP id
 adf61e73a8af0-3898f9053f9mr18835078637.21.1768243935601; 
 Mon, 12 Jan 2026 10:52:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:52:15 -0800 (PST)
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
Subject: [PATCH v3 6/6] dt-bindings: display: google,
 goldfish-fb: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:44 +0000
Message-ID: <20260112185044.1865605-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

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

