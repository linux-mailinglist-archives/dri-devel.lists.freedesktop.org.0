Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D1265CE0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9BF6E9EF;
	Fri, 11 Sep 2020 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468486E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:07:06 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9E14CE66F1FAABCAC9F1;
 Thu, 10 Sep 2020 22:06:58 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 22:06:48 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i810: make i810_flush_queue() return void
Date: Thu, 10 Sep 2020 22:06:10 +0800
Message-ID: <20200910140610.1191578-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function always return '0' and no callers use the return value. So
make it a void function.

This eliminates the following coccicheck warning:

drivers/gpu/drm/i810/i810_dma.c:860:8-11: Unneeded variable: "ret".
Return "0" on line 885

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/i810/i810_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index 303c2d483c6e..88250860f8e4 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -853,11 +853,11 @@ static void i810_dma_quiescent(struct drm_device *dev)
 	i810_wait_ring(dev, dev_priv->ring.Size - 8);
 }
 
-static int i810_flush_queue(struct drm_device *dev)
+static void i810_flush_queue(struct drm_device *dev)
 {
 	drm_i810_private_t *dev_priv = dev->dev_private;
 	struct drm_device_dma *dma = dev->dma;
-	int i, ret = 0;
+	int i;
 	RING_LOCALS;
 
 	i810_kernel_lost_context(dev);
@@ -882,7 +882,7 @@ static int i810_flush_queue(struct drm_device *dev)
 			DRM_DEBUG("still on client\n");
 	}
 
-	return ret;
+	return;
 }
 
 /* Must be called with the lock held */
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
