Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4E849E1E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 16:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DE510E5D7;
	Mon,  5 Feb 2024 15:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="w6kjYLuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D239510E5D7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 15:28:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TT9BB6x4Vz9sSw;
 Mon,  5 Feb 2024 16:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707146595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMiu8mBySgExM6KnP08YCgNs308ubxzfSD1bMdoSvkY=;
 b=w6kjYLuCRS3PYRkS6IqG9bJQWNXSkIeBNUQ0a/K9Q3EmD2SqZ9dyoKN1X+kvFkc+kcq0fE
 3ZGSTlVdQ/emHV4ZSXkzYMw2jzA5Iw2bYOgs4f37ss5kISEkby6ruKD05m3dWKM9djXBFp
 KDVFgvoHsC+IjL7XKQ0qmMQSAh2B15bNpriFEe/YhwrORFqQBr1f73CSwMCWkAE7lao7Ke
 mOt0Wmkqh+lKRt8KZ+uKLgFRaLYnA+s4L9VoFjydLO3dj1SznAntvNjJ9+ERCruWlLlZW5
 xqFmQEqzkRe5F1W4sTAdkVKOCN62t1issOg6UbWjwLLrqnD9jz8CGWJMyUhByQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 05 Feb 2024 16:22:28 +0100
Subject: [PATCH v2 5/6] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=LSFmengqkqFNIcTkqiKdRYtwv5rLf2wHfu4gB3QVAfo=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlwP0/wUrDb0L4eaQ3AOCfpz1m+nA/BCEEvgN2u
 7U9SQoHUPmJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZcD9PwAKCRCaaaIIlErT
 x4kRC/4rCGnrv1sdHdQhxuE+E7Qs/Ixz80c+RlRevhWxSLuchp7r/ZRPGL8HBukk/gTMbsbHW9m
 B+eVzGS02ZXLAmI1dwPxqdojPbw7i1L2aBa9yfm0MGh1YBRlHA4PXiFJ51RT3Vbb3GZG4OMp528
 o/z5QdRbg+0ArhHok8ahCtbtArSEkBIk3NmOmd+u7m2Ei21wXiN5/fPLILnLLutplZfYd3BqE59
 4QkwFX7Iq2mjK/2rpnLEilhv76Bh5hwBrL46RchB/NgflkWArkO1TImCQWM+c8lOOhND1ws6wCH
 J5kgYo7XlEtqxOL18kcu7AkIbr1lg3etPq5xoSrefTZlJcmRK4jm7BKVJ6E5yIZUYJwOSl6dyra
 Zt+Cs/Ciow0CWZxUZmwdYgTYhO96y9Nf30Xu3ffDTS305T6Kf1PooAdFnOyLwDArpj3XtfM6cdZ
 ukgrNAsTLOicxp0C6hGAxj+yWW+ISTaRwNyREGjCvAAbafE/Dy+25QHlzPnSM++ROsQ7c=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4TT9BB6x4Vz9sSw
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

This panel is used in the pinephone that runs on a Allwinner A64 SOC.
The SOC requires pll-mipi to run at more than 500 MHz.

This is the relevant clock tree:
 pll-mipi
    tcon0
       tcon-data-clock

tcon-data-clock has to run at 1/4 the DSI per-lane bit rate. The XBD599
has 24 bpp and 4 lanes. Therefore, the resulting requested
tcon-data-clock rate is:
    crtc_clock * 1000 * (24 / 4) / 4

tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it requests a
parent rate of
    4 * (crtc_clock * 1000 * (24 / 4) / 4)

Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.

pll-mipi's constraint to run at 500MHz or higher forces us to have a
crtc_clock >= 83333 kHz if we want a 60 Hz vertical refresh rate.

Change [hv]sync_(start|end) so that we reach a clock rate of 83502 kHz
so that it is high enough to align with pll-pipi limits.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index b55bafd1a8be..6886fd7f765e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 
 static const struct drm_display_mode xbd599_mode = {
 	.hdisplay    = 720,
-	.hsync_start = 720 + 40,
-	.hsync_end   = 720 + 40 + 40,
-	.htotal	     = 720 + 40 + 40 + 40,
+	.hsync_start = 720 + 65,
+	.hsync_end   = 720 + 65 + 65,
+	.htotal      = 720 + 65 + 65 + 65,
 	.vdisplay    = 1440,
-	.vsync_start = 1440 + 18,
-	.vsync_end   = 1440 + 18 + 10,
-	.vtotal	     = 1440 + 18 + 10 + 17,
-	.clock	     = 69000,
+	.vsync_start = 1440 + 30,
+	.vsync_end   = 1440 + 30 + 22,
+	.vtotal	     = 1440 + 30 + 22 + 29,
+	.clock	     = (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / 1000,
 	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	.width_mm    = 68,
 	.height_mm   = 136,

-- 
2.43.0

