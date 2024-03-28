Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0089024F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A873112466;
	Thu, 28 Mar 2024 14:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l9LeqVpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B29D112466
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nkqbgG1HrRF3ejvn+5iZhShKyFwlWg+3aA2aTIsKg7Y=; b=l9LeqVpTWjHKfGQt+kKRgbPf8s
 WDAvhfYh7NGSMUBT3eh5GC3BQi5huG4D9JB5ZBx4Mqb3+esFsPfopskhXCorPVKofm1eftxDa2j5S
 1zLJdlHiqsf2EF/zNn7eSnMC3u1sYU1+U5Xyn5SIXUH5DXkPEZTfI1FmrDxa9xorxPgxxp5A+uewc
 eKLRmXUhXLcxbYcNi0X/ZBMFCRR8GOVw4Ko6rZBT36YuzPkYiG+fY8x2ecMVd8MRFyFjb3WJRreUz
 59LzJf1f8s6AhFmM8GC3eOjxHZzmVJHy3KEkD4qF9EWg6ps8XNaHIVofUMCn1JCp5qUdKpK02FS73
 S2eNoFAg==;
Received: from [84.65.0.132] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rpr8Q-00GHNP-GR; Thu, 28 Mar 2024 15:53:42 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: [PATCH] dma-buf: Do not build debugfs related code when
 !CONFIG_DEBUG_FS
Date: Thu, 28 Mar 2024 14:53:23 +0000
Message-ID: <20240328145323.68872-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Tvrtko Ursulin <tursulin@ursulin.net>

There is no point in compiling in the list and mutex operations which are
only used from the dma-buf debugfs code, if debugfs is not compiled in.

Put the code in questions behind some kconfig guards and so save some text
and maybe even a pointer per object at runtime when not enabled.

Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com
---
 drivers/dma-buf/dma-buf.c | 56 ++++++++++++++++++++++++---------------
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..8892bc701a66 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,12 +35,35 @@
 
 static inline int is_dma_buf_file(struct file *);
 
-struct dma_buf_list {
-	struct list_head head;
-	struct mutex lock;
-};
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static DEFINE_MUTEX(debugfs_list_mutex);
+static LIST_HEAD(debugfs_list);
 
-static struct dma_buf_list db_list;
+static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
+{
+	mutex_lock(&debugfs_list_mutex);
+	list_add(&dmabuf->list_node, &debugfs_list);
+	mutex_unlock(&debugfs_list_mutex);
+}
+
+static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
+{
+	if (!dmabuf)
+		return;
+
+	mutex_lock(&debugfs_list_mutex);
+	list_del(&dmabuf->list_node);
+	mutex_unlock(&debugfs_list_mutex);
+}
+#else
+static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
+{
+}
+
+static void __dma_buf_debugfs_list_del(struct file *file)
+{
+}
+#endif
 
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
@@ -89,17 +112,10 @@ static void dma_buf_release(struct dentry *dentry)
 
 static int dma_buf_file_release(struct inode *inode, struct file *file)
 {
-	struct dma_buf *dmabuf;
-
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
 
-	dmabuf = file->private_data;
-	if (dmabuf) {
-		mutex_lock(&db_list.lock);
-		list_del(&dmabuf->list_node);
-		mutex_unlock(&db_list.lock);
-	}
+	__dma_buf_debugfs_list_del(file->private_data);
 
 	return 0;
 }
@@ -672,9 +688,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
 
-	mutex_lock(&db_list.lock);
-	list_add(&dmabuf->list_node, &db_list.head);
-	mutex_unlock(&db_list.lock);
+	__dma_buf_debugfs_list_add(dmabuf);
 
 	return dmabuf;
 
@@ -1611,7 +1625,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	size_t size = 0;
 	int ret;
 
-	ret = mutex_lock_interruptible(&db_list.lock);
+	ret = mutex_lock_interruptible(&debugfs_list_mutex);
 
 	if (ret)
 		return ret;
@@ -1620,7 +1634,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
 
-	list_for_each_entry(buf_obj, &db_list.head, list_node) {
+	list_for_each_entry(buf_obj, &debugfs_list, list_node) {
 
 		ret = dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1657,11 +1671,11 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
 
-	mutex_unlock(&db_list.lock);
+	mutex_unlock(&debugfs_list_mutex);
 	return 0;
 
 error_unlock:
-	mutex_unlock(&db_list.lock);
+	mutex_unlock(&debugfs_list_mutex);
 	return ret;
 }
 
@@ -1718,8 +1732,6 @@ static int __init dma_buf_init(void)
 	if (IS_ERR(dma_buf_mnt))
 		return PTR_ERR(dma_buf_mnt);
 
-	mutex_init(&db_list.lock);
-	INIT_LIST_HEAD(&db_list.head);
 	dma_buf_init_debugfs();
 	return 0;
 }
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8ff4add71f88..36216d28d8bd 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -370,8 +370,10 @@ struct dma_buf {
 	 */
 	struct module *owner;
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
 	/** @list_node: node for dma_buf accounting and debugging. */
 	struct list_head list_node;
+#endif
 
 	/** @priv: exporter specific private data for this buffer object. */
 	void *priv;
-- 
2.44.0

