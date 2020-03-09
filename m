Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37AB17E95B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3B6E55E;
	Mon,  9 Mar 2020 19:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D299C6E52E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:09 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19C7C3AB4;
 Mon,  9 Mar 2020 20:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783587;
 bh=P/b31cXnLSvtaAOz/dTc6KtKaMIZF2X4Duvch1dbdlo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cPyIhqZkmH0GlET8bqTMqN6gn3kZrZJdMMNSBum1SHBfQhi43VCcgGAEt8IEswhK0
 W0zkekdonaIX5kv7nhQ3l4UTDTin2fRA/dYV7zmGkcxtMLsWnjT3hgm9Kf+oFtQe7+
 BINzYWi+Jesz7D9wgHBCcXbhjwy04u5SBybubnCs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/21] drm: mxsfb: Pass mxsfb_drm_private pointer to
 mxsfb_reset_block()
Date: Mon,  9 Mar 2020 21:52:01 +0200
Message-Id: <20200309195216.31042-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mxsfb_reset_block() function isn't special, pass it the
mxsfb_drm_private pointer instead of a pointer to the base address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index 8b6339316929..be60c4021e2f 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -166,21 +166,21 @@ static int clear_poll_bit(void __iomem *addr, u32 mask)
 	return readl_poll_timeout(addr, reg, !(reg & mask), 0, RESET_TIMEOUT);
 }
 
-static int mxsfb_reset_block(void __iomem *reset_addr)
+static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 {
 	int ret;
 
-	ret = clear_poll_bit(reset_addr, MODULE_SFTRST);
+	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
 	if (ret)
 		return ret;
 
-	writel(MODULE_CLKGATE, reset_addr + MXS_CLR_ADDR);
+	writel(MODULE_CLKGATE, mxsfb->base + MXS_CLR_ADDR);
 
-	ret = clear_poll_bit(reset_addr, MODULE_SFTRST);
+	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
 	if (ret)
 		return ret;
 
-	return clear_poll_bit(reset_addr, MODULE_CLKGATE);
+	return clear_poll_bit(mxsfb->base, MODULE_CLKGATE);
 }
 
 static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
@@ -213,7 +213,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
 	 */
 
 	/* Mandatory eLCDIF reset as per the Reference Manual */
-	err = mxsfb_reset_block(mxsfb->base);
+	err = mxsfb_reset_block(mxsfb);
 	if (err)
 		return;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
