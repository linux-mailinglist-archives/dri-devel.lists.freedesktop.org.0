Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578BF7A524A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 20:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043BF10E2C8;
	Mon, 18 Sep 2023 18:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170E410E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 18:46:48 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id iJGfq2zsLGkZJiJGfqxMkN; Mon, 18 Sep 2023 20:46:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1695062806;
 bh=d+X2wITyFfL/y+Yy8uB6Xs65leRLSEF6uVDE/v7+kls=;
 h=From:To:Cc:Subject:Date;
 b=L1bEOuwOXWbx6/SttJuEJqrYcA9alZxHkKfVLjjvl+XixqZ4/xbo/VsEyz8I6RGp7
 Tag+J0AAVIrMLJ52s103AV5YaUdi6IZNBPT8xs3HN8fybRllCblVgPZPmGRPAlDEVs
 kBx8CRvTcUIu6LiSqYue2Czilo6R42ki/2DI+3eTAWWqGJw+u0pk3IGtPXr9T0yS57
 D19bErru1a31d+k8nJ5sqGwiaf/yhl3vMXtUeVKW9kM4IwZEDvWK6mQcIJwFmrJ6VK
 i73Fj9FxeOVbwurBKYYhlIUu0AAG9kLlCHa92qYkX3vp2Dh15WepmhTO5RNMLD9Kmr
 1gQR11uX9XaOA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 18 Sep 2023 20:46:46 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] udmabuf: Fix a potential (and unlikely) access to unallocated
 memory
Date: Mon, 18 Sep 2023 20:46:35 +0200
Message-Id: <3e37f05c7593f1016f0a46de188b3357cbbd0c0b.1695060389.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-hardening@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If 'list_limit' is set to a very high value, 'lsize' computation could
overflow if 'head.count' is big enough.

In such a case, udmabuf_create() will access to memory beyond 'list'.

Use size_mul() to saturate the value, and have memdup_user() fail.

Fixes: fbb0de795078 ("Add udmabuf misc device")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c40645999648..fb4c4b5b3332 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -314,13 +314,13 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
 	int ret = -EINVAL;
-	u32 lsize;
+	size_t lsize;
 
 	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
 		return -EFAULT;
 	if (head.count > list_limit)
 		return -EINVAL;
-	lsize = sizeof(struct udmabuf_create_item) * head.count;
+	lsize = size_mul(sizeof(struct udmabuf_create_item), head.count);
 	list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
 	if (IS_ERR(list))
 		return PTR_ERR(list);
-- 
2.34.1

