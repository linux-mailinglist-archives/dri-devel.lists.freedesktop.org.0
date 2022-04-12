Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2644FE5C9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 18:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AF010E439;
	Tue, 12 Apr 2022 16:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61D010E718
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649780872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M///uq33RMEHTxjoVs129eG8XW6VZX+ANQltzYppS6w=;
 b=UGhopQBh7xXweK6WHKKZL44tr+tEz3gNWiMr2jk+tabyT9swJn6MGijUyUOi4eU3jkBan/
 fXzkJKB/DvGQ5zWyIAXpBmlpvLrJdTGSM00F5KwFbsZkq8SWgzI2k4bkCuT6OTiDcXeIL8
 BGRrLKen5YNEeGDG+daX4aDQSAajuCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-wDLb7IzSNYK15Xt0CMPsxg-1; Tue, 12 Apr 2022 12:27:51 -0400
X-MC-Unique: wDLb7IzSNYK15Xt0CMPsxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 10-20020a1c020a000000b0038ece714a1fso587119wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M///uq33RMEHTxjoVs129eG8XW6VZX+ANQltzYppS6w=;
 b=DnY7Zbc+xRiGo4tOMadip/jwRYxJOySyvPc79TIY+2PoBWbiyYziEzayFU2fkM/FIn
 8vAL0T0FooOLWE7hqqadnvQfHpFpVYYlbLSvdse5CWzbNameu8ytMwJcSqkHwNJYHsM1
 8dcqtQT3Rmmx/Q0Q5vh6s7JAh2d6KkD0GNHSgm9tT1F/doR2LJrKEcWSe1oAJxJgWOBe
 YjBsOv/2MR4r0Taj8ucFgYnpVpq2uql62745VK8U4h/Z9nbkuxFEPdVMIabU1qkLY8J0
 3CAvAmwFf5Ht9CiogwcofD2SKlAqRw+v/9/ra1WxjNjxQX6LZYBtjZ1+jmSutcdL3X9E
 B+vg==
X-Gm-Message-State: AOAM530kHfcFGSks+q1ytbA/wM+8+703cpTNi7lOZ54m1cgICwGa6NI4
 PORHHEf6ElpbPLo5yT56EvjNSFJQ1DEUdME45tMAZTMFouUPG74i1Pd15VwOUSJ+c2aXwDbCx4M
 u2FZ8PJ0x4/ygay1iCszvOuWv+vKn
X-Received: by 2002:a05:600c:3588:b0:38c:6d7f:6fd8 with SMTP id
 p8-20020a05600c358800b0038c6d7f6fd8mr4795578wmq.25.1649780870425; 
 Tue, 12 Apr 2022 09:27:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzryxA9KF33Y/kGHkOm+XLc/HDsLdgWiUOLZYjTIDFY5X+9rR3gPvbvCQWHVPnx1wiijk1LQQ==
X-Received: by 2002:a05:600c:3588:b0:38c:6d7f:6fd8 with SMTP id
 p8-20020a05600c358800b0038c6d7f6fd8mr4795565wmq.25.1649780870214; 
 Tue, 12 Apr 2022 09:27:50 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm7700358wrq.81.2022.04.12.09.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 09:27:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: display: ssd1307fb: Extend schema for SPI
 controllers
Date: Tue, 12 Apr 2022 18:27:26 +0200
Message-Id: <20220412162729.184783-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412162729.184783-1-javierm@redhat.com>
References: <20220412162729.184783-1-javierm@redhat.com>
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

Changes in v3:
- Add a comment to the properties required for SPI (Geert Uytterhoeven)

Changes in v2:
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven)

 .../bindings/display/solomon,ssd1307fb.yaml   | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 7653b6c3fcb6..7d7de92df86f 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -38,9 +38,16 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  # Only required for SPI
+  dc-gpios:
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
@@ -220,14 +227,14 @@ examples:
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
@@ -238,3 +245,30 @@ examples:
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

