Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5D19F0F0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2C06E2BD;
	Mon,  6 Apr 2020 07:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 545 seconds by postgrey-1.36 at gabe;
 Mon, 06 Apr 2020 05:42:40 UTC
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FC0F6E03B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 05:42:39 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e8abf1dfac-9af58;
 Mon, 06 Apr 2020 13:33:19 +0800 (CST)
X-RM-TRANSID: 2ee65e8abf1dfac-9af58
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[117.136.19.171])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35e8abf1b3ee-48510;
 Mon, 06 Apr 2020 13:33:19 +0800 (CST)
X-RM-TRANSID: 2ee35e8abf1b3ee-48510
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: b.zolnierkie@samsung.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: don't print error message on platform_get_irq()
 failure
Date: Mon,  6 Apr 2020 13:34:50 +0800
Message-Id: <20200406053450.8380-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform_get_irq() can print error message,so remove the redundant
dev_err() here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index d567f5d56..1e2521925 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1114,7 +1114,6 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
 
 	sinfo->irq_base = platform_get_irq(pdev, 0);
 	if (sinfo->irq_base < 0) {
-		dev_err(dev, "unable to get irq\n");
 		ret = sinfo->irq_base;
 		goto stop_clk;
 	}
-- 
2.20.1.windows.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
