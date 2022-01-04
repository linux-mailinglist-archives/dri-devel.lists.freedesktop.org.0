Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE0484B5D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 00:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E60110E441;
	Tue,  4 Jan 2022 23:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FD710E467
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 23:52:09 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 b6-20020a256706000000b0060aa7315dd9so56949052ybc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 15:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=JX8olF5TUQ9vnDN5cbK9TaFv+wfGJg61C44JuCzGwzo=;
 b=ZI8K1ls0RCwTtHzbmHG9KppHIfMCSIX7Wc9JUfZXgAx60J750BFilD1TpmiN5wo2MY
 N5tiHjghwFx8YY8r7QHv1XDQo3Scl3yK2uiCsKgzKTLxgPpjo2TJGYBQ7urSivWFrrZT
 Py8xyP7vNyToHJO9I40IjmS/mE/4ewb8cOGC2FPs7eO0WAwZYgXhE/zWXd+Nh3UzLqCR
 JfMW0WFfW0oLHu7AUA3UUpqWruXq8f36Utbe7DxgEWWlCsaUjAzZSYhtroRCdHVpeMCo
 YgWq5F6oRaZc2Dj+J6rpbIZoPgtnni3+dbMinCFRs2UcnX7fBrhnLKSv3oLENSg4PHn6
 SJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=JX8olF5TUQ9vnDN5cbK9TaFv+wfGJg61C44JuCzGwzo=;
 b=i/bVueJOlkG6BcxbEwZir91QiZ2hbD1Lq8l1mzd2I9qXvmpY0sPuhVPuV3YDAZ4TOR
 4P3HA+Ri7Bz3Ya8UtJWJ1bpinrPqyqgFKdx3BCfOB5YuKbck+4XC3Csko3UrD20dMJCZ
 +8xl6DLK8bYxYZW5eIMCAkCOZ+a/KQwUWgXuFoo2In5kgp1LQQeL7AVKUeh399b21W4j
 bRmITpiT/W8j6Y6dzTonB3i0w3c78e4f3PT2qe30YjEDVWbp+iqx/xorhsorROl5nUHg
 pW4hHgBPQNkqFocfGirHxGeftH39Mf2R5OTSkfUxpxM1XwJvQuDAUzEy1uyIDGzR2OLm
 CzKw==
X-Gm-Message-State: AOAM532v9QfMarJOSZK9EiTGwB5+tF9gcC7orDxxq4OAt+71MnQ3joQs
 6q546lQIMJwU9ThjkoVDGtMfX61SlO4=
X-Google-Smtp-Source: ABdhPJyshMtGICB6WxiG+uk7lig5Keefv1fYaCOir+vpOyeO+c6wW1KcY80yCx9QrSUCZ8GqA3ZQDFKk3dA=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:bd30:cc7b:6a6d:9061])
 (user=hridya job=sendgmr) by 2002:a05:6902:124f:: with SMTP id
 t15mr74445021ybu.644.1641340328721; Tue, 04 Jan 2022 15:52:08 -0800 (PST)
Date: Tue,  4 Jan 2022 15:51:48 -0800
Message-Id: <20220104235148.21320-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release path
From: Hridya Valsaraju <hridya@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Hridya Valsaraju <hridya@google.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: surenb@google.com, keescook@google.com, tjmercier@google.com,
 kaleshsingh@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently, we noticed an issue where a process went into direct reclaim
while holding the kernfs rw semaphore for sysfs in write(exclusive)
mode. This caused processes who were doing DMA-BUF exports and releases
to go into uninterruptible sleep since they needed to acquire the same
semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
blocking DMA-BUF export/release for an indeterminate amount of time
while another process is holding the sysfs rw semaphore in exclusive
mode, this patch moves the per-buffer sysfs file creation/deleteion to
a kthread.

Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
 include/linux/dma-buf.h               |  46 ++++
 2 files changed, 366 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index 053baadcada9..3251fdf2f05f 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -7,13 +7,39 @@
 
 #include <linux/dma-buf.h>
 #include <linux/dma-resv.h>
