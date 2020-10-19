Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C317C292E78
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C746EA4C;
	Mon, 19 Oct 2020 19:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74736E427
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 09:29:37 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3097AE86B9F87112BE11;
 Mon, 19 Oct 2020 17:29:34 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 17:29:28 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] gpu: ipu-v3: replace spin_lock_irqsave by spin_lock in hard
 IRQ
Date: Mon, 19 Oct 2020 17:30:13 +0800
Message-ID: <1603099813-27934-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index aa1d4b6..c28764c 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -1737,9 +1737,8 @@ static irqreturn_t eof_irq(int irq, void *data)
 	struct ipu_image_convert_run *run;
 	irqreturn_t ret = IRQ_HANDLED;
 	bool tile_complete = false;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->irqlock, flags);
+	spin_lock(&chan->irqlock);
 
 	/* get current run and its context */
 	run = chan->current_run;
@@ -1778,7 +1777,7 @@ static irqreturn_t eof_irq(int irq, void *data)
 	if (tile_complete)
 		ret = do_tile_complete(run);
 out:
-	spin_unlock_irqrestore(&chan->irqlock, flags);
+	spin_unlock(&chan->irqlock);
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
