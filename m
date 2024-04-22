Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C18AC843
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162C710F4ED;
	Mon, 22 Apr 2024 09:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="2Wi3zNfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA9F10F2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:03:26 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6f0aeee172dso2032784b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713776605; x=1714381405; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3bGwbMVBW9JMkaCtxs81SRVI+X7PdkUKjZQUdNYYUU=;
 b=2Wi3zNfr4Hkl3ynO/J7XqA55gLATSbR4iKI1DyIJiC3jx2+mhLdBDUpEJT4PVdvC2Q
 6Wlf9csP9sJlhgMNzIGDvAV2Y+BeeLxurFVMpwvib3FrRt0dgAZloPP5VxME3rFleeMT
 ZXgDMSe04QF7ftrWo2xe/m2lwS+dsBu+vsRsCxabY5sbuaFaltD2bgHqPVf9b1KAzNDD
 mDrLL3fhDvBRM2s4PBZ3DEXVe72HfTJBP4YNgMqqVYJrM9nd85T0OtbiOW7IOWoo3qyG
 dJWVujeEupMlwfYbkFNN4K4ZL3ULz97wk4e/gNs20ObQlTwk74nBt6UTWMt3shuqk5AX
 7usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776605; x=1714381405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3bGwbMVBW9JMkaCtxs81SRVI+X7PdkUKjZQUdNYYUU=;
 b=UKVuMAbiafJ7QOHHTY73iFlrAfkRf3LCKwVYEQxN887OmfukjkXbf/eoAn9huy/lXs
 6GrUG5rtisyEzz2D164acutNIFHnkNDLNZT7JW6ko2yLsTdpyz6Sc5Ds0r+y/sP7q8SF
 cZ2VsNe93OY+ADfiqq/WydtShQVP76nRVyXMMunybwbvhI/Gczv0317tn+x8IaCizX4/
 Bw4sMFrfzkMOa3Er8Hf/QxUrNWsKuz5hUENh1SBnAp4YgHRYQAYsQc89TrtTr5fU3C80
 wII+uhwZK58tAah5ORTm/UIiJrgSKfvrm0iFZAUzNk/FAMa+CPue0/pw1SRZfafEXuNQ
 nXQQ==
X-Gm-Message-State: AOJu0YxMABZ2HZW/8dMMR4bwl2TRtqKa1rad32lbY1PXdZf6TEKWW8iQ
 PJbArj+D8wIhWeECjaDC3VMxFnwd1WoKAykeCS2g8ilILZcLZ4+3H7q5Kv2z6fs=
X-Google-Smtp-Source: AGHT+IGO2mLo+nckyIM2FhOHlELT6Ndn5AzW9myMeznYDlNxLFym3M9PI3lXcBd3GDpj5c86eP65aA==
X-Received: by 2002:a05:6a21:3416:b0:1ac:3d62:9154 with SMTP id
 yn22-20020a056a21341600b001ac3d629154mr10753407pzb.31.1713776605319; 
 Mon, 22 Apr 2024 02:03:25 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 by42-20020a056a0205aa00b005fdd11c0874sm1919137pgb.64.2024.04.22.02.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:03:24 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/7] dt-bindings: display: panel: Add himax hx83102 panel
 bindings
Date: Mon, 22 Apr 2024 17:03:04 +0800
Message-Id: <20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
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

In V1, discussed with Doug and Linus [1], we need break out as separate
driver for the himax83102-j02 controller. So add new documentation for
"starry,himax83102-j02" panel.

[1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=zBQJUC4CB2wj4s1h6n6aSAZQvdMV95r3zRUw@mail.gmail.com

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
 .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 906ef62709b8..53fb35f5c9de 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -32,8 +32,6 @@ properties:
       - innolux,hj110iz-01a
         # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
       - starry,2081101qfh032011-53g
-        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
-      - starry,himax83102-j02
         # STARRY ili9882t 10.51" WUXGA TFT LCD panel
       - starry,ili9882t
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
new file mode 100644
index 000000000000..2e0cd6998ba8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83102 MIPI-DSI LCD panel controller
+
+maintainers:
+  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
+      - starry,himax83102-j02
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp1800-supply
+  - avdd-supply
+  - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "starry,himax83102-j02";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

