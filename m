Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B793C537B84
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662D310E87B;
	Mon, 30 May 2022 13:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D410E8A3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:26:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8B4A60EE7;
 Mon, 30 May 2022 13:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DA5C36AE3;
 Mon, 30 May 2022 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917206;
 bh=Zcm9ySkbT/G7Q4BJQf5Zw5SrfV4XpqujHIMn+NmqG/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tvZklSrIrw2AlX7pgV6Gi1eNNNyStt8/BbXYrAzKtVnRCoLbqm8/+x3PpNspGVdBD
 A+N1oiXLJ/cVhW/XwPfyzloHBirkrr7XsgGZV2L+WpitAYPOeVxBt2bTCZixGLasL2
 tbjeeE6FGMOFXeVrIJABmoie7NwApo+O3VJ4PXjVA/N5cmIBPyDpYWawR/emJ6R/7X
 9bDOZEnKv4HXNBpUKm5/XxKLakcvSk6QG6PClZsgS4rZRc/D806e+YdUbcZYq54NAu
 ww+pUf0lbGHGAHDi4i0M7pIiiAWNIPmMTVTL7GlYXKzyY9QD5BlUs/FyzPzqrqT8+9
 +rXLM1dfuFARw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 057/159] drm/sun4i: Add support for D1 TCONs
Date: Mon, 30 May 2022 09:22:42 -0400
Message-Id: <20220530132425.1929512-57-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samuel Holland <samuel@sholland.org>

[ Upstream commit b9b52d2f4aafa2bd637ace0f24615bdad8e49f01 ]

D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
While there are some register changes, the part of the TCON TV supported
by the driver matches the R40 quirks, so that quirks structure can be
reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
LCD needs a new quirks structure.

D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
from a single TCON. However, it comes with a brand new LVDS PHY. Since
this PHY has not been tested, leave out LVDS driver support for now.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20220424162633.12369-14-samuel@sholland.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 88db2d2a9336..2ee158aaeb9e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1542,6 +1542,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tcon_tv_quirks = {
 	.needs_edp_reset = true,
 };
 
+static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
+	.has_channel_0		= true,
+	.dclk_min_div		= 1,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1559,6 +1565,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
+	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
+	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
-- 
2.35.1

