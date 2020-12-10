Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCA2D555A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815316EA43;
	Thu, 10 Dec 2020 08:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6BA6E364
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 04:44:15 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id m203so5210557ybf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 20:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=Uxhfo6NiTx/8/TE2mqrCWqYEtnXe373edCAAWrZKF+c=;
 b=r5M/e6GSrRaujwzW/9M91AQVlCvthwbwZMmVwqRMmX8s8vIGyY9eSBdzYdn9RCb/oq
 S4wqEIzQf/MW9wCREgLU+8VTCcrFaRk4HDufVF2/viTUvFzEMi3ASKmQ2S0M55sZxZfv
 5K+HqyR5ftSS4a8dRtBFTF0NJPrQOo2/+y4NAj9S/ErKKeZjDYTNP+DEhwNQlRJDQj+7
 2ZQiB5MOHkpdgytuYCvfwKF/jFlget0tCj8VCunnJbGi7yfN9f2y6QVtB+1hOg/iiawf
 58oQZp502ZKagfhO0tSSR3WXz7eIkcCZaCs5WH/4Pb5azQ6R9rU1kFFQiISiDeDKFkwy
 exDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=Uxhfo6NiTx/8/TE2mqrCWqYEtnXe373edCAAWrZKF+c=;
 b=Ps70u9QB8awWGA0JNK6p06NJoSf68uvCijIqJbGIvP9sMulZ6XCjBRoCmy48YbHDD9
 sWxJtTIzDwStdPvnQpz0g8pAkYF76Vo4EeAg8FaWhuCi9+/eviaOqQd49O5bqK3VZQdm
 TkXs3i1l+dXpeXnjfJ/Gx4uW8ExZEzjCIP3484Au7EV2rMW1Oz6/PxsRXH1UgL3UEgQ1
 R9zh5wQ1PqIq1kmpVTayMFGUXom7nptaIoJDlTbFtsillWj/dDDzK5v4/yxzhb42XQej
 152cJ+Yw37lavv/tMwsxf3kXgevEEhfYwD2pD+eHuxtqPYQZPhLZQwUR+0RWG/+ogKY3
 cnuQ==
X-Gm-Message-State: AOAM5308ZTOSOnIGeGIxENWAdKsyNbyf6YDfib5C7lcN62nP+ezaMSR4
 0z/BTLfnv+vDTgyo/iYCyGI24wUEd/w=
X-Google-Smtp-Source: ABdhPJyn4xxYF6xRM8uwZJtWcMA6nynEApztnTy46CJe/oWMLKbdtL1LWy8csXYMl+zO8O8jQcntFyVXwxA=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:7220:84ff:fe09:5ea6])
 (user=hridya job=sendgmr) by 2002:a25:e694:: with SMTP id
 d142mr8130373ybh.494.1607575454270; 
 Wed, 09 Dec 2020 20:44:14 -0800 (PST)
Date: Wed,  9 Dec 2020 20:43:57 -0800
Message-Id: <20201210044400.1080308-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
From: Hridya Valsaraju <hridya@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Hridya Valsaraju <hridya@google.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:39 +0000
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
Cc: surenb@google.com, gregkh@linuxfoundation.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch allows statistics to be enabled for each DMA-BUF in
sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.

The following stats will be exposed by the interface:

/sys/kernel/dmabuf/<inode_number>/exporter_name
/sys/kernel/dmabuf/<inode_number>/size
/sys/kernel/dmabuf/<inode_number>/dev_map_info

The inode_number is unique for each DMA-BUF and was added earlier [1]
in order to allow userspace to track DMA-BUF usage across different
processes.

Currently, this information is exposed in
/sys/kernel/debug/dma_buf/bufinfo.
However, since debugfs is considered unsafe to be mounted in production,
it is being duplicated in sysfs.

This information is intended to help with root-causing
low-memory kills and the debugging/analysis of other memory-related issues.

It will also be used to derive DMA-BUF
per-exporter stats and per-device usage stats for Android Bug reports.

