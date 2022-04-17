Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80C5045FB
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 04:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59A910E61E;
	Sun, 17 Apr 2022 02:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0578610E61E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 02:08:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0C20B839E7;
 Sun, 17 Apr 2022 04:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650161300;
 bh=r0USRpG1vY7MhQlC5oBxDlxSDxhO5P7Tb7b90nQQ7UE=;
 h=From:To:Cc:Subject:Date:From;
 b=pft9qnujV3S9ZMZiUyA0up0aweVUvWaFckX2hyKHQOvYqpqKPRn2bR5LmJu1XMJwn
 2Evxdk1VI5P1Vb/BgTw8Cnuj/KbYz46HFfuCYm+/MY11jMe0k6Zs5eALj7AM1AES9o
 T75Ot80Ets6sEuiM/WDqOKv3PiB2cA1G6duYYEKQeluLNvUWgbievN+oQSaOu3cLYu
 g+JoXIXQV+wQZ68j7DK93YkG2NolESbbG/bZTXYpHQYVma0W6+Rb+TZu8xlkB5N+ZI
 etjp5jp8KSXjELIJc3cBWKcpS5DI9aC+mt3P5jJyMmS5SXVbf3IVnFQY6yrVTkiebF
 czQrOq1w1ZCdQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm: mxsfb: Wrap FIFO reset and comments into
 mxsfb_reset_block()
Date: Sun, 17 Apr 2022 04:07:57 +0200
Message-Id: <20220417020800.336675-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wrap FIFO reset and comments into mxsfb_reset_block(), this is a clean up.
No functional change.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: Add RB from Lucas
V3: Rebase on latest next and discarded clock and irq cleanups
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 36 +++++++++++++++++--------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 4cfb6c0016799..45cabe0960769 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -191,6 +191,12 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 {
 	int ret;
 
+	/*
+	 * It seems, you can't re-program the controller if it is still
+	 * running. This may lead to shifted pictures (FIFO issue?), so
+	 * first stop the controller and drain its FIFOs.
+	 */
+
 	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_SFTRST);
 	if (ret)
 		return ret;
@@ -201,7 +207,20 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 	if (ret)
 		return ret;
 
-	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
+	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
+	if (ret)
+		return ret;
+
+	/* Clear the FIFOs */
+	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
+	readl(mxsfb->base + LCDC_CTRL1);
+	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+	readl(mxsfb->base + LCDC_CTRL1);
+
+	if (mxsfb->devdata->has_overlay)
+		writel(0, mxsfb->base + LCDC_AS_CTRL);
+
+	return 0;
 }
 
 static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
@@ -228,26 +247,11 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
 	int err;
 
-	/*
-	 * It seems, you can't re-program the controller if it is still
-	 * running. This may lead to shifted pictures (FIFO issue?), so
-	 * first stop the controller and drain its FIFOs.
-	 */
-
 	/* Mandatory eLCDIF reset as per the Reference Manual */
 	err = mxsfb_reset_block(mxsfb);
 	if (err)
 		return;
 
-	/* Clear the FIFOs */
-	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
-	readl(mxsfb->base + LCDC_CTRL1);
-	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-	readl(mxsfb->base + LCDC_CTRL1);
-
-	if (mxsfb->devdata->has_overlay)
-		writel(0, mxsfb->base + LCDC_AS_CTRL);
-
 	mxsfb_set_formats(mxsfb, bus_format);
 
 	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
-- 
2.35.1

