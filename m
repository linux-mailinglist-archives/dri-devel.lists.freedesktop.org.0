Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B28C0F33
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9492210E298;
	Thu,  9 May 2024 12:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kWBKlAWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D3F10E110
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41fd5dc0480so2781275e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256442; x=1715861242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAif8iJN8V1k3wa8UJdZQ5GifnX9nyDTgUZq5/d7HCc=;
 b=kWBKlAWWs25VtzZubCPysJyZLFl67RAjjPTtDGLXF+VcKsGjgC6zLsQZ2eHAx2WzVg
 aJ9i4BXtCVRJuYERikTZlDKPJv1C3HBhERurQwpCk22YPUWbs4MQXfwpDMm4K7SLfVbu
 RYtLKeTzWHEdWqmCvBPj18bc/iW+dgBEWXSgNjIYpEj/bCGVUd64TfQ61DF5HRLzapIQ
 W0nLWZQuTn4Lj6aA2lezybhMvWIX0LS5xGGfkEyDUv3Zbg6wrYYp4rHV5DQH8JUmUrkQ
 2irDbhm+w+LqRH0usJbAMCSEF/xBFnYoxADigHyOEUzbrSX/ZAK3ppWz7GFI4bJJwYTX
 bd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256442; x=1715861242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAif8iJN8V1k3wa8UJdZQ5GifnX9nyDTgUZq5/d7HCc=;
 b=Sk2Wc2JK/d6rSEQxW7yA7b/ooaJfMYp5ey3G8vBaUJU+xBDgnWbdK1Z23cIXotkcMm
 eryHzc9ml5m5HhyKOiBKfCwGxc+3o3qEMG5r/RjvNiqpkyS9aoceGxIcM0RYtGqGzP+x
 WUxHjTQdXJDfr6rvS87jDlZdzwtP0dsGAH/nT1+TIptsEOjGPydPxH2a3dKb29WMB0Jq
 8l0Ng4+hVb8trpENE9k1QtQ72KjzE8M9Z8xqndQTJL1hDurczAXzERBaj39RbZFDW7PJ
 MLhzNxG6zFMvfsycVmXTjqA6lUhZegWpHuc/UbsdmASIMby4ZBALJGOQQI3ulJAKPV8H
 44fQ==
X-Gm-Message-State: AOJu0YxOzcfzU5DWKy8HCaogyGqJGzw3Ii2xVfU3gquQ8/1eWgYKGsIB
 47Tiqssc3Bo57IFBZLWJtFxVsQyI8TcPl4HVGNhLpcwtRlNhKfI=
X-Google-Smtp-Source: AGHT+IHTG1IHRUpJsEvbfsclIDD11n/Cn0Dv06smo6eYHnW+6ah5dzq6AfYFQdIT1VKgAJhmoFvavg==
X-Received: by 2002:a05:600c:5128:b0:418:2b26:47a3 with SMTP id
 5b1f17b1804b1-41f71ecb1fcmr44191365e9.32.1715256442507; 
 Thu, 09 May 2024 05:07:22 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:22 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: display: rockchip,
 dw-mipi-dsi: Document RK3128 DSI
Date: Thu,  9 May 2024 14:07:09 +0200
Message-ID: <20240509120715.86694-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509120715.86694-1-knaerzche@gmail.com>
References: <20240509120715.86694-1-knaerzche@gmail.com>
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

Document the MIPI DSI controller for Rockchip RK3128. The integration is
very similar to PX30, but it has an additional AHB clock.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes since v1:
 - added ahb clock
 
 .../rockchip/rockchip,dw-mipi-dsi.yaml        | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index ccf79e738fa1..fdd1c8ad6045 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -15,6 +15,7 @@ properties:
     items:
       - enum:
           - rockchip,px30-mipi-dsi
+          - rockchip,rk3128-mipi-dsi
           - rockchip,rk3288-mipi-dsi
           - rockchip,rk3399-mipi-dsi
           - rockchip,rk3568-mipi-dsi
@@ -36,7 +37,10 @@ properties:
           - const: pclk
           - const: phy_cfg
           - const: grf
-      - const: pclk
+      - minItems: 1
+        items:
+          - const: pclk
+          - const: ahb
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -120,6 +124,25 @@ allOf:
         clock-names:
           minItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3128-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - phys
+        - phy-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.2

