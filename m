Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A165F8CA485
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 00:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9123510E482;
	Mon, 20 May 2024 22:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fWMw4YaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA9B10E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 22:39:07 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-23f0d7d2ce6so2464313fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716244747; x=1716849547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aR8AibxJTReEGXY0R6wqnu3H21MC6k5HShCBKBMQDbs=;
 b=fWMw4YaDqbvYb740c14YU7M1XB4baXLgOIt+W3fQf4A2DqaTlOLaOkJYXChL5YBVxK
 8i+vhH8NBGbOLTrVjIm8IFrv8RYjbXzotkPECvMAvcoxFILXW1mnc8/Irs2uknUdSqM8
 FmwALkEEPtRrL2XpcwUzLfPCu1ynKawMbPilg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716244747; x=1716849547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aR8AibxJTReEGXY0R6wqnu3H21MC6k5HShCBKBMQDbs=;
 b=R8DNn/2kl68TlRctvjYqt8oauwOxq/u+Tz7PTTaQRGY4cXVW9RgwZ6XEhVJ1ErZba1
 OXmHL+Q47HS5/FN4r/GPn5wri9vx41blBFy/hOuscQ0kC1Kd3Lxl7YIkVTVNcRwdC0lZ
 kSza+kwUhE6z0pQDWlQUMbBSPH0r/LV+4ngtTA4vlBmXpxQdgTvY6K+bVALiKuEcI/aA
 9mpWUHpYPLEwtftyAdKYmDpinmQaHlET2hlRtRPawsFcdPJ1vQ8XODJuukdgSs+fClPz
 D31V5x/KKpUBukyBuFUAyjDPWaEX2knHRG7+TelOCAFE4L4+DXWzTVeTvPZYnk1ipjkC
 85HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIbm7rDKFijluvLKfNgWwzObRJ+0LVJQY21X0vZjPDoYhqH3pHCB1mpLF6ue8BkeNSjOKAUF6hlr0ecRAqRQ7fqwswwoD/0nAfCBD58JJ2
X-Gm-Message-State: AOJu0YyrUUfFAUzPhO/wBKNDf3PXEB/n9NeT9oJEx4Br1UyhIdMxvOYw
 poS0i60+7tAlBq32oy+so01cH1nR9S7QGrsCLdg+HKYQ4Jpa1QRK9JZSHluY/Q==
X-Google-Smtp-Source: AGHT+IHTPQt3o78K+c+sMR5VT2RVYiVZf9ViNCKwzEtZf2X2+y5ifekJ/AKOo3sL+zDw0QOYNymZow==
X-Received: by 2002:a05:6870:b149:b0:23d:8e24:7234 with SMTP id
 586e51a60fabf-24172fb6251mr37172261fac.54.1716244746795; 
 Mon, 20 May 2024 15:39:06 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:cd20:112a:72ca:4425])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-65bfe03427esm6383999a12.72.2024.05.20.15.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 15:39:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: Reorganize legacy eDP panel bindings
Date: Mon, 20 May 2024 15:38:17 -0700
Message-ID: <20240520153813.1.Iefaa5b93ca2faada269af77deecdd139261da7ec@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
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

Back in the day, we used to need to list the exact panel in dts for
eDP panels. This led to all sorts of problems including a large number
of cases where people listed a bogus panel in their device tree
because of the needs of second sourcing (and third sourcing, and
fourth sourcing, ...). Back when we needed to add eDP panels to dts
files we used to list them in "panel-simple.yaml".

These days we have the new way of doing things as documented in
"panel-edp.yaml". We can just list the compatible "edp-panel", add
some timing info to the source code, and we're good to go. There's not
really good reasons not to use this new method.

To try to make it obvious that we shouldn't add new compatible strings
for eDP panels, let's move them all out of the old "panel-simple.yaml"
file to their own file: "panel-edp-legacy.yaml". This new file will
have a description that makes it obvious that we shouldn't use it for
new panels.

While we're doing this:
- We can remove eDP-specific properties from panel-simple.yaml since
  there are no more panels there.
- We don't need to copy non-eDP properties to the
  "panel-edp-legacy.yaml".
- We'll fork off a separate yaml file for "samsung,atna33xc20.yaml".
  This is an eDP panel which isn't _quite_ handled by the generic
  "edp-panel" compatible since it's not allowed to have an external
  backlight (it has one builtin) and it absolutely requires an
  "enable" GPIO.
