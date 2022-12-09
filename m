Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A0647E5E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 08:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4CF10E1F9;
	Fri,  9 Dec 2022 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DD710E1F9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 07:15:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h12so4266153wrv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 23:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZBW+cO9UGFrl29m84LMRqN2hvra/9chkI9wZX9NF3k=;
 b=qxwL6MLkDOInxMds/MY65BcE22uGw4mJW3FGmyuAi5uW3q69S5fdjIwSAh+JIH3Kew
 530ip8yY01cFMbQj6e0+hx1vsXh/XsD8y5D0DhWPX3l0X4QjeYhoumdzOzwploPqLpTz
 mY1NWOynbdk/2dk0tH+mL/rpJ57Ow/h5ivW1uIHGIsfDqxSDViq6agVt1E3BI33/cV65
 8lYaCG6tDLL4WSvmvILz9iGvOLWm4pJAPY3iwe50Xt/3Eb/CLCFYPXWEl5KPOMaEc30M
 YNt7vn5IWe5T4aTycCQGxyxhWksT5pFOQXOTt6VSIeuMwRPoMxbNNL3UFWHRzHPALWGY
 6yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZBW+cO9UGFrl29m84LMRqN2hvra/9chkI9wZX9NF3k=;
 b=eS6XgcZrOX6tDl6RzF+e3JBTlukOJfp76ePZdzUCWB8PBcgZvJGfS4Xk7M7vG1eUuq
 yHGhB6EzcyeO4748ojys1Iq2nj9t8Z7xjcl400Jz33o6kEq6vigfn8y8ke4GryBNGI7s
 23pLzRRaEvVvf5qWMXPAnmZeUzk/0fAWd4eyNms9RBTP/6d69vAn4/vhSqA6x2loG8qL
 pX1aQzlX7obDWYIanHvkYH0l0a9qsRtNpnFnUb2TeHXlamXJTXzYI7nwwiM55vUsco0+
 Y7UjIYakbUdLUFu2TlJGN1RbrMPQRGXfYb/m41AzN+kkZoT/LyiEaSGmx6twlxrCWRu3
 9xqg==
X-Gm-Message-State: ANoB5pke0FVIPLzFNTsv17bzJ5x7+a/mC7st5BG3SiqYb6Y3fluXEpGC
 s4UZLkHCDPdlEKdogYSvT5o=
X-Google-Smtp-Source: AA0mqf5wIUpE+N/7s0J20Z9YAg0TXCyj9yFIMFlU0o7EAYSQsNp2assW6lnf0a+bSIcDYvtlLEJP7g==
X-Received: by 2002:a5d:494a:0:b0:242:4f56:6b0d with SMTP id
 r10-20020a5d494a000000b002424f566b0dmr2939591wrs.48.1670570138023; 
 Thu, 08 Dec 2022 23:15:38 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 z9-20020adfec89000000b002364c77bcacsm614909wrn.38.2022.12.08.23.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 23:15:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: quic_charante@quicinc.com, cuigaosheng1@huawei.com, sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: fix dma_buf_export init order v2
Date: Fri,  9 Dec 2022 08:15:35 +0100
Message-Id: <20221209071535.933698-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The init order and resulting error handling in dma_buf_export
was pretty messy.

Subordinate objects like the file and the sysfs kernel objects
were initializing and wiring itself up with the object in the
wrong order resulting not only in complicating and partially
incorrect error handling, but also in publishing only halve
initialized DMA-buf objects.

Clean this up thoughtfully by allocating the file independent
of the DMA-buf object. Then allocate and initialize the DMA-buf
object itself, before publishing it through sysfs. If everything
works as expected the file is then connected with the DMA-buf
object and publish it through debugfs.

Also adds the missing dma_resv_fini() into the error handling.

v2: add some missing changes to dma_bug_getfile() and a missing NULL
    check in dma_buf_file_release()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
 drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
 drivers/dma-buf/dma-buf.c             | 84 +++++++++++++--------------
 3 files changed, 43 insertions(+), 52 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index 2bba0babcb62..4b680e10c15a 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
 	kset_unregister(dma_buf_stats_kset);
 }
 
-int dma_buf_stats_setup(struct dma_buf *dmabuf)
+int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
 	int ret;
 
-	if (!dmabuf || !dmabuf->file)
-		return -EINVAL;
-
 	if (!dmabuf->exp_name) {
 		pr_err("exporter name must not be empty if stats needed\n");
 		return -EINVAL;
@@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 
 	/* create the directory for buffer stats */
 	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
-				   "%lu", file_inode(dmabuf->file)->i_ino);
+				   "%lu", file_inode(file)->i_ino);
 	if (ret)
 		goto err_sysfs_dmabuf;
 
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
index a49c6e2650cc..7a8a995b75ba 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -13,7 +13,7 @@
 int dma_buf_init_sysfs_statistics(void);
 void dma_buf_uninit_sysfs_statistics(void);
 
-int dma_buf_stats_setup(struct dma_buf *dmabuf);
+int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
 
 void dma_buf_stats_teardown(struct dma_buf *dmabuf);
 #else
