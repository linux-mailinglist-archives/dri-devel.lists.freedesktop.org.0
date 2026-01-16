Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E326D3855C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 20:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1E10E1B5;
	Fri, 16 Jan 2026 19:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IVSWy7fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E36B10E1B5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 19:05:47 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7f21951c317so1683988b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768590347; x=1769195147;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/+J+USbCUwLKnGpjF9FWwwq2oHpJVzFZ1Dj2VUFFUcI=;
 b=IVSWy7fzVvOecch2r3LrCY9ynkFtc3ro0wnt972ipRSzBhjVDAHsEk/TG2d1cg8Nz1
 THYor6XVZEvWdvAHiwr+cM9hHqb6FGVq23YLhC5sMHtQrV5NwZOMglhOJM09lwNNZdWy
 EGxEq/+lLPjppbr3bggeYI/OZe6vEKuTta2gKmfCNzoLZ7Ffj3hAAn3mXWM9N2zaWUK/
 o4zaQCYgEz+QIk+UeZ/MA5o7EgxdmUJUgZVfexx1XNezydGc561ggTAj0F+FHuiGSPei
 LJtk7ifPGgI8mCn7aleYShrWu02Pc8ilO48X8b/h56tpGHxnCkVLBeWpOnnDdUny0f2+
 1yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768590347; x=1769195147;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/+J+USbCUwLKnGpjF9FWwwq2oHpJVzFZ1Dj2VUFFUcI=;
 b=GBKRibDH1WwCjJAiqzH+qRgA0BMR8jkBESWg3c4VeJLtWRH7veX90eeTwPVi2GJOpS
 Q9a/f9rCi4+DzRdeSwBFdSsMm4dVKgOScsi0R+WQ3ZQDy58/W6ezooX/TaVdwllljjfA
 E3d50BY/s7NYYeDroA+v5Q5gmgvlYriPM3DLjcSllx+dc+GWHYx5WsZVzrnEbjCHnr+/
 Pq2hYXvdSchfAALdf5U0wdNOC+47oofp6w1R937iRNJG/hZBlnU4aytqEfw1eVjGhsNI
 KAw7a4vkf3iQJ61RVd8kfHA1DEkR0kEh0Gw/qO7nH45l4TvZx7aK/8+IV7nh1nYuw4WK
 Tvfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNoB+FVv0WH0Lqffka0AWLKyke/NE+vGUJBzjG+a2pLG69t0FWW762CD+EuF7l5XL7o35vqAXRf4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL/Omegl7IjIesB+0Odi8j2YSu6KXEH8AhcQhSy+u782deueC0
 wXWy/W6h+JKlsfrn+TsKqa1LQV4aXFOZwl8Kk9Bp1s6jdwXDkBG5z7AqDF63DQs0fVUSRclsMh9
 SHgQmrBPmEJJ7sShFlA==
X-Received: from pfbln22.prod.google.com
 ([2002:a05:6a00:3cd6:b0:7a5:20e6:4185])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:6c94:b0:81b:bfd5:1bce with SMTP id
 d2e1a72fcca58-81fa184db58mr3153618b3a.56.1768590346800; 
 Fri, 16 Jan 2026 11:05:46 -0800 (PST)
Date: Fri, 16 Jan 2026 11:05:12 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260116190517.3268458-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
From: "T.J. Mercier" <tjmercier@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: "T.J. Mercier" <tjmercier@google.com>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats
in sysfs") added dmabuf statistics to sysfs in 2021 under
CONFIG_DMABUF_SYSFS_STATS. After being used in production, performance
problems were discovered leading to its deprecation in 2022 in commit
e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
problems with this interface were discussed in my LPC 2025 talk. [1][2]

Android was probably the last user of the interface, which has since
been migrated to use the dmabuf BPF iterator [3] to obtain the same
information more cheaply. As promised in that series, now that the
longterm stable 6.18 kernel has been released let's remove the sysfs
dmabuf statistics from the kernel.

