Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A21BD4D6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375836EC9A;
	Wed, 29 Apr 2020 06:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp13.smtpout.orange.fr
 [80.12.242.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE2E6EC29
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 04:34:53 +0000 (UTC)
Received: from localhost.localdomain ([92.148.159.11]) by mwinf5d72 with ME
 id YUak220030F2omL03UalTv; Wed, 29 Apr 2020 06:34:51 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 29 Apr 2020 06:34:51 +0200
X-ME-IP: 92.148.159.11
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: b.zolnierkie@samsung.com, gregkh@linuxfoundation.org, mpe@ellerman.id.au,
 zhenzhong.duan@gmail.com, arnd@arndb.de, tglx@linutronix.de,
 eric.y.miao@gmail.com, daniel@caiaq.de
Subject: [PATCH] video: fbdev: pxa3xx_gcu: Fix some resource leak in an error
 handling path in 'pxa3xx_gcu_probe()'
Date: Wed, 29 Apr 2020 06:34:38 +0200
Message-Id: <20200429043438.96212-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an error occurs in the loop where we call 'pxa3xx_gcu_add_buffer()',
any resource already allocated should be freed.

In order to fix it, add a call to 'pxa3xx_gcu_free_buffers()' in the error
handling path, as already done in the remove function.

Fixes: 364dbdf3b6c3 ("video: add driver for PXA3xx 2D graphics accelerator")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/pxa3xx-gcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
index 4279e13a3b58..68d9c7a681d4 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -675,6 +675,7 @@ static int pxa3xx_gcu_probe(struct platform_device *pdev)
 
 err_disable_clk:
 	clk_disable_unprepare(priv->clk);
+	pxa3xx_gcu_free_buffers(dev, priv);
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
