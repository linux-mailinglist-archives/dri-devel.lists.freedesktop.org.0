Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDDA3F52EB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 23:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4057C89BD5;
	Mon, 23 Aug 2021 21:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out07.smtpout.orange.fr [193.252.22.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE81C89BD5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 21:38:15 +0000 (UTC)
Received: from pop-os.home ([90.126.253.178]) by mwinf5d73 with ME
 id l9Wh250043riaq2039WhxJ; Mon, 23 Aug 2021 23:30:43 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Aug 2021 23:30:43 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: James.Bottomley@HansenPartnership.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: linux-parisc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] parisc/parport_gsc: switch from 'pci_' to 'dma_' API
Date: Mon, 23 Aug 2021 23:30:39 +0200
Message-Id: <93b21629db55629ec3d384e8184c4a9dd0270c11.1629754126.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4

This has *NOT* been compile tested because I don't have the needed
configuration.
ssdfs
---
 drivers/parport/parport_gsc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 1e43b3f399a8..db912fa6b6df 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -390,9 +390,8 @@ static int __exit parport_remove_chip(struct parisc_device *dev)
 		if (p->irq != PARPORT_IRQ_NONE)
 			free_irq(p->irq, p);
 		if (priv->dma_buf)
-			pci_free_consistent(priv->dev, PAGE_SIZE,
-					    priv->dma_buf,
-					    priv->dma_handle);
+			dma_free_coherent(&priv->dev->dev, PAGE_SIZE,
+					  priv->dma_buf, priv->dma_handle);
 		kfree (p->private_data);
 		parport_put_port(p);
 		kfree (ops); /* hope no-one cached it */
-- 
2.30.2