[1]: https://lore.kernel.org/patchwork/patch/1088791/

Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 Documentation/ABI/testing/sysfs-kernel-dmabuf |  32 ++++
 drivers/dma-buf/Kconfig                       |  11 ++
 drivers/dma-buf/Makefile                      |   1 +
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 162 ++++++++++++++++++
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  37 ++++
 drivers/dma-buf/dma-buf.c                     |  29 ++++
 include/linux/dma-buf.h                       |  13 ++
 7 files changed, 285 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h

diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf b/Documentation/ABI/testing/sysfs-kernel-dmabuf
new file mode 100644
index 000000000000..02d407d57aaa
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf
@@ -0,0 +1,32 @@
+What:		/sys/kernel/dmabuf
+Date:		November 2020
+KernelVersion:	v5.11
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	The /sys/kernel/dmabuf directory contains a
+		snapshot of the internal state of every DMA-BUF.
+		/sys/kernel/dmabuf/<inode_number> will contain the
+		statistics for the DMA-BUF with the unique inode number
+		<inode_number>
+Users:		kernel memory tuning/debugging tools
+
+What:		/sys/kernel/dmabuf/<inode_number>/exporter_name
+Date:		November 2020
+KernelVersion:	v5.11
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and contains the name of the exporter of
+		the DMA-BUF.
+
+What:		/sys/kernel/dmabuf/<inode_number>/size
+Dat:		November 2020
+KernelVersion:	v5.11
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and specifies the size of the DMA-BUF in
+		bytes.
+
+What:		/sys/kernel/dmabuf/<inode_number>/dev_map_info
+Dat:		November 2020
+KernelVersion:	v5.11
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and lists the name of devices currently
+		mapping the DMA-BUF in a space-separated format.
+
diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 4f8224a6ac95..2fed26f14548 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -64,6 +64,17 @@ menuconfig DMABUF_HEAPS
 	  allows userspace to allocate dma-bufs that can be shared
 	  between drivers.
 
+menuconfig DMABUF_SYSFS_STATS
+	bool "DMA-BUF sysfs statistics"
+	select DMA_SHARED_BUFFER
+	help
+	   Choose this option to enable DMA-BUF sysfs statistics
+	   in location /sys/kernel/dmabuf.
+
+	   /sys/kernel/dmabuf/<inode_number> will contain
+	   statistics for the DMA-BUF with the unique inode number
+	   <inode_number>.
+
 source "drivers/dma-buf/heaps/Kconfig"
 
 endmenu
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 995e05f609ff..40d81f23cacf 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
 obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
+obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
 
 dmabuf_selftests-y := \
 	selftest.o \
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
new file mode 100644
index 000000000000..bcbef81e0a5f
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
+#include <linux/kobject.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
+
+struct dma_buf_stats_attribute {
+	struct attribute attr;
+	ssize_t (*show)(struct dma_buf *dmabuf,
+			struct dma_buf_stats_attribute *attr, char *buf);
+};
+#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_attribute, attr)
+
+static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
+					    struct attribute *attr,
+					    char *buf)
+{
+	struct dma_buf_stats_attribute *attribute;
+	struct dma_buf_sysfs_entry *sysfs_entry;
+	struct dma_buf *dmabuf;
+
+	attribute = to_dma_buf_stats_attr(attr);
+	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
+	dmabuf = sysfs_entry->dmabuf;
+
+	if (!dmabuf || !attribute->show)
+		return -EIO;
+
+	return attribute->show(dmabuf, attribute, buf);
+}
+
+static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
+	.show = dma_buf_stats_attribute_show,
+};
+
+static ssize_t exporter_name_show(struct dma_buf *dmabuf,
+				  struct dma_buf_stats_attribute *attr,
+				  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
+}
+
+static ssize_t size_show(struct dma_buf *dmabuf,
+			 struct dma_buf_stats_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "%zu\n", dmabuf->size);
+}
+
+static ssize_t dev_map_info_show(struct dma_buf *dmabuf,
+				 struct dma_buf_stats_attribute *attr,
+				 char *buf)
+{
+	ssize_t ret;
+	struct dma_buf_attachment *attachment;
+
+	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(attachment, &dmabuf->attachments, node) {
+		if (attachment->map_counter) {
+			ret += sysfs_emit_at(buf, ret, "%s ",
+					     dev_name(attachment->dev));
+		}
+	}
+	dma_resv_unlock(dmabuf->resv);
+
+	ret += sysfs_emit_at(buf, ret, "\n");
+	return ret;
+}
+
+static struct dma_buf_stats_attribute exporter_name_attribute =
+	__ATTR_RO(exporter_name);
+static struct dma_buf_stats_attribute size_attribute = __ATTR_RO(size);
+static struct dma_buf_stats_attribute dev_map_info_attribute =
+	__ATTR_RO(dev_map_info);
+
+static struct attribute *dma_buf_stats_default_attrs[] = {
+	&exporter_name_attribute.attr,
+	&size_attribute.attr,
+	&dev_map_info_attribute.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(dma_buf_stats_default);
+
+static void dma_buf_sysfs_release(struct kobject *kobj)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+
+	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
+	kfree(sysfs_entry);
+}
+
+static struct kobj_type dma_buf_ktype = {
+	.sysfs_ops = &dma_buf_stats_sysfs_ops,
+	.release = dma_buf_sysfs_release,
+	.default_groups = dma_buf_stats_default_groups,
+};
+
+void dma_buf_sysfs_free(struct dma_buf *dmabuf)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+
+	sysfs_entry = dmabuf->sysfs_entry;
+	if (!sysfs_entry)
+		return;
+
+	kobject_del(&sysfs_entry->kobj);
+	kobject_put(&sysfs_entry->kobj);
+}
+
+static struct kset *dma_buf_stats_kset;
+int dma_buf_init_sysfs_statistics(void)
+{
+	dma_buf_stats_kset = kset_create_and_add("dmabuf", NULL, kernel_kobj);
+	if (!dma_buf_stats_kset)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void dma_buf_uninit_sysfs_statistics(void)
+{
+	kset_unregister(dma_buf_stats_kset);
+}
+
+int dma_buf_init_stats_kobj(struct dma_buf *dmabuf)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+	int ret;
+
+	if (!dmabuf || !dmabuf->file)
+		return -EINVAL;
+
+	if (!dmabuf->exp_name) {
+		pr_err("exporter name must not be empty if stats needed\n");
+		return -EINVAL;
+	}
+
+	sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
+	if (!sysfs_entry)
+		return -ENOMEM;
+
+	sysfs_entry->kobj.kset = dma_buf_stats_kset;
+	sysfs_entry->dmabuf = dmabuf;
+
+	dmabuf->sysfs_entry = sysfs_entry;
+
+	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
+				   "%lu", file_inode(dmabuf->file)->i_ino);
+	if (ret)
+		kobject_put(&sysfs_entry->kobj);
+
+	return ret;
+}
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
new file mode 100644
index 000000000000..42fae7d1b11f
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _DMA_BUF_SYSFS_STATS_H
+#define _DMA_BUF_SYSFS_STATS_H
+
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+
+int dma_buf_init_sysfs_statistics(void);
+void dma_buf_uninit_sysfs_statistics(void);
+
+int dma_buf_init_stats_kobj(struct dma_buf *dmabuf);
+static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
+						       int delta)
+{
+	attach->map_counter += delta;
+}
+void dma_buf_sysfs_free(struct dma_buf *dmabuf);
+
+#else
+
+static inline int dma_buf_init_sysfs_statistics(void)
+{
+	return 0;
+}
+
+static inline void dma_buf_uninit_sysfs_statistics(void) {}
+
+static inline int dma_buf_init_stats_kobj(struct dma_buf *dmabuf)
+{
+	return 0;
+}
+static inline void dma_buf_sysfs_free(struct dma_buf *dmabuf) {}
+static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
+						       int delta) {}
+
+#endif
+#endif // _DMA_BUF_SYSFS_STATS_H
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e63684d4cd90..e93df0069bf8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -29,6 +29,8 @@
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
 
