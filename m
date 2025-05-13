Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30797AB641C
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3174B10E224;
	Wed, 14 May 2025 07:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1050 seconds by postgrey-1.36 at gabe;
 Tue, 13 May 2025 09:53:34 UTC
Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E59910E373
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 09:53:34 +0000 (UTC)
Received: from w003.hihonor.com (unknown [10.68.17.88])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4ZxWXP2FgrzYlgbZ;
 Tue, 13 May 2025 17:34:45 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:36:47 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:36:47 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
 <feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Date: Tue, 13 May 2025 17:28:03 +0800
Message-ID: <20250513092803.2096-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a010.hihonor.com
 (10.68.16.52)
X-Mailman-Approved-At: Wed, 14 May 2025 07:23:32 +0000
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

Support direct file I/O operations for system_heap dma-buf objects.
Implementation includes:
1. Convert sg_table to bio_vec
2. Set IOCB_DIRECT when O_DIRECT is supported
3. Invoke vfs_iocb_iter_read()/vfs_iocb_iter_write() for actual I/O

Performance metrics (UFS 4.0 device @4GB/s, Arm64 CPU @1GHz):

| Metric             |    1MB |    8MB |    64MB |   1024MB |   3072MB |
|--------------------|-------:|-------:|--------:|---------:|---------:|
| Buffer Read (us)   |   1658 |   9028 |   69295 |  1019783 |  2978179 |
| Direct Read (us)   |    707 |   2647 |   18689 |   299627 |   937758 |
| Buffer Rate (MB/s) |    603 |    886 |     924 |     1004 |     1032 |
| Direct Rate (MB/s) |   1414 |   3022 |    3425 |     3418 |     3276 |

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 drivers/dma-buf/heaps/system_heap.c | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..f7b71b9843aa 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -20,6 +20,8 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/bvec.h>
+#include <linux/uio.h>
 
 static struct dma_heap *sys_heap;
 
@@ -281,6 +283,121 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	iosys_map_clear(map);
 }
 
+static struct bio_vec *system_heap_init_bvec(struct system_heap_buffer *buffer,
+			size_t offset, size_t len, int *nr_segs)
+{
+	struct sg_table *sgt = &buffer->sg_table;
+	struct scatterlist *sg;
+	size_t length = 0;
+	unsigned int i, k = 0;
+	struct bio_vec *bvec;
+	size_t sg_left;
+	size_t sg_offset;
+	size_t sg_len;
+
+	bvec = kvcalloc(sgt->nents, sizeof(*bvec), GFP_KERNEL);
+	if (!bvec)
+		return NULL;
+
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		length += sg->length;
+		if (length <= offset)
+			continue;
+
+		sg_left = length - offset;
+		sg_offset = sg->offset + sg->length - sg_left;
+		sg_len = min(sg_left, len);
+
+		bvec[k].bv_page = sg_page(sg);
+		bvec[k].bv_len = sg_len;
+		bvec[k].bv_offset = sg_offset;
+		k++;
+
+		offset += sg_len;
+		len -= sg_len;
+		if (len <= 0)
+			break;
+	}
+
+	*nr_segs = k;
+	return bvec;
+}
+
+static int system_heap_rw_file(struct system_heap_buffer *buffer, bool is_read,
+		bool direct_io, struct file *filp, loff_t file_offset,
+		size_t buf_offset, size_t len)
+{
+	struct bio_vec *bvec;
+	int nr_segs = 0;
+	struct iov_iter iter;
+	struct kiocb kiocb;
+	ssize_t ret = 0;
+
+	if (direct_io) {
+		if (!(filp->f_mode & FMODE_CAN_ODIRECT))
+			return -EINVAL;
+	}
+
+	bvec = system_heap_init_bvec(buffer, buf_offset, len, &nr_segs);
+	if (!bvec)
+		return -ENOMEM;
+
+	iov_iter_bvec(&iter, is_read ? ITER_DEST : ITER_SOURCE, bvec, nr_segs, len);
+	init_sync_kiocb(&kiocb, filp);
+	kiocb.ki_pos = file_offset;
+	if (direct_io)
+		kiocb.ki_flags |= IOCB_DIRECT;
+
+	while (kiocb.ki_pos < file_offset + len) {
+		if (is_read)
+			ret = vfs_iocb_iter_read(filp, &kiocb, &iter);
+		else
+			ret = vfs_iocb_iter_write(filp, &kiocb, &iter);
+		if (ret <= 0)
+			break;
+	}
+
+	kvfree(bvec);
+	return ret < 0 ? ret : 0;
+}
+
+static int system_heap_dma_buf_rw_file(struct dma_buf *dmabuf,
+			struct dma_buf_rw_file *back)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	int ret = 0;
+	__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
+	bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
+	struct file *filp;
+
+	if (op != DMA_BUF_RW_FLAGS_READ && op != DMA_BUF_RW_FLAGS_WRITE)
+		return -EINVAL;
+	if (direct_io) {
+		if (!PAGE_ALIGNED(back->file_offset) ||
+			!PAGE_ALIGNED(back->buf_offset) ||
+			!PAGE_ALIGNED(back->buf_len))
+		return -EINVAL;
+	}
+	if (!back->buf_len || back->buf_len > dmabuf->size ||
+		back->buf_offset >= dmabuf->size ||
+		back->buf_offset + back->buf_len > dmabuf->size)
+		return -EINVAL;
+	if (back->file_offset + back->buf_len < back->file_offset)
+		return -EINVAL;
+
+	filp = fget(back->fd);
+	if (!filp)
+		return -EBADF;
+
+	mutex_lock(&buffer->lock);
+	ret = system_heap_rw_file(buffer, op == DMA_BUF_RW_FLAGS_READ, direct_io,
+			filp, back->file_offset, back->buf_offset, back->buf_len);
+	mutex_unlock(&buffer->lock);
+
+	fput(filp);
+	return ret;
+}
+
 static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
@@ -308,6 +425,7 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 	.mmap = system_heap_mmap,
 	.vmap = system_heap_vmap,
 	.vunmap = system_heap_vunmap,
+	.rw_file = system_heap_dma_buf_rw_file,
 	.release = system_heap_dma_buf_release,
 };
 
-- 
2.17.1

