Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE48A9702
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 12:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75CF10FF8D;
	Thu, 18 Apr 2024 10:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="dLo+nFKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FEA10FB3E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:16:12 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3c61486d3fcso391445b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713428171; x=1714032971; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hGbb639QF70AM8GOOwhigEAHZ87qriZbyNLY03o71uo=;
 b=dLo+nFKVErljJEfGiRZqOLOBNBLbpF9al4pTFGxDeBK2ManmnmagZUuCaBjmAUArGh
 6gXjNYgf1VyIrL48LQ078ZIeefUocoNP8Qhni/7bqg98CM9w/0tI1MAdYmnXHRbpZFU4
 q/tLlSZ1+foH+01mV9BAK3INoqKt+oqXHFPnzm/Hmfdg74OeH0/e/9nXkOy8dx9Hqwwk
 I3+1yCvUdHXQ1OW97uQzazHbfXJIHgRBmbC8XcpwYLhOYeAfxit71DSVm+LS3NNSc9OC
 6T2eR20pDPPSJsy0daXr47c5ARrGpPlVZtxNmB56sUlaJXB9OUs27Bbmgi2tuk22yVoU
 iM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713428171; x=1714032971;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGbb639QF70AM8GOOwhigEAHZ87qriZbyNLY03o71uo=;
 b=mv6qbo4jwbX6XluY6agqJbg6dG0CoCGmyxEjU/uQ2DPocco+cbxJZTGVVMm/PEeo/x
 jitxytA8sgbJSnSm9XIfWGZ7+AFuwD+FdKyv8ikb1MFQzRzWtZPS7j/ONo58yS+Km9xs
 6gX2PM+YfcszLpp5tNHp2f9usY8iRlIgnIbVX7WCFb3prgbBbrACT+uC845Wuap5AJAF
 sTCEdOcdekK5UDQTK1YaxqkI8pu9WN9kyiRaV/A+Ggbctvkn4pur+bOD5XgoHoQKuysq
 9+BjdWCl8NPm4MTB8uw+pFmiotrMBMHjtKpvgmREs3C5Ib1hUYsrUQIlsT66U2ECCrvJ
 eKvw==
X-Gm-Message-State: AOJu0Yy9LKlrvISajyc8Bwl8UFAKwtp1pUSROxx4j2i+ii2zTgFZf1j5
 RcMuK7Mwbvb2OfTo/xf2LIE7YvhXiWJXniAYv2FaD5VrHAeQVkgxCtRn+WQScMg=
X-Google-Smtp-Source: AGHT+IEspyv9P8EY2/qDTHNT4YTY3kFSzuMcr1c0VmB+mBMOVEN4Z9B8GjikmMM/QmHPGVxM51js8g==
X-Received: by 2002:aca:220e:0:b0:3c6:62f:4fd4 with SMTP id
 b14-20020aca220e000000b003c6062f4fd4mr2408154oic.4.1713428171706; 
 Thu, 18 Apr 2024 01:16:11 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a634e52000000b005f3d54c0a57sm881394pgl.49.2024.04.18.01.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 01:16:11 -0700 (PDT)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add KD101NE3-40TI support
Date: Thu, 18 Apr 2024 16:15:47 +0800
Message-Id: <20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailman-Approved-At: Thu, 18 Apr 2024 10:09:14 +0000
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

Create a new dt-scheam for the kd101ne3-40ti.

Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 .../panel/kingdisplay,kd101ne3-40ti.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
new file mode 100644
index 000000000000..dc79a49eea3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd101ne3-40ti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: King Display KD035G6-40TI based MIPI-DSI panels
+
+description: |
+  -This binding is for display panels using an JD9365DA controller
+
+maintainers:
+  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: kingdisplay,kd101ne3-40ti
+
+  backlight: true
+  port: true
+  pp3300-supply: true
+  reg: true
+  enable-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp3300-supply
+  - backlight
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: panel@0 {
+            compatible = "kingdisplay,kd101ne3-40ti";
+            reg = <0>;
+            enable-gpios = <&pio 98 0>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&panel_pins_default>;
+            pp3300-supply = <&en_pp6000_mipi_disp>;
+            backlight = <&backlight_lcd0>;
+            rotation = <90>;
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
2.17.1

