Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC517E954
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE35D6E53E;
	Mon,  9 Mar 2020 19:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481F6E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:10 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACE803AB6;
 Mon,  9 Mar 2020 20:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783588;
 bh=xyGmiUB3B2+IlJHHVl4ilqbmcFMAfEKJWEqqJi5boKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a8Sz1owbDLXd30ZGCD4YJxHSN7bgY5FfdyTxqLcGBvnoKN5hmPjfPgSOCqKKWdr2V
 i9+7ksoXrWUDLwbLIDrzPoVXvUwKytBSBfY3dLQjiw50rhZEZG2MrUWp+nh0TOYQLq
 k/z65rs18bdQ77IJy8P08f7nXSVxHHptzzfBtQ/g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/21] drm: mxsfb: Use LCDC_CTRL register name explicitly
Date: Mon,  9 Mar 2020 21:52:02 +0200
Message-Id: <20200309195216.31042-8-laurent.pinchart@ideasonboard.com>
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

The LCDC_CTRL register is located at address 0x0000. Some of the
accesses to the register simply use the mxsfb->base address. Reference
the LCDC_CTRL register explicitly instead to clarify the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index be60c4021e2f..722bd9b4f5f9 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -170,17 +170,17 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 {
 	int ret;
 
-	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
+	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
 	if (ret)
 		return ret;
 
-	writel(MODULE_CLKGATE, mxsfb->base + MXS_CLR_ADDR);
+	writel(MODULE_CLKGATE, mxsfb->base + LCDC_CTRL + MXS_CLR_ADDR);
 
-	ret = clear_poll_bit(mxsfb->base, MODULE_SFTRST);
+	ret = clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_SFTRST);
 	if (ret)
 		return ret;
 
-	return clear_poll_bit(mxsfb->base, MODULE_CLKGATE);
+	return clear_poll_bit(mxsfb->base + LCDC_CTRL, MODULE_CLKGATE);
 }
 
 static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
