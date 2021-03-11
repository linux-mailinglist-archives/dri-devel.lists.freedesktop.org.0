Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC080337338
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB9B6EC43;
	Thu, 11 Mar 2021 12:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0976EC30
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:22:05 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.228])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 6697E4002B6;
 Thu, 11 Mar 2021 20:13:40 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jason Yan <yanaijie@huawei.com>, Sam Ravnborg <sam@ravnborg.org>,
 Wang Qing <wangqing@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: delete redundant printing of return value
Date: Thu, 11 Mar 2021 20:13:23 +0800
Message-Id: <1615464805-18056-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUIfQ0tOT0wYHUxKVkpNSk5PTU9DSUtMS0pVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PFE6Lgw5MT8OHwI2EQ4rTgoT
 ETAaFApVSlVKTUpOT01PQ0lKS0pMVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUNZV1kIAVlBSkxISTcG
X-HM-Tid: 0a782134ef94d991kuws6697e4002b6
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
 drivers/video/fbdev/pxa168fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 47e6a1d..e4fe6a4
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -618,10 +618,8 @@ static int pxa168fb_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no IRQ defined\n");
+	if (irq < 0)
 		return -ENOENT;
-	}
 
 	info = framebuffer_alloc(sizeof(struct pxa168fb_info), &pdev->dev);
 	if (info == NULL) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
