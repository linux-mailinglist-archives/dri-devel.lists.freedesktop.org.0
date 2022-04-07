Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A44F8842
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD6910EEA2;
	Thu,  7 Apr 2022 20:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE3410EEA2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649361785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXSOuQeCYTD72y4Xo1UTiURod41sQfVrbEsc1IcuHsY=;
 b=DHA0tkR3Vv77iLMrzxe3spWnc1vYvApZkR8zqcGUOoEAaQVQzj5AOESx4XNc5f3x+RvEGa
 t65WkCainFCvcelA7RYwHHofku0/QFHEcyZig5S9BkFd8GNcbz9V2aVmIDmi29WydL/vPp
 c/L2HukERF3ACxrQy3tJh/AXvWGLKM8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-SdH0hNjTPf6Pfm24jPhhjA-1; Thu, 07 Apr 2022 16:03:02 -0400
X-MC-Unique: SdH0hNjTPf6Pfm24jPhhjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m3-20020a05600c3b0300b0038e74402cb6so3424304wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 13:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXSOuQeCYTD72y4Xo1UTiURod41sQfVrbEsc1IcuHsY=;
 b=tVZlwoIJnBCqgw772Q8I48WFeL82Fw6wkX1eKiIFC69uGSnWzQMI3fY+A7XVRZP4io
 tXU0iLQIWAYN1WM+Igeyxyk4BjmteG87ZbCCVso87RKcnsMluryJp7fYOVPB7Jk3BgOp
 TWfAe3mBwx5n0beiPAozbx//XczsLpSLKc9StSvIkP0yK8ntJ/6hoxAX6EJ15nvHO8Q2
 t/x9Ru5E78lEoLV1eK6ZyWr0G/z4NRpZ124XyJnQR/qMb48TxiHVfNSoC7B2PJEAafRu
 P+BCWK1MF6aPANYvlqGE+j5J+5YCYkHfhMIJzs9XtKguA2h4xIcKiE1LfYzrggyQbhIy
 KF7Q==
X-Gm-Message-State: AOAM531OVrRu6HaXqTKx3HGOX+CBejI1YOriWNSXqACV9ff1O827zCNm
 ceOuUhyK6LUNUU7x+I2MVIW97nOC5DO5FUn0h2hXjFjNxab/A9XpR5lu+3VbTbinpz3w/s5HuMS
 3E/+iDVloaobTkc8CGaG5vyAPZZUA
X-Received: by 2002:a05:600c:3009:b0:381:194a:8cb5 with SMTP id
 j9-20020a05600c300900b00381194a8cb5mr14371857wmh.43.1649361780977; 
 Thu, 07 Apr 2022 13:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdVrchp6+fH6bFHOo2gCCwpez8T6oth+OyDwzFP+IdgOSajN+NtmKi8IXgiPU7SpRh+LyMoA==
X-Received: by 2002:a05:600c:3009:b0:381:194a:8cb5 with SMTP id
 j9-20020a05600c300900b00381194a8cb5mr14371846wmh.43.1649361780754; 
 Thu, 07 Apr 2022 13:03:00 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b002078f74ccd2sm1048712wry.36.2022.04.07.13.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:03:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: display: ssd1307fb: Extend schema for SPI
 controllers
Date: Thu,  7 Apr 2022 22:02:01 +0200
Message-Id: <20220407200205.28838-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407200205.28838-1-javierm@redhat.com>
References: <20220407200205.28838-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
add to the schema the compatible strings, properties and examples for SPI.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../bindings/display/solomon,ssd1307fb.yaml   | 89 +++++++++++++++----
 1 file changed, 71 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 46207f2c12b8..05e7975296a7 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -31,6 +31,15 @@ properties:
               - solomon,ssd1307-i2c
               - solomon,ssd1309-i2c
 
+      # SSD130x SPI controllers
+      - items:
+          - enum:
+              - sinowealth,sh1106-spi
+              - solomon,ssd1305-spi
+              - solomon,ssd1306-spi
+              - solomon,ssd1307-spi
+              - solomon,ssd1309-spi
+
   reg:
     maxItems: 1
 
@@ -40,9 +49,14 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  dc-gpios:
+    maxItems: 1
+
   vbat-supply:
     description: The supply for VBAT
 
+  spi-max-frequency: true
+
   solomon,height:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 16
@@ -148,19 +162,10 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sinowealth,sh1106-i2c
-    then:
-      properties:
-        solomon,dclk-div:
-          default: 1
-        solomon,dclk-frq:
-          default: 5
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: solomon,ssd1305-i2c
+            enum:
+              - sinowealth,sh1106-i2c
+              - solomon,ssd1305-i2c
+              - solomon,ssd1305-spi
     then:
       properties:
         solomon,dclk-div:
@@ -172,7 +177,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1306-i2c
+            enum:
+              - solomon,ssd1306-i2c
+              - solomon,ssd1306-spi
     then:
       properties:
         solomon,dclk-div:
@@ -184,7 +191,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1307-i2c
+            enum:
+              - solomon,ssd1307-i2c
+              - solomon,ssd1307-spi
     then:
       properties:
         solomon,dclk-div:
@@ -198,7 +207,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1309-i2c
+            enum:
+              - solomon,ssd1309-i2c
+              - solomon,ssd1309-spi
     then:
       properties:
         solomon,dclk-div:
@@ -206,6 +217,21 @@ allOf:
         solomon,dclk-frq:
           default: 10
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - sinowealth,sh1106-spi
+              - solomon,ssd1305-spi
+              - solomon,ssd1306-spi
+              - solomon,ssd1307-spi
+              - solomon,ssd1309-spi
+    then:
+      required:
+        - spi-max-frequency
+        - dc-gpios
+
 additionalProperties: false
 
 examples:
@@ -214,14 +240,14 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            ssd1307: oled@3c {
+            ssd1307_i2c: oled@3c {
                     compatible = "solomon,ssd1307-i2c";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
             };
 
-            ssd1306: oled@3d {
+            ssd1306_i2c: oled@3d {
                     compatible = "solomon,ssd1306-i2c";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
@@ -232,3 +258,30 @@ examples:
                     solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
             };
     };
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307_spi: oled@0 {
+                    compatible = "solomon,ssd1307-spi";
+                    reg = <0x0>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+
+            ssd1306_spi: oled@1 {
+                    compatible = "solomon,ssd1306-spi";
+                    reg = <0x1>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+                    solomon,com-lrremap;
+                    solomon,com-invdir;
+                    solomon,com-offset = <32>;
+                    solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
+            };
+    };
-- 
2.35.1

