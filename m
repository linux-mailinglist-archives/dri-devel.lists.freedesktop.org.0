Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A063F3C8476
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B990E6E245;
	Wed, 14 Jul 2021 12:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE0C6E245
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:30:09 +0000 (UTC)
X-UUID: 48445f478d4442bcb0cf2e130107744b-20210714
X-UUID: 48445f478d4442bcb0cf2e130107744b-20210714
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1885057935; Wed, 14 Jul 2021 20:30:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 20:29:56 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Jul 2021 20:29:56 +0800
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
Subject: [PATCH] dma-buf: support users to change dma_buf.name
Date: Wed, 14 Jul 2021 20:29:54 +0800
Message-ID: <20210714122954.71931-1-guangming.cao@mediatek.com>
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
Cc: caoguangming34@gmail.com, Guangming Cao <Guangming.Cao@mediatek.com>,
 wsd_upstream@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming Cao <Guangming.Cao@mediatek.com>

User space user can call DMA_BUF_SET_NAME to set dma_buf.name,
also add a kernel api for users to do same thing at kernel side.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 28 ++++++++++++++++++++++------
 include/linux/dma-buf.h   |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..949af232c644 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -331,20 +331,20 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
  * purpose between different devices.
  *
  * @dmabuf: [in]     dmabuf buffer that will be renamed.
- * @buf:    [in]     A piece of userspace memory that contains the name of
+ * @buf:    [in]     A piece of memory that contains the name of
  *                   the dma-buf.
  *
  * Returns 0 on success. If the dma-buf buffer is already attached to
  * devices, return -EBUSY.
  *
  */
-static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
+long dma_buf_set_name(struct dma_buf *dmabuf, const char *buf)
 {
-	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
+	char *name = kstrndup(buf, DMA_BUF_NAME_LEN, GFP_KERNEL);
 	long ret = 0;
 
-	if (IS_ERR(name))
-		return PTR_ERR(name);
+	if (!name)
+		return -ENOMEM;
 
 	dma_resv_lock(dmabuf->resv, NULL);
 	if (!list_empty(&dmabuf->attachments)) {
@@ -361,6 +361,22 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dma_buf_set_name);
+
+static long
+dma_buf_set_name_user(struct dma_buf *dmabuf, const char __user *buf)
+{
+	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
+	long ret = 0;
+
+	if (IS_ERR(name))
+		return PTR_ERR(name);
+
+	ret = dma_buf_set_name(dmabuf, name);
+	kfree(name);
+
+	return ret;
+}
 
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
@@ -403,7 +419,7 @@ static long dma_buf_ioctl(struct file *file,
 
 	case DMA_BUF_SET_NAME_A:
 	case DMA_BUF_SET_NAME_B:
-		return dma_buf_set_name(dmabuf, (const char __user *)arg);
+		return dma_buf_set_name_user(dmabuf, (const char __user *)arg);
 
 	default:
 		return -ENOTTY;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..e6612ab59a59 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+long dma_buf_set_name(struct dma_buf *dmabuf, const char *name);
 #endif /* __DMA_BUF_H__ */
-- 
2.17.1