@@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
 
 static inline void dma_buf_uninit_sysfs_statistics(void) {}
 
-static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
+static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
 {
 	return 0;
 }
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e6f36c014c4c..eb6b59363c4f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -95,10 +95,11 @@ static int dma_buf_file_release(struct inode *inode, struct file *file)
 		return -EINVAL;
 
 	dmabuf = file->private_data;
-
-	mutex_lock(&db_list.lock);
-	list_del(&dmabuf->list_node);
-	mutex_unlock(&db_list.lock);
+	if (dmabuf) {
+		mutex_lock(&db_list.lock);
+		list_del(&dmabuf->list_node);
+		mutex_unlock(&db_list.lock);
+	}
 
 	return 0;
 }
@@ -523,17 +524,17 @@ static inline int is_dma_buf_file(struct file *file)
 	return file->f_op == &dma_buf_fops;
 }
 
-static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
+static struct file *dma_buf_getfile(size_t size, int flags)
 {
 	static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
-	struct file *file;
 	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
+	struct file *file;
 
 	if (IS_ERR(inode))
 		return ERR_CAST(inode);
 
-	inode->i_size = dmabuf->size;
-	inode_set_bytes(inode, dmabuf->size);
+	inode->i_size = size;
+	inode_set_bytes(inode, size);
 
 	/*
 	 * The ->i_ino acquired from get_next_ino() is not unique thus
@@ -547,8 +548,6 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
 				 flags, &dma_buf_fops);
 	if (IS_ERR(file))
 		goto err_alloc_file;
-	file->private_data = dmabuf;
-	file->f_path.dentry->d_fsdata = dmabuf;
 
 	return file;
 
@@ -614,19 +613,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	size_t alloc_size = sizeof(struct dma_buf);
 	int ret;
 
-	if (!exp_info->resv)
-		alloc_size += sizeof(struct dma_resv);
-	else
-		/* prevent &dma_buf[1] == dma_buf->resv */
-		alloc_size += 1;
-
-	if (WARN_ON(!exp_info->priv
-			  || !exp_info->ops
-			  || !exp_info->ops->map_dma_buf
-			  || !exp_info->ops->unmap_dma_buf
-			  || !exp_info->ops->release)) {
+	if (WARN_ON(!exp_info->priv || !exp_info->ops
+		    || !exp_info->ops->map_dma_buf
+		    || !exp_info->ops->unmap_dma_buf
+		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
-	}
 
 	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
 		    (exp_info->ops->pin || exp_info->ops->unpin)))
@@ -638,10 +629,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	if (!try_module_get(exp_info->owner))
 		return ERR_PTR(-ENOENT);
 
+	file = dma_buf_getfile(exp_info->size, exp_info->flags);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto err_module;
+	}
+
+	if (!exp_info->resv)
+		alloc_size += sizeof(struct dma_resv);
+	else
+		/* prevent &dma_buf[1] == dma_buf->resv */
+		alloc_size += 1;
 	dmabuf = kzalloc(alloc_size, GFP_KERNEL);
 	if (!dmabuf) {
 		ret = -ENOMEM;
-		goto err_module;
+		goto err_file;
 	}
 
 	dmabuf->priv = exp_info->priv;
@@ -653,44 +655,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	init_waitqueue_head(&dmabuf->poll);
 	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
 	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
+	mutex_init(&dmabuf->lock);
+	INIT_LIST_HEAD(&dmabuf->attachments);
 
 	if (!resv) {
-		resv = (struct dma_resv *)&dmabuf[1];
-		dma_resv_init(resv);
+		dmabuf->resv = (struct dma_resv *)&dmabuf[1];
+		dma_resv_init(dmabuf->resv);
+	} else {
+		dmabuf->resv = resv;
 	}
-	dmabuf->resv = resv;
 
-	file = dma_buf_getfile(dmabuf, exp_info->flags);
-	if (IS_ERR(file)) {
-		ret = PTR_ERR(file);
+	ret = dma_buf_stats_setup(dmabuf, file);
+	if (ret)
 		goto err_dmabuf;
-	}
 
+	file->private_data = dmabuf;
+	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
 
-	mutex_init(&dmabuf->lock);
-	INIT_LIST_HEAD(&dmabuf->attachments);
-
 	mutex_lock(&db_list.lock);
 	list_add(&dmabuf->list_node, &db_list.head);
 	mutex_unlock(&db_list.lock);
 
-	ret = dma_buf_stats_setup(dmabuf);
-	if (ret)
-		goto err_sysfs;
-
 	return dmabuf;
 
-err_sysfs:
-	/*
-	 * Set file->f_path.dentry->d_fsdata to NULL so that when
-	 * dma_buf_release() gets invoked by dentry_ops, it exits
-	 * early before calling the release() dma_buf op.
-	 */
-	file->f_path.dentry->d_fsdata = NULL;
-	fput(file);
 err_dmabuf:
+	if (!resv)
+		dma_resv_fini(dmabuf->resv);
 	kfree(dmabuf);
+err_file:
+	fput(file);
 err_module:
 	module_put(exp_info->owner);
 	return ERR_PTR(ret);
-- 
2.34.1

