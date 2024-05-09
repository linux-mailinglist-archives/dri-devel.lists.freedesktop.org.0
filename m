Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3E8C0DB3
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 11:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646AA10E71E;
	Thu,  9 May 2024 09:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJPJ7CzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48810E5A4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 09:43:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso162765266b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715247783; x=1715852583; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+D+DD5ujmRC79Mey/sIGoYI9ydUKjzoT2SPYYlKjerU=;
 b=QJPJ7CzSB8oqqosE9Fnuuco7dBLH4u6/RONWSleSSC9sKYib/TOASl+KBN6Y3wT7Qd
 0gG09E0q0jg6LQZYbZARy6Sfcb6Er2ALRqkmoYZf1z51u6sMFomKhCG9TSZ2mZ0CE7Y5
 RP7SC6Rj+Hylz3T7wCin4TEAelE7EVKSGQLwE3REeUt3r2YIz0mORfguh96CHy2IZM+Y
 9w0YRWjfl7QkbJd4sOgIhoKQUySqhg8fVALlV1CFMLNlZfFpkzf8Ff5IaVZKT8fao3Dy
 KR3kmWcriJkraO74SFn8kFn17QFSkDp4A7jfJxIdOnuml0E4PNJy/xm3yzeEYbGdSyxX
 E08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715247783; x=1715852583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+D+DD5ujmRC79Mey/sIGoYI9ydUKjzoT2SPYYlKjerU=;
 b=et1oIpZkdOOJDkxiGBVcDuxbrLY5wZqj1+OsJ2dbdK76YEyyv66iTbrBy4lkLAiHOU
 YyC2xSe9PPNvs7LbBYYBCBi2kN3NX/8rf/aLdjMfgcVDUgQIKVUIvtdw1SddFDb8527x
 s1/Yb3W87/56FbYUdRYgP0+yymZqjCiO+lyJBBj5LHhu/fT6RuFpZL0ra/Ghpp/Df8ES
 6VJDheF24iG0+pkBdxl0SWFNBW4q1c0w2BcWz0RgAEcHJOK6q6ITflk2031v3OLQvTPK
 7kMfG5sLZbTqOzn3mExgIrDAyY4qQWYMM2ZKHUfoSg89hqaVSDiAo6OludgLXA+nD9yT
 VXug==
X-Gm-Message-State: AOJu0YygkPnH57+Rlmqvl4gn7/eUwWcjc7DLwyFHG2SyL1gSFtlaXcE7
 VihK10l+9degq6WrOx0dQskYKjRnlXwJUdiNvzq9dZA5KSGhB9pWduAIn3n+pYw=
X-Google-Smtp-Source: AGHT+IFeCA66yiGqhjZcBqUWD9onOjkEgD8MNz+CQFkjsr/2HEajnuTHjhQ4TaK7syFifjsngAOvPg==
X-Received: by 2002:a17:906:2c46:b0:a59:cd18:92f5 with SMTP id
 a640c23a62f3a-a59fb923088mr284281266b.11.1715247782772; 
 Thu, 09 May 2024 02:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7deasm53835666b.103.2024.05.09.02.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 02:43:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 May 2024 11:42:52 +0200
Subject: [PATCH 2/3] dt-bindings: display: panel: constrain 'reg' in SPI panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-dt-bindings-dsi-panel-reg-v1-2-8b2443705be0@linaro.org>
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14083;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oqnTnMrAQ7Jq7bhp91E4cSphE5UEbnzybekXFcj9nsA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmPJqe7+GklKLfEhVi9JE14rjaRObS3jXjeAqzI
 xoPtctrDBKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjyangAKCRDBN2bmhouD
 12ycD/4svRtT6rKHtYUjvi+u7M6aRtUdd3zskjvEkSQLnKWf/u2POcnRkJehbsys6kw/yg5Pgbm
 t1Xf5ljoSxvfMd1wGy5836jkRkwoYx2FkBfg4xvi9IuhkJkTcqq7UQRQjEFmIF/AWcsECkO1y++
 jeii6YQZ8v+pwqPzFU+8YCIXPyqFIoSqXebVmykMLvA6k4RJ71+YwfOqJec/VQTQK0h7Qp109VT
 UDFQje2hwQjpgSe/RHBzX0GyPPOpGuNIY4cHYdJsl1GVrdYEQkEW1vxI0EX+/j2fdLjMxHj9VZQ
 wLQ0pPSC52cgd/Qu84M4rmi6ozWPXc8xdneixyAI0+a5cRQGPB9JdwXQqhqPxeaCPiZfu1inpfh
 tiCyJX0LecOS9Ixg52aKtA4e4vKjWN02wMvRFB1zvC6+2BAAEaPQFxvorp3jbwORYlbOAogNwRT
 NHv3l1EBHh2XlWeJycNrP18U88GxNI5QzMkoaCl2BRsTDtRSbxgGP8zhT+ypYRayuZKxsoOa45X
 YbxZ6Aq+GIOGCH48tXdMw7PiKwUQNUBp7e4emHNT4snLUmBNly6riMXidcVlE3BS9jpwhyPIv36
 Obfam6sEf7QJr1nL06yDK+DwlahDDoiwPgFU9jLg/SaunzZqwvixGZwD2A4Gmn74zxUdjFCr3NZ
 2hOdtpXGkDl4GPQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

