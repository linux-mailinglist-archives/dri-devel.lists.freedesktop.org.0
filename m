Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F04322E3D4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEC96E106;
	Mon, 27 Jul 2020 02:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2C06E134
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2717512E5;
 Mon, 27 Jul 2020 04:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815632;
 bh=DoR4GaWeIBlHS2sGdKpi9YQQ/n71CG1TE2VsvPGbRdI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dcsEOJpv5alNkOa3XobbbkcsfxYTFqJ2pUA4lI+156MRKmoZDw/UBsnRImCdBFeu1
 dikuKWNwSm/XrRfzB+0j4v6txzIkUHXbekBsyOg429ozJVihpDy7SQkDk6PL1G79rg
 2pKwt6yCJSp58TXxEdhnoPGZOReoVy5FhhXdEKzE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/22] drm: mxsfb: Use LCDC_CTRL register name explicitly
Date: Mon, 27 Jul 2020 05:06:39 +0300
Message-Id: <20200727020654.8231-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
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

The LCDC_CTRL register is located at address 0x0000. Some of the
accesses to the register simply use the mxsfb->base address. Reference
the LCDC_CTRL register explicitly instead to clarify the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
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
