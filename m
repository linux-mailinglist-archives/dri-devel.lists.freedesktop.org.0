Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A280617E953
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE536E536;
	Mon,  9 Mar 2020 19:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FD96E536
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:11 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 492C23B83;
 Mon,  9 Mar 2020 20:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783588;
 bh=+g8PCqBUarUMFK9hlfvefovJVIvzLA3CQki6DSzasGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OwV29y21j2xb1Y+C76Bznp8iFDiolc4EixVFHZ2POsQGXjjvjqy+2EHSc0pd+Ml3p
 hCiZbSA8bML4+I3KFBhIFrROrS1upjMQQfA3xwl9i2+HlZ/SGl76QjFpJtreG91/F6
 g06o45J7i7Qu5gLlSPxXBkLRVreRTR541A+pfd4s=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/21] drm: mxsfb: Remove register definitions from
 mxsfb_crtc.c
Date: Mon,  9 Mar 2020 21:52:03 +0200
Message-Id: <20200309195216.31042-9-laurent.pinchart@ideasonboard.com>
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

mxsfb_crtc.c defines several macros related to register addresses and
bit, which duplicates macros from mxsfb_regs.h. Use the macros from
mxsfb_regs.h instead and remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index 722bd9b4f5f9..aef72adabf41 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -29,10 +29,6 @@
 #include "mxsfb_drv.h"
 #include "mxsfb_regs.h"
 
-#define MXS_SET_ADDR		0x4
-#define MXS_CLR_ADDR		0x8
-#define MODULE_CLKGATE		BIT(30)
-#define MODULE_SFTRST		BIT(31)
 /* 1 second delay should be plenty of time for block reset */
 #define RESET_TIMEOUT		1000000
 
@@ -162,7 +158,7 @@ static int clear_poll_bit(void __iomem *addr, u32 mask)
 {
 	u32 reg;
 
-	writel(mask, addr + MXS_CLR_ADDR);
+	writel(mask, addr + REG_CLR);
 	return readl_poll_timeout(addr, reg, !(reg & mask), 0, RESET_TIMEOUT);
 }
 
@@ -170,17 +166,17 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 {
 	int ret;
 
-	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
+	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_SFTRST);
 	if (ret)
 		return ret;
 
-	writel(MODULE_CLKGATE, mxsfb->base + LCDC_CTRL + MXS_CLR_ADDR);
+	writel(CTRL_CLKGATE, mxsfb->base + LCDC_CTRL + REG_CLR);
 
-	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
+	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_SFTRST);
 	if (ret)
 		return ret;
 
-	return clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_CLKGATE);
+	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
 }
 
 static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
