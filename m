Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2FA4C6039
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A5810E243;
	Mon, 28 Feb 2022 00:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5492310E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:44 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7CC6583BAF;
 Mon, 28 Feb 2022 01:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009202;
 bh=ftN8UVqoY/cnU4wjQaFw84PDvBEMuCcLLcJvuP4CPJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U9XAbPIjgw+QvUTxXZXH81MfQOq00udZMONWL5qIpGzlXijNrXuuWjhrFW2iVR/62
 rrN/WwNgrBVHpa/pG4Fpef8nwMwiu0FobPf+RBr8ROMYUYVyEkjU/ORoKWpohIm+Ip
 XALm4DAYSUS/Y2taA+s/5MIsObyvGrjP3b7K1jauDT7oVOLSl0F9yBbS3aVWpEdU+7
 CUhvxvZ51Dq1uxtYI3+FBBZTrH4ooebOxyMuKNwjpqkwApMSIPP11wu4XWWYfb1AEU
 h2y8AeVb9caVHFcdYBd5AJHskRpi8qxtdhhGb9lh6TzjdRk0VsjEjc+WeKy/+oRHZf
 a8IKCmRxfvnFQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm: mxsfb: Wrap FIFO reset and comments into
 mxsfb_reset_block()
Date: Mon, 28 Feb 2022 01:46:00 +0100
Message-Id: <20220228004605.367040-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
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

