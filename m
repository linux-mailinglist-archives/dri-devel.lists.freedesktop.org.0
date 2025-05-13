Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B9AB641F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567610E250;
	Wed, 14 May 2025 07:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490FF10E52E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 09:53:36 +0000 (UTC)
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4ZxWX109L3zYlNKs;
 Tue, 13 May 2025 17:34:25 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:36:27 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:36:27 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
 <feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
Date: Tue, 13 May 2025 17:27:35 +0800
Message-ID: <20250513092735.1931-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a010.hihonor.com
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

Add DMA_BUF_IOCTL_RW_FILE to save/restore data from/to a dma-buf.

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 drivers/dma-buf/dma-buf.c    |  8 ++++++++
 include/linux/dma-buf.h      |  3 +++
 include/uapi/linux/dma-buf.h | 29 +++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..95d8b0158ffd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -460,6 +460,7 @@ static long dma_buf_ioctl(struct file *file,
 	struct dma_buf *dmabuf;
 	struct dma_buf_sync sync;
 	enum dma_data_direction direction;
+	struct dma_buf_rw_file kfile;
 	int ret;
 
 	dmabuf = file->private_data;
@@ -504,6 +505,13 @@ static long dma_buf_ioctl(struct file *file,
 		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
+	case DMA_BUF_IOCTL_RW_FILE:
+		if (copy_from_user(&kfile, (void __user *) arg, sizeof(kfile)))
+			return -EFAULT;
+		if (!dmabuf->ops->rw_file)
+			return -EINVAL;
+		return dmabuf->ops->rw_file(dmabuf, &kfile);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..de236ba2094b 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
+#include <uapi/linux/dma-buf.h>
 
 struct device;
 struct dma_buf;
@@ -285,6 +286,8 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	int (*rw_file)(struct dma_buf *dmabuf, struct dma_buf_rw_file *file);
 };
 
 /**
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 5a6fda66d9ad..ec9164b7b753 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -167,6 +167,29 @@ struct dma_buf_import_sync_file {
 	__s32 fd;
 };
 
+/**
+ * struct dma_buf_rw_file - read/write file associated with a dma-buf
+ *
+ * Userspace can performs a DMA_BUF_IOCTL_BACK to save data from a dma-buf or
+ * restore data to a dma-buf.
+ */
+struct dma_buf_rw_file {
+
+	/** @flags: Flags indicating read/write for this dma-buf. */
+	__u32 flags;
+	/** @fd: File descriptor of the file associated with this dma-buf. */
+	__s32 fd;
+	/** @file_offset: Offset within the file where this dma-buf starts.
+	 *
+	 *  Offset and Length must be page-aligned for direct I/O.
+	 */
+	__u64 file_offset;
+	/** @buf_offset: Offset within this dma-buf where the read/write starts. */
+	__u64 buf_offset;
+	/** @buf_len: Length of this dma-buf read/write. */
+	__u64 buf_len;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -179,4 +202,10 @@ struct dma_buf_import_sync_file {
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
+#define DMA_BUF_RW_FLAGS_OP_MASK (0xFF << 0)
+#define DMA_BUF_RW_FLAGS_READ (1 << 0) /* Restore dma-buf data */
+#define DMA_BUF_RW_FLAGS_WRITE (2 << 0) /* Save dma-buf data */
+#define DMA_BUF_RW_FLAGS_DIRECT (1u << 31) /* Direct read/write file */
+#define DMA_BUF_IOCTL_RW_FILE	_IOW(DMA_BUF_BASE, 4, struct dma_buf_rw_file)
+
 #endif
-- 
2.17.1

