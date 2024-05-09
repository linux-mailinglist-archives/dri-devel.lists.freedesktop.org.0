Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C701A8C0951
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 03:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A89310E130;
	Thu,  9 May 2024 01:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="jfvu9n40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB1F10E130
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 01:53:03 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ee12baa01cso2390275ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 18:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715219582; x=1715824382; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YHqY4rvmgjZTcyhKpqKOQRPJuxfie+pGF8qzijOtc8=;
 b=jfvu9n407dTNoKNjg8i5t9deSE8W9asVBQ0fGBPFuXpAj71pdZQYUUyU0SNdgBr1ki
 6kVDDz4sdGwbg5lxcxBr9oknvCZiB3NgtDuo5xtqpW+pKCFe+Svz5UHCzyG6ktAl8Qn2
 d4/AsxGOA19DpWpr+saLrsv5WMWjmRn+hq1ts3JBi3b8l07h9wTrCJtdeIsYJGijebs/
 titemEyFo7fONmKXW3+4jrm+RbW5ussOw+Od4xC5PW/1iLfjGR7Ed9O/uZpQxg3zQNeD
 kjItRTR/wZq3mBP10t/TNIEKi9Q6Ra4dU7LRv8sC6Rsl39dV8HkTtufixqMMbLJbRFSI
 su+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715219582; x=1715824382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YHqY4rvmgjZTcyhKpqKOQRPJuxfie+pGF8qzijOtc8=;
 b=jBJi5ml7GpAweLDNREWzIbmr9T0I7WwtnNn24bjSixCJKbKs7rxRPXuz+NGO04kBXk
 PHuvSCYK9K9ToGRXKSRgR4yX08ExtsWt9XbOGUraUzuZ1mArmeSBmGbLmA6+PZC3LqZv
 F+bwd0eM3lbG1Zikc8ZAh/kSOJPGZua5gZPg0R8xKmRU6Mp9nU+B+gI6zEmH8fdtoOz+
 hw+z/zJwrrh+JzYXB83/qL26Bg90ZFd34/F+rgMOjlj+hB8Rtl6nENj5E/oV0MtUTrxQ
 MmldAwf15PdTHnTZiNx8wRsKfHWsfp4oTnwgNTPnXBoA8u4xlwItuLN2LdImyf4Xb1u3
 UCOg==
X-Gm-Message-State: AOJu0YxbMy83J5IP8ya0m6ipuzFkXhqem9tzR2Zv8SHMnC70DrllBrVb
 gXoKoIpd2irR31ZtIqGaqd6Zt0F+ra3mf1QBEf9QiRc0sR7xoOXj0JycFO1WjEk=
X-Google-Smtp-Source: AGHT+IFJnk1bVPkEQ4uPeZpwIxkhqkI4UKKUovM4m5g3TQjpZylCeYUwHPQ4+7G9+YyNeXiRBK07tQ==
X-Received: by 2002:a17:902:e801:b0:1e4:31e9:83ba with SMTP id
 d9443c01a7336-1eeb049b32emr55347425ad.1.1715219582581; 
 Wed, 08 May 2024 18:53:02 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d15dfsm2117465ad.62.2024.05.08.18.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 18:53:02 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/7] dt-bindings: display: panel: Add himax hx83102 panel
 bindings
Date: Thu,  9 May 2024 09:52:01 +0800
Message-Id: <20240509015207.3271370-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
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
driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j02"
and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
controller, they have some common CMDS. So add new documentation for
this panels.

For himax83102-j02 controller, no need 3v3 supply, so remove it.

[1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=zBQJUC4CB2wj4s1h6n6aSAZQvdMV95r3zRUw@mail.gmail.com

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
Chage since V5:

- Modify compatible format.

V4: https://lore.kernel.org/all/20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- Update commit message and add fallback compatible.

V3: https://lore.kernel.org/all/20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com

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
index 000000000000..fc584b5088ff
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
+    items:
+      - enum:
+          # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
+          - starry,himax83102-j02
+      - const: himax,hx83102
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
+  backlight: true
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
+            compatible = "starry,himax83102-j02", "himax,hx83102";
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

