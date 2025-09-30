Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97959BABE62
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1010E51A;
	Tue, 30 Sep 2025 07:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="oZodMVSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509610E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:51:01 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id
 41be03b00d2f7-b4ee87cc81eso4936795a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1759218661; x=1759823461; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/whcb5d7/6RJGlKNOHW7Q8j/jljATqJnqXZint8Jsw=;
 b=oZodMVSsaROtiX4xE26t8j4EKMWB/L+4bLHsgSzSTqx7W6l4G2gIpO254SY4xDPHIz
 DBfhJ8AkcMBjU1UVDlf0nxA2eVu0tWTgnqHHzLal7DxUHzaLfXFglGAtpbcMohyxXXsd
 WUnbkFmJpvH6xXdv0KV1ervNNFyXzBbE0usAK09olKu5THfFNEPTh8VpY4mXsI8qiKer
 B85WMzfcjtvITk0/r1f0Jm/iFa8AM7Cw28YSRcX47P2ndz5HUKvjh4NfdEgZ+9QQJ1rY
 z1Gh5ezKtnNpFVsXh40I+kWVA8Y415EBDQXgYv6gIqy2Ud7hIc2J587lwSS/ZEZz/KfI
 loLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218661; x=1759823461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/whcb5d7/6RJGlKNOHW7Q8j/jljATqJnqXZint8Jsw=;
 b=I3aCzgOQ9bhkDkggsvpqZ75esGpypn5h60xsac9cLP99OM3X+mOxedLteGlEGmBKVn
 ngHAnmXdlTXzlTYEexfeiAOlJoP0q0J/heX22gflA47/AeV2AEAfTNO7PUGyIvL9JFRa
 ilePVeU+NjH9Bss6DGhH1LDFugt0RHccM6yoiiiJChyCLk1pXS1tNFwmeEo5XYGfmDzT
 k+EOHYK9/JDaPxToSl2PwVH/LtwoKAJcZ2wggWVC777fD0PiD/MdgLPfc0/oc7WmaBIX
 PCKQQkbVYvx4uAO+g7UxqGhx14wMBSjEnIpHThPOztZdcxXW9zmno+9K8Ps5Zzr4rtu1
 VAIQ==
X-Gm-Message-State: AOJu0YwTWaL3ANoiYlGT1gHXHqkM3Fx2GGAkUR2dIAnXRuEHZQMsErmJ
 3oj4q1O1EMdsBYcEiOhCJ9H/IfGISn7OfueWtOvRCJMoPbFsn5EEFGB1a1Ubxu7+ktA=
X-Gm-Gg: ASbGncup70VqVZyqD7oEmnidszlePT6n9vTOBNznXhbvqzuWIXNuQFxo/RM/rPernTf
 HGFWS3/iojX4XSFB3yIyTPByz+jLpXnmd/iV3SsuCyVnYMMdJg9vXEU8IRbOrAlsdvy/rSOdr+U
 SPPrF6UDqKXT6Mei8Sny0N7bZsQr7aqJkQqHnMzc9aslpOjRHZgqnzcuoXlBgfFgBYxTn8JGzO1
 eeO85f+Sjzv7dUUbGs+Z1AB0iuHr8AaThDF0nFZfJCCb4MVsbvfhL0eu0q1/6YiEAtX+lnjTmP5
 vN4dKW3aZ15xUVykH5RHkCChrPW4SxUZ7rNcM6vEApQNkjM6BAAJDJAWA8wTvbHlKc9zcqUuEW/
 qayvhp3dyGqZ5sCIHXqwZJWvOU982KEMKYh8e89LCS/y50OfPrd2/w8J+lJV2+w0jx9VRNoELA8
 Ov39u+W/cnz5v0Zm4tlfKbyAkmxDlF+krnvixF07k=
X-Google-Smtp-Source: AGHT+IE27yfFnalXswyaYjSz94Su9vVfjr1kOzMMqId+LH8jlsFm4Xvsohy1cY8MeUbkA9K+KofzuA==
X-Received: by 2002:a17:903:298b:b0:267:8049:7c7f with SMTP id
 d9443c01a7336-27ed49df3bemr209524225ad.7.1759218660594; 
 Tue, 30 Sep 2025 00:51:00 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed688223dsm152313565ad.86.2025.09.30.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:51:00 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add Tianma TL121BVMS07-00
 panel
Date: Tue, 30 Sep 2025 15:50:43 +0800
Message-Id: <20250930075044.1368134-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com>
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

Add device tree bindings for the Tianma TL121BVMS07-00 12.1"
MIPI-DSI TFT LCD panel.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../display/panel/tianma,tl121bvms07-00.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tl121bvms07-00.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tl121bvms07-00.yaml b/Documentation/devicetree/bindings/display/panel/tianma,tl121bvms07-00.yaml
new file mode 100644
index 000000000000..e654b86782e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,tl121bvms07-00.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tianma,tl121bvms07-00.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tianma TL121BVMS07-00 12.1" MIPI-DSI TFT LCD Panel
+
+maintainers:
+  - Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
+
+description: |
+  The Tianma TL121BVMS07-00 is a 12.1-inch MIPI-DSI TFT LCD panel.
+  It requires multiple regulators (AVDD, AVEE, and 1.8V logic)
+  and an enable GPIO. Optional properties such as backlight and
+  rotation are inherited from panel-common.yaml.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tianma,tl121bvms07-00
+
+  reg:
+    description: DSI virtual channel number
+    minimum: 0
+    maximum: 3
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for the enable pin
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  pp1800-supply:
+    description: core voltage supply
+
+  backlight:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the backlight device.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Input port of the panel, connected to the DSI host.
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - avdd-supply
+  - avee-supply
+  - pp1800-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mipi_panel: panel@0 {
+        compatible = "tianma,tl121bvms07-00";
+        reg = <0>;
+        enable-gpios = <&pio 25 0>;
+        avdd-supply = <&en_pp5800_mipi_disp>;
+        avee-supply = <&en_pp5800_mipi_disp>;
+        pp1800-supply = <&mt6359_vcn18_ldo_reg>;
+        backlight = <&backlight>;
+
+        port {
+          panel_in: endpoint {
+            remote-endpoint = <&dsi_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.34.1

