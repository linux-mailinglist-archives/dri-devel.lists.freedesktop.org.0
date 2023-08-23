Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40778527D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6794510E3E8;
	Wed, 23 Aug 2023 08:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFCA10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:15:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so6552762a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692778515; x=1693383315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqRFfyB6fBH2NjSEwbcQneI6aytxmQl02N3y/cGFN8Q=;
 b=iHZOl1PZKN62nlsynpyoDx9vyDVvVCO3NcP7oVnW1ecm5RD1cdHMaDNM7ltaET90RA
 Vi4eXQ3am5DKBisey3XxfvShn7luVkBBqhzdHaCwrUOJd3eVloo3kjHXyvoWcQl4wYcT
 lYgGSSBLqjKK+S3uBCa4qOTBmYzuhRtBiES0iwlTYNelE4vEPEYov512pXM+F8rPZcDd
 J0Glv/qMM16RjQPcEaO3HApk4tr+2NdUqV31dQOjAiyZ5FEG05la6qSdjAVYrpjEa3Oe
 YQjxNTHUUr43V6ZHFxEVjAsNgK8UqS5TqhY0Ey/T+Y8Ca152aX2QnXOR0J9E7lo8Qh/V
 VB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692778515; x=1693383315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqRFfyB6fBH2NjSEwbcQneI6aytxmQl02N3y/cGFN8Q=;
 b=QrSiyABpH4HODpgHrTmGWeEmhU2p842ZvHqes1vwrtgA7f8mkzXMUSAV3/ERAWif+/
 CUSAYtju2HTihi+3jjgLusXXmbkaV5UM79EXRxugOb6BwZP8esngsoUC42yzyITuSJl0
 pSpvJIgwFctoyyqhYqVJYts8icRphf1Cl0UTpPHJbsH2/rqVXtiBRGrem800qYND76kE
 83A5X7+MbcX48tQIwlaJXCJ6HkhNYtzVUYpMa/jhNs2jXHLZ/5aR//Ykdgh1DsUOTrmn
 z3V7FxXnbhEknY9u1Gh799lOeHVaLyQwA8Pl9UWP+LeERzloxhGvrVDyg77iHwDUVjmD
 mtZg==
X-Gm-Message-State: AOJu0Ywp59caUvlfIqc5pIPGD8lfMbiSufSzz3a3ZC7TcAnUnP6RFLaV
 lTgj8y7hrVD6B25vaAql4tqUmQ==
X-Google-Smtp-Source: AGHT+IGoWKgMFpxZ9BF5pSIbrht5kIRNqx7e0/bgz0+0hiqpzXF3RpNK5nrnWgjZRC4fE/5RdArPcQ==
X-Received: by 2002:a17:907:2cf7:b0:99c:d05d:7b50 with SMTP id
 hz23-20020a1709072cf700b0099cd05d7b50mr8958826ejc.2.1692778515235; 
 Wed, 23 Aug 2023 01:15:15 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 v18-20020a170906b01200b0098e78ff1a87sm9539730ejy.120.2023.08.23.01.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:15:14 -0700 (PDT)
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
Subject: [PATCH v3 3/3] dt-bindings: display: novatek,nt36523: define ports
Date: Wed, 23 Aug 2023 10:15:00 +0200
Message-Id: <20230823081500.84005-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
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

The panel-common schema does not define what "ports" property is, so
bring the definition by referencing the panel-common-dual.yaml. Panels
can be single- or dual-link, depending on the compatible, thus add
if:then:else: block narrowing ports per variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

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

