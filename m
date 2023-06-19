Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E9735BCF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FB310E220;
	Mon, 19 Jun 2023 16:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29A10E133
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:00:13 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687190409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHbRjuKdiFysgzfqzEvaQ0Ei9WRMPnOwZOuIQzlbMc8=;
 b=BySTLyCept8sTihXgpVllMGKAz6c6RQc49JqHCncTrnyXoAFCOl2w4OXCNb+VUGMTLlXfk
 CObja2e2eiGIHvmWaUj/+MEo5O++d95zlnxJgRl8EJhf+ItzvC/AZb01k5ATfHPVazt5OS
 /YkLk+iVRP9KZ6wEHGX2gUhzHSpSHIu70MCOr1XFzLN/T41Ca4DXNH49nySp3HwjskItyu
 KbpJ2NqLbke+PrYNOtov/bPvrc7YaqLq7idBzAu63Hs0vCqi9cqFcDCHS1WBmsKza7C0kF
 1RBadRMTm3jgN9eRHQAUiENqcsbSjdD1GltIfm+PDVkf+9ywa51t1lIiGA4LBA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 634F91BF211;
 Mon, 19 Jun 2023 16:00:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/6] drm/panel: sitronix-st7789v: Clarify a definition
Date: Mon, 19 Jun 2023 17:59:56 +0200
Message-Id: <20230619155958.3119181-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
References: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sitronix datasheet explains BIT(1) of the RGBCTRL register as the
DOTCLK/PCLK edge used to sample the data lines:

    “0” The data is input on the positive edge of DOTCLK
    “1” The data is input on the negative edge of DOTCLK

IOW, this bit implies a falling edge and not a high state. Correct the
definition to ease the comparison with the datasheet.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 605b9f6d0f14..d7c5b3ad1baa 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -27,7 +27,7 @@
 #define ST7789V_RGBCTRL_RCM(n)			(((n) & 3) << 5)
 #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
 #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
-#define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
+#define ST7789V_RGBCTRL_PCLK_FALLING		BIT(1)
 #define ST7789V_RGBCTRL_DE_LOW			BIT(0)
 #define ST7789V_RGBCTRL_VBP(n)			((n) & 0x7f)
 #define ST7789V_RGBCTRL_HBP(n)			((n) & 0x1f)
@@ -259,7 +259,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
 		polarity |= ST7789V_RGBCTRL_HSYNC_HIGH;
 	if (ctx->info->bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
-		polarity |= ST7789V_RGBCTRL_PCLK_HIGH;
+		polarity |= ST7789V_RGBCTRL_PCLK_FALLING;
 	if (ctx->info->bus_flags & DRM_BUS_FLAG_DE_LOW)
 		polarity |= ST7789V_RGBCTRL_DE_LOW;
 
-- 
2.34.1

