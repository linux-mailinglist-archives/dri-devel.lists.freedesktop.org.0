Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4303C7F3E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A896E175;
	Wed, 14 Jul 2021 07:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jul 2021 07:17:01 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281D6E175
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 07:17:01 +0000 (UTC)
X-UUID: 981c53e6deac4dc99d9518640f7c133a-20210714
X-UUID: 981c53e6deac4dc99d9518640f7c133a-20210714
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1385633967; Wed, 14 Jul 2021 15:11:57 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 15:11:49 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Jul 2021 15:11:49 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: add kernel count for dma_buf
Date: Wed, 14 Jul 2021 15:11:44 +0800
Message-ID: <20210714071144.62126-1-guangming.cao@mediatek.com>
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
Cc: Guangming Cao <Guangming.Cao@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming Cao <Guangming.Cao@mediatek.com>

Add a refcount for kernel to prevent UAF(Use After Free) issue.

We can assume a case like below:
    1. kernel space alloc dma_buf(file count = 1)
    2. kernel use dma_buf to get fd(file count = 1)
    3. userspace use fd to do mapping (file count = 2)
    4. kernel call dma_buf_put (file count = 1)
    5. userpsace close buffer fd(file count = 0)
    6. at this time, buffer is released, but va is valid!!
       So we still can read/write buffer via mmap va,
       it maybe cause memory leak, or kernel exception.
       And also, if we use "ls -ll" to watch corresponding process
           fd link info, it also will cause kernel exception.

Another case:
     Using dma_buf_fd to generate more than 1 fd, because
     dma_buf_fd will not increase file count, thus, when close
     the second fd, it maybe occurs error.

Solution:
    Add a kernel count for dma_buf, and make sure the file count
        of dma_buf.file hold by kernel is 1.

Notes: For this solution, kref couldn't work because kernel ref
       maybe added from 0, but kref don't allow it.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++----
 include/linux/dma-buf.h   |  6 ++++--
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..04ee92aac8b9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -62,6 +62,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (unlikely(!dmabuf))
 		return;
 
+	WARN_ON(atomic64_read(&dmabuf->kernel_ref));
 	BUG_ON(dmabuf->vmapping_counter);
 
 	/*
@@ -555,6 +556,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		goto err_module;
 	}
 
+	atomic64_set(&dmabuf->kernel_ref, 1);
 	dmabuf->priv = exp_info->priv;
 	dmabuf->ops = exp_info->ops;
 	dmabuf->size = exp_info->size;
@@ -617,6 +619,9 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	/* Add file cnt for each new fd */
+	get_file(dmabuf->file);
+
 	return fd;
 }
 EXPORT_SYMBOL_GPL(dma_buf_fd);
@@ -626,12 +631,13 @@ EXPORT_SYMBOL_GPL(dma_buf_fd);
  * @fd:	[in]	fd associated with the struct dma_buf to be returned
  *
  * On success, returns the struct dma_buf associated with an fd; uses
- * file's refcounting done by fget to increase refcount. returns ERR_PTR
- * otherwise.
+ * dmabuf's ref refcounting done by kref_get to increase refcount.
+ * Returns ERR_PTR otherwise.
  */
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -643,7 +649,12 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+	/* replace file count increase as ref increase for kernel user */
+	get_dma_buf(dmabuf);
+	fput(file);
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_GPL(dma_buf_get);
 
@@ -662,7 +673,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 	if (WARN_ON(!dmabuf || !dmabuf->file))
 		return;
 
-	fput(dmabuf->file);
+	if (WARN_ON(!atomic64_read(&dmabuf->kernel_ref)))
+		return;
+
+	if (!atomic64_dec_return(&dmabuf->kernel_ref))
+		fput(dmabuf->file);
 }
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..bc790cb028eb 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -308,6 +308,7 @@ struct dma_buf_ops {
 struct dma_buf {
 	size_t size;
 	struct file *file;
+	atomic64_t kernel_ref;
 	struct list_head attachments;
 	const struct dma_buf_ops *ops;
 	struct mutex lock;
@@ -436,7 +437,7 @@ struct dma_buf_export_info {
 					 .owner = THIS_MODULE }
 
 /**
- * get_dma_buf - convenience wrapper for get_file.
+ * get_dma_buf - increase a kernel ref of dma-buf
  * @dmabuf:	[in]	pointer to dma_buf
  *
  * Increments the reference count on the dma-buf, needed in case of drivers
@@ -446,7 +447,8 @@ struct dma_buf_export_info {
  */
 static inline void get_dma_buf(struct dma_buf *dmabuf)
 {
-	get_file(dmabuf->file);
+	if (atomic64_inc_return(&dmabuf->kernel_ref) == 1)
+		get_file(dmabuf->file);
 }
 
 /**
-- 
2.17.1

