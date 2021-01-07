Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0492E2ECBF5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D2C6E432;
	Thu,  7 Jan 2021 08:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by gabe.freedesktop.org (Postfix) with ESMTP id E19406E3DF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 02:37:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.198.163])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xL4LkiX9OkRIKxL4OkeM1R; Thu, 07 Jan 2021 03:30:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1609986636; bh=D5liGHuYvej/2Vs0D+XFNKOleokAhu+S68gzN0VDH9U=;
 h=From:To:Subject:Date:MIME-Version;
 b=hdu9yx6qP/HwdpHOlT+OFDXh85hLzsAK6PxWG2FaYWYImwwH2WPzsV6f/fvgyrL0D
 wTVbQ320IkluX5Zb/CUGxawPt3l8GYFs4KpUpNfA42hFLC0qBjX/m+peXRFwEzhXh2
 BHJm33fCOelKRpEm5To6YX+qz0thuQFGQJWEjoat3ZG6Ffa9Mu0ompBcYQeMpq0Mua
 IFAbaD+lZ3+Y/tWHB1bL5ih+5n9Ei2n76HHN6prqFtmgva82GdOixH0YP3sr2w0/NJ
 BeWzulF7GXUJV9fRz6+BMEVoPLJ+S1w4wXk18bDQrfIfMeRALWy2vi6TVuDQRqIRJ/
 JYnSbIukC4ycA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/2] drm/sun4i: tcon: fix inverted DCLK polarity
Date: Thu,  7 Jan 2021 03:30:31 +0100
Message-Id: <20210107023032.560182-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDPwNH/FgacnF1sUUyqDtIHhJPzsiAY1wJSQ4dQfBax5aRm4Zi6mwJSLaQbhE5CmjOpGqBGUngrQgHGJt0GdkgiakP6SHa4P3QKO4/VWFMK+FjxxhrCv
 +TXHBPT8FJkM9S9Mfigu6+teKRKk8UOV853vWLWc2fEVeV6moKSNRJUSB0mX0r20rqAmtMIpNY4xiug2H0HEmTnODCUPC41h2wb5FquH1gPAkwYBl7fYWht3
 rQQRUUuw+s1g0pfIvALKMbCzbwJTjtWWu+xbgcLQBvQ3kspe5mXfe1EGGIOch4y5DbFPjPeWxqscUc+giXhqlRBdv9zrhEpYOE6mY49x1Xm9fDnBeUTlWNmP
 Fnn9FbMQEu5cNSmjs43Y9CvD2WqNef8KcOUh9NikYV+7n3+fKjiTMTUYL1QOikDAtB0vpJpqk8DCN14j66gd4+b1mstREjDgfI57bns/zCkA299KW6BsZJpr
 UmNtk2nAzw8xQ2oeawoite2lq3Y1D6FJ2vlIfS+syyK4k0pQFYlZIITHVylsDH2R97VQ78XNbvv5+21NRTLtoFj90KbJgP6H4HEgHQ==
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

During commit 88bc4178568b ("drm: Use new
DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags") DRM_BUS_FLAG_*
macros have been changed to avoid ambiguity but just because of this
ambiguity previous DRM_BUS_FLAG_PIXDATA_(POS/NEG)EDGE were used meaning
_SAMPLE_ not _DRIVE_. This lead to DLCK inversion, so let's swap DCLK
phase to fix it.

Fixes: 88bc4178568b ("drm: Use new DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags")
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1->V2:
use Fixes: tag in commit log as suggested by Jernej
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index eaaf5d70e352..52598bb0fb0b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -585,10 +585,10 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 	 * and DOTCLOCK drivers.
 	 */
 	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
-		clk_set_phase(tcon->dclk, 240);
+		clk_set_phase(tcon->dclk, 0);
 
 	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
-		clk_set_phase(tcon->dclk, 0);
+		clk_set_phase(tcon->dclk, 240);
 
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_IO_POL_REG,
 			   SUN4I_TCON0_IO_POL_HSYNC_POSITIVE |
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
