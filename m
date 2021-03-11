Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834F337339
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E5A6EC4A;
	Thu, 11 Mar 2021 12:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DFB6EC2F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:22:04 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id A611A40013E;
 Thu, 11 Mar 2021 20:14:16 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Wang Qing <wangqing@vivo.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: delete redundant printing of return value
Date: Thu, 11 Mar 2021 20:14:09 +0800
Message-Id: <1615464851-18433-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTkxITE8YGE9DTB9JVkpNSk5PTU9DTkxLT05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06Hzo*Cj8JCwIMEQ8BThcd
 N0wwCSxVSlVKTUpOT01PQ05MSEJIVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFKQk1LNwY+
X-HM-Tid: 0a7821357d84d991kuwsa611a40013e
X-Mailman-Approved-At: Thu, 11 Mar 2021 12:59:37 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

platform_get_irq() has already checked and printed the return value, 
the printing here is nothing special, it is not necessary at all.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/video/fbdev/pxafb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index f1551e0..780ac1f
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2326,11 +2326,9 @@ static int pxafb_probe(struct platform_device *dev)
 	}
 
 	irq = platform_get_irq(dev, 0);
-	if (irq < 0) {
-		dev_err(&dev->dev, "no IRQ defined\n");
+	if (irq < 0)
 		ret = -ENODEV;
 		goto failed_free_mem;
-	}
 
 	ret = devm_request_irq(&dev->dev, irq, pxafb_handle_irq, 0, "LCD", fbi);
 	if (ret) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
