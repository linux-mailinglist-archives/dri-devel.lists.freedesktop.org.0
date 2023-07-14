Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7462752EAC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA69D10E7AB;
	Fri, 14 Jul 2023 01:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5A10E7AF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D484C61BE6;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10100C433BB;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298687;
 bh=JwVyMf+LI5609rJcs4u5/6p3F2Fz4dr3IzHJqqJME3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NplkxFIiKaYucIJGPbFI00OchcTXnSS7ITA+imWxJl72VlrHqufd12GBOOKjFvoG7
 oQgonSo7UCsFFiF6KwB2ydLTBxVlRzLfOs/g2oKkWds4L+rM/JKJKv+5pfXBdzY6Pc
 bKPpqkhktjUAvsKI6Sm3UVZkI5QaQRmkXUl/WGSzqDhfUpJD2l5FToFbYdmctrSPbL
 xE50P+kvcp/RhJSIEZlJmQYVcJyPI6z6P+XJd2jZIOPLwfTVtGSHbfQxcOL765prej
 a193TKMDTTtQKMb2o30dkmbicH4WecnNNhK1LCs2+THFoRT6UuV5lFiTXVdew1e6bK
 hMSAWifK9B9KA==
Received: by mercury (Postfix, from userid 1000)
 id 01D3910676F9; Fri, 14 Jul 2023 03:37:59 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 17/19] drm/panel: sitronix-st7789v: Clarify a definition
Date: Fri, 14 Jul 2023 03:37:54 +0200
Message-Id: <20230714013756.1546769-18-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>

The Sitronix datasheet explains BIT(1) of the RGBCTRL register as the
DOTCLK/PCLK edge used to sample the data lines:

    “0” The data is input on the positive edge of DOTCLK
    “1” The data is input on the negative edge of DOTCLK

IOW, this bit implies a falling edge and not a high state. Correct the
definition to ease the comparison with the datasheet.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 33bdf9ee4085..3d24690e891b 100644
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
2.40.1

