Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11C955DFF
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 19:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DE610E034;
	Sun, 18 Aug 2024 17:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K0yVESln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F2F10E034
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 17:30:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so38785795e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002207; x=1724607007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0SCaR0GRkiuZ3/606Q3dnjpJljwAy9G6Uqg06n8FjTI=;
 b=K0yVESlntg1DoFvql0JjBKvsPm6A/nvY6itKU7KYkKzGhwdBDxXzZxD6haBJ470yJ/
 9xVjjOtBPtvAhLvkqhn2b65iG2Pz91exmp0MSVrKYuJ6j5LKKAOjPeNn5gJgAVovyPXI
 hUj8FLvR/LpJzY9zQqzJZkehawiKZ7YvtGCXGH6IOqP72AzwilZBK/ovPppyA5dyCdpm
 F9s97vK6wK606ncpyhT8yqd+kWoAvSH57bTWZf6NvCJEoTQrJq3EuG/rDWAYPed99AKw
 W7N+F7Xq9Pt9z1pVFbXl2tN4AWaykHvfW4Z+d6lZ8f13A5vPD2q2qnXLfLP8HQUP2hJq
 3p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002207; x=1724607007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SCaR0GRkiuZ3/606Q3dnjpJljwAy9G6Uqg06n8FjTI=;
 b=gGUhDlVLcXrdeYN3pC8JBTt0IAvwKnu/Y0mHRokR3DC4slJRMeyYgOsUcn1Ebd4GEb
 j78k4AQgZoz5zpxOLbHxtgPJPHzbn/3Z/EICPIregAIMaSey+WGgvvl7tcv1YTvncYMD
 sDA2/t0aHrV2JahASlG1LWPKdzZ8qPJsjD6187o+ZIkGAY38IDFeANiDJMMzHN8jNw8I
 wzGanuKJmr8MBHUQo7+zFXPorfr1GaUMafPvKz4gXrQWTqhcLLSVjhrkfIVU51PW42HR
 tTxiNTFVT2klPONMo8cBUzCjEwDy+zol6beBjke4Ikkn+3KZz78vfWLzs6oMAXDD3vZr
 cWEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7aNOS+oiF2lWHVO6IZQU5NPK/+erYjBsFYI6CfoWINsY5HlOmre7Ws9B/hsVDU62RPz2lilF99QWvSEk8uYeKrdZ7G/8kpnA+7/yS4wV7
X-Gm-Message-State: AOJu0Yyj+fhX1KIRpD2GQ2BpxVUG4uWhn6nEBR84nzKuzYy+iAyYj3zM
 s9XKH1ZbSIxKc1bBgXcdjjqvJktn7BZ43MpcpuPzKPtE7T1jnvkN0e4OeWrJzQM=
X-Google-Smtp-Source: AGHT+IFWjUiXv+XY641Ss+KqGOnh9S6DjOSW5fs9xPdNg3xhxyfOeVQlO4q1nl00fAyX1GYXCteCkw==
X-Received: by 2002:a05:600c:3b26:b0:426:6f87:65fc with SMTP id
 5b1f17b1804b1-429ed7b6a3dmr70242785e9.17.1724002207227; 
 Sun, 18 Aug 2024 10:30:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded19839sm138973805e9.6.2024.08.18.10.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display: renesas,
 du: narrow interrupts and resets per variants
Date: Sun, 18 Aug 2024 19:30:02 +0200
Message-ID: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Each variable-length property like interrupts or resets must have fixed
constraints on number of items for given variant in binding.  The
clauses in "if:then:" block should define both limits: upper and lower.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/renesas,du.yaml          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..147842b6465a 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -173,6 +173,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -228,6 +229,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -281,6 +283,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -335,6 +338,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -396,6 +400,7 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
@@ -460,9 +465,11 @@ allOf:
             - pattern: '^dclkin\.[0123]$'
 
         interrupts:
+          minItems: 4
           maxItems: 4
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -489,9 +496,11 @@ allOf:
 
         renesas,cmms:
           minItems: 4
+          maxItems: 4
 
         renesas,vsps:
           minItems: 4
+          maxItems: 4
 
       required:
         - clock-names
@@ -531,9 +540,11 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -558,9 +569,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -600,9 +613,11 @@ allOf:
             - pattern: '^dclkin\.[013]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -627,9 +642,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -684,6 +701,7 @@ allOf:
 
         renesas,vsps:
           minItems: 1
+          maxItems: 1
 
       required:
         - clock-names
@@ -719,6 +737,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -746,9 +765,11 @@ allOf:
 
         renesas,cmms:
           minItems: 2
+          maxItems: 2
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names
@@ -799,6 +820,7 @@ allOf:
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names
-- 
2.43.0

