Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680DAD61CE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 23:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE70A10E73F;
	Wed, 11 Jun 2025 21:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RpV9QkIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF6610E73F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749678507;
 bh=1DZZD4FZcsjJllv0se6Cxs7D753+HnCfVphExKcrBrM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RpV9QkIZM07oSWPYP+3CivXV6O8AORZD+eNgWccoVp6DoJYxvOzJK2VGpbfyHIaPP
 NpXFEzNRidq5PYV2zfuhyiLOZsZHqcgIw34LVpolcsYeyNQMc20Jq/Pfl69XE1Bev+
 NAzS26bbewJS99qunCqOyHoX7PLKPre4qPcxtDdDvXXXPAg2Z4mM5wzbzn/O0qsL9o
 c5WPkt1WzMLF3P/uDD5ERyModWtqH8XL2V81zMsp1qT08G3YDrgMwBRSl/k9wEm4pr
 gCUz+aams06njY+b8+tknv0q63P/Y9uiTT8oZptNNUNiy884kdLFiaS+nGHCKZ30Z9
 amPMd+wZLjclQ==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 427C817E14DE;
 Wed, 11 Jun 2025 23:48:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Jun 2025 00:47:47 +0300
Subject: [PATCH 1/3] dt-bindings: display: vop2: Add optional PLL clock
 property for rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-rk3576-hdmitx-fix-v1-1-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

As with the RK3588 SoC, RK3576 also allows the use of HDMI PHY PLL as an
alternative and more accurate pixel clock source for VOP2.

Document the optional PLL clock property.

Moreover, given that this is part of a series intended to address some
recent display problems, provide the appropriate tags to facilitate
backporting.

Fixes: c3b7c5a4d7c1 ("dt-bindings: display: vop2: Add rk3576 support")
Cc: stable@vger.kernel.org
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index f546d481b7e5f496e1684f95edaa2fb97b840503..93da1fb9adc47b20dafc5fb03ee72f458a0f6228 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -64,10 +64,10 @@ properties:
       - description: Pixel clock for video port 0.
       - description: Pixel clock for video port 1.
       - description: Pixel clock for video port 2.
-      - description: Pixel clock for video port 3.
-      - description: Peripheral(vop grf/dsi) clock.
-      - description: Alternative pixel clock provided by HDMI0 PHY PLL.
-      - description: Alternative pixel clock provided by HDMI1 PHY PLL.
+      - {}
+      - {}
+      - {}
+      - {}
 
   clock-names:
     minItems: 5
@@ -77,10 +77,10 @@ properties:
       - const: dclk_vp0
       - const: dclk_vp1
       - const: dclk_vp2
-      - const: dclk_vp3
-      - const: pclk_vop
-      - const: pll_hdmiphy0
-      - const: pll_hdmiphy1
+      - {}
+      - {}
+      - {}
+      - {}
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -175,10 +175,24 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 5
+          minItems: 5
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - description: Alternative pixel clock provided by HDMI PHY PLL.
 
         clock-names:
-          maxItems: 5
+          minItems: 5
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - const: pll_hdmiphy0
 
         interrupts:
           minItems: 4
@@ -208,11 +222,29 @@ allOf:
       properties:
         clocks:
           minItems: 7
-          maxItems: 9
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - description: Pixel clock for video port 3.
+            - description: Peripheral(vop grf/dsi) clock.
+            - description: Alternative pixel clock provided by HDMI0 PHY PLL.
+            - description: Alternative pixel clock provided by HDMI1 PHY PLL.
 
         clock-names:
           minItems: 7
-          maxItems: 9
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - const: dclk_vp3
+            - const: pclk_vop
+            - const: pll_hdmiphy0
+            - const: pll_hdmiphy1
 
         interrupts:
           maxItems: 1

-- 
2.49.0

