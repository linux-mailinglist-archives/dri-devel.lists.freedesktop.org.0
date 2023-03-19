Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334D6C02FA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAA210E04E;
	Sun, 19 Mar 2023 16:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55910E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 16:07:29 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PfjSG06Y0z9sSK;
 Sun, 19 Mar 2023 17:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1679242046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LaQzIGUSIRQEvSeJYHlfv8DWhzz6rNivIcZxVXfH8Tk=;
 b=vbhGGBCRkeNdS0n2fuwDNEVBbNkJAYD154FDsqKO463PdmLfQgzvZR1LYH6aN0xzMSby9c
 ni5WA+LmVIJgHRVieSvleWvHc1fN6DGeMJxWjidXGDq3v1KiJDseE4Ld39tD0Ii0HExK/T
 yJmSPe6bTHRGPbh2umMycAJijEyV/mG428m+n3t/b/r1avxQp9D1OqkBYoHDw0sDI9K3P2
 GfwqczV+J10oteeMi16xzK2mpTRkWrt3fTQsVOMbRcAb762IGS+/kyvuBHOi61BjRKGtCE
 1A6ETN3C+BHVeJhmtwjBYK+ike5/AHE4cqkxR+IdJ2hQgKua7spVZ4DhhgisBA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: jagan@amarulasolutions.com, michael@amarulasolutions.com,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/1] Fixing the DSI dot clock on Allwinner
Date: Sun, 19 Mar 2023 17:07:03 +0100
Message-Id: <20230319160704.9858-1-frank@oltmanns.dev>
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
Cc: Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the Allwinner A64's BSP code, the PLL rate needs to be set to the following frequency when using DSI:
PLL rate = DCLK * bpp / lanes

Source: [1]
The relevant lines for DSI (ommisions and comments mine):
dclk_rate = lcdp->panel_info.lcd_dclk_freq * 1000000;
lcd_rate = dclk_rate * clk_info.dsi_div; // dsi_div = bpp/lane
pll_rate = lcd_rate * clk_info.lcd_div;  // lcd_div = 1 --> pll_rate = lcd_rate
dsi_rate = pll_rate / clk_info.dsi_div   // --> dsi_rate = dclk_rate
clk_set_rate(lcdp->clk_parent, pll_rate);

This was already discussed by Maxime, Jagan and Michael in the past in the thread following this message: [2]. Unfortunately, there never was a conclusion in the form of code.

The attached patch is a slight variation of a patch that is part of megi's kernel branch that many PinePhone distributions (e.g. postmarketOS) use [3]. It calculates the TCON clock rate by using the formula above and dividing it by SUN6I_DSI_TCON_DIV, in order to force the parent clock to be set to the correct rate.

If I read the thread following this message [2] correctly, this was also what Maxime had in mind.

Please also note that, unfortunately, I only have a single board and panel (namely the PinePhone) to test this on.

Thanks,
  Frank

[1] https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L781
[2] https://lore.kernel.org/lkml/CAMty3ZAsH2iZ+JEqTE3D58aXfGuhMSg9YoO56ZhhOeE4c4yQHQ@mail.gmail.com/
[3] https://github.com/megous/linux/commit/eb5f28fb58727f4a6546f211486aad0d19cdea3f

Frank Oltmanns (1):
  drm/sun4i: tcon: Fix setting PLL rate when using DSI

 drivers/gpu/drm/sun4i/sun4i_tcon.c | 46 ++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 15 deletions(-)

-- 
2.39.2