- We'll un-fork the "sharp,ld-d5116z01b.yaml" and put it in
  "panel-edp-legacy.yaml" since there doesn't appear to be any reason
  for it to be separate.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../display/panel/panel-edp-legacy.yaml       | 127 ++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml  |  58 --------
 .../display/panel/samsung,atna33xc20.yaml     |  95 +++++++++++++
 .../display/panel/sharp,ld-d5116z01b.yaml     |  30 -----
 4 files changed, 222 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
new file mode 100644
index 000000000000..9e5864de49e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-edp-legacy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Legacy eDP panels from before the "edp-panel" compatible
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description: |
+  This binding file is a collection of eDP panels from before the generic
+  "edp-panel" compatible was introduced. It is kept around to support old
+  dts files. The only reason one might add a new panel here instead of using
+  the generic "edp-panel" is if it needed to be used on an eDP controller
+  that doesn't support the generic "edp-panel" compatible, but it should be
+  a strong preference to add the generic "edp-panel" compatible instead.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+    # compatible must be listed in alphabetical order, ordered by compatible.
+    # The description in the comment is mandatory for each compatible.
+
+        # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
+      - auo,b101ean01
+        # AUO B116XAK01 eDP TFT LCD panel
+      - auo,b116xa01
+        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
+      - auo,b133han05
+        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
+      - auo,b133htn01
+        # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
+      - auo,b133xtn01
+        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
+      - auo,b140han06
+        # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
+      - boe,nv101wxmn51
+        # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv110wtm-n61
+        # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
+      - boe,nv133fhm-n61
+        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv133fhm-n62
+        # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
+      - boe,nv140fhmn49
+        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
+      - innolux,n116bca-ea1
+        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
+      - innolux,n116bge
+        # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
+      - innolux,n125hce-gn1
+        # Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
+      - innolux,p120zdg-bf1
+        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
+      - ivo,m133nwf4-r0
+        # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
+      - kingdisplay,kd116n21-30nv-a010
+        # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
+      - lg,lp079qx1-sp0v
+        # LG 9.7" (2048x1536 pixels) TFT LCD panel
+      - lg,lp097qx1-spa1
+        # LG 12.0" (1920x1280 pixels) TFT LCD panel
+      - lg,lp120up1
+        # LG 12.9" (2560x1700 pixels) TFT LCD panel
+      - lg,lp129qe
+        # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
+      - neweast,wjfh116008a
+        # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
+      - samsung,lsn122dl01-c01
+        # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
+      - samsung,ltn140at29-301
+        # Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
+      - sharp,ld-d5116z01b
+        # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
+      - sharp,lq123p1jx31
+        # Sharp 14" (1920x1080 pixels) TFT LCD panel
+      - sharp,lq140m1jw46
+        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
+      - starry,kr122ea0sra
+
+  backlight: true
+  ddc-i2c-bus: true
+  enable-gpios: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  no-hpd: true
+  hpd-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+examples:
+  - |
+    panel: panel {
+      compatible = "innolux,n116bge";
+      power-supply = <&panel_regulator>;
+      backlight = <&backlight>;
+
+      panel-timing {
+        clock-frequency = <74250000>;
+        hactive = <1366>;
+        hfront-porch = <136>;
+        hback-porch = <60>;
+        hsync-len = <30>;
+        hsync-active = <0>;
+        vactive = <768>;
+        vfront-porch = <8>;
+        vback-porch = <12>;
+        vsync-len = <12>;
+        vsync-active = <0>;
+      };
+
+      port {
+        panel_in_edp: endpoint {
+          remote-endpoint = <&edp_out_panel>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 931d98836e12..b671e8a0482c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -41,22 +41,10 @@ properties:
       - ampire,am800600p5tmqw-tb8h
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
       - auo,b101aw03
-        # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
-      - auo,b101ean01
         # AU Optronics Corporation 10.1" WXGA TFT LCD panel
       - auo,b101xtn01
-        # AUO B116XAK01 eDP TFT LCD panel
-      - auo,b116xa01
         # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
       - auo,b116xw03
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133han05
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133htn01
-        # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
-      - auo,b133xtn01
-        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
-      - auo,b140han06
         # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
       - auo,g070vvn01
         # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
@@ -81,16 +69,6 @@ properties:
       - boe,ev121wxm-n10-1850
         # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
       - boe,hv070wsa-100
-        # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
-      - boe,nv101wxmn51
-        # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
-      - boe,nv110wtm-n61
-        # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
-      - boe,nv133fhm-n61
-        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
-      - boe,nv133fhm-n62
-        # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
-      - boe,nv140fhmn49
         # Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD panel
       - cct,cmt430b19n00
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
@@ -172,8 +150,6 @@ properties:
       - hannstar,hsd100pxn1
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
-        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-      - ivo,m133nwf4-r0
         # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
       - innolux,at043tn24
         # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
@@ -192,22 +168,12 @@ properties:
       - innolux,g121x1-l03
         # Innolux Corporation 12.1" G121XCE-L01 XGA (1024x768) TFT LCD panel
       - innolux,g121xce-l01
-        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
-      - innolux,n116bca-ea1
-        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
-      - innolux,n116bge
-        # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
-      - innolux,n125hce-gn1
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
-        # Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
-      - innolux,p120zdg-bf1
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
-        # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
-      - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
       - koe,tx14d24vm1bpa
         # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
@@ -220,14 +186,6 @@ properties:
       - lemaker,bl035-rgb-002
         # LG 7" (800x480 pixels) TFT LCD panel
       - lg,lb070wv8
-        # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
-      - lg,lp079qx1-sp0v
-        # LG 9.7" (2048x1536 pixels) TFT LCD panel
-      - lg,lp097qx1-spa1
-        # LG 12.0" (1920x1280 pixels) TFT LCD panel
-      - lg,lp120up1
-        # LG 12.9" (2560x1700 pixels) TFT LCD panel
-      - lg,lp129qe
         # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
       - logictechno,lt161010-2nhc
         # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module
@@ -254,8 +212,6 @@ properties:
       - nec,nl4827hc19-05b
         # Netron-DY E231732 7.0" WSVGA TFT LCD panel
       - netron-dy,e231732
-        # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
-      - neweast,wjfh116008a
         # Newhaven Display International 480 x 272 TFT LCD panel
       - newhaven,nhd-4.3-480272ef-atxl
         # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
@@ -290,16 +246,10 @@ properties:
       - rocktech,rk070er9427
         # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
       - rocktech,rk043fn48h
-        # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
-      - samsung,atna33xc20
-        # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
-      - samsung,lsn122dl01-c01
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
-        # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
-      - samsung,ltn140at29-301
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
       - satoz,sat050at40h12r2
         # Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
@@ -308,18 +258,12 @@ properties:
       - sharp,lq070y3dg3b
         # Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
       - sharp,lq101k1ly04
-        # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
-      - sharp,lq123p1jx31
-        # Sharp 14" (1920x1080 pixels) TFT LCD panel
-      - sharp,lq140m1jw46
         # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
       - sharp,ls020b1dd01d
         # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
       - shelly,sca07010-bfn-lnn
         # Starry KR070PE2T 7" WVGA TFT LCD panel
       - starry,kr070pe2t
-        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-      - starry,kr122ea0sra
         # Startek KD070WVFPA043-C069A 7" TFT LCD panel
       - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
@@ -359,8 +303,6 @@ properties:
   enable-gpios: true
   port: true
   power-supply: true
-  no-hpd: true
-  hpd-gpios: true
   data-mapping: true
 
 if:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
new file mode 100644
index 000000000000..765ca155c83a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,atna33xc20
+
+  enable-gpios: true
+  port: true
+  power-supply: true
+  no-hpd: true
+  hpd-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - enable-gpios
+  - power-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+        vpll-supply = <&src_pp1800_s4a>;
+        vccio-supply = <&src_pp1800_s4a>;
+        vcca-supply = <&src_pp1200_l2a>;
+        vcc-supply = <&src_pp1200_l2a>;
+
+        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+        clock-names = "refclk";
+
+        no-hpd;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            sn65dsi86_out: endpoint {
+              remote-endpoint = <&panel_in_edp>;
+            };
+          };
+        };
+
+        aux-bus {
+          panel {
+            compatible = "samsung,atna33xc20";
+            enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+            power-supply = <&pp3300_dx_edp>;
+            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+              panel_in_edp: endpoint {
+                remote-endpoint = <&sn65dsi86_out>;
+              };
+            };
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
deleted file mode 100644
index fbb647eb33c9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
+++ /dev/null
@@ -1,30 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/sharp,ld-d5116z01b.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
-
-maintainers:
-  - Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
-
-allOf:
-  - $ref: panel-common.yaml#
-
-properties:
-  compatible:
-    const: sharp,ld-d5116z01b
-
-  power-supply: true
-  backlight: true
-  port: true
-  no-hpd: true
-
-additionalProperties: false
-
-required:
-  - compatible
-  - power-supply
-
-...
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

