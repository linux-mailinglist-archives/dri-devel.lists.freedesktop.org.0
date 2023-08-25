Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43C7886B1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91B510E663;
	Fri, 25 Aug 2023 12:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E248710E65C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:11:56 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a06f5f556so1290859a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692965515; x=1693570315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzqGDlYO53VtpNTfk9/2jQSIhaYzka5q6tmocMJNTUk=;
 b=Iw+vGU0WxM/n2TkZrEPhVytepIiLpJLCrgunLLHrb1dt2WzeE0v+25Q8ohu/3VhBMH
 isuG+szZerc1JZs/j5z/zpz+/JuDv2mK1hTQcwhIBY047MnqxhMvqLYS1CUKsgDj0IqY
 UNZ5uBoljRyzVqd5PdSzUUGcSsX/Jdjgjtet/lbCenTGyZx2MDuZNxDhie99jtRGN83O
 IJkHCO/f4Vhovn92yzawIxGFJMtCwqlNTrof8HpLKXBVnEHaEWdl8LV1zbNuwj1oP/Ti
 wwzriRyZzkG/dwaxaChFSoSfeO5MBw8L6/zxOUossa73ZoYg47OM2P3D9xNreGEo6cFx
 RHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692965515; x=1693570315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzqGDlYO53VtpNTfk9/2jQSIhaYzka5q6tmocMJNTUk=;
 b=OkoEPbEleUtx46WBtXaWChDaRfaEf3VHRw6dB120QOG0Dlu9Kti8gTqfl5EJos3XhX
 mSdjCuDFzpxRRkWZhM8LGY4dToUNl4evABdGNx4tZ6KXeGPGQG4oGuRdt3teCJMipwEV
 oi9FZWhMLUKR8KnxHoq7fhWCBnPuW982NujrrPSiohypnG7CoMCyIFF+ig7brWPttWSx
 Fx9hNASwzyTxAuDBc8vK9grv1rIBy8TFjwY/jSee+tiBgo5nwDRnXKTu+ASjgqAGMQci
 mKwmFM7fodDM6CK2xqzKLm8wAgomNZg+hqfLRhPUuWHri6bA8rxwHid6DjKIN7k0Etvx
 w8Cg==
X-Gm-Message-State: AOJu0YzPjlTVC3Xzg0J4t/6EUi0aXErpHB8aL7k2mQVqsRHYvDhyvC3d
 9EPdwH60Zno3k9KWuP2PZ8I12g==
X-Google-Smtp-Source: AGHT+IGUKhjqKcVWlKdpqBhagGpbCfzvbRoRShHrZQRitS1v8wNgCijkMtLxjEvIGq8epHehT9iSbA==
X-Received: by 2002:aa7:d952:0:b0:523:ae0a:a447 with SMTP id
 l18-20020aa7d952000000b00523ae0aa447mr15166905eds.13.1692965515299; 
 Fri, 25 Aug 2023 05:11:55 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056402124500b005222c6fb512sm952311edw.1.2023.08.25.05.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 05:11:54 -0700 (PDT)
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
Subject: [PATCH v4 3/3] dt-bindings: display: novatek,nt36523: define ports
Date: Fri, 25 Aug 2023 14:11:42 +0200
Message-Id: <20230825121142.101759-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
References: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
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