+#include <linux/freezer.h>
 #include <linux/kobject.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
 #include <linux/printk.h>
+#include <linux/sched/signal.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
 #include "dma-buf-sysfs-stats.h"
 
+struct dmabuf_kobj_work {
+	struct list_head list;
+	struct dma_buf_sysfs_entry *sysfs_entry;
+	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
+	unsigned long uid;
+};
+
+/* Both kobject setup and teardown work gets queued on the list. */
+static LIST_HEAD(dmabuf_kobj_work_list);
+
+/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
+static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
+
+/*
+ * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs file being
+ * read and the DMA-BUF being freed by protecting sysfs_entry->dmabuf.
+ */
+static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
+
+static struct task_struct *dmabuf_kobject_task;
+static wait_queue_head_t dmabuf_kobject_waitqueue;
+
 #define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
 
 /**
@@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
 	struct dma_buf_stats_attribute *attribute;
 	struct dma_buf_sysfs_entry *sysfs_entry;
 	struct dma_buf *dmabuf;
+	int ret;
 
 	attribute = to_dma_buf_stats_attr(attr);
 	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
+
+	/*
+	 * acquire dmabuf_sysfs_show_lock to prevent a race with the DMA-BUF
+	 * being freed while sysfs_entry->dmabuf is being accessed.
+	 */
+	spin_lock(&dmabuf_sysfs_show_lock);
 	dmabuf = sysfs_entry->dmabuf;
 
-	if (!dmabuf || !attribute->show)
+	if (!dmabuf || !attribute->show) {
+		spin_unlock(&dmabuf_sysfs_show_lock);
 		return -EIO;
+	}
 
-	return attribute->show(dmabuf, attribute, buf);
+	ret = attribute->show(dmabuf, attribute, buf);
+	spin_unlock(&dmabuf_sysfs_show_lock);
+	return ret;
 }
 
 static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
@@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype = {
 	.default_groups = dma_buf_stats_default_groups,
 };
 
-void dma_buf_stats_teardown(struct dma_buf *dmabuf)
+/* Statistics files do not need to send uevents. */
+static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
 {
-	struct dma_buf_sysfs_entry *sysfs_entry;
+	return 0;
+}
 
-	sysfs_entry = dmabuf->sysfs_entry;
-	if (!sysfs_entry)
-		return;
+static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
+	.filter = dmabuf_sysfs_uevent_filter,
+};
+
+/* setup of sysfs entries done asynchronously in the worker thread. */
+static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_work *kobject_work)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
+	struct dma_buf_sysfs_entry_metadata *sysfs_metadata =
+			kobject_work->sysfs_metadata;
+	bool free_metadata = false;
+
+	int ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
+				       "%lu", kobject_work->uid);
+	if (ret) {
+		kobject_put(&sysfs_entry->kobj);
+
+		spin_lock(&sysfs_metadata->sysfs_entry_lock);
+		if (sysfs_metadata->status == SYSFS_ENTRY_INIT_ABORTED) {
+			/*
+			 * SYSFS_ENTRY_INIT_ABORTED means that the DMA-BUF has already
+			 * been freed. At this point, its safe to free the memory for
+			 * the sysfs_metadata;
+			 */
+			free_metadata = true;
+		} else {
+			/*
+			 * The DMA-BUF has not yet been freed, set the status to
+			 * sysfs_entry_error so that when the DMA-BUF gets
+			 * freed, we know there is no need to teardown the sysfs
+			 * entry.
+			 */
+			sysfs_metadata->status = SYSFS_ENTRY_ERROR;
+		}
+		goto unlock;
+	}
+
+	/*
+	 * If the DMA-BUF has not yet been released, status would still be
+	 * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initialized.
+	 */
+	spin_lock(&sysfs_metadata->sysfs_entry_lock);
+	if (sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
+		sysfs_metadata->status = SYSFS_ENTRY_INITIALIZED;
+		goto unlock;
+	}
 
