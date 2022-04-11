Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C774FC66F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF1B10F76B;
	Mon, 11 Apr 2022 21:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC62A10F768
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649711572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzdFnm3iaZLLnebsfstZZgMbexDrkf5tbznhbFumAH0=;
 b=L17EAogo3R2dt2zK7oiCKZxg4NL3S7339UT/GlGKxL1FdPaEfuMxf4cEq/bP0rnLneNvyy
 2NTEcgQuLTAF1MGhPE+Lvz7o3LjHpY5ov7pZtvsFHMamyLaoJe+l7CfORy0/oMEdCkREZ3
 9crOlGoPm9Q+aK+ZHskaEp30lPMvVu8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-WZDbDVbROpiRw3o11Zc05w-1; Mon, 11 Apr 2022 17:12:51 -0400
X-MC-Unique: WZDbDVbROpiRw3o11Zc05w-1
Received: by mail-wm1-f71.google.com with SMTP id
 az9-20020a05600c600900b0038ea99858d8so215568wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzdFnm3iaZLLnebsfstZZgMbexDrkf5tbznhbFumAH0=;
 b=XXH9e7ZujVLKModdBCufqES5X+Ch59crK8FrSbx7AfEljBC4WPHyQOhKpemkduf1uK
 CUYCiN4+LNIgH3hhRvGh+E7wsP+YUAEiFj3hY172AJQGyaTJXvFOjMqaar2LHGZIqvos
 sNha4A6t1eLq3uOVH31endYcSSBNWmjJxoAQ3Tk0adQRVIY80K06vtrRMVIl8NTYMRsp
 5Tx4CQmWXXsA9JemZMdCNuyr1tk61u8pDEGs1tgFeejceY1iv2nXm2DEYj1wl7/GKpBM
 a6HuEe0RrMcefFO9bcCS9PJzcALy8Bk+AXiB3l7/Ci5yl6Th0f94qDTIu/aHEZo5C8vn
 F0Ng==
X-Gm-Message-State: AOAM531cpOgKneYdicnc0VVY7RPfN3FPgWAnOrYJumjiJ/AEyin4Ag6Q
 7xJ93L4e0d9u4OkXVU6N4HkDU1XqMF0VlGbjimV4ZKguBs9fGZDWzJSq9+9at9ieih45GyHiRmN
 ifZovhXLwxI5kLIo2oUKhG0e6qFUe
X-Received: by 2002:a05:600c:2197:b0:38e:b80c:526a with SMTP id
 e23-20020a05600c219700b0038eb80c526amr955060wme.76.1649711570544; 
 Mon, 11 Apr 2022 14:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu/LM92/Nz7m6CMsPIAZGXuJG/QWu/2OUyuso56zJHaoEzz30UUplaSr4C67jCPONKtccaqw==
X-Received: by 2002:a05:600c:2197:b0:38e:b80c:526a with SMTP id
 e23-20020a05600c219700b0038eb80c526amr955039wme.76.1649711570337; 
 Mon, 11 Apr 2022 14:12:50 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm28723722wrs.43.2022.04.11.14.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:12:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
Date: Mon, 11 Apr 2022 23:12:39 +0200
Message-Id: <20220411211243.11121-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411211243.11121-1-javierm@redhat.com>
References: <20220411211243.11121-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current compatible strings for SSD130x I2C controllers contain both an
"fb" and "-i2c" suffixes. It seems to indicate that are for a fbdev driver
and also that are for devices that can be accessed over an I2C bus.

But a DT is supposed to describe the hardware and not Linux implementation
details. So let's deprecate those compatible strings and add new ones that
only contain the vendor and device name, without any of these suffixes.

These will just describe the device and can be matched by both I2C and SPI
DRM drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

Changes in v2:
- Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven).

 .../bindings/display/solomon,ssd1307fb.yaml   | 37 ++++++++++++-------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index ade61d502edd..6b9d0c72739a 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -12,12 +12,23 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sinowealth,sh1106-i2c
-      - solomon,ssd1305fb-i2c
-      - solomon,ssd1306fb-i2c
-      - solomon,ssd1307fb-i2c
-      - solomon,ssd1309fb-i2c
+    oneOf:
+      # Deprecated compatible strings
+      - items:
+          - enum:
+              - sinowealth,sh1106-i2c
+              - solomon,ssd1305fb-i2c
+              - solomon,ssd1306fb-i2c
+              - solomon,ssd1307fb-i2c
+              - solomon,ssd1309fb-i2c
+        deprecated: true
+      - items:
+          - enum:
+              - sinowealth,sh1106
+              - solomon,ssd1305
+              - solomon,ssd1306
+              - solomon,ssd1307
+              - solomon,ssd1309
 
   reg:
     maxItems: 1
@@ -136,7 +147,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sinowealth,sh1106-i2c
+            const: sinowealth,sh1106
     then:
       properties:
         solomon,dclk-div:
@@ -148,7 +159,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1305fb-i2c
+            const: solomon,ssd1305
     then:
       properties:
         solomon,dclk-div:
@@ -160,7 +171,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1306fb-i2c
+            const: solomon,ssd1306
     then:
       properties:
         solomon,dclk-div:
@@ -172,7 +183,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1307fb-i2c
+            const: solomon,ssd1307
     then:
       properties:
         solomon,dclk-div:
@@ -186,7 +197,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1309fb-i2c
+            const: solomon,ssd1309
     then:
       properties:
         solomon,dclk-div:
@@ -203,14 +214,14 @@ examples:
             #size-cells = <0>;
 
             ssd1307: oled@3c {
-                    compatible = "solomon,ssd1307fb-i2c";
+                    compatible = "solomon,ssd1307";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
             };
 
             ssd1306: oled@3d {
-                    compatible = "solomon,ssd1306fb-i2c";
+                    compatible = "solomon,ssd1306";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
-- 
2.35.1

