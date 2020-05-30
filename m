Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E711E8D63
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABEC6E9A6;
	Sat, 30 May 2020 03:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526206E99D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3FB3A4F;
 Sat, 30 May 2020 05:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808238;
 bh=GB3GjmsoHBJOu1MEycXDdzCy3gGSmgd1ml8iTj4VrFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KIyz4Xw6pEgr/sh2BWObZ3JFBN4TfG8iz1s4yflEZKkFa7e+HrNPbsYXC6GQ4YNZI
 Cz9yreP+L9fmX35ZOvaYU+c/+ExwpKySKvS/GSvP3Q/tp1apZUQjzORlUUgMDIgA9V
 b5FblX6Lg0mjLvqCUa3SbMgIM3xdhua/0KfKdhXQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/22] drm: mxsfb: Pass mxsfb_drm_private pointer to
 mxsfb_reset_block()
Date: Sat, 30 May 2020 06:09:59 +0300
Message-Id: <20200530031015.15492-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mxsfb_reset_block() function isn't special, pass it the
mxsfb_drm_private pointer instead of a pointer to the base address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
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