+	/*
+	 * At this point the status is SYSFS_ENTRY_INIT_ABORTED which means
+	 * that the DMA-BUF has already been freed. Hence, we cleanup the
+	 * sysfs_entry and its metadata since neither of them are needed
+	 * anymore.
+	 */
+	free_metadata = true;
 	kobject_del(&sysfs_entry->kobj);
 	kobject_put(&sysfs_entry->kobj);
+
+unlock:
+	spin_unlock(&sysfs_metadata->sysfs_entry_lock);
+	if (free_metadata) {
+		kfree(kobject_work->sysfs_metadata);
+		kobject_work->sysfs_metadata = NULL;
+	}
 }
 
+/* teardown of sysfs entries done asynchronously in the worker thread. */
+static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_work *kobject_work)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
 
-/* Statistics files do not need to send uevents. */
-static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
+	kobject_del(&sysfs_entry->kobj);
+	kobject_put(&sysfs_entry->kobj);
+
+	kfree(kobject_work->sysfs_metadata);
+	kobject_work->sysfs_metadata = NULL;
+}
+
+/* do setup or teardown of sysfs entries as required */
+static void do_kobject_work(struct dmabuf_kobj_work *kobject_work)
 {
+	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
+	bool setup_needed = false;
+	bool teardown_needed = false;
+
+	sysfs_metadata = kobject_work->sysfs_metadata;
+	spin_lock(&sysfs_metadata->sysfs_entry_lock);
+	if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED) {
+		setup_needed = true;
+		sysfs_metadata->status = SYSFS_ENTRY_INIT_IN_PROGRESS;
+	} else if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
+		teardown_needed = true;
+	}
+
+	/*
+	 * It is ok to release the sysfs_entry_lock here.
+	 *
+	 * If setup_needed is true, we check the status again after the kobject
+	 * initialization to see if it has been set to SYSFS_ENTRY_INIT_ABORTED
+	 * and if so teardown the kobject.
+	 *
+	 * If teardown_needed is true, there are no more changes expected to the
+	 * status.
+	 *
+	 * If neither setup_needed nor teardown needed are true, it
+	 * means the DMA-BUF was freed before we got around to setting up the
+	 * sysfs entry and hence we just need to release the metadata and
+	 * return.
+	 */
+	spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock);
+
+	if (setup_needed)
+		dma_buf_sysfs_stats_setup_work(kobject_work);
+	else if (teardown_needed)
+		dma_buf_sysfs_stats_teardown_work(kobject_work);
+	else
+		kfree(kobject_work->sysfs_metadata);
+
+	kfree(kobject_work);
+}
+
+static struct dmabuf_kobj_work *get_next_kobj_work(void)
+{
+	struct dmabuf_kobj_work *kobject_work;
+
+	spin_lock(&dmabuf_kobj_list_lock);
+	kobject_work = list_first_entry_or_null(&dmabuf_kobj_work_list,
+						struct dmabuf_kobj_work, list);
+	if (kobject_work)
+		list_del(&kobject_work->list);
+	spin_unlock(&dmabuf_kobj_list_lock);
+	return kobject_work;
+}
+
+static int kobject_work_thread(void *data)
+{
+	struct dmabuf_kobj_work *kobject_work;
+
+	while (1) {
+		wait_event_freezable(dmabuf_kobject_waitqueue,
+				     (kobject_work = get_next_kobj_work()));
+		do_kobject_work(kobject_work);
+	}
+
 	return 0;
 }
 
