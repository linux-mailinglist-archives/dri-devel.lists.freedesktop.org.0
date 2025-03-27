Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD0AA73700
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643B410E11B;
	Thu, 27 Mar 2025 16:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ce5NhHFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A210E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:39:05 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id
 2adb3069b0e04-549967c72bcso1232846e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743093544; x=1743698344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
 b=Ce5NhHFLOqSpJ+79dB0MRDBNbpF/CXQlVCuCSEfGG7oLBsK0ahYs49EHOZbOsx60bh
 KhfrREmoAl4s7ln2YxYn5EvH4BevTFwgg5bKO9sY0uN/o0f0s9kvZKjyrCAS+JH8jo84
 gAevPIkjLfzlfTsbmRUGq2kzOnh9ljpNbIDhEse3i3ux397vzuKFQJEOve9+/8QpQ7pn
 MxqUmBU+B7rJMXVFha4YF5T5Iq25YXc7zy4kdYR76emOfnfT+RS/NT/7b2BVcHSh7FTN
 9RqmHNsYCT+0nQ3J29DjdPWvlXpYJ861H4RYfj4vITVaYuS1ujtRl//c+WTeAfRPWzGe
 r84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743093544; x=1743698344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
 b=A3pSBtLRk33EW3vYhvRWaw3zDv8XwCZ/vXFFPufDoIUaehp+/QCeBVpNLZz4XbsC7u
 R3WReZUyy0UZJjrqgARdYZunbAUHjo5MLEhkYxUpuf75MsahCM/vsRh4gjkh8+NyJUw8
 eDCNrq/0oQAGGSFIi/CKqlZ6iuVJsJfBt6ygeDhtsT/e1geKFuJYiL5QVsqD1dx1g60Q
 FR8MRfK/6fEdkvLSW5FhJ1CDP+freaA90VV6RV8tu3RMDhfm1WnMAU4bbifwXtj6oIIq
 IDIrlv4ezEWmpIkIvT4zgaOApj79MtWA+l0kjRvis9vLRqBWwtAgUSE0KBMLAl37Jyqi
 6RhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeu3+qk998NIJmzJdXqE0BAGXZJ7UVcNMzuVFmRFmLsfd1z9PyqzsgmQk4EVjZk8Fn/vTWomhK6SY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Zbx3S/rF/pxFpuxE8alaz3IJqh6ObBJ9BXiJPMiRoyH1wFIZ
 b3TVSg6L1macigy2mXlwp8uzVoRmVJQTU7wcb5Yyc1DHzBLhkAO2ejg9Rrnl/1llUg==
X-Gm-Gg: ASbGncuFDpM+NqOgQjRDtu2FhdxIPmIR7fRit8AyrvhaC/ZljY0OLZqKxh920bmETfl
 0xB/ZFICdElIBQiHSJ3/Xs46/3D1X0dcj3KUDs7KZwX6BcLK0o8Focm5YqWQUP1Ue5QqJbqkePB
 dPjdOWaBbHu8feUttyxR0G7W4T4z7lcZfBaAeU5LOMK/FE0ocKTtekRLGEhcrQAKXEHQHMbAYdq
 u/Hzpe/RbCZKlssngUlmV6itf0ctRMH9dySQHjaDXAmdvHsLAjHQTM8MWKdN99bQhUyQcznYG8C
 aelg3TQUL1h0gBt6BNToZt01vNXtBFu7qgo5JYWjgKP6JKiqtkouQ1lAzA==
X-Google-Smtp-Source: AGHT+IFQwu1Y68UvrgupbE2Y9sQpN7MLE/jssxGsoGgiHHOFdcRsTbQNTBxX/oUs5XurF+hk2bd7oA==
X-Received: by 2002:a05:6512:23a9:b0:545:27af:f2d1 with SMTP id
 2adb3069b0e04-54b012532camr1744900e87.44.1743093544034; 
 Thu, 27 Mar 2025 09:39:04 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0957feedsm10150e87.110.2025.03.27.09.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:39:03 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Visionox G2647FB105
Date: Thu, 27 Mar 2025 19:37:44 +0300
Message-ID: <20250327163750.986815-2-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327163750.986815-1-sanyapilot496@gmail.com>
References: <20250327163750.986815-1-sanyapilot496@gmail.com>
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

Add a DT binding for the Visionox G2647FB105, a 6.47 inch 1080x2340
MIPI-DSI CMD mode AMOLED panel used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Xiaomi likes to use different panels in various revisions of the same
device. A factory panel even can be replaced with another model in a
service center.
So, the power configuration of this panel is similar to
some Samsung AMOLED panels, e.g. samsung,ams639rq08, which can be found on
other sm7150 Xiaomi devices. Even though Samsung panels weren't used
in sm7150-xiaomi-tucana and toco, the described voltage rails exist
(confirmed by schematics of the device).

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/visionox,g2647fb105.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
new file mode 100644
index 000000000000..49dcd9b8f670
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,g2647fb105.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox G2647FB105 6.47" 1080x2340 MIPI-DSI Panel
+
+maintainers:
+  - Alexander Baransky <sanyapilot496@gmail.com>
+
+description:
+  The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode OLED panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,g2647fb105
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd3p3-supply
+  - vddio-supply
+  - vsn-supply
+  - vsp-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
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
+            compatible = "visionox,g2647fb105";
+            reg = <0>;
+
+            vdd3p3-supply = <&vreg_l7c_3p0>;
+            vddio-supply = <&vreg_l13a_1p8>;
+            vsn-supply = <&vreg_ibb>;
+            vsp-supply = <&vreg_lab>;
+
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.49.0

