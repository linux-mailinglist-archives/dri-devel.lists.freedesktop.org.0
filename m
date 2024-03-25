Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15675889AD3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219B10E740;
	Mon, 25 Mar 2024 10:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JdvISq2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3698010E73F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:36:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso5676290a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711362977; x=1711967777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzqGDlYO53VtpNTfk9/2jQSIhaYzka5q6tmocMJNTUk=;
 b=JdvISq2XCcJNpSChbqyRZiuIyJAZ2ZkSqLshiqsQehUb9XWXjdoeSIxsmfrJlyTb1z
 MYRdnmusuZm3Ne/rrMVpqMMeFKqhlqg5vdQlKZsg8IqQA92QBwTV3a9og6ASvbCCGuiy
 TaZrSk6u4cBez30EOzVkHTrL1am/3zSLhjJfnWtzktj7xgW9zpPaMVmU8VYFOA84lt3r
 3r9wdi8lA9x+bZHAZh7VROHPmOWrod8dcW3oMzuT1kKgRHBmdjjfLZZNJtGMfGHjSZG1
 H0blzoPMC2rxbhJzaY2gkSBTs7oLmqq6zOGCsZqjYlY7dMLXpfr6JSjEck+zRGcDXJsJ
 7LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711362977; x=1711967777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzqGDlYO53VtpNTfk9/2jQSIhaYzka5q6tmocMJNTUk=;
 b=IGzf/UeLs8BzB8ZR2F3vgnXTnDOh84y5VuIu80o+MpY9i/cOvF1rThsuGk/QkAyXy8
 aNnPURMWp5zrWFygFfRUgbOxa3epqIejnwfpnWTbJq/Pzb8wd+CmaAI5GMuhpOFpyskg
 wH8KjcEakU6ljH49jIXp5oZHiphLupRjZWTcYLMsP/eIc2D6iYYpMOoqAwRY0XbzUa8p
 6WljE3XvnUsEnXzJYh7T59KJGoWmOZbEgm2DHqVRut7RyyLbQG1U/8RBpRyEnZ++RYZP
 gLYTeQsVPbJ7YHsKI+pQW0RC/v1fDLASn9YssDKp2PMewYukbYKxofXosEzktgppjxuE
 qT+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBZ5B3/bAgRdOBsw8IjeSW8AcNs9/HMerNv0hJpzOregEM6k/lSfi8WSFBWVwbeSpx52dvVdjtSIkt+D9qek+WaWd7BqvDynKB7Da1rn7m
X-Gm-Message-State: AOJu0Yy3P3WdmNvjXBzqzy12GOhep13a+jVebzhMYRtH3CxEhS7fEYQJ
 kIZUfgUv9WKBSqYSbhmkQtCaIYOJ1sxJa/e+w1y7NV8561HCNzZPKRPH2fqc7HM=
X-Google-Smtp-Source: AGHT+IETJftRskEwl5RpRH8gvHqeBixLLouS91glYunfDQKwsjow2ORhmWr+ywgqdej1UpqdN9epjg==
X-Received: by 2002:a50:9e45:0:b0:56b:cf42:bcf with SMTP id
 z63-20020a509e45000000b0056bcf420bcfmr4231366ede.1.1711362977412; 
 Mon, 25 Mar 2024 03:36:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 dm28-20020a05640222dc00b0056b7ed75a46sm2827319edb.27.2024.03.25.03.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:36:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v4 3/3] dt-bindings: display: novatek,
 nt36523: define ports
Date: Mon, 25 Mar 2024 11:36:11 +0100
Message-Id: <20240325103611.28240-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
References: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
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

The panel-common schema does not define what "ports" property is, so
bring the definition by referencing the panel-common-dual.yaml. Panels
can be single- or dual-link, depending on the compatible, thus add
if:then:else: block narrowing ports per variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Rb tag

Changes since v2:
1. Use panel-common-dual.
2. Add if:then:else:

Changes since v1:
1. Rework to add ports to device schema, not to panel-common.
---
 .../display/panel/novatek,nt36523.yaml        | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index 5f7e4c486094..bbeea8cfa5fb 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -14,9 +14,6 @@ description: |
   panels. Support video mode panels from China Star Optoelectronics
   Technology (CSOT) and BOE Technology.
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -38,7 +35,6 @@ properties:
     description: regulator that supplies the I/O voltage
 
   reg: true
-  ports: true
   rotation: true
   backlight: true
 
@@ -47,7 +43,26 @@ required:
   - reg
   - vddio-supply
   - reset-gpios
-  - ports
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - novatek,nt36523w
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        port: false
+        ports:
+          required:
+            - port@1
 
 unevaluatedProperties: false
 
-- 
2.34.1