-static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
-	.filter = dmabuf_sysfs_uevent_filter,
-};
+static int kobject_worklist_init(void)
+{
+	init_waitqueue_head(&dmabuf_kobject_waitqueue);
+	dmabuf_kobject_task = kthread_run(kobject_work_thread, NULL,
+					  "%s", "dmabuf-kobject-worker");
+	if (IS_ERR(dmabuf_kobject_task)) {
+		pr_err("Creating thread for deferred sysfs entry creation/deletion failed\n");
+		return PTR_ERR(dmabuf_kobject_task);
+	}
+	sched_set_normal(dmabuf_kobject_task, MAX_NICE);
+
+	return 0;
+}
+
+static void deferred_kobject_create(struct dmabuf_kobj_work *kobject_work)
+{
+	INIT_LIST_HEAD(&kobject_work->list);
+
+	spin_lock(&dmabuf_kobj_list_lock);
+
+	list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
+
+	spin_unlock(&dmabuf_kobj_list_lock);
+
+	wake_up(&dmabuf_kobject_waitqueue);
+}
+
+
+void dma_buf_stats_teardown(struct dma_buf *dmabuf)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
+	struct dmabuf_kobj_work *kobj_work;
+
+	sysfs_entry = dmabuf->sysfs_entry;
+	if (!sysfs_entry)
+		return;
+
+	sysfs_metadata = dmabuf->sysfs_entry_metadata;
+	if (!sysfs_metadata)
+		return;
+
+	spin_lock(&sysfs_metadata->sysfs_entry_lock);
+
+	if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED ||
+	    sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
+		/*
+		 * The sysfs entry for this buffer has not yet been initialized,
+		 * we set the status to SYSFS_ENTRY_INIT_ABORTED to abort the
+		 * initialization.
+		 */
+		sysfs_metadata->status = SYSFS_ENTRY_INIT_ABORTED;
+		spin_unlock(&sysfs_metadata->sysfs_entry_lock);
+
+		/*
+		 * In case kobject initialization completes right as we release
+		 * the sysfs_entry_lock, disable show() for the sysfs entry by
+		 * setting sysfs_entry->dmabuf to NULL to prevent a race.
+		 */
+		spin_lock(&dmabuf_sysfs_show_lock);
+		sysfs_entry->dmabuf = NULL;
+		spin_unlock(&dmabuf_sysfs_show_lock);
+
+		return;
+	}
+
+	if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
+		/*
+		 * queue teardown work only if sysfs_entry is fully inititalized.
+		 * It is ok to release the sysfs_entry_lock here since the
+		 * status can no longer change.
+		 */
+		spin_unlock(&sysfs_metadata->sysfs_entry_lock);
+
+		/*
+		 * Meanwhile disable show() for the sysfs entry to avoid a race
+		 * between teardown and show().
+		 */
+		spin_lock(&dmabuf_sysfs_show_lock);
+		sysfs_entry->dmabuf = NULL;
+		spin_unlock(&dmabuf_sysfs_show_lock);
+
+		kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
+		if (!kobj_work) {
+			/* do the teardown immediately. */
+			kobject_del(&sysfs_entry->kobj);
+			kobject_put(&sysfs_entry->kobj);
+			kfree(sysfs_metadata);
+		} else {
+			/* queue teardown work. */
+			kobj_work->sysfs_entry = dmabuf->sysfs_entry;
+			kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
+			deferred_kobject_create(kobj_work);
+		}
+
+		return;
+	}
+
+	/*
+	 * status is SYSFS_ENTRY_INIT_ERROR so we only need to free the
+	 * metadata.
+	 */
+	spin_unlock(&sysfs_metadata->sysfs_entry_lock);
+	kfree(dmabuf->sysfs_entry_metadata);
+	dmabuf->sysfs_entry_metadata = NULL;
+}
 
 static struct kset *dma_buf_stats_kset;
 static struct kset *dma_buf_per_buffer_stats_kset;
 int dma_buf_init_sysfs_statistics(void)
 {
+	int ret;
+
+	ret = kobject_worklist_init();
+	if (ret)
+		return ret;
+
 	dma_buf_stats_kset = kset_create_and_add("dmabuf",
 						 &dmabuf_sysfs_no_uevent_ops,
 						 kernel_kobj);
@@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
 int dma_buf_stats_setup(struct dma_buf *dmabuf)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
-	int ret;
+	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
+	struct dmabuf_kobj_work *kobj_work;
 
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
@@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 	sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
 	sysfs_entry->dmabuf = dmabuf;
 
+	sysfs_metadata = kzalloc(sizeof(struct dma_buf_sysfs_entry_metadata),
+				 GFP_KERNEL);
+	if (!sysfs_metadata) {
+		kfree(sysfs_entry);
+		return -ENOMEM;
+	}
+
 	dmabuf->sysfs_entry = sysfs_entry;
 
-	/* create the directory for buffer stats */
-	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
-				   "%lu", file_inode(dmabuf->file)->i_ino);
-	if (ret)
-		goto err_sysfs_dmabuf;
+	sysfs_metadata->status = SYSFS_ENTRY_UNINITIALIZED;
+	spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
 
