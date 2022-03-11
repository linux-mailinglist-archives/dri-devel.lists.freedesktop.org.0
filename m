Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E923A4D6730
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8CE10E29C;
	Fri, 11 Mar 2022 17:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3804E10E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:06:26 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7A99583AE8;
 Fri, 11 Mar 2022 18:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647018384;
 bh=jhJBLFj5VDAbrSBm+Am6ZcPf/voAzT4uYM4I7mcfpqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wosgT4MLNNkyXnw1uFcUbJ8dkO6v+9J6J28cUPx0Bh/8U7EQXJXesc6zAZBzfWYcK
 M0wO2RjUizPAg8DAwnzlFEYY4AfMQD34Shi0+klhWjyOdx5d7IpShKAFAbY6uOoREN
 8+AwNTwXjUdK404sxKJ+0awkyejZEYcP36fCc3Q4a4e81YMd4tN8yN7kDpyvs0buWM
 u6a4Y6MO0x+FQy5xhT7fjj7B+aueSg4yQnmKiOgEV+nBo7Ke9EvF6FkC6QY627POqI
 QuHauh9qgS7aGpGnfo3po+ffDBvZv0dei8ndUtaB6StwON7HN6JfizXP2tuu8/J/GO
 7UoOH2e8RHtiA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm: mxsfb: Wrap FIFO reset and comments into
 mxsfb_reset_block()
Date: Fri, 11 Mar 2022 18:05:57 +0100
Message-Id: <20220311170601.50995-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311170601.50995-1-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
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

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: No change
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 36 +++++++++++++++++--------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 657b6afbbf1f9..015b289d93a3c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -183,6 +183,12 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
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
@@ -193,7 +199,20 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
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
@@ -220,26 +239,11 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
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
 
 	if (mxsfb->bridge && mxsfb->bridge->timings)
-- 
2.34.1

