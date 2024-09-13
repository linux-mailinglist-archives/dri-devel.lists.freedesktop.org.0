Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1213978364
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F7210ED1F;
	Fri, 13 Sep 2024 15:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPO+x4rH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FD910ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:22 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso14253561fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240101; x=1726844901; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wMPOrMm8jMnc3632xlKhYJc7ApymMUVT8Ea4A90ExoA=;
 b=QPO+x4rHhOrIZHunh59El3+0kbaK1RiG2ZW3L5hVlp6Cyn5pfla1h2Xq9khVHJWIdq
 MioVaUEq736uwwBX4tmPNKriZF7CTDoJkiT/YoJxwPagpdFU4ZgnFmfyd7P5Ay6HQGXg
 Fc/mltnbwPVPszgLd90qmDlXa6y0dW563csLVCy6R734C1ftYrmIKpbgEZWId4B1DbrO
 A69wesN0NFvztUZMzwxUG/C0r1qMsw3sdq3yAfXa7WhlZ+6C7It2IcpXP31C9dQPb6zd
 5j67SLp2ft/ZT9CacRIA6bJz7cceFBP8TKSEgXGN5eqLZdbzEyhEroCW64HBfavRXtm2
 dUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240101; x=1726844901;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMPOrMm8jMnc3632xlKhYJc7ApymMUVT8Ea4A90ExoA=;
 b=hbuARyNrs7upN4gSNENkTbD942/g60ZKMitS4TlmhzG8u43BqNQ2v6lqvrzvw0ugTG
 Ysz5l0pESQuS2CtKDax2KjdDk54kx4IfPgrHbQyCGOyN9rSBp9OGMCf5iiX3j+deYmRZ
 CemFS1Jc9x+CI3OQIEzanahRXztzQ0b1elZ4smwBYKlpuKw0Kz4RkIhQllNVlvB8BVQZ
 +XIhF1nSo5z872gBCCcEtZ3t9L/6+Qp6QiDrxujUkAJU1KJy2mETWkARuq2smVDP3lSh
 gbGeSm8LYIgRVU5+eDacgVhXgO3CSUw/SPTN77LawRijqH2XbdqkLQzJ8CANSGAfoeS+
 jCCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOY29Hdv67Iiy2f7nuKtshMMo9mU/ha7FMKk/euECruBq3sog4+I//CoLEsWo1hyMVddmXZtdvIUI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2GeVkUfwUXfg7fprO/EKlQYrgXQV/Ikk9aUHJ1WsSkQNUZzeB
 64oBCzF1wbCLcX+X8yFESVRuNg+CotpSlPB/LvohkHr6WUmlQ1v9
X-Google-Smtp-Source: AGHT+IHOq0ajhiiX6/2VDkjD7OIJvbRCL5YZQQ8Umg2mhAbHCC7u57QfKrIJ12XBt8uKlJFFSVh4Dw==
X-Received: by 2002:a2e:742:0:b0:2f7:58bc:f4a9 with SMTP id
 38308e7fff4ca-2f791a0240dmr14340641fa.22.1726240100649; 
 Fri, 13 Sep 2024 08:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:20 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:47 +0300
Subject: [PATCH v4 04/27] dt-bindings: panel: add Samsung s6e3ha8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-4-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=3064;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=lHC11SnBOPQNkFZuoSqA2ydkUDzKzto52kps1UXs5lY=;
 b=jrZn354suum7/Hl3EqQfo4nUjsVOjlJpUtGAs4oA02Z5jNsaEdnyp9+LALkOuEXzg4g+kRD6F
 bQbl+GqoobHDb+a4BWfUNyHCkRBfDKaSiwpo1UEHKMmNnNi444+otJO
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add binding for the Samsung s6e3ha8 panel found in the Samsung S9.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v4:
- change dts example intendation from tabs
 to spaces
- remove reset-gpios description
---
 .../bindings/display/panel/samsung,s6e3ha8.yaml    | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
new file mode 100644
index 000000000000..94c812e07571
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e3ha8 AMOLED DSI panel
+
+description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung Mobile
+  Displays (SMD).
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e3ha8
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  port: true
+
+  vdd3-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  vddr-supply:
+    description: VDDR regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vdd3-supply
+  - vddr-supply
+  - vci-supply
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
+
+        panel@0 {
+            compatible = "samsung,s6e3ha8";
+            reg = <0>;
+            vci-supply = <&s2dos05_ldo4>;
+            vddr-supply = <&s2dos05_buck1>;
+            vdd3-supply = <&s2dos05_ldo1>;
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+            pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
+            pinctrl-names = "default", "sleep";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 52b72d212c18..b65cfa1d322d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7381,6 +7381,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
+M:	Dzmitry Sankouski <dsankouski@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained

-- 
2.39.2

