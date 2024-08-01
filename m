Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA279453C6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 22:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637EB10E0F8;
	Thu,  1 Aug 2024 20:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PAfL57iQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-83.smtpout.orange.fr [80.12.242.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B31810E0F8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 20:36:02 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id ZcVmsD1jSGdLxZcVnsXLwg; Thu, 01 Aug 2024 22:34:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722544499;
 bh=Xt0EwvNrOXd4uCSAzGoq0YIsCyBB78A5L44qPdMyuXU=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=PAfL57iQ0ZLvibrFotWhGKkDVY2G3/37BXsTNpCqDxRURps7ZEsUwvToXKtGVlJ8I
 TuRAFWL9YSGx53PF6y3SYahGr3hhKfDV2wXbhdzID/gMmLqdtRhLedSqSwRl9v9mQn
 JkFp0ADsHj+c9eZKNZ8Dyi5ib9qxHFHc38GcNcd7lQz9Ajt2gDuETZ1TY8/ou9tMHb
 VVVk08XIewv0oWpl1D6aF47B4q8TQbDf62xklc7h0uF5fcATKWzJyIS4UgoIkmh/9n
 AQSeUxr+aUl5XH5N93Y1iNjGUU64Ozn8dD/QtUFirnAVLBvhSkDXQN7YZn3qbLKkB6
 /cupi8Id6foVQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 01 Aug 2024 22:34:59 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
Date: Thu,  1 Aug 2024 22:34:39 +0200
Message-ID: <ec4a9fbbff184e40d50e1f12e6df161ff5119f21.1722544445.git.christophe.jaillet@wanadoo.fr>
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
It is provided as-is

Changes in v2:
  - Apply a minimal change   [Helge Deller]

v1: https://lore.kernel.org/all/dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr/
---
 drivers/video/fbdev/hpfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
index 66fac8e5393e..a1144b150982 100644
--- a/drivers/video/fbdev/hpfb.c
+++ b/drivers/video/fbdev/hpfb.c
@@ -345,6 +345,7 @@ static int hpfb_dio_probe(struct dio_dev *d, const struct dio_device_id *ent)
 	if (hpfb_init_one(paddr, vaddr)) {
 		if (d->scode >= DIOII_SCBASE)
 			iounmap((void *)vaddr);
+		release_mem_region(d->resource.start, resource_size(&d->resource));
 		return -ENOMEM;
 	}
 	return 0;
-- 
2.45.2

