Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD64FC675
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696110F77B;
	Mon, 11 Apr 2022 21:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AA010F776
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649711575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQ+QBfaH3h1Scl+hTaH0HyHu0TpM43OebOl6PoDY/RM=;
 b=dpE6INBc93Uz4M9jR0D9KwNgRtKVmZi2lawEl6Pg3UFGQ0i8O6bm3k9Zf+eFjVu2XRePgD
 uwDe/Kxp07C8qKU+4KNf3qnFy+/u40aP4CEhlOGvghB+J99Bw6m7lI8d3Qy3n2ejswMVgZ
 3ADUKqWiPL++wFy/U81VtXacd738jA0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-OJId68vgNRW50xWqfBP79g-1; Mon, 11 Apr 2022 17:12:53 -0400
X-MC-Unique: OJId68vgNRW50xWqfBP79g-1
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so214373wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQ+QBfaH3h1Scl+hTaH0HyHu0TpM43OebOl6PoDY/RM=;
 b=Ov/obHmGWLfffqUIWbDuqP4617Nx8Ku1WW/2J4g9GjD639FTxM4HYL0GWuV+pwFs2p
 8ZaTPoGanvRmfzkwdk9BzYElT2fEfbnm3xtVgYckLsVxuyAekTnXOaAIOAfhkbxM/9Ik
 upJs8mDlDbNaRnzvm0RfMdQ79G1KzrkWoh6IowzIWxgGYak27W3PxuzDcso89jWijS7L
 HJflJoMVMU/9VkRhevUMCxPArzT43AU9Mr5J4WMxf/7jGvXuYMaMnAnud3BxEfiDmjAW
 HuSbS8ACscWtHOjOndOEUEC4HQW08a7kb94bNQsGqRiYPC25efDFEc+KciejpFbMrM8s
 vwRA==
X-Gm-Message-State: AOAM530yXPVikewyOe9+7kGwE5bcLOErh6ORURDDgi05L4EA8jNAFf5D
 VYAawc4fTngCCrfpN8YgDQ1J/XWqTExj5th2UrItrd/mq/Td0LXliJo0qsR6WBRBeeZm9uxqq26
 aea8qvNaZuk5HdF72SpT4kvHKVGxJ
X-Received: by 2002:a1c:202:0:b0:38e:ab4b:ce72 with SMTP id
 2-20020a1c0202000000b0038eab4bce72mr978208wmc.152.1649711571860; 
 Mon, 11 Apr 2022 14:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfuB7hkZg8q50JjIIMsDyKbYBXK9LNBxTvZbXiee0cHgIO0ETUBqdWkPQZa7/y0oGvzWZVvw==
X-Received: by 2002:a1c:202:0:b0:38e:ab4b:ce72 with SMTP id
 2-20020a1c0202000000b0038eab4bce72mr978199wmc.152.1649711571661; 
 Mon, 11 Apr 2022 14:12:51 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm28723722wrs.43.2022.04.11.14.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:12:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Extend schema for SPI
 controllers
Date: Mon, 11 Apr 2022 23:12:40 +0200
Message-Id: <20220411211243.11121-3-javierm@redhat.com>
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

The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
add to the schema the properties and examples for OLED devices under SPI.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

Changes in v2:
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven).

 .../bindings/display/solomon,ssd1307fb.yaml   | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 6b9d0c72739a..b58d2d7bd8c1 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -39,9 +39,14 @@ properties:
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
@@ -160,6 +165,7 @@ allOf:
         compatible:
           contains:
             const: solomon,ssd1305
+
     then:
       properties:
         solomon,dclk-div:
@@ -213,14 +219,14 @@ examples:
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
@@ -231,3 +237,30 @@ examples:
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

