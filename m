Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D44771D34
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C946510E1DB;
	Mon,  7 Aug 2023 09:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BE010E1DB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:36:39 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RKB6C522zz9skk;
 Mon,  7 Aug 2023 11:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1691400995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bx59iuZULJWXlPJJ/bQzCKX/skWMC4xkVk5Q2n861zY=;
 b=Kp7Ndpds0c9j1choqKSneRMNEgOwO67A5DZTY7k1aLkXHnGi6k7W9xgBKd478KwGgK6nZw
 kh3k++92YGmDIlSgwvOzFnsHJCRkfWBGnqmFqAEsF8u7zHSj++/t5BNM5FS6Q/jR5FflZi
 9P9qwPeuY60460+kw/TafMeht2CsMtU4FhUj+tlXn2ZMgZAK2Xop7MOz7sjYZtfu/HLKyM
 G8k7dRO4DT/fgs8qpJ9t2XsgVyhsib8rLv3exy562n5bFkmCFipIkOrdUBnUqiRYruux4B
 ISaY9ynxiCLx5PSC/Yx/5djxFnXKeYcqBGOai55C7lxs8EtvODx67QINmtxCoA==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 11:36:04 +0200
Subject: [PATCH 3/3] drm/sun4i: tcon: hand over the duty to keep TCON0
 clock to CCU on A64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230807-a64_pll_video0_notifier-v1-3-8a7ccdc14c79@oltmanns.dev>
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
In-Reply-To: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
To: Icenowy Zheng <uwu@icenowy.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=Y/kvHQpc3WHJy9lb7M1bIaUwWomT42DNDqH8DiZOLCo=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk0LseHYmMwFJu+dy/PTtTRTLd15gyy/iXtjMyF
 JwSUNQpI7GJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZNC7HgAKCRCaaaIIlErT
 x/M1C/0Xl6ic6JOubyxSIbcJfesFDbbE50uPXUGvQ/aQ2Ku7MnhI8oTOGzCBxPXL3bHi6X10zlw
 twuqGYYGh468kNOw47Yp6NPyGUkUezYLMGj+iFOKItpaoVrdQXcNQ3KsGZHT8gSvDJTo+zb4oO3
 uF6EDsZcRVIv/uP956Ja+p1e0B+iJ+DJBpC+ReSq+ulGivg04S5IoN03u7hZZsjc/C1gV7XUx2b
 v/jHzqUZoHSO0bu3ASS1IjQNs1euUCEHtrVtQGAvOPbaPYsQzybnXova10Tgn2tkFDw7P6EiEaL
 s6AShRXIoZnu4Rq8ef/9XIvewQu3DiozwygLf3gsmIqrQMw3muNPllytgDmtA+zCfbCbXMkS2Sg
 KbMmj4hUm6VoK6z3qSJQWRJJ1hXFcHoPtbVafUJuH6oP+O/Dggxajk6NMM71YEajORYlnJneKIZ
 tuqs7K0e6JQv58Q7ZpqaNBACTk7/ZI/5H5oihIUFlY+2HtF7HttPg9vTxcmzSw5w+/Dfg=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4RKB6C522zz9skk
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
Cc: dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>,
 linux-sunxi@lists.linux.dev, =?utf-8?q?Ond=C5=99ej_Jirman?= <x@xnux.eu>,
 Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Icenowy Zheng <icenowy@aosc.io>

As the A64 CCU driver has already the ability to keep TCON0 clock stable
when HDMI changes its parent's clock, do not protect TCON0 clock on A64
in the TCON driver to allow PLL-Video0 gets changed by HDMI (the CCU
will then restore the TCON0 clock rate).

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index c44d5f3350d1..6f2d544c5f29 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -110,9 +110,11 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
 
 	if (enabled) {
 		clk_prepare_enable(clk);
-		clk_rate_exclusive_get(clk);
+		if (!tcon->quirks->clk_kept_by_ccu)
+			clk_rate_exclusive_get(clk);
 	} else {
-		clk_rate_exclusive_put(clk);
+		if (!tcon->quirks->clk_kept_by_ccu)
+			clk_rate_exclusive_put(clk);
 		clk_disable_unprepare(clk);
 	}
 }
@@ -1562,6 +1564,14 @@ static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.supports_lvds		= true,
 };
 
+static const struct sun4i_tcon_quirks sun50i_a64_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.clk_kept_by_ccu	= true,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun6i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
 	.supports_lvds		= true,
 	.has_channel_0		= true,
@@ -1620,6 +1630,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
+	{ .compatible = "allwinner,sun50i-a64-tcon-lcd", .data = &sun50i_a64_lcd_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index 864d70b9d242..7ba3df9e27df 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -250,6 +250,7 @@ struct sun4i_tcon_quirks {
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
 	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
+	bool	clk_kept_by_ccu; /* On A64 we rely on CCU to keep TCON0 clock stable */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */

-- 
2.41.0

