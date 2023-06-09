Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6C572A0ED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E2310E6D1;
	Fri,  9 Jun 2023 17:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1892C10E6CF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686330596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXfuy13isQUH9meYMWRMilnarujeOibtxjp5Z2EnlHc=;
 b=ONJr8JjBJKs2zv2ey8TYNybWIrUWpWo8G0ofq9pVV4FY/JyKaeFFBCxRmiV9ToZ0vVcvYC
 QxlrY8K3NqaXZMQXNBgftdmQO03eTvPGoNqQbtzywbo5kJTFg48H3mc1zJzNSYbBZyxSL3
 yMkWqmEO38FRJsbHzbOdLG3lqntN+EQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-Ev8Y6T3COLyUzC_LFjKH3w-1; Fri, 09 Jun 2023 13:09:49 -0400
X-MC-Unique: Ev8Y6T3COLyUzC_LFjKH3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f7f8d101b1so32725255e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 10:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330588; x=1688922588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXfuy13isQUH9meYMWRMilnarujeOibtxjp5Z2EnlHc=;
 b=RUr3+LQQ+zwSDeRTIqwQR/K+qSh5g2tvenUb3UwtS1DPhCLR3v/+ijJw7SLfliJwcO
 6XHqNzgeWma95E/uz+0dxw7zgPwO4J9NSnMBI+Qo443VL5Fm/dMo0mA61R9ZYVCeCBPA
 EM7k3/TBCtbQX0K/v+bS98hH4G5JHnddPZpuPrM4LnJBhZiwbi2iTASP4OBcwYZamlBv
 FvKYazZJIS69nKEhPnKR84KrRNf2vVdlMHINybpPphQxy6s+dlzLxCGy3A5ZUpVIeR4J
 HJ1tHzqhHcnMKCVhfFeOwnIlL88feM3mNnMOeuLcwHUD5S2jJv2sRlmOb4a8nEVSmxUB
 7C5Q==
X-Gm-Message-State: AC+VfDxLLlyoCGWNewlZIvWqrZHjtlkd9fPaxFQ7OFYqtCgMASS15cBM
 gnAsjDiccFTCjkfeU1e8YjpuMYh+X9lD8IQkxEhMaju7O8woGF+ZH4b+VPvDk2B1qA2yXGY+MGU
 nHk4T4vwdy4f2yhDXRPEk7RxeV9Uu
X-Received: by 2002:a05:600c:2297:b0:3f7:f544:4993 with SMTP id
 23-20020a05600c229700b003f7f5444993mr1713191wmf.20.1686330588008; 
 Fri, 09 Jun 2023 10:09:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6STR4rSMJ97Fa6ojZrAiLQzs8ABi6NesLIiXyu3/dui4psE2W6fWMsDJ7gQ5OE2xe5JNQ5zQ==
X-Received: by 2002:a05:600c:2297:b0:3f7:f544:4993 with SMTP id
 23-20020a05600c229700b003f7f5444993mr1713180wmf.20.1686330587766; 
 Fri, 09 Jun 2023 10:09:47 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm3265526wmr.2.2023.06.09.10.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:09:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default width
 and height values
Date: Fri,  9 Jun 2023 19:09:37 +0200
Message-Id: <20230609170941.1150941-3-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609170941.1150941-1-javierm@redhat.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A default resolution in the ssd130x driver isn't set to an arbitrary 96x16
anymore. Instead is set to a width and height that's controller dependent.

The datasheets for the chips describes the following display resolutions:

 - SH1106:  132 x 64 Dot Matrix OLED/PLED
 - SSD1305: 132 x 64 Dot Matrix OLED/PLED
 - SSD1306: 128 x 64 Dot Matrix OLED/PLED
 - SSD1307: 128 x 39 Dot Matrix OLED/PLED
 - SSD1309: 128 x 64 Dot Matrix OLED/PLED

Update DT schema to reflect what the driver does and make its users aware.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v2:
- List per controller default width/height values in DT schema (Maxime Ripard).

 .../bindings/display/solomon,ssd1307fb.yaml   | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 94bb5ef567c6..20e2bd15d4d2 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -49,15 +49,15 @@ properties:
 
   solomon,height:
     $ref: /schemas/types.yaml#/definitions/uint32
-    default: 16
     description:
-      Height in pixel of the screen driven by the controller
+      Height in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
 
   solomon,width:
     $ref: /schemas/types.yaml#/definitions/uint32
-    default: 96
     description:
-      Width in pixel of the screen driven by the controller
+      Width in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
 
   solomon,page-offset:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -157,6 +157,10 @@ allOf:
             const: sinowealth,sh1106
     then:
       properties:
+        width:
+          default: 132
+        height:
+          default: 64
         solomon,dclk-div:
           default: 1
         solomon,dclk-frq:
@@ -171,6 +175,10 @@ allOf:
               - solomon,ssd1305
     then:
       properties:
+        width:
+          default: 132
+        height:
+          default: 64
         solomon,dclk-div:
           default: 1
         solomon,dclk-frq:
@@ -185,6 +193,10 @@ allOf:
               - solomon,ssd1306
     then:
       properties:
+        width:
+          default: 128
+        height:
+          default: 64
         solomon,dclk-div:
           default: 1
         solomon,dclk-frq:
@@ -199,6 +211,10 @@ allOf:
               - solomon,ssd1307
     then:
       properties:
+        width:
+          default: 128
+        height:
+          default: 39
         solomon,dclk-div:
           default: 2
         solomon,dclk-frq:
@@ -215,6 +231,10 @@ allOf:
               - solomon,ssd1309
     then:
       properties:
+        width:
+          default: 128
+        height:
+          default: 64
         solomon,dclk-div:
           default: 1
         solomon,dclk-frq:
-- 
2.40.1