[1] https://www.youtube.com/watch?v=D83qygudq9c
[2] https://lpc.events/event/19/contributions/2118/
[3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@google.com/

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 ---
 Documentation/driver-api/dma-buf.rst          |   5 -
 drivers/dma-buf/Kconfig                       |  15 --
 drivers/dma-buf/Makefile                      |   1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 ------------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
 drivers/dma-buf/dma-buf.c                     |  18 --
 include/linux/dma-buf.h                       |  12 --
 8 files changed, 312 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h

diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
deleted file mode 100644
index 5d3bc997dc64..000000000000
--- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
+++ /dev/null
@@ -1,24 +0,0 @@
-What:		/sys/kernel/dmabuf/buffers
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	The /sys/kernel/dmabuf/buffers directory contains a
-		snapshot of the internal state of every DMA-BUF.
-		/sys/kernel/dmabuf/buffers/<inode_number> will contain the
-		statistics for the DMA-BUF with the unique inode number
-		<inode_number>
-Users:		kernel memory tuning/debugging tools
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This file is read-only and contains the name of the exporter of
-		the DMA-BUF.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/size
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This file is read-only and specifies the size of the DMA-BUF in
-		bytes.
diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 29abf1eebf9f..2f36c21d9948 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -125,11 +125,6 @@ Implicit Fence Poll Support
 .. kernel-doc:: drivers/dma-buf/dma-buf.c
    :doc: implicit fence polling
 
-DMA-BUF statistics
-~~~~~~~~~~~~~~~~~~
-.. kernel-doc:: drivers/dma-buf/dma-buf-sysfs-stats.c
-   :doc: overview
-
 DMA Buffer ioctls
 ~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fdd823e446cc..012d22e941d6 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -75,21 +75,6 @@ menuconfig DMABUF_HEAPS
 	  allows userspace to allocate dma-bufs that can be shared
 	  between drivers.
 
-menuconfig DMABUF_SYSFS_STATS
-	bool "DMA-BUF sysfs statistics (DEPRECATED)"
-	depends on DMA_SHARED_BUFFER
-	help
-	   Choose this option to enable DMA-BUF sysfs statistics
-	   in location /sys/kernel/dmabuf/buffers.
-
-	   /sys/kernel/dmabuf/buffers/<inode_number> will contain
-	   statistics for the DMA-BUF with the unique inode number
-	   <inode_number>.
-
-	   This option is deprecated and should sooner or later be removed.
-	   Android is the only user of this and it turned out that this resulted
-	   in quite some performance problems.
-
 source "drivers/dma-buf/heaps/Kconfig"
 
 endmenu
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 2008fb7481b3..7a85565d906b 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -6,7 +6,6 @@ obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
 obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
-obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
 
 dmabuf_selftests-y := \
 	selftest.o \
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
deleted file mode 100644
index b5b62e40ccc1..000000000000
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ /dev/null
@@ -1,202 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * DMA-BUF sysfs statistics.
- *
- * Copyright (C) 2021 Google LLC.
- */
-
-#include <linux/dma-buf.h>
-#include <linux/dma-resv.h>
-#include <linux/kobject.h>
-#include <linux/printk.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-
-#include "dma-buf-sysfs-stats.h"
-
-#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
-
-/**
- * DOC: overview
- *
- * ``/sys/kernel/debug/dma_buf/bufinfo`` provides an overview of every DMA-BUF
- * in the system. However, since debugfs is not safe to be mounted in
- * production, procfs and sysfs can be used to gather DMA-BUF statistics on
- * production systems.
- *
- * The ``/proc/<pid>/fdinfo/<fd>`` files in procfs can be used to gather
- * information about DMA-BUF fds. Detailed documentation about the interface
- * is present in Documentation/filesystems/proc.rst.
- *
- * Unfortunately, the existing procfs interfaces can only provide information
- * about the DMA-BUFs for which processes hold fds or have the buffers mmapped
- * into their address space. This necessitated the creation of the DMA-BUF sysfs
- * statistics interface to provide per-buffer information on production systems.
- *
- * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information about
- * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
- *
- * The following stats are exposed by the interface:
- *
- * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
- * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
- *
- * The information in the interface can also be used to derive per-exporter
- * statistics. The data from the interface can be gathered on error conditions
- * or other important events to provide a snapshot of DMA-BUF usage.
- * It can also be collected periodically by telemetry to monitor various metrics.
- *
- * Detailed documentation about the interface is present in
- * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
- */
-
-struct dma_buf_stats_attribute {
-	struct attribute attr;
-	ssize_t (*show)(struct dma_buf *dmabuf,
-			struct dma_buf_stats_attribute *attr, char *buf);
-};
-#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_attribute, attr)
-
-static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
-					    struct attribute *attr,
-					    char *buf)
-{
-	struct dma_buf_stats_attribute *attribute;
-	struct dma_buf_sysfs_entry *sysfs_entry;
-	struct dma_buf *dmabuf;
-
-	attribute = to_dma_buf_stats_attr(attr);
-	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
-	dmabuf = sysfs_entry->dmabuf;
-
-	if (!dmabuf || !attribute->show)
-		return -EIO;
-
-	return attribute->show(dmabuf, attribute, buf);
-}
-
-static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
-	.show = dma_buf_stats_attribute_show,
-};
-
-static ssize_t exporter_name_show(struct dma_buf *dmabuf,
-				  struct dma_buf_stats_attribute *attr,
-				  char *buf)
-{
-	return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
-}
-
-static ssize_t size_show(struct dma_buf *dmabuf,
-			 struct dma_buf_stats_attribute *attr,
-			 char *buf)
-{
-	return sysfs_emit(buf, "%zu\n", dmabuf->size);
-}
-
-static struct dma_buf_stats_attribute exporter_name_attribute =
-	__ATTR_RO(exporter_name);
-static struct dma_buf_stats_attribute size_attribute = __ATTR_RO(size);
-
-static struct attribute *dma_buf_stats_default_attrs[] = {
-	&exporter_name_attribute.attr,
-	&size_attribute.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(dma_buf_stats_default);
-
-static void dma_buf_sysfs_release(struct kobject *kobj)
-{
-	struct dma_buf_sysfs_entry *sysfs_entry;
-
-	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
-	kfree(sysfs_entry);
-}
-
-static const struct kobj_type dma_buf_ktype = {
-	.sysfs_ops = &dma_buf_stats_sysfs_ops,
-	.release = dma_buf_sysfs_release,
-	.default_groups = dma_buf_stats_default_groups,
-};
-
-void dma_buf_stats_teardown(struct dma_buf *dmabuf)
-{
-	struct dma_buf_sysfs_entry *sysfs_entry;
-
-	sysfs_entry = dmabuf->sysfs_entry;
-	if (!sysfs_entry)
-		return;
-
-	kobject_del(&sysfs_entry->kobj);
-	kobject_put(&sysfs_entry->kobj);
-}
-
-
-/* Statistics files do not need to send uevents. */
-static int dmabuf_sysfs_uevent_filter(const struct kobject *kobj)
-{
-	return 0;
-}
-
-static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
-	.filter = dmabuf_sysfs_uevent_filter,
-};
-
-static struct kset *dma_buf_stats_kset;
-static struct kset *dma_buf_per_buffer_stats_kset;
-int dma_buf_init_sysfs_statistics(void)
-{
-	dma_buf_stats_kset = kset_create_and_add("dmabuf",
-						 &dmabuf_sysfs_no_uevent_ops,
-						 kernel_kobj);
-	if (!dma_buf_stats_kset)
-		return -ENOMEM;
-
-	dma_buf_per_buffer_stats_kset = kset_create_and_add("buffers",
-							    &dmabuf_sysfs_no_uevent_ops,
-							    &dma_buf_stats_kset->kobj);
-	if (!dma_buf_per_buffer_stats_kset) {
-		kset_unregister(dma_buf_stats_kset);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-void dma_buf_uninit_sysfs_statistics(void)
-{
-	kset_unregister(dma_buf_per_buffer_stats_kset);
-	kset_unregister(dma_buf_stats_kset);
-}
-
-int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
-{
-	struct dma_buf_sysfs_entry *sysfs_entry;
-	int ret;
-
-	if (!dmabuf->exp_name) {
-		pr_err("exporter name must not be empty if stats needed\n");
-		return -EINVAL;
-	}
-
-	sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
-	if (!sysfs_entry)
-		return -ENOMEM;
-
-	sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
-	sysfs_entry->dmabuf = dmabuf;
-
-	dmabuf->sysfs_entry = sysfs_entry;
-
-	/* create the directory for buffer stats */
-	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
-				   "%lu", file_inode(file)->i_ino);
-	if (ret)
-		goto err_sysfs_dmabuf;
-
-	return 0;
-
-err_sysfs_dmabuf:
-	kobject_put(&sysfs_entry->kobj);
-	dmabuf->sysfs_entry = NULL;
-	return ret;
-}
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
deleted file mode 100644
index 7a8a995b75ba..000000000000
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * DMA-BUF sysfs statistics.
- *
- * Copyright (C) 2021 Google LLC.
- */
-
-#ifndef _DMA_BUF_SYSFS_STATS_H
-#define _DMA_BUF_SYSFS_STATS_H
-
-#ifdef CONFIG_DMABUF_SYSFS_STATS
-
-int dma_buf_init_sysfs_statistics(void);
-void dma_buf_uninit_sysfs_statistics(void);
-
-int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
-
-void dma_buf_stats_teardown(struct dma_buf *dmabuf);
-#else
-
-static inline int dma_buf_init_sysfs_statistics(void)
-{
-	return 0;
-}
-
-static inline void dma_buf_uninit_sysfs_statistics(void) {}
-
-static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
-{
-	return 0;
-}
-
-static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
-#endif
-#endif // _DMA_BUF_SYSFS_STATS_H
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a4d8f2ff94e4..8e23580f1754 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -33,8 +33,6 @@
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
 
-#include "dma-buf-sysfs-stats.h"
-
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_buf.h>
 
@@ -184,7 +182,6 @@ static void dma_buf_release(struct dentry *dentry)
 	 */
 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
-	dma_buf_stats_teardown(dmabuf);
 	dmabuf->ops->release(dmabuf);
 
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
@@ -765,10 +762,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		dmabuf->resv = resv;
 	}
 
