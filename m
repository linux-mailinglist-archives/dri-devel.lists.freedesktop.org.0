Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C47787F4F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 07:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B625710E105;
	Fri, 25 Aug 2023 05:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D856B10E105
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 05:37:21 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RX7xp0RX9z9sTD;
 Fri, 25 Aug 2023 07:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1692941838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhhg8LjnqWHw9jK4np+Et29xcmXmDbPkzHimy7iyMs8=;
 b=ebGwYpuDh+GiyG7hTADoBJqYO+zffugm6GBX5ms5oDeRDFFhatpfK1WjHHI/O7DySOE/SV
 OPc+jVtH83VHlVwdNOEktUwOc5oxIySE/PncphMlNuc7rYZ/kJvWxogAibz5kDlRiTpIxB
 or4V6mGOqGispUJ+opF09xCB4wGmJvdcjXWCMSgwmCZV2F0l02hJwBMvYGqlbzELz1YD1j
 WC+ipQq+Aa09SpSYYesN7Lbir0JlX9m6lGQ9LYf/3kX27bBe8d/6PasePjka/8q4YzNS1L
 IAFxl9i2eszDItqIsPyEobdHOJbo51WiWPVG6rGSMzGYiLAWeWzu6rWOHV8UOQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Fri, 25 Aug 2023 07:36:39 +0200
Subject: [PATCH 3/3] drm/sun4i: tcon: parent keeps TCON0 clock stable on
 A64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-pll-mipi_keep_rate-v1-3-35bc43570730@oltmanns.dev>
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
In-Reply-To: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Ondrej Jirman <x@xnux.eu>, Icenowy Zheng <uwu@icenowy.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=lixZnD4gOGvFFH/XF+fZYh5kfwu9gK3pt6KJB+wArKs=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk6D3/wmL5lqS4EF2I27kUUUi4lKVb8k2n7bhOs
 wdLR8CjMcCJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZOg9/wAKCRCaaaIIlErT
 x0SkC/0aYqpXgu3ZY91KIkiLXCz4UsarrkvPtOVd+1L6aFsZtAjj3keHKPSTlTp/AzMUebjwBKq
 mz5jj2e0H+Zimh0dIjIhDtXyvB2jK0e8Qt0nXvYGWWZVrIWRLddRhO0wSvTpmyNVNSI0CWkg9mm
 OYgOsktvuO7xHjbZ0IoAchGqTSYsassqtu9iH0ytXCy0U5W0iBPUgFlwWwnObB6DKlpgfxO6KE/
 +6HYOobUbyfhXMwoiLvwzxtIvPN950HDD6zGlxTv4oj1UIcHuzhDHboigzw5FVoO0fkxO1ozHGo
 1k4eGBTpkjBZh3z3BlDP68XDAdre+ZqBO2th3oygehPbCqSjOh827NXeH24WtNYCm0r5WaIf5nL
 d0eFI75jEAFBukn+Uu0a/j40NAmL4up6Fj2iCC/ewsp5e/Xcox4M2neg35+P79AH+r6AWqzEdX/
 6gfSv7KCF0vRwsl5UnDBG4fgHY2CfHZo46wmbMb3d5+CTarc3DQ/daL03nDN4x4lCwsvo=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Icenowy Zheng <icenowy@aosc.io>

As the clk framework keeps A64's TCON0 clock stable when HDMI changes
its parent's clock, do not protect TCON0 clock on A64 in the TCON driver
to allow PLL-Video0 to get changed by HDMI.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 6a52fb12cbfb..4439e62b7a34 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -108,9 +108,11 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
 
 	if (enabled) {
 		clk_prepare_enable(clk);
-		clk_rate_exclusive_get(clk);
+		if (!tcon->quirks->rate_kept_by_parent)
+			clk_rate_exclusive_get(clk);
 	} else {
-		clk_rate_exclusive_put(clk);
+		if (!tcon->quirks->rate_kept_by_parent)
+			clk_rate_exclusive_put(clk);
 		clk_disable_unprepare(clk);
 	}
 }
@@ -1505,6 +1507,14 @@ static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.supports_lvds		= true,
 };
 
+static const struct sun4i_tcon_quirks sun50i_a64_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.rate_kept_by_parent	= true,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun6i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
 	.supports_lvds		= true,
 	.has_channel_0		= true,
@@ -1563,6 +1573,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
+	{ .compatible = "allwinner,sun50i-a64-tcon-lcd", .data = &sun50i_a64_lcd_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a..c4ce7c29192e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -243,6 +243,7 @@ struct sun4i_tcon_quirks {
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
 	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
+	bool	rate_kept_by_parent; /* Does parent keep TCON0 clock stable? */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */

-- 
2.41.0

