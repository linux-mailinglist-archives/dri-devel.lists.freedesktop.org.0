Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC6DAAFD31
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0965C10E885;
	Thu,  8 May 2025 14:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hZBgmd36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E227610E3A7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 14:34:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a0b0dd3b5bso67909f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746714898; x=1747319698; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CgE2WTGiWCfnc7NeK2kSaYgY56zlNeLCAVlMEt66+W4=;
 b=hZBgmd36Fr1zOXMOZq4ArjfiHJUiXIj03hB+rFJZxyhT3Y5u/OHTI0RCBbt9jt0gIV
 wAHVPk6otaLQCcaZyvWxlhc8KhD5duHE6CpHV3z3Oc+2VqTaC5ctEVz6aR9htJ7xmWBh
 JmAYLCq/iCij252ormQGIbTXoS/AWRVgKBJBTQmaZSqXKt6j06F7R2OXJZcxlB/M3nAn
 +1xzEWs+UyldNOLyCsJpKsSbzOQfIsRemEQymij667r3a++ltupA1c4Dk6Tlae6G4RcQ
 AOX+dkjoFMfLFqubp5aeLorMy5DJeKLcSaKWGRr+K1ABzUbQ0EOaVgqVSa2Td+alUOZ+
 bHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746714898; x=1747319698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CgE2WTGiWCfnc7NeK2kSaYgY56zlNeLCAVlMEt66+W4=;
 b=fe+GUqn0tVlNsi6WSBwfJr0oYGJfo9cVwvUtsOzafRvpzdMHs2Ab9h/9eoaEkDKm3c
 ZG0G7okmL9TopWGRzdCz0RgUNEpVvkoMphYo+LzO8eBmSEPEsNAYbYwFWpusgTgZbByX
 qvKd8QWepGjNMYSI/25WcmEEGZsEPfiMqHmWLetF+NfTqYjXMriXHfraQdrRQgeFXeAV
 q0BQ+pq/Gs2bna6KYok6saVK9cJQWyd6PXJQVgcP8bcbbvU5ebDHX0Pi+GAs9IdcGjL5
 CExCybK+z4K8MwTDTkAsOIhr2vexkIqYD/REgRZYi/ZZvFw2s9W8aCwRdYvfA8tgc+Rv
 Cyaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG5RsbiKVlgORmG22LQEWIkZ9LWw9XkVPOVB1tpzBFHq820iK+ulF9QCGQqEzx2X4ZLiBGZ8CjwmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO3PLlHJAvjL6K53Ac9/hIhcQEGI/4w96NSOcMsU+ABlAaVwEJ
 m6iq64pQFff/nNjrIzPDyITpHNtYEaE/H20x4jwSWkKHxyWQvNbbFWzJl0KnO8g=
X-Gm-Gg: ASbGncu6qqiDe0+fNOUVU/tihc5gchNDAh7av+wwBoMGHzWWuwYR1/32CZGIpB1PSaY
 T6XiRZuWydCQiDNH1VLi4dTG5gDcv9EWKzWHCMtzgcmXnvIzLLcflbGk6bA7ai/RVg1nkDk3YJI
 SvugDV5NZeNuo5oq++IhDlciZdrB55Ey5pnoibeFTruB6LtbzWYdvbOQa+XzfcNLJwQnxX+ruCy
 DUwKv4/dXe4YwigvVgycgOwqMMtupoSrZflk0BAdnkpbT8TlGIq1SMT9YigRE8bH3iuyzBt4GfL
 T28eKDc8ArTf+L4VEHLkcBgz7liiVfG4NAPWwMu1jTWFf1ayhrDMyQWD3qvHmq9f+P9aQw==
X-Google-Smtp-Source: AGHT+IEgjVH5Gai2FzOEVQtWx4KBZsH4RW/ea4Ooz9CuY44fNFqBtMuk7B+eAGIxo+lKJuwlVs8f8w==
X-Received: by 2002:a05:6000:3102:b0:3a0:ba92:1d65 with SMTP id
 ffacd0b85a97d-3a1f5cae727mr26929f8f.13.1746714898322; 
 Thu, 08 May 2025 07:34:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ec98dsm149861f8f.25.2025.05.08.07.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:34:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 08 May 2025 16:34:47 +0200
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37801
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-sm8750-display-panel-v2-1-3ca072e3d1fa@linaro.org>
References: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
In-Reply-To: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mmCgVzQJzsiJHsxsGKjiL+gLKzhGedNBIe0oSKTyY9A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHMENp/XQ3L9Ceixx0GdxKwlWYq29nkuBqz4/g
 zpB0pEbXZWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBzBDQAKCRDBN2bmhouD
 1xwQEACK7E6RLBULRANTgFxki4/bjEzEZqHz/C2ZLnRF4rVP/t2FAwXH03sxR4YRSQOJshMJS0h
 TK15qHGGB7vFzf8fJBGBUw81EHbO7v9gbOdrWD1hdNqhAN9MBOIEFbnqM0cxrNcK4WATTW6G/X5
 s9ToeTeaCs7RGhnw7V9gHUhmF+eohsiyD+/u0tSTQHyHqBwVIoPFkmnN4TzJB5HIQ81wov/jnQU
 c3cGptsEk2cqQFrT1/zq71jJNRzYRHf33SIPS5fitfZMo2+nO/XQ9phGMrwmItpIJ7CMd0np65k
 V4MLSIH/5P0jUh7a0bq9Ek2ln+gKQkNq3RTpIJ6Zv/65qwidow6oQBuiH7PGFgMOdlGR6p/+il1
 A8wra//JSw6ZrCBrOT1Q0ajj8ptufw6nVBtoFB11oH03K3Ip3+s138FW68nj7YuKOwJ6l9LbStv
 PwA0EM4z72U7e3W3yschxw36/4wehM/p/GGKZ6S0OQKHDAE2aeoRM1td3H4JxtU7p435JwjDjtU
 DZlBWSpNq4IPOCorzCr65Zjl7+zSijWDU6OqaObAi9fjFlbgYXV5N5x9xnwA8IGAMpkGUHTdkzJ
 0Be410F9QLYdNCrjNIAAT2qYQkZC0+vedAsXtqb3nmu4zHzwvBLwvl4rfFCer8/RqXwasQiGeI7
 LQcpDtXLbfeSHNA==
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

Add bindings for the Novatek NT37801 or NT37810 AMOLED DSI panel.
Sources, like downstream DTS, schematics and hardware manuals, use two
model names (NT37801 and NT37810), so choose one and hope it is correct.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/novatek,nt37801.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1b38c1d0af6825341e047af57584a93261e7af2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37801 AMOLED DSI Panel
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  Naming is inconclusive and different sources claim this is either Novatek
+  NT37801 or NT37810 AMOLED DSI Panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt37801
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vci-supply: true
+  vdd-supply: true
+  vddio-supply: true
+  port: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vdd-supply
+  - vddio-supply
+  - port
+  - reset-gpios
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
+            compatible = "novatek,nt37801";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13b_3p0>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.45.2

