Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9766E8B03
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360C910EB8A;
	Thu, 20 Apr 2023 07:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895A510E6B6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:41:12 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CF37FF818;
 Tue, 18 Apr 2023 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1681803671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXbaBNxkiTTV4hInjji5NkCrdDSarnLLhwu9cO3OfTc=;
 b=GGo8ZSJuCFf8PhmINCprVl3K0jroP984sMuxT1hhoVj7KXeXwt5lwaC1xXSQSse5e7Z+GX
 iyk+LFcxnTdfDqW4I8lFY9cKpqr+Rqz7yvhi65RVghDQzTPb2NR9uxc59vLxsbNdWcpcx8
 mB4ksq+3XoPnpGctNNIrIiRFjNH3miTpSwFtEzhbOr+pOW1Ny4NuPFXobAPdA4PxpJm88T
 eTUxZiSsIP5Wd7oeLV5lZ1E/IfYPnaQZcv7Dtfd48/+iaPLhUI8/TDSOW4SiR/r3I+SNxk
 4DnOAslp97cT8Df/zkoGbLEGBa/Ghx8YH8/hC7+nO9CRJzBFXhgdGezTL0ajMQ==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 7/7] drm: sun4i: calculate proper DCLK rate for DSI
Date: Tue, 18 Apr 2023 09:40:08 +0200
Message-Id: <20230418074008.69752-8-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230418074008.69752-1-me@crly.cz>
References: <20230418074008.69752-1-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: linux-kernel@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, Roman Beranek <me@crly.cz>,
 Ondrej Jirman <megi@xff.cz>, Icenowy Zheng <icenowy@aosp.io>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In DSI mode, TCON0's data clock is required to run at 1/4 the per-lane
bit rate.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index eec26b1faa4b..b263de7a8237 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -291,18 +291,6 @@ static int sun4i_tcon_get_clk_delay(const struct drm_display_mode *mode,
 	return delay;
 }
 
-static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
-					const struct drm_display_mode *mode)
-{
-	/* Configure the dot clock */
-	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
-
-	/* Set the resolution */
-	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
-		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
-		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
-}
-
 static void sun4i_tcon0_mode_set_dithering(struct sun4i_tcon *tcon,
 					   const struct drm_connector *connector)
 {
@@ -367,10 +355,18 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	u32 block_space, start_delay;
 	u32 tcon_div;
 
+	/*
+	 * dclk is required to run at 1/4 the DSI per-lane bit rate.
+	 */
 	tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
 	tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000 * (bpp / lanes)
+						  / SUN6I_DSI_TCON_DIV);
 
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
@@ -438,7 +434,12 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 
 	tcon->dclk_min_div = 7;
 	tcon->dclk_max_div = 7;
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
+
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
@@ -515,7 +516,12 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 
 	tcon->dclk_min_div = tcon->quirks->dclk_min_div;
 	tcon->dclk_max_div = 127;
-	sun4i_tcon0_mode_set_common(tcon, mode);
+	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
+
+	/* Set the resolution */
+	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
+		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, connector);
-- 
2.34.1

