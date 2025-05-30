Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CCAC8C41
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 12:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD15710E849;
	Fri, 30 May 2025 10:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350AB10E846
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:40:56 +0000 (UTC)
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4b808F6vTHzYkys6;
 Fri, 30 May 2025 18:38:37 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 May
 2025 18:40:52 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 May
 2025 18:40:51 +0800
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
Subject: [PATCH v3 1/4] fs: allow cross-FS copy_file_range for memory-backed
 files
Date: Fri, 30 May 2025 18:39:38 +0800
Message-ID: <20250530103941.11092-2-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250530103941.11092-1-tao.wangtao@honor.com>
References: <20250530103941.11092-1-tao.wangtao@honor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a010.hihonor.com
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

Memory-backed files can optimize copy performance via
copy_file_range callbacks. Compared to mmap&read: reduces
GUP (get_user_pages) overhead; vs sendfile/splice: eliminates
one memory copy; supports dmabuf zero-copy implementation.

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 fs/read_write.c    | 71 +++++++++++++++++++++++++++++++++-------------
 include/linux/fs.h |  2 ++
 2 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index bb0ed26a0b3a..591c6db7b785 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1469,6 +1469,20 @@ COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd,
 }
 #endif
 
+static inline bool is_copy_memory_file_to_file(struct file *file_in,
+				struct file *file_out)
+{
+	return (file_in->f_op->fop_flags & FOP_MEMORY_FILE) &&
+		file_in->f_op->copy_file_range && file_out->f_op->write_iter;
+}
+
+static inline bool is_copy_file_to_memory_file(struct file *file_in,
+				struct file *file_out)
+{
+	return (file_out->f_op->fop_flags & FOP_MEMORY_FILE) &&
+		file_in->f_op->read_iter && file_out->f_op->copy_file_range;
+}
+
 /*
  * Performs necessary checks before doing a file copy
  *
@@ -1484,11 +1498,23 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 	struct inode *inode_out = file_inode(file_out);
 	uint64_t count = *req_count;
 	loff_t size_in;
+	bool splice = flags & COPY_FILE_SPLICE;
+	bool has_memory_file;
 	int ret;
 
-	ret = generic_file_rw_checks(file_in, file_out);
-	if (ret)
-		return ret;
+	/* Skip generic checks, allow cross-sb copies for dma-buf/tmpfs */
+	has_memory_file = is_copy_memory_file_to_file(file_in, file_out) ||
+			  is_copy_file_to_memory_file(file_in, file_out);
+	if (!splice && has_memory_file) {
+		if (!(file_in->f_mode & FMODE_READ) ||
+		    !(file_out->f_mode & FMODE_WRITE) ||
+		    (file_out->f_flags & O_APPEND))
+			return -EBADF;
+	} else {
+		ret = generic_file_rw_checks(file_in, file_out);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * We allow some filesystems to handle cross sb copy, but passing
@@ -1500,7 +1526,7 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 	 * and several different sets of file_operations, but they all end up
 	 * using the same ->copy_file_range() function pointer.
 	 */
-	if (flags & COPY_FILE_SPLICE) {
+	if (splice || has_memory_file) {
 		/* cross sb splice is allowed */
 	} else if (file_out->f_op->copy_file_range) {
 		if (file_in->f_op->copy_file_range !=
@@ -1581,23 +1607,30 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
 	 * same sb using clone, but for filesystems where both clone and copy
 	 * are supported (e.g. nfs,cifs), we only call the copy method.
 	 */
-	if (!splice && file_out->f_op->copy_file_range) {
-		ret = file_out->f_op->copy_file_range(file_in, pos_in,
-						      file_out, pos_out,
-						      len, flags);
-	} else if (!splice && file_in->f_op->remap_file_range && samesb) {
-		ret = file_in->f_op->remap_file_range(file_in, pos_in,
-				file_out, pos_out,
-				min_t(loff_t, MAX_RW_COUNT, len),
-				REMAP_FILE_CAN_SHORTEN);
-		/* fallback to splice */
-		if (ret <= 0)
+	if (!splice) {
+		if (is_copy_memory_file_to_file(file_in, file_out)) {
+			ret = file_in->f_op->copy_file_range(file_in, pos_in,
+					file_out, pos_out, len, flags);
+		} else if (is_copy_file_to_memory_file(file_in, file_out)) {
+			ret = file_out->f_op->copy_file_range(file_in, pos_in,
+					file_out, pos_out, len, flags);
+		} else if (file_out->f_op->copy_file_range) {
+			ret = file_out->f_op->copy_file_range(file_in, pos_in,
+							file_out, pos_out,
+							len, flags);
+		} else if (file_in->f_op->remap_file_range && samesb) {
+			ret = file_in->f_op->remap_file_range(file_in, pos_in,
+					file_out, pos_out,
+					min_t(loff_t, MAX_RW_COUNT, len),
+					REMAP_FILE_CAN_SHORTEN);
+			/* fallback to splice */
+			if (ret <= 0)
+				splice = true;
+		} else if (samesb) {
+			/* Fallback to splice for same sb copy for backward compat */
 			splice = true;
-	} else if (samesb) {
-		/* Fallback to splice for same sb copy for backward compat */
-		splice = true;
+		}
 	}
-
 	file_end_write(file_out);
 
 	if (!splice)
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