+#include "dma-buf-sysfs-stats.h"
+
 static inline int is_dma_buf_file(struct file *);
 
 struct dma_buf_list {
@@ -83,6 +85,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
 
+	dma_buf_sysfs_free(dmabuf);
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
 	kfree(dmabuf);
@@ -566,6 +569,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	file->f_mode |= FMODE_LSEEK;
 	dmabuf->file = file;
 
+	ret = dma_buf_init_stats_kobj(dmabuf);
+	if (ret)
+		goto err_sysfs;
+
 	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
 
@@ -575,6 +582,14 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	return dmabuf;
 
+err_sysfs:
+	/*
+	 * Set file->f_path.dentry->d_fsdata to NULL so that when
+	 * dma_buf_release() gets invoked by dentry_ops, it exits
+	 * early before calling the release() dma_buf op.
+	 */
+	file->f_path.dentry->d_fsdata = NULL;
+	fput(file);
 err_dmabuf:
 	kfree(dmabuf);
 err_module:
@@ -732,6 +747,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 			dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt = sgt;
 		attach->dir = DMA_BIDIRECTIONAL;
+		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
 	}
 
 	return attach;
@@ -786,6 +802,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 			dma_resv_lock(attach->dmabuf->resv, NULL);
 
 		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
+		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dma_buf_unpin(attach);
@@ -925,6 +942,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 #endif /* CONFIG_DMA_API_DEBUG */
 
+	if (!IS_ERR(sg_table))
+		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
+
 	return sg_table;
 }
 EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
@@ -962,6 +982,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
+
+	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
 
@@ -1399,6 +1421,12 @@ static inline void dma_buf_uninit_debugfs(void)
 
 static int __init dma_buf_init(void)
 {
+	int ret;
+
+	ret = dma_buf_init_sysfs_statistics();
+	if (ret)
+		return ret;
+
 	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
 	if (IS_ERR(dma_buf_mnt))
 		return PTR_ERR(dma_buf_mnt);
@@ -1414,5 +1442,6 @@ static void __exit dma_buf_deinit(void)
 {
 	dma_buf_uninit_debugfs();
 	kern_unmount(dma_buf_mnt);
+	dma_buf_uninit_sysfs_statistics();
 }
 __exitcall(dma_buf_deinit);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index cf72699cb2bc..f5cab13afdfc 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -294,6 +294,7 @@ struct dma_buf_ops {
  * @poll: for userspace poll support
  * @cb_excl: for userspace poll support
  * @cb_shared: for userspace poll support
+ * @sysfs_entry: for exposing information about this buffer in sysfs
  *
  * This represents a shared buffer, created by calling dma_buf_export(). The
  * userspace representation is a normal file descriptor, which can be created by
@@ -329,6 +330,13 @@ struct dma_buf {
 
 		__poll_t active;
 	} cb_excl, cb_shared;
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+	/* for sysfs stats */
+	struct dma_buf_sysfs_entry {
+		struct kobject kobj;
+		struct dma_buf *dmabuf;
+	} *sysfs_entry;
+#endif
 };
 
 /**
@@ -378,6 +386,8 @@ struct dma_buf_attach_ops {
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
  * @importer_priv: importer specific attachment data.
+ * @map_counter: Number of times the buffer has been mapped through this
+ * dma_buf_map_attachment.
  *
  * This structure holds the attachment information between the dma_buf buffer
  * and its user device(s). The list contains one attachment struct per device
@@ -398,6 +408,9 @@ struct dma_buf_attachment {
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+	unsigned int map_counter;
+#endif
 };
 
 /**
-- 
2.29.2.576.ga3fc446d84-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
