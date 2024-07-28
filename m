Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42A93E8DC
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 20:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCC410E021;
	Sun, 28 Jul 2024 18:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mKJ18isf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr
 [80.12.242.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2853110E021
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 18:30:07 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id Y8ehskV3jYjQzY8ehsdEJs; Sun, 28 Jul 2024 20:30:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722191406;
 bh=aHRr46GwE+uyksv7tBA8rAadSHSqFFR/MCO6+hVj1uk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=mKJ18isfp/UdJbLq8eTjt5hzxV/dfxabgAVcoQ2rAdaQF3R2TphCNVVEvEyk7Crnq
 Qa47ZnqQyvVssPt0mh70NxxDhTdVxbh6U5Kq+q8Om4oYsNuLzV7hJyUqhjUfjVGYjh
 ktORbHXZsHJjr88ahzm48Wztm+4qlsNiUEYicMzECtX6+dXg6vVy1kDBAo/tzDMtMa
 XWacCL7jCB+tYoz34cMJRn68ge5VqW7guGKORGI4/2+z96jdEG0wINVC/J3H/u5D/8
 zw6jamr2TE3F4WOQOc8EE0z73bxTWSBhNYe63fqPJm4NxNCbZ1nHY4KjXg4W4k1KZ9
 3cuLhiiu6jpoQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Jul 2024 20:30:06 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
Date: Sun, 28 Jul 2024 20:29:47 +0200
Message-ID: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
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

If an error occurs after request_mem_region(), a corresponding
release_mem_region() should be called, as already done in the remove
function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
*Not* even compile tested only.
I don't know on what architecture it relies on.

So it is provided as-is
---
 drivers/video/fbdev/hpfb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
index 66fac8e5393e..87b8dcdc1cf3 100644
--- a/drivers/video/fbdev/hpfb.c
+++ b/drivers/video/fbdev/hpfb.c
@@ -342,12 +342,17 @@ static int hpfb_dio_probe(struct dio_dev *d, const struct dio_device_id *ent)
 	}
 	printk(KERN_INFO "Topcat found at DIO select code %d "
 	       "(secondary id %02x)\n", d->scode, (d->id >> 8) & 0xff);
-	if (hpfb_init_one(paddr, vaddr)) {
-		if (d->scode >= DIOII_SCBASE)
-			iounmap((void *)vaddr);
-		return -ENOMEM;
-	}
+	if (hpfb_init_one(paddr, vaddr))
+		goto err_unmap;
+
 	return 0;
+
+err_unmap:
+	if (d->scode >= DIOII_SCBASE)
+		iounmap((void *)vaddr);
+	release_mem_region(d->resource.start, resource_size(&d->resource));
+
+	return -ENOMEM;
 }
 
 static void hpfb_remove_one(struct dio_dev *d)
-- 
2.45.2

