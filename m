Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38297E9205
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CF10E14E;
	Sun, 12 Nov 2023 18:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DF010E14B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:44:12 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a82f176860so43129797b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 10:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699814651; x=1700419451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URm3aBGEZMYGVmdKlbcPoF6bMYnpimYDfI0RPBYPF7w=;
 b=CkGLVAfMccLF0jYKq4CYXPCMx2a2t+txX3FLQBtbR3IAOPmpJvhtYXpw3Qd8wMdTMD
 vVC+drlIFxQ3apDuvbLSUGFRN6vy5MCSoY7PMYMafKCdroPvDrFYOuMSxZRukwfaqcNY
 PeyVTk/STmLWfjhNrZbvh1hx/Y/ZP+Tz0vuC7CRn4bcHlJfNB9yLIsFmo7Sr5rQ7ha02
 IpAnrDXp622z1oFc5HZP9PMqY/74gn2Qj46HR2pFcpQPsG2VHzpQTJU8f5UiIN263uQN
 1gEzctsehLL061iCIJO+KNnOkgaBmM5UoQmo+urb5mRGjzzrzmHrjDYsXR9acORyNl+A
 kZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699814651; x=1700419451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URm3aBGEZMYGVmdKlbcPoF6bMYnpimYDfI0RPBYPF7w=;
 b=EDJXyFTDI+8j2jZyfPfw+tIXaWt7ux4SCzfQnMJNDbHW75eWtkLzS9eR8UtuuERiUJ
 Ak4dNncmwM7fk+hjtHifWNlNNHYt5sW8HRlBqj4l3g6psxGJX6z6p8JCjfKDYKrGBeOx
 Hwn693eO9V98XhZxwWqKJBfY+chox4Szh2QIlILDoVV+FqGH/rKfxEFrcAuYnN1MlRW/
 wBFiTPI0JfLWZXMeKT9W0hx1cP64pj///IgVTMw+9N3k4OXg4mKRb83NltLHXXT2PSal
 MH6W3Fhg1Ne9lK0hCzPjMtIJoXEaGm3H599C+mGl8GLoJB26M/PglEwkN9DKjWTi4mJv
 5w2Q==
X-Gm-Message-State: AOJu0YzxdqqRYsOOOu8WIJSjlhwNERAnKsUk4WMtz88vronT/X+ajIAi
 Q/lt4UqR6DPu9BAT7XYXeK+bTQ==
X-Google-Smtp-Source: AGHT+IEMgeqW+UHzIGW9S0MzgXOGTEehvymLNXsNHGrBqS79/kki9bEegn1CH2pjln/EBoRJFDgiAQ==
X-Received: by 2002:a81:8704:0:b0:59f:519e:3e9a with SMTP id
 x4-20020a818704000000b0059f519e3e9amr6022964ywf.20.1699814651559; 
 Sun, 12 Nov 2023 10:44:11 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.170]) by smtp.gmail.com with ESMTPSA id
 u63-20020a0deb42000000b005b3f6c1b5edsm1308938ywe.80.2023.11.12.10.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 10:44:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: gpu: samsung: re-order entries to match
 coding convention
Date: Sun, 12 Nov 2023 19:44:00 +0100
Message-Id: <20231112184403.3449-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Devicetree bindings coding convention, as used in most of the files
and expressed in Documentation/devicetree/bindings/example-schema.yaml,
expects "allOf:" block with if-statements after "required:" block.

Re-order few schemas to match the convention to avoid repeating review
comments for new patches using existing code as template.  No functional
changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/gpu/samsung-g2d.yaml  | 53 +++++++++--------
 .../bindings/gpu/samsung-scaler.yaml          | 59 +++++++++----------
 2 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
index e7daae862578..b6951acc7643 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
@@ -27,32 +27,6 @@ properties:
   iommus: {}
   power-domains: {}
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: samsung,exynos5250-g2d
-
-then:
-  properties:
-    clocks:
-      items:
-        - description: fimg2d clock
-    clock-names:
-      items:
-        - const: fimg2d
-
-else:
-  properties:
-    clocks:
-      items:
-        - description: sclk_fimg2d clock
-        - description: fimg2d clock
-    clock-names:
-      items:
-        - const: sclk_fimg2d
-        - const: fimg2d
-
 required:
   - compatible
   - reg
@@ -60,6 +34,33 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5250-g2d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: fimg2d clock
+        clock-names:
+          items:
+            - const: fimg2d
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: sclk_fimg2d clock
+            - description: fimg2d clock
+        clock-names:
+          items:
+            - const: sclk_fimg2d
+            - const: fimg2d
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
index 5317ac64426a..97d86a002a90 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
@@ -26,36 +26,6 @@ properties:
   iommus: {}
   power-domains: {}
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: samsung,exynos5420-scaler
-
-then:
-  properties:
-    clocks:
-      items:
-        - description: mscl clock
-
-    clock-names:
-      items:
-        - const: mscl
-
-else:
-  properties:
-    clocks:
-      items:
-        - description: pclk clock
-        - description: aclk clock
-        - description: aclk_xiu clock
-
-    clock-names:
-      items:
-        - const: pclk
-        - const: aclk
-        - const: aclk_xiu
-
 required:
   - compatible
   - reg
@@ -63,6 +33,35 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5420-scaler
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: mscl clock
+        clock-names:
+          items:
+            - const: mscl
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: pclk clock
+            - description: aclk clock
+            - description: aclk_xiu clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: aclk_xiu
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

