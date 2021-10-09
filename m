Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64E4276BC
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 04:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71C66E079;
	Sat,  9 Oct 2021 02:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3596E079
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 02:45:55 +0000 (UTC)
X-UUID: 3c2e614b433e45a4bfdc23e2206201e8-20211009
X-UUID: 3c2e614b433e45a4bfdc23e2206201e8-20211009
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214547654; Sat, 09 Oct 2021 10:45:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 9 Oct 2021 10:45:47 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 9 Oct 2021 10:45:47 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open
 list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, "open
 list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date: Sat, 9 Oct 2021 10:47:33 +0800
Message-ID: <20211009024733.65676-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

If dma-buf don't want userspace users to touch the dmabuf buffer,
it seems we should add this restriction into dma_buf_ops.mmap,
not in this IOCTL:DMA_BUF_SET_NAME.

With this restriction, we can only know the kernel users of the dmabuf
by attachments.
However, for many userspace users, such as userpsace users of dma_heap,
they also need to mark the usage of dma-buf, and they don't care about
who attached to this dmabuf, and seems it's no meaning to waitting for
IOCTL:DMA_BUF_SET_NAME rather than mmap.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..afbd0a226639 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 
 /**
  * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
- * The name of the dma-buf buffer can only be set when the dma-buf is not
- * attached to any devices. It could theoritically support changing the
- * name of the dma-buf if the same piece of memory is used for multiple
- * purpose between different devices.
+ * It could theoritically support changing the name of the dma-buf if the same
+ * piece of memory is used for multiple purpose between different devices.
  *
  * @dmabuf: [in]     dmabuf buffer that will be renamed.
  * @buf:    [in]     A piece of userspace memory that contains the name of
@@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	if (!list_empty(&dmabuf->attachments)) {
-		ret = -EBUSY;
-		kfree(name);
-		goto out_unlock;
-	}
 	spin_lock(&dmabuf->name_lock);
 	kfree(dmabuf->name);
 	dmabuf->name = name;
 	spin_unlock(&dmabuf->name_lock);
 
-out_unlock:
-	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
 
-- 
2.17.1

