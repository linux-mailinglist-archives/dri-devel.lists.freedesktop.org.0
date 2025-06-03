Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F47ACC3A9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350CE10E274;
	Tue,  3 Jun 2025 09:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC7C10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 09:53:56 +0000 (UTC)
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bBQw53G5YzYlP5Y;
 Tue,  3 Jun 2025 17:51:33 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v4 1/4] fs: allow cross-FS copy_file_range for memory file
 with direct I/O
Date: Tue, 3 Jun 2025 17:52:42 +0800
Message-ID: <20250603095245.17478-2-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250603095245.17478-1-tao.wangtao@honor.com>
References: <20250603095245.17478-1-tao.wangtao@honor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Memory files can optimize copy performance via copy_file_range callbacks:
-Compared to mmap&read: reduces GUP (get_user_pages) overhead
-Compared to sendfile/splice: eliminates one memory copy
-Supports dma-buf direct I/O zero-copy implementation

Suggested by: Christian König <christian.koenig@amd.com>
Suggested by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 fs/read_write.c    | 64 +++++++++++++++++++++++++++++++++++++---------
 include/linux/fs.h |  2 ++
 2 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index bb0ed26a0b3a..ecb4f753c632 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1469,6 +1469,31 @@ COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd,
 }
 #endif
 
+static const struct file_operations *memory_copy_file_ops(
+			struct file *file_in, struct file *file_out)
+{
+	if ((file_in->f_op->fop_flags & FOP_MEMORY_FILE) &&
+	    (file_in->f_mode & FMODE_CAN_ODIRECT) &&
+	    file_in->f_op->copy_file_range && file_out->f_op->write_iter)
+		return file_in->f_op;
+	else if ((file_out->f_op->fop_flags & FOP_MEMORY_FILE) &&
+		 (file_out->f_mode & FMODE_CAN_ODIRECT) &&
+		 file_in->f_op->read_iter && file_out->f_op->copy_file_range)
+		return file_out->f_op;
+	else
+		return NULL;
+}
+
+static int essential_file_rw_checks(struct file *file_in, struct file *file_out)
+{
+	if (!(file_in->f_mode & FMODE_READ) ||
+	    !(file_out->f_mode & FMODE_WRITE) ||
+	    (file_out->f_flags & O_APPEND))
+		return -EBADF;
+
+	return 0;
+}
+
 /*
  * Performs necessary checks before doing a file copy
  *
@@ -1484,9 +1509,16 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 	struct inode *inode_out = file_inode(file_out);
 	uint64_t count = *req_count;
 	loff_t size_in;
+	bool splice = flags & COPY_FILE_SPLICE;
+	const struct file_operations *mem_fops;
 	int ret;
 
-	ret = generic_file_rw_checks(file_in, file_out);
+	/* The dma-buf file is not a regular file. */
+	mem_fops = memory_copy_file_ops(file_in, file_out);
+	if (splice || mem_fops == NULL)
+		ret = generic_file_rw_checks(file_in, file_out);
+	else
+		ret = essential_file_rw_checks(file_in, file_out);
 	if (ret)
 		return ret;
 
@@ -1500,8 +1532,10 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 	 * and several different sets of file_operations, but they all end up
 	 * using the same ->copy_file_range() function pointer.
 	 */
-	if (flags & COPY_FILE_SPLICE) {
+	if (splice) {
 		/* cross sb splice is allowed */
+	} else if (mem_fops != NULL) {
+		/* cross-fs copy is allowed for memory file. */
 	} else if (file_out->f_op->copy_file_range) {
 		if (file_in->f_op->copy_file_range !=
 		    file_out->f_op->copy_file_range)
@@ -1554,6 +1588,7 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
 	ssize_t ret;
 	bool splice = flags & COPY_FILE_SPLICE;
 	bool samesb = file_inode(file_in)->i_sb == file_inode(file_out)->i_sb;
+	const struct file_operations *mem_fops;
 
 	if (flags & ~COPY_FILE_SPLICE)
 		return -EINVAL;
@@ -1574,18 +1609,27 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (len == 0)
 		return 0;
 
+	if (splice)
+		goto do_splice;
+
 	file_start_write(file_out);
 
 	/*
 	 * Cloning is supported by more file systems, so we implement copy on
 	 * same sb using clone, but for filesystems where both clone and copy
 	 * are supported (e.g. nfs,cifs), we only call the copy method.
+	 * For copy to/from memory file, we alway call the copy method of the
+	 * memory file.
 	 */
-	if (!splice && file_out->f_op->copy_file_range) {
+	mem_fops = memory_copy_file_ops(file_in, file_out);
+	if (mem_fops) {
+		ret = mem_fops->copy_file_range(file_in, pos_in,
+					file_out, pos_out, len, flags);
+	} else if (file_out->f_op->copy_file_range) {
 		ret = file_out->f_op->copy_file_range(file_in, pos_in,
-						      file_out, pos_out,
-						      len, flags);
-	} else if (!splice && file_in->f_op->remap_file_range && samesb) {
+						file_out, pos_out,
+						len, flags);
+	} else if (file_in->f_op->remap_file_range && samesb) {
 		ret = file_in->f_op->remap_file_range(file_in, pos_in,
 				file_out, pos_out,
 				min_t(loff_t, MAX_RW_COUNT, len),
@@ -1603,6 +1647,7 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (!splice)
 		goto done;
 
+do_splice:
 	/*
 	 * We can get here for same sb copy of filesystems that do not implement
 	 * ->copy_file_range() in case filesystem does not support clone or in
@@ -1786,12 +1831,7 @@ int generic_file_rw_checks(struct file *file_in, struct file *file_out)
 	if (!S_ISREG(inode_in->i_mode) || !S_ISREG(inode_out->i_mode))
 		return -EINVAL;
 
-	if (!(file_in->f_mode & FMODE_READ) ||
-	    !(file_out->f_mode & FMODE_WRITE) ||
-	    (file_out->f_flags & O_APPEND))
-		return -EBADF;
-
-	return 0;
+	return essential_file_rw_checks(file_in, file_out);
 }
 
 int generic_atomic_write_valid(struct kiocb *iocb, struct iov_iter *iter)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 016b0fe1536e..37df1b497418 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2187,6 +2187,8 @@ struct file_operations {
 #define FOP_ASYNC_LOCK		((__force fop_flags_t)(1 << 6))
 /* File system supports uncached read/write buffered IO */
 #define FOP_DONTCACHE		((__force fop_flags_t)(1 << 7))
+/* Supports cross-FS copy_file_range for memory file */
+#define FOP_MEMORY_FILE		((__force fop_flags_t)(1 << 8))
 
 /* Wrap a directory iterator that needs exclusive inode access */
 int wrap_directory_iterator(struct file *, struct dir_context *,
-- 
2.17.1