-	return 0;
+	dmabuf->sysfs_entry_metadata = sysfs_metadata;
 
-err_sysfs_dmabuf:
-	kobject_put(&sysfs_entry->kobj);
-	dmabuf->sysfs_entry = NULL;
-	return ret;
+	kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
+	if (!kobj_work) {
+		kfree(sysfs_entry);
+		kfree(sysfs_metadata);
+		return -ENOMEM;
+	}
+
+	kobj_work->sysfs_entry = dmabuf->sysfs_entry;
+	kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
+	/*
+	 * stash the inode number in struct dmabuf_kobj_work since setup
+	 * might race with DMA-BUF teardown.
+	 */
+	kobj_work->uid = file_inode(dmabuf->file)->i_ino;
+
+	deferred_kobject_create(kobj_work);
+	return 0;
 }
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7ab50076e7a6..0597690023a0 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -287,6 +287,50 @@ struct dma_buf_ops {
 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 };
 
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+enum sysfs_entry_status {
+	SYSFS_ENTRY_UNINITIALIZED,
+	SYSFS_ENTRY_INIT_IN_PROGRESS,
+	SYSFS_ENTRY_ERROR,
+	SYSFS_ENTRY_INIT_ABORTED,
+	SYSFS_ENTRY_INITIALIZED,
+};
+
+/*
+ * struct dma_buf_sysfs_entry_metadata - Holds the current status for the
+ * DMA-BUF sysfs entry.
+ *
+ * @status: holds the current status for the DMA-BUF sysfs entry. The status of
+ * the sysfs entry has the following path.
+ *
+ *			SYSFS_ENTRY_UNINITIALIZED
+ *		 __________________|____________________
+ *		|					|
+ *	  SYSFS_ENTRY_INIT_IN_PROGRESS	    SYSFS_ENTRY_INIT_ABORTED (DMA-BUF
+ *		|						      gets freed
+ *		|						      before
+ *		|						      init)
+ *	________|_____________________________________
+ *	|			  |		      |
+ * SYSFS_ENTRY_INITIALIZED	  |	  SYSFS_ENTRY_INIT_ABORTED
+ *				  |		  (DMA-BUF gets freed during kobject
+ *				  |		  init)
+ *				  |
+ *				  |
+ *		      SYSFS_ENTRY_ERROR
+ *		      (error during kobject init)
+ *
+ * @sysfs_entry_lock: protects access to @status.
+ */
+struct dma_buf_sysfs_entry_metadata {
+	enum sysfs_entry_status status;
+	/*
+	 * Protects sysfs_entry_metadata->status
+	 */
+	spinlock_t sysfs_entry_lock;
+};
+#endif
+
 /**
  * struct dma_buf - shared buffer object
  *
@@ -452,6 +496,8 @@ struct dma_buf {
 		struct kobject kobj;
 		struct dma_buf *dmabuf;
 	} *sysfs_entry;
+
+	struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
 #endif
 };
 
-- 
2.34.1.448.ga2b2bfdf31-goog

