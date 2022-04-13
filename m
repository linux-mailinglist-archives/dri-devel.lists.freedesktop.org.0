Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F42364FFB25
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8C10E5D8;
	Wed, 13 Apr 2022 16:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD5110E5EB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuVpQPzDh+Rwb2RTdR6emxMGJ2dG4YXzHB3chPiyWZo=;
 b=P2bpfPK/diemh+CcmAejyzIqyrlXsGIBPS0UnRKLFEWCsq4oL9Ug32/yx6bpmzS431HcE6
 zztMWLp8c/5hLyyPZQJh1aPU3RjeP260rUzaBanvUnpU9xpd0bojsZKKbJtfjfFg1MZcEo
 j07G9Pg9ODglPVFO1+pQh2Jrv8W7IDQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-IYXUUcEuNEi8NTJXBvJw9Q-1; Wed, 13 Apr 2022 12:24:22 -0400
X-MC-Unique: IYXUUcEuNEi8NTJXBvJw9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 q25-20020a1ce919000000b0038ead791083so971399wmc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuVpQPzDh+Rwb2RTdR6emxMGJ2dG4YXzHB3chPiyWZo=;
 b=3/GPJC3iIZoXWjgJJ/BmI47eY5WtXHuKD68jVl5ouCewG/bawbOlT6LcXWNIyW32hE
 rDr0I0Adp9GVtF+yB4ubN8SCqYsRmn2RIXbiSwizFpYNEOK5oArdem0ZACj3A+xpVYBJ
 egJFBrriaRt4ObWty4oSPjdE451rYranvGpVapRkwV8Wjo6h0vdp1/nPBWe8zsNDnoLg
 F4QBnFwH6lpLiIGa0xmMDcdlp7Of5zfRHsRm9qshpYQR26AiVb+ViNj4LQ7cchhdvEHc
 QZFdQtNpCl0oTet28eAMxHgnK64pWXBQrp4iO5WQycf1Z5tQt3FVPWQ3mVWZDTSrrQsc
 1DlA==
X-Gm-Message-State: AOAM5311YR8tu6RyQue1CUv0P2S3Jr/XMxZG60bm9f+ijb3OJhtTMEb/
 WFtNNexUnDCo8ASrtWYEgacMG722waCF6H8QWPaj+POO8H4tHvd60mTYk8Msb2PPE4JE1vuCcBt
 fc0SMioM5Bf3ZLtqrXx8qGFFeJA8K
X-Received: by 2002:a05:600c:1d29:b0:38e:c4d1:a41b with SMTP id
 l41-20020a05600c1d2900b0038ec4d1a41bmr9497923wms.70.1649867061695; 
 Wed, 13 Apr 2022 09:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKmw84FX/JGt75DbPlGr5AZDD0foCMNRbtDmvyN2j0buGx4eZZgYEVHwxZOulmN72MmRJVDA==
X-Received: by 2002:a05:600c:1d29:b0:38e:c4d1:a41b with SMTP id
 l41-20020a05600c1d2900b0038ec4d1a41bmr9497897wms.70.1649867061461; 
 Wed, 13 Apr 2022 09:24:21 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfa2c9000000b002061561d4a7sm25446096wra.96.2022.04.13.09.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:24:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: display: ssd1307fb: Extend schema for SPI
 controllers
Date: Wed, 13 Apr 2022 18:23:55 +0200
Message-Id: <20220413162359.325021-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413162359.325021-1-javierm@redhat.com>
References: <20220413162359.325021-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
add to the schema the properties and examples for OLED devices under SPI.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v4:
- Add a description for the dc-gpios property for SPI (Geert Uytterhoeven)

Changes in v3:
- Add a comment to the properties required for SPI (Geert Uytterhoeven)

Changes in v2:
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven)

 .../bindings/display/solomon,ssd1307fb.yaml   | 42 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 7653b6c3fcb6..3fbd87c2c120 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -38,9 +38,20 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  # Only required for SPI
+  dc-gpios:
+    description:
+      GPIO connected to the controller's D/C# (Data/Command) pin,
+      that is needed for 4-wire SPI to tell the controller if the
+      data sent is for a command register or the display data RAM
+    maxItems: 1
+
   vbat-supply:
     description: The supply for VBAT
 
+  # Only required for SPI
+  spi-max-frequency: true
+
   solomon,height:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 16
@@ -220,14 +231,14 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            ssd1307: oled@3c {
+            ssd1307_i2c: oled@3c {
                     compatible = "solomon,ssd1307";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
             };
 
-            ssd1306: oled@3d {
+            ssd1306_i2c: oled@3d {
                     compatible = "solomon,ssd1306";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
@@ -238,3 +249,30 @@ examples:
                     solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
             };
     };
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307_spi: oled@0 {
+                    compatible = "solomon,ssd1307";
+                    reg = <0x0>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+
+            ssd1306_spi: oled@1 {
+                    compatible = "solomon,ssd1306";
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

