Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BB8C0CA8
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 10:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1101210E2FA;
	Thu,  9 May 2024 08:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="T5EXe8FN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126810E281
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 08:35:10 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id
 46e09a7af769-6f09ed75e4cso308089a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 01:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715243710; x=1715848510; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oqO7pR16Targcl+ULRUcXbcABQhE9U7T7xWKnAilQyg=;
 b=T5EXe8FNL2ZJcA56qjcKMuZyhdhGacq9cuGGVhqWqmvvLqOHUyRtjuj5h9d3FqccG1
 M/YlUaij3MwhKZn16i9aK8QrdsaaxEfEwy42hYc/sKGAfD35a8+RgMCeNDxXcxr2Uwvh
 Z6VlA6H3JgmR0I8ELWIeomEffKJNU62Gu+7M+5ZV35ko8jz6b65IKWvYk5bz3QcVlO86
 7RLpc61Lo1O2CTj4lkNIigHVVefdeqzF/4TaAyIPFS722ylSBNIt+Bbp3wVNSmtZDRgB
 Fu++uoJZ2qkFKWevW7qz6E3/SQ6FXG70732zXvnudAR8MtUgw4k1Nzt3I6yUdCbN/mnk
 wWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715243710; x=1715848510;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqO7pR16Targcl+ULRUcXbcABQhE9U7T7xWKnAilQyg=;
 b=qZco7krqJBFXhxQ5Q7cM9BtmMd9lQo7yRK8/f7Kbat5xXd+joaHRZlzCCvdceXAHOH
 /zZRcMwfqBspDxRGnQzMMqe/RYRHgpZgA9uEoPDWfXs88u0h+ia/OlEofyIgBw6EC7z5
 8UkJnIUX1dRjQ93i0XD8jilh1M7Je+SD2wHrPJapcs909bLGtgxYGJ7J0PfUvqDQaSem
 S8ctPCs1j+WPkvzb6Ofk1skBVdpXSWwlUdv8LNzsEfbwJjUiFskvetG2Dx6pXs276wWD
 RakGsN/elPszQjhiulNYnurXlGGYoHrhve/6Vp3f/Z0qQONqyOaAUs0WWtDRAfguHyq4
 OveQ==
X-Gm-Message-State: AOJu0YwRXTsT1PQj1zvTA3RRJP1I2MSf/+XLWLBLufXiMToVynK/DPlL
 IkHnq4u644p+NM4Vgz2GeXz/HjO1I/JfIhlK8cncKiJ1Ay1PLJDHFd6EggNMT7c=
X-Google-Smtp-Source: AGHT+IGyfXvc57xRXt/nPbK8uIuvRWBNkaxTWjEfIN9Wd7JCyZ+Mecf4mBxMjFjONY6D2w6DXitOqQ==
X-Received: by 2002:a9d:6f1a:0:b0:6ef:9506:ca2c with SMTP id
 46e09a7af769-6f0b794614emr4614967a34.10.1715243709979; 
 Thu, 09 May 2024 01:35:09 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6340c8a6967sm792643a12.44.2024.05.09.01.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 01:35:09 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Starry-er88577 support
Date: Thu,  9 May 2024 16:34:52 +0800
Message-Id: <20240509083453.14073-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240509083453.14073-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240509083453.14073-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Create a new dt-scheam for the Starry-er88577.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Chage since V2:

-  Unmodified

V1: https://lore.kernel.org/all/20240509064959.23550-2-lvzhaoxiong@huaqin.corp-partner.google.com/

---
 .../display/panel/starry,er88577.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,er88577.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml b/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
new file mode 100644
index 000000000000..6686beaf0f16
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/starry,er88577.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starry Display ER88577 based MIPI-DSI panels
+
+description: |
+  -This binding is for display panels using an ER88577 controller
+
+maintainers:
+  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: starry,er88577
+
+  pp3300-supply: true
+  reg: true
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
+            compatible = "starry,er88577";
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