-	ret = dma_buf_stats_setup(dmabuf, file);
-	if (ret)
-		goto err_dmabuf;
-
 	file->private_data = dmabuf;
 	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
@@ -779,10 +772,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	return dmabuf;
 
-err_dmabuf:
-	if (!resv)
-		dma_resv_fini(dmabuf->resv);
-	kfree(dmabuf);
 err_file:
 	fput(file);
 err_module:
@@ -1802,12 +1791,6 @@ static inline void dma_buf_uninit_debugfs(void)
 
 static int __init dma_buf_init(void)
 {
-	int ret;
-
-	ret = dma_buf_init_sysfs_statistics();
-	if (ret)
-		return ret;
-
 	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
 	if (IS_ERR(dma_buf_mnt))
 		return PTR_ERR(dma_buf_mnt);
@@ -1821,6 +1804,5 @@ static void __exit dma_buf_deinit(void)
 {
 	dma_buf_uninit_debugfs();
 	kern_unmount(dma_buf_mnt);
-	dma_buf_uninit_sysfs_statistics();
 }
 __exitcall(dma_buf_deinit);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 0bc492090237..91f4939db89b 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -429,18 +429,6 @@ struct dma_buf {
 
 		__poll_t active;
 	} cb_in, cb_out;
-#ifdef CONFIG_DMABUF_SYSFS_STATS
-	/**
-	 * @sysfs_entry:
-	 *
-	 * For exposing information about this buffer in sysfs. See also
-	 * `DMA-BUF statistics`_ for the uapi this enables.
-	 */
-	struct dma_buf_sysfs_entry {
-		struct kobject kobj;
-		struct dma_buf *dmabuf;
-	} *sysfs_entry;
-#endif
 };
 
 /**

base-commit: 26b4309a3ab82a0697751cde52eb336c29c19035
-- 
2.52.0.457.g6b5491de43-goog

