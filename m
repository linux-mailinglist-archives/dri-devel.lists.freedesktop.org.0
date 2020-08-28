Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C72256645
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760D6EB90;
	Sat, 29 Aug 2020 09:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E246E4B3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1598619033; bh=nxUWIm3gy/O9YpC9oWvFu3EIfP25ydy4pKjYKk0i/qE=;
 h=From:To:Cc:Subject:Date:From;
 b=b07fnjeNJJsvJjL2xaCzpKxNgztTc6dQlBOhVGsdxfEyWuR3tjCZpH/5LJlddl2p7
 Nu85p4YCWwFtH8FWhC+laJZN3XaDcSd4zSEuGPiXjut5p9lMGHNV41dXa6NoXnhje5
 7ADi4CdrKSp+gncwYxJ65IjZs325UpgVm9FzhEcA=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com
Subject: [PATCH v2] drm/sun4i: Fix dsi dcs long write function
Date: Fri, 28 Aug 2020 14:50:32 +0200
Message-Id: <20200828125032.937148-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's writing too much data. regmap_bulk_write expects number of
register sized chunks to write, not a byte sized length of the
bounce buffer. Bounce buffer needs to be padded too, so that
regmap_bulk_write will not read past the end of the buffer.

Fixes: 133add5b5ad4 ("drm/sun4i: Add Allwinner A31 MIPI-DSI controller support")
Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
v2:
- use ALIGN
- add tags

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 7f13f4d715bf..840fad1b68dd 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -889,7 +889,7 @@ static int sun6i_dsi_dcs_write_long(struct sun6i_dsi *dsi,
 	regmap_write(dsi->regs, SUN6I_DSI_CMD_TX_REG(0),
 		     sun6i_dsi_dcs_build_pkt_hdr(dsi, msg));
 
-	bounce = kzalloc(msg->tx_len + sizeof(crc), GFP_KERNEL);
+	bounce = kzalloc(ALIGN(msg->tx_len + sizeof(crc), 4), GFP_KERNEL);
 	if (!bounce)
 		return -ENOMEM;
 
@@ -900,7 +900,7 @@ static int sun6i_dsi_dcs_write_long(struct sun6i_dsi *dsi,
 	memcpy((u8 *)bounce + msg->tx_len, &crc, sizeof(crc));
 	len += sizeof(crc);
 
-	regmap_bulk_write(dsi->regs, SUN6I_DSI_CMD_TX_REG(1), bounce, len);
+	regmap_bulk_write(dsi->regs, SUN6I_DSI_CMD_TX_REG(1), bounce, DIV_ROUND_UP(len, 4));
 	regmap_write(dsi->regs, SUN6I_DSI_CMD_CTL_REG, len + 4 - 1);
 	kfree(bounce);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
