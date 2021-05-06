Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D282D3760E4
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 09:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7118D6ED65;
	Fri,  7 May 2021 07:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF3C26ED23
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 19:04:41 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d05 with ME
 id 1Wx72500C21Fzsu03Wx7Vc; Thu, 06 May 2021 20:57:09 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 May 2021 20:57:09 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
 festevam@gmail.com, linux-imx@nxp.com, j.beisert@pengutronix.de,
 krzysztof.h1@poczta.fm
Subject: [PATCH] video: fbdev: imxfb: Fix an error message
Date: Thu,  6 May 2021 20:57:05 +0200
Message-Id: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 May 2021 07:04:43 +0000
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'ret' is known to be 0 here.
No error code is available, so just remove it from the error message.

Fixes: 72330b0eeefc ("i.MX Framebuffer: Use readl/writel instead of direct pointer deref")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/imxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 7f8debd2da06..ad598257ab38 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -992,7 +992,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	info->screen_buffer = dma_alloc_wc(&pdev->dev, fbi->map_size,
 					   &fbi->map_dma, GFP_KERNEL);
 	if (!info->screen_buffer) {
-		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
+		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
 		ret = -ENOMEM;
 		goto failed_map;
 	}
-- 
2.30.2

