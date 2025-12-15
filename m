Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2888CBECCD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA2810E6F9;
	Mon, 15 Dec 2025 15:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IZIenGtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AD110E6EC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:58:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so36546415e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 07:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765814294; x=1766419094; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z0OD6Tul6N7Ac9c9vQK1/GWaIUr26ez2juaXAYXKN8s=;
 b=IZIenGtE0ssViCrWTtAvm3Gou2x2xSCg/SGhXYcnwWPrmAT+ggMJ4NA36WDikReht2
 IxDvKP1yPBRrq4n9WLW3nhD06GXWyTpd4oBdfmKySv4y6WAtwKvUm+MuS1Dsr4a3NjsD
 xiFCB5xn+ZT4yLIzJYa/RMe6wVHz+HvabNSHwJz0b+rkdwMronwCdE/P5/PESp69JXjS
 u6X+o4GMNC0K3VWNt/aiSymh1AfmOv7QwbbWIJYHbahjOmQOjgNqcmIpBNAiuac54uWp
 Iy6R2UWfNT5rwcUyJsQO8EBeoiVgRh+XUxE7r4vCaASUyVCj06ykQ3eSIrIiyhJtbCVV
 mQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765814294; x=1766419094;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z0OD6Tul6N7Ac9c9vQK1/GWaIUr26ez2juaXAYXKN8s=;
 b=qcGqkKQbcMeWW+KovH4vSKr0jqED76StJPeufpC/GztbqNq6fVnspNmQmoxsVHPeLH
 2jW/gG8shmCcK8lo0BQ3Pj/q74dFE14T3PcWv3l4l2VvsmoYOBCh1aB0lP04ibYXpNTt
 i94FnKa2nNWL3oUP10Rx3CwMxTLIOt7wKD48uGQZUwFOHDfk5Zhk3nVuQBJFwmQXXmte
 wRVOBAOL5cu9J8zFNI8kBAoGIJqKAW8S29ryOA5/4GTiRDUnK86GCEw1i7EJkR4Z23vo
 odn6Xqn3XtZoW22FSXI4sGR7q4i40S6zx8bqIBcIaAaU7lZJk3GV2OqjxSMgXq8pcjha
 casw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwtDzPtS7p2bjtJ6nSfIU2JmOrZsaQlFmBZuXiyTjfGWhRPsL7Ctme06RswUBpl347F7SzO4+pPmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSYLyug7hMn/p1LhUU+ToT3/A5FKOyrNZ5E7effK93dag/bxoO
 7NusQkPq0mwpz1s1fJgMxtA6WBauEUDDH/eco6l1vsU3Yaj00XugB9vr
X-Gm-Gg: AY/fxX4vuL0rq/bqqd72LaK/cjHTXMl9DRAfSrhJ//g9ECAhEC7rmU1EJzyNz/QLgyI
 /e1TFMtqYV5UMVruF8Iek/G7KxfsGyiecX61lyTb0MD4cd4/mNHZ9BBWrlAynKl/RHPwsYksBiT
 bTK3S5jQnLv7VUZJ0OBhqfMaonPsaHgkQvadnvCvrxLtrvNJttKvY42WDiVNaLCemdHOoOIckBz
 ebey7ZEQFTdh3dYRU0s1HRb2ZGUPuA8VqCC9N/uwsRwtuU+77M1deWK8XlhHW8TnDBER5KMOkSL
 QOQE37RB7g+vl5LoSz6Dj9qVHbzPSEHZ7vOxDVrDrseyMWH9XuU102QU9vs4CHe+zGAiN//G5OY
 kLkB3+c08BwEqRpjMf3eVbaUk0Manqx6Q7wDYvCeXXnaba/jui+Sr11y2ybxdd4mkxgwUUnO7QD
 AHpp4O2fRrmpBPWy/5jjsdUc565wopUh7+tFF+IO0cyBrCsrdf14DEMg==
X-Google-Smtp-Source: AGHT+IHIv9GfANx2GJGw837onoHtnktqmhdBJsBRBvIpRijBv0m5CUdwq2om63NLs11Z3pgCalnZBQ==
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47a8f90d28bmr119871915e9.30.1765814294213; 
 Mon, 15 Dec 2025 07:58:14 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.238.173])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f3a1be5sm70209665e9.1.2025.12.15.07.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 07:58:13 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 15 Dec 2025 16:57:54 +0100
Subject: [PATCH v7 1/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-st7920-v7-1-36771009ec01@gmail.com>
References: <20251215-st7920-v7-0-36771009ec01@gmail.com>
In-Reply-To: <20251215-st7920-v7-0-36771009ec01@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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

Add binding for Sitronix ST7920 display.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../bindings/display/sitronix,st7920.yaml          | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c4f006fc41e1f472939725bd82b86a649f9b3f56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7920 LCD Display Controllers
+
+maintainers:
+  - Iker Pedrosa <ikerpedrosam@gmail.com>
+
+description:
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
+
+properties:
+  compatible:
+    const: sitronix,st7920
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides 5V Vdd power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 600000
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sitronix,st7920";
+            reg = <0>;
+            vdd-supply = <&reg_5v>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.52.0

