Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A82ACC3A5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB1C10E1C6;
	Tue,  3 Jun 2025 09:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39F10E1C6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 09:53:56 +0000 (UTC)
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bBQwN2MZ8zYlSxZ;
 Tue,  3 Jun 2025 17:51:48 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 17:53:50 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 17:53:50 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <kraxel@redhat.com>, <vivek.kasireddy@intel.com>, <viro@zeniv.linux.org.uk>,
 <brauner@kernel.org>, <hughd@google.com>, <akpm@linux-foundation.org>,
 <amir73il@gmail.com>
CC: <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>, <jack@suse.cz>,
 <baolin.wang@linux.alibaba.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <bintian.wang@honor.com>, <yipengxiang@honor.com>,
 <liulu.liu@honor.com>, <feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v4 2/4] dmabuf: Implement copy_file_range callback for dmabuf
 direct I/O prep
Date: Tue, 3 Jun 2025 17:52:43 +0800
Message-ID: <20250603095245.17478-3-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250603095245.17478-1-tao.wangtao@honor.com>
References: <20250603095245.17478-1-tao.wangtao@honor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a010.hihonor.com
 (10.68.16.52)
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

First determine if dmabuf reads from or writes to the file.
Then call exporter's rw_file callback function.

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 drivers/dma-buf/dma-buf.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 16 ++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..fc9bf54c921a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -523,7 +523,38 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	spin_unlock(&dmabuf->name_lock);
 }
 
+static ssize_t dma_buf_rw_file(struct dma_buf *dmabuf, loff_t my_pos,
+	struct file *file, loff_t pos, size_t count, bool is_write)
+{
+	if (!dmabuf->ops->rw_file)
+		return -EINVAL;
+
+	if (my_pos >= dmabuf->size)
+		count = 0;
+	else
+		count = min_t(size_t, count, dmabuf->size - my_pos);
+	if (!count)
+		return 0;
+
+	return dmabuf->ops->rw_file(dmabuf, my_pos, file, pos, count, is_write);
+}
+
+static ssize_t dma_buf_copy_file_range(struct file *file_in, loff_t pos_in,
+	struct file *file_out, loff_t pos_out,
+	size_t count, unsigned int flags)
+{
+	if (is_dma_buf_file(file_in) && file_out->f_op->write_iter)
+		return dma_buf_rw_file(file_in->private_data, pos_in,
+				file_out, pos_out, count, true);
+	else if (is_dma_buf_file(file_out) && file_in->f_op->read_iter)
+		return dma_buf_rw_file(file_out->private_data, pos_out,
+				file_in, pos_in, count, false);
+	else
+		return -EINVAL;
+}
+
 static const struct file_operations dma_buf_fops = {
+	.fop_flags = FOP_MEMORY_FILE,
 	.release	= dma_buf_file_release,
 	.mmap		= dma_buf_mmap_internal,
 	.llseek		= dma_buf_llseek,
@@ -531,6 +562,7 @@ static const struct file_operations dma_buf_fops = {
 	.unlocked_ioctl	= dma_buf_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.show_fdinfo	= dma_buf_show_fdinfo,
+	.copy_file_range = dma_buf_copy_file_range,
 };
 
 /*
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..d3636e985399 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
+#include <uapi/linux/dma-buf.h>
 
 struct device;
 struct dma_buf;
@@ -285,6 +286,21 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	/**
+	 * @rw_file:
+	 *
+	 * If an Exporter needs to support Direct I/O file operations, it can
+	 * implement this optional callback. The exporter must verify that no
+	 * other objects hold the sg_table, ensure exclusive access to the
+	 * dmabuf's sg_table, and only then proceed with the I/O operation.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
+	ssize_t (*rw_file)(struct dma_buf *dmabuf, loff_t my_pos,
+		struct file *file, loff_t pos, size_t count, bool is_write);
 };
 
 /**
-- 
2.17.1