SPI-attached devices could have more than one chip-select, thus their
bindings are supposed to constrain the 'reg' property to match hardware.
Add missing 'reg' constrain for SPI-attached display panels.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml   | 4 +++-
 .../devicetree/bindings/display/panel/fascontek,fs035vg158.yaml       | 3 +++
 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml   | 4 +++-
 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml   | 3 +++
 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml   | 3 ++-
 Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml  | 4 +++-
 .../devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml   | 4 +++-
 .../devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml       | 3 +++
 Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml        | 3 ++-
 .../devicetree/bindings/display/panel/lgphilips,lb035q02.yaml         | 3 +++
 Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml   | 4 +++-
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml         | 3 +++
 .../devicetree/bindings/display/panel/samsung,ams495qa01.yaml         | 4 +++-
 Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml   | 4 +++-
 .../devicetree/bindings/display/panel/samsung,lms380kf01.yaml         | 3 ++-
 .../devicetree/bindings/display/panel/samsung,lms397kf04.yaml         | 3 ++-
 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml  | 3 ++-
 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml  | 4 +++-
 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | 4 +++-
 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml   | 3 +++
 Documentation/devicetree/bindings/display/panel/tpo,td.yaml           | 4 +++-
 Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml       | 3 ++-
 22 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
index acd2f3faa6b9..0aa2d3fbadaa 100644
--- a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
@@ -17,10 +17,12 @@ properties:
   compatible:
     const: abt,y030xx067a
 
+  reg:
+    maxItems: 1
+
   backlight: true
   port: true
   power-supply: true
-  reg: true
   reset-gpios: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml b/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
index d13c4bd26de4..9847da784cc8 100644
--- a/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
+++ b/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     const: fascontek,fs035vg158
 
+  reg:
+    maxItems: 1
+
   spi-3wire: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
index 3cabbba86581..ef5a2240b684 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
@@ -24,6 +24,9 @@ properties:
           - newhaven,1.8-128160EF
       - const: ilitek,ili9163
 
+  reg:
+    maxItems: 1
+
   spi-max-frequency:
     maximum: 32000000
 
@@ -32,7 +35,6 @@ properties:
     description: Display data/command selection (D/CX)
 
   backlight: true
-  reg: true
   reset-gpios: true
   rotation: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
index 7d221ef35443..44423465f6e3 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
@@ -26,6 +26,9 @@ properties:
           - dlink,dir-685-panel
       - const: ilitek,ili9322
 
+  reg:
+    maxItems: 1
+
   reset-gpios: true
   port: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 94f169ea065a..5f41758c96d5 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -28,7 +28,8 @@ properties:
           - canaan,kd233-tft
       - const: ilitek,ili9341
 
-  reg: true
+  reg:
+    maxItems: 1
 
   dc-gpios:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
index 72788e3e6c59..c7df9a7f6589 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
+++ b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
@@ -17,10 +17,12 @@ properties:
   compatible:
     const: innolux,ej030na
 
+  reg:
+    maxItems: 1
+
   backlight: true
   port: true
   power-supply: true
-  reg: true
   reset-gpios: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
index b4be9bd8ddde..d86c916f7b55 100644
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -17,10 +17,12 @@ properties:
   compatible:
     const: kingdisplay,kd035g6-54nt
 
