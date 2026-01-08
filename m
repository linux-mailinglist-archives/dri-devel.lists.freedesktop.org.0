Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8879D01F1D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0D10E6CD;
	Thu,  8 Jan 2026 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZsPWjPIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC3210E6CD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:52:02 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5ed0bccd0easo972218137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767865921; x=1768470721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9Cv7mdPPcZ8e/4RiioRb+FP1zONlTuWhguDLBncdBY=;
 b=ZsPWjPIX8f+fShDCfHajmYq7+3+5UwrxvANRTVhC+UcFIvfWY1XxWpnW9NO12itJkH
 Noyp4tlsDbi4cICCKp4sefZ10HZ25oT2aX/25VTrqbWqczQhZPojVSZ0hiKp8ynq+KBH
 jQFT88U+VPLbfPTzfuwHqXrFKLEJxKjWnI2n1tnjCWkWqN+v1H9OWPEJsiZqkMS8rSHl
 OC8PHUbw5Kf9a1xEdIez9qxGDsfulhtGLyYHcBEB/zRCBSbVl7/utMLG2GTNsPpUwUBC
 1yrFERDwq2F5yPh5XfEwTRC95EnT1PcH8/xs0Qb1lkQKDTzvCFmhzgtBXvowDOkvYN+h
 wjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767865921; x=1768470721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s9Cv7mdPPcZ8e/4RiioRb+FP1zONlTuWhguDLBncdBY=;
 b=ifO6M/p3FuZslzf6VE3w7guWyvpbDdXZpkXzixVyBfL/beJCdvC6lVctPO1MX5m++L
 H4hjcb1xONW9yAOhyRtG6u+nIo931+nhci4SmxVf6nex5VB7AZ7zZMw8jfFuv2CIwAhy
 YR7Da5HUwFPlT2+0S4hCfHop8SrjtI2SabIQCp5gpepXPkEAu23g0GNF8cq3jePEPRRD
 3B4AIbYOqLhck6nkIKXZ4NLbp5bT5E3E7xOrf/l2suBUoTJu+vZikrJ+34Gguj5o/Ms/
 /D6KwvSYZD2NL8wVYLIBZzKkQHxAivORONTFBLjr0BzyVlDTqyjMXa2RbD6kFSiDmmrG
 xzAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKJ1L0pXuYU6pRU5GihJpUQaQpZ9EA2ptAtFV/5/4ly7oLpZ9SNXYdvP1x2o/w555dEcqNJEzfsDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlFGhs7U0WUJxtC3OCvyvhJHWg4mZ+Q9sevv7p+boI+jkwCfjl
 wLbbZZsyfb0bc7wMYxx7WiXAjclw2JFsxrAwKxylTzKeEk2M3z4kIwuqxhNhAg==
X-Gm-Gg: AY/fxX4kvtm8Usqu3jqkyiGgJvUGV4erCcqXNjK1EBEo/ux/UA8j0NfrIeX9rZOnX8G
 372P8aWXbTpQJVUiqryq5Wj9kSS5Mtx0F5Mk79taALYgPOfAauZdlUBXMYvCVUqSlm976XfTjMT
 TIDoJsSgWgRnlaYKzWpBc6h3OCTUAlgFeAEWnuqd4rZRnXYaQKgUNybmF2UROxCNWUe4ZQKJdEy
 1eQmjFi5drXwW2py0o+/oGQec7pWBotOxN9WFPsa+Hh/S11innv8geGL9L6MtH5bHYytagB0gRM
 sBxYcKQorPMfJHh5yTwHxLhl4WjKbyBmEPrWOgdPETEdGUPoPMrHDtgxqjwsGylixV75xZAyR1k
 1TV69TjBiFRAQhiCO+4+YNTTZVv6PwucZuYVo55yNQOFG+v+zsSEC87doaPCLz0ppwYwCTbYMyr
 QJ3aokDchl3qBdii9IY3tW4MRtct+RYW2N7H+RcFGMt4lXdlMCojBuw8D/rmdEwOtOKnrDEr0Xa
 oPQAnJV/5aDeMRiu20Cbw==
X-Google-Smtp-Source: AGHT+IE5lf3uPbw8VErEKzhFGGbzHGx8u/fDHReHMHASFjL4yvedLS17Wjxspaaf5SF45aWguaeksQ==
X-Received: by 2002:a05:6a00:8c10:b0:7f7:497d:8118 with SMTP id
 d2e1a72fcca58-81b7eb26e99mr4452899b3a.7.1767859776927; 
 Thu, 08 Jan 2026 00:09:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:36 -0800 (PST)
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
Subject: [PATCH v2 6/6] dt-bindings: display: google,
 goldfish-fb: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:36 +0000
Message-ID: <20260108080836.3777829-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- None.

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
index 000000000000..48b9c056d9ac
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
+        interrupts = <0x10>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