+  reg:
+    maxItems: 1
+
   backlight: true
   port: true
   power-supply: true
-  reg: true
   reset-gpios: true
 
   spi-3wire: true
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
index 7a55961e1a3d..b5dc02b27200 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
@@ -18,6 +18,9 @@ properties:
   compatible:
     const: leadtek,ltk035c5444t
 
+  reg:
+    maxItems: 1
+
   spi-3wire: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
index ee357e139ac0..590ccc27d104 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
@@ -21,7 +21,8 @@ properties:
   compatible:
     const: lg,lg4573
 
-  reg: true
+  reg:
+    maxItems: 1
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
index 628c4b898111..3de17fd8513b 100644
--- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     const: lgphilips,lb035q02
 
+  reg:
+    maxItems: 1
+
   label: true
   enable-gpios: true
   port: true
diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml b/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
index accf933d6e46..1cffe4d6d498 100644
--- a/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
+++ b/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
@@ -21,9 +21,11 @@ properties:
   compatible:
     const: nec,nl8048hl11
 
+  reg:
+    maxItems: 1
+
   label: true
   port: true
-  reg: true
   reset-gpios: true
 
   spi-max-frequency:
diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index e808215cb39e..d0ac31ab60cf 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -71,6 +71,9 @@ properties:
           - shineworld,lh133k
       - const: panel-mipi-dbi-spi
 
+  reg:
+    maxItems: 1
+
   write-only:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
index a5ff4de74a15..e081c84a932b 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     const: samsung,ams495qa01
 
-  reg: true
+  reg:
+    maxItems: 1
+
   reset-gpios:
     description: reset gpio, must be GPIO_ACTIVE_LOW
   elvdd-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
index c0fabeb38628..bc92b16c95b9 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
@@ -17,9 +17,11 @@ properties:
   compatible:
     const: samsung,ld9040
 
+  reg:
+    maxItems: 1
+
   display-timings: true
   port: true
-  reg: true
   reset-gpios: true
 
   vdd3-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
index 70ffc88d2a08..7ce8540551f9 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -21,7 +21,8 @@ properties:
   compatible:
     const: samsung,lms380kf01
 
-  reg: true
+  reg:
+    maxItems: 1
 
   interrupts:
     description: provides an optional ESD (electrostatic discharge)
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
index 5e77cee93f83..9363032883de 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
@@ -20,7 +20,8 @@ properties:
   compatible:
     const: samsung,lms397kf04
 
-  reg: true
+  reg:
+    maxItems: 1
 
   reset-gpios: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
index d273faf4442a..d74904164719 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
@@ -20,7 +20,8 @@ properties:
   compatible:
     const: samsung,s6d27a1
 
-  reg: true
+  reg:
+    maxItems: 1
 
   interrupts:
     description: provides an optional ESD (electrostatic discharge)
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
index 6f1fc7469f07..c47e2a1a30e5 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -18,7 +18,9 @@ properties:
   compatible:
     const: samsung,s6e63m0
 
-  reg: true
+  reg:
+    maxItems: 1
+
   reset-gpios: true
   port: true
   default-brightness: true
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index ef162b51d010..0ce2ea13583d 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -21,7 +21,9 @@ properties:
       - jasonic,jt240mhqs-hwt-ek-e3
       - sitronix,st7789v
 
-  reg: true
+  reg:
+    maxItems: 1
+
   reset-gpios: true
   power-supply: true
   backlight: true
diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
index 98abdf4ddeac..5a8260224b74 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     const: sony,acx565akm
 
+  reg:
+    maxItems: 1
+
   label: true
   reset-gpios: true
   port: true
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
index e8c8ee8d7c88..7edd29df4bbb 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
@@ -22,7 +22,9 @@ properties:
         # Toppoly TD043MTEA1 Panel
       - tpo,td043mtea1
 
-  reg: true
+  reg:
+    maxItems: 1
+
   label: true
   reset-gpios: true
   backlight: true
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
index f0243d196191..59a373728e62 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
@@ -52,7 +52,8 @@ properties:
           - const: tpo,tpg110
       - const: tpo,tpg110
 
-  reg: true
+  reg:
+    maxItems: 1
 
   grestb-gpios:
     maxItems: 1

-- 
2.43.0

